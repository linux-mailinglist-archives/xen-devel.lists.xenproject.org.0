Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F96813CED
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 22:50:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654773.1022115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtac-0005oh-2H; Thu, 14 Dec 2023 21:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654773.1022115; Thu, 14 Dec 2023 21:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtab-0005mS-Vj; Thu, 14 Dec 2023 21:49:53 +0000
Received: by outflank-mailman (input) for mailman id 654773;
 Thu, 14 Dec 2023 21:49:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDtaZ-0005mM-T8
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 21:49:51 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3f80a0f-9aca-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 22:49:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 643A0CE25C5;
 Thu, 14 Dec 2023 21:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1103C433C8;
 Thu, 14 Dec 2023 21:49:42 +0000 (UTC)
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
X-Inumbo-ID: b3f80a0f-9aca-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702590583;
	bh=2nggg6RuIpS40KC0MJiI6H/jVgFmH7whqAtwDWlWezU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fmC959Z/y98+5nCJgVhmRgPVDFVRzle3ksdpCx1qGpA62mmK7Usjqy52gcoIfud51
	 EraUgFs9xVCzrJ9UaU862boYyCmVzgzVen/8Cef/1+ZTLFa6+RO11si0aFdLJVTEWG
	 P93q3gxsTmHXuogCiZz6lDZVCpvd8IRpVDTrtxiMUk/rL1AyOia/TGV8bPAFrpZsny
	 336iboguwmeS+iNAy95OvFwvKG+C8sYGAVBt2VRKJU4nVvUfxl1/5JXgrWR6ezw7ho
	 j6XoqUYVi0DvXe5kiJORjF7NIAzZDD2zL+FTMGmtetsTBKvxyTEWaaq3oo1gT+tefK
	 qZHw2tS2WavzA==
Date: Thu, 14 Dec 2023 13:49:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 4/9] ACPI: address violations of MISRA C:2012 Rule 11.8
In-Reply-To: <44c8f94bcfe4f0e33e53a7eb8aef826e7d906196.1702555387.git.maria.celeste.cesario@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312141347570.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com> <44c8f94bcfe4f0e33e53a7eb8aef826e7d906196.1702555387.git.maria.celeste.cesario@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Dec 2023, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
> headline states:
> "A conversion shall not remove any const, volatile or _Atomic qualification
> from the type pointed to by a pointer".
> 
> Add missing const qualifiers missing in casting.
> There's no reason to drop the const qualifier in ACPI_COMPARE_NAME since
> the macro arguments are not modified in its body.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> ---
>  xen/include/acpi/acmacros.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/acpi/acmacros.h b/xen/include/acpi/acmacros.h
> index 86c503c20f..d7c74c5769 100644
> --- a/xen/include/acpi/acmacros.h
> +++ b/xen/include/acpi/acmacros.h
> @@ -116,7 +116,7 @@
>  #define ACPI_PTR_TO_PHYSADDR(i)         ACPI_TO_INTEGER(i)
>  
>  #ifndef ACPI_MISALIGNMENT_NOT_SUPPORTED
> -#define ACPI_COMPARE_NAME(a,b)          (*ACPI_CAST_PTR (u32,(a)) == *ACPI_CAST_PTR (u32,(b)))
> +#define ACPI_COMPARE_NAME(a,b)          (*ACPI_CAST_PTR (const u32,(a)) == *ACPI_CAST_PTR (const u32,(b)))

I am a bit confused but this one. The implementation of ACPI_CAST_PTR
is:

#define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_t) (p))

The first cast to acpi_uintptr_t would already drop the const anyway?


>  #else
>  #define ACPI_COMPARE_NAME(a,b)          (!ACPI_STRNCMP (ACPI_CAST_PTR (char,(a)), ACPI_CAST_PTR (char,(b)), ACPI_NAME_SIZE))
>  #endif

Would it make sense to also add the const here too if nothing else for
consistency?

