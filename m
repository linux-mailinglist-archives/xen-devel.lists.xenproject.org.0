Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A97796C463D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:22:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513202.793871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peufa-0003We-OT; Wed, 22 Mar 2023 09:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513202.793871; Wed, 22 Mar 2023 09:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peufa-0003Tp-Lb; Wed, 22 Mar 2023 09:22:10 +0000
Received: by outflank-mailman (input) for mailman id 513202;
 Wed, 22 Mar 2023 09:22:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhKM=7O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1peufY-0003Tj-RU
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:22:08 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03b57ced-c893-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 10:22:06 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id h17so16228756wrt.8
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 02:22:06 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 f11-20020a5d4dcb000000b002cfe3f842c8sm13278782wru.56.2023.03.22.02.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 02:22:05 -0700 (PDT)
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
X-Inumbo-ID: 03b57ced-c893-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679476926;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QaQ3Bks+uUu+l2tEoMBUkW+ahXxFo7K3SAvP9M93PaA=;
        b=h/LvyNWtndyjm1b2uppfUdYckxwnx357jh4/z45cR6PtP5gLikJ0fZRXZhQxztXW5q
         zXH7B8F0pOsPl18kG2tW5OT1sRuqQY6uAGfDFuuPCDsgE98SWrXD4ef3g/Vh8jyJAEq2
         tgzKiXHpP/N5d84obSd18FhwJl38Pf3fvugJD/w0IXUgX+JBM0Y9N3QP+RLNCZfJx3KL
         tys6fsWM0PBywTa0KlUEkN4l+T66uPh2dm8Ca7s7dWnZAxzDLCiCOTIrE/U6QkObiLFJ
         I5GB2TIdlzmFT36udTD6Q3IHaXdc8xOQDKRqrdK9dUhlIaPH9RQJOnj9QeTzKvVqT7Zn
         +h4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679476926;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QaQ3Bks+uUu+l2tEoMBUkW+ahXxFo7K3SAvP9M93PaA=;
        b=Jbn3eyzL8THom9HsvesiAj0t/b/cBI8N+LevVVUBQ3UnP9oPlFStBpBQ/YmU5rV6R3
         sTMkWXt51rlNthWKeuD2Q3x06LOgdz8Zjj5vu0yB6ojWifDJsxvFpiysBcaF1VqH2T/b
         Obo2N9MZCIsz8oKY9k6ifyNQzRzn9JkguLp7FdONnv9+mDeVbIFkUROyPTq8cwL+8/Av
         dkVtxAGEthsOpbTK0MO+UzjHXdqtRK2De+/9hhXErglfc77smYem5AariDWnlVhcLMS7
         u5pYiPPhiUnQwHiH7oAHUkqX9qz30np6XZ//NNQg0TkRJ23yylU5AUE7+NvI0BMwXSxQ
         85ew==
X-Gm-Message-State: AO0yUKW9h88cnaobye56dhSmheClVY9hGIPG/CPr1JC0P7hAu1JxPT1E
	7aLHbluAFlmuKiPqMTKgcIA=
X-Google-Smtp-Source: AK7set/wRjfdQrhUpp8KXiKARSpuZiBKIYIoQ8Vc3fjdO67FMAGjzVeYoyQRVBvDho3ZGrZSp7SorA==
X-Received: by 2002:adf:e583:0:b0:2d0:3584:27f with SMTP id l3-20020adfe583000000b002d03584027fmr4816630wrm.68.1679476926196;
        Wed, 22 Mar 2023 02:22:06 -0700 (PDT)
Message-ID: <9d01344703e6e96dc3de02fefa2203be52e1ca3b.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 22 Mar 2023 11:22:04 +0200
In-Reply-To: <0d6cc462-8df6-bb49-5e24-5fb61df40a49@suse.com>
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
	 <85a21ada5a0fc44bb9db1dcc1f6cf191a6e66bfb.1678984041.git.oleksii.kurochko@gmail.com>
	 <27c2d76e-1f9e-01f2-846f-9f3bdddeefcf@suse.com>
	 <d5e9a5750e7cd32337b98ad39b60d3e95321caed.camel@gmail.com>
	 <0d6cc462-8df6-bb49-5e24-5fb61df40a49@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-22 at 09:12 +0100, Jan Beulich wrote:
