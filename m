Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F64A941073
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 13:26:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767620.1178295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkyp-0001ah-5L; Tue, 30 Jul 2024 11:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767620.1178295; Tue, 30 Jul 2024 11:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkyp-0001Xv-1Z; Tue, 30 Jul 2024 11:25:23 +0000
Received: by outflank-mailman (input) for mailman id 767620;
 Tue, 30 Jul 2024 11:25:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3FYA=O6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sYkyn-0001Xp-Jz
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 11:25:21 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67232e3d-4e66-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 13:25:19 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52f04b3cb33so9994002e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 04:25:19 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5bd127csm1840913e87.89.2024.07.30.04.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 04:25:18 -0700 (PDT)
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
X-Inumbo-ID: 67232e3d-4e66-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722338719; x=1722943519; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0hoR/d+VPn4QBGvGRPEFrniE/WxftGNXc+fruYl+EEY=;
        b=U5gryV6cPwgZNQVCkW6dMjtu3AGT4FFrQuTDry/bam7lM1+SwWif34XqyYmnGvfmv3
         NXqb7UxJWyaewiUPqA41RzhbUvGVo1TtYpLpL0S+Ouzu5PaX+mgkheCt/U+aRz5b9nj8
         BaSRcbNF6cRNzvyplvg0bEme48hHwZv2/hO3y2sGVjP4e30zPAAZKGM6t01u9+PJEKIO
         bm+xwhDdIHnXKnezljC6swWK2zNrXcy4malwiU2waL5I1KldtRlLNOZupwknVheofExc
         8w3fI9WjsJS5GD7S1RA1kb0bJiEExK6A8zpmPS5BxZHGvPFA5C8oNIWzCRYUl0rf2byC
         U56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722338719; x=1722943519;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hoR/d+VPn4QBGvGRPEFrniE/WxftGNXc+fruYl+EEY=;
        b=Kv9TMU6wvssvMFasIyphM6UfBSb93nSjH0yvMwvhFTRA8Oq69x6qq+3otqGcwvr0Fx
         syxvm2qiJU5G1zzLWGJxsYgHwulEasSCvejxFqDnI36+awpuDPFe7i761SD9wPMq+qnE
         IFkxbJz/IFdG+hzzCNm7PPxs51M6zIePL1oOojTHOOONHcuhUooWr7FpxXuv6/UlWQCw
         dJGqFoafkreMCckRQxgiFMW4Mgw2d8XMrJTlzF58rn6P5/2HA6gRK3OwYDbAa1d2B7sI
         A6eyJ3gTO2hGYzwodIV7a6sXquOf3GNly+VoAGhSZ0N30iheH6TFxb61QGLd5mAatMY+
         6RMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm6cYRyUoCLaKAwrHO5axwe/89CiFf2s6EYNA4WC80yrhsgV2ZyZeYWV65gUE+yWXTwaCwZF4yFKD42AYrYelPpDO5A9OfHQopNlkdV10=
X-Gm-Message-State: AOJu0YwasNs2lQercZiVuAoFWBmFH73IfA0m4jPmyxHYcRZL1MQoZCkB
	ss01gNlXZy96RRnq0fCvJp9mIq+dtB/Jz8siogu1dOULoWYGV7ZT
X-Google-Smtp-Source: AGHT+IGvs7BT8cO+/OX0o4u7JKi5jhVEZNiHYHBQdxe3xyJLlGhwdCuFs4YLeVmsLcbYNTV3aFpY/A==
X-Received: by 2002:a05:6512:39c1:b0:52e:fa5f:b6a7 with SMTP id 2adb3069b0e04-5309b2706eamr11058855e87.13.1722338718721;
        Tue, 30 Jul 2024 04:25:18 -0700 (PDT)
Message-ID: <2803670c49bdce4ef5982e7d149c77dda0701a31.camel@gmail.com>
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>
Date: Tue, 30 Jul 2024 13:25:17 +0200
In-Reply-To: <8b8b0304-9f6f-4ded-a451-edc8fdd0e52a@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
	 <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
	 <28d646ba3d95da2eaf40869e1c07d950a0f3f203.camel@gmail.com>
	 <8b8b0304-9f6f-4ded-a451-edc8fdd0e52a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-30 at 09:49 +0200, Jan Beulich wrote:
> On 29.07.2024 18:11, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Mon, 2024-07-29 at 15:35 +0200, Jan Beulich wrote:
> > > On 24.07.2024 17:31, Oleksii Kurochko wrote:
> > > > @@ -81,6 +82,14 @@ static inline void
> > > > flush_page_to_ram(unsigned
> > > > long mfn, bool sync_icache)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > > > =C2=A0}
> > > > =C2=A0
> > > > +/* Write a pagetable entry. */
> > > > +static inline void write_pte(pte_t *p, pte_t pte)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 RISCV_FENCE(rw, rw);
> > > > +=C2=A0=C2=A0=C2=A0 *p =3D pte;
> > > > +=C2=A0=C2=A0=C2=A0 RISCV_FENCE(rw, rw);
> > > > +}
> > >=20
> > > Why the first of the two fences?=C2=A0
> > To ensure that writes have completed with the old mapping.
>=20
> Wait: There can certainly be uncompleted writes, but those must have
> walked the page tables already, or else a (synchronous) fault could
> not be delivered on the originating store instruction. Or am I
> misunderstanding how paging (and associated faults) work on RISC-V?
I am not sure that I correctly understand the part regarding (
synchronous ) fault. Could you please come up with an example?

If something during page table walk will go wrong then a fault will be
raised.

My initial intension was to be sure if I will be writing to an actively
in-use page table that other cores can see at the time then fences
above are required. It is not the case for now as we have only one CPUs
but I assume that it will be a case when SMP will be enabled and more
then one CPU will be able to work with the same page table.

>>> And isn't having the 2nd here going
>> to badly affect batch updates of page tables?
>> By batch you mean update more then one pte?
>> It yes, then it will definitely affect. It could be dropped here but
>> could we do something to be sure that someone won't miss to add
>> fence/barrier?

> Well, imo you first want to spell out where the responsibilities for
> fencing lies. Then follow the spelled out rules in all new code you
> add.
It makes sense. It would we nice if someone can help me with that.

>=20
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 BUG_ON(pte_is_valid(*pte));
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 tmp =3D paddr_to_pte(LINK_TO_LOAD((unsigned
> > > > long)&xen_fixmap),
> > > > PTE_TABLE);
> > >=20
> > > I'm a little puzzled by the use of LINK_TO_LOAD() (and
> > > LOAD_TO_LINK()
> > > a
> > > little further up) here. Don't you have functioning __pa() and
> > > __va()?
> > No, they haven't been introduced yet.
>=20
> So you're building up more technical debt, as the use of said two
> constructs really should be limited to very early setup. Aiui once
> you have functioning __va() / __pa() the code here would want
> changing?

Ideally yes, it would want to changed.

Would it be the better solution to define __va() and __pa() using
LOAD_TO_LINK()/LINK_TO_LOAD() so when "real" __va() and __pa() will be
ready so only definitions of __va() and __pa() should be changed.

~ Oleksii

