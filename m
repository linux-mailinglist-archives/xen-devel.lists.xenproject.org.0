Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E822F6EFBA5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 22:30:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526829.818837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prllr-0000DF-H8; Wed, 26 Apr 2023 20:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526829.818837; Wed, 26 Apr 2023 20:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prllr-0000Ah-DV; Wed, 26 Apr 2023 20:29:47 +0000
Received: by outflank-mailman (input) for mailman id 526829;
 Wed, 26 Apr 2023 20:29:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+pP=AR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1prllq-0000Aa-GO
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 20:29:46 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1462bf24-e471-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 22:29:44 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-504efe702d5so11313620a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Apr 2023 13:29:44 -0700 (PDT)
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
X-Inumbo-ID: 1462bf24-e471-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682540984; x=1685132984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUQ9GkqDQDJrESjM5VMTuG5CP+Vyl+2eVho5xDmCSdw=;
        b=sCYfFNAf0Lg9K6nvQjISB8gH0gBFRqsAsT0AFkv39hd8YhppZH0E/OVe3tUCKUv9bZ
         nkVmhzFc7181nbuIWP5MaSzqKqVpAq3ps8wWKrYGoaN2oSpLxNxKPK/P6KUEJTRr99ES
         dQZyM1oKAsZ1Xd4+TU09P5zsB6EI+RVzRt/rKev44oNwkvT0LuaboxLAn5XKUzh1DYTg
         DWdERbPlaxnTvoC+1XkVITPbCsgoisci2nWBLK4Qb8oeh42fRTAN4kL8RfJB6P645fFi
         fuvcgePzbtqSu6eszRA9Rt1pr8GXdDJD00Yt3LS30HgFsIjrNFI3cnc8+qBk5rqcFoWe
         UHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682540984; x=1685132984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUQ9GkqDQDJrESjM5VMTuG5CP+Vyl+2eVho5xDmCSdw=;
        b=Fs0JhOFiV6usVAraKZwne7qy/2KLmj75YVikapVHnt2ZKWBn7BlksIqqTAJg0aRQEj
         IBFQH6QCtatK5a2DL5kRaw+nI0bB9W9dNS/4zY8naLhH/bpL2y1DBnv/zl0svdtUilst
         NPs1W1eU7rn5waOPhT1EeJl32UQ+c9km0deJdXRTgTV0ZN6W6s0yerTH982AY+LvVMJ5
         pl8dRzSRmxCC/7pdJFXiNk4GFbg05WcR8y51hXPyEGkIFXfop/lOvZtKw6vXCvXm2Qen
         GqqJzcQdROpm2q3QC9GGBMAnYca9xiR3BeKSFZWxscrfS7LgZ8blWjucBELqCDrBjujX
         K9dQ==
X-Gm-Message-State: AAQBX9cx5b91fcCzBpQOnMB8NfqcF9ZBPB8OAsJ0dOEKY6uPvP5VNsDX
	HOTBP0p6yxZTU8jmruR462VBxUaXK0oAicp1lyWS4WVAMlc=
X-Google-Smtp-Source: AKy350ZpdJhyFyIA3Bz2DP6f4i+cMx/sEVbUMJVLgiMv9Lt9oNJkx3MFthzoL8FUE6CJZY7jFyuIF873zBvNTb4l2Z0=
X-Received: by 2002:aa7:c0c8:0:b0:508:46d4:898 with SMTP id
 j8-20020aa7c0c8000000b0050846d40898mr21151268edp.4.1682540983689; Wed, 26 Apr
 2023 13:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230425174733.795961-1-jennifer.herbert@citrix.com> <20230425174733.795961-3-jennifer.herbert@citrix.com>
In-Reply-To: <20230425174733.795961-3-jennifer.herbert@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 26 Apr 2023 16:29:31 -0400
Message-ID: <CAKf6xpskM2k5aeLoYLfxnR9KFuK7w3NkZaT_4z-SdOQ8VUc8NQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] acpi: Add TPM2 interface definition.
To: Jennifer Herbert <jennifer.herbert@citrix.com>
Cc: jennifer.herbert@citrx.com, Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 1:48=E2=80=AFPM Jennifer Herbert
<jennifer.herbert@citrix.com> wrote:
>
> This patch introduces an optional TPM 2 interface definition to the ACPI =
table,
> which is to be used as part of a vTPM 2 implementation.
>
> Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
> ---
...
> diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/u=
til.c
> index f39a8e584f..51272530fe 100644
> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -1009,6 +1009,15 @@ void hvmloader_acpi_build_tables(struct acpi_confi=
g *config,
>          config->table_flags |=3D ACPI_HAS_TPM;
>          config->tis_hdr =3D (uint16_t *)ACPI_TIS_HDR_ADDRESS;
>          break;
> +
> +    case 2:
> +        config->table_flags |=3D ACPI_HAS_TPM;
> +        config->crb_id =3D (uint16_t *)TPM_CRB_INTF_ID;
> +
> +        mem_hole_populate_ram(TPM_LOG_AREA_ADDRESS >> PAGE_SHIFT,
> +                              TPM_LOG_SIZE >> PAGE_SHIFT);
> +        memset((void *)TPM_LOG_AREA_ADDRESS, 0, TPM_LOG_SIZE);

TPM_LOG_AREA_ADDRESS is reserved in the e820 table since it is the
high memory range after the ACPI data, correct?

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason

