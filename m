Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07E992E6B5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757395.1166310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRs1Q-0003Mv-0f; Thu, 11 Jul 2024 11:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757395.1166310; Thu, 11 Jul 2024 11:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRs1P-0003K3-Ty; Thu, 11 Jul 2024 11:31:35 +0000
Received: by outflank-mailman (input) for mailman id 757395;
 Thu, 11 Jul 2024 11:31:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xIkU=OL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sRs1O-0002rp-RB
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:31:34 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20871211-3f79-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 13:31:34 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a6fd513f18bso103004866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 04:31:34 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6e58fasm245601866b.71.2024.07.11.04.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:31:33 -0700 (PDT)
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
X-Inumbo-ID: 20871211-3f79-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720697494; x=1721302294; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XVWFypspqZbwXhEAyE6wz9nfMnqjMMjBTQbws6Ueq2o=;
        b=KBL8shdPhlPdbzD5RfNf5yjH3f4Deb2tpUYejygOo8+j9Z0DwaUHNwNBmXfV6K5bUt
         qq8Sb+qbXPBo8wNEyElqmBB4DEqN16K3cq0rrrgRL8R4GXv+jJ6RGxZ7ZqpdU82CrP3/
         xCrHkImiAMBx9Dv1OKIrgpWVpl0P+I9kkHZSwqt8vjGxcO4R9m+Oq4sbJHbYrnNwALcx
         c2Id60WpwmWP8PF4PpLzDG999bKuyWX9wkUG4coJjbikMJb12qIZ8S8YfIvkU3vSwmu1
         kY+KIro04T+lM74wXX2NTTsTIoWcu185yNIyqRbrRGmxaJQGLTprtPbpWAngvs5b/PDy
         4HqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720697494; x=1721302294;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVWFypspqZbwXhEAyE6wz9nfMnqjMMjBTQbws6Ueq2o=;
        b=wqSQeyEB1spgkTgjjeT3rAzXoVLsGgmD4XkTRk1K3HeYieRrD5ZxLetTsSKBzeiL01
         dfU6YtKrNL+qSe8gLrmTD7YTj2LF/H0uqPdvC19J7PR4u3kMyA5MTjaE7BqkMDx9t+XJ
         G9paOlnYgG+HsQHHU+nVw/tY2Ikjfs4S1dTX6rinwtQgDnROkcdSdtLSbthxvDufgoGk
         3CyMdwqh58o0X6k1XHwDktmI2TCk/E+AXGxVyE+ePLBujR6wH8lmvhcF6oDH3u7/pCRA
         4PvZliYQv0tcFpZ+XOMSbhOr8cJ+BCIpDgb2CttvKrVjhRTXeLROq5e/qM6wMNcO8WbC
         QCwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfmP6LEUooro0yGI2Y5/NZgq15lIQeNaHkXaNr/wHRwG6DpE8SemYGDSlZRpEgWjTP3xaUPnNXMuqKaS4JedojaZn+XcBDfMpPNTn9ltM=
X-Gm-Message-State: AOJu0YzVvmRoZF/yBECfKfNNPxvMKDIvbswBZs+yAbXZbZhaCNO7zGZB
	CuWTSakqYTXPbiubJuy/UzOPB9MSL8L7BMFiOi9CFNoBbz0Q1lXv
X-Google-Smtp-Source: AGHT+IEVP7P3ByMyvbKr6WCMBrEaCWv3OrBQ1fGHLtncXDmMJJxzio3FM55Vr7/QxM/MBIL7nvu5sg==
X-Received: by 2002:a17:906:2bc5:b0:a77:aebc:8fb1 with SMTP id a640c23a62f3a-a780b6b1befmr505339566b.17.1720697493462;
        Thu, 11 Jul 2024 04:31:33 -0700 (PDT)
Message-ID: <e93e2deca92c64b71cfff83eac49efa834d4733b.camel@gmail.com>
Subject: Re: [PATCH v1 5/5] xen/riscv: map FDT
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  xen-devel@lists.xenproject.org
Date: Thu, 11 Jul 2024 13:31:32 +0200
In-Reply-To: <5b97113d-12f7-4051-88da-f08bb9cb3a70@xen.org>
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
	 <7e492df051c949744755a221c0448c740d2c681b.1720002425.git.oleksii.kurochko@gmail.com>
	 <3afd94c0-25f4-4ed8-83d2-6f261b8a64b3@suse.com>
	 <021d29540f8e9abec118e9ca9dcd9675310eda84.camel@gmail.com>
	 <5b97113d-12f7-4051-88da-f08bb9cb3a70@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-07-11 at 11:50 +0100, Julien Grall wrote:
> Hi,
Hi Julien,

>=20
> On 11/07/2024 10:40, Oleksii wrote:
> > On Wed, 2024-07-10 at 14:38 +0200, Jan Beulich wrote:
> > > On 03.07.2024 12:42, Oleksii Kurochko wrote:
> > > > Except mapping of FDT, it is also printing command line passed
> > > > by
> > > > a DTB and initialize bootinfo from a DTB.
> > >=20
> > > I'm glad the description isn't empty here. However, ...
> > >=20
> > > > --- a/xen/arch/riscv/riscv64/head.S
> > > > +++ b/xen/arch/riscv/riscv64/head.S
> > > > @@ -41,6 +41,9 @@ FUNC(start)
> > > > =C2=A0=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=
=A0=C2=A0=C2=A0 setup_initial_pagetables
> > > > =C2=A0=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 a0, s1
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal=C2=A0=C2=A0=C2=A0=
=C2=A0 fdt_map
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Calculate=
 proper VA after jump from 1:1 mapping */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 a0, .L_primary_switched
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sub=C2=A0=C2=
=A0=C2=A0=C2=A0 a0, a0, s2
> > >=20
> > > ... it could do with clarifying why this needs calling from
> > > assembly
> > > code. Mapping the FDT clearly looks like something that wants
> > > doing
> > > from start_xen(), i.e. from C code.
> > fdt_map() expected to work while MMU is off as it is using
> > setup_initial_mapping() which is working with physical address.
>=20
> Somewhat related to what Jan is asking. You only seem to part the FDT
> in=20
> start_xen(). So why do you need to call fdt_map() that early?
Let's continue our discussion in another thread ( I added you there ).

But the answer on your question is here:
https://lore.kernel.org/xen-devel/cover.1720002425.git.oleksii.kurochko@gma=
il.com/T/#m2890200a53c6ea2101e0f9e9ea77f589bd187e26

And
here:https://lore.kernel.org/xen-devel/cover.1720002425.git.oleksii.kurochk=
o@gmail.com/T/#m4e20792121b97465db7081cc4c1e27bdb15cdd51

Let me know if the link above answers your question.

~ Oleksii

