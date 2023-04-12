Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E46DF1B5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 12:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520163.807484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmXQT-0007Rf-33; Wed, 12 Apr 2023 10:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520163.807484; Wed, 12 Apr 2023 10:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmXQS-0007OY-WC; Wed, 12 Apr 2023 10:10:05 +0000
Received: by outflank-mailman (input) for mailman id 520163;
 Wed, 12 Apr 2023 10:10:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R0Xd=AD=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1pmXQR-00075J-9t
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 10:10:03 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f337a2d-d91a-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 12:10:00 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id j1so14313778wrb.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Apr 2023 03:10:01 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4410000000b002f490a0cd1asm1080829wrq.92.2023.04.12.03.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 03:10:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 190F31FFB7;
 Wed, 12 Apr 2023 11:10:00 +0100 (BST)
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
X-Inumbo-ID: 2f337a2d-d91a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681294201; x=1683886201;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPJ2SFierbyb3Cclh63Wlefmv6JskXMO+atr4mXdl8I=;
        b=BScgF6Er6TmA9oO9n/EyYK3mPOlQAD+EaBbBo1rH+wjOVZNNffPA5u8mTVh3sa9rAd
         QHL+9y7eA4QlOM3dyrIeluXkvHuwijSBYc25rAQSnSY41YwmH6MRPHChCzVJ4vm8FZX4
         5ebp5hfJis2nUoxbankpexnCPOMMn9n+Fl8A8S52wn/8zWiNcd9wti3k0LgL9iYgsG2H
         LSxKzu/DesSxMfYHcYjnym0+FpfzyNZUD+IuLQ1UJfJHADUtRUkxAajjpL4xVZUAVupL
         6VU9hq/G3upGGHaf8TMUHF5mDs6JMlXa7eqGqeUUOqlnGB9+CYU1PclzWUb7I8YuWA2d
         v6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681294201; x=1683886201;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bPJ2SFierbyb3Cclh63Wlefmv6JskXMO+atr4mXdl8I=;
        b=xAaZJSiwBZFMTUHL1K5kvkqjdt3C0n5ltyNRozMc+xW7lltSxr2CUjqbjZjXE7fna0
         7aBaKm0fRI98195Lqy+9qNEwrNDQhR9DIWlDYEwZ59yIr/FsyycdCL997xzWextktl1+
         +8cS9VQhvmoTB5yqlGjFMAnmCqQodIgWLPuRZnXKLUSNTPFEB+bjpgAGvynSaFJi5A3+
         KlgeKiw9y45NikHo37fzlwxKzsNL5r0FsIO/rEr0+4auL/fXS6fZpTlJ8IUBoEORpVsL
         HNIr6zDrBxWQQByReKdC7t8mejLSyi38SghnA9049lTuSyNKCj9SxDMKOv22fiox2GWU
         RDIg==
X-Gm-Message-State: AAQBX9dsfmHjfG/r/Ol4NLzkSOD5xtIybZl1aXkxEeo1+X5PvRVay0sK
	NLYOPcbpjxe2qh7oHMPw62qCPA==
X-Google-Smtp-Source: AKy350aBY3mwROC5VviG3+/nxUD4IH6ZvxN1KXZmddzemSoJH/nDLqqfeanFjDkNN3oVWK6yU/IRoQ==
X-Received: by 2002:adf:ee0f:0:b0:2d0:354e:dc77 with SMTP id y15-20020adfee0f000000b002d0354edc77mr9024079wrn.66.1681294200833;
        Wed, 12 Apr 2023 03:10:00 -0700 (PDT)
References: <20230411210422.24255-1-vikram.garhwal@amd.com>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 stefano.stabellini@amd.com, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Wainer dos Santos  Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [QEMU][PATCH] gitlab-ci.d/crossbuilds: Drop the '--disable-tcg'
 configuration for xen
Date: Wed, 12 Apr 2023 11:08:50 +0100
In-reply-to: <20230411210422.24255-1-vikram.garhwal@amd.com>
Message-ID: <877cuhpg1z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Xen is supported for aarch64 via xenpvh machine. disable-tcg option fails=
 the
> build for aarch64 target.
>
> Link for xen on arm patch series: https://mail.gnu.org/archive/html/qemu-=
devel/2023-02/msg03979.html
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 61b8ac86ee..6867839248 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -186,7 +186,7 @@ cross-amd64-xen-only:
>    variables:
>      IMAGE: debian-amd64-cross
>      ACCEL: xen
> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
> +    EXTRA_CONFIGURE_OPTS: --disable-kvm

x86 should handle --disable-tcg fine.

>=20=20
>  cross-arm64-xen-only:
>    extends: .cross_accel_build_job
> @@ -195,4 +195,4 @@ cross-arm64-xen-only:
>    variables:
>      IMAGE: debian-arm64-cross
>      ACCEL: xen
> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
> +    EXTRA_CONFIGURE_OPTS: --disable-kvm

Currently this builds qemu-system-i386, but with your changes and the
work Fabiano is doing:

  Message-Id: <20230313151058.19645-1-farosas@suse.de>
  Date: Mon, 13 Mar 2023 12:10:48 -0300
  Subject: [PATCH v9 00/10] target/arm: Allow CONFIG_TCG=3Dn builds
  From: Fabiano Rosas <farosas@suse.de>

We should be able to have a qemu-system-aarch64 supporting Xen without TCG

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

