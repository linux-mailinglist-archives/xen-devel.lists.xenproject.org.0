Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7577C819E7E
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657747.1026815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFv8h-000496-Pv; Wed, 20 Dec 2023 11:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657747.1026815; Wed, 20 Dec 2023 11:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFv8h-00047K-NG; Wed, 20 Dec 2023 11:53:27 +0000
Received: by outflank-mailman (input) for mailman id 657747;
 Wed, 20 Dec 2023 11:53:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFv8g-00047E-79
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:53:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFv8f-0003Xm-FO; Wed, 20 Dec 2023 11:53:25 +0000
Received: from 82-132-247-3.dab.02.net ([82.132.247.3] helo=[172.20.10.6])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFv8f-0002L3-8T; Wed, 20 Dec 2023 11:53:25 +0000
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
	bh=0YP6kYRpZoc3bS+mdJ3p54xJAiVFhVSSQCkSJuUBLok=; b=v1tdwLkEt48eznNNhKifTiaaaT
	/8pkJ1MfAuoGepqWQtD6Sw2LMZ0tyFAy9vrxz5GV8MY5yIBvESguGWcjAz5sl5W8LcyjvMrFeDZum
	0bGiTvPEFIStUvRNPODQu9rM+IUIV0neaoIcB8LWp8S5p8J1FnaMyezta/e4Dm26PWcA=;
Message-ID: <929aea0c-722e-46fe-aee4-a5c87ad22bd4@xen.org>
Date: Wed, 20 Dec 2023 11:53:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/7] xen/arm: mem_access: address violations of MISRA
 C:2012 Rule 16.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <d7a015aaa54fb4722d4970f0f40789efe4d994f9.1703066935.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d7a015aaa54fb4722d4970f0f40789efe4d994f9.1703066935.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Federico,

On 20/12/2023 11:03, Federico Serafini wrote:
> Refactor of the code to have a break statement at the end of the
> switch-clause. This addresses violations of Rule 16.3
> ("An unconditional `break' statement shall terminate every
> switch-clause").
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   xen/arch/arm/mem_access.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/mem_access.c b/xen/arch/arm/mem_access.c
> index 31db846354..fbcb5471f7 100644
> --- a/xen/arch/arm/mem_access.c
> +++ b/xen/arch/arm/mem_access.c
> @@ -168,10 +168,10 @@ p2m_mem_access_check_and_get_page(vaddr_t gva, unsigned long flag,
>            * If this was a read then it was because of mem_access, but if it was
>            * a write then the original get_page_from_gva fault was correct.
>            */
> -        if ( flag == GV2M_READ )
> -            break;
> -        else
> +        if ( flag != GV2M_READ )
>               goto err;
> +
> +        break;

On both hunks, I find the original version better as it is easier to 
match with the comment. I also understand that it wouldn't be great to 
add a deviation for this construct. So maybe we should tweak a bit the 
comment?

Anyway, this code is maintained by Tamas, so I will let him confirm 
which version he prefers.

Cheers,

-- 
Julien Grall

