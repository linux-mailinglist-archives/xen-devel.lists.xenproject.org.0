Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4428BC94F
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 10:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717293.1119344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tWo-0005j8-OD; Mon, 06 May 2024 08:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717293.1119344; Mon, 06 May 2024 08:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3tWo-0005gq-L3; Mon, 06 May 2024 08:16:54 +0000
Received: by outflank-mailman (input) for mailman id 717293;
 Mon, 06 May 2024 08:16:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loHM=MJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s3tWn-0005gk-A3
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 08:16:53 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd979ec8-0b80-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 10:16:51 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51f1bf83f06so1905567e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 01:16:51 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a0565120b9000b0051c4e9ebc71sm1551840lfv.210.2024.05.06.01.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 01:16:50 -0700 (PDT)
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
X-Inumbo-ID: fd979ec8-0b80-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714983411; x=1715588211; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6ltznsBNEm1qvEPIFxf6ALehqFUyCcgDjD4oZEHMjg8=;
        b=LALemgNe2DkFaYjgzob0rlmpJsEVPvDavq2kZqxaheZw7lsnz5FeEmYz9gCN8IxoIj
         t5wp6fm/jabZnMUT/jSDkzp1/Ue0WTLJ/ootfYbPqWZGhHYd/3zMrvr1zHiv8WO8tDcB
         /gQmG5FCciZ14RcdOR55uP4X8BTwPDLxJo2gjLAe8efS1lQ/aW0YPIpBo1u7VPmXndxV
         cEsxST1zzm20+GYU0cWFEwUN4kzferDJByj/vZWY26KBx2KZW1ZS+YAwdnv+dbjff+fU
         UQCwyum4cxbj8Yhqd2vbXgNltpEKLhq6YyyDFMDGI7JdRB8XMHQEOlv87hKwz68X0c1p
         F0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714983411; x=1715588211;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ltznsBNEm1qvEPIFxf6ALehqFUyCcgDjD4oZEHMjg8=;
        b=Am4BQKoU0iMc21VaP0OLfc/CH8e7RNzkLtwK7iGOK3r4ZJ3XuJT60L/1lzeYH0/h4z
         H8GsSiQqNbXagE/B11J2ziFyGLQWU9iZKWfrF+fUCqk8veWsaSkryIWH4ueY6Tspk/RE
         CHRvEBLRN9NJnp+V7RUBDNXmaKISseo/JsrpGiuqTA34xRmsWsYcZrrg352HssXPHbpD
         O/B52j1vSKvSqQbcJBVqF6E1jVE2yLltV3IosxTMzrEbeLSmIbUQvJaGKLCAnawmbUaT
         B2ojqkdiab+CQrgBozLjDZIV40Av6umajhwaMSPtcJmEfyyqup8mMl/pq6vQehFm0AhN
         tmJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaMEOhOwDdP7JSYAAPsK6Fl1JtQb/Utg4elk90Z8J/5AJafnTCWLgceuxCD/0wakz0/OmaCQpmHe0wSy+Lg/viXzFeU+28uPJgRBAGmQo=
X-Gm-Message-State: AOJu0Yz+ivS3L/QZY9SopHAZCHlzzqqmQrwSCTg0ou2lw/pTpgckH0TE
	lJneHl8PBuCKYdgcJWIZjk8hQiBnr8sHxlqr5O9zPVQCjeeQXlpf
X-Google-Smtp-Source: AGHT+IFDVyYtHfiZu1KbCQvjbacSqSyptEw8QaSVmLR7h/n247yQeXey5mnAhx3IjY2mwz6XdmSq3Q==
X-Received: by 2002:a05:6512:3f09:b0:51e:ff32:16a8 with SMTP id y9-20020a0565123f0900b0051eff3216a8mr8830963lfa.62.1714983410531;
        Mon, 06 May 2024 01:16:50 -0700 (PDT)
Message-ID: <2d81e4700075b55f1885a4b1c7ee44ad046b35f2.camel@gmail.com>
Subject: Re: [PATCH v8 02/17] xen: introduce generic non-atomic test_*bit()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,  Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Date: Mon, 06 May 2024 10:16:49 +0200
In-Reply-To: <93eeb1d8-d41f-40e8-8ca2-e6828877b53d@suse.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
	 <1a0977e3cf5a2de9f760ca5ec89a0d096894a9e3.1713347222.git.oleksii.kurochko@gmail.com>
	 <3827c11c-6d47-411d-a356-871def4e5b30@suse.com>
	 <940f11ee23b43ada1dba50bc0236c4764eb13d71.camel@gmail.com>
	 <93eeb1d8-d41f-40e8-8ca2-e6828877b53d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Mon, 2024-05-06 at 08:33 +0200, Jan Beulich wrote:
