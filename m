Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F873AC69B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 10:56:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144366.265719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luAHf-0002pP-D6; Fri, 18 Jun 2021 08:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144366.265719; Fri, 18 Jun 2021 08:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luAHf-0002n2-9u; Fri, 18 Jun 2021 08:55:27 +0000
Received: by outflank-mailman (input) for mailman id 144366;
 Fri, 18 Jun 2021 08:55:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pGVE=LM=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1luAHd-0002mt-82
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 08:55:25 +0000
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00e1a2ad-7210-42f6-ba74-2c91d5cdf6f5;
 Fri, 18 Jun 2021 08:55:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso8171831wmg.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jun 2021 01:55:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z10sm7026080wmp.39.2021.06.18.01.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 01:55:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 89DD81FF7E;
 Fri, 18 Jun 2021 09:55:20 +0100 (BST)
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
X-Inumbo-ID: 00e1a2ad-7210-42f6-ba74-2c91d5cdf6f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=yCs3NROrZCWzC+VF7Ed7Zg+CSfK98h/BzXS8h1Jj/QU=;
        b=SmWBOMEjqZKoh6T5o8G2QaiMAXqEs03dVEIFUTVciNqjmmZTWyKSMMBaECQ7NNimM6
         mjnHnJsDkmXytn8jGqH/EcSCA2D+fbbXQmeYE9chusEMnXAfGpBje6LZPQDBmdL/w375
         FdpzZ/GOEqX9nBwk9KDuu+e8VEwuJf6A0+8JJLpRnNO54idwLuhoTrHmPkKYP0mYqS/2
         Hjj02TZfxg2ubeT0TN5EKy+esAkZtPTL8Vwsytyvkg6tokzYhK5P6De/aasXxftQeeAA
         POIacCGLqQbivekmPOuaKnXsMIIMuF9O1XfBVy/bjf6keS7CMNd8ui7fUUgJIAvRwJlz
         l7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=yCs3NROrZCWzC+VF7Ed7Zg+CSfK98h/BzXS8h1Jj/QU=;
        b=t8SZnLOWhvYXojQayjpaUfzyEWVK0zszn4gVEhO+dLVk48zWWeMQLEPe6a9BxaadvL
         /rgxs0gJFqN1k4Ih/MWONWVB+ZKPK79iwrCzP/eCx9rSqYDY3FjsD5cCHw1SYtblcasY
         yF1fDIHg/3QvofpntPUXIvowYD4GORPkdPKqaDB9nbJSrJJZ1d4CCuTEtbMwjOliAB6X
         IzobmeJu5WB/cdG9PJAxHIPYgjPEtZDpRq5eteFqSm4qUBMhOJ2Ouh62T5BqDOttGtCe
         4e0g7c7e0jfSRooctSvU7FGq8+LCkBK17zhXEJ9P2/12KLOKYH1WiicVweBEyQSwXd/z
         uHng==
X-Gm-Message-State: AOAM531Rvm9fsotwWRbwzcnmZs3ElG96hMjju3/aqP9fWRqXfy4i//BC
	BRN2D7QuZtmNvwXfyUGBY9293g==
X-Google-Smtp-Source: ABdhPJy1iaXxai6Hx51lIotwF5rZjJLBc7BtWiAI4hGPo3ic5xutU6PRA6Srkqgz+SwhbQy8b//Xog==
X-Received: by 2002:a05:600c:3b23:: with SMTP id m35mr10450305wms.185.1624006522221;
        Fri, 18 Jun 2021 01:55:22 -0700 (PDT)
References: <20210426034709.595432-1-marmarek@invisiblethingslab.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] i386: load kernel on xen using DMA
Date: Fri, 18 Jun 2021 09:54:14 +0100
In-reply-to: <20210426034709.595432-1-marmarek@invisiblethingslab.com>
Message-ID: <87sg1feemf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com> writes:

> Kernel on Xen is loaded via fw_cfg. Previously it used non-DMA version,
> which loaded the kernel (and initramfs) byte by byte. Change this
> to DMA, to load in bigger chunks.
> This change alone reduces load time of a (big) kernel+initramfs from
> ~10s down to below 1s.
>
> This change was suggested initially here:
> https://lore.kernel.org/xen-devel/20180216204031.000052e9@gmail.com/
> Apparently this alone is already enough to get massive speedup.
>
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> ---
>  hw/i386/pc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8a84b25a03..14e43d4da4 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -839,7 +839,8 @@ void xen_load_linux(PCMachineState *pcms)
>=20=20
>      assert(MACHINE(pcms)->kernel_filename !=3D NULL);
>=20=20
> -    fw_cfg =3D fw_cfg_init_io(FW_CFG_IO_BASE);
> +    fw_cfg =3D fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4,
> +                                &address_space_memory);
>      fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
>      rom_set_fw(fw_cfg);

Gentle ping. The fix looks perfectly sane to me but I don't have any x86
Xen HW to test this one. Are the x86 maintainers happy to take this on?

FWIW:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

