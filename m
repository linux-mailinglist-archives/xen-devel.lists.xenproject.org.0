Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2EC761BA0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 16:28:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569729.890718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJ11-0003ca-Gt; Tue, 25 Jul 2023 14:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569729.890718; Tue, 25 Jul 2023 14:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJ11-0003ak-Cn; Tue, 25 Jul 2023 14:27:55 +0000
Received: by outflank-mailman (input) for mailman id 569729;
 Tue, 25 Jul 2023 14:27:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qOJ10-0003ad-2V
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 14:27:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOJ0y-0003dY-Tc; Tue, 25 Jul 2023 14:27:52 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.17.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOJ0y-0006S0-M4; Tue, 25 Jul 2023 14:27:52 +0000
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
	bh=RzJckpnz3evDMZSeIJfRFcPgovOnF5f1qG9MwpUxOAY=; b=mwRDQslIW1A7T8AWpp87T8kYzI
	tbAqiGYlnDTRidWuv2JPcQ/whirlxEMAGU+YSXhiG/W+M8DPNiEZNBMKkxIRhmv2WS0SgNOYVzYvP
	la3KL7pF2s5dzImS485J0LB10Piw8aVf91GZCZcrtCm4UhEJOgIvIHllupUJ+P5NNKDI=;
Message-ID: <dc76516e-2334-798a-216e-5ad983fea2f9@xen.org>
Date: Tue, 25 Jul 2023 15:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 6/8] mm/pdx: Standardize region validation wrt pdx
 compression
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-7-alejandro.vallejo@cloud.com>
 <1eb58b83-87ee-d738-08b0-948a8b48773a@xen.org>
 <64be6c1c.7b0a0220.49ba9.0e38@mx.google.com>
 <79ecab0a-cb91-cc95-fd31-c76ec287fa9b@xen.org>
 <0d28d9cd-8cb3-6d03-94d3-e07a4dab9e95@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0d28d9cd-8cb3-6d03-94d3-e07a4dab9e95@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/07/2023 07:51, Jan Beulich wrote:
> On 24.07.2023 20:20, Julien Grall wrote:
>> On 24/07/2023 13:18, Alejandro Vallejo wrote:
>>> On Fri, Jul 21, 2023 at 06:05:51PM +0100, Julien Grall wrote:
>>>> Hi Alejandro,
>>>>
>>>> On 17/07/2023 17:03, Alejandro Vallejo wrote:
>>>>> +bool pdx_is_region_compressible(unsigned long smfn, unsigned long emfn)
>>>>
>>>> For newer interface, I would rather prefer if we use start + size. It is
>>>> easier to reason (you don't have to wonder whether 'emfn' is inclusive or
>>>> not) and avoid issue in the case you are trying to handle a region right at
>>>> the end of the address space as emfn would be 0 in the non-inclusive case
>>>> (not much a concern for MFNs as the last one should be invalid, but it makes
>>>> harder to reason).
>>> I could agree on this, but every single caller is based on (smfn, emfn),
>>> so it needlessly forces every caller to perform conversions where the
>>> callee can do it just once.
>>
>> That's indeed one way to see it. The problem is that...
>>
>>> That said, I think your point makes sense and
>>> it ought to be done. Probably as as part of a bigger refactor where
>>> (smfn, emfn)-based functions are turned into (base, len) variants.
>>
>> ... clean-up tends to be put in the back-burner and we just continue to
>> add new use. This makes the task to remove every use a lot more
>> difficult. So there is a point when one has to say no more.
>>
>> Therefore, I would strongly prefer if each callers are doing the
>> computation. The rest can be removed leisurely.
>>
>> Let see what the opinion of the other maintainers.
> 
> I think [a,b] ranges are fine to pass, and may even be preferable over
> passing a size. I'm specifically using that term that you also used:
> "size" (or "length") is ambiguous when talking about page granular
> items - is it in bytes or number of pages?

I was referring to the number of pages. I don't think it make sense to 
have it in bytes given the start is a frame.

> Especially in the former
> case calculations at the call sites would be quite a bit more cumbersome.
> I could agree with (mfn,nr) tuples

Ok. So your objection of my proposal is just about the name, right? If 
so, I didn't put too much thought behind the naming when I sent my 
original e-mail. I am open to any.

, but as said I think inclusive
> ranges are also fine to use (and would be less of a problem at the call
> sites here, afaics).

The problem with range is that it can lead to confusion on whether the 
end is inclusive or exclusive. We had one bug recently in the Arm PCI 
code because of that.

So I would like to get rid of any use of range in new functions.

Cheers,

-- 
Julien Grall

