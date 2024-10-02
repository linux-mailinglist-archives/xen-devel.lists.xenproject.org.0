Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B40398D212
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 13:13:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808713.1220707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svxIR-0000sh-As; Wed, 02 Oct 2024 11:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808713.1220707; Wed, 02 Oct 2024 11:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svxIR-0000q0-7U; Wed, 02 Oct 2024 11:13:31 +0000
Received: by outflank-mailman (input) for mailman id 808713;
 Wed, 02 Oct 2024 11:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tl1C=Q6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svxIQ-0000pu-7L
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 11:13:30 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a144df3-80af-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 13:13:29 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5389917ef34so7642918e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 04:13:29 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a0437f3dsm1870800e87.182.2024.10.02.04.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 04:13:27 -0700 (PDT)
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
X-Inumbo-ID: 5a144df3-80af-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727867608; x=1728472408; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B1tSowlRQ/pK7K2eEpINDAKmdVjyuKuD8ybD0Adm3gw=;
        b=JIAaj8b1OlhqEkFUdBvOzVJyD7T0lOTn+5Kj0V9FUPwgETB3IlyXJ50iDqvCAqkD8r
         xVIcyNXPtIl1SsEWBLibANTn+SS1K7U32gz9Ey7JxzjhyUXzNYsGmoB7JbMdsBTtNpUV
         P+wI7GrIMM2d0xz91c+KPsxN4WWZvoU0XTJZxgm+G3u0UAwBbnhhW2UcNiwsxuSj8QdP
         msbH49ede8kglS1pmdQyrV4Sx365vvEh+n3TX5yQe2gzHHhliAjRWc6WEiQhy+cwpp12
         LB7whSuizR7Su+YI6Gi73OZT0Gm99T9QpEmrl4XwJzn1foiRTzJ//q2PX0Fji0SQ2Epw
         Ru1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727867608; x=1728472408;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B1tSowlRQ/pK7K2eEpINDAKmdVjyuKuD8ybD0Adm3gw=;
        b=s5IEVnKo7LEPfsJpENq37PuoTM9nCyTC9S2Ghd83vCdrwfEhGSSkfCM/BnKZ/0HLZK
         4Ybbxr6W7WBZJReJjcV/Zk/lomniMu4mOH80qITgkF4IiviSGIKroBGfSj+6+88SUFxx
         QWnmT8ah7X102wp4rjXHlvk5ZWcZ5yeIQbK+5Lad7zBHQr2bxEgrb8WAeILic0KFKGgP
         NlOBX2fh8Mc6rZwuH1S9sZLqercE/aG3fPtxAg/HsL4hhAFX5s6SYkio2tAml4k5MXH9
         uRiuWrHYZ47jNGwwlQyMc5vdTC90+1zPcb2xHh79XPTv1z8lVooRAoJmYYI4II3sox5B
         4gww==
X-Forwarded-Encrypted: i=1; AJvYcCUxiuuurfHT2AnPD5dUfUxSyMHJshgZyiRcMe4B1qL7oFGpuTtPAcjaQ6ddDalqM7b1HsZSyoRsEkE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbPR170nHnH8mnWv6s68PCsw1WCySKwW8hEkWatCZNLZLH2PJe
	eXmddq8HVCh/yTQJD5wk5YezJcVSElvbSN0RgLKwesQOXG3I4l4M
X-Google-Smtp-Source: AGHT+IHMOwr+pz24TUijjO07qY2zthSHeJHPbzM/izMDRRPBuA6mE3wsvUa4eMccNDHC+EO9h/C3MQ==
X-Received: by 2002:a05:6512:3501:b0:538:9e24:a3c9 with SMTP id 2adb3069b0e04-539a0663caemr1638675e87.20.1727867608191;
        Wed, 02 Oct 2024 04:13:28 -0700 (PDT)
Message-ID: <05fba591db1efdd97ec2ac48fdc99f4ec6ab6ba0.camel@gmail.com>
Subject: Re: [PATCH v1 2/3] xen/riscv: switch LINK_TO_LOAD() to
 virt_to_maddr()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 02 Oct 2024 13:13:26 +0200
In-Reply-To: <c5b75ca4-7fe2-4919-a9b0-0bf56947a247@suse.com>
References: <cover.1727708665.git.oleksii.kurochko@gmail.com>
	 <9a462c58f3af0ff5e5d312777cd1552b2a5a930c.1727708665.git.oleksii.kurochko@gmail.com>
	 <c5b75ca4-7fe2-4919-a9b0-0bf56947a247@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-10-01 at 17:44 +0200, Jan Beulich wrote:
> On 30.09.2024 17:08, Oleksii Kurochko wrote:
> > Except for switching LINK_TO_LOAD() to virt_to_maddr(),
> > LINK_TO_LOAD() is dropped, as virt_to_maddr() covers all
> > the cases where LINK_TO_LOAD() is used.
>=20
> Why "Except for ..."? I'm afraid I can'rt make sense of this.
I will reword that for clarity:
   Use virt_to_maddr() instead of LINK_TO_LOAD as virt_to_maddr()
   covers all the cases where LINK_TO_LOAD() is used.
  =20
Thanks.

~ Oleksii
>=20
> > @@ -225,7 +224,7 @@ void __init setup_fixmap_mappings(void)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(pte_is_valid(*pte));
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0 tmp =3D paddr_to_pte(LINK_TO_LOAD((unsigned long)&x=
en_fixmap),
> > PTE_TABLE);
> > +=C2=A0=C2=A0=C2=A0 tmp =3D paddr_to_pte(virt_to_maddr(&xen_fixmap), PT=
E_TABLE);
>=20
> Just like you don't open-code a cast here, ...
>=20
> > @@ -312,7 +311,7 @@ void __init remove_identity_mapping(void)
> > =C2=A0=C2=A0=C2=A0=C2=A0 pte_t *pgtbl;
> > =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int index, xen_index;
> > =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long ident_start =3D
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LINK_TO_LOAD(turn_on_mmu) &=
 XEN_PT_LEVEL_MAP_MASK(0);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virt_to_maddr((unsigned lon=
g)turn_on_mmu) &
> > XEN_PT_LEVEL_MAP_MASK(0);
>=20
> ... you shouldn't do so here. The virt_to_maddr() wrapper macro does
> so already.
>=20
> Jan


