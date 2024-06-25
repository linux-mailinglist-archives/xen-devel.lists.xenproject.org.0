Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C54916D9A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 17:59:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747943.1155465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM8Zh-0000fX-9N; Tue, 25 Jun 2024 15:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747943.1155465; Tue, 25 Jun 2024 15:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM8Zh-0000e3-4I; Tue, 25 Jun 2024 15:59:17 +0000
Received: by outflank-mailman (input) for mailman id 747943;
 Tue, 25 Jun 2024 15:59:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM8Zf-0000dx-Nv
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 15:59:15 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddba23b1-330b-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 17:59:13 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ec17eb4493so77090771fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 08:59:13 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf5602a4sm533024966b.145.2024.06.25.08.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:59:11 -0700 (PDT)
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
X-Inumbo-ID: ddba23b1-330b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719331152; x=1719935952; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JITacUs7D1Gj2HE0H3VL2L2pGWzAGEoguFoI7P5ng78=;
        b=buao6hgOUWapjEA3fINT1N90Y1nMg6oNAzU2h7Yfhme32UkgFw3J+iwANO5sE4pw29
         mGlCaupZmXSUxU3tLUyclOjicwMuKAlVuIXgAS7dREgf2+goSd5esJ75Sg979aT0Neks
         donS9ULm7u0VCHUPXHCWxX50Z2QPwyLs25rJ3oKW5PiI/FoW4CyOAuhrSbxFNEaw8hg1
         Rm9WC7x1zCWfZDeYCwxVMafnosjUr42KCoxd/qv0uQF4SsQJguSXYWuS/matYofriRMA
         evpWr0h9Qgum/K3QxO+c+AlxirLyhuL0aoK5UzO01RZkEgLjJRopCzp5ULTS+DP63jqM
         xuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719331152; x=1719935952;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JITacUs7D1Gj2HE0H3VL2L2pGWzAGEoguFoI7P5ng78=;
        b=TJAB2t99MUvcqUAJGeLNaCZLLQuDfLU5BRGWlNilL9CZYjOpzgSYuoiPF0/uiNO7mP
         0Pdm/Ntz8zBUiHEC5vpMwdDIhIPM3VOnmPGTqOXpEBNAq42/t2OObIpfp/VENCi3HKLa
         GFt0X6f8UyNE4zoNeWpApMACR5CWyMD2S9Xy2h35lAqXq3UWe3plnJFzEjBj7poyNAvj
         D4dSnV0wrWZF0/0bs0jEqydPfFBR0I33FoXYbk9UEX0d/Ic1PGVJzgnDlLV7/z3uGpjZ
         y6mh5oOIJH5dz0VbGuYDWvRhRWBG8L793hDnFLukWMBxucHBJCABDlxd2Cu2soR5rKZ9
         8gfA==
X-Forwarded-Encrypted: i=1; AJvYcCXERrHSfSpnkks8t7BrUGzUdcDhA6yNLWJ6IEC4ugHLyWuN+vnQ8l/MMV0TtG/EGtCRMCe0xMJEB2A5XoamZJqzGu8X0PbyKpyFInOzkAo=
X-Gm-Message-State: AOJu0YyrijQvIhjLA9yXU8/ApmsEB0AfalKHamQsR0l1o2BPh2z8claq
	eNy4OSlxOwUd9g148bNeuAHChNlztiP0Rt2RJdUHUsaXBcd52p2q
X-Google-Smtp-Source: AGHT+IEBtYOJgQFuPTEap2DGCqiJog4+9l+aURO03qBTdPqcsXNv6FqYULjb6hfwcVl+MPv3quy18g==
X-Received: by 2002:a05:6512:2031:b0:52c:e119:7f1 with SMTP id 2adb3069b0e04-52ce185273amr4713342e87.51.1719331152022;
        Tue, 25 Jun 2024 08:59:12 -0700 (PDT)
Message-ID: <5729c8863e42c839db6a4244c80b3c9dd1574356.camel@gmail.com>
Subject: Re: [PATCH v13 03/10] xen/riscv: add minimal stuff to mm.h to build
 full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 25 Jun 2024 17:59:10 +0200
In-Reply-To: <3cb055bc-f61d-4045-8529-5a15fd5a7e00@suse.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
	 <3d44cf567f5c361cce2713808bcea1b1b6f4f032.1719319093.git.oleksii.kurochko@gmail.com>
	 <3cb055bc-f61d-4045-8529-5a15fd5a7e00@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-06-25 at 16:22 +0200, Jan Beulich wrote:
> On 25.06.2024 15:51, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Changes in V13:
> > =C2=A0- redefine mfn_to_page() and mfn_to_page().
>=20
> DYM page_to_mfn() here as one of the two?
Yes, one of them is page_to_mfn(). I will update the comment in next
version.

>=20
> > +/* Convert between machine frame numbers and page-info structures.
> > */
> > +#define mfn_to_page(mfn)=C2=A0=C2=A0=C2=A0 (frame_table + mfn_x(mfn))
> > +#define page_to_mfn(pg)=C2=A0=C2=A0=C2=A0=C2=A0 _mfn((unsigned long)((=
pg) -
> > frame_table))
>=20
> Is the cast really needed here?
I checked and it can be really dropped.

~ Oleksii

