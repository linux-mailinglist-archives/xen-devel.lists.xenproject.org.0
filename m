Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100697C9137
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 01:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616924.959280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRKM-00019A-QE; Fri, 13 Oct 2023 23:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616924.959280; Fri, 13 Oct 2023 23:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRKM-00016K-NJ; Fri, 13 Oct 2023 23:12:18 +0000
Received: by outflank-mailman (input) for mailman id 616924;
 Fri, 13 Oct 2023 23:12:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qrRKL-00016E-Jq
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 23:12:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2bb7974-6a1d-11ee-98d4-6d05b1d4d9a1;
 Sat, 14 Oct 2023 01:12:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0F56C621AE;
 Fri, 13 Oct 2023 23:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43A1C433C7;
 Fri, 13 Oct 2023 23:12:13 +0000 (UTC)
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
X-Inumbo-ID: f2bb7974-6a1d-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697238734;
	bh=c/S0aP8OabNanKcGxYrrLL26ucaA/41ziMV34EFe+vg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DX7pij0mtSuq0i/63ct80Ms3BIbmgEnHjDbaXUd/3XdO9jIb+Nyy7G9NX8gvrZcTL
	 GLKgXvv4CbIFeqM2RCvlDr75NXhlkaT0K8397yQPSukhVxfmcJMw5KsHi5RNupRvDe
	 Fmb0buuSk+kUsQgoDFxlMk209n8EIGZqYxY5Dbgo16iBMWBbf8ED3QIec08yVMlOGy
	 J4VZP+lC//9roMKlXkFsWbeTkhF0wAZy0UYUD+rdnfLle7Pe0/66tJjfRPC/bbg4mf
	 poJa03ZcN8YNj/hrNnV0VvqUmF+v2E04PlpvcaRNsQ7qcFv6WMGHsGdy4iog5FQNdX
	 TCyalDJv21EAA==
Date: Fri, 13 Oct 2023 16:12:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH 02/10] arm/cpufeature: address violations of MISRA
 C:2012 Rule 8.2
In-Reply-To: <3b28dca993cac9391b997c1744218cf4062907df.1697207038.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310131610440.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697207038.git.federico.serafini@bugseng.com> <3b28dca993cac9391b997c1744218cf4062907df.1697207038.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Oct 2023, Federico Serafini wrote:
> Add missing parameter names, no functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/arm/include/asm/cpufeature.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index 8011076b8c..41e97c23dd 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -127,8 +127,8 @@ static inline void cpus_set_cap(unsigned int num)
>  struct arm_cpu_capabilities {
>      const char *desc;
>      u16 capability;
> -    bool (*matches)(const struct arm_cpu_capabilities *);
> -    int (*enable)(void *); /* Called on every active CPUs */
> +    bool (*matches)(const struct arm_cpu_capabilities *caps);

all the implementations of matches I found in xen/arch/arm/cpuerrata.c
actually call the parameter "entry"


> +    int (*enable)(void *ptr); /* Called on every active CPUs */

this one instead is "data"


>      union {
>          struct {    /* To be used for eratum handling only */
>              u32 midr_model;
> @@ -448,10 +448,10 @@ struct cpuinfo_arm {
>  
>  extern struct cpuinfo_arm system_cpuinfo;
>  
> -extern void identify_cpu(struct cpuinfo_arm *);
> +extern void identify_cpu(struct cpuinfo_arm *c);
>  
>  #ifdef CONFIG_ARM_64
> -extern void update_system_features(const struct cpuinfo_arm *);
> +extern void update_system_features(const struct cpuinfo_arm *new);
>  #else
>  static inline void update_system_features(const struct cpuinfo_arm *cpuinfo)
>  {
> -- 
> 2.34.1
> 

