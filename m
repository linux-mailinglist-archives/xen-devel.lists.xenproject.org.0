Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C88D7351A1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 12:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550952.860194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBq3-0002pa-R7; Mon, 19 Jun 2023 10:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550952.860194; Mon, 19 Jun 2023 10:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBq3-0002mH-Ny; Mon, 19 Jun 2023 10:10:23 +0000
Received: by outflank-mailman (input) for mailman id 550952;
 Mon, 19 Jun 2023 10:10:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBBq1-0002mB-LC
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 10:10:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBBq0-0001KS-SC; Mon, 19 Jun 2023 10:10:20 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.19.123]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBBq0-00084H-Lu; Mon, 19 Jun 2023 10:10:20 +0000
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
	bh=8YRet5waHLQJcjUaj6iIOEDy7Nta8WPeHCIRmHX8RO8=; b=DMAONFnigzGGScWNZAGtKj6LAg
	EtLK33MKwEWHqJKKgAOIGjCfMZXLAUXxxXcdwp/HAYCHm0Xn5xunllBeKwspIALvl4YDIRe+cEe2Z
	28a+Zo6RohmXY+m8KGClwO9eOIwdFDNm51POUdABcxvHaDDZAW1unqrv4u2lKiwpZfgc=;
Message-ID: <637d2a61-2c30-76a4-60b0-cf4d979c59be@xen.org>
Date: Mon, 19 Jun 2023 11:10:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 2/3] xen/drivers/passthrough/arm/smmu-v3.c: fix
 violations of MISRA C:2012 Rule 3.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1687167502.git.nicola.vetrini@bugseng.com>
 <3f8d720c09d603edcc608b1b73423c35ea8f6e3f.1687167502.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3f8d720c09d603edcc608b1b73423c35ea8f6e3f.1687167502.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/06/2023 10:56, Nicola Vetrini wrote:
> In the file `xen/drivers/passthrough/arm/smmu-v3.c' there are a few occurrences
> of nested '//' character sequences inside C-style comment blocks, which violate
> Rule 3.1. The patch aims to resolve those by removing the nested comments.

I think it is important to understand/explain what was the intention of 
the // before removing them because, IMHO, the new approach doesn't 
convey the same information. Before...

> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com
> Changes:
> - Resending the patch with the right maintainers in CC.
> Changes in V2:
> - Split the patch into a series and reworked the fix.
> - Apply the fix to the arm32 `flushtlb.h' file, for consistency
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>   xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 720aa69ff2..f410863e10 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -1047,10 +1047,10 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>   	 * before we read 'nr_ats_masters' in case of a concurrent call to
>   	 * arm_smmu_enable_ats():
>   	 *
> -	 *	// unmap()			// arm_smmu_enable_ats()
> +	 *	unmap()				arm_smmu_enable_ats()

... with the // it would be clearer that the code below belongs to each 
function. But now, it leads to think there are a call to 'unmap' which 
it then followed by TLBI+SYNC.

In this case, I would propose to use --- <function> ---

>   	 *	TLBI+SYNC			atomic_inc(&nr_ats_masters);
>   	 *	smp_mb();			[...]
> -	 *	atomic_read(&nr_ats_masters);	pci_enable_ats() // writel()
> +	 *	atomic_read(&nr_ats_masters);	pci_enable_ats() (i.e. writel())

NIT: I think 'see' would be better than 'i.e.' because I read it as 
pci_enable_ats() is a simple writel().

>   	 *
>   	 * Ensures that we always see the incremented 'nr_ats_masters' count if
>   	 * ATS was enabled at the PCI device before completion of the TLBI.

Cheers,

-- 
Julien Grall

