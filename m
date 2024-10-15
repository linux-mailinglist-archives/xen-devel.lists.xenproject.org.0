Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA5D99E26C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 11:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819063.1232354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0daK-0002zW-GH; Tue, 15 Oct 2024 09:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819063.1232354; Tue, 15 Oct 2024 09:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0daK-0002wf-Db; Tue, 15 Oct 2024 09:11:20 +0000
Received: by outflank-mailman (input) for mailman id 819063;
 Tue, 15 Oct 2024 09:11:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XdMQ=RL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t0daJ-0002wZ-3D
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 09:11:19 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f917a58-8ad5-11ef-a0be-8be0dac302b0;
 Tue, 15 Oct 2024 11:11:17 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2fb51e00c05so23259811fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 02:11:17 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb5d1941d7sm1105181fa.77.2024.10.15.02.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 02:11:16 -0700 (PDT)
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
X-Inumbo-ID: 6f917a58-8ad5-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728983477; x=1729588277; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4rqPBWUwF7kPM9s+Vi2i7Q4ce8s5jgHA+VANq894Tkk=;
        b=AdFcf1I0Eag1lRaYiJ1AUrAKTcvKNrQZxW7pk2IfUaEi+uk+C6C1LSdOGWpp02OdM8
         GIDuNWLUPP5Ax58qHkavE43/XNeqhZDqB6asYzsaECTxk9N9OGQSjadvHZsJFCrUuokJ
         lP0dL9JVw1+f8fJMCEt7j5w9wCFsdvovRmQBlnhwsJIKi+xENT4LW7UCHQK4GvWw+dDo
         zQ5GtTSvxPT8dKx/LjSZArG/TR90dzCQqBLw6fM9jHAKuD3eE5lisM2wLR1idUtdavHo
         0bHS75pb3h5ssKH2lyRvI+RO70UnzO/HJTNGVwLIxpcXOOPUFIMQ2PwGmN8r7tjndldM
         KDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728983477; x=1729588277;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4rqPBWUwF7kPM9s+Vi2i7Q4ce8s5jgHA+VANq894Tkk=;
        b=HYy2wzHz7SfJ637kYH6c1JppbMFfJF2q9Xiea0RFfrIRHUS48/81QCtiM+zJH+HS/j
         JHRPJC8tesJlYYZrdvz0+nQslk/GEcPFBf4QA/weuXuGiEz+BRm5F0XgxztIQEkhadGv
         Dx+0K4kdg543I+YHIpDuntLggTFdIBB7Nx4asAQm3fSN55ungZ5wN2dNUe3xamnokfX8
         kT5dWIBpqy5Ne7GgJUG8SMqWotrVwmmKpFvxAeGR6CvXl/FOY99+/NzWfE/PfR8f6Tsg
         IffeGXb7ZrZPVjrIV1s05d/0QZIiuDxvTbVY2KX0OkJYg+M1y/qdZMxgD0BB5E9xCED6
         Pc2w==
X-Forwarded-Encrypted: i=1; AJvYcCXh9V0k0pfvoIkG48TXl+Gsqimvyi+gCjyh6Yc0OvNmJG5KL8IuxxiufwNGV3m41gwVA0Vm5UGLfWw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3sQCH3fjHZe/MAQBqblsE7i9mpd9VPSP8dtFTK9POLwGkvKPz
	Zc9HQArLerYOeaFt7s0CYfK/ixzbCS1XDb6JLm5ijfKdIViuPWwuKIR8dQ==
X-Google-Smtp-Source: AGHT+IGxM2AeS8AliK2w1IWNXJPw/Zj1TukNgzoWnyeYW8pwmF+L1Q9SidvXocmYDiwgsqG6nJd66w==
X-Received: by 2002:a2e:b992:0:b0:2fb:256a:59f9 with SMTP id 38308e7fff4ca-2fb3f1b7812mr47288081fa.22.1728983476976;
        Tue, 15 Oct 2024 02:11:16 -0700 (PDT)
Message-ID: <fce8372ee3bac4a0a3c6de58d7c7757df6e6d0a3.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] xen/riscv: initialize bootinfo from dtb
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 15 Oct 2024 11:11:15 +0200
In-Reply-To: <7e3399d7-f41c-4696-919b-dc7f57168bf9@suse.com>
References: <cover.1728481578.git.oleksii.kurochko@gmail.com>
	 <70c98147d7f977649ca3eb1a82cd76aeb0df1b14.1728481578.git.oleksii.kurochko@gmail.com>
	 <7e3399d7-f41c-4696-919b-dc7f57168bf9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-10-15 at 08:33 +0200, Jan Beulich wrote:
> On 10.10.2024 17:30, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -50,6 +50,8 @@ void __init noreturn start_xen(unsigned long
> > bootcpu_id,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 _end - _start, false) )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Failed to add B=
OOTMOD_XEN\n");
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 BUG_ON(!boot_fdt_info(device_tree_flattened, dtb_ad=
dr));
>=20
> We generally aim at avoiding side effects in BUG_ON() (or ASSERT()).
> With
>=20
> =C2=A0=C2=A0=C2=A0 if (!boot_fdt_info(device_tree_flattened, dtb_addr))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG();
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> I can make the adjustment while committing, if desired.
It would be great if these changes could be made during the commit.

Thanks.

~ Oleksii


