Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E628B96B0
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 10:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715654.1117432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2S53-0008Oh-Nv; Thu, 02 May 2024 08:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715654.1117432; Thu, 02 May 2024 08:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2S53-0008M9-Kk; Thu, 02 May 2024 08:46:17 +0000
Received: by outflank-mailman (input) for mailman id 715654;
 Thu, 02 May 2024 08:46:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ua+q=MF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s2S52-0008M3-FL
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 08:46:16 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e859080-0860-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 10:46:13 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51c077cfc09so9118872e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 01:46:13 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a19ac0a000000b0051f2bc124b8sm98064lfc.282.2024.05.02.01.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 01:46:12 -0700 (PDT)
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
X-Inumbo-ID: 6e859080-0860-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714639573; x=1715244373; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=119SfVGplz4DEiOku4pP5MJJYMC0Kn1JeItPRGIgL6I=;
        b=U85BpGolPpegSz+AZZd83xu4+ctSA1Ay4GaxRKwPGumu7LXlJP2eM5r/MfT5g7vjtQ
         aLHHhfTsV2SMpRXwJqK4IvrOrNHW9snO7yHEyBUtscjHcBCEk1oNYXWUZqC9vBJM+Kbp
         FgvZeF1W2sdDzw/VhI7/l4PWZjWF88rS5/ROlnDVFjVh8edEsD5sCNjSoe9juOYWXdy4
         CoyLOTcvpkxphUqhlbPDUMntvazPwBTiFwtXyirhy9ZptqSCLbuFqxpqULCBIzAThkgT
         dC3gGU4a4FzrPeRBQyfXn4t5FnLoXHYOtQAjL9QqGDKbdFgCC0+kVHinyGGFgwKP03uR
         Rz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714639573; x=1715244373;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=119SfVGplz4DEiOku4pP5MJJYMC0Kn1JeItPRGIgL6I=;
        b=TSAB49lGtVvkr5Uk0S90rJyVaSWEtkmUL8c4DuQpCHCsdPYeMDNCHjCj77/aFlUGu1
         Sy81YbNNDkL2LPcFfMi5UPxK11j6CoNbQdHeKyTcMxti5EHqAL6C06KCw1xgck2fy4Vt
         grrya13nwMKo1j7F+lB1TsrI1Dtz+CQABBqZ6gLEIBpaDPHqbee7HTQo2O5vY1kEE+mr
         xRphWttIF0237eCoqt4hzfQSMGEmYQmClnYtqi21b7s9TyQIBf2JxnrOt0CfyRuSoy2O
         flouznoU9XmgjrfMskCvuslSahxawz1bh1iNEOYdSZG8lfRd37JV1gq3Zxu/QyuHxK3v
         r5NA==
X-Forwarded-Encrypted: i=1; AJvYcCXwxsvrE9nUyipDqLz4rzGgAFFXIeb7bolkiFu7tVQRkwYqeTLCByYbEPmjdxFZxNIA0vaP9jHGENgEwwFlk/94UPNLATfWNfrPeyMlFV0=
X-Gm-Message-State: AOJu0Yw/YWu7jR1awspSAJn0cO6RCae74ebsHUqBE46jMwzdRfXoUc0r
	uCzVzOjs6yQ0b5jP2ihUoBPi1x3NtSaX86KQTGmqZ+uao2iPidohxS8JIQ==
X-Google-Smtp-Source: AGHT+IG59POMHBugH1TPVjU1L/yXCgOYEUuzRowyg8acD+st/dsd3VewFQerZYTtAMYt7kTu9LbFlw==
X-Received: by 2002:a19:550e:0:b0:51d:348b:80bb with SMTP id n14-20020a19550e000000b0051d348b80bbmr2610874lfe.55.1714639572959;
        Thu, 02 May 2024 01:46:12 -0700 (PDT)
