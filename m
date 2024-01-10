Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCA8829AD1
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 14:00:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665431.1035643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNYBX-0006be-8X; Wed, 10 Jan 2024 12:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665431.1035643; Wed, 10 Jan 2024 12:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNYBX-0006a8-5S; Wed, 10 Jan 2024 12:59:55 +0000
Received: by outflank-mailman (input) for mailman id 665431;
 Wed, 10 Jan 2024 12:50:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kDgC=IU=amazon.co.uk=prvs=732579c64=eliasely@srs-se1.protection.inumbo.net>)
 id 1rNY2Q-0005ae-H5
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 12:50:30 +0000
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com
 [99.78.197.219]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d387774d-afb6-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 13:50:27 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-m6i4x-83883bdb.us-west-2.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-80008.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 12:50:24 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan2.pdx.amazon.com [10.39.38.66])
 by email-inbound-relay-pdx-2a-m6i4x-83883bdb.us-west-2.amazon.com (Postfix)
 with ESMTPS id 9D3EC60C68; Wed, 10 Jan 2024 12:50:23 +0000 (UTC)
Received: from EX19MTAEUA002.ant.amazon.com [10.0.10.100:54762]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.26.238:2525]
 with esmtp (Farcaster)
 id 21254f9c-3e38-441e-a230-621b679481c4; Wed, 10 Jan 2024 12:50:22 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Jan 2024 12:50:22 +0000
Received: from [192.168.8.225] (10.106.82.23) by EX19D018EUA002.ant.amazon.com
 (10.252.50.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 10 Jan
 2024 12:50:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d387774d-afb6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1704891027; x=1736427027;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jMmmbWv6qx49xRxZS/Wny1+KtQ9OWQVIQIAlAph6n34=;
  b=N4Hb9yYcK7zadl6wUv9MTvqWvPvsnGBQE1pDnaPAMJqQQxVZu6t+Mhab
   iLd1ELWmBKKAvJqSgYzI6EPUaIYB4qtTbizNId1IqGa5HysW5mlsqDBn7
   ImDOUlGL9q9Sw33aw3WJ2ui8YVlWEboV7bN9xvQSFUUotqoKDYC9AqxBF
   0=;
X-IronPort-AV: E=Sophos;i="6.04,184,1695686400"; 
   d="scan'208";a="57272337"
X-Farcaster-Flow-ID: 21254f9c-3e38-441e-a230-621b679481c4
Message-ID: <b1879928-8e35-4506-a400-ece5c3096058@amazon.com>
Date: Wed, 10 Jan 2024 12:50:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/22] x86/pv: rewrite how building PV dom0 handles
 domheap mappings
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>, <xen-devel@lists.xenproject.org>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-9-julien@xen.org>
 <1bd1de52-9f3b-6654-dbda-37001fce31d7@suse.com>
From: "El Yandouzi, Elias" <eliasely@amazon.com>
In-Reply-To: <1bd1de52-9f3b-6654-dbda-37001fce31d7@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.106.82.23]
X-ClientProxiedBy: EX19D032UWB002.ant.amazon.com (10.13.139.190) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)
Precedence: Bulk

Hi Jan,

I have been looking at this series recently and tried my best
to address your comments. I'll shortly to the other patches too.

On 22/12/2022 11:48, Jan Beulich wrote:
> On 16.12.2022 12:48, Julien Grall wrote:
>> From: Hongyan Xia <hongyxia@amazon.com>
>>
>> Building a PV dom0 is allocating from the domheap but uses it like the
>> xenheap. This is clearly wrong. Fix.
> 
> "Clearly wrong" would mean there's a bug here, at lest under certain
> conditions. But there isn't: Even on huge systems, due to running on
> idle page tables, all memory is mapped at present.

I agree with you, I'll rephrase the commit message.

> 
>> @@ -711,22 +715,32 @@ int __init dom0_construct_pv(struct domain *d,
>>           v->arch.pv.event_callback_cs    = FLAT_COMPAT_KERNEL_CS;
>>       }
>>   
>> +#define UNMAP_MAP_AND_ADVANCE(mfn_var, virt_var, maddr) \
>> +do {                                                    \
>> +    UNMAP_DOMAIN_PAGE(virt_var);                        \
> 
> Not much point using the macro when ...
> 
>> +    mfn_var = maddr_to_mfn(maddr);                      \
>> +    maddr += PAGE_SIZE;                                 \
>> +    virt_var = map_domain_page(mfn_var);                \
> 
> ... the variable gets reset again to non-NULL unconditionally right
> away.

Sure, I'll change that.

> 
>> +} while ( false )
> 
> This being a local macro and all use sites passing mpt_alloc as the
> last argument, I think that parameter wants dropping, which would
> improve readability.

I have to disagree. It wouldn't improve readability but make only make 
things more obscure. I'll keep the macro as is.

> 
>> @@ -792,9 +808,9 @@ int __init dom0_construct_pv(struct domain *d,
>>               if ( !l3e_get_intpte(*l3tab) )
>>               {
>>                   maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l2_page_table;
>> -                l2tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
>> -                clear_page(l2tab);
>> -                *l3tab = l3e_from_paddr(__pa(l2tab), L3_PROT);
>> +                UNMAP_MAP_AND_ADVANCE(l2start_mfn, l2start, mpt_alloc);
>> +                clear_page(l2start);
>> +                *l3tab = l3e_from_mfn(l2start_mfn, L3_PROT);
> 
> The l2start you map on the last iteration here can be re-used ...
> 
>> @@ -805,9 +821,17 @@ int __init dom0_construct_pv(struct domain *d,
>>           unmap_domain_page(l2t);
>>       }
> 
> ... in the code the tail of which is visible here, eliminating a
> redundant map/unmap pair.

Good catch, I'll remove the redundant pair.

> 
>> @@ -977,8 +1001,12 @@ int __init dom0_construct_pv(struct domain *d,
>>        * !CONFIG_VIDEO case so the logic here can be simplified.
>>        */
>>       if ( pv_shim )
>> +    {
>> +        l4start = map_domain_page(l4start_mfn);
>>           pv_shim_setup_dom(d, l4start, v_start, vxenstore_start, vconsole_start,
>>                             vphysmap_start, si);
>> +        UNMAP_DOMAIN_PAGE(l4start);
>> +    }
> 
> The, at the first glance, redundant re-mapping of the L4 table here could
> do with explaining in the description. However, I further wonder in how
> far in shim mode eliminating the direct map is actually useful. Which is
> to say that I question the need for this change in the first place. Or
> wait - isn't this (unlike the rest of this patch) actually a bug fix? At
> this point we're on the domain's page tables, which may not cover the
> page the L4 is allocated at (if a truly huge shim was configured). So I
> guess the change is needed but wants breaking out, allowing to at least
> consider whether to backport it.
> 

I will create a separate patch for this change.

> Jan
> 

