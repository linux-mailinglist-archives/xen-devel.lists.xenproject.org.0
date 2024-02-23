Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A128860FAC
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 11:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684772.1064875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdT0R-0007Bz-Sg; Fri, 23 Feb 2024 10:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684772.1064875; Fri, 23 Feb 2024 10:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdT0R-00079f-Pr; Fri, 23 Feb 2024 10:42:15 +0000
Received: by outflank-mailman (input) for mailman id 684772;
 Fri, 23 Feb 2024 10:42:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8H=KA=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rdT0Q-00079Z-OU
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 10:42:14 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 348e84a4-d238-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 11:42:13 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-512cca90f38so796218e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 02:42:13 -0800 (PST)
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
X-Inumbo-ID: 348e84a4-d238-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708684933; x=1709289733; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfbuVucXTMtEm7kzIgqF5TiJSPGTVWUBfO2y9Xa82TE=;
        b=Z3X55NPPTLVHvZZmbzkm/4eYXgvS8ihDpawaxqk5RVemNIS5JeUWeAyW5vtDArYd2C
         Zj5S9pSrrppMRFu+CfyVO2MbdAV0YuKel6Zj9WtN0HynFlFOQetF9p3HfB1w+rcRlM3h
         6l45RQEQu8bfnRJUWhSOeF1gEJp2WXjFlRjEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708684933; x=1709289733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfbuVucXTMtEm7kzIgqF5TiJSPGTVWUBfO2y9Xa82TE=;
        b=ZTljkitv562O6LW802kRkJ0pYVkaBv6ageXmgJu5gClEwOgmJo31Uu/RZ5PZyUQ9NA
         k8sAdSN97wqdFnKUcONEmpnbNhs6HinVyJ5pUnH3EU01WjRD8MYfkK8CQZOB038GjKtv
         AD6DUfLNZ0SLG0qdT+fnwO6vIRGAFgBzqxhQZ5xW+777qVaQULfIGzWJEYUidWz27hJr
         YF23aJr5zqXTQPdNCRXH6Bd9eeIPJsPfVtjdZR30hUbLQn/6/Vdt/UdcCcAQC8FKdIre
         8OIlwdpu87Y0OZhReznhYT/exZXrqbok6CXHx1xSSaGSYkH6Rx7/f65w+LKmwZI0HWhF
         rj+Q==
X-Gm-Message-State: AOJu0YxSgssNsgxMhPg11vkJk2hO0lwZAn0kr+0z/+r2w1I2efWaM3dL
	tr4wWQHXSUD3jWWDyEGO6U3g2JuO6uvzqTsucMYfAinLtkpIl6DOPaty/Cy30MvwSkAPr1b0XUr
	vtt3HjrXtXW+oHHyqK6JQHstzEON+fjZKx5Gh
X-Google-Smtp-Source: AGHT+IH86tpGVKxziV/xtEnL1Z62l7b6NDVMFmNFnFBRwIbAiSxsSf6Ht9k4f280umEB5Y5JOi45ov9AfWb0CEglNbg=
X-Received: by 2002:ac2:5fa8:0:b0:512:ea66:9852 with SMTP id
 s8-20020ac25fa8000000b00512ea669852mr576108lfe.52.1708684933207; Fri, 23 Feb
 2024 02:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20240223103550.299992-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240223103550.299992-1-andrew.cooper3@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 23 Feb 2024 10:42:01 +0000
Message-ID: <CAG7k0Eryh734q2=ejp2XHLnZVC6ksi0jsV_ftPHh6vQPP5vyiA@mail.gmail.com>
Subject: Re: [PATCH LIVEPATCH] Fix inclusion of new object files
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 10:35=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> Right now, there's a mixup over the xen/ part of the path for new files.
>
>   + NEW_FILES=3D./arch/x86/lp-hooks.o
>   + for i in '$NEW_FILES'
>   ++ dirname ./arch/x86/lp-hooks.o
>   + mkdir -p output/./arch/x86
>   + cp patched/./arch/x86/lp-hooks.o output/./arch/x86/lp-hooks.o
>   cp: cannot stat 'patched/./arch/x86/lp-hooks.o': No such file or direct=
ory
>
> Alter the `cd` and `find` runes to use paths relative to the root of the
> different source trees.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
>
> I'm unsure whether there's a useful fixes tag to use.  AFAICT it was brok=
en
> even when 0564f0c7a57 claimed to have it working.
> ---
>  livepatch-build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/livepatch-build b/livepatch-build
> index cdb852cc7fea..948b2acfc2f6 100755
> --- a/livepatch-build
> +++ b/livepatch-build
> @@ -227,7 +227,7 @@ function create_patch()
>          fi
>      done
>
> -    NEW_FILES=3D$(comm -23 <(cd patched/xen && find . -type f -name '*.o=
' | sort) <(cd original/xen && find . -type f -name '*.o' | sort))
> +    NEW_FILES=3D$(comm -23 <(cd patched && find xen/ -type f -name '*.o'=
 | sort) <(cd original && find xen/ -type f -name '*.o' | sort))
>      for i in $NEW_FILES; do
>          mkdir -p "output/$(dirname "$i")"
>          cp "patched/$i" "output/$i"
>
> base-commit: 1b5b03b3ce4187ce99bad580fd0ee36c6337313f
> --

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

