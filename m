Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BE791441C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 10:02:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746202.1153194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeeb-0008SE-Ga; Mon, 24 Jun 2024 08:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746202.1153194; Mon, 24 Jun 2024 08:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeeb-0008P4-CB; Mon, 24 Jun 2024 08:02:21 +0000
Received: by outflank-mailman (input) for mailman id 746202;
 Mon, 24 Jun 2024 08:02:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeV4=N2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sLeea-0008Ou-4l
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 08:02:20 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13a90670-3200-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 10:02:18 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52ce6a9fd5cso571814e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 01:02:18 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b4785sm930734e87.15.2024.06.24.01.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 01:02:17 -0700 (PDT)
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
X-Inumbo-ID: 13a90670-3200-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719216138; x=1719820938; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vkhcj2sPlANy+bGdC4oEF7IGeQEhcSoWh14XUSl7Rlc=;
        b=IZ+9nvrnPeYsQ8A6qfrEn1cTKdyuujoYfJixwRjGNo8JNw5s2T7NoACvVZw+OZMkX+
         usmhliI+WqH91fKd9SKirn2HDkUd7g+mYl28P2jlD7je1exHCiPVT+ovQ9tfEwMRkWWH
         yLmlFWg0WQJGXsXI4sOJA2wghVu0PxAifmiBJFj3oGxyW1vYi6z3nmmf+lt1Wipbuj+5
         uQdXvYGETt7AUaKPWXHv9qYDvfY0li5tmG6QHxbFjzEJLr+sidyxEnkdAmfZk00LxRQH
         mWu4nESu3BKTrMTzDeP1m5NkfA6grdy88OIMFWAmCowmo4psFalcWtW8zGozBzSBDY3q
         x1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216138; x=1719820938;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vkhcj2sPlANy+bGdC4oEF7IGeQEhcSoWh14XUSl7Rlc=;
        b=D6MkQEtKPQS34srK8z13DYU+FbBqXgZ4utMuBUlYV1IgTDx9omQVkdFYJ/SkT2+VlM
         chf/OqUA8gBygUhc9tomj37RHShlxLEHGnhe3Zj4UGTKNzUFTFID8bz5irf46j42n4n9
         ogBg9zkXmWkiGMc9WucIA+bxk+mIeW085b99WNIUzOzhA16FR5C35fgXnQNezC/V1mpo
         zkUV4+zeFiK5FY2f6Cnl061zn/d0mS+8XXzjGJ75pwXJVueq21zoWyaffDYfEt4aPXJs
         amrp9iBTTnbsNAcveORB85YZMuSGOLWbxaZYVeffbClpwJnZmTDqlAUllfp65EHrVSya
         qu/A==
X-Forwarded-Encrypted: i=1; AJvYcCX4+1tBbgBPGx5mCkmNRnrE0Rtqr90H5CvdxA6e49ms5ULoPUaJubwuegIp6358ARB0Wv9dnl4WcM9yE+6Y3PDMlSSmXxVp/pniVRA3sXs=
X-Gm-Message-State: AOJu0YwrrqEKFOsX3YiKQ5Ek0oaRERUfDBWq65yXeeaSsTwrr99jJ3UK
	5jWau3t484iHHLf7CWBooZl9wNAdCvKP237g4UTOzXH0vgwXlYAK
X-Google-Smtp-Source: AGHT+IHS7USEhnHKXjVAqZ+l1BUwCw4DrHarJiu2Sxueeqojf2iKICCMtS00eP9vLDQ2YbhZIMOjvQ==
X-Received: by 2002:a05:6512:2805:b0:52c:dc69:28f3 with SMTP id 2adb3069b0e04-52ce185cfdfmr2530367e87.52.1719216137698;
        Mon, 24 Jun 2024 01:02:17 -0700 (PDT)
Message-ID: <d8b2b01e608c6ddedbb2b46f58e8bd46ecfd5ca9.camel@gmail.com>
Subject: Re: [PATCH 1/3] xen/riscv: Drop legacy __ro_after_init definition
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, George Dunlap
 <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Date: Mon, 24 Jun 2024 10:02:16 +0200
In-Reply-To: <20240621201928.319293-2-andrew.cooper3@citrix.com>
References: <20240621201928.319293-1-andrew.cooper3@citrix.com>
	 <20240621201928.319293-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-06-21 at 21:19 +0100, Andrew Cooper wrote:
> Hide the legacy __ro_after_init definition in xen/cache.h for RISC-V,
> to avoid
> its use creeping in.=C2=A0 Only mm.c needs adjusting as a consequence
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
>=20
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1342686294
> ---
> =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/include/xen/cache.h | 2 ++
> =C2=A02 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index 053f043a3d2a..3ebaf6da01cc 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -1,11 +1,11 @@
> =C2=A0/* SPDX-License-Identifier: GPL-2.0-only */
> =C2=A0
> -#include <xen/cache.h>
> =C2=A0#include <xen/compiler.h>
> =C2=A0#include <xen/init.h>
> =C2=A0#include <xen/kernel.h>
> =C2=A0#include <xen/macros.h>
> =C2=A0#include <xen/pfn.h>
> +#include <xen/sections.h>
> =C2=A0
> =C2=A0#include <asm/early_printk.h>
> =C2=A0#include <asm/csr.h>
> diff --git a/xen/include/xen/cache.h b/xen/include/xen/cache.h
> index 55456823c543..82a3ba38e3e7 100644
> --- a/xen/include/xen/cache.h
> +++ b/xen/include/xen/cache.h
> @@ -15,7 +15,9 @@
> =C2=A0#define __cacheline_aligned
> __attribute__((__aligned__(SMP_CACHE_BYTES)))
> =C2=A0#endif
> =C2=A0
> +#if defined(CONFIG_ARM) || defined(CONFIG_X86) ||
> defined(CONFIG_PPC64)
> =C2=A0/* TODO: Phase out the use of this via cache.h */
> =C2=A0#define __ro_after_init __section(".data.ro_after_init")
> +#endif
Why "defined(CONFIG_RISCV_64)" is missed?

~ Oleksii

> =C2=A0
> =C2=A0#endif /* __LINUX_CACHE_H */


