Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9EE58E20F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 23:47:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383197.618322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLX3Z-0001o6-Ff; Tue, 09 Aug 2022 21:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383197.618322; Tue, 09 Aug 2022 21:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLX3Z-0001lY-Ch; Tue, 09 Aug 2022 21:46:33 +0000
Received: by outflank-mailman (input) for mailman id 383197;
 Tue, 09 Aug 2022 21:46:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lP5k=YN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oLX3X-0001lS-PS
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 21:46:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9a58b1f-182c-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 23:46:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A288E60F7B;
 Tue,  9 Aug 2022 21:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E58C433D6;
 Tue,  9 Aug 2022 21:46:27 +0000 (UTC)
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
X-Inumbo-ID: b9a58b1f-182c-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660081588;
	bh=lIpD47DjX6g1SOlmnRB63wiVXZC8mHt8QqM7HTZh87k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JZhn9bwEhmRimsxYGUtFrCwpNPtqoatIPSvhcZQ7BuCqBi8xvZWjTWpCx2imqn7Lp
	 +GeppLo6oUiswT5fw4uoeu3OR/CmMx8EXjm74SXuWbVf/gungoc12P6F28SEQrCt7+
	 dxXmJNl4xnwYD8MxhxADIS6n42AuFWoYFinjDrn7JLkeqIHCSL+fST9W9eamCn7Bv2
	 7DeN2KbubqYEfeVxv4fSWM4cEKbS9JEhAivv0NnU5YVO4aPRvQsV6pEhVh0KIX3KS4
	 THfUujcRhohmNzV8nwT7zllZzOsb2c2H6RvvdeXrCKN0nDIEXxlwicH+Mu0ScHPZMG
	 1K703wZiFHglg==
Date: Tue, 9 Aug 2022 14:46:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: vreg: Fix MISRA C 2012 Rule 20.7 violation
In-Reply-To: <20220809093048.1893025-1-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208091446080.3790@ubuntu-linux-20-04-desktop>
References: <20220809093048.1893025-1-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Aug 2022, Xenia Ragiadakou wrote:
> In VREG_REG_HELPERS(), the macro parameter 'offmask' is used as expression and
> therefore it is good to be enclosed in parentheses to prevent against
> unintended expansions.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/include/asm/vreg.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
> index fa2f4cdb17..f26a70d024 100644
> --- a/xen/arch/arm/include/asm/vreg.h
> +++ b/xen/arch/arm/include/asm/vreg.h
> @@ -141,7 +141,7 @@ static inline void vreg_reg_clearbits(unsigned long *reg, register_t bits,
>  static inline register_t vreg_reg##sz##_extract(uint##sz##_t reg,       \
>                                                  const mmio_info_t *info)\
>  {                                                                       \
> -    return vreg_reg_extract(reg, info->gpa & offmask,                   \
> +    return vreg_reg_extract(reg, info->gpa & (offmask),                 \
>                              info->dabt.size);                           \
>  }                                                                       \
>                                                                          \
> @@ -151,7 +151,7 @@ static inline void vreg_reg##sz##_update(uint##sz##_t *reg,             \
>  {                                                                       \
>      unsigned long tmp = *reg;                                           \
>                                                                          \
> -    vreg_reg_update(&tmp, val, info->gpa & offmask,                     \
> +    vreg_reg_update(&tmp, val, info->gpa & (offmask),                   \
>                      info->dabt.size);                                   \
>                                                                          \
>      *reg = tmp;                                                         \
> @@ -163,7 +163,7 @@ static inline void vreg_reg##sz##_setbits(uint##sz##_t *reg,            \
>  {                                                                       \
>      unsigned long tmp = *reg;                                           \
>                                                                          \
> -    vreg_reg_setbits(&tmp, bits, info->gpa & offmask,                   \
> +    vreg_reg_setbits(&tmp, bits, info->gpa & (offmask),                 \
>                       info->dabt.size);                                  \
>                                                                          \
>      *reg = tmp;                                                         \
> @@ -175,7 +175,7 @@ static inline void vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
>  {                                                                       \
>      unsigned long tmp = *reg;                                           \
>                                                                          \
> -    vreg_reg_clearbits(&tmp, bits, info->gpa & offmask,                 \
> +    vreg_reg_clearbits(&tmp, bits, info->gpa & (offmask),               \
>                         info->dabt.size);                                \
>                                                                          \
>      *reg = tmp;                                                         \
> -- 
> 2.34.1
> 

