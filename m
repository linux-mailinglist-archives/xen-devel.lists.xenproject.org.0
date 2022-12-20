Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 861D1652042
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 13:15:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466994.725980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7bWI-0004my-0H; Tue, 20 Dec 2022 12:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466994.725980; Tue, 20 Dec 2022 12:14:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7bWH-0004kB-TT; Tue, 20 Dec 2022 12:14:53 +0000
Received: by outflank-mailman (input) for mailman id 466994;
 Tue, 20 Dec 2022 12:14:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7bWF-0004k5-Sf
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 12:14:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7bWF-0007Zd-I5; Tue, 20 Dec 2022 12:14:51 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7bWF-0006oD-BH; Tue, 20 Dec 2022 12:14:51 +0000
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
	bh=uMCe5ZawNabjE4S6YMG2J24Rc3wJ0R8acAbho8c8kmQ=; b=O8/vuaTnoz16ot+T/nvlvUFMoD
	V2FbMgeShqUG1gWpQtcCkuuK4F/U1MRFvadm3Q6sM7ckBhoPgM1fKdUvIKpiucHMESmEFUTnH26u7
	VLRRH+BaxRQ9iAPieGTJX890VScbjyRcFBswfuD6Sh+yO+CgEBRctTvrxAotoRWYwcuk=;
Message-ID: <9bd1a0a4-5d12-6984-0eb9-ed10303d5aae@xen.org>
Date: Tue, 20 Dec 2022 12:14:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [XEN v3] xen/arm: Probe the entry point address of an uImage
 correctly
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Michal Orzel
 <michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221217193801.19485-1-ayan.kumar.halder@amd.com>
 <75635251-5f51-fbe0-28be-a99480541116@amd.com>
 <6e2b1f97-3e72-34b9-8faa-f00e79587b39@xen.org>
 <e2101505-ef3e-59f7-be2c-351ca9363249@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e2101505-ef3e-59f7-be2c-351ca9363249@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 20/12/2022 10:44, Ayan Kumar Halder wrote:
>>>> +
>>>> +    /*
>>>> +     * Currently, we support uImage headers for uncompressed images 
>>>> only.
>>>> +     * Thus, it is valid for the load address and start address to 
>>>> be the
>>>> +     * same. This is consistent with the uboot behavior (Refer
>>>> +     * "case IH_COMP_NONE" in image_decomp().
>>> Please make it clear that you are referring to uboot function.
>>
>> Could we avoid to mention the u-boot function? The reason I am asking 
>> is the code is in a different repo and the function name can easily 
>> change without us noticing (so the comment would rot).
>>
>> Is the behavior documented somewhere in U-boot (or online)? If not, 
>> what's the guarantee that it will not change?
> 
> I could not find any documentation which states this. I found this from 
> the following in uboot source code.
> 
> https://source.denx.de/u-boot/u-boot/-/blob/master/boot/image.c#L458
> 
> AFAIU when kernel_uimage_probe() get invoked, the image has already been 
> decompressed. So, I added this as a limitation.

I e looked at the U-boot code and, AFAIU, the check is merely to avoid 
the memcpy() if the image start matches the start of the decompression 
area. So I don't understand why we need the limitation in Xen.

Now the lack of documentation (or at least I didn't find any) makes a 
bit more tricky to understand what the fields in the U-boot header are 
for. I have skimmed through the code and I disagree with the 
implementation you chose for Xen.

The comment for 'ih_ep' suggests this is the entry point address. That's 
may be different from the beginning of your blob. I think this is what 
ih_load is for.

So I think we want to load the blob at ih_load and then set pc to point 
to ih_ep. This will require a bit more work in Xen because the 
assumption so far is the entry point matches the start of the blob.

Please let me known if I missed anything.

Cheers,

-- 
Julien Grall

