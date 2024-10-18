Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DACF09A430E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 17:58:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822047.1236051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1pMS-0007N9-0g; Fri, 18 Oct 2024 15:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822047.1236051; Fri, 18 Oct 2024 15:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1pMR-0007L2-UH; Fri, 18 Oct 2024 15:57:55 +0000
Received: by outflank-mailman (input) for mailman id 822047;
 Fri, 18 Oct 2024 15:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jazm=RO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t1pMQ-0007Ku-Mu
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 15:57:54 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbf688e9-8d69-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 17:57:53 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2fb57f97d75so23156571fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 08:57:53 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb809a6922sm2504401fa.16.2024.10.18.08.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 08:57:52 -0700 (PDT)
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
X-Inumbo-ID: bbf688e9-8d69-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729267073; x=1729871873; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v5orI54nZBD+fu8JQy5cbVlXs/AsjxM47XNEU+WvlJo=;
        b=kumyMn51DVNGkLfOUmHfryFs1GRIkCNIVHyCHeANMuHRW6sKg+UCI4PDiSSRXUKFOk
         zlVa/64qsnyN/TJEXnpQ9dtCfQ5Jqc5Re5Ke8lNolXtHWRoBiBNq1U4t+F1zgQF5neI3
         nOogw+hcp2+YDmD5ykW0nS+T62AT2F03kWe+jJ/1MLZxSVvPlEsesOq4i3oj2W4XOQVb
         fDFJop4EmypDdAwy3pXhKSD93qODeskfHr33llomSNlqRV2+D0rlwCCcbzIy07JUwI49
         rp1/Ahnhtv177R1u6VxpaErrIWaZ9O5fHtMpU0bazxJBBeGeKoRofbRxSE2nOOxogAN1
         2vhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729267073; x=1729871873;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v5orI54nZBD+fu8JQy5cbVlXs/AsjxM47XNEU+WvlJo=;
        b=Tn0vw4krjaL9fdc2PDln1dRPbS7d9ifYE6Ey/Ds9JhYJmxXFKDjgHOancZR6NADWmh
         hLLzODdZvrksRt0Ps0oVWtWRWO9Sz2MpRA8fNrlE5Xm3ZvMlrM6/A0I11/E+hpvRgyf5
         JYhDc4o87pR+U4ABBYF8apkQ/AqRSMuKWziJ5Bnr3MxbpmoeekJlcCwJn24+pSvoaydW
         rMIhpwYTu20U9u1JXprNDxsESr0ACuhy9SYNdU2ptjMGZ8HIvHN6GqS9q7YzOx5VRgMl
         hwOvQpXGUwVuALDzOucmCdt9p2ppUcoD2uXjjAQ/LzuxVrwo1wns9IS2IQ3JyUkGRo6P
         UDiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwoaktYVQW83G0UJEgVL9/8tvOy5Dlyed0SxWcbv6QuTGug95QE0kB8iK1GqCa0UublrVRVQzdQ1k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzappmj2Tb6HD10YqDusrGTdhSoquvEur5SBBen6O6+9FsfexsJ
	NxsmECctzyb4dX9L6Tw0eMk3twuGvVCtyAIQFUySqBs9JnJNCb1g
X-Google-Smtp-Source: AGHT+IGd+kDjWFM4wSb2CwHkt8+qZYqj7stZyJLOZf279C/0iy98ifZ0fj5Ds8ZHSJn746YoDqNE5Q==
X-Received: by 2002:a2e:a99a:0:b0:2fb:4f0c:e40a with SMTP id 38308e7fff4ca-2fb83281b7bmr14684821fa.38.1729267072760;
        Fri, 18 Oct 2024 08:57:52 -0700 (PDT)
Message-ID: <6f1d21c3eb10edf9206f45b6c0c6afaa7bb58ef3.camel@gmail.com>
Subject: Re: [PATCH v1 1/5] xen/riscv: add stub for
 share_xen_page_with_guest()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Fri, 18 Oct 2024 17:57:51 +0200
In-Reply-To: <3f87a19f-c249-438a-ac1d-be9b8fd80c8e@suse.com>
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
	 <3dfd4bdf6584e73ecdbff5a66fdbaec68e31cc3c.1729068334.git.oleksii.kurochko@gmail.com>
	 <b8de7161-5d71-4ed7-a3cf-611f4a860926@suse.com>
	 <df635c41cf530d08898d021adf92eb141624d07d.camel@gmail.com>
	 <3f87a19f-c249-438a-ac1d-be9b8fd80c8e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-10-18 at 15:27 +0200, Jan Beulich wrote:
