Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0519B7562DC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 14:36:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564505.881971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNSO-0007fV-7b; Mon, 17 Jul 2023 12:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564505.881971; Mon, 17 Jul 2023 12:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLNSO-0007c9-4A; Mon, 17 Jul 2023 12:36:04 +0000
Received: by outflank-mailman (input) for mailman id 564505;
 Mon, 17 Jul 2023 12:36:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HNI8=DD=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qLNSM-0007c3-SZ
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 12:36:02 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c85b206-249e-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 14:36:00 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so11738325a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 05:36:00 -0700 (PDT)
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
X-Inumbo-ID: 7c85b206-249e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689597360; x=1692189360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOI5v/53cNhHYZBOmxy8qgfrDHV0aa7/dZv/ZdGpk+Q=;
        b=ohYjSNWMNOTH0RPWqR1uPI95zBfWAsLNxbqiQdBo3wy1R+ZGoNz7nznglFNyeElsXd
         xIX3xn5KIWJ8O8PnOMFS/Rk/3gaULq93ZU8f2HNvcyCBT8TYLO8PPa2HMob91mGNTk/S
         6k2XniZrMWw1G5XkN06EBiyjB0sfnmru+0TVYYuIVkLRLaxPMLkVK/sFoTutk3G2owtA
         bSp+z2VUZfySbXn4xgSwY9l9fDCnSfqtJcQYHiui1745+WkrEx7Yyw6fjcYT3bbq2vha
         yhovZFKGVV/j7ebAWSDlD7dOrLHpouYSf4f0GlDmg/RMSwHf4dTAttEzjCt2jBDDtJyN
         uHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689597360; x=1692189360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOI5v/53cNhHYZBOmxy8qgfrDHV0aa7/dZv/ZdGpk+Q=;
        b=EtgcDBzqlUrUUfFdrmZRRLFo04uyEuwnjqScvBuzk9pU1e92Av8/yR6msgD6MXyrAB
         7dAQCHuWpmrb3oOuMOvJZuJFDMqP2rGhzoJY6ouMpvvItQpljbPaH8lVCGYWSWGbXMc0
         wIs8rHId6sljdfrn+a2cpjTXk53zgnwlZ3qizfRITlYjeuhZX4y9FneKBUo7rLY2G16m
         kygCLZjEgTxBtdZCfA+P5IUh8G38PNqbnYY/SxSt0elx/mXRK5kjw2NnYJZ/hJOiu0N1
         EVIyNbJjKR8lKLNp5l94pgNzBIEBqH3vOocgRek0FaP4JHXmkUbTtU7d4dvQ9EHr/C94
         QLcw==
X-Gm-Message-State: ABy/qLZnW9P8+WWNJleFRIK61S6h0xas4sSbYy3M+y9xvpIPjDWQBEhl
	vQAY259eZEpCUjgZLJdeFOvzaqKGdmwXIWeExcc=
X-Google-Smtp-Source: APBJJlHC58R/28FJeEayiRoRyEXLFlYmLLCrwYyY8EzIesA2R1pZxo/n444JXocjGWVCONeyRepIkpoiNDMxWn7Vp/o=
X-Received: by 2002:a05:6402:27c9:b0:51e:5898:a23d with SMTP id
 c9-20020a05640227c900b0051e5898a23dmr11478322ede.5.1689597360225; Mon, 17 Jul
 2023 05:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com> <60e79cc5-ad07-81e9-e7e6-f97a73a4df62@suse.com>
In-Reply-To: <60e79cc5-ad07-81e9-e7e6-f97a73a4df62@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 17 Jul 2023 08:35:48 -0400
Message-ID: <CAKf6xpt9RTA7sef_QBM=y2gcZURcGzCpU9itUwCD5EPDTtukqA@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86: short-circuit certain cpu_has_* when
 x86-64-v{2,3} are in effect
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 8:36=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> Certain fallback code can be made subject to DCE this way. Note that
> CX16 has no compiler provided manifest constant, so CONFIG_* are used
> there instead. Note also that we don't have cpu_has_movbe nor
> cpu_has_lzcnt (aka cpu_has_abm).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

One thought below.

> ---
> Of course we could use IS_ENABLED(CONFIG_X86_64_V<n>) everywhere, but as
> CX16 shows this isn't necessarily better than the #if/#else approach
> based on compiler-provided manifest constants. While not really intended
> to be used that way, it looks as if we could also use
> IS_ENABLED(__POPCNT__) and alike.
>
> We could go further and also short-circuit SSE*, AVX and alike, which we
> don't use outside of the emulator.
>
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -76,13 +76,19 @@ static inline bool boot_cpu_has(unsigned
>  #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
>  #define cpu_has_ssse3           boot_cpu_has(X86_FEATURE_SSSE3)
>  #define cpu_has_fma             boot_cpu_has(X86_FEATURE_FMA)
> -#define cpu_has_cx16            boot_cpu_has(X86_FEATURE_CX16)
> +#define cpu_has_cx16            (IS_ENABLED(CONFIG_X86_64_V2) || \
> +                                 IS_ENABLED(CONFIG_X86_64_V3) || \
> +                                 boot_cpu_has(X86_FEATURE_CX16))

If you think there may be more ABI selections in the future, it might
be better to express the "V$N" numerically and check >=3D 2.  Or you can
add a Kconfig CONFIG_X86_64_CX16 and select that as appropriate.  But
if there aren't going to be more of these, then this is fine.

Regards,
Jason

