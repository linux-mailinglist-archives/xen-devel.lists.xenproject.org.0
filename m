Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D53D86D711
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 23:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687438.1070894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfpIL-0008Dn-AO; Thu, 29 Feb 2024 22:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687438.1070894; Thu, 29 Feb 2024 22:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfpIL-0008BL-7h; Thu, 29 Feb 2024 22:54:29 +0000
Received: by outflank-mailman (input) for mailman id 687438;
 Thu, 29 Feb 2024 22:54:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rfpIK-0008BF-Lv
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 22:54:28 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c351b00-d755-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 23:54:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 39330CE0C50;
 Thu, 29 Feb 2024 22:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C074CC433C7;
 Thu, 29 Feb 2024 22:54:21 +0000 (UTC)
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
X-Inumbo-ID: 7c351b00-d755-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709247263;
	bh=VkgVlGf55lYhsVQXFsP5IwERQXeaYSut5Ug7KUjjAe8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T5y2IF386+sr4RcSUt2F3wmvKv2XuytRJM90r+RsksDFJ/maIR7XvUIa2It3piPOm
	 eLNa1UcZYRbpzWreIb+6i2N/XCGSWtxywESglmXz4nBQoWz49enJtRacuI57XgxOLp
	 r0KWBRj8O5VisOu9SGuQ7cW3s1QQPo6GlJvl0L2n7xmRr6BCVw9qLZCHpIjLopW8hd
	 NhlQV4CzjF5/JOG7luB2gnSWdUhvEMDbY8uW3nCBnWou8Sqpqhh2xsmzlSLAC4JiWD
	 mUukxyhimaAX80Qd+CNcdShex+zKdez+j9xtDBAKy71GFHBPQEVXulzqOb8NS9240Q
	 kEdLvjuRUYS4A==
Date: Thu, 29 Feb 2024 14:54:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, julien@xen.org, 
    Rahul Singh <rahul.singh@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 07/10] xen/arm: smmuv3: address violations of MISRA
 C Rule 20.7
In-Reply-To: <a11cd3f9c3dc64d67df14d8b7527b7467d46f573.1709219010.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402291454110.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com> <a11cd3f9c3dc64d67df14d8b7527b7467d46f573.1709219010.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Feb 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index c3ac6d17d1c8..b1c40c2c0ae7 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -111,7 +111,7 @@
>  #define GFP_KERNEL		0
>  
>  /* Device logger functions */
> -#define dev_name(dev)	dt_node_full_name(dev->of_node)
> +#define dev_name(dev)	dt_node_full_name((dev)->of_node)
>  #define dev_dbg(dev, fmt, ...)			\
>  	printk(XENLOG_DEBUG "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
>  #define dev_notice(dev, fmt, ...)		\
> -- 
> 2.34.1
> 

