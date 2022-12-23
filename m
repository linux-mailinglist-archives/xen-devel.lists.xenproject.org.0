Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F883654F1A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 11:18:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468879.728071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8f7Q-0004Dn-L0; Fri, 23 Dec 2022 10:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468879.728071; Fri, 23 Dec 2022 10:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8f7Q-0004Ae-IJ; Fri, 23 Dec 2022 10:17:36 +0000
Received: by outflank-mailman (input) for mailman id 468879;
 Fri, 23 Dec 2022 10:17:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p8f7O-0004AY-SC
 for xen-devel@lists.xenproject.org; Fri, 23 Dec 2022 10:17:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8f7O-0001KP-IC; Fri, 23 Dec 2022 10:17:34 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.3.230]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8f7O-00064t-Bg; Fri, 23 Dec 2022 10:17:34 +0000
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
	bh=mP5Zatn0GhS00G365a127hXliLkJQRwx/hNEjClqEIs=; b=xWIqk/8RaBNUZS4i4k6+7Es86p
	sEJAE56fK5wfzg0O/3RLzgViqTMedVBEeud+uxCdfLDKPWbu/xXyO7So8yq68NKYkq60EOLexf7il
	/Eyc80aSssSEZx9khUN+BL5pGET72Pyf2JkFEemxgcl3uUG53NbYUliOLNiojcbM/L4g=;
Message-ID: <5898da03-9947-1540-f424-d76c715619f4@xen.org>
Date: Fri, 23 Dec 2022 10:17:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v1 2/9] xen/arm: Define translate_dt_address_size() for the
 translation between u64 and paddr_t
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
 <20221215193245.48314-3-ayan.kumar.halder@amd.com>
 <b58c6548-9e70-0ed9-07a9-e35084620c36@xen.org>
 <alpine.DEB.2.22.394.2212161643400.315094@ubuntu-linux-20-04-desktop>
 <74786a57-d99a-6cfe-f475-df11c0d93afa@xen.org>
 <alpine.DEB.2.22.394.2212221520020.4079@ubuntu-linux-20-04-desktop>
 <5bc9435e-aee9-006c-a35a-ee9c7f946f91@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5bc9435e-aee9-006c-a35a-ee9c7f946f91@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/12/2022 10:01, Ayan Kumar Halder wrote:
> Hi Julien/Stefano,
> 
> I want to make sure I understand correctly.
> 
> On 22/12/2022 23:20, Stefano Stabellini wrote:
>> On Sat, 17 Dec 2022, Julien Grall wrote:
>>> On 17/12/2022 00:46, Stefano Stabellini wrote:
>>>> On Fri, 16 Dec 2022, Julien Grall wrote:
>>>>> Hi Ayan,
>>>>>
>>>>> On 15/12/2022 19:32, Ayan Kumar Halder wrote:
>>>>>> paddr_t may be u64 or u32 depending of the type of architecture.
>>>>>> Thus, while translating between u64 and paddr_t, one should check 
>>>>>> that
>>>>>> the
>>>>>> truncated bits are 0. If not, then raise an appropriate error.
>>>>> I am not entirely convinced this extra helper is worth it. If the user
>>>>> can't
>>>>> provide 32-bit address in the DT, then there are also a lot of 
>>>>> other part
>>>>> that
>>>>> can go wrong.
>>>>>
>>>>> Bertrand, Stefano, what do you think?
>>>> In general, it is not Xen's job to protect itself against bugs in 
>>>> device
>>>> tree. However, if Xen spots a problem in DT and prints a helpful 
>>>> message
>>>> that is better than just crashing because it gives a hint to the
>>>> developer about what the problem is.
>>> I agree with the principle. In practice this needs to be weight out 
>>> with the
>>> long-term maintenance.
>>>
>>>> In this case, I think a BUG_ON would be sufficient.
>>> BUG_ON() is the same as panic(). They both should be used only when 
>>> there are
>>> no way to recover (see CODING_STYLE).
>>>
>>> If we parse the device-tree at boot, then BUG_ON() is ok. However, if 
>>> we need
>>> to parse it after boot (e.g. the DT overlay from Vikram), then we should
>>> definitely not call BUG_ON() for checking DT input.
>> yeah, I wasn't thinking of that series
>>
>>
>>> The correct way is like Ayan did by checking returning an error and let
>>> the caller deciding what to do.
>>>
>>> My concern with his approach is the extra amount of code in each 
>>> caller to
>>> check it (even with a new helper).
>>>
>>> I am not fully convinced that checking the addresses in the DT is 
>>> that useful.
>> I am also happy not to do it to be honest
> 
> So are you suggesting that we do the truncation, but do not check if any 
> non zero bits have been truncated.
> 
> As an example, currently with this patch :-
> 
> -        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, 
> &gbase);
> -        psize = dt_read_number(cells, size_cells);
> +        device_tree_get_reg(&cells, addr_cells, addr_cells, &dt_pbase, 
> &dt_gbase);
> +        ret = translate_dt_address_size(&dt_pbase, &dt_gbase, &pbase, 
> &gbase);
> +        if ( ret )
> +            return ret;
> +        dt_psize = dt_read_number(cells, size_cells);
> +        ret = translate_dt_address_size(NULL, &dt_psize, NULL, &psize);
> 
> 
> With your proposed change, it should be
> 
> -        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, 
> &gbase);
> -        psize = dt_read_number(cells, size_cells);
> +        device_tree_get_reg(&cells, addr_cells, addr_cells, &dt_pbase, 
> &dt_gbase);
> +        dt_psize = dt_read_number(cells, size_cells);
> +        pbase = (paddr_t) dt_pbase;
> +        gbase = (paddr_t) dt_gbase;
> +        psize = (paddr_t) dt_psize;

-ETOOMANY cast and lines (the more if this is expected to be 
duplicated). But the last one seems unnecessary as the only reason you 
need separate variable for pbase and gbase is because the function are 
taking a reference rather than returning the value.

> 
> Because, we still need some way to convert u64 dt address/size to 
> paddr_t (u64/u32) address/size. 
How about following the approach I suggested in my previous e-mail to 
Stefano:
   - Convert device_tree_get_reg() to use paddr_t.
   - Introduce dt_device_get_address_checked() (Assuming you want to 
still add the check)

We may need an helper to wrap around dt_read_number() but I don't have a 
good idea for a name. There are only a couple of use. So I think it is 
fine to open-code. But you would not need a separate local variable. For 
the cast, I am in two mind. In one way, I don't like unnecessary 
explicit cast, but on the other way it serves as documentation.

Stefano, any opinions?

Cheers,

-- 
Julien Grall

