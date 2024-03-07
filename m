Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0F88758E0
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 21:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690036.1075668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riKkg-00005E-Em; Thu, 07 Mar 2024 20:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690036.1075668; Thu, 07 Mar 2024 20:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riKkg-0008VL-AZ; Thu, 07 Mar 2024 20:54:06 +0000
Received: by outflank-mailman (input) for mailman id 690036;
 Thu, 07 Mar 2024 20:54:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqh0=KN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1riKkf-0008VF-2k
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 20:54:05 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4fc3a95-dcc4-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 21:54:04 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d27184197cso17879571fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 12:54:04 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a05651c155400b002d3fc4cf12fsm979387ljp.13.2024.03.07.12.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 12:54:03 -0800 (PST)
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
X-Inumbo-ID: d4fc3a95-dcc4-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709844843; x=1710449643; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=imm5FjPSdjM/H/Il0nN2XawdNAy51EuJsfA6i504/7o=;
        b=ZcbEDJH5ZkW9uUrWXxjlFEM8Zmvh9foeK8+Jeb25Htn03sUi5zA8tJ+Gz2AcDcJtIu
         EVg/f6+IBd3GVsq30x4H6WgrxH+oml5pk0y0C5VnKm0KDabAq0R7itu9C0DN7ozOcBfJ
         yLWu6FOHD71dBtDoh+XEyOxrqNf8WWXh9bZ2CglLXadazIUsXFyEMQH8xOgkTrSoXUXZ
         NU2byk1wocKnhuksTRPMZCGjX8bznXXRd2wSShW0KWnqfs6T8kI7ALpb9dn5dTYPujy3
         tZGMv6PmFCaVnhVPtU9PnH4xp8+gfJIkVK12ffCxdeaLvCcxvuADXUvJWX/MmFquiGri
         Pfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709844843; x=1710449643;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=imm5FjPSdjM/H/Il0nN2XawdNAy51EuJsfA6i504/7o=;
        b=l3ioSjecGpH+K0zWvIHH9jfYzRT2bXD/khnnRWIIBtXHgU+1xWx+g8b25IFfnzPPSH
         hizzr9GBbzs+SyADOUVf1X9zZJ3eKKQsBhnUh8uYHvENXy4mFwXcsdtfHQ6wXlU5G6iB
         +a+hszDOfTnAsuRwxsgBtflrG6ANptUAjJdpsHzS5PLd/FLK6CjL2C/H75/f9FTBfU2s
         Xj5xqnreQeGIzUlR/xWCM5+Eo/R7nh7aTQNlMxA4g1bkcPqnRieBwBiZZvs/Xdwgz0Mm
         eWtxzDopjt9KfS5XsGqNvKayOmohfivFG5IDx7lZKu1KCxvqu+zl2Uh2TQTndZNIk2e0
         r0ow==
X-Forwarded-Encrypted: i=1; AJvYcCUx+CO0ujuKETKKDK2K5KTyZw5kPfxa3MeNYsxOjni7IZvDP7ZNG17YrC3Wplgba/W4wNj7ZmYE8iMcCPgrBST+/pWrD1j26AUMDxkNuZc=
X-Gm-Message-State: AOJu0YzR2RGAOyDdUnoxNatarfZRG43oHpXmH6b7qWEAEUHkjaHchcmN
	GNSAVNB6KjEIh/Tid3KL5Y6H7aOka1jaJVrJBZs0i1VaLWQIhjJc
X-Google-Smtp-Source: AGHT+IF+qmH1hGbuPwPu8NWHRuqnXJjS+4b4+wAzJ0cSa+Dc17QEnUUN7ALIGXt1mVNQSa078Wqgww==
X-Received: by 2002:a2e:b788:0:b0:2d3:6739:7e94 with SMTP id n8-20020a2eb788000000b002d367397e94mr2479689ljo.14.1709844843330;
        Thu, 07 Mar 2024 12:54:03 -0800 (PST)
Message-ID: <d3eabf773211defb2f8a9a22545fca5c7cf3eca1.camel@gmail.com>
Subject: Re: [PATCH v5 12/23] xen/riscv: introduce io.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 07 Mar 2024 21:54:02 +0100
In-Reply-To: <9ec718f3bba178d437035add3c7467011fc3ffc0.camel@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <dd7c95b5197dfd0cca0edf9c0ada631336eb60d7.1708962629.git.oleksii.kurochko@gmail.com>
	 <807c31d5-0c5a-4646-ba90-2f284289069f@suse.com>
	 <d047c0956f804f7191f91b1d690650e220ec0fe4.camel@gmail.com>
	 <a164230f-2054-47e9-b72c-51f4a5955fe0@suse.com>
	 <2a3e49bf94332c17b50e4f0f745e4b28b16dceb1.camel@gmail.com>
	 <2a05c233-b3c5-417c-bd6b-8b1c21f03c3d@suse.com>
	 <e51500581bb71ef9cc2879050e2577802a5dd14c.camel@gmail.com>
	 <bbd4ea96-565a-4843-a4fe-fbbc714ddbf6@suse.com>
	 <9ec718f3bba178d437035add3c7467011fc3ffc0.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-03-07 at 21:49 +0100, Oleksii wrote:
> On Thu, 2024-03-07 at 18:14 +0100, Jan Beulich wrote:
> > For plain writes it should at least be "=3DQo" then, yes.
> Constraints Q is a machine specific constraint, and I am not sure
> that
> it makes sense to use "=3Do" only and probably it is a reason why it is
> enough only "r". Does it make sense?
Probably for RISC-V can be used:
RISC-V=E2=80=94config/riscv/constraints.md
   ...
   A
       An address that is held in a general-purpose register.
   ...

AArch64 family=E2=80=94config/aarch64/constraints.md:
   ...
   Q
       A memory address which uses a single base register with no
   offset
   ...
Also 'no offset' explains why it was added 'o' constraint for Arm
additionally.

~ Oleksii

>=20
> > =C2=A0To me making those
> > input operands on Arm can't have been quite right.
> I=C2=A0 don't understand why they both are input, logically it looks like
> an
> address should be an output.
>=20
> ~ Oleksii
>=20


