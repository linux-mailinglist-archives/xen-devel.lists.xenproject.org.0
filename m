Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1248783A64B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 11:03:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670865.1043939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSa5j-0003w6-Ju; Wed, 24 Jan 2024 10:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670865.1043939; Wed, 24 Jan 2024 10:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSa5j-0003tw-HE; Wed, 24 Jan 2024 10:02:43 +0000
Received: by outflank-mailman (input) for mailman id 670865;
 Wed, 24 Jan 2024 10:02:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k9jB=JC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSa5i-0003to-G3
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 10:02:42 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b641cda3-ba9f-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 11:02:41 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a311e9cca0cso44331766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 02:02:41 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 wb3-20020a170907d50300b00a2cc6398083sm14337600ejc.10.2024.01.24.02.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 02:02:40 -0800 (PST)
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
X-Inumbo-ID: b641cda3-ba9f-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706090561; x=1706695361; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P08UYimgPnZ4Wj/CCTMK24tZCWToGs+b4sSM2Ujxu5M=;
        b=Gs45pzx3NMjXCq2cXq7yOzgciU+FUqfYdB5PGXY5ft4JqDRK21+iEn8OYfTTVMERF2
         oVazKZgszE8vHZi4zXqpx6Q8CCGZVe474zBimUNxytXisgKmRVnmmGTUK1s2Bnj5ebn4
         d99CNdIsAkXitwClVqtKCWZBi6FQW7A79HCXK9SFnHi182EUNmlsUbrAwxe2d5K5gEcR
         lnEgIQ6OK4cBrkH2zQEWyfuJ2DiRgH4zDFv0Bc0ch9WoPS/i+sj1eqcZPDmTtvttYgkd
         pZCELEoJ/gl1psX6i+D6SQAaefAYDIceIgvqdS/1dz0bV9nFTGvroWHOunw6nvEvCodR
         p1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706090561; x=1706695361;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P08UYimgPnZ4Wj/CCTMK24tZCWToGs+b4sSM2Ujxu5M=;
        b=Ew3Mag5BYrTn/d0jyi/HiZbej4kNe3EqNYu/uknVtRaz1KtG3ByyKtWZJZpJ7Q6J4d
         QdyccTeVydIeA77l/ro4eOSSy6ccIhuzKF8WhK3lijUuL9Jz1PQGvPwV9qo6soSAlffo
         4oADlw7IDpVznk1er7Xzui5m2z7Wdl5Em7oSjo1+W55KZa6g7dY0igeOofeYl1fa4S8B
         ioYsqCLuItpAEV/8ntYXQx5m59UC9mrkFFXxMzPxrD1Gm4rws+Yesy73PEYbZYCdx305
         yE/9qW94U+B5rQq4nBWTKZrZuz26AEidFzspOYB8PcbkiQli/xRv9NOKKAmNNHxtUYFs
         Y54g==
X-Gm-Message-State: AOJu0Yxv3fDv6LsU8NpsPCVcsADitp8ST9DovXa3+fWQfUWdPYQx8Mk4
	KY13xoD7N3kcBOFWsSDuIGCxTUzqS9SvQc2zOUsEtHP+xR4S0PRq
X-Google-Smtp-Source: AGHT+IGbWXnfplk7L7bM9ymnETIgpGpguaV3qdsCHVQOHKU9/whBiYeaFViaBd26rE1aRfAkkO9O5w==
X-Received: by 2002:a17:906:3389:b0:a2a:767f:29cd with SMTP id v9-20020a170906338900b00a2a767f29cdmr775414eja.75.1706090560991;
        Wed, 24 Jan 2024 02:02:40 -0800 (PST)
Message-ID: <e22f3d3ee4bf786962622bdb5c196e4d22ea37ce.camel@gmail.com>
Subject: Re: [PATCH v3 29/34] xen/riscv: add minimal stuff to page.h to
 build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 24 Jan 2024 12:02:39 +0200
In-Reply-To: <2c3086e1-39d8-4060-93f1-4c53283c0d70@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <7aa26bdad9bf923fd57f7a90e41c049cab0cd5bd.1703255175.git.oleksii.kurochko@gmail.com>
	 <0740cab9-be2e-4aae-8b03-e3ec95d0b0ef@suse.com>
	 <c7004f13d082535cebd50fbe0e2446e3af78e48d.camel@gmail.com>
	 <2c3086e1-39d8-4060-93f1-4c53283c0d70@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-01-24 at 09:09 +0100, Jan Beulich wrote:
> On 23.01.2024 17:54, Oleksii wrote:
> > On Tue, 2024-01-23 at 12:36 +0100, Jan Beulich wrote:
> > > On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > Acked-by: Jan Beulich <jbeulich@suse.com>
> > > > ---
> > > > Changes in V3:
> > > > =C2=A0- update the commit message
> > >=20
> > > Once again I find this puzzling, considering there's no commit
> > > message
> > > at all.
> > By the I meant that asm/page.h was changed to page.h
>=20
> Oh. Can you say "title" or "subject" when you mean that, and "commit
> message" (or "description") only when you actually mean the
> description?
Sure, I'll stick to proposed terminology next time.
Thanks.

~ Oleksii