Message-ID: <2cabc6a1448c6f18cab963bc463347f088d643dd.camel@gmail.com>
Subject: Re: [PATCH for-4.19] ppc/riscv: fix arch_acquire_resource_check()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, Alistair Francis
	 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
	Davis <connojdavis@gmail.com>
Date: Thu, 02 May 2024 10:46:12 +0200
In-Reply-To: <20240430153423.80875-1-roger.pau@citrix.com>
References: <20240430153423.80875-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-04-30 at 17:34 +0200, Roger Pau Monne wrote:
> None of the implementations support set_foreign_p2m_entry() yet,
> neither they
> have a p2m walk in domain_relinquish_resources() in order to remove
> the foreign
> mappings from the p2m and thus drop the extra refcounts.
>=20
> Adjust the arch helpers to return false and introduce a comment that
> clearly
> states it is not only taking extra refcounts that's needed, but also
> dropping
> them on domain teardown.
I am okay with such adjustment for now as it is more safe and nothing
will be missed during implementation of p2m, but I am curious how then
Arm handles that, their implementation is also just returns true. ( I
planned to have p2m implementation similar to Arm )

Anyway, based on that it safer for RISC-V:
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Fixes: 4988704e00d8 ('xen/riscv: introduce p2m.h')
> Fixes: 4a2f68f90930 ('xen/ppc: Define minimal stub headers required
> for full build')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> =C2=A0xen/arch/ppc/include/asm/p2m.h=C2=A0=C2=A0 | 7 ++++---
> =C2=A0xen/arch/riscv/include/asm/p2m.h | 7 ++++---
> =C2=A02 files changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/arch/ppc/include/asm/p2m.h
> b/xen/arch/ppc/include/asm/p2m.h
> index 25ba05466853..f144ef8e1a54 100644
> --- a/xen/arch/ppc/include/asm/p2m.h
> +++ b/xen/arch/ppc/include/asm/p2m.h
> @@ -81,10 +81,11 @@ static inline mfn_t gfn_to_mfn(struct domain *d,
> gfn_t gfn)
> =C2=A0static inline bool arch_acquire_resource_check(struct domain *d)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 /*
> -=C2=A0=C2=A0=C2=A0=C2=A0 * The reference counting of foreign entries in
> set_foreign_p2m_entry()
> -=C2=A0=C2=A0=C2=A0=C2=A0 * is supported on PPC.
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Requires refcounting the foreign mappings and=
 walking the p2m
> on
> +=C2=A0=C2=A0=C2=A0=C2=A0 * teardown in order to remove foreign pages fro=
m the p2m and
> drop the
> +=C2=A0=C2=A0=C2=A0=C2=A0 * extra reference counts.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> -=C2=A0=C2=A0=C2=A0 return true;
> +=C2=A0=C2=A0=C2=A0 return false;
> =C2=A0}
> =C2=A0
> =C2=A0static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
> diff --git a/xen/arch/riscv/include/asm/p2m.h
> b/xen/arch/riscv/include/asm/p2m.h
> index 87b13f897926..387f372b5d26 100644
> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -79,10 +79,11 @@ static inline mfn_t gfn_to_mfn(struct domain *d,
> gfn_t gfn)
> =C2=A0static inline bool arch_acquire_resource_check(struct domain *d)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 /*
> -=C2=A0=C2=A0=C2=A0=C2=A0 * The reference counting of foreign entries in
> set_foreign_p2m_entry()
> -=C2=A0=C2=A0=C2=A0=C2=A0 * is supported on RISCV.
> +=C2=A0=C2=A0=C2=A0=C2=A0 * Requires refcounting the foreign mappings and=
 walking the p2m
> on
> +=C2=A0=C2=A0=C2=A0=C2=A0 * teardown in order to remove foreign pages fro=
m the p2m and
> drop the
> +=C2=A0=C2=A0=C2=A0=C2=A0 * extra reference counts.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> -=C2=A0=C2=A0=C2=A0 return true;
> +=C2=A0=C2=A0=C2=A0 return false;
> =C2=A0}
> =C2=A0
> =C2=A0static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx)


