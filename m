Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC56523705
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 17:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327052.549763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noo8a-0008Hp-FB; Wed, 11 May 2022 15:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327052.549763; Wed, 11 May 2022 15:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noo8a-0008Ei-BX; Wed, 11 May 2022 15:20:28 +0000
Received: by outflank-mailman (input) for mailman id 327052;
 Wed, 11 May 2022 15:20:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1noo8Z-0008Ec-3F
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 15:20:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noo8X-00015G-BM; Wed, 11 May 2022 15:20:25 +0000
Received: from [54.239.6.188] (helo=[192.168.11.111])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noo8X-0004gk-5D; Wed, 11 May 2022 15:20:25 +0000
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
	bh=AoyzRwKRQDEYaL14LCRpgZDSJ6aVZI7D/QQ/aSpKcCQ=; b=JyO0tDnnmGqpVXV9fVeeu8zN4u
	OoHUnx37JEO1uL0T+vnwCoDU3WcEUqnbjiIBO7kDAQAj+NuJYRKk0CWqx0+a8SivA9okdj52q6BLp
	s0KEV3DlOIkkHtjtqxNA9B6RYA5Pr2SA/pjw/8j6bgcNjZLDnkkq1u373AeazFVMi6IY=;
Message-ID: <19a140a9-f8a3-79d6-54fa-a873dab6ff42@xen.org>
Date: Wed, 11 May 2022 16:20:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <832955382caa4ced744ec7894282592b62e8cf61.1651570561.git.bertrand.marquis@arm.com>
 <a05b426c-1800-a365-5b02-f82f0a391306@xen.org>
 <2E66F8B4-4DDA-47E2-B93C-E36FEB70F552@arm.com>
 <f1315848-fe9e-b365-bbf6-a596abc6e0de@xen.org>
 <31F40037-3A43-4F94-8C03-D9F939DAF8C6@arm.com>
 <139b3f6c-ebb9-6ed2-f173-a7dbd3c94a95@xen.org>
 <alpine.DEB.2.22.394.2205091857230.43560@ubuntu-linux-20-04-desktop>
 <BCE017C4-53AA-4918-AEBD-D3CCEF0913F4@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <BCE017C4-53AA-4918-AEBD-D3CCEF0913F4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/05/2022 15:41, Bertrand Marquis wrote:
> 
> 
>> On 10 May 2022, at 03:03, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Wed, 4 May 2022, Julien Grall wrote:
>>>> Do I understand right that it is ok for you if I push one patch mentioning
>>>> all the commits done in Linux corresponding to the changes (instead of one
>>>> patch per commit) ?
>>>
>>> For this case yes.
>>
>> I managed to do a review of the patch by doing a diff of the relevant
>> portion of Xen cpufeature.c with Linux cpufeature.c (from commit
>> b2d229d4ddb1), and the relevant portion of Xen sysregs.h with Linux
>> sysregs.h (diff -E -b -u).
>>
>> Everything checks out.
>>
>> In my opinion, this patch should be split in 2 patches: the changes to
>> cpufeature.c and sysregs.c that come from the Linux sources; and the
>> updates to cpufeature.h that do not. If you do that you can add my
>> reviewed-by to the first patch with the changes from Linux.
>>
>> The list of individual commit IDs would be nice, but thanksfully the two
>> source files are still "diffable" so in my opinion are not required.
> 
> I agree with that.
> 
> Julien: Do you agree if I just put the changes to cpufeature.h in a separate patch ?
> 
> I started to list the commit IDs corresponding to the changes in Linux and this would
> end up with 5 or more which I do not think would be that useful as the diff can be easily
> done as Stefano mentioned.

It looks like there are some confusion why I asked the list of commit. 
For this case, this is not about diffing the code (it is easy to do and 
I have already done that). It is more about authorship and where the 
patches come from.

Technically, speaking you only copied the code from Linux and therefore 
you are not the author of some of the changes.

For such case, our general process is:
   1) Backport the commit as-is (i.e the Author is the original Author)
   2) Add the tag Origin (recently introduced)
   3) Add your signed-off-by

I understand the patch is already written, so I was OK if you simply 
list of the commits with the authors/tags for this time.

If both Stefano and you agree to not keep the authorships, then I will 
not stand against it. However, I will not get involved in committing and 
adding my ack.

Cheers,

-- 
Julien Grall

