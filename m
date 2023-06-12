Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9927B72C353
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 13:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547030.854243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fzC-0007My-If; Mon, 12 Jun 2023 11:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547030.854243; Mon, 12 Jun 2023 11:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fzC-0007Kc-Fu; Mon, 12 Jun 2023 11:45:26 +0000
Received: by outflank-mailman (input) for mailman id 547030;
 Mon, 12 Jun 2023 11:20:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LMUQ=CA=kernel.org=lee@srs-se1.protection.inumbo.net>)
 id 1q8fah-0003QD-Sb
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 11:20:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14606e45-0913-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 13:20:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 070B960AEA;
 Mon, 12 Jun 2023 11:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517FEC433EF;
 Mon, 12 Jun 2023 11:19:59 +0000 (UTC)
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
X-Inumbo-ID: 14606e45-0913-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686568803;
	bh=23JwlmTrqv4IR+K4vNf3mjg3Y1quit9pjndWhP+WBVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WbVmaT/k2NJ431omJScx8rn6Tr4xCwHvNKr6toopgTYPT/LQMqMpo7FBV6vIGJ4Ih
	 +HSkHHWJ35Kcb4B/GPixREIZZBfO6jCqVm2Oj7ei4Ar3Tq5VdX+HzY8hRcQXP/+huS
	 OJbyhn41f3IULnSq0wd/dz2lHKMxj8853QNGxSQmcax6UBGdjg1/NwAF+VG6M3OHL2
	 ZzOOn7hwX4hqHpXo5AUa9bZN9l3F97lPwSQv46KeDu8M33XqdrFtdbw9tq1DG+/U0P
	 7qVFwPAn09GyfkCtFxQ5HZGZsXWZZPEQgoJDyew2d9LSRvZgIIxDgS8gSf/0U6hnid
	 f8spn2rSpOb/Q==
Date: Mon, 12 Jun 2023 12:19:55 +0100
From: Lee Jones <lee@kernel.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/4] limits.h: add UCHAR_MAX, SCHAR_MAX, and SCHAR_MIN
Message-ID: <20230612111955.GM3635807@google.com>
References: <20230610204044.3653-1-demi@invisiblethingslab.com>
 <20230610204044.3653-2-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230610204044.3653-2-demi@invisiblethingslab.com>

On Sat, 10 Jun 2023, Demi Marie Obenour wrote:

> Some drivers already defined these, and they will be used by sscanf()
> for overflow checks later.  Also add SSIZE_MIN to limits.h, which will
> also be needed later.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
>  .../media/atomisp/pci/hive_isp_css_include/platform_support.h  | 1 -
>  include/linux/limits.h                                         | 1 +
>  include/linux/mfd/wl1273-core.h                                | 3 ---

Acked-by: Lee Jones <lee@kernel.org>

>  include/vdso/limits.h                                          | 3 +++
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
> index 0cdef4a5e8b1bed9884133f1a0b9d853d59d43a4..e29b96d8bebf14839f6dd48fdc6c0f8b029ef31d 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/platform_support.h
> @@ -27,7 +27,6 @@
>  
>  #define UINT16_MAX USHRT_MAX
>  #define UINT32_MAX UINT_MAX
> -#define UCHAR_MAX  (255)
>  
>  #define CSS_ALIGN(d, a) d __attribute__((aligned(a)))
>  
> diff --git a/include/linux/limits.h b/include/linux/limits.h
> index f6bcc936901071f496e3e85bb6e1d93905b12e32..8f7fd85b41fb46e6992d9e5912da00424119227a 100644
> --- a/include/linux/limits.h
> +++ b/include/linux/limits.h
> @@ -8,6 +8,7 @@
>  
>  #define SIZE_MAX	(~(size_t)0)
>  #define SSIZE_MAX	((ssize_t)(SIZE_MAX >> 1))
> +#define SSIZE_MIN	(-SSIZE_MAX - 1)
>  #define PHYS_ADDR_MAX	(~(phys_addr_t)0)
>  
>  #define U8_MAX		((u8)~0U)
> diff --git a/include/linux/mfd/wl1273-core.h b/include/linux/mfd/wl1273-core.h
> index c28cf76d5c31ee1c94a9319a2e2d318bf00283a6..b81a229135ed9f756c749122a8341816031c8311 100644
> --- a/include/linux/mfd/wl1273-core.h
> +++ b/include/linux/mfd/wl1273-core.h
> @@ -204,9 +204,6 @@
>  				 WL1273_IS2_TRI_OPT | \
>  				 WL1273_IS2_RATE_48K)
>  
> -#define SCHAR_MIN (-128)
> -#define SCHAR_MAX 127
> -
>  #define WL1273_FR_EVENT			BIT(0)
>  #define WL1273_BL_EVENT			BIT(1)
>  #define WL1273_RDS_EVENT		BIT(2)
> diff --git a/include/vdso/limits.h b/include/vdso/limits.h
> index 0197888ad0e00b2f853d3f25ffa764f61cca7385..0cad0a2490e5efc194d874025eb3e3b846a5c7b4 100644
> --- a/include/vdso/limits.h
> +++ b/include/vdso/limits.h
> @@ -2,6 +2,9 @@
>  #ifndef __VDSO_LIMITS_H
>  #define __VDSO_LIMITS_H
>  
> +#define UCHAR_MAX	((unsigned char)~0U)
> +#define SCHAR_MAX	((signed char)(UCHAR_MAX >> 1))
> +#define SCHAR_MIN	((signed char)(-SCHAR_MAX - 1))
>  #define USHRT_MAX	((unsigned short)~0U)
>  #define SHRT_MAX	((short)(USHRT_MAX >> 1))
>  #define SHRT_MIN	((short)(-SHRT_MAX - 1))
> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab
> 

-- 
Lee Jones [李琼斯]

