Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A77898AE0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 17:18:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700942.1094804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsOr7-0002Cs-Bp; Thu, 04 Apr 2024 15:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700942.1094804; Thu, 04 Apr 2024 15:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsOr7-00029s-8W; Thu, 04 Apr 2024 15:18:21 +0000
Received: by outflank-mailman (input) for mailman id 700942;
 Thu, 04 Apr 2024 15:18:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LwOm=LJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rsOr6-00029m-Rn
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 15:18:20 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 919d7009-f296-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 17:18:19 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a517d773844so160167766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 08:18:19 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a1709062f8400b00a4e07f8b6bfsm9108253eji.59.2024.04.04.08.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 08:18:18 -0700 (PDT)
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
X-Inumbo-ID: 919d7009-f296-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712243899; x=1712848699; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=giSZkoeMqOySw2+U+Xr21qoAa/CBbUcNGzBrxRAc4Ec=;
        b=dp0RfhcAqMoDHMRtVhM/qnuFs1mEBj+Xtx0ss29Xyvs4QXCcJLLHs1uA1IPrrwGThX
         gIlaOeaywqA2I/ID1TqWTDsVfq0ZBjLWafgFNSW31aSqJQlH0IhEBSTpf6x83dvBZ0Ej
         vsTc8upwJ8E5cQxYTS9I9xajVZx8rGS1MzFHx4WG8Iiqmyy4uyXsGAKq8WDgvJPfvykk
         ZSQ6upVlV3gePWwYiey6zHFxTFkhd99kYMeZDJ4O+OdSJQBcHX//mwYO+4VzRnZsA8BJ
         Kl1RolZt22rgP1aMe6HZuu95u0OHkcY+S40qlpoMKi5QEDmO//wAC4cIXDhHKlmo/1qz
         rygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712243899; x=1712848699;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=giSZkoeMqOySw2+U+Xr21qoAa/CBbUcNGzBrxRAc4Ec=;
        b=tn6VLRUprEs0s6nRULrtlSTAchJlz2Z/A9cgE+KOLUBKljzP2Hkyc4XYe1PBQnsZRK
         NfCw7r20QAUw/NPTRBLx0Tgyb3QsvZIEcCj0N5Hpk+mAspOEyN6D7UaJQyJi7wWGyCMU
         sFtOfrOBbXBdgj+QvClART5QYl7kX9S3nohkMKAuNQEPz6Hnv34u6ZqzrOS4UU9f0RBm
         JIpX+tSOOE4lL/MC4ZdRIYTrUw4wVe3QZahDGMVrPaLiglhDwT2nmK1wkj9sIipuV3a/
         dWqinB4pZ5UvG0FBoFXKUdC9U0tJ0udfMsbmno+QsxB+JdJHZDLXkg2M8X75mdIoITab
         9m/g==
X-Forwarded-Encrypted: i=1; AJvYcCVSxcS222CW/NC5CWk8y6T1oX00FGsugzGs5FLSsIDISzZFiY6Cm9JBXwoCDo9I9kXH7VqxY1/d+R2uNF2k3sYOCqZbsm0Q5x5LVjZ09vs=
X-Gm-Message-State: AOJu0YyaSPmATzAX2DCUe03BJNnjG1lAjg12apwqLdJLhHLEpc1UKPr3
	tohJeFBjAAx5+CDMeZKl5WXGGMdDW8KHBYfJ73hEJQRuZtbT/a81
X-Google-Smtp-Source: AGHT+IFoRjl3zx1DgAc0QptrXwkJEc18TF513ESCYFzzYAqGh39tVWT1ixNR0dsgmnbxdoz2NkSBig==
X-Received: by 2002:a17:906:17cc:b0:a47:3526:2e0f with SMTP id u12-20020a17090617cc00b00a4735262e0fmr1828827eje.75.1712243899140;
        Thu, 04 Apr 2024 08:18:19 -0700 (PDT)
Message-ID: <9945cb144f5c1b95202646135b88891537230e17.camel@gmail.com>
Subject: Re: [PATCH v7 03/19] xen/riscv: introduce extenstion support check
 by compiler
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Alistair Francis
 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>,  xen-devel@lists.xenproject.org
Date: Thu, 04 Apr 2024 17:18:18 +0200
In-Reply-To: <bda70742-04b7-4bab-8cdd-6b5a3d45dc3c@suse.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <0c9b0317d0fc4f93bf5cc0893d480853110b8287.1712137031.git.oleksii.kurochko@gmail.com>
	 <bda70742-04b7-4bab-8cdd-6b5a3d45dc3c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-04-04 at 12:07 +0200, Jan Beulich wrote:
> On 03.04.2024 12:19, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/arch.mk
> > +++ b/xen/arch/riscv/arch.mk
> > @@ -3,16 +3,27 @@
> > =C2=A0
> > =C2=A0$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> > =C2=A0
> > -CFLAGS-$(CONFIG_RISCV_64) +=3D -mabi=3Dlp64
> > +riscv-abi-$(CONFIG_RISCV_32) :=3D -mabi=3Dilp32
> > +riscv-abi-$(CONFIG_RISCV_64) :=3D -mabi=3Dlp64
> > =C2=A0
> > =C2=A0riscv-march-$(CONFIG_RISCV_ISA_RV64G) :=3D rv64g
> > =C2=A0riscv-march-$(CONFIG_RISCV_ISA_C)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 :=3D $(riscv-march-y)c
> > =C2=A0
> > +riscv-generic-flags :=3D $(riscv-abi-y) -march=3D$(riscv-march-y)
> > +
> > +zbb :=3D $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)
>=20
> While committing another question popped up: Why "" (i.e. no insn)
> here, ...
>=20
> > +zihintpause :=3D $(call as-insn,\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 $(CC) $(riscv-generic-
> > flags)_zihintpause,"pause",_zihintpause)
>=20
> ... but "pause" here?

In the case of the Zbb extension, we don't check for a specific
instruction, but with the Zihintpause, the idea was to verify if the
pause instruction is supported or not. However, in both checks, there
might be no instruction as an argument of as-insn.

~ Oleksii

