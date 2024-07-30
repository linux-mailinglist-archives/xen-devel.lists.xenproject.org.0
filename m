Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3479410B8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 13:39:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767642.1178325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlCH-0006Or-ND; Tue, 30 Jul 2024 11:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767642.1178325; Tue, 30 Jul 2024 11:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlCH-0006N9-Jk; Tue, 30 Jul 2024 11:39:17 +0000
Received: by outflank-mailman (input) for mailman id 767642;
 Tue, 30 Jul 2024 11:39:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3FYA=O6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sYlCG-0006Li-4i
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 11:39:16 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5896fbb7-4e68-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 13:39:14 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52efbb55d24so6720388e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 04:39:14 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c0839bsm1849883e87.168.2024.07.30.04.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 04:39:13 -0700 (PDT)
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
X-Inumbo-ID: 5896fbb7-4e68-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722339554; x=1722944354; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UC3MDCHQrzzin0QjqNNR+3f4CmqCkUqJ6ZT8s6CwG1s=;
        b=lMJODSF+2HkvTMj6HdZgP9u9KZx4TqVLcqSdbmC9W3+QQ5iSB1GvztDwX7ECDnBm6k
         M/mHcEe7ReNCvKx7rCTeOfYF9lScoxy7WboCx6ZoshYrKH3KRuctVpZJFBO9R7Zp6HW/
         xF5vydEKfdpTZgNxBkpxTtulMGGa9g+qy24XZAZ6sxHLHm3H86GTeFQSZ23GLfWYyeW2
         wJZ5fh6SofGlPCydBeqG9c9CIIilx/6k6J/v+kUKIwgg60zUvam64u2NjEhO8emb1j9j
         gRP+uF0Y8vkocP1ef1mP7LbWuL9TqMRyM1+C1O2bZwaYajNKsPjSJZIqIRfAHNpqCLI/
         kw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722339554; x=1722944354;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UC3MDCHQrzzin0QjqNNR+3f4CmqCkUqJ6ZT8s6CwG1s=;
        b=M7URRSZBZLlcIcZo8j25lqm0/UKP4CZfMSX4iqyn/bl6og4UHA3noMkySUFbva1Q/E
         PYYyilTPXEfX5Hutj6iWqI9ptC5jbzS8D0II4k3Go84JcGWOuyu+vtT87eeQ2+UZcKPF
         PANTw+AIF2LA+KSKQ2LV6ecUP6IbnRfxHUmcdP2Jv28vuFxmg4MwwsvNjupTSnhjsaKV
         rZW21U0ehS04EkJRwYxYQEdufdUvMOF+wpKJQNSaeT0Y/dXY6O9JWK3ZVjSWBMcZb6RH
         wNJ+7cnxUlRpe1wHniHNRm9XAVc7RSDXyKUfHEFbsA6TT8bqc6xYi/h3wVRXTIOIwBLQ
         IWrA==
X-Forwarded-Encrypted: i=1; AJvYcCVBrhFPMM8/U/8T3YY+OxDYSTsDNJGMFsCtoTQEP0mfK3bn429qX0s7Jq7k26CAayS5BX422gTyse0mPWuZS2sTYxrgWHgFc/9ialg9i8M=
X-Gm-Message-State: AOJu0YxVF7eUK7FMPNElRyHALAKnFsAleiESmhcsfsDbbvFbxYMKBeR7
	aBCEAW0I5a9LKOgCb415OMl4+N5kmslFgiyqRpK5//yZ/MD8+Xd1
X-Google-Smtp-Source: AGHT+IFtXPtKWLrORtc/uhsAN6ZYUwBt75velvukHMvv3bkIxOXSTmQYpcIpr60LInE4UD3ebrha3A==
X-Received: by 2002:a05:6512:3da2:b0:52c:dd94:bda9 with SMTP id 2adb3069b0e04-5309b2d8a9cmr10045073e87.56.1722339553288;
        Tue, 30 Jul 2024 04:39:13 -0700 (PDT)
