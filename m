Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3D69A3F36
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 15:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821892.1235862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1mkc-0006BO-7x; Fri, 18 Oct 2024 13:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821892.1235862; Fri, 18 Oct 2024 13:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1mkc-00069R-4E; Fri, 18 Oct 2024 13:10:42 +0000
Received: by outflank-mailman (input) for mailman id 821892;
 Fri, 18 Oct 2024 13:10:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jazm=RO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t1mka-00069H-72
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 13:10:40 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ef5a336-8d52-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 15:10:39 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso35027471fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 06:10:39 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb809a6a88sm2107801fa.7.2024.10.18.06.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 06:10:37 -0700 (PDT)
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
X-Inumbo-ID: 5ef5a336-8d52-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729257039; x=1729861839; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y402AQdR4+Tqh0flzvHXrC1KErpGurEXVRL8dNJKWU4=;
        b=Jr+WUfFQTRgiu9sK5hTuv2JHBtupiGy48QTOhUKmTL7+0v/4sHiwjZafNK3hAmr9Rv
         6yVdnioTVHDep7bjPbRGJKCn0vHHxM0Okw3TvU41rKYHqxqvHL7gOWact/I1IkonLA2a
         U93yr8pWTfwuDvCx9r4/WFRGHMVSpdES/8CGfwZT6O26Tr89PSenHZ80kf57KKMnD3it
         BmXNe7q5QnYdpJPErzyRmojqHhbrYrPrSI314caukfTRfH5PaSDBUErVoxr82RfcsxXd
         9NHr5gI2jzMz2Js6xkP9lZmpJfjisZjCeK6DE8tr0QU9RB6Gks259ipxRkP/Zddmm0gV
         zu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729257039; x=1729861839;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y402AQdR4+Tqh0flzvHXrC1KErpGurEXVRL8dNJKWU4=;
        b=vLVF9GjiMZUTIRnlWU5o6fc0tyKfKLE0OkIBIGpiHRTbqpO9zDmbWBdOKvltTABeqa
         7r1V6E1uXooOUCAoiisEKeWLuBVOnzFvr9WJejeT/zD/bKiiZy3yxmI4d9KO2SF62tMY
         P41d8WbLGFk3Hu1ulYwHRKfFyQb7Wwon5uoJxWK0xFg4MFsAreeJ+iUoF4ulo/8L3Lu2
         LkZUgBEFflteIheNH0aEOyEQEaYPYWHRTfWUyUvO2+Vk0PSh62tGbBhgv1Pik8ag/RtN
         1izjsYj0+bqpvIEZA0QkzEgotPaVGSrWIjTR8kz7si5RzTeRc94tYnkLIeERJlz5unmS
         K8JA==
X-Forwarded-Encrypted: i=1; AJvYcCU6mibGHB1tKAzg0D2/w5EUZoVR0IXP+YvfIk9OJ0DXlG5aQFzUdKHHV2zQqlEsAISwQVV2fwc4noY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvNz6Qy75Du6kNdtZsR3TaA2csYweYJXqesBaaD6pa/J8UcqfW
	tvS6b6Y9YnrU1CUH8DNywjsGFPyYcMOh+skD5fthMOa4RTitUjp5
X-Google-Smtp-Source: AGHT+IEKbar/6M5Rg+w53rlfJ6eirljl85OyaSMYH1ABVSWkCbLOLjk12tB7TWIGqHPWvXfmHY0KUQ==
X-Received: by 2002:a2e:851:0:b0:2f0:27da:6864 with SMTP id 38308e7fff4ca-2fb82eaae41mr15762261fa.17.1729257038174;
        Fri, 18 Oct 2024 06:10:38 -0700 (PDT)
Message-ID: <df635c41cf530d08898d021adf92eb141624d07d.camel@gmail.com>
Subject: Re: [PATCH v1 1/5] xen/riscv: add stub for
 share_xen_page_with_guest()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Fri, 18 Oct 2024 15:10:37 +0200
In-Reply-To: <b8de7161-5d71-4ed7-a3cf-611f4a860926@suse.com>
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
	 <3dfd4bdf6584e73ecdbff5a66fdbaec68e31cc3c.1729068334.git.oleksii.kurochko@gmail.com>
	 <b8de7161-5d71-4ed7-a3cf-611f4a860926@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-10-17 at 16:51 +0200, Jan Beulich wrote:
> On 16.10.2024 11:15, Oleksii Kurochko wrote:
> > To avoid the following linkage fail the stub for
> > share_xen_page_with_guest()
> > is introduced:
>=20
> What do you intend to express with "is introduced"? Is there a
> problem now?
> Would there be a problem with subsequent changes? I'm entirely fine
> with
> adding that stub, but the description should make clear why /when
> exactly
> it's needed.
I mentioned that in the cover letter:
```
   Also, after patch 3 ("xen/riscv: introduce setup_mm()") of this
   patch series,
   the linkage error mentioned in patch 1 ("xen/riscv: add stub for
   share_xen_page_with_guest()") began to occur, so patch 1 addresses
   this issue.
```
I thought it would be the better then just mention in the commit
message that.

Will it be fine to mention instead:
```
   Introduction of setup memory management function will require
   share_xen_page_with_guest() defined, at least, as a stub otherwise
   the following linkage error will occur...
```

Perhaps it would be better just to merge these changes with patch 3 and
add an explanation in patch 3 commit message.

~ Oleksii
> > =C2=A0 riscv64-linux-gnu-ld: prelink.o: in function `tasklet_kill':
> > =C2=A0 /build/xen/common/tasklet.c:176: undefined reference to
> > `share_xen_page_with_guest'
> > =C2=A0 riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol
> > `share_xen_page_with_guest' isn't defined
> > =C2=A0 riscv64-linux-gnu-ld: final link failed: bad value
> >=20
> > $ find . -name \*.o | while read F; do nm $F | grep
> > share_xen_page_with_guest && echo $F; done
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 U share_xen_page_with_guest
> > ./xen/common/built_in.o
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 U share_xen_page_with_guest
> > ./xen/common/trace.o
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 U share_xen_page_with_guest
> > ./xen/prelink.o
> >=20
> > Despite the linker fingering tasklet.c (very likely a toolchain
> > bug),
> > it's trace.o which has the undefined reference.
> >=20
> > Looking at trace.i, there is call of share_xen_page_with_guest() in
> > share_xen_page_with_privileged_guests() from asm/mm.h.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/arch/riscv/stubs.c | 10 ++++++++++
> > =C2=A01 file changed, 10 insertions(+)
> >=20
> > diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> > index 5951b0ce91..c9a590b225 100644
> > --- a/xen/arch/riscv/stubs.c
> > +++ b/xen/arch/riscv/stubs.c
> > @@ -2,7 +2,9 @@
> > =C2=A0#include <xen/cpumask.h>
> > =C2=A0#include <xen/domain.h>
> > =C2=A0#include <xen/irq.h>
> > +#include <xen/mm.h>
> > =C2=A0#include <xen/nodemask.h>
> > +#include <xen/sched.h>
> > =C2=A0#include <xen/sections.h>
> > =C2=A0#include <xen/time.h>
> > =C2=A0#include <public/domctl.h>
> > @@ -409,3 +411,11 @@ unsigned long get_upper_mfn_bound(void)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > =C2=A0}
> > +
> > +/* mm.c */
> > +
> > +void share_xen_page_with_guest(struct page_info *page, struct
> > domain *d,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum XENSHARE_flags flags)
> > +{
> > +=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > +}
>=20