> On 21.03.2023 18:08, Oleksii wrote:
> > On Mon, 2023-03-20 at 17:41 +0100, Jan Beulich wrote:
> > > On 16.03.2023 17:43, Oleksii Kurochko wrote:
> > > > +#define LEVEL_ORDER(lvl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (lvl * PAGETABLE_ORDER)
> > > > +#define LEVEL_SHIFT(lvl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (LEVEL_ORDER(lvl) +
> > > > PAGE_ORDER)
> > > > +#define LEVEL_SIZE(lvl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (_AT(paddr_t, 1) <<
> > > > LEVEL_SHIFT(lvl))
> > > > +
> > > > +#define XEN_PT_LEVEL_SHIFT(lvl)=C2=A0=C2=A0=C2=A0=C2=A0 LEVEL_SHIF=
T(lvl)
> > > > +#define XEN_PT_LEVEL_ORDER(lvl)=C2=A0=C2=A0=C2=A0=C2=A0 LEVEL_ORDE=
R(lvl)
> > > > +#define XEN_PT_LEVEL_SIZE(lvl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LEVEL=
_SIZE(lvl)
> > >=20
> > > Mind me asking what these are good for? Doesn't one set of macros
> > > suffice?
> > Do you mean XEN_PT_LEVEL_{SHIFT...}? it can be used only one pair
> > of
> > macros. I'll check how they are used in ARM ( I copied that macros
> > from
> > there ).
>=20
> There's no similar duplication in Arm code: They have LEVEL_..._GS(),
> but that takes a second parameter.
>=20
> > > > +#define XEN_PT_LEVEL_MAP_MASK(lvl)=C2=A0 (~(XEN_PT_LEVEL_SIZE(lvl)
> > > > -
> > > > 1))
> > > > +#define XEN_PT_LEVEL_MASK(lvl)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (VPN_=
MASK <<
> > > > XEN_PT_LEVEL_SHIFT(lvl))
> > > > +
> > > > +#define PTE_SHIFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10
> > >=20
> > > What does this describe? According to its single use here it may
> > > simply require a better name.
> > If look at Sv39 page table entry in riscv-priviliged.pdf. It has
> > the
> > following description:
> > =C2=A0 63 62 61=C2=A0 60=C2=A0=C2=A0=C2=A0 54=C2=A0 53=C2=A0 28 27=C2=
=A0 19 18=C2=A0 10 9 8 7 6 5 4 3 2 1 0
> > =C2=A0 N=C2=A0 PBMT=C2=A0=C2=A0 Rererved=C2=A0 PPN[2] PPN[1] PPN[0] RSW=
 D A G U X W R V
> > So 10 it means the 0-9 bits.
>=20
> Right. As said, I think the name needs improving, so it becomes clear
> what it refers to. Possibly PTE_PPN_SHIFT?
It will be better so I'll update it in new version of the aptch series.
>=20
> Another question: Do you really mean to only support Sv39?
At least for now yes, it looks like it is the most usable mode.
>=20
> > > > +/* Page Table entry */
> > > > +typedef struct {
> > > > +=C2=A0=C2=A0=C2=A0 uint64_t pte;
> > > > +} pte_t;
> > >=20
> > > Not having read the respective spec (yet) I'm wondering if this
> > > really
> > > is this way also for RV32 (despite the different
> > > PAGETABLE_ORDER).
> > RISC-V architecture support several MMU mode to translate VA to PA.
> > The following mode can be: Sv32, Sv39, Sv48, Sv57 and PAGESIZE is
> > equal
> > to 8 in all cases except Sv32 ( it is equal to 4 ).
>=20
> I guess you mean PTESIZE.
Yes, I mean PTESIZE.
>=20
> > but I looked at
> > different big projects who have RISC-V support and no one supports
> > Sv32.
> >=20
> > So it will be correct for RV32 as it supports the same Sv32 and
> > Sv39
> > modes too.
>=20
> Would you mind extending the comment then to mention that there's no
> intention to support Sv32, even on RV32? (Alternatively, as per a
> remark you had further down, some #ifdef-ary may be needed.)
I re-read documentation and it gave you incorrect information:

When SXLEN=3D32, the only other valid setting for MODE is Sv32, a paged
virtual-memory scheme described in Section 4.3.
When SXLEN=3D64, three paged virtual-memory schemes are defined: Sv39,
Sv48, and Sv57, described in Sections 4.4, 4.5, and 4.6, respectively.
One additional scheme, Sv64, will be defined in a later version of this
specification. The remaining MODE settings are reserved for future use
and may define different interpretations of the other fields in satp.

But I'll add #ifdef with the message that RV32 isn't supported now.

~ Oleksii

