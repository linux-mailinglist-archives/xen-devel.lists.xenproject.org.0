Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8258DCAF8D6
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 11:06:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181326.1504392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSubb-0003fg-GM; Tue, 09 Dec 2025 10:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181326.1504392; Tue, 09 Dec 2025 10:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSubb-0003eF-Dk; Tue, 09 Dec 2025 10:06:03 +0000
Received: by outflank-mailman (input) for mailman id 1181326;
 Tue, 09 Dec 2025 10:06:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9j7=6P=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vSuba-0003e7-6e
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 10:06:02 +0000
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [2607:f8b0:4864:20::c2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8b9225a-d4e6-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 11:05:59 +0100 (CET)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-65962c714eeso2940758eaf.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 02:05:59 -0800 (PST)
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
X-Inumbo-ID: a8b9225a-d4e6-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765274758; x=1765879558; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DBmre1O1b4no6iYA3cLg6P0KAiM1DQSZPOuw0he+qA=;
        b=JY8XChLdv9jSmmjMjbMqo1KLXHA3uDBBBy0nQUQTAhTHZ/VfNdi9GQfyf1jdO149HT
         VX2UXA5Xi7ps/fW+8IXkGP3L2EFmHEphZ16I3O/AH2MC6Z9HQCOUNheN9vqMBycVfmV3
         60k2vlPs46eFvR6BStlP/HjSnr+WZudn19CUrXTWc9ueN+lQiO63SGjaq84pZ8PIX2ph
         1AeWV/v7g3POala/PQyOEkuJF9jv7TlpursTEr8NP9mKZarLl7lmQ0HterTffOBjDs3k
         IZL0KPGPPWbgW314JzYhwocBOyw3z0UuxLfhkABp4cdprcQfQBkR/mUrzUpHlU3kZ4Vb
         cWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765274758; x=1765879558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6DBmre1O1b4no6iYA3cLg6P0KAiM1DQSZPOuw0he+qA=;
        b=ZxnLHx1bcVcVn6zNmQbiGTZwqzJuwTc4JL1GRvr+Nyu4Yxzp46Rp+DUcRDLa1z1sVw
         v7l8CdcwZokmrqxjwBiwTvoeKwgRMyGOvBZLOGXNpmfL2YogsEEBpagI1byeE7vugOV3
         kJgDSV80Assy9J0NBaLEaATtk90HPce6VSuwTkj9DH0fo6eUgJuaYT+whVsyE43lOPRC
         q14kZxHQZgUb3HpUNJmgDL4le8Jub2ztQDavWC+lMY8kZqiKBUh0JtXjIZWWhmEqonnY
         RyyaVAWS34a/xOkpy6Yqzy70bAsZd6kGc4BOXaJhfzuaTt/TlxuxSAPQIcGDeI6YOsmr
         GWRw==
X-Gm-Message-State: AOJu0Yyx2DoVPTdXkx4ZZOnmaI64fZAInowLhtOklxvE+XPUkZxI5y0I
	qRfa5WoDdCwTQQz9pZYziM9docPgEwcyXtogQcaY8+NnzQCXDy7F7dB7V26xKJj9arm4PWbEiNs
	Qjh11eTe6cwnIorUOj/jGi3lGlGEsfIOwn9gr4rRiWA==
X-Gm-Gg: ASbGncuL9Vevyi7HjY+8lG/pHm+Hih/GWhZl0twdeye5Hnt7oqxdHnIprYNgrAEwEXg
	mmxXDCjuQTowm8Wqh6UDMQa3gdL//uN0Bdj+g1s3qPT5qQC/YIao71BLPXIMHJkq2hjKdricgw6
	OCXJbVH0p+ECP0yimrGwkM/S7m8pkeB9VqBiG9sTS2li88SaBHfPndQcrUGsHns3/HEmkMwPgfp
	IYa41edbvrGa1hdB02UlTEn3d7inVz2GpPziBWj9RfE4stScdwzV5txxDnZlp5QArPxaYnGkwVY
	4FkmuTRvpgpv3l1f8ROcrHUXsOVMku41o+MYENEEdUcsNY9K/3TmlqgFxlgFKA==
X-Google-Smtp-Source: AGHT+IHWrmnoZEbp0xEJjeKA0rmDYSUgnrLYgEdxZNs270TSIO3eL/0nlTFYYo5OCFY5m1m+OaPMQsdlMVGSo11PVxo=
X-Received: by 2002:a05:6820:4de1:b0:659:9a49:8ed7 with SMTP id
 006d021491bc7-65b23833096mr233730eaf.11.1765274758504; Tue, 09 Dec 2025
 02:05:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764930353.git.bertrand.marquis@arm.com> <697ab9880767b75c9964ae900a43fd4e065fc502.1764930353.git.bertrand.marquis@arm.com>
In-Reply-To: <697ab9880767b75c9964ae900a43fd4e065fc502.1764930353.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 9 Dec 2025 11:05:46 +0100
X-Gm-Features: AQt7F2qIz9Tr_AjJj-t3fM2ggtE88YxB1L-RMc_hPhi9Qg9pZWCgLl2vQ_KUW00
Message-ID: <CAHUa44E+Cgs6WeuSyYi=r1BCzaYN+f9MBoSudyLxkU2LeGxzXg@mail.gmail.com>
Subject: Re: [PATCH v1 03/12] xen/arm: ffa: Fix is_64bit init
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, Dec 5, 2025 at 11:37=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> is_64bit_domain(d) is not set during domain_init as the domain field is
> only set when loading the domain image which is done after executing
> domain_init.
>
> Fix the implementation to set is_64bit when version gets negotiated.
> is_64bit is only used during partition_info_get once a domain is added
> in the list of domains having ffa support. It must only be accessed when
> the rwlock is taken (which is the case).
>
> is_64bit must not be used without the rwlock taken and other places in
> the code needing to test 64bit support of the current domain will have
> to use calls to is_64bit_domain instead of the field from now on.
>
> Fixes: 09a201605f99 ("xen/arm: ffa: Introduce VM to VM support")
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v1:
> - patch introduced
> ---
>  xen/arch/arm/tee/ffa.c         | 9 ++++++++-
>  xen/arch/arm/tee/ffa_private.h | 5 +++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index aadd6c21e7f2..0f6f837378cc 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -180,6 +180,14 @@ static bool ffa_negotiate_version(struct cpu_user_re=
gs *regs)
>              goto out_handled;
>          }
>
> +        /*
> +         * We cannot set is_64bit during domain init because the field i=
s not
> +         * yet initialized.
> +         * This field is only used during partinfo_get with the rwlock t=
aken
> +         * so there is no ordering issue with guest_vers.
> +         */
> +        ctx->is_64bit =3D is_64bit_domain(d);

This should only be assigned under the rwlock. But do we need the
is_64bit field at all? Why can't we always use is_64bit_domain()
instead?

Cheers,
Jens

> +
>          /*
>           * A successful FFA_VERSION call does not freeze negotiation. Gu=
ests
>           * are allowed to issue multiple FFA_VERSION attempts (e.g. prob=
ing
> @@ -433,7 +441,6 @@ static int ffa_domain_init(struct domain *d)
>
>      ctx->ffa_id =3D ffa_get_vm_id(d);
>      ctx->num_vcpus =3D d->max_vcpus;
> -    ctx->is_64bit =3D is_64bit_domain(d);
>
>      /*
>       * ffa_domain_teardown() will be called if ffa_domain_init() returns=
 an
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 4e4ac7fd7bc4..2daa4589a930 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -344,6 +344,11 @@ struct ffa_ctx {
>      /* FF-A Endpoint ID */
>      uint16_t ffa_id;
>      uint16_t num_vcpus;
> +    /*
> +     * Must only be accessed with the ffa_ctx_list_rwlock taken as it se=
t
> +     * when guest_vers is set and other accesses could see a partially s=
et
> +     * value.
> +     */
>      bool is_64bit;
>
>      /*
> --
> 2.51.2
>

