Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2DD7EFD5C
	for <lists+xen-devel@lfdr.de>; Sat, 18 Nov 2023 04:05:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635511.991496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4BeM-0000P4-60; Sat, 18 Nov 2023 03:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635511.991496; Sat, 18 Nov 2023 03:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4BeM-0000Lf-1z; Sat, 18 Nov 2023 03:05:38 +0000
Received: by outflank-mailman (input) for mailman id 635511;
 Sat, 18 Nov 2023 03:05:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+gg=G7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r4BeK-0000LG-FX
 for xen-devel@lists.xenproject.org; Sat, 18 Nov 2023 03:05:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56c63208-85bf-11ee-9b0e-b553b5be7939;
 Sat, 18 Nov 2023 04:05:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1827F61470;
 Sat, 18 Nov 2023 03:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE4BC433C7;
 Sat, 18 Nov 2023 03:05:30 +0000 (UTC)
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
X-Inumbo-ID: 56c63208-85bf-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700276731;
	bh=JEMqe+v4uJTLQuPxx/8/Z4JX7ISO363mMVuKHLjdav0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VX9uy5J2TG/xf7Z3RLyyde/p3SyZtWH8g2GnFR50TQoiE7cYUr42kUeRmPOUPaPFT
	 M2qXalnSrAjzsfakppLK3lJHSoTMkCnmzagG3HOVtALfTI0oaDCXywRC7Sd8smpr43
	 2y9SDg19xj8GgsKidltQPwRX77NXcLS6oMi2veCv9m2izC+of7EhuGexWB6BI67wlZ
	 1DiYaksZ2n3oO1r5ncghsfke3oK1nUdo6QlolaefV3h2/OXXzOQqoVGRrxwdGoNyJ9
	 1XU6sTUn87iz4fSKm1VaJJmQtQwXSk3HzbWHIEfvBlwAdsrElNW5r2rLvJdjVsv5YB
	 YfkAdA/3da8bg==
Date: Fri, 17 Nov 2023 19:05:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 3/5] xen/sort: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <de68f8220fbb97ae6a3382138c23e81d0988a472.1700209834.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311171904290.773207@ubuntu-linux-20-04-desktop>
References: <cover.1700209834.git.federico.serafini@bugseng.com> <de68f8220fbb97ae6a3382138c23e81d0988a472.1700209834.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Nov 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/include/xen/sort.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/xen/sort.h b/xen/include/xen/sort.h
> index 2f52ff85b9..1d5e3c5849 100644
> --- a/xen/include/xen/sort.h
> +++ b/xen/include/xen/sort.h
> @@ -23,8 +23,8 @@
>  extern gnu_inline
>  #endif
>  void sort(void *base, size_t num, size_t size,
> -          int (*cmp)(const void *, const void *),
> -          void (*swap)(void *, void *, size_t))
> +          int (*cmp)(const void *key, const void *elem),
> +          void (*swap)(void *a, void *b, size_t size))
>  {
>      /* pre-scale counters for performance */
>      size_t i = (num / 2) * size, n = num * size, c, r;


Ideally we should also fix swap_memory_node, swap_mmio_handler

