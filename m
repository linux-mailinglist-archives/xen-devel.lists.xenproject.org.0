Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D622A01115
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 00:36:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864678.1275902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTrCi-0003GF-JN; Fri, 03 Jan 2025 23:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864678.1275902; Fri, 03 Jan 2025 23:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTrCi-0003DU-GC; Fri, 03 Jan 2025 23:35:44 +0000
Received: by outflank-mailman (input) for mailman id 864678;
 Fri, 03 Jan 2025 23:35:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79/6=T3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tTrCh-0003DO-33
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2025 23:35:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70e3ea78-ca2b-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 00:35:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ECBE55C60E1;
 Fri,  3 Jan 2025 23:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F0EC4CEDD;
 Fri,  3 Jan 2025 23:35:36 +0000 (UTC)
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
X-Inumbo-ID: 70e3ea78-ca2b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735947338;
	bh=FNLs91gebbCJP/YijGqKRSCbaSDrxjRRVLBXS/RllCY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o1id1a0zy0Gsg6Ep96QetJXw1ngDZF3rYyvoKdQDEvB4uPlncjtQ5Cy+cwm4ygNic
	 ah198OJUWGjAWWoP7W+N7R/j/vFxljBG3w4qfGLrQzNOUT7p8kw+TOdptLCFpEWpwU
	 +ybL7X1ppivg0MtkNGcyvc1sP3LJcWlmpKOwJDcz17/FIdjmNZQVjJj40yK9nIVFel
	 CxFv45bRmjla0MaK261WvctpeQfZetx9iqQ/kP9NZ1U+iIkcsiIlURi+el82EHBY/v
	 UoHX4DvPaw453JWL/6TU/nzb76HjI5oHBzMJZjvttvQe4gwFkNZ8MhkELL77ECF5T3
	 pjuceuZnkT9Kg==
Date: Fri, 3 Jan 2025 15:35:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH 3/5] xen/perfc: Trim includes
In-Reply-To: <20250102192508.2405687-4-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2501031535290.16425@ubuntu-linux-20-04-desktop>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com> <20250102192508.2405687-4-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1489689879-1735947338=:16425"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1489689879-1735947338=:16425
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 2 Jan 2025, Andrew Cooper wrote:
> This is mostly for the removal of xen/lib.h and xen/smp.h from perfc.h.  All
> that is needed is xen/macros.h.
> 
> Trim and sort the includes for perfc.c too.  There's no need for smp.h,
> keyhandler.h or mm.h, but cpumask.h is needed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/common/perfc.c      | 9 ++++-----
>  xen/include/xen/perfc.h | 3 +--
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/common/perfc.c b/xen/common/perfc.c
> index 8c967ab900f9..b748c8af855b 100644
> --- a/xen/common/perfc.c
> +++ b/xen/common/perfc.c
> @@ -1,13 +1,12 @@
>  
> +#include <xen/cpumask.h>
>  #include <xen/errno.h>
> +#include <xen/guest_access.h>
>  #include <xen/lib.h>
> -#include <xen/smp.h>
> -#include <xen/time.h>
>  #include <xen/perfc.h>
> -#include <xen/keyhandler.h> 
>  #include <xen/spinlock.h>
> -#include <xen/mm.h>
> -#include <xen/guest_access.h>
> +#include <xen/time.h>
> +
>  #include <public/sysctl.h>
>  
>  #define PERFCOUNTER( var, name )              { name, TYPE_SINGLE, 0 },
> diff --git a/xen/include/xen/perfc.h b/xen/include/xen/perfc.h
> index f9009dc388de..324b47665573 100644
> --- a/xen/include/xen/perfc.h
> +++ b/xen/include/xen/perfc.h
> @@ -3,8 +3,7 @@
>  
>  #ifdef CONFIG_PERF_COUNTERS
>  
> -#include <xen/lib.h>
> -#include <xen/smp.h>
> +#include <xen/macros.h>
>  #include <xen/percpu.h>
>  
>  /*
> -- 
> 2.39.5
> 
--8323329-1489689879-1735947338=:16425--

