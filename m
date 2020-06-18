Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A6D1FF43B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 16:09:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlvDT-0007J4-A2; Thu, 18 Jun 2020 14:08:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlvDS-0007Iz-1Z
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 14:08:30 +0000
X-Inumbo-ID: 2ee482f0-b16d-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ee482f0-b16d-11ea-b7bb-bc764e2007e4;
 Thu, 18 Jun 2020 14:08:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 378C9ADC2;
 Thu, 18 Jun 2020 14:08:27 +0000 (UTC)
Subject: Re: [PATCH for-4.14 2/8] x86/hvm: don't force vCPU 0 for IRQ 0 when
 using fixed destination mode
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-3-roger.pau@citrix.com>
 <ac179f79-3b40-9ff3-9437-16a30e019813@suse.com>
 <20200618134841.GQ735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ddaeb562-1d61-1855-508c-40bb2b796357@suse.com>
Date: Thu, 18 Jun 2020 16:08:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200618134841.GQ735@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.06.2020 15:48, Roger Pau Monné wrote:
> On Thu, Jun 18, 2020 at 03:43:00PM +0200, Jan Beulich wrote:
>> On 12.06.2020 17:56, Roger Pau Monne wrote:
>>> When the IO APIC pin mapped to the ISA IRQ 0 has been configured to
>>> use fixed delivery mode do not forcefully route interrupts to vCPU 0,
>>> as the OS might have setup those interrupts to be injected to a
>>> different vCPU, and injecting to vCPU 0 can cause the OS to miss such
>>> interrupts or errors to happen due to unexpected vectors being
>>> injected on vCPU 0.
>>>
>>> In order to fix remove such handling altogether for fixed destination
>>> mode pins and just inject them according to the data setup in the
>>> IO-APIC entry.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Technically
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> I wonder though why this was done in the first place - it very much
>> feels like a workaround for certain guest behavior, and hence
>> getting rid of it may mean a certain risk of regressions. Not a
>> very good point in time to make risky changes ...
> 
> We can defer to after the release I guess, but I will still ask for
> the changes to be backported.

That's fine, albeit if we decide to delay it until 4.15 was branched,
then I think we want to also wait longer than usual until it would hit
the stable trees. Unfortunately c8e79412c001's description is of no
help to understand what or why "time jumps" may result from delivering
the interrupt as requested.

> What we currently do is broken, up to the point that FreeBSD cannot
> use the PIT because it will likely route the interrupt to a vCPU != 0
> in fixed mode, and then it will just get stuck because the vector is
> delivered to vCPU 0 where it's not even configured.

All understood.

Jan

