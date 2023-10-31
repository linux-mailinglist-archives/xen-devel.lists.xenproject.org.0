Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED6B7DCB22
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 11:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625618.975082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxmII-0004g2-K5; Tue, 31 Oct 2023 10:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625618.975082; Tue, 31 Oct 2023 10:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxmII-0004eN-GW; Tue, 31 Oct 2023 10:48:22 +0000
Received: by outflank-mailman (input) for mailman id 625618;
 Tue, 31 Oct 2023 10:48:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qxmIG-0004eH-Qx
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 10:48:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxmIA-0008Lj-Fh; Tue, 31 Oct 2023 10:48:14 +0000
Received: from [15.248.3.3] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxmIA-0007qZ-74; Tue, 31 Oct 2023 10:48:14 +0000
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
	bh=adkvDTKfJtX5mUJRurQ4/7eGspLhoQBrJKiCyOyItv8=; b=ZvUNYafWfNtusKHXfLwDJt9TO9
	YmPsSBlomeXjgHldB6mofmAFewr4CVCdZGp/boFI0MVQkLXD9dTt4X0DLgwecIlXQ3LjYG3IFy/Dp
	wf+N2J3GFOtduZN2FUM8rkhSDprjBmK2RxJmewyU3G5fDYZFCGf/kx9N5wM2VYvOyx4I=;
Message-ID: <9a539156-9e11-43b7-9f62-0c1b1d842e89@xen.org>
Date: Tue, 31 Oct 2023 10:48:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/domain_page: address violations of MISRA
 C:2012 Rule 8.3
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <d70e8e6b00f7b08ed4b360d38113e6a1460ed3ab.1698743361.git.federico.serafini@bugseng.com>
 <8aa755d3-7cba-9543-95fc-056f397c18ae@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8aa755d3-7cba-9543-95fc-056f397c18ae@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 31/10/2023 10:31, Jan Beulich wrote:
> On 31.10.2023 10:25, Federico Serafini wrote:
>> Make function defintions and declarations consistent.

typo: s/defintions/definitions/

>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> However, ...
> 
>> ---
>> Changes in v2:
>> - use 'ptr' do denote a const void * parameter.
> 
> ... not even this (let alone the description) clarifies what the
> inconsistency was. I had to go check to figure that x86 already uses
> "ptr". Such things could do with spelling out.

+1. The more that x86 was the "odd" one but it was chosen to use the 
variant everywhere.

With the commit message clarified:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
>> @@ -55,8 +55,8 @@ static inline void *__map_domain_page_global(const struct page_info *pg)
>>   
>>   #define map_domain_page(mfn)                __mfn_to_virt(mfn_x(mfn))
>>   #define __map_domain_page(pg)               page_to_virt(pg)
>> -#define unmap_domain_page(va)               ((void)(va))
>> -#define domain_page_map_to_mfn(va)          _mfn(__virt_to_mfn((unsigned long)(va)))
>> +#define unmap_domain_page(ptr)               ((void)(ptr))
>> +#define domain_page_map_to_mfn(ptr)          _mfn(__virt_to_mfn((unsigned long)(ptr)))
> 
> Padding wants to not be screwed by the change (one of the blanks will
> want dropping). I guess this can be taken care of while committing.
> 
> Jan

-- 
Julien Grall