> On 18.10.2024 15:10, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Thu, 2024-10-17 at 16:51 +0200, Jan Beulich wrote:
> > > On 16.10.2024 11:15, Oleksii Kurochko wrote:
> > > > To avoid the following linkage fail the stub for
> > > > share_xen_page_with_guest()
> > > > is introduced:
> > >=20
> > > What do you intend to express with "is introduced"? Is there a
> > > problem now?
> > > Would there be a problem with subsequent changes? I'm entirely
> > > fine
> > > with
> > > adding that stub, but the description should make clear why /when
> > > exactly
> > > it's needed.
> > I mentioned that in the cover letter:
> > ```
> > =C2=A0=C2=A0 Also, after patch 3 ("xen/riscv: introduce setup_mm()") of=
 this
> > =C2=A0=C2=A0 patch series,
> > =C2=A0=C2=A0 the linkage error mentioned in patch 1 ("xen/riscv: add st=
ub for
> > =C2=A0=C2=A0 share_xen_page_with_guest()") began to occur, so patch 1
> > addresses
> > =C2=A0=C2=A0 this issue.
> > ```
> > I thought it would be the better then just mention in the commit
> > message that.
>=20
> Mentioning in the cover letter is fine, but each patch needs to also
> be self-contained.
>=20
> > Will it be fine to mention instead:
> > ```
> > =C2=A0=C2=A0 Introduction of setup memory management function will requ=
ire
> > =C2=A0=C2=A0 share_xen_page_with_guest() defined, at least, as a stub
> > otherwise
> > =C2=A0=C2=A0 the following linkage error will occur...
> > ```
>=20
> Quoting the linker error is imo of limited use. What such an
> explanation
> wants to say is why, all of the sudden, such an error occurs. After
> all
> you don't change anything directly related to common/trace.c.
if maddr_to_virt() is defined as:
    static inline void *maddr_to_virt(paddr_t ma)
   {
       BUG_ON("unimplemented");
       return NULL;
       // /* Offset in the direct map, accounting for pdx compression */
       // unsigned long va_offset =3D maddr_to_directmapoff(ma);
  =20
       // ASSERT(va_offset < DIRECTMAP_SIZE);
  =20
       // return (void *)(DIRECTMAP_VIRT_START + va_offset);
   }
Then no stub for share_xen_page_with_privileged_guests() is needed but
it isn't clear at all why the definition of maddr_to_virt() affects
linkage of share_xen_page_with_privileged_guests().

I tried to look what is the difference after preprocessing stage for
common/trace.o and the only difference is in how maddr_to_virt() is
implemented:
   7574a7575,7577
   >     do { if (__builtin_expect(!!("unimplemented"),0)) do { do { ({
   _Static_assert(!((30) >> ((31 - 24) + (31 - 24))), "!(" "(30) >>
   (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH)" ")"); }); ({
   _Static_assert(!((2) >=3D 4), "!(" "(2) >=3D BUGFRAME_NR" ")"); }); asm
   volatile ( ".Lbug%=3D:""unimp""\n" "   .pushsection
   .bug_frames.%""""[bf_type], \"a\", %%progbits\n" "   .p2align 2\n"
   ".Lfrm%=3D:\n" "   .long (.Lbug%=3D - .Lfrm%=3D) + %""""[bf_line_hi]\n" =
"
   .long (%""""[bf_ptr] - .Lfrm%=3D) + %""""[bf_line_lo]\n" "   .if " "0"
   "\n" "   .long 0, %""""[bf_msg] - .Lfrm%=3D\n" "   .endif\n" " =20
   .popsection\n" :: [bf_type] "i" (2), [bf_ptr] "i"
   ("./arch/riscv/include/asm/mm.h"), [bf_msg] "i" (((void*)0)),
   [bf_line_lo] "i" (((30) & ((1 << (31 - 24)) - 1)) << 24),
   [bf_line_hi] "i" (((30) >> (31 - 24)) << 24) ); } while ( 0 );
   __builtin_unreachable(); } while ( 0 ); } while (0);
   >     return ((void*)0);
   >=20
   7578d7580
   <     unsigned long va_offset =3D (ma);
   7580d7581
   <     do { if ( __builtin_expect(!!(!(va_offset < ((((vaddr_t)(509))
   << ((3 - 1) * (9) + 12)) - (((vaddr_t)(200)) << ((3 - 1) * (9) +
   12))))),0) ) do { do { ({ _Static_assert(!((35) >> ((31 - 24) + (31
   - 24))), "!(" "(35) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH)"
   ")"); }); ({ _Static_assert(!((3) >=3D 4), "!(" "(3) >=3D BUGFRAME_NR"
   ")"); }); asm volatile ( ".Lbug%=3D:""unimp""\n" "   .pushsection
   .bug_frames.%""""[bf_type], \"a\", %%progbits\n" "   .p2align 2\n"
   ".Lfrm%=3D:\n" "   .long (.Lbug%=3D - .Lfrm%=3D) + %""""[bf_line_hi]\n" =
"
   .long (%""""[bf_ptr] - .Lfrm%=3D) + %""""[bf_line_lo]\n" "   .if " "1"
   "\n" "   .long 0, %""""[bf_msg] - .Lfrm%=3D\n" "   .endif\n" " =20
   .popsection\n" :: [bf_type] "i" (3), [bf_ptr] "i"
   ("./arch/riscv/include/asm/mm.h"), [bf_msg] "i" ("va_offset <
   DIRECTMAP_SIZE"), [bf_line_lo] "i" (((35) & ((1 << (31 - 24)) - 1))
   << 24), [bf_line_hi] "i" (((35) >> (31 - 24)) << 24) ); } while ( 0
   ); __builtin_unreachable(); } while ( 0 ); } while (0);
   7582d7582
   <     return (void *)((((vaddr_t)(200)) << ((3 - 1) * (9) + 12)) +
   va_offset);

Could it be that DCE likely happen when maddr_to_virt() is defined as
stub and so code which call share_xen_page_with_privileged_guests() is
just eliminated? ( but I am not sure that I know fast way to check that
, do you have any pointers? )

~ Oleksii


