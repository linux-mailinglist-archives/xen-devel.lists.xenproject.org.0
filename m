Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2304FB10C7D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 16:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056115.1424260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewVP-0004N2-Pt; Thu, 24 Jul 2025 14:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056115.1424260; Thu, 24 Jul 2025 14:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewVP-0004LJ-N3; Thu, 24 Jul 2025 14:01:07 +0000
Received: by outflank-mailman (input) for mailman id 1056115;
 Thu, 24 Jul 2025 14:01:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uewVO-0004LB-72
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:01:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uewVN-00GatI-2e;
 Thu, 24 Jul 2025 14:01:05 +0000
Received: from [2a01:cb15:80df:da00:e2a9:ff82:7bde:38cd] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uewVN-00AeXh-1U;
 Thu, 24 Jul 2025 14:01:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=1gkwL/f/Bs2Hd7mop+5oGzplrr4iufBxF+eyGEah/V8=; b=VYvQzUn5UHDt2IlzbEbWBiyyB8
	/pIQWx9EgrGKXY5t/Ib1/pEIXvEdVWn2X1/t5yMsz2WBScM6frew+P961hnLMkHRmBVuW3gz9sf4C
	KMjfp0JFR0j/t0dOtrYjUR8zrTL0rHY8XZxw3d+s7o0eviuIof5XkjMNPO/C14IO0AYA=;
Date: Thu, 24 Jul 2025 16:00:48 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 2/4] tools/xl: Allow compilation of 'xl resume'
 command on Arm
Message-ID: <aII8kN1fmrLKb8ek@l14>
References: <cover.1753349108.git.mykola_kvach@epam.com>
 <48ea1dfb5bbcbc993332acb8508060d7cba342fc.1753349109.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48ea1dfb5bbcbc993332acb8508060d7cba342fc.1753349109.git.mykola_kvach@epam.com>

On Thu, Jul 24, 2025 at 12:40:57PM +0300, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> The "xl resume" command was previously excluded from Arm builds because
> system suspend/resume (e.g., SYSTEM_SUSPEND via vPSCI) was not
> implemented. On x86, this command is used for ACPI S3 suspend/resume.
> 
> This change enables compilation of `xl resume` on Arm regardless of the
> underlying implementation status, making the tool available for testing
> and future feature support. The relevant libxl infrastructure and handler
> functions are already present and usable.
> 
> The macro `LIBXL_HAVE_NO_SUSPEND_RESUME` has been renamed to
> `LIBXL_HAVE_NO_SUSPEND` to better reflect the updated semantics.
> 
> Note: This does not imply full system suspend/resume support on Arm.
>       The `xl suspend` command still does not work on Arm platforms.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v6:
> - Renamed macro from LIBXL_HAVE_NO_SUSPEND_RESUME to LIBXL_HAVE_NO_SUSPEND
>   to better reflect the scope of this change
> - Applied cosmetic changes based on review feedback
> ---
>  tools/include/libxl.h     |  5 ++---
>  tools/xl/xl.h             | 10 +++++-----
>  tools/xl/xl_cmdtable.c    |  8 ++++----
>  tools/xl/xl_migrate.c     |  4 ++--
>  tools/xl/xl_saverestore.c |  4 ++--
>  tools/xl/xl_vmcontrol.c   | 14 +++++++-------
>  6 files changed, 22 insertions(+), 23 deletions(-)
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index d6b6e5d2dd..632264912a 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -1128,17 +1128,16 @@ typedef struct libxl__ctx libxl_ctx;
>  #define LIBXL_HAVE_SIGCHLD_SHARING 1
>  
>  /*
> - * LIBXL_HAVE_NO_SUSPEND_RESUME
> + * LIBXL_HAVE_NO_SUSPEND
>   *
>   * Is this is defined then the platform has no support for saving,
>   * restoring or migrating a domain. In this case the related functions
>   * should be expected to return failure. That is:
>   *  - libxl_domain_suspend
> - *  - libxl_domain_resume
>   *  - libxl_domain_remus_start
>   */
>  #if defined(__arm__) || defined(__aarch64__)
> -#define LIBXL_HAVE_NO_SUSPEND_RESUME 1
> +#define LIBXL_HAVE_NO_SUSPEND 1
>  #endif

I'm sorry, if you remove LIBXL_HAVE_NO_SUSPEND_RESUME, you have to
implement all the function listed. I'm pretty sure `libvirt` isn't going
to build (on arm) if you remove that macro... Actually, libvirt is going
to build, it's going to expect migration to work, and probably allow to
try to migrate Arm VMs instead of bailing out early.

I wonder what this LIBXL_HAVE_NO_SUSPEND_RESUME is for, since you don't
make any changes to libxl (tools/libs/light), but only to program that
make use of it.

Looking at 3ac3817762d1 ("xl: suppress suspend/resume functions on platforms which do not support it.")
    https://xenbits.xenproject.org/gitweb/?p=xen.git;a=commitdiff;h=3ac3817762d1a8b39fa45998ec8c40cabfcfc802
it seems the real purpose was just an hint that migrate/suspend/saving
aren't going to work on that platform.

Looks like `xl resume` is a fairly new command which only makes use if
libxl_domain_resume outside of migration, but the macro
LIBXL_HAVE_NO_SUSPEND_RESUME was mostly a hint that migration doesn't
work.

So I think moving the `xl resume` command out of
LIBXL_HAVE_NO_SUSPEND_RESUME would be good enough for this patch,
without touching libxl.h.

Cheers,

-- 
Anthony PERARD