> On 03.05.2024 19:15, Oleksii wrote:
> > On Thu, 2024-04-25 at 17:35 +0200, Jan Beulich wrote:
> > > > =C2=A0 #include <asm/bitops.h>
> > > > =C2=A0=20
> > > > +#ifndef arch_check_bitop_size
> > > > +#define arch_check_bitop_size(addr)
> > >=20
> > > Can this really do nothing? Passing the address of an object
> > > smaller
> > > than
> > > bitop_uint_t will read past the object in the generic__*_bit()
> > > functions.
> > It seems RISC-V isn' happy with the following generic definition:
> > =C2=A0=C2=A0 extern void __bitop_bad_size(void);
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 /* --------------------- Please tidy above here ----------=
------
> > ----
> > =C2=A0=C2=A0 - */
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 #include <asm/bitops.h>
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 #ifndef arch_check_bitop_size
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 #define bitop_bad_size(addr) sizeof(*(addr)) <
> > sizeof(bitop_uint_t)
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 #define arch_check_bitop_size(addr) \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bito=
p_bad_size();
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 #endif /* arch_check_bitop_size */
>=20
> I'm afraid you've re-discovered something that was also found during
> the
> original Arm porting effort. As nice and logical as it would (seem
> to) be
> to have bitop_uint_t match machine word size, there are places ...
>=20
> > The following errors occurs. bitop_uint_t for RISC-V is defined as
> > unsigned long for now:
>=20
> ... where we assume such operations can be done on 32-bit quantities.
Based on RISC-V spec machine word is 32-bit, so then I can just drop
re-definition of bitop_uint_t in riscv/asm/types.h and use the
definition of bitop_uint_t in xen/types.h.
Also it will be needed to update __AMO() macros in <riscv>/asm/bitops.h
in the following way:
   #if BITOP_BITS_PER_WORD =3D=3D 64
   #define __AMO(op)   "amo" #op ".d"
   #elif BITOP_BITS_PER_WORD =3D=3D 32
   #define __AMO(op)   "amo" #op ".w"
   #else
   #error "Unexpected BITS_PER_LONG"
   #endif
Note: BITS_PER_LONG was changed to BITOP_BITS_PER_WORD !

Only one question remains for me. Given that there are some operations whic=
hcan be performed on 32-bit quantities, it seems to me that bitop_uint_t
can only be uint32_t.
Am I correct? If yes, do we need to have ability to redefine
bitop_uint_t and=C2=A0BITOP_BITS_PER_WORD in xen/types.h:
   #ifndef BITOP_TYPE
   #define BITOP_BITS_PER_WORD 32
  =20
   typedef uint32_t bitop_uint_t;
   #endif

~ Oleksii

>=20
> Jan
>=20
> > =C2=A0=C2=A0=C2=A0 ./common/symbols-dummy.o -o ./.xen-syms.0
> > riscv64-linux-gnu-ld: prelink.o: in function `atomic_sub':
> > /build/xen/./arch/riscv/include/asm/atomic.h:152: undefined
> > reference
> > to `__bitop_bad_size'
> > riscv64-linux-gnu-ld: prelink.o: in function
> > `evtchn_check_pollers':
> > /build/xen/common/event_channel.c:1531: undefined reference to
> > `__bitop_bad_size'
> > riscv64-linux-gnu-ld: /build/xen/common/event_channel.c:1521:
> > undefined
> > reference to `__bitop_bad_size'
> > riscv64-linux-gnu-ld: prelink.o: in function `evtchn_init':
> > /build/xen/common/event_channel.c:1541: undefined reference to
> > `__bitop_bad_size'
> > riscv64-linux-gnu-ld: prelink.o: in function `_read_lock':
> > /build/xen/./include/xen/rwlock.h:94: undefined reference to
> > `__bitop_bad_size'
> > riscv64-linux-gnu-ld:
> > prelink.o:/build/xen/./arch/riscv/include/asm/atomic.h:195: more
> > undefined references to `__bitop_bad_size' follow
> > riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol
> > `__bitop_bad_size'
> > isn't defined
> > riscv64-linux-gnu-ld: final link failed: bad value
> > make[2]: *** [arch/riscv/Makefile:15: xen-syms] Error 1
> >=20
> > ~ Oleksii
>=20



