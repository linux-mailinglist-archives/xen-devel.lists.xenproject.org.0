Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AC487223E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 16:00:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688819.1073473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhWG9-00075R-Vd; Tue, 05 Mar 2024 14:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688819.1073473; Tue, 05 Mar 2024 14:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhWG9-00073U-Sv; Tue, 05 Mar 2024 14:59:13 +0000
Received: by outflank-mailman (input) for mailman id 688819;
 Tue, 05 Mar 2024 14:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4c3Q=KL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rhWG8-00073O-Nb
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 14:59:12 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb420032-db00-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 15:59:09 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5672afabb86so2546416a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 06:59:08 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 em2-20020a056402364200b00567a2564ab5sm436008edb.67.2024.03.05.06.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 06:59:07 -0800 (PST)
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
X-Inumbo-ID: eb420032-db00-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709650748; x=1710255548; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+QiESiRoL1LCDBlrlcFDG1GSlwvQ2buTt+o1iVhMZog=;
        b=i4+dwgVzp8Zf+yl/1bHllWU0w5sd4EXFbEtQSRVzdv738ufcoBEwWIRNF5K/86/eR5
         UXw9Eajz1H4H27/AvJhXerS5cwsbsGq53w5haEEOmgnRL75x9sMRu7QoADpeDXNg+FRi
         pg5iQIMcXxuXZsqJb/FSzd40hwSLMZGrdNm8oKWzcy54DuhqaCKXYZ7mDxCqBJ6XF+wV
         THFeteuw9MFPxKwvXzXir3OGqhz2W9M7CcISazVFLWHStF5aYDTDx49oF2naNky5NjpU
         telMnNEO/9YIeuVnXZ+siqvSqWBQnschYo48tcqqzaQhhzj/qyCxZ381eKAK0y7ErVQo
         ODAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709650748; x=1710255548;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QiESiRoL1LCDBlrlcFDG1GSlwvQ2buTt+o1iVhMZog=;
        b=Dj/NL+yBLIQM2H73bLC5zfujEYgpsmppkVY02F4309zgn0DJVbkuQZ1wqCEAiRITQ0
         Opo5tU8aJRz9EuR1ABkm9aSqap7Hw9+MdOKLH6ipbnF1P+2yLA2b8J2loSugfv53Db+d
         R8IS0mcAEaJHemJutHC1en+c1RFEsQJQCOfaT2bK93bhZ93xqDSgqU6yZEehx114uJKI
         84wDx1OrHT+jzHtDAgrc9MlIsNhB4D3XwfitFmdDqBWUvASdRu2tPxtYntw3CggUY9F9
         Uw5LLlfLJiaF9/OoQCHOx54usiN9A14XhQd4p3zVc0QPv0aZZLtcFJbRKZj9ltsW2/rZ
         uGgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeEQL3FDy2HRTUcMvilPy3yluFRBZpnYA5feGQZT3I20rrspoJ/+7rHYralZfR92Ao+z32AdSAfVsvVibS7Qim3tLvepVlmUtHMbeHIi8=
X-Gm-Message-State: AOJu0YxRmIx/H0JsxWo729cTO/hea47pC9QnFgWKHY3QJr5r7/R5MFAN
	3HIjyRnlmev4sUPQrkQFDb3quVyB2eyJufNR/wqK41pbBhgdrXk6
X-Google-Smtp-Source: AGHT+IF+G2bGp4gqgY9gW8wgR37As/nsT5hENUB2TOfEPcc6zz6S/gTQbzh2PiQHW+k1IdsxTHUnRA==
X-Received: by 2002:a50:c88b:0:b0:564:f6d5:f291 with SMTP id d11-20020a50c88b000000b00564f6d5f291mr7313536edh.34.1709650748181;
        Tue, 05 Mar 2024 06:59:08 -0800 (PST)
Message-ID: <e630a5d49c8206bf69ab76cf465632e149a2dcf9.camel@gmail.com>
Subject: Re: [PATCH] xen/{RISCV,PPC}/xen.lds: Delete duplicate _erodata
 definitions
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>
Date: Tue, 05 Mar 2024 15:59:06 +0100
In-Reply-To: <20240305122121.3529541-1-andrew.cooper3@citrix.com>
References: <20240305122121.3529541-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

RISC-V changes look good to me.

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

On Tue, 2024-03-05 at 12:21 +0000, Andrew Cooper wrote:
> This is bad copy/paste from somewhere.=C2=A0 Retain the second _erodata
> symbol,
> which follows the Build ID, and matches the other architectures.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
> =C2=A0xen/arch/ppc/xen.lds.S=C2=A0=C2=A0 | 1 -
> =C2=A0xen/arch/riscv/xen.lds.S | 1 -
> =C2=A02 files changed, 2 deletions(-)
>=20
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> index 030e1ee37b55..05b6db272805 100644
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -60,7 +60,6 @@ SECTIONS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VPCI_ARRAY
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_ALIG=
N);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _erodata =3D .;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* End of read-only data */
> =C2=A0=C2=A0=C2=A0=C2=A0 } :text
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 #if defined(BUILD_ID)
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index 8510a87c4d06..ace6f49c579c 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -60,7 +60,6 @@ SECTIONS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VPCI_ARRAY
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_ALIG=
N);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _erodata =3D .;=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* End of read-only data */
> =C2=A0=C2=A0=C2=A0=C2=A0 } :text
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 #if defined(BUILD_ID)
>=20
> base-commit: fc84b4a5a37b9250d87ef63983b48e1953bba6d1
> prerequisite-patch-id: b14999775a3dc222f2f94d7d5d7a1db377de9cb9
> prerequisite-patch-id: 00650d75df673992b4c8cb6d7ac61dab72b9b309
> prerequisite-patch-id: 5464f5f1e7448cde38749a3744c9e74708727dee


