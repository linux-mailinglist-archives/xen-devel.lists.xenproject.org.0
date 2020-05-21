Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BCE1DD313
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 18:28:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbo2j-0002LR-QT; Thu, 21 May 2020 16:27:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2WPz=7D=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jbo2i-0002LM-Sm
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 16:27:36 +0000
X-Inumbo-ID: fac560aa-9b7f-11ea-9887-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fac560aa-9b7f-11ea-9887-bc764e2007e4;
 Thu, 21 May 2020 16:27:36 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:38838
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jbo2c-000KMA-LG (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Thu, 21 May 2020 17:27:30 +0100
Subject: Re: [PATCH v3 2/2] x86/idle: prevent entering C6 with in service
 interrupts on Intel
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200515135802.63853-1-roger.pau@citrix.com>
 <20200515135802.63853-3-roger.pau@citrix.com>
 <eaa63636-6e39-d401-e218-14ae37440667@citrix.com>
 <20200521084523.GP54375@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <84486d84-4452-af18-f7e7-753faf5a125d@citrix.com>
Date: Thu, 21 May 2020 17:27:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200521084523.GP54375@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/05/2020 09:45, Roger Pau Monné wrote:
> On Wed, May 20, 2020 at 10:30:11PM +0100, Andrew Cooper wrote:
>> On 15/05/2020 14:58, Roger Pau Monne wrote:
>>> Apply a workaround for Intel errata BDX99, CLX30, SKX100, CFW125,
>>> BDF104, BDH85, BDM135, KWB131: "A Pending Fixed Interrupt May Be
>>> Dispatched Before an Interrupt of The Same Priority Completes".
>> HSM175 et al, so presumably a HSD, and HSE as well.
>>
>> On the broadwell side at least, BDD BDW in addition
> But those are a different errata AFAICT ('An APIC Timer Interrupt
> During Core C6 Entry May be Lost') and the workaround should also be
> different I think.

Hmm, so it is.

The issue in question here definitely does affect Haswell, because that
is where we first observed it.  There was also a report on xen-devel
against Haswell.

If the errata are missing, then I think Intel needs some more chasing to
work out the real extent of the problems.

> We should mark the lapic timer as not reliable on
> C6 or higher states in lapic_timer_reliable_states, so that it's
> disabled before entering sleep?

Probably should.

~Andrew

