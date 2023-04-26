Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B546EFBA2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 22:28:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526825.818826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prljU-00084N-3e; Wed, 26 Apr 2023 20:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526825.818826; Wed, 26 Apr 2023 20:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prljU-00082V-13; Wed, 26 Apr 2023 20:27:20 +0000
Received: by outflank-mailman (input) for mailman id 526825;
 Wed, 26 Apr 2023 20:27:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+pP=AR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1prljS-00082M-6M
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 20:27:18 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc040bdb-e470-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 22:27:16 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50506111a6eso13971734a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Apr 2023 13:27:16 -0700 (PDT)
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
X-Inumbo-ID: bc040bdb-e470-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682540835; x=1685132835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWpNif3FNqe3UmxNEOuJxk87Z9LX07seP03fmg8sxU8=;
        b=SL3+3BvftlpEcs+uah2jbhQsbbpFGLKnjc1hiD3rZOdICfoNYjHwmn25gJNZLXUoLg
         tC65f8kgWU4DmnTpak0/LRliZc8w633uM9qr0HeWu019pn+hySdQA7j9K7m4VHR17kLS
         F2mRYaykFLnle/Jp9R1i7sEG7wgdbahj6MzInEqZ2U+VLMLHVL3oGPwd0t70ZWWBmj2+
         fEaIs6A6fNADIIkHQJ3ZoG6iLxxM7gyGMFrsjmjD7y6WUObOJ5sf5xavwRKGphofmP+G
         gjuC3D9W+cGkLAQPD+ZoIBVvbi0Ir4MMTsQZ7gSqHcLaWri5NAn8kDgw6b8VPHKmW069
         1XPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682540835; x=1685132835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWpNif3FNqe3UmxNEOuJxk87Z9LX07seP03fmg8sxU8=;
        b=QgHaoE8ubC9nP8NOIBQPjTZ6UlP5fY004cGyX2Z1SmJIK456u9EtCtRfVj90nG25kN
         ydlmhB1NutIJJgPOYGRXcmeP2UID4Ws1196/B2a/+KCVsKdBgMEGx3AbN+Zqe9yTS97X
         L6trRpgaAXn/0mN36iv+Yqa+Qi5Ef8S9KbwQHIQ6Y3SSKlomfrLpuzGdZDJCcnxwDJ9s
         WeA2cC8pAKbTzaNRP6maszyxi0WRigLHL3CMZq9E6/6y/gx03/kEiaP6A8GDy2Dd1Ikp
         CpFr5dRaHcTmxJ5yvTDDxfEEcUVdGIytYX7uq6Mbl6z5JYnbet7fhEMbopirQHEX6lrt
         KxoA==
X-Gm-Message-State: AAQBX9dXFNyGKdkGyh5fTijJEv3BamsJINp9k3eZdiTImrvTWn4SaJPt
	zPQ7on6dmxTcAduGsNIYKUT9051dphrEQp3kCAI=
X-Google-Smtp-Source: AKy350b7cqRuRX9dpLtZ3KTD9dAUxfUmI87Se/I4Lel61DAiFcfOecdOQjVu5kkOr9suKKq6rMVVvU64COBLhef+occ=
X-Received: by 2002:aa7:d88c:0:b0:506:be07:3473 with SMTP id
 u12-20020aa7d88c000000b00506be073473mr20104843edq.4.1682540835283; Wed, 26
 Apr 2023 13:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230425174733.795961-1-jennifer.herbert@citrix.com> <20230425174733.795961-2-jennifer.herbert@citrix.com>
In-Reply-To: <20230425174733.795961-2-jennifer.herbert@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 26 Apr 2023 16:27:03 -0400
Message-ID: <CAKf6xpsbaZMMFCW3Uw0XZ2gm185iwwtT2H+RcAReFrze9UWdAw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] acpi: Make TPM version configurable.
To: Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: jennifer.herbert@citrx.com, Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jennifer,

On Tue, Apr 25, 2023 at 1:48=E2=80=AFPM Jennifer Herbert
<jennifer.herbert@citrix.com> wrote:
>
> This patch makes the TPM version, for which the ACPI libary probes, confi=
gurable.
> If acpi_config.tpm_verison is set to 1, it indicates that 1.2 (TCPA) shou=
ld be probed.
> I have also added to hvmloader an option to allow setting this new config=
, which can
> be triggered by setting the platform/tpm_version xenstore key.
>
> Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
...
> --- a/tools/libacpi/build.c
> +++ b/tools/libacpi/build.c
> @@ -409,38 +409,47 @@ static int construct_secondary_tables(struct acpi_c=
txt *ctxt,
...
> +        switch ( config->tpm_version )
>          {
> -            tcpa->lasa =3D ctxt->mem_ops.v2p(ctxt, lasa);
> -            tcpa->laml =3D ACPI_2_0_TCPA_LAML_SIZE;
> -            memset(lasa, 0, tcpa->laml);
> -            set_checksum(tcpa,
> -                         offsetof(struct acpi_header, checksum),
> -                         tcpa->header.length);
> +        case 0: /* Assume legacy code wanted tpm 1.2 */

This shouldn't be reached, since tpm_version =3D=3D 0 won't have
ACPI_HAS_TPM set.  Still, do you want to make it a break or drop the
case to avoid falling through to the TPM1.2 code?

Looks good though.

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

