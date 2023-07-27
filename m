Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6488B765191
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 12:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571002.893782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyVU-0006DX-3K; Thu, 27 Jul 2023 10:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571002.893782; Thu, 27 Jul 2023 10:46:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyVT-0006Bd-W2; Thu, 27 Jul 2023 10:46:07 +0000
Received: by outflank-mailman (input) for mailman id 571002;
 Thu, 27 Jul 2023 10:46:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o85N=DN=citrix.com=prvs=5659ebe79=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qOyVT-0005uQ-As
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 10:46:07 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c69b1a9e-2c6a-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 12:46:02 +0200 (CEST)
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
X-Inumbo-ID: c69b1a9e-2c6a-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690454762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BUw7+zeVQ4Yt6rN2cLxd2PTsfKKz6t8bkg9dXC3lD4A=;
  b=friIZLRUuyhX+NwoKWgkcvhiZkF75zoQOJyfpEQze1u3M9Kh4tapvFG7
   dhn6HYDtm+5p7lA2nZbZuGzMEUqaMJELjymyesyN2eIp/3603Z9aY6TTU
   TdxJN/sXRkUTXsAlovkhlxapmYh6HALImYwJseNORl93aI0TFmyJL+J6E
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 120254669
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:A8vgiKBOASEfwxVW/+rjw5YqxClBgxIJ4kV8jS/XYbTApDJz3zMGz
 jRLCzqOOvaOZWCgKNkiPt61/E0EvpTRn4IyQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxC4QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3+l0E2BX1
 NwiDx8/UBKzifu325uERbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4bSH5gJwBjJz
 o7A11viUxcga/GP8gjG4iK1q6zMxjLmR41HQdVU8dY12QbOlwT/EiY+V1K9reOol02WVNdWK
 khS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLncAZi5MbpohrsBebT4lz
 FiShPvyGCdi9raSTBq19L2ZsDezMig9NnIZaGkPSg5ty9D7rZs6lB7nUtdpG6nzhdrwcQwc2
 BjT8nJ43e9Ky5dWiePipwuvby+QSobhawE29ATOf0KfySxLWoyVaZWp8nHk4qMVRGqGdWVtr
 EToiuDHsrFWVsDWxHTRKAkeNOr3vqjYaVUwlXYqRsB8rGr1phZPaKgKuFlDyFFV3tHokNMDS
 Gvaoktv6ZBaJxNGhocnMtvqW6zGIUUNfOkJt8w4jfIUOPCdjCfdoElTibSs927silMwtqo0J
 I2Wd82hZV5DV/U/l2voHbhMiud0rszb+Y81bcqlp/hA+ePADEN5tJ9faAfeBgzHxP3sTPrpH
 yZ3aJLRlkQ3vBzWaSjL648DRW3m3lBiba0aX/d/L7bZSiI/QTFJNhMk6e95E6R/gb9vn/vFl
 lnkHBcwJKzX2SeWdm1nqxlLNNvSYHqIhStkZndxbAnwgCNLjETGxP53SqbbtIIPrIRLpcOYh
 dFcEylcKpyjkgj6xgk=
IronPort-HdrOrdr: A9a23:daG0N6tYnxT7Wy4/AJ0OfYop7skDxNV00zEX/kB9WHVpmwKj5q
 STdZUgpGzJYVMqMx8dcL+7WJVoPkmsj6KdjbNxAV7AZniWhILXFvAB0WKK+VSJcREWndQttp
 uIHZIObeEZBjBB/LvHCGHTKbodKLLsys+VbSi19RpQZDAvUoUlyzpQTj+cFEgefng3OXL6fq
 DsmvauY1CbCAoqhgHQPAh7YwG5naytqLvWJSQeAgIh6k2kkTOs5dfBYmOl9yZbaSpL3bAhtV
 LkvmXCl8OemsD+8AbYy2jQq65bg8Ts0fxKAMDksLltFhzczjywYZhnWfm8sCsuoOepgWxa6O
 Xxnw==
X-Talos-CUID: 9a23:Hl0WM27TLeG71Mqpf9ss0UEXCME8U13n61jiHU2IB39oU5SqRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AZx87Ggxh1oVJBEBCWppEEOIpTvmaqJu1WUY3zrg?=
 =?us-ascii?q?WgPvHJXxpFnSe1yWqXYByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,234,1684814400"; 
   d="scan'208";a="120254669"
Date: Thu, 27 Jul 2023 11:45:51 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v7 05/15] pmstat&xenpm: Re-arrage for cpufreq union
Message-ID: <2e25ad50-085e-430c-b027-bd386b50a7ea@perard>
References: <20230726170945.34961-1-jandryuk@gmail.com>
 <20230726170945.34961-6-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726170945.34961-6-jandryuk@gmail.com>

On Wed, Jul 26, 2023 at 01:09:35PM -0400, Jason Andryuk wrote:
> Rearrange code now that xen_sysctl_pm_op's get_para fields has the
> nested union and struct.  In particular, the scaling governor
> information like scaling_available_governors is inside the union, so it
> is not always available.  Move those fields (op->u.get_para.u.s.u.*)
> together as well as the common fields (ones outside the union like
> op->u.get_para.turbo_enabled).
> 
> With that, gov_num may be 0, so bounce buffer handling needs
> to be modified.
> 
> scaling_governor and other fields inside op->u.get_para.u.s.u.* won't be
> used for hwp, so this will simplify the change when hwp support is
> introduced and re-indents these lines all together.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

