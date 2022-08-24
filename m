Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F35A59FDAD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 16:59:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392808.631401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrqK-00078Z-32; Wed, 24 Aug 2022 14:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392808.631401; Wed, 24 Aug 2022 14:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrqJ-000758-Vy; Wed, 24 Aug 2022 14:58:55 +0000
Received: by outflank-mailman (input) for mailman id 392808;
 Wed, 24 Aug 2022 14:58:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQrqI-00074Y-Au
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 14:58:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQrqH-0006lY-4m; Wed, 24 Aug 2022 14:58:53 +0000
Received: from [54.239.6.185] (helo=[192.168.29.89])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQrqG-0008MC-Uq; Wed, 24 Aug 2022 14:58:53 +0000
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
	bh=MrPMlo5iJyYxGji08VPI5Kq6oFWDYXvdpdlIMue3GcM=; b=u1zYhw+dzJ2+Rmmm1o99EKAyQr
	IpaZ/0SYiQGDMNLs0xDR4KCOTlouIUNwdizLB+BZxn6l6ma2pZqEfxEMnc05gDjAMg4er91JpgBU1
	OgDgLpejmRGabluf7DVYTmWuAwXY3DfOETrtfHKpxTd46ATgNlwduEPT9I/s6U5chRJo=;
Message-ID: <a8675747-d445-173b-2e1d-f06577303371@xen.org>
Date: Wed, 24 Aug 2022 15:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH 01/10] xen/arm: smmuv3: Fix l1 stream table size in the
 error message
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1661331102.git.rahul.singh@arm.com>
 <bd9bd6a259b99d4a0ebbfa914f54d8091b1865f5.1661331102.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bd9bd6a259b99d4a0ebbfa914f54d8091b1865f5.1661331102.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 24/08/2022 14:53, Rahul Singh wrote:
> Backport Linux commit dc898eb84b25c39ea46f28c48a169bdbd0e2c7e0
> iommu/arm-smmu-v3: Fix l1 stream table size in the error message

We have a tag for this (see Origin). If you use it, then...

> 
> Original commit message:

You don't need to add "original commit message" here and the content is 
exactly the same.

>      iommu/arm-smmu-v3: Fix l1 stream table size in the error message
>      The actual size of level-1 stream table is l1size. This looks like
>      an oversight on commit d2e88e7c081ef ("iommu/arm-smmu: Fix LOG2SIZE
>      setting for 2-level stream tables") which forgot to update the @size
>      in error message as well.
> 
>      As memory allocation failure is already bad enough, nothing worse
>      would happen. But let's be careful.
> 
>      Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>

AFAICT, you didn't make any change to this patch. So the "From:" should 
still be from Zenghui Yu. For an example how to do backport, see
9c432b876bf518866d431bda73f2be1250f688eb "x86/mwait-idle: add SPR support".

Also, it would be good to clarify whether they are clean backport and 
required some changes (other than context changes). I assume they are 
clean backports?

The same applies for all the patches in this series.

>      Link: https://lore.kernel.org/r/20200826141758.341-1-yuzenghui@huawei.com
>      Signed-off-by: Will Deacon <will@kernel.org>
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/drivers/passthrough/arm/smmu-v3.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index f2562acc38..340609264d 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2348,7 +2348,7 @@ static int arm_smmu_init_strtab_2lvl(struct arm_smmu_device *smmu)
>   	if (!strtab) {
>   		dev_err(smmu->dev,
>   			"failed to allocate l1 stream table (%u bytes)\n",
> -			size);
> +			l1size);
>   		return -ENOMEM;
>   	}
>   	cfg->strtab = strtab;

Cheers,

-- 
Julien Grall

