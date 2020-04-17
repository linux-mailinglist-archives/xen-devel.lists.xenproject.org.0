Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DE11AD9F3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 11:32:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPNLg-0006vi-RY; Fri, 17 Apr 2020 09:31:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPNLg-0006vd-1x
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 09:31:48 +0000
X-Inumbo-ID: 40d70c9a-808e-11ea-8c98-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40d70c9a-808e-11ea-8c98-12813bfff9fa;
 Fri, 17 Apr 2020 09:31:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EA740AED8;
 Fri, 17 Apr 2020 09:31:43 +0000 (UTC)
Subject: Re: [Xen-devel] [BUG] panic: "IO-APIC + timer doesn't work" - several
 people have reproduced
To: Jason Andryuk <jandryuk@gmail.com>
References: <cfbb5553-b9dc-ee86-145f-3cab92289c4d@suse.com>
 <20200317152310.114567-1-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7aca5da4-2ae5-8d3d-e7df-69eb7ffb743c@suse.com>
Date: Fri, 17 Apr 2020 11:31:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200317152310.114567-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: andrew.cooper3@citrix.com, aaron@ajanse.me, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.03.2020 16:23, Jason Andryuk wrote:
> Below is the diff.  It was messier and I tidied it up some.

I've looked into this some more. I can see how what we currently
do is not in line with firmware handing off with LegacyReplacement
mode enabled. However, this case doesn't look to apply here:

> It's mainly the change to hpet_resume() to mimic Linux's legacy HPET
> setup on T0.  It turns on HPET_CFG_LEGACY to ensure the timer interrupt
> is running.  And it also includes the printing of the initial HPET
> config:
> HPET_CFG 00000001

While HPET_CFG_ENABLE is set, HPET_CFG_LEGACY is clear.

> HPET_T0_CFG 00008030
> HPET_T0_ROUTE 0000016c

And while firmware must have setup FSB routing for T0, its enable
bits (both HPET_TN_ENABLE and HPET_TN_FSB) are also clear.
Therefore we have, afaics, no indication whatsoever that we ought
to enable LegacyReplacement mode. Of course the spec also says
"Assuming platform does not have 8254/RTC hardware or does not
want to support this legacy timer hardware, for this case, System
BIOS should set the LegacyReplacement Route bit and report IRQ0 &
IRQ8 as being consumed by the HPET block in system name space:"
(followed by a table). What is referred to as "system name space"
is, I assume, ACPI DSDT/SSDTs, which we have no access to this
early (and Linux doesn't either, aiui), so also can't be used as
indicator.

Otoh I also don't think it is correct to blindly enable
LegacyReplacement mode, like - afaics - Linux does, the more with
our split brain model as far as affected devices go (Xen "owns"
the PIT [and of course also the HPET], while Linux "owns" the
RTC). This is because of the effect of this setting on what
actually drives IRQ8. In theory we might be able do so when
ACPI_FADT_NO_CMOS_RTC is set, but Linux may use the CMOS RTC
even when that flag is set.

So right now the only possible approach I see to address your
problem is to add yet another fallback mode to check_timer(),
forcing LegacyReplacement mode to be enabled. But between /
after which step(s) to put this there isn't at all obvious to me.

Jan

