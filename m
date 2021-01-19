Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDED2FB4D2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 10:08:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70207.125907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1myg-00074m-9t; Tue, 19 Jan 2021 09:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70207.125907; Tue, 19 Jan 2021 09:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1myg-00074Q-6Z; Tue, 19 Jan 2021 09:07:06 +0000
Received: by outflank-mailman (input) for mailman id 70207;
 Tue, 19 Jan 2021 09:07:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1myf-00074L-8t
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 09:07:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69095d66-5e0e-4415-be68-f74add423682;
 Tue, 19 Jan 2021 09:07:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4AB8AAD17;
 Tue, 19 Jan 2021 09:07:03 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 69095d66-5e0e-4415-be68-f74add423682
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611047223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tbVihTJY8QFQT054OoBLLPWvmubFrUzACI0571Le+ik=;
	b=CLqUJqlpJKYk24zC2u6stM7TMwDNUV+GolZUi3pt4c+c0HEkgTd34n8QzpjIPXA/tmZugm
	zgReRG7+Yu3E0AH/2Cu07QtgJQwqL1OQTdBHTACyTBSjnwnY8AWxknlMfm+7XgdxcT3pbc
	E4A6AK8ict1N5GKlibPSJwIAu2LKLC8=
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
To: Claudemir Todo Bom <claudemir@todobom.com>
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com>
Date: Tue, 19 Jan 2021 10:07:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.01.2021 21:15, Claudemir Todo Bom wrote:
> Sorry for the simultaneous post on xen-users and xen-devel, but as I noted
> that the problem appears only for versions of xen that are >= 4.9, I think
> that developers may have a look at this.

Dropping xen-users.

> I recently bought a generic mainboard and a Xeon E5-2926v2 CPU, it is a 12
> core, 24 threads cpu.
> 
> My system was already running on another machine with xen 4.11 on a debian
> 10 system and after replacing the mainboard it didn't boot.
> 
> After many tries I noticed that downgrading to the previous version of Xen
> (4.8, available on Debian 9) works well. I also tried a lot of variations
> for the dom0 kernel, all of them with the same results.
> 
> All my tests were done with 4.11, but I checked with a live version of
> Alpine Linux (3.7.3, with Xen 4.9.4) that the system doesn't boot on that
> release also.
> 
> With more research I noticed that if I limit dom0 to use only one CPU
> (dom0_max_vcpus=1) the system boots up, I didn't check if guest VM worked,
> but I suppose that they would not be able to use the other 23 vcpus
> available, anyway, a system with one vcpu for dom0 would be very slow I
> think.
> 
> I've noticed also that if I keep dom0 to use more than one core but disable
> acpi on the dom0 kernel, it boots up, unfortunately this is not
> sufficient because I cannot use any device attached to the system (not even
> the usb keyboard). This only helps to detect that the problem may be in the
> ACPI/APIC code.
> 
> I tried many variations with parameters related with ACPI and APIC. None of
> them was satisfactory, always ended on a halted system or a self rebooting
> one.
> 
> Can anyone point me to a solution for this?

For this we first of all need details about your problem: A full
boot log ideally, or if this isn't available anything at least
allowing us to see what exactly goes wrong (and with this I mean
the first thing going wrong, not later possible follow-on issues
from earlier problems), like screen shots. And this again ideally
with master / staging Xen, or if that's not feasible with as new
a version as possible.

I don't suppose you'd be up for bisecting the 4.8 ... 4.9 window
to determine when exactly your issue was introduced?

Jan

