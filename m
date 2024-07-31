Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29555942B21
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 11:47:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768396.1179174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ5vc-0007au-Pk; Wed, 31 Jul 2024 09:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768396.1179174; Wed, 31 Jul 2024 09:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ5vc-0007Xu-N8; Wed, 31 Jul 2024 09:47:28 +0000
Received: by outflank-mailman (input) for mailman id 768396;
 Wed, 31 Jul 2024 09:47:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8n5P=O7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sZ5vb-0007Xo-PC
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 09:47:27 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e489c3d4-4f21-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 11:47:25 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52efef496ccso762498e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 02:47:25 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c1963asm2164424e87.184.2024.07.31.02.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 02:47:24 -0700 (PDT)
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
X-Inumbo-ID: e489c3d4-4f21-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722419245; x=1723024045; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uHOcoRi7Su31WKQf7Ah9HT2//AChQFb3VGh1rZXuZUA=;
        b=gT5jXf+vWXSiXGywZKnRrj5CI6wmLMvwZ72UczpOmzdUFsxv4DBrVZE4gwHgVFURWP
         q6mmRIbXXUlhfPIfaPuhrOD+C5ffL9n8lMmHon7QiQ7hnFJdmkvsTK4Te8gyMKutAAsk
         UFgPfTn/JkfLbJESVLMpnhMkAFd+N+AczYMwNR3gKnXpgCDKLN7C9xjeSf+MAVhuVSu2
         OLmbt9xZotQz4MR7+4V1m3iVILrfqzDKU6C7NHBlut6U4TJ1REl4yfVhN7SLZ4hDEslH
         ny8uBL+MAgv0zCZoNwLBmTk8JUlep48WHKJ62vMnqfuF1yYBFNrm0+I0GvH1dM0sFkkY
         tAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722419245; x=1723024045;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uHOcoRi7Su31WKQf7Ah9HT2//AChQFb3VGh1rZXuZUA=;
        b=ejdipSh1Tiq3yRIJd+MEYBZj0THsPbJspKP+BCAcSaR6fpboSLwg2jgL7iF1wpY74J
         UsbP4ySaTkQMuneAkJZTmzwab+lWD5Jm4Ra7BZY+ho0eSr1bDWJLvEGKjJnnbnThTgqr
         D7lVCq/RbJL49ZTw8KkOyqpvoUNcWb5jVX+qf5/7O1pPQNxgx56/GUnXXQHH+dCzZdUw
         j7cl6gNpatlOC+FuQh65Yp9M4EbZJoKUCcwLIxtvdthQLsda9haRob4bSpai6s+lWSdU
         9A5sUmSuBKZOZloXRTF+2B2aUMZ+kYzqXDFS4GyVq01r8YZ1GGVp3Ydev4qFJSH5YzF2
         jSGA==
X-Forwarded-Encrypted: i=1; AJvYcCWLxzBFrTpnEOQLYcY/H3YaoRKVTlKpV0qbPJ7Ya5UsX4/4M8kVIF30HqnHEHvntNe2gadxmwwHe56y+324u8GOlAzWtk0dBhXzkgdZw4w=
X-Gm-Message-State: AOJu0Yy398sSq1dPYIde65YEku+2/ROwKSoG3FFSO5RkWTQu9zDkNhAv
	AfNiBAGBZ+bQddgjwi2Z3hPuQPP/3O/feiB7Wk2VDL595SxUluuN
X-Google-Smtp-Source: AGHT+IGMpuFfiqDNzk67R1EhjfHzWaaz2qq/lUEe8VKLtv2gPnlE0lsjJ6YouTtaG2p8RNsXlj6YVg==
X-Received: by 2002:a05:6512:340d:b0:52f:30d:526c with SMTP id 2adb3069b0e04-530aa83f553mr1640793e87.5.1722419244843;
        Wed, 31 Jul 2024 02:47:24 -0700 (PDT)
Message-ID: <bfb102170aa7100d7b32dba77d1263853112b060.camel@gmail.com>
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>
Date: Wed, 31 Jul 2024 11:47:23 +0200
In-Reply-To: <9ed45d6d-5fdc-4754-908c-1d29b66b850a@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
	 <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
	 <28d646ba3d95da2eaf40869e1c07d950a0f3f203.camel@gmail.com>
	 <8b8b0304-9f6f-4ded-a451-edc8fdd0e52a@suse.com>
	 <2803670c49bdce4ef5982e7d149c77dda0701a31.camel@gmail.com>
	 <9ed45d6d-5fdc-4754-908c-1d29b66b850a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-30 at 14:11 +0200, Jan Beulich wrote:
> On 30.07.2024 13:25, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-07-30 at 09:49 +0200, Jan Beulich wrote:
> > > On 29.07.2024 18:11, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > On Mon, 2024-07-29 at 15:35 +0200, Jan Beulich wrote:
> > > > > On 24.07.2024 17:31, Oleksii Kurochko wrote:
> > > > > > @@ -81,6 +82,14 @@ static inline void
> > > > > > flush_page_to_ram(unsigned
> > > > > > long mfn, bool sync_icache)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > > > > > =C2=A0}
> > > > > > =C2=A0
> > > > > > +/* Write a pagetable entry. */
> > > > > > +static inline void write_pte(pte_t *p, pte_t pte)
> > > > > > +{
> > > > > > +=C2=A0=C2=A0=C2=A0 RISCV_FENCE(rw, rw);
> > > > > > +=C2=A0=C2=A0=C2=A0 *p =3D pte;
> > > > > > +=C2=A0=C2=A0=C2=A0 RISCV_FENCE(rw, rw);
> > > > > > +}
> > > > >=20
> > > > > Why the first of the two fences?=C2=A0
> > > > To ensure that writes have completed with the old mapping.
> > >=20
> > > Wait: There can certainly be uncompleted writes, but those must
> > > have
> > > walked the page tables already, or else a (synchronous) fault
> > > could
> > > not be delivered on the originating store instruction. Or am I
> > > misunderstanding how paging (and associated faults) work on RISC-
> > > V?
> > I am not sure that I correctly understand the part regarding (
> > synchronous ) fault. Could you please come up with an example?
> >=20
> > If something during page table walk will go wrong then a fault will
> > be
> > raised.
>=20
> On the very insn, with subsequent insns not having started executing
> (from an architectural perspective, i.e. leaving aside speculation).
> That is what my use of "synchronous" meant.
>=20
> > My initial intension was to be sure if I will be writing to an
> > actively
> > in-use page table that other cores can see at the time then fences
> > above are required. It is not the case for now as we have only one
> > CPUs
> > but I assume that it will be a case when SMP will be enabled and
> > more
> > then one CPU will be able to work with the same page table.
>=20
> Would that first fence really help there? The other CPU could use
> the page tables in the window between the fence and the write. My
> understanding of the need for fences is for them to be used at times
> where ordering of memory accesses matters. For the moment I don't
> see this as an aspect for the 1st fence here, but I may be
> overlooking something.
AFAIU there are cases when we need the first fence, i.e. when superpage
breakup is happening and IIUC in this case we would first do a fence (
assuming pages are already allocated ), one fence between each
superpage breakup and its PTE, and one after each regular PTE write.
But in this case the first fence could be outside write_pte() function.

So we could eliminate the first fence in write_pte() and place it
outside the function ( if it will be needed for some cases ), thus
eliminating double fences.

~ Oleksii


