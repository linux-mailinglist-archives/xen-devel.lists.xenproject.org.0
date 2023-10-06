Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9542A7BB44F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 11:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613441.953941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohEK-0004f9-8O; Fri, 06 Oct 2023 09:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613441.953941; Fri, 06 Oct 2023 09:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohEK-0004cS-5B; Fri, 06 Oct 2023 09:34:44 +0000
Received: by outflank-mailman (input) for mailman id 613441;
 Fri, 06 Oct 2023 09:34:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qohEI-0004cM-QD
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 09:34:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qohEI-0001vq-0V; Fri, 06 Oct 2023 09:34:42 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qohEH-0004hD-Px; Fri, 06 Oct 2023 09:34:41 +0000
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
	bh=U0/La1IY/wfhYDshtgUTlQKcZXEOPnGnO8bzLIhlHD8=; b=lxYBmgX8fL+YX/TusqBYtAr9uv
	UCgLCx+yKdvDrGgeYH42iYHIR0+ue3+2XFm8aVTxQ9w2UGD/AV/Wy1xFfuUaJnvWoBXtlC49maqTr
	rFJskyLzOwj3vu1kp4oeirtlPMwGFmbGIOke6lLc0fC6LLrorkCSn7FziunP3+qtZS4k=;
Message-ID: <80101145-1958-457a-8c80-cae816ae74aa@xen.org>
Date: Fri, 6 Oct 2023 10:34:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 8/9] xen/types: address Rule 10.1 for
 DECLARE_BITMAP use
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Paul Durrant
 <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <9642dcb4ab51ec9eaeedf16056fbcd946a3efbea.1696514677.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9642dcb4ab51ec9eaeedf16056fbcd946a3efbea.1696514677.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 06/10/2023 09:26, Nicola Vetrini wrote:
> Given its use in the declaration
> 'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
> 'bits' has essential type 'enum iommu_feature', which is not
> allowed by the Rule as an operand to the addition operator
> in macro 'BITS_TO_LONGS'.
> 
> A comment in BITS_TO_LONGS is added to make it clear that
> values passed are meant to be positive.

I am confused. If the value is meant to be positive. Then...

> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>   xen/include/xen/iommu.h | 2 +-
>   xen/include/xen/types.h | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 0e747b0bbc1c..34aa0b9b5b81 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -360,7 +360,7 @@ struct domain_iommu {
>   #endif
>   
>       /* Features supported by the IOMMU */
> -    DECLARE_BITMAP(features, IOMMU_FEAT_count);
> +    DECLARE_BITMAP(features, (int)IOMMU_FEAT_count);

... why do we cast to (int) rather than (unsigned int)? Also, I think 
this cast deserve a comment on top because this is not a very obvious one.

>   
>       /* Does the guest share HAP mapping with the IOMMU? */
>       bool hap_pt_share;
> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> index aea259db1ef2..936e83d333a0 100644
> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -22,6 +22,7 @@ typedef signed long ssize_t;
>   
>   typedef __PTRDIFF_TYPE__ ptrdiff_t;
>   
> +/* Users of this macro are expected to pass a positive value */
>   #define BITS_TO_LONGS(bits) \
>       (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
>   #define DECLARE_BITMAP(name,bits) \

Cheers,

-- 
Julien Grall

