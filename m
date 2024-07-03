Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8014A92547E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 09:16:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752736.1160954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOuDJ-0007Td-K9; Wed, 03 Jul 2024 07:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752736.1160954; Wed, 03 Jul 2024 07:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOuDJ-0007R4-HQ; Wed, 03 Jul 2024 07:15:37 +0000
Received: by outflank-mailman (input) for mailman id 752736;
 Wed, 03 Jul 2024 07:15:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAj5=OD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOuDH-0007Qy-HB
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 07:15:35 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09c4c968-390c-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 09:15:34 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a689ad8d1f6so585136366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 00:15:33 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab0651dfsm490982766b.142.2024.07.03.00.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 00:15:32 -0700 (PDT)
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
X-Inumbo-ID: 09c4c968-390c-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719990933; x=1720595733; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oYkyjmcMSkbHI3m3v9yGfFEyUD8JC6zkZ2u1hcB7s1g=;
        b=PWlQNSvLSvR4zW3B43x+nBeRNdi4pAAdr3IaRW/ISyyYW2zm+lRLZtFyD9D7m3hKVw
         LMI2Y4uvBzQVsY10Y8nRqJ5lRjUvEvLApAin/pJfFmSFoJllB6ocIZbFIrFtpwuorOPW
         raadaxFIoEgy92xcGoHd/oH4cS18ORTrExAhdZQLcwKrebJMSbF/rbpO9D8Sxfh9sJnE
         X5QLrRZS/RRZA4M7bTubAJtTuGAy/ds1fHLGl4094dcqq9cLb3EoKQV4xn2yc5tcwNce
         yZLr2VyHzUDzIYVvD16temIYUn6tXeF7n6cbc/ssSC5vsnXez8vXsByiHA5/gE7Yns5k
         lqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719990933; x=1720595733;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYkyjmcMSkbHI3m3v9yGfFEyUD8JC6zkZ2u1hcB7s1g=;
        b=G8hKf2Fq2VRCCL+K5NhlfH5kUilOMtywLDi06PlGSHE+mnNJisEcrEG22Uoh92PjTg
         NRQ+vZAyD0U4zBIRhvyDZNpFsRxohC4TAvaHd/0zheThC4ouPueIhKl86ZmQlZFjFvxp
         AfbkB9c4qSTt/XqUoDZQRl990hhlQkWTPxWtn2aKlA2G4xu62L7XZBPb2YwEXKaAqKW1
         i/zghPPeTLB2GSWz7nLNGLPNMO+KBf4jp4UIlYNTz8DxRzSst1wLyFlexMZWTcloT7OI
         oz5wdCPhBJxXldEqMHPaEeEmc6wvKeUfIAckmM5NZ3ygV1TZkTi5lsLo7l86qzl1MMMM
         zOKg==
X-Forwarded-Encrypted: i=1; AJvYcCW4ljQ/YKxpA8kEsli1oYB3WzziRmMlxdl6RLOSgSXQ003r16vrJrpLhOu/NZf/Nmi9lPJ/4FdOCD7ZBj9BALvyhBXLSLN+2qC0o53OWW0=
X-Gm-Message-State: AOJu0YyE2C86eA9rJmpkqT0P/QlskWrNMkgMxa0igot2SeD4fMCTZAWp
	hZ2h9vBctNmqgY8o/bxeGo3sQiZ+edYi3iYUBZoY4DMpVfgJMDD4
X-Google-Smtp-Source: AGHT+IFCSPX2cMrckuoRAO/+PkFQop9yTRTelbZH5pzCBTekPympAvDrYs1+7jZHhDsTxUpPxa23wQ==
X-Received: by 2002:a17:907:728e:b0:a6f:9b06:6b42 with SMTP id a640c23a62f3a-a75142d855bmr755448566b.5.1719990933051;
        Wed, 03 Jul 2024 00:15:33 -0700 (PDT)
Message-ID: <0eda8cef4ae661e85e72c3731067b0350ff5ed28.camel@gmail.com>
Subject: Re: [PATCH v14 7/9] xen/riscv: use .insn with operands to support
 the older gas
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Date: Wed, 03 Jul 2024 09:15:32 +0200
In-Reply-To: <51b4aab3-c62f-4365-9b66-12e1d073bc6b@suse.com>
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
	 <a64f0de38fe32da9154d1944195ff6b852ae3310.1719917348.git.oleksii.kurochko@gmail.com>
	 <51b4aab3-c62f-4365-9b66-12e1d073bc6b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-02 at 14:02 +0200, Jan Beulich wrote:
> On 02.07.2024 13:01, Oleksii Kurochko wrote:
> > Support for specifying "raw" insns was added only in 2.38.
> > To support older version it would be better switch to .insn
> > with operands.
> >=20
> > The following compilation error occurs:
> > =C2=A0 ./arch/riscv/include/asm/processor.h: Assembler messages:
> > =C2=A0 ./arch/riscv/include/asm/processor.h:70: Error: unrecognized
> > opcode `0x0100000F'
> > In case of the following Binutils:
> > =C2=A0 $ riscv64-linux-gnu-as --version
> > =C2=A0 GNU assembler (GNU Binutils for Debian) 2.35.2
> >=20
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> > Andrew,
> >=20
> > Could you please take a look if you are okay with suggested
> > changes.
> >=20
> > Thanks in advance.
>=20
> I won't wait for too long for a reply here (perhaps until EOD
> tomorrow), as
> I expect the change to be pretty uncontroversial. However, to put it
> in at
> this point I'll need a release ack first anyway.
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

