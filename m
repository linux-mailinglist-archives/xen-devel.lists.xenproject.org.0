Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06316862092
	for <lists+xen-devel@lfdr.de>; Sat, 24 Feb 2024 00:19:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684987.1065310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdepF-0007mR-Mk; Fri, 23 Feb 2024 23:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684987.1065310; Fri, 23 Feb 2024 23:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdepF-0007kC-K8; Fri, 23 Feb 2024 23:19:29 +0000
Received: by outflank-mailman (input) for mailman id 684987;
 Fri, 23 Feb 2024 23:19:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEAM=KA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rdepE-0007k6-GZ
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 23:19:28 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb35dad8-d2a1-11ee-98f5-efadbce2ee36;
 Sat, 24 Feb 2024 00:19:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D58BFCE2DA3;
 Fri, 23 Feb 2024 23:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE2DC433C7;
 Fri, 23 Feb 2024 23:19:18 +0000 (UTC)
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
X-Inumbo-ID: fb35dad8-d2a1-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708730359;
	bh=31gof/eXW9PGdivtf3skAXmx8VLQQWBRudDGTL0QyGo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uXMEnjPeVDU1gOEWBDKg2kotasVjZdHQrx1sJ4L9UaS4VWySq46022t1CJXGkiDNE
	 vRvXSSiOXJRrPuENEibOQAhWWeqWnzMX1BJzBLlgf2oDux2m4L2TbWxzmnH9iB+Ex0
	 tvFkVE+8unyZa21F2Ug1N1e0GhITD5GD+ljsvSWdalqVnYtCoS85i5V5dk0n1E1+h+
	 i7+Kki4d8eTFO6CS00159rar3klcQP/4Zy1cplrwU2ytw7sUIuny6A2/cpd14kkApl
	 fphhmY4hv10Om5QctoWkeeobocbtqQYDmLRtlLFeF9tl4KAEaSSMZfavKDfPXx3opd
	 O+T1KMGlYsvwQ==
Date: Fri, 23 Feb 2024 15:19:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/6] xen/ppc: address violations of MISRA C:2012 Rule
 11.8.
In-Reply-To: <9270a4fe1712cff6a99e60c7862de1c1b2dde3d6.1702982442.git.maria.celeste.cesario@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402231518390.754277@ubuntu-linux-20-04-desktop>
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com> <9270a4fe1712cff6a99e60c7862de1c1b2dde3d6.1702982442.git.maria.celeste.cesario@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Shawn,

I am thinking of committing this, if you disagree please say something
in the next couple of days


On Tue, 19 Dec 2023, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
> headline states:
> "A conversion shall not remove any const, volatile or _Atomic qualification
> from the type pointed to by a pointer".
> 
> Fix violation by adding missing const qualifier in cast.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Adaptation requested by the community to make the code more consistent.
> ---
>  xen/arch/ppc/include/asm/atomic.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/ppc/include/asm/atomic.h b/xen/arch/ppc/include/asm/atomic.h
> index 64168aa3f1..fe778579fb 100644
> --- a/xen/arch/ppc/include/asm/atomic.h
> +++ b/xen/arch/ppc/include/asm/atomic.h
> @@ -16,7 +16,7 @@
>  
>  static inline int atomic_read(const atomic_t *v)
>  {
> -    return *(volatile int *)&v->counter;
> +    return *(const volatile int *)&v->counter;
>  }
>  
>  static inline int _atomic_read(atomic_t v)
> -- 
> 2.40.0
> 

