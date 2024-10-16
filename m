Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1E39A07CB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 12:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819946.1233435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t11c4-0003Kq-9W; Wed, 16 Oct 2024 10:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819946.1233435; Wed, 16 Oct 2024 10:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t11c4-0003JG-6o; Wed, 16 Oct 2024 10:50:44 +0000
Received: by outflank-mailman (input) for mailman id 819946;
 Wed, 16 Oct 2024 10:50:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kaV7=RM=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t11c3-0003J9-El
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 10:50:43 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d2ff132-8bac-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 12:50:42 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c97c7852e8so4530718a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 03:50:42 -0700 (PDT)
Received: from localhost ([5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29749655sm171308366b.73.2024.10.16.03.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 03:50:41 -0700 (PDT)
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
X-Inumbo-ID: 7d2ff132-8bac-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729075842; x=1729680642; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/wOordqhTaHo/F3+nOz5hlXDS5A/In4gQzP651sSjY=;
        b=LcDTHxl2xr58UoJetck49yiE14CoC72wd/kDn1BalUqlU99NW6jPyw7je6VUZ8hcEs
         WhhP29kCLT8LlIEiVkd0JuCchS4p9oRScoEF7UBFyRehvleyHje7s7/wz2aInzqYhXA7
         IWxKTTg2RSbW7y/o+1Vlwb2tTnZJZ+c1Ya5hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729075842; x=1729680642;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n/wOordqhTaHo/F3+nOz5hlXDS5A/In4gQzP651sSjY=;
        b=nYUzq1NLQN9T62AuWeLEksRWfcqUkyYY3MV/21AHW4vSaw4yD1tLJ5xxaISpeMaK0S
         EsdsyRIqtVueHd6MiVdHoxa29vE0kl45UqWw9A+vc1OoAlGDY3xcfeOdzdvwfarCcFM+
         QuYensSdmwY6owSzNhAwTUJfTloj1JNG3QBl7o05UtqS4NEyCOSUpCltM/rwhEfCxv5I
         jeNq89LgJiaMfiW66EcTOVJvfATnYJVdVkS0fKzBWRsqqalmhMBtSsMbQc1lgJYGxmKs
         EDVDXbcGwLwZ/7lMDxRwfcYY70D5L8c2abt4SkKu3Wde9eDcg12NjtPpaphAuNHSM4ZZ
         Mm4w==
X-Forwarded-Encrypted: i=1; AJvYcCWo6J9GqbTsfKJlY2qqTHmbLhErQZ11U/cI6mPTgYu6RbJNw8NA6WGrLXEJ5EEMSSUEJZ2f+kN0cSY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxgb3Q/+jyQpc8WBdff8BF6fik6akXVtI7ymvTib9rZVjpvjPrA
	sVd/1Z4Cjof9barYsHGyviqVgetIz1vpDnqK/xs8va6jup66wn3iFZPnA0QOpfMtmKmHtOU/05A
	V
X-Google-Smtp-Source: AGHT+IHZHt1/PaxVVnLSi05vNpSlTLWqwmiAZkxrUHBm3oIQuGm04NCIyD1gsXKfydbAuLx4zMsK+w==
X-Received: by 2002:a17:907:3602:b0:a99:389a:63c2 with SMTP id a640c23a62f3a-a99e3ea5c6bmr1442101266b.62.1729075841804;
        Wed, 16 Oct 2024 03:50:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Oct 2024 11:50:33 +0100
Message-Id: <D4X687XLJI5Z.35XQ462PS6ELQ@cloud.com>
Subject: Re: [PATCH v1 2/5] xen/riscv: implement maddr_to_virt()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Oleksii Kurochko" <oleksii.kurochko@gmail.com>,
 <xen-devel@lists.xenproject.org>
Cc: "Alistair Francis" <alistair.francis@wdc.com>, "Bob Eshleman"
 <bobbyeshleman@gmail.com>, "Connor Davis" <connojdavis@gmail.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>,
 "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>
X-Mailer: aerc 0.18.2
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
 <ec04dca87144194f5b3ecb9a78d142d370c9193f.1729068334.git.oleksii.kurochko@gmail.com>
In-Reply-To: <ec04dca87144194f5b3ecb9a78d142d370c9193f.1729068334.git.oleksii.kurochko@gmail.com>

On Wed Oct 16, 2024 at 10:15 AM BST, Oleksii Kurochko wrote:
> Implement the `maddr_to_virt()` function to convert a machine address
> to a virtual address. This function is specifically designed to be used
> only for the DIRECTMAP region, so a check has been added to ensure that
> the address does not exceed `DIRECTMAP_SIZE`.
>

nit: Worth mentioning this comes from the x86 side of things.

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/include/asm/mm.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm=
/mm.h
> index ebb142502e..0396e66f47 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -25,8 +25,12 @@
> =20
>  static inline void *maddr_to_virt(paddr_t ma)
>  {
> -    BUG_ON("unimplemented");
> -    return NULL;
> +    /* Offset in the direct map, accounting for pdx compression */
> +    unsigned long va_offset =3D maddr_to_directmapoff(ma);
> +
> +    ASSERT(va_offset < DIRECTMAP_SIZE);
> +
> +    return (void *)(DIRECTMAP_VIRT_START + va_offset);
>  }
> =20
>  /*