Message-ID: <035f836a53966194048df5b720b94a78b0a490ae.camel@gmail.com>
Subject: Re: [PATCH v3 5/9] xen/riscv: introduce asm/pmap.h header
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 30 Jul 2024 13:39:12 +0200
In-Reply-To: <6c2ebc9e-cc0d-4139-80a2-4d7025989a9e@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <11b5487659a9c76793e520c108cd92c6c84b908d.1721834549.git.oleksii.kurochko@gmail.com>
	 <3359e37e-eaae-49ca-80a5-2bf70b9b46c7@suse.com>
	 <78effb178b1ffe7ccb1714a13157e94f5e816b01.camel@gmail.com>
	 <6c2ebc9e-cc0d-4139-80a2-4d7025989a9e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-30 at 09:56 +0200, Jan Beulich wrote:
> On 29.07.2024 18:22, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Mon, 2024-07-29 at 16:29 +0200, Jan Beulich wrote:
> > > On 24.07.2024 17:31, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/include/asm/pmap.h
> > > > @@ -0,0 +1,33 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +#ifndef ASM_PMAP_H
> > > > +#define ASM_PMAP_H
> > > > +
> > > > +#include <xen/bug.h>
> > > > +#include <xen/mm.h>
> > > > +#include <xen/page-size.h>
> > > > +
> > > > +#include <asm/fixmap.h>
> > > > +#include <asm/flushtlb.h>
> > > > +#include <asm/system.h>
> > > > +
> > > > +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 pte_t *entry =3D &xen_fixmap[slot];
> > > > +=C2=A0=C2=A0=C2=A0 pte_t pte;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 ASSERT(!pte_is_valid(*entry));
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 pte =3D mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_R=
W);
> > > > +=C2=A0=C2=A0=C2=A0 write_pte(entry, pte);
> > > > +}
> > >=20
> > > Perhaps add a comment to clarify why it's safe to omit a TLB
> > > flush
> > > here.
> > > Note that arch_pmap_unmap() having one is a necessary but not
> > > sufficient
> > > condition to that. In principle hardware may also cache
> > > "negative"
> > > TLB
> > > entries; I have no idea how RISC-V behaves in this regard, or
> > > whether
> > > that aspect is actually left to implementations.
> > what do you mean by "negative" TLB? an old TLB entry which should
> > be
> > invalidated?
>=20
> No, I mean TLB entries saying "no valid translation here". I.e.
> avoiding
> recurring walks of something that was once found to have no
> translation.
But we can't modify an existent entry because we have
"ASSERT(!pte_is_valid(*entry))" in pmap_map() function and we are doing
TLB flush during pmap_unmap(). So when we will be in pmap_map() we are
sure that there is no TLB entry for the new pte.

>=20
> > > > +static inline void arch_pmap_unmap(unsigned int slot)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 pte_t pte =3D {};
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 write_pte(&xen_fixmap[slot], pte);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 flush_xen_tlb_range_va_local(FIXMAP_ADDR(slot),
> > > > PAGE_SIZE);
> > > > +}
> > >=20
> > > For both functions, even if mainly for documentation purposes, it
> > > may
> > > be desirable to mark them __init. It's again a necessary (but not
> > > sufficient) condition here, to validly use local TLB flushes
> > > only.
> > Does __init in this context means that it will be called only by
> > boot
> > cpu at the start and that is it?
>=20
> No, and I said so in my reply. __init is indicative of the function
> not
> being suitable for runtime use, but it is not enough to indicate the
> function is also unsuitable for use as soon as a 2nd CPU is being
> brought
> up. Yet for the latter we have no proper annotation. Hence my
> suggestion
> to use the former to have at least a limited indicator.
>=20
> An alternative might be to add ASSERT(system_state <
> SYS_STATE_smp_boot).
> That, however, exists in common/pmap.c already anyway.
>=20
> Yet another alternative would be a clarifying comment.
Thanks for clarifying. I will stick to the first option with __init.

~ Oleksii

