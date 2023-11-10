Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916D07E7B71
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 11:40:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630103.982816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1OvW-0006GX-F1; Fri, 10 Nov 2023 10:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630103.982816; Fri, 10 Nov 2023 10:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1OvW-0006EM-BL; Fri, 10 Nov 2023 10:39:50 +0000
Received: by outflank-mailman (input) for mailman id 630103;
 Fri, 10 Nov 2023 10:39:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r1OvV-0006EF-Fw
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 10:39:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1OvQ-0002RU-QZ; Fri, 10 Nov 2023 10:39:44 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1OvQ-0007Hr-LG; Fri, 10 Nov 2023 10:39:44 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=uNYUXLEdZToipBSCSClVg7nfkMGnFYqfm8GISRWDVXo=; b=XKwdOR6+0oNS5HNVzu/LXxezeL
	6Ep9h54gAurPqWLLYNWYd7jZGV05hFS0dPohj9LAMUrtMM6W+3AXW9x4V3n3Jj67FHS2+cCmIOGeI
	i3zD3tGZiePcTL4x/TyKDifHBxKA17l6rKOOueg5p8p08jaQ+szcxwNmtKva87lYnZQ4=;
Message-ID: <eb5b015c-0697-469b-be87-b933831fc351@xen.org>
Date: Fri, 10 Nov 2023 10:39:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Use hex for bitstream_size as expected by u-boot
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 viryaos-discuss@lists.sourceforge.net
Cc: xen-devel@lists.xenproject.org, brian@woods.art
References: <alpine.DEB.2.22.394.2311091740490.3478774@ubuntu-linux-20-04-desktop>
 <329849be-f2c1-4ca6-8b97-b288d163aeb1@xen.org>
 <dbab3224-a15b-41b4-9a1f-bef4222f3a9d@amd.com>
 <50ad4fb5-77c4-44f3-80cf-a2555d595e10@xen.org>
In-Reply-To: <50ad4fb5-77c4-44f3-80cf-a2555d595e10@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/11/2023 10:08, Julien Grall wrote:
> 
> 
> On 10/11/2023 10:01, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 10/11/2023 10:27, Julien Grall wrote:
>>>
>>>
>>> Hi Stefano,
>>>
>>> On 10/11/2023 01:44, Stefano Stabellini wrote:
>>>> Reported-by: Brian Woods <brian@woods.art>
>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>
>>>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>>>> index b284887..6e52da5 100755
>>>> --- a/scripts/uboot-script-gen
>>>> +++ b/scripts/uboot-script-gen
>>>> @@ -790,7 +790,7 @@ bitstream_load_and_config()
>>>>            check_file_type "$BITSTREAM" "BIT data"
>>>>            bitstream_addr=$memaddr
>>>>            load_file $BITSTREAM "fpga_bitstream"
>>>> -        bitstream_size=$filesize
>>>> +        bitstream_size=`printf "0x%X\n" $filesize`
>>>
>>> Looking at [1], there is no indication that the size parameter for "fpga
>>> load" should be hexadecimal. At the contrary, all the example I have
>>> found seems to use $filesize.
>> U-boot expects size to be passed in hex format. You can see it here:
>> https://github.com/u-boot/u-boot/blob/master/cmd/fpga.c#L60C20-L60C27
>>
>> Also, AFAICT $filesize var that gets updated after image load (e.g. 
>> tftpb) is in hex format.
> 
> Hmmm, now that you are saying this... I vaguely recall we had some 
> issues in the past with the size. The format was not consistent across 
> U-boot.
> 
> Maybe this is the same problem here?

I had a chat with Michal on Matrix. 'filesize' is a variable internal to 
the image-builder rather than U-boot. Hence the confusion.

The variable will be set in decimal. So it needs to be converted to 
hexadecimal. So the code seems to be correct.

That said, I think some clarifications is needed in the commit message 
to help understanding the code and at least giving a hint whether this 
code was ever tested (or this was introduced by a follow-up change).

Cheers,

-- 
Julien Grall

