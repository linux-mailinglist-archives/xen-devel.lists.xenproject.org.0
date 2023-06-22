Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB67A73A8A2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 20:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553925.864784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCPS7-000246-RW; Thu, 22 Jun 2023 18:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553925.864784; Thu, 22 Jun 2023 18:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCPS7-00021U-O7; Thu, 22 Jun 2023 18:54:43 +0000
Received: by outflank-mailman (input) for mailman id 553925;
 Thu, 22 Jun 2023 18:54:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yL9z=CK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qCPS6-00021M-Fh
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 18:54:42 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bbe0d4d-112e-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 20:54:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F232D828554F;
 Thu, 22 Jun 2023 13:54:35 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Ro1pbrQrMdhq; Thu, 22 Jun 2023 13:54:35 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 453F08285A1F;
 Thu, 22 Jun 2023 13:54:35 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hGU5Yf0RkzK1; Thu, 22 Jun 2023 13:54:35 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C4025828554F;
 Thu, 22 Jun 2023 13:54:34 -0500 (CDT)
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
X-Inumbo-ID: 3bbe0d4d-112e-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 453F08285A1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687460075; bh=nNzeHRBiMlVeNzFoQxxw/cK9irkYLQ3DWPBJ3g5MLPo=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=J6y7ghLdG1MkzzTMHBpPc8WMgWwIa90NMW0qAO0Rv8c3S4bubjUUzh11UxYE0ZvBN
	 px9kaRH3Gt4BwWvSADWQFHidPPAxpmYUXjvoOfuTJu/Ta7oypnTQdUGKDdSY4StTuV
	 8tv/1SUensXjzOhfhd0fs6x5uD1Oa292l653/gAY=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <8fdb87a3-7ae6-6435-0988-1ea1926d2a2b@raptorengineering.com>
Date: Thu, 22 Jun 2023 13:54:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
 <259298cdadf7cf1eba08cd35c636e9aca9e2182a.1687366665.git.sanastasio@raptorengineering.com>
 <4fc1fcee-e210-fe16-f762-3f23700d51b9@xen.org>
 <eb810a53-ee10-d8a1-b983-ee8dcf02f07a@raptorengineering.com>
 <e4f061df-2479-3441-a811-5379ea5ae52b@xen.org>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <e4f061df-2479-3441-a811-5379ea5ae52b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/23 11:43 AM, Julien Grall wrote:
> Hi,

Thanks for the response. I had one more question with regards to the
emacs footer.

>All files usually have an emacs magic block. E.g.:
>
>/*
> * Local variables:
> * mode: C
> * c-file-style: "BSD"
> * c-basic-offset: 4
> * indent-tabs-mode: nil
> * End:
> */

Is this absolutely necessary to include? The CODING_STYLE document seems
to imply that it's optional and a quick peek at other architectures'
code suggests that this is the case.

If it is required, should it also be included in assembly files, or only
.c/.h ones?

>>> This seems to be refactoring. It would be best if this is done in a
>>> separate patch as this is easier to review.
>>
>> Following Andrew's suggestion earlier, I've split this patch into two
>> with the first one only doing the bare minimum to get an infinite loop
>> going in C rather than assembly. That first patch still includes the
>> refactoring of this trampoline into a macro, but the overall patch size
>> is much smaller. Do you think that would be fine to review, or would you
>> like a third commit for only this trampoline's refactoring?
> 
> In general we tend to split code movement/refactoring from new code.
> This helps during reviews. Not sure how small will be your patch. If it
> is only a few dozen of lines, then it should be fine :).

Makes sense, thanks.

> Cheers,

Thanks,
Shawn

