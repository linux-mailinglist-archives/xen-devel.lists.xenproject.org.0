Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A338BE750
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 17:22:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718273.1120855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Mdv-0005jT-IC; Tue, 07 May 2024 15:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718273.1120855; Tue, 07 May 2024 15:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Mdv-0005hH-FO; Tue, 07 May 2024 15:22:11 +0000
Received: by outflank-mailman (input) for mailman id 718273;
 Tue, 07 May 2024 15:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YimZ=MK=amazon.co.uk=prvs=8506a7df7=eliasely@srs-se1.protection.inumbo.net>)
 id 1s4Mdt-0005hB-ET
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 15:22:09 +0000
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90b34196-0c85-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 17:22:08 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-6002.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 15:22:03 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.17.79:9527]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.8.30:2525] with
 esmtp (Farcaster)
 id 6f031f60-57de-41f3-851e-2a71332a4210; Tue, 7 May 2024 15:22:01 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 7 May 2024 15:22:01 +0000
Received: from [192.168.15.40] (10.106.83.8) by EX19D018EUA002.ant.amazon.com
 (10.252.50.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Tue, 7 May
 2024 15:21:57 +0000
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
X-Inumbo-ID: 90b34196-0c85-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715095329; x=1746631329;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yaFPD2Ekn21BDjcaiX5C+jqap0rCbSx8lXe5MsuDjWw=;
  b=lJt67S+EEzbTUd8+dw9q7iYXzFGmlO6IVbPgNc8X/OnJYQBV/6IqPqkO
   MaZrPB0dxltd3j+EJAckGNmIAQNunwmJqVSfal/xMs9+WS16UbxMMBAeI
   lyZHvygagl1sbWQCpiZFwdZTX7PH80ln24LCV00+TB4fqTzlucQhJ1lZC
   o=;
X-IronPort-AV: E=Sophos;i="6.08,142,1712620800"; 
   d="scan'208";a="405335772"
X-Farcaster-Flow-ID: 6f031f60-57de-41f3-851e-2a71332a4210
Message-ID: <e465d95c-f1c8-4857-9bb5-1c37a3c4cc80@amazon.com>
Date: Tue, 7 May 2024 16:21:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 09/27] x86/pv: Rewrite how building PV dom0
 handles domheap mappings
To: Jan Beulich <jbeulich@suse.com>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <jgrall@amazon.com>,
	<xen-devel@lists.xenproject.org>
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-10-eliasely@amazon.com>
 <7031861b-f925-479c-b236-8b1809996ede@suse.com>
Content-Language: en-US
From: Elias El Yandouzi <eliasely@amazon.com>
In-Reply-To: <7031861b-f925-479c-b236-8b1809996ede@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.106.83.8]
X-ClientProxiedBy: EX19D032UWB003.ant.amazon.com (10.13.139.165) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)

 > On 20/02/2024 10:28, Jan Beulich wrote:
>> On 16.01.2024 20:25, Elias El Yandouzi wrote:
>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
>> @@ -382,6 +382,10 @@ int __init dom0_construct_pv(struct domain *d,
>>       l3_pgentry_t *l3tab = NULL, *l3start = NULL;
>>       l2_pgentry_t *l2tab = NULL, *l2start = NULL;
>>       l1_pgentry_t *l1tab = NULL, *l1start = NULL;
>> +    mfn_t l4start_mfn = INVALID_MFN;
>> +    mfn_t l3start_mfn = INVALID_MFN;
>> +    mfn_t l2start_mfn = INVALID_MFN;
>> +    mfn_t l1start_mfn = INVALID_MFN;
> 
> The reason initializers are needed here is, aiui, the overly large scope
> of these variables. For example ...
> 

Correct, is it just an observation or do you want me to do anything?

>> @@ -708,22 +712,32 @@ int __init dom0_construct_pv(struct domain *d,
>>           v->arch.pv.event_callback_cs    = FLAT_COMPAT_KERNEL_CS;
>>       }
>>   
>> +#define UNMAP_MAP_AND_ADVANCE(mfn_var, virt_var, maddr) \
>> +do {                                                    \
>> +    unmap_domain_page(virt_var);                        \
>> +    mfn_var = maddr_to_mfn(maddr);                      \
>> +    maddr += PAGE_SIZE;                                 \
>> +    virt_var = map_domain_page(mfn_var);                \
>> +} while ( false )
>> +
>>       if ( !compat )
>>       {
>>           maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l4_page_table;
>> -        l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
>> +        UNMAP_MAP_AND_ADVANCE(l4start_mfn, l4start, mpt_alloc);
>> +        l4tab = l4start;
>>           clear_page(l4tab);
>> -        init_xen_l4_slots(l4tab, _mfn(virt_to_mfn(l4start)),
>> -                          d, INVALID_MFN, true);
>> -        v->arch.guest_table = pagetable_from_paddr(__pa(l4start));
>> +        init_xen_l4_slots(l4tab, l4start_mfn, d, INVALID_MFN, true);
>> +        v->arch.guest_table = pagetable_from_mfn(l4start_mfn);
> 
> ... looks to be required only here, while ...
> 
>>       }
>>       else
>>       {
>>           /* Monitor table already created by switch_compat(). */
>> -        l4start = l4tab = __va(pagetable_get_paddr(v->arch.guest_table));
>> +        l4start_mfn = pagetable_get_mfn(v->arch.guest_table);
>> +        l4start = l4tab = map_domain_page(l4start_mfn);
> 
> ... in principle the use of the variable could be avoided here. Below
> from here there's no further use of it.
> 
>> @@ -781,30 +797,34 @@ int __init dom0_construct_pv(struct domain *d,
>>   
>>       if ( compat )
>>       {
>> -        l2_pgentry_t *l2t;
>> -
>>           /* Ensure the first four L3 entries are all populated. */
>>           for ( i = 0, l3tab = l3start; i < 4; ++i, ++l3tab )
>>           {
>>               if ( !l3e_get_intpte(*l3tab) )
>>               {
>>                   maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l2_page_table;
>> -                l2tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
>> -                clear_page(l2tab);
>> -                *l3tab = l3e_from_paddr(__pa(l2tab), L3_PROT);
>> +                UNMAP_MAP_AND_ADVANCE(l2start_mfn, l2start, mpt_alloc);
>> +                clear_page(l2start);
>> +                *l3tab = l3e_from_mfn(l2start_mfn, L3_PROT);
>>               }
> 
> The updating of l2start is only conditional here, yet ...
> 
>>               if ( i == 3 )
>>                   l3e_get_page(*l3tab)->u.inuse.type_info |= PGT_pae_xen_l2;
>>           }
>>   
>> -        l2t = map_l2t_from_l3e(l3start[3]);
>> -        init_xen_pae_l2_slots(l2t, d);
>> -        unmap_domain_page(l2t);
>> +        init_xen_pae_l2_slots(l2start, d);
> 
> ... here you assume it points at the page referenced by the 3rd L3 entry.

Hmm, I missed it when sending the revision and indeed it doesn't look 
correct.

> Question is why the original code is being replaced here in the first
> place: It was already suitably mapping the page in question.

The code was already suitably mapping the pages in question. This patch 
doesn't aim to make any functional change, just to rework how the 
domheap pages are used. The goal of the series is to remove the mappings 
from the directmap, which means those pages needs to be mapped and 
unmapped when required.

This is all this patch do, see `UNMAP_MAP_AND_ADVANCE()` macro.

Elias

