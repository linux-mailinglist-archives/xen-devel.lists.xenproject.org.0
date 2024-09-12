Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C33D976DFC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 17:41:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797661.1207673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1solw9-0001RT-BW; Thu, 12 Sep 2024 15:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797661.1207673; Thu, 12 Sep 2024 15:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1solw9-0001Ph-8w; Thu, 12 Sep 2024 15:40:49 +0000
Received: by outflank-mailman (input) for mailman id 797661;
 Thu, 12 Sep 2024 15:40:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1cE1=QK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1solw8-0001Pb-NB
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 15:40:48 +0000
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [2607:f8b0:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 613aa6cf-711d-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 17:40:47 +0200 (CEST)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-710dead5d2aso570192a34.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 08:40:47 -0700 (PDT)
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
X-Inumbo-ID: 613aa6cf-711d-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726155646; x=1726760446; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFTvTe/JGJs6BiFLU4DEfKAGwcGXjFS6/iYvX6hv/hY=;
        b=DLzYQoa7ppfmujmbgJ2m5JtMBTLZLiCZ/UI9q8gZh/dIKNHgWV3NHLR/xaFxiw5mcN
         BreY7pe8flRAc/la/k5PTBdff60wudIfTwIm0tK040sBw6IcUyNxvsvN5YhnaSs56Ktd
         HlTexQTHn/7JJLTitSPoR5KmVNQnxNmZlMjkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726155646; x=1726760446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFTvTe/JGJs6BiFLU4DEfKAGwcGXjFS6/iYvX6hv/hY=;
        b=fdetRD58TBoipztnd2Bq9KkIpeQOfS764Qd/idFtpPS5frOtEfjRz58ssu+y4/Ie2c
         XbhfjMd32GpcSrnvxCaWJYIj8tP1opqmMrtzybDRN6TJOnjocIacWbBxQRs1SAeNCzNZ
         gLwUJPdiVKQPNkOArcbdBAY44AE5xOJCroebdW4SpLWBT/7Iz+KhpNG9vieroUYRv3yt
         RYhKWHR6q8x+VTY/QPv3c/o+bAQQax5J6MPXTh3wEql2PeY1YH21DecVxcYWaCT2TQ4C
         ALS1jFV1kqgvscFUacnaN49TQkeQNWxNwG4RNfCJUR+my3CJamtOyT5ubBb5JPMWySR+
         ztaA==
X-Gm-Message-State: AOJu0YwI/3J6lbQfMqT/st9pkcbTIevq2sE5J/IO/b0PEAqNCDAwZIp0
	iYlGEF8ABEXwRO3jjOc9XeM+hsryovl3LkxS+k55iq0XkApl4ZUmkJToi3WVZPbBwOxS8Czhksj
	x7qcQ3thgYIZr8mtmjWOXW2dsQ7feW+zbn/l49w==
X-Google-Smtp-Source: AGHT+IGHQkgvirPCmDhu498tHw5tHySYOtSqk0gZiLVk2RBWc/v+bPmpTagN7/9xfH+H1YnoC+gvu3/AllvAdc/itHQ=
X-Received: by 2002:a05:6830:6c0a:b0:710:f160:f84c with SMTP id
 46e09a7af769-7110945ec0dmr2546444a34.3.1726155646495; Thu, 12 Sep 2024
 08:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <25a6b7e7-3bbe-4121-8f29-cce6f0a99206@suse.com>
In-Reply-To: <25a6b7e7-3bbe-4121-8f29-cce6f0a99206@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 12 Sep 2024 16:40:35 +0100
Message-ID: <CACHz=ZjJghMd9g270K4+cYCJx1j=UWYeJvCnhaERcyAFhpndRA@mail.gmail.com>
Subject: Re: [PATCH] x86/mm: undo type change of partial_flags
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 4:38=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> Clang dislikes the boolean type combined with the field being set using
> PTF_partial_set.
>
> Fixes: 5ffe6d4a02e0 ("types: replace remaining uses of s16")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -286,7 +286,7 @@ struct page_info
>          struct {
>              u16 nr_validated_ptes:PAGETABLE_ORDER + 1;
>              u16 :16 - PAGETABLE_ORDER - 1 - 1;
> -            bool partial_flags:1;
> +            uint16_t partial_flags:1;
>              int16_t linear_pt_count;
>          };
>
>
I knew MS compiler does not like too, but I only tested with GCC, and
it was fine with it

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano

