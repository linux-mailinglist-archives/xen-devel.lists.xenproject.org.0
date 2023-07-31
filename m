Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF3F76A27A
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 23:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573457.898174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQaC5-0006ef-7d; Mon, 31 Jul 2023 21:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573457.898174; Mon, 31 Jul 2023 21:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQaC5-0006bR-4t; Mon, 31 Jul 2023 21:12:45 +0000
Received: by outflank-mailman (input) for mailman id 573457;
 Mon, 31 Jul 2023 21:12:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bj4f=DR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qQaC2-0006bL-V4
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 21:12:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa71bd8a-2fe6-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 23:12:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9DFB612A4;
 Mon, 31 Jul 2023 21:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFFEC433C7;
 Mon, 31 Jul 2023 21:12:36 +0000 (UTC)
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
X-Inumbo-ID: fa71bd8a-2fe6-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690837957;
	bh=WajtNFYzP1iusjY0NiPQ4mUezQSAlj+MmvDIw9KtFDs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EG4qjLzEgy1ejUcTY1Wg51LebxduVaNUihLApM2X+9y87jXvrXm19AGybwVtgtImF
	 EohIscr2C2k29YqW8jBs4hSNUEK9xi7hDcsQ9WFSFDQjpZ+jahr2Fque5C2i4jNHq9
	 lFYjlBHU4L979eV2IwAEYBw/o8jpapJf/Tlw1YlwyKtXD3yJCiUr/sPCBr0yNWiB5t
	 IQinEGjTlDNCyBb6QXWnLqYyzcZGDcEWkOctH1elfVXsbkBRxG23H7aLgcxjVd5Lkw
	 TZZl66mLCHj5gS/sRw2UcUiyRUqyePrN+tfgBLZ8TYXJAzT2eyvyE0B5NObos60i3l
	 FRpsj6QQjdAsQ==
Date: Mon, 31 Jul 2023 14:12:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] x86/HVM: tidy _hvm_load_entry() for style
In-Reply-To: <e9035197-b329-af2e-65ed-af31cd0375c2@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307311412290.3118466@ubuntu-linux-20-04-desktop>
References: <e9035197-b329-af2e-65ed-af31cd0375c2@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 31 Jul 2023, Jan Beulich wrote:
> The primary goal is to eliminate the Misra-non-compliance of "desc"
> shadowing at least the local variable in hvm_load(). Suffix both local
> variables with underscores, while also
> - dropping leading underscores from parameter names (applying this also
>   to the two wrapper macros),
> - correcting indentation,
> - correcting brace placement,
> - dropping unnecessary parentheses around parameter uses when those are
>   passed on as plain arguments.

you might want (or not want) to mention the s/1/true/ and s/0/false/


> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/arch/x86/include/asm/hvm/save.h
> +++ b/xen/arch/x86/include/asm/hvm/save.h
> @@ -47,30 +47,32 @@ void _hvm_read_entry(struct hvm_domain_c
>   * Unmarshalling: check, then copy. Evaluates to zero on success. This load
>   * function requires the save entry to be the same size as the dest structure.
>   */
> -#define _hvm_load_entry(_x, _h, _dst, _strict) ({                       \
> -    int r;                                                              \
> -    struct hvm_save_descriptor *desc                                    \
> -        = (struct hvm_save_descriptor *)&(_h)->data[(_h)->cur];         \
> -    if ( (r = _hvm_check_entry((_h), HVM_SAVE_CODE(_x),                 \
> -               HVM_SAVE_LENGTH(_x), (_strict))) == 0 )                  \
> +#define _hvm_load_entry(x, h, dst, strict) ({                           \
> +    int r_;                                                             \
> +    struct hvm_save_descriptor *desc_                                   \
> +        = (struct hvm_save_descriptor *)&(h)->data[(h)->cur];           \
> +    if ( (r_ = _hvm_check_entry(h, HVM_SAVE_CODE(x),                    \
> +                                HVM_SAVE_LENGTH(x), strict)) == 0 )     \
>      {                                                                   \
> -        _hvm_read_entry((_h), (_dst), HVM_SAVE_LENGTH(_x));             \
> -        if ( HVM_SAVE_HAS_COMPAT(_x) &&                                 \
> -             desc->length != HVM_SAVE_LENGTH(_x) )                      \
> -            r = HVM_SAVE_FIX_COMPAT(_x, (_dst), desc->length);          \
> +        _hvm_read_entry(h, dst, HVM_SAVE_LENGTH(x));                    \
> +        if ( HVM_SAVE_HAS_COMPAT(x) &&                                  \
> +             desc_->length != HVM_SAVE_LENGTH(x) )                      \
> +            r_ = HVM_SAVE_FIX_COMPAT(x, dst, desc_->length);            \
>      }                                                                   \
> -    else if (HVM_SAVE_HAS_COMPAT(_x)                                    \
> -             && (r = _hvm_check_entry((_h), HVM_SAVE_CODE(_x),          \
> -                       HVM_SAVE_LENGTH_COMPAT(_x), (_strict))) == 0 ) { \
> -        _hvm_read_entry((_h), (_dst), HVM_SAVE_LENGTH_COMPAT(_x));      \
> -        r = HVM_SAVE_FIX_COMPAT(_x, (_dst), desc->length);              \
> +    else if (HVM_SAVE_HAS_COMPAT(x)                                     \
> +             && (r_ = _hvm_check_entry(h, HVM_SAVE_CODE(x),             \
> +                                       HVM_SAVE_LENGTH_COMPAT(x),       \
> +                                       strict)) == 0 )                  \
> +    {                                                                   \
> +        _hvm_read_entry(h, dst, HVM_SAVE_LENGTH_COMPAT(x));             \
> +        r_ = HVM_SAVE_FIX_COMPAT(x, dst, desc_->length);                \
>      }                                                                   \
> -    r; })
> +    r_; })
>  
> -#define hvm_load_entry(_x, _h, _dst)            \
> -    _hvm_load_entry(_x, _h, _dst, 1)
> -#define hvm_load_entry_zeroextend(_x, _h, _dst) \
> -    _hvm_load_entry(_x, _h, _dst, 0)
> +#define hvm_load_entry(x, h, dst)            \
> +    _hvm_load_entry(x, h, dst, true)
> +#define hvm_load_entry_zeroextend(x, h, dst) \
> +    _hvm_load_entry(x, h, dst, false)
>  
>  /* Unmarshalling: what is the instance ID of the next entry? */
>  static inline unsigned int hvm_load_instance(const struct hvm_domain_context *h)
> 

