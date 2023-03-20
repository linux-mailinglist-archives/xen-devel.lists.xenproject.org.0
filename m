Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCBF6C21A0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 20:35:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512105.791780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peLIB-0007m8-Pu; Mon, 20 Mar 2023 19:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512105.791780; Mon, 20 Mar 2023 19:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peLIB-0007jv-MY; Mon, 20 Mar 2023 19:35:39 +0000
Received: by outflank-mailman (input) for mailman id 512105;
 Mon, 20 Mar 2023 19:35:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GPvh=7M=list.ru=valor@srs-se1.protection.inumbo.net>)
 id 1peLIA-0007jp-TE
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 19:35:38 +0000
Received: from smtp35.i.mail.ru (smtp35.i.mail.ru [95.163.41.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61686425-c756-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 20:35:34 +0100 (CET)
Received: by smtp35.i.mail.ru with esmtpa (envelope-from <valor@list.ru>)
 id 1peLI4-00DKph-Cf; Mon, 20 Mar 2023 22:35:33 +0300
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
X-Inumbo-ID: 61686425-c756-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=list.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=Xi6xwze9ipiWlZ9k95YT37vror7kseeF93EZ2Xg8+l8=;
	t=1679340934;x=1679430934; 
	b=OrVeQ0bRgRcqdQS2j6LUfjbkCw/Ib/CKpaKR9OixPE2Addi/RPvhiFa4KFNiGnEeOXEtQ7zaiR5PC+T8gUsqXd4LIuSURtP+y/x6q9tRkE5uS2AivABFEPKcRZ2+4n1jmXefxwu6lfwmdOQ4U7AN4FN5ta9HBes6IiYWAnmeWFazNwMaL78hzFR8cXXOs6rqekVldgABp/411uQSx3HcGIX/4+CFgdjn+dcxcw5PZzvxouWsvdtc4vgGPngdmjUyV9U3s6hozvVdLjZxnmLt1uTrZKdZKZlT/RQrEs8QpiTFgIO5djV0atdfcV+K40UA3lB94uIRZBMonfc2M3LnCA==;
Message-ID: <3db374f7-4c87-f39f-dbad-a1a242d4914f@list.ru>
Date: Mon, 20 Mar 2023 22:35:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [XEN PATCH v1 1/1] x86/domctl: add gva_to_gfn command
Content-Language: ru, en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Dmitry Isaykin <isaikin-dmitry@yandex.ru>
References: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru>
 <f2231607-b29c-b54b-874f-4e30ee84ae80@citrix.com>
From: =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg0KHQtdGA0LPQtdC5?= <valor@list.ru>
In-Reply-To: <f2231607-b29c-b54b-874f-4e30ee84ae80@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp35.i.mail.ru; auth=pass smtp.auth=valor@list.ru smtp.mailfrom=valor@list.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9303C7CA6F8B0D1AB73F6BB652401FCBD9A00615D1C3A0754182A05F5380850408843CD233744C354BA45385A74E66A000AC342144BE2492737EEE8B237D9E276
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7FACE2B07D13A236DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637835928C62272F24E8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8A42872D32DBF4FB62548E8D85C0B1F1C6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE740D0B15A1445ACA99FA2833FD35BB23D9E625A9149C048EE437C869540D2AB0FC26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BDCBA8CBAA3833548A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC27E72F19B8D56CD43AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637C770107576E8A7DFD81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F7900637F9425D8FA97DB4396D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637BC615C5154A25A8BEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D348E5EF936B2E46EBA97A3AA3AD6665CC40C1FF6F982B06A55BA3BB7AB1ACCFF5310590B5EF6DF2CE01D7E09C32AA3244C8392FA78F2C0BB34F0B1EEE2AC195E271DD47778AE04E04DED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojrPvsFeLNXrWKgEwFB58lvg==
X-Mailru-Sender: 6C3E74F07C41AE944C83DF7F8E76CAD9F6D1D0808FA1D948E8B19DE89B8DE62478DA84BECF987551671A0538F0E0E4B8C77752E0C033A69E86F8B8EC1BECD1EECCC3E8BC0E932F7CB4A721A3011E896F
X-Mras: Ok



20.03.2023 22:07, Andrew Cooper пишет:
> On 20/03/2023 4:32 pm, Ковалёв Сергей wrote:
>> gva_to_gfn command used for fast address translation in LibVMI project.
>> With such a command it is possible to perform address translation in
>> single call instead of series of queries to get every page table.
>>
>> Thanks to Dmitry Isaykin for involvement.
>>
>> Signed-off-by: Sergey Kovalev <valor@list.ru>
> 
> I fully appreciate why you want this hypercall, and I've said several
> times that libvmi wants something better than it has, but...
> 
>> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
>> index 2118fcad5d..0c9706ea0a 100644
>> --- a/xen/arch/x86/domctl.c
>> +++ b/xen/arch/x86/domctl.c
>> @@ -1364,6 +1364,23 @@ long arch_do_domctl(
>>               copyback = true;
>>           break;
>>
>> +    case XEN_DOMCTL_gva_to_gfn:
>> +    {
>> +        uint64_t ga = domctl->u.gva_to_gfn.addr;
>> +        uint64_t cr3 = domctl->u.gva_to_gfn.cr3;
>> +        struct vcpu* v = d->vcpu[0];
> 
> ... this isn't safe if you happen to issue this hypercall too early in a
> domain's lifecycle.
> 
> If nothing else, you want to do a domain_vcpu() check and return -ENOENT
> in the failure case.

Thanks!

> 
> More generally, issuing the hypercall under vcpu0 isn't necessarily
> correct.  It is common for all vCPUs to have equivalent paging settings,
> but e.g. Xen transiently disables CR4.CET and CR0.WP in order to make
> self-modifying code changes.
> 
> Furthermore, the setting of CR4.{PAE,PSE} determines reserved bits, so
> you can't even ignore the access rights and hope that the translation
> works out correctly.

Thanks! I didn't think about such things earlier. I should to think
this know carefully.

> 
> Ideally we'd have a pagewalk algorithm which didn't require taking a
> vcpu, and instead just took a set of paging configuration, but it is all
> chronically entangled right now.
> 

Do You mean to add new implementation of "paging_ga_to_gfn_cr3"?

> I think, at a minimum, you need to take a vcpu_id as an input, but I
> suspect to make this a usable API you want an altp2m view id too.
> 

Why we should consider altp2m while translating guest virtual address to
guest physical one?

> Also, I'm pretty sure this is only safe for a paused vCPU.  If the vCPU
> isn't paused, then there's a TOCTOU race in the pagewalk code when
> inspecting control registers.
> 

Thanks! Should we pause the domain?

>> +        uint32_t pfec = PFEC_page_present;
>> +        unsigned int page_order;
>> +
>> +        uint64_t gfn = paging_ga_to_gfn_cr3(v, cr3, ga, &pfec,
>> &page_order);
>> +        domctl->u.gva_to_gfn.addr = gfn;
>> +        domctl->u.gva_to_gfn.page_order = page_order;
> 
> page_order is only not stack rubble if gfn is different to INVALID_GFN.
> 

Sorry but I don't understand "is only not stack rubble". Do you mean
that I should initialize "page_order" while defining it?

>> +        if ( __copy_to_guest(u_domctl, domctl, 1) )
>> +            ret = -EFAULT;
> 
> You want to restrict this to just the gva_to_gfn sub-portion.  No point
> copying back more than necessary.
> 
> ~Andrew

Thanks a lot!

-- 
Best regards,
Sergey Kovalev


