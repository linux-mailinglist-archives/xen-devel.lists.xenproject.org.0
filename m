Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6462DDAEF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 22:46:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56196.98203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq16G-0001Xr-Ii; Thu, 17 Dec 2020 21:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56196.98203; Thu, 17 Dec 2020 21:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq16G-0001XV-FQ; Thu, 17 Dec 2020 21:46:16 +0000
Received: by outflank-mailman (input) for mailman id 56196;
 Thu, 17 Dec 2020 21:46:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIZe=FV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kq16E-0001XQ-VM
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 21:46:14 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86cd528c-5d4f-4951-b75f-2b6d2ed41fc5;
 Thu, 17 Dec 2020 21:46:13 +0000 (UTC)
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
X-Inumbo-ID: 86cd528c-5d4f-4951-b75f-2b6d2ed41fc5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608241573;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=5Fy511Av2SUNnJ4dw3xkeyxm7ImaAAzPUB9ZrpA93d0=;
  b=JRQf+2n6FkIkmecPaSWset35hiB42dPgtH19OaG6kM+wTewJwGRhbwCK
   oJMYuAr+plETi8sFnvRZO9bounMbPmYu1wyIsawda9zbRMj58s+ADwKVC
   nAPSdPvlsCyhR0K4PLYO/BJiPh2+bDNuj8J8LLHL5qc5tms6W3PALKufd
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QTBa53xVxyVPknzB5aX5iRm1EjGIOwnuRtsE8wexWC5FUOCjeUuJm6TzVNJ2dPR6pehPJWcgNQ
 cHLGCjWUIaxClfiRbp07PHnMzUCtcTXMDNkVCS6zueNmkHVMjAdJelH/3mZrnQfZBjIJCHuwR8
 +JqG/uvZp5hFRQiGUgM8yCd3wg0RzOZojuIz0/AB+2gBzuZedK4bk1ZqOgitEJJcwp1R8znK1I
 oTzmvHobbjLKS/43BZ4aA6dRq7VE6mdrUWXyPKhniS5ao2Dsh3APv3DLH4O9ein6oWRQukvjpY
 3ts=
X-SBRS: 5.2
X-MesageID: 33849264
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,428,1599537600"; 
   d="scan'208";a="33849264"
Subject: Re: [PATCH] xen/x86: Fix memory leak in vcpu_create() error path
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan
	<tim@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
	<michal.leszczynski@cert.pl>
References: <20200928154741.2366-1-andrew.cooper3@citrix.com>
 <33331c3a-1fd5-1ef6-16a3-21d2a6672e90@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9556aeb3-2a7c-7aea-4386-6e561dd9ef6e@citrix.com>
Date: Thu, 17 Dec 2020 21:46:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <33331c3a-1fd5-1ef6-16a3-21d2a6672e90@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 29/09/2020 07:18, Jan Beulich wrote:
> On 28.09.2020 17:47, Andrew Cooper wrote:
>> Various paths in vcpu_create() end up calling paging_update_paging_modes(),
>> which eventually allocate a monitor pagetable if one doesn't exist.
>>
>> However, an error in vcpu_create() results in the vcpu being cleaned up
>> locally, and not put onto the domain's vcpu list.  Therefore, the monitor
>> table is not freed by {hap,shadow}_teardown()'s loop.  This is caught by
>> assertions later that we've successfully freed the entire hap/shadow memory
>> pool.
>>
>> The per-vcpu loops in domain teardown logic is conceptually wrong, but exist
>> due to insufficient existing structure in the existing logic.
>>
>> Break paging_vcpu_teardown() out of paging_teardown(), with mirrored breakouts
>> in the hap/shadow code, and use it from arch_vcpu_create()'s error path.  This
>> fixes the memory leak.
>>
>> The new {hap,shadow}_vcpu_teardown() must be idempotent, and are written to be
>> as tolerable as possible, with the minimum number of safety checks possible.
>> In particular, drop the mfn_valid() check - if junk is in these fields, then
>> Xen is going to explode anyway.
>>
>> Reported-by: Michał Leszczyński <michal.leszczynski@cert.pl>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.  (Wow it really is a long time since needing to drop everything
for security work...)

>> --- a/xen/arch/x86/mm/hap/hap.c
>> +++ b/xen/arch/x86/mm/hap/hap.c
>> @@ -563,30 +563,37 @@ void hap_final_teardown(struct domain *d)
>>      paging_unlock(d);
>>  }
>>  
>> +void hap_vcpu_teardown(struct vcpu *v)
>> +{
>> +    struct domain *d = v->domain;
>> +    mfn_t mfn;
>> +
>> +    paging_lock(d);
>> +
>> +    if ( !paging_mode_hap(d) || !v->arch.paging.mode )
>> +        goto out;
> Any particular reason you don't use paging_get_hostmode() (as the
> original code did) here? Any particular reason for the seemingly
> redundant (and hence somewhat in conflict with the description's
> "with the minimum number of safety checks possible")
> paging_mode_hap()?

Yes to both.  As you spotted, I converted the shadow side first, and
made the two consistent.

The paging_mode_{shadow,hap})() is necessary for idempotency.  These
functions really might get called before paging is set up, for an early
failure in domain_create().

The paging mode has nothing really to do with hostmode/guestmode/etc. 
It is the only way of expressing the logic where it is clear that the
lower pointer dereferences are trivially safe.  (Also, the guestmode
predicate isn't going to survive the nested virt work.  It's
conceptually broken.)

~Andrew

