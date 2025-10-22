Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B6CBFE81F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 01:15:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148521.1480499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBi2b-0001bM-21; Wed, 22 Oct 2025 23:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148521.1480499; Wed, 22 Oct 2025 23:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBi2a-0001YT-VP; Wed, 22 Oct 2025 23:14:48 +0000
Received: by outflank-mailman (input) for mailman id 1148521;
 Wed, 22 Oct 2025 23:14:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OYne=47=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vBi2a-0001YN-0i
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 23:14:48 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5397da5-af9c-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 01:14:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9C0B344F86;
 Wed, 22 Oct 2025 23:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586AEC4CEE7;
 Wed, 22 Oct 2025 23:14:42 +0000 (UTC)
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
X-Inumbo-ID: e5397da5-af9c-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761174883;
	bh=WiljlZzs+AD7oKJMv/iLoVv0hl3roM++6LHX2IMRJKI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t0RjZpB6td1qQQiDfzM8HFZW19Z/91Q6OAOD3PwcjXgbOiclMaLZou8XJmRZP89KX
	 jqL9fbHZOnR/c63p3tdTXdhsd0dXSknNKgcT4I4cMt/MfsAQK63lcPbyP/6afxuK9t
	 w48XCS0PmKV8mHASeRSrJuhXHcQe0vsZnBBPVCtwBLhB83e3EUM9oTK/CvHydcLGCM
	 tnPyOJQySHeH6eP6v9p1vzO2CHWvLuMYmehjP7q/EBikv1VBTW1geUfZc80nvO8a7p
	 w+HQ1dJhkeyauGmciFRchstVWYskKOCImTFQWGa/J1gAOwP1Us5TFow1q2TDUMsObt
	 IDV42YSdi6+dQ==
Date: Wed, 22 Oct 2025 16:14:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] x86/mm: correct PG_log_dirty definition again
In-Reply-To: <1fd73d73-ba59-4826-8940-4c557db5775c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2510221614330.495094@ubuntu-linux-20-04-desktop>
References: <1fd73d73-ba59-4826-8940-4c557db5775c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Oct 2025, Jan Beulich wrote:
> The earlier change wasn't correct as far as shim-exclusive mode goes:
> Shadow mode is still to be enabled permitted there, yet the generic
> paging-log-dirty (and more generally domctl) part of the code still is
> unwanted (and cannot be used anyway, as domctl_lock_acquire() isn't
> available).
> 
> Fixes: 2ae8a68df21e ("x86/mm: correct PG_log_dirty definition")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> While a backwards move, properly untangling this will need to be left for
> later, I expect.

I also had considered this set of changes as an alternative of the
SHADOW_PAGING kconfig change I made. I tested this patch together with
mine and everything looks good so far:
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines

Tested-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I'll resend both patches together for simplicity.


> --- a/xen/arch/x86/include/asm/paging.h
> +++ b/xen/arch/x86/include/asm/paging.h
> @@ -55,7 +55,7 @@
>  #define PG_translate   0
>  #define PG_external    0
>  #endif
> -#ifdef CONFIG_PAGING
> +#if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
>  /* Enable log dirty mode */
>  #define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
>  #else
> --- a/xen/include/hypercall-defs.c
> +++ b/xen/include/hypercall-defs.c
> @@ -197,7 +197,7 @@ dm_op(domid_t domid, unsigned int nr_buf
>  #ifdef CONFIG_SYSCTL
>  sysctl(xen_sysctl_t *u_sysctl)
>  #endif
> -#if defined(CONFIG_X86) && defined(CONFIG_PAGING)
> +#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
>  paging_domctl_cont(xen_domctl_t *u_domctl)
>  #endif
>  #ifndef CONFIG_PV_SHIM_EXCLUSIVE
> @@ -298,7 +298,7 @@ dm_op                              compa
>  hypfs_op                           do       do       do       do       do
>  #endif
>  mca                                do       do       -        -        -
> -#if defined(CONFIG_X86) && defined(CONFIG_PAGING)
> +#if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
>  paging_domctl_cont                 do       do       do       do       -
>  #endif
>  
> 

