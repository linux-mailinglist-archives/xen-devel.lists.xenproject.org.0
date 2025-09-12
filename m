Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D32B55972
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 00:43:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122740.1466260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxCUD-0001jJ-1R; Fri, 12 Sep 2025 22:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122740.1466260; Fri, 12 Sep 2025 22:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxCUC-0001gk-V9; Fri, 12 Sep 2025 22:43:20 +0000
Received: by outflank-mailman (input) for mailman id 1122740;
 Fri, 12 Sep 2025 22:43:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uxCUB-0001ge-OU
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 22:43:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxCU7-006fTv-0h;
 Fri, 12 Sep 2025 22:43:15 +0000
Received: from [2a02:8012:3a1:0:95d0:d8bb:cf45:58c2]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxCU7-006F49-0h;
 Fri, 12 Sep 2025 22:43:15 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=lsSS3bXDr65K5UWTyDadFhlbxDaP5BEzvQcAZse4Rsw=; b=nV/9eR8Qngj4UToEdoOP9NigF+
	uzANHeUw7jr+apEgnZaJFooaIkg/deM0RvpGNFDb1QGZsz+svIPeVWmn409K+Jj9HN+lh7+JYo6cY
	4Eh/gRkBcXQpvP0qdydS2i7R6LRUf9lS6+MRsF4fOU/JVXICNIF31wHd1UWSEaGzX1Cs=;
Message-ID: <212f3043-bfd1-4c84-bce4-ed98648aa880@xen.org>
Date: Fri, 12 Sep 2025 23:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1756803419.git.mykola_kvach@epam.com>
 <53cc6a9cf7a73d12c632bf8b8eee2f7069e6b0f1.1756803419.git.mykola_kvach@epam.com>
 <28e78684-ff7b-4902-89cd-c341ba236d57@suse.com>
 <CAGeoDV_LpUjV5ctZDE7-Z8Nb5mQgOBT2vFaLwidxNqqMM1B8qw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAGeoDV_LpUjV5ctZDE7-Z8Nb5mQgOBT2vFaLwidxNqqMM1B8qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 02/09/2025 18:55, Mykola Kvach wrote:
>>> --- a/xen/include/xen/domain.h
>>> +++ b/xen/include/xen/domain.h
>>> @@ -8,6 +8,10 @@
>>>
>>>   #include <public/xen.h>
>>>
>>> +#if __has_include(<asm/suspend.h>)
>>> +#include <asm/suspend.h>
>>> +#endif
>>> +
>>>   struct guest_area {
>>>       struct page_info *pg;
>>>       void *map;
>>> @@ -109,6 +113,13 @@ int arch_domain_soft_reset(struct domain *d);
>>>
>>>   void arch_domain_creation_finished(struct domain *d);
>>>
>>> +#if !__has_include(<asm/suspend.h>)
>>> +static inline int arch_domain_resume(struct domain *d)
>>> +{
>>> +    return 0;
>>> +}
>>> +#endif /* !__has_include(<asm/suspend.h>) */
>>> +
>>>   void arch_p2m_set_access_required(struct domain *d, bool access_required);
>>>
>>>   int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c);
>>
>> Imo it would be preferable to have such in a single #if/#else. There's nothing
>> wrong with an #include not sitting at the very top.
> 
> I understand that includes can be placed near where something from the
> header is used. However, I find it more natural to keep them together
> in a single location.

It is not always possible to keep all includes together. I also have a 
slight preference to Jan suggestion because we don't have multiple "#if 
__has_include(<asm/suspend.h>)" which I find rather ugly but necessary.

> 
>>
>> (Another question is whether to put this in xen/domain.h at all. There could
>> be a xen/suspend.h having - for now at least - just this and nothing else.)
> 
> With this approach, I don’t need to move the include to the middle of
> the file.

A new suspend.h file would also work for me.

Cheers,

-- 
Julien Grall


