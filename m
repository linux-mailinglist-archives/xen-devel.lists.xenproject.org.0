Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB81762290
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 21:42:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569910.891085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qONvd-00059U-HE; Tue, 25 Jul 2023 19:42:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569910.891085; Tue, 25 Jul 2023 19:42:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qONvd-00056u-Dz; Tue, 25 Jul 2023 19:42:41 +0000
Received: by outflank-mailman (input) for mailman id 569910;
 Tue, 25 Jul 2023 19:42:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ITxH=DL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qONvc-00056o-9w
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 19:42:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68ddcf2c-2b23-11ee-b240-6b7b168915f2;
 Tue, 25 Jul 2023 21:42:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C5F461787;
 Tue, 25 Jul 2023 19:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F32C433C8;
 Tue, 25 Jul 2023 19:42:35 +0000 (UTC)
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
X-Inumbo-ID: 68ddcf2c-2b23-11ee-b240-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690314156;
	bh=CokXeVNzW0IkdCPN+qwscECrp2QzRT9ynnidtOiQNjQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HABRs8s9+IGX+44DUWPXHiEQTWQVWZ/ubUIYg8x9f0gKCjXj6be9uNsneBTlgEWnY
	 ZTJSVL2CnKkBMEum+jANTP6NfjNwxrVPGQ+C8mABg4yLk65DDA4m2Hugui67oWwD+4
	 O3mMhMv/hXeicgrhbgbknoabYaLjEj8Ca+t05ypsmojKVPGt7IaR+nBDbWZrFmbvnU
	 H45FPrX8L17imyzs/ElICxSuHl0gEdHF1IqdVY+bjh6S6EHLvq2l+0EARLYsn2wNk1
	 QH9HvsKnSry/DNb4hJ44hgvTWHGQzK+LXd9P+3SugSkLkJUXK7iypzs+/WvanG+lhA
	 rmLdInOjPMuow==
Date: Tue, 25 Jul 2023 12:42:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>
Subject: Re: [PATCH] xen: Drop the (almost) unused extern start[]
In-Reply-To: <20230725182049.2384427-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2307251242200.3118466@ubuntu-linux-20-04-desktop>
References: <20230725182049.2384427-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1857193308-1690314156=:3118466"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1857193308-1690314156=:3118466
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 25 Jul 2023, Andrew Cooper wrote:
> This global variable is shadowed by plenty local variables, violating MISRA
> rule 5.3.  Some architectures happen to have a symbol by the name of start in
> their head.S's, but it's not a useful symbol to reference from C.
> 
> In fact, the single use of the global start[] in RISC-V is wrong and means to
> use _start[] as the linker symbol at the beginning of the .text section, not
> the function which happens to be in the same location.
> 
> Fix RISC-V to use the right symbol for it's calculation, and drop the extern.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Bob Eshleman <bobbyeshleman@gmail.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Connor Davis <connojdavis@gmail.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> 
> I'm expecting:
> 
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/945105609
> 
> to come back and show green, but Gitlab is very backed up right now.  I've
> compiled each architecture locally.
> ---
>  xen/arch/riscv/mm.c      | 2 +-
>  xen/include/xen/kernel.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index fddb3cd0bdeb..99ed5e9623cc 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -148,7 +148,7 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
>  
>      unsigned long aligned_load_start = load_start & level_map_mask;
>      unsigned long aligned_page_size = XEN_PT_LEVEL_SIZE(page_table_level);
> -    unsigned long xen_size = (unsigned long)(_end - start);
> +    unsigned long xen_size = (unsigned long)(_end - _start);
>  
>      if ( (load_start + xen_size) > (aligned_load_start + aligned_page_size) )
>      {
> diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
> index 9ac2694dc7b1..46b3c9c02625 100644
> --- a/xen/include/xen/kernel.h
> +++ b/xen/include/xen/kernel.h
> @@ -66,7 +66,7 @@
>  })
>  
>  /* SAF-0-safe */
> -extern char _start[], _end[], start[];
> +extern char _start[], _end[];
>  #define is_kernel(p) ({                         \
>      char *__p = (char *)(unsigned long)(p);     \
>      (__p >= _start) && (__p < _end);            \
> 
> base-commit: 0b1171be87698bc7d14760383c0770aeb6e41dd4
> -- 
> 2.30.2
> 
--8323329-1857193308-1690314156=:3118466--

