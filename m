Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA7FA4F0A2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 23:42:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901548.1309510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpawe-000158-Ej; Tue, 04 Mar 2025 22:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901548.1309510; Tue, 04 Mar 2025 22:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpawe-00013H-BK; Tue, 04 Mar 2025 22:41:00 +0000
Received: by outflank-mailman (input) for mailman id 901548;
 Tue, 04 Mar 2025 22:40:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vBJn=VX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tpawc-00013B-Tk
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 22:40:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcc320b2-f949-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 23:40:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4AC715C6435;
 Tue,  4 Mar 2025 22:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E26FC4CEE5;
 Tue,  4 Mar 2025 22:40:54 +0000 (UTC)
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
X-Inumbo-ID: bcc320b2-f949-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741128055;
	bh=UXLBKADpVD6vJfgwrWUoLtRe5PGaNMpvVNlwuXREjoY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vF9BWdZGmYUIGD5Z9RGvcgpY6q0vO56uGPauqFTXL1BzmmNUJSZcCnLZZny5hktuT
	 MKb09r6X0FuvKR8pCI6jR/E7en5p7W4Mzybg/ayXCKigf39oy7GvhoTtKQW0Ow+gxX
	 xnCJ4swU6lYUvQKYve9B5RiemYCx1PMJi5ZKA3L0v7lpU/8wBft6kKssUf6cSLUV/Y
	 P9myJkD9KA2FaSjOCVQugRYfm47WLfKPnmuWTHzXE3Ji1SkMqR3mqmPGKA9ySvEaIW
	 YKOGNOsp8EEfu/uaEe+WeZI4SyEfCNPpGF+Rroyh1gtH4o7BMd+x6X1jG/+QUQO36y
	 tRFGdnJO+QXEA==
Date: Tue, 4 Mar 2025 14:40:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
    George Dunlap <gwd@xenproject.org>
Subject: Re: [PATCH v2 1/2] xen/domain: Annotate struct domain as page
 aligned
In-Reply-To: <20250303232941.2641306-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503041440380.1303386@ubuntu-linux-20-04-desktop>
References: <20250303232941.2641306-1-andrew.cooper3@citrix.com> <20250303232941.2641306-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1286772829-1741128056=:1303386"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1286772829-1741128056=:1303386
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 3 Mar 2025, Andrew Cooper wrote:
> struct domain is always a page aligned allocation.  Update it's type to
> reflect this, so we can safely reuse the lower bits in the pointer for
> auxiliary information.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Dario Faggioli <dfaggioli@suse.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: George Dunlap <gwd@xenproject.org>
> 
> v2:
>  * New
> 
> Interestingly this does cause two changes in the resulting binary, both caused
> by GCC electing to use a more complicated addressing mode to save one ADD
> instruction.
> ---
>  xen/include/xen/sched.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 037c83fda219..8412b45178ca 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -645,7 +645,7 @@ struct domain
>      unsigned int num_llc_colors;
>      const unsigned int *llc_colors;
>  #endif
> -};
> +} __aligned(PAGE_SIZE);
>  
>  static inline struct page_list_head *page_to_list(
>      struct domain *d, const struct page_info *pg)
> -- 
> 2.39.5
> 
--8323329-1286772829-1741128056=:1303386--

