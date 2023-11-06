Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD3E7E1D59
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 10:39:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627847.978687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzw4w-0004E8-LO; Mon, 06 Nov 2023 09:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627847.978687; Mon, 06 Nov 2023 09:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzw4w-0004Bh-In; Mon, 06 Nov 2023 09:39:30 +0000
Received: by outflank-mailman (input) for mailman id 627847;
 Mon, 06 Nov 2023 09:39:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qzw4w-0004Bb-0H
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 09:39:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qzw4t-0004o3-Op; Mon, 06 Nov 2023 09:39:27 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qzw4t-0004MU-IM; Mon, 06 Nov 2023 09:39:27 +0000
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
	bh=9FR8jS6PMxDyPj6ghrdzLZwsRjPVGpDiJucwvM8TA4o=; b=17VzvrhsKb4qcWdDtqs1O3yLUT
	CsEsjY/OtM/3GgWzafQbQMiLJoyjLpT2g3tXHKbob90tUTLTlA9uF92iCRI3LNuIWN1CyQjBLhwYQ
	2sFH9ERaxm8tPr73CPnbeAGFFwtmOXft8T86BxrgYuk1h/gGNTJjrNlxA13/ptdVnXN4=;
Message-ID: <80a5c950-242b-467c-8764-8f06e19dc5d4@xen.org>
Date: Mon, 6 Nov 2023 09:39:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Content-Language: en-GB
To: Leo Yan <leo.yan@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <Rahul.Singh@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org>
 <8BCB97B4-CBDD-43D9-B0F8-7F637B8BE559@arm.com>
 <4B2BD200-5D3E-49D5-BF13-65B769AD4B90@arm.com>
 <CANgGJDqHu0CB=zzZqda18giLYDkL3My+gT592GLO-b9HsF2A4g@mail.gmail.com>
 <d3952200-9edb-4de0-94e3-c00c571a10b9@xen.org>
 <794B0D71-70A7-4546-98E0-EC01573E0D89@arm.com>
 <990b21a3-f8c7-4d02-a8ac-63d31794a76d@xen.org>
 <alpine.DEB.2.22.394.2310171258330.965337@ubuntu-linux-20-04-desktop>
 <4fc83e61-1e57-4f75-b017-7045842165e5@xen.org>
 <69be876f-4238-4041-a6ff-50f7f6487d5d@xen.org>
 <20231019093559.GA105208@leoy-huanghe.lan>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231019093559.GA105208@leoy-huanghe.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/10/2023 10:35, Leo Yan wrote:
> Hi Julien,

Hi Leo,


> On Wed, Oct 18, 2023 at 07:11:11PM +0100, Julien Grall wrote:
>> On 18/10/2023 11:59, Julien Grall wrote:
>>> On 17/10/2023 20:58, Stefano Stabellini wrote:
> 
> [...]
> 
>>> I don't really see the problem for someone to mistakenly backport this
>>> patch. In fact, this could potentially save them a lot of debugging if
>>> it happens that Xen is loaded above 2TB.
>>>
>>> Anyway, both Bertrand and you seems to be against the Fixes tag here. So
>>> I can compromise with the "This commit fixes...". However, can Bertrand
>>> or you update process/send-patches.pandoc so it is clear for a
>>> contributor when they should add Fixes tag (which BTW I still disagree
>>> with but if the majority agrees, then I will not nack)?
>>
>> We had a chat about this during the Arm maintainer calls. The disagreement
>> boiled down to the fact that SUPPORT.md (or the documentation) doesn't say
>> anything about whether loading Xen above 2TB was supported or not. Depending
>> on the view, one could consider a bug or not.
>>
>> Looking through the documentation, the best place to document might actually
>> be misc/arm/booting.txt where we already have some requirements to boot Xen
>> (such the binary must be entered in NS EL2 mode).
>>
>> I will prepare a patch and send one.
> 
> 
> I would like to check if here is anything specific I should follow up
> on. Based on the discussion in this thread, I've come to the following
> conclusions:
> 
> - Remove the fixes tags;
> - Add a description in commit log, something like:
>    "Since commit 1c78d76b67e1 ('xen/arm64: mm: Introduce helpers to
>     prepare/enable/disable the identity mapping'), Xen will fail to boot
>     up if it's loaded in memory above 2TB. This commit fixes the
>     regression introduced by that commit."
> - Add tages:
>    A review tag from Michal Orzel
>    A review tag from Bertrand Marquis
>    A test tag from Henry Wang
> 
> Should I repin a new patch set to address the items mentioned above?

You will also want to update the documentation after
"docs/arm: Document where Xen should be loaded in
memory"

> 
> Another question is for the 'Release-acked-by' tag.  Henry gave this
> tag, but I don't know how to handle it if I need to respin this patch.
> Seems to me this is a special tag only for release process, so I don't
> need to include it in the new patch, right?

The release-acked-by tag is only necessary during freeze period if the 
patch will land in the next release (i.e. 4.18). In this case, your 
patch will be part of the 4.19, so you can remove the release-acked-by.


If your patch was targeting 4.19, then it is usually fine to keep the 
release-acked-by even for the respin. It means that the release manager 
is happy for the patch to go assuming the patch has all the necessary 
reviews.

Cheers,

-- 
Julien Grall

