Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4724CC9E735
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 10:23:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176512.1500985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQj59-00062G-M0; Wed, 03 Dec 2025 09:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176512.1500985; Wed, 03 Dec 2025 09:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQj59-0005z3-IW; Wed, 03 Dec 2025 09:23:31 +0000
Received: by outflank-mailman (input) for mailman id 1176512;
 Wed, 03 Dec 2025 09:23:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qm2A=6J=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vQj57-0005a0-VU
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 09:23:30 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba148ce8-d029-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 10:23:29 +0100 (CET)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-6592f588c45so3350839eaf.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 01:23:29 -0800 (PST)
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
X-Inumbo-ID: ba148ce8-d029-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764753808; x=1765358608; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hM1KPilD0PjS8mRiOAXCHXCKoEMz3kAJW5UXctIczDM=;
        b=T2iKfRbL4m6/PwJP7t75B9v+vRSMUvj2/4M/cwreJDiNz9Bf8L0IqWyYrm8ftdbBmC
         JwHWTL71WDYCNqVY5i4jRnnjBMlg3Ey9gtjQ0Bkida1H5LXrdmillTOO4GWobFXCO0hF
         JHJxJm9KTIG3yH1OIwqMlxmlbV1p2oF8ZTiGnTlwKvPhMg5Bbtye50R6uLFQ44NUP6aA
         3fSH4rwvufV6aphfInFS5vr5bowest4gwR/ptdEfC1JXtjPSHr3sTWuJgxf1qMD2AYr5
         mIRWlh4eyJM/gOJUZ7ZMGnJ9VNbuHVmYpOyKmy4EyrROtBwEL5Cv5A5PozoHGNTAS9A7
         5w0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764753808; x=1765358608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hM1KPilD0PjS8mRiOAXCHXCKoEMz3kAJW5UXctIczDM=;
        b=kHCvBstqTdVE4C7hIZ27Rw6qeB4bChwt/iGEfvSKs1ZE/uv33AzRcgsUnoo2UVo88e
         klmWB/8tRvXcHFpptEPA7etLXErjFRMJL4HM06rUmj1qjoLNGgXRDT6alas0y1KtE4MA
         8vf0NX6wWAjvrVwXOVRmBBfgLv02OGer41IRbje1DTYCvIjEBW8vupJT2kv8OrJPkVaf
         atQpw3/uSUWhqvzB5qlEYLUNnhnDlgzt8C8ybNBkAZpGPCPCeR4ka2mZ9geHUjDWTWNY
         FYm3kCw1etWIkWEPihbuR1OG5XlnU1jSsNpHBGJFSA+pLM1p8e+tbkPDk7a8TIfsxfRV
         MPJA==
X-Gm-Message-State: AOJu0YzUv3H+HU7jRQOkRI0iWUaa9ALbcvsJBgW3CjxvsILcQtXLuAuN
	pssLvyvDjpjUCPxhhs7yOgdbZRALg89Wb9g52aKAd8D37kjBLEC0sJj9b9Nmox95TilXmxeJcTV
	2ZMmujaVFWvGYEDp7ol/ZiaH8X2EMiqxK3crvYxRMNA==
X-Gm-Gg: ASbGncvlfAqt4YVP5wqdJzbDVV5eLX5aJ1Nj2Wh/DcH2TKsr8Z05QK84GylMyaB2A7X
	xn1Byr/AyJw7P/XZPVIe1YP6E9IkoaTHiwPmF01AuRYrp8AkIaxKiEQtIvp3UldcomtvdIWgcBF
	ZezuthYnf5boalZ0DGKxId5kUcsMHL+mffgZBxRSuMlkaeahUdEKoflaQQ9Yb05HTbYPN6w6oFa
	PbPOdgWy/xbmrIVb0yuTzBDcabmblbcU5SHMe56cFN/eE0b8MnFQ53/uKDl5PVXbqE330xhiHjQ
	d530oqNJpQSywiDABcbJCfHOtg==
X-Google-Smtp-Source: AGHT+IFebkAhfN3gbjIoeXSF9advN03o0hGBKVTyQ6GF2CdCzOCj18wtSdREQONhiBVG5Xe1xEynpA6V1R4tZXDipd0=
X-Received: by 2002:a05:6820:f016:b0:654:f6f1:dd07 with SMTP id
 006d021491bc7-65972738751mr850659eaf.4.1764753807754; Wed, 03 Dec 2025
 01:23:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764254975.git.bertrand.marquis@arm.com> <6e31745ff6473189d79a53cec2c29fdd41a22251.1764254975.git.bertrand.marquis@arm.com>
In-Reply-To: <6e31745ff6473189d79a53cec2c29fdd41a22251.1764254975.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 3 Dec 2025 10:23:15 +0100
X-Gm-Features: AWmQ_bm4CrbdzFdpUcAAilnOlJ2pCY562imeE8IMfBBX4JOYWX63T92lojg8b5U
Message-ID: <CAHUa44HeiozpurYLfjHU6qv=GsquRLKQrjZY+cemzbmVAS+kaQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] xen/arm: ffa: use signed 32-bit status codes
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Thu, Nov 27, 2025 at 4:52=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> The FF-A spec defines return status values as signed 32-bit integers.
> Align the Xen mediator with this requirement by:
>
> - switching the FF-A helpers (ffa_handle_mem_reclaim(), partition info
>   init, notification ops, dispatcher glue, etc.) to int32_t return types
>   so callers cannot silently truncate negative values
> - masking SMCCC responses/exits in ffa_get_version(),
>   ffa_get_ret_code() and ffa_set_regs_error() to 32 bits before storing
>   them in guest registers
> - updating notifier, shared-memory reclaim, partition-info and
>   dispatcher call sites to use the new prototypes so the entire FF-A
>   path propagates spec-compliant 32-bit signed error codes
>
> While there, tidy up the FF-A notification helpers by using GENMASK(15, 0=
)
> for endpoint extraction and fix the secure-endpoint check in
> ffa_handle_notification_set() to apply the mask to the endpoint ID before
> calling FFA_ID_IS_SECURE(), instead of testing the wrong halfword of
> src_dst.
>
> Fixes: 911b305e7bdab ("xen/arm: ffa: Enable VM to VM without firmware")
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa.c          | 12 +++++++-----
>  xen/arch/arm/tee/ffa_notif.c    | 14 +++++++-------
>  xen/arch/arm/tee/ffa_partinfo.c |  4 ++--
>  xen/arch/arm/tee/ffa_private.h  | 21 +++++++++++----------
>  xen/arch/arm/tee/ffa_shm.c      |  4 ++--
>  5 files changed, 29 insertions(+), 26 deletions(-)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

