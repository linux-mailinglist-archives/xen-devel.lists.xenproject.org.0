Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 017CDAE5F6F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023393.1399376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz6N-0004zf-Cg; Tue, 24 Jun 2025 08:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023393.1399376; Tue, 24 Jun 2025 08:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz6N-0004yY-9U; Tue, 24 Jun 2025 08:33:59 +0000
Received: by outflank-mailman (input) for mailman id 1023393;
 Tue, 24 Jun 2025 08:33:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTSQ=ZH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uTz6L-0004yM-Si
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:33:57 +0000
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [2607:f8b0:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7c20ba5-50d5-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 10:33:57 +0200 (CEST)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-73ac5680bb0so35327a34.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 01:33:57 -0700 (PDT)
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
X-Inumbo-ID: f7c20ba5-50d5-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750754035; x=1751358835; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDTE57ohFH1BjvClcBM9belopXhx6lLs32LALQQVjJA=;
        b=OxywZHB6VXAxp3j3hNnxBjBNs8a+RAbkeSYyoqEvloQcpWd9c17rYW0WgZPkm69l7c
         uPi7DVlbCxmoTigpXq8D+LE/jSo2eQod1TpSHiPejXtktMC4h/3+tjFkVi9ppQlhy74Y
         0oBN5WgOuJk7cK++ya3ceDAJFbKxH0ALUbLlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750754035; x=1751358835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDTE57ohFH1BjvClcBM9belopXhx6lLs32LALQQVjJA=;
        b=wMNdHKdKABrIPyhihyop69WUpZQymLe8qTlMwAehpCKFzgKEl73BFUJ+AVXS5TwVEw
         ppVe8ZjPBlC4gZhCx5ReGJFEaxBEn+3Oh/ZBpRokZMu2ZgPSy2Euj4g0QN6Itmf2TtNY
         2pfTMIkMA/8CvtN6kjF6InzDY0yATKhHUjRuWu66QZOiPMUYad3MGuSKmPSaOuHu0KRQ
         lXymydeGpm4ZL5hAYraLvbOL2kfEsvL8FCyTpzUmkULK+HbAyDDiWAOkKP+Gi0RSgNVf
         M8bRLmWGeCXgryvskjGe0jvnMCJksSBJXcQJBLZs9xHrIcE2bmwpTNDL37s1UEHWePKc
         MWEw==
X-Gm-Message-State: AOJu0Yy03gBILonf124DGnhsDxKlIDHRLeZobjyqf5Or5bEJtm64nQIH
	VlujfBPBQkyuleIVrngH72YFq0R2q8gtdro1UdLMsAP8OHUUG2CZ0a9X9PbUGCzVs8+JUkPuKEO
	FTtpXpyi0BiPOkxv7bXaczf7KGKF7rI9+wCHwAR0RWU6Q7pJL/cidl5Op0nxc
X-Gm-Gg: ASbGnct8vJsx3SgW5RNrilAvlAlzcKCbPK1x+pFNOixd7saXOfhS7X6+sY0Y8qnHAsO
	TDqHpCRgTHaOvkX9Sw03k597igEFJFDvXFhH/KnbGvBQjQD5Cex7sJ3JLNB0gAnt7All2i3N06S
	o4vUOSNVeV+kNHaPbIUVpkmWZhe+ph5ALJ6iMNPSjgg54rh9BQTho=
X-Google-Smtp-Source: AGHT+IHW5qXKYN9C/5sBMYyWTGRQpN0DIuvJNZ/0bJB3cw8oo5vYnzF/VuCIU4yNTXfJJ0YhrYaDIzmljgIAwwUjodI=
X-Received: by 2002:a05:6870:8306:b0:2e9:4038:83d7 with SMTP id
 586e51a60fabf-2eeda55b6b6mr9666154fac.11.1750754035597; Tue, 24 Jun 2025
 01:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250624063611.236876-1-frediano.ziglio@cloud.com>
In-Reply-To: <20250624063611.236876-1-frediano.ziglio@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 24 Jun 2025 09:33:41 +0100
X-Gm-Features: AX0GCFuMWtMw47HXhQtceDiRGySBVcO2NZdSHAy8tbPY74fES07hK1mjSVLCR_0
Message-ID: <CACHz=ZiP=vLAK1caJymLvazX3KZLUwU9HtymvqWVHzq2xLaBGg@mail.gmail.com>
Subject: Re: [PATCH] xen/efi: Do not undefined not defined macro
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 7:36=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>

Typo on title "Do not undefined not defined macro" -> "Do not undefine
not defined macro"

> The "buffer" macro is not defined.
> It was defined till commit 59e087bf6a9c8ad805294c32dfd7c77068d81eff
> (cfr "xen/keyhandler: Drop keyhandler_scratch").
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/common/efi/boot.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index ded7cc129d..1a9b4e7dae 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -513,7 +513,6 @@ static EFI_FILE_HANDLE __init get_parent_handle(const=
 EFI_LOADED_IMAGE *loaded_i
>      else
>          *leaf =3D buffer;
>  #undef BUFFERSIZE
> -#undef buffer
>
>      return dir_handle;
>  }

