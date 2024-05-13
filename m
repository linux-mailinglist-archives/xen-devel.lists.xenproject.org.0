Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCE88C3F4B
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 12:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720795.1123715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6TGy-0008Vo-VS; Mon, 13 May 2024 10:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720795.1123715; Mon, 13 May 2024 10:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6TGy-0008U2-Sf; Mon, 13 May 2024 10:51:12 +0000
Received: by outflank-mailman (input) for mailman id 720795;
 Mon, 13 May 2024 10:51:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6TGy-0008Tw-Eq
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 10:51:12 +0000
Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com
 [52.119.213.154]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4a05f2f-1116-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 12:51:09 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.2])
 by smtp-border-fw-52004.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 10:51:07 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.10.100:45430]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.28.177:2525]
 with esmtp (Farcaster)
 id b5d6bb5e-23a1-4f32-8db6-42871781f0ea; Mon, 13 May 2024 10:51:06 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 10:51:05 +0000
Received: from [10.95.164.111] (10.95.164.111) by
 EX19D018EUA002.ant.amazon.com (10.252.50.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 10:51:01 +0000
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
X-Inumbo-ID: b4a05f2f-1116-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715597469; x=1747133469;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=USEHK303lNucM4WrYY3diktgzvI+QaFCKPi/PxCaKFk=;
  b=pP60BMFKw5x+nwWB4mBXMYvB74gSchwNn9kYAFUb6O6SQLNM/UI2iTm8
   /b4nUPIBgVvxLWiM4zlDjYLA/eVSkXK3ztOCeoMohDwDchf2oL/AWO1Iv
   e3FBr+t70jIX1KlmSa2JgMWb0/nz8fussqNIIPq253H30hKsgUhnAeHVQ
   Q=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="204717771"
X-Farcaster-Flow-ID: b5d6bb5e-23a1-4f32-8db6-42871781f0ea
Message-ID: <20fb9bf9-b24a-4119-807b-c0a4fd6b7439@amazon.com>
Date: Mon, 13 May 2024 11:50:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 13/27] x86: Add a boot option to enable and
 disable the direct map
To: Jan Beulich <jbeulich@suse.com>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<jgrall@amazon.com>, <xen-devel@lists.xenproject.org>
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-14-eliasely@amazon.com>
 <18795bde-bfd5-41ab-bef5-f74819bae956@suse.com>
Content-Language: en-US
From: Elias El Yandouzi <eliasely@amazon.com>
In-Reply-To: <18795bde-bfd5-41ab-bef5-f74819bae956@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.95.164.111]
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)



On 20/02/2024 11:14, Jan Beulich wrote:
> On 16.01.2024 20:25, Elias El Yandouzi wrote:
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -29,6 +29,7 @@ config X86
>>   	select HAS_UBSAN
>>   	select HAS_VPCI if HVM
>>   	select NEEDS_LIBELF
>> +	select HAS_SECRET_HIDING
> 
> Please respect alphabetic sorting. As to "secret hiding" - personally I
> consider this too generic a term. This is about limiting the direct map. Why
> not name the option then accordingly?
> 

I think it is a fairly decent name, would you have any suggestion? 
Otherwise I will just stick to it.

>> --- a/xen/arch/x86/include/asm/mm.h
>> +++ b/xen/arch/x86/include/asm/mm.h
>> @@ -620,10 +620,18 @@ void write_32bit_pse_identmap(uint32_t *l2);
>>   /*
>>    * x86 maps part of physical memory via the directmap region.
>>    * Return whether the range of MFN falls in the directmap region.
>> + *
>> + * When boot command line sets directmap=no, we will not have a direct map at
>> + * all so this will always return false.
>>    */
> 
> As with the command line doc, please state the full truth.
> 
>>   static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>>   {
>> -    unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
>> +    unsigned long eva;
>> +
>> +    if ( !has_directmap() )
>> +        return false;
> 
> Hmm. The sole user of this function is init_node_heap(). Would it perhaps make
> sense to simply map the indicated number of pages then? init_node_heap() would
> fall back to xmalloc(), so the data will be in what's left of the directmap
> anyway.
> 

There will be more users of arch_mfns_in_directmap() in the following 
patches.

>> +    eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
> 
> Irrespective I don't see a need to replace the initializer by an assignment.

I guess it was to avoid the useless min() computation in case directmap 
is disabled. I can put it back to what it was.

> 
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -83,6 +83,23 @@ config HAS_UBSAN
>>   config MEM_ACCESS_ALWAYS_ON
>>   	bool
>>   
>> +config HAS_SECRET_HIDING
>> +	bool
> 
> This again wants placing suitably among the other HAS_*.
> 
>> +config SECRET_HIDING
>> +    bool "Secret hiding"
>> +    depends on HAS_SECRET_HIDING
>> +    ---help---
>> +    The directmap contains mapping for most of the RAM which makes domain
>> +    memory easily accessible. While making the performance better, it also makes
>> +    the hypervisor more vulnerable to speculation attacks.
>> +
>> +    Enabling this feature will allow the user to decide whether the memory
>> +    is always mapped at boot or mapped only on demand (see the command line
>> +    option "directmap").
>> +
>> +    If unsure, say N.
> 
> Also as an alternative did you consider making this new setting merely
> control the default of opt_directmap? Otherwise the variable shouldn't exist
> at all when the Kconfig option is off, but rather be #define-d to "true" in
> that case.

I am not sure to understand why the option shouldn't exist at all when 
Kconfig option is off.

If SECRET_HIDING option is off, then opt_directmap must be 
unconditionally set to true. If SECRET_HIDING option is on, then 
opt_directmap value depends on the commandline option.

The corresponding wrapper, has_directmap(), will be used in multiple 
location in follow-up patch. I don't really see how you want to do.

>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -165,6 +165,13 @@ extern unsigned long max_page;
>>   extern unsigned long total_pages;
>>   extern paddr_t mem_hotplug;
>>   
>> +extern bool opt_directmap;
>> +
>> +static inline bool has_directmap(void)
>> +{
>> +    return opt_directmap;
>> +}
> 
> If opt_directmap isn't static, I see little point in having such a wrapper.
> If there are reasons, I think they want stating in the description.

I don't think there is a specific reason to be mentioned, if you really 
wish to, I can remove it.

> On the whole: Is the placement of this patch in the series an indication
> that as of here all directmap uses have gone away? If so, what's the rest of
> the series about? Alternatively isn't use of this option still problematic
> at this point of the series? Whichever way it is - this wants clarifying in
> the description.

This patch is not an indication that all directmap uses have been 
removed. We need to know in follow-up patch whether or not the option is 
enabled and so we have to introduce this patch here.

At this point in the series, the feature is not yet complete.


Elias


