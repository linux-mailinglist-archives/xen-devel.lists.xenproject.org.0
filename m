Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 461F279163E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 13:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595091.928580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd7ls-0007TG-H2; Mon, 04 Sep 2023 11:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595091.928580; Mon, 04 Sep 2023 11:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd7ls-0007RY-E5; Mon, 04 Sep 2023 11:29:32 +0000
Received: by outflank-mailman (input) for mailman id 595091;
 Mon, 04 Sep 2023 11:29:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRlT=EU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qd7lr-0007RQ-2q
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 11:29:31 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 502e4b59-4b16-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 13:29:30 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2bcd7a207f7so19322901fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Sep 2023 04:29:30 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a2e9d90000000b002bccfd37659sm2069716ljj.99.2023.09.04.04.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 04:29:29 -0700 (PDT)
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
X-Inumbo-ID: 502e4b59-4b16-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693826970; x=1694431770; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mG6tIuG6MeJ6Vm7BapEi3ENGWqTkKkvgzZFpVTLl8o8=;
        b=KnCleExqqZy5X1tBiM2kPy3WAswQ6/PcLmL9BIH3VfvPLxpYf9GyYdJpfkbIh4CRnH
         DFtT9l6kLsYLA5SRcgvUHud4SeCrQY8eL9lzEfuZD56JLQ+i/4xeehKv+HYlWtYpMovN
         MV5218rN2L5nBlTB6q4QFq0ZXUHMUvFzq8USqACKCa/uQQ+TqqpE8VPmp9PSJNoaSaKY
         +atuNaAtgCEVjS6BVRThyC4lt2chuDPyOf9+hWMsVkjU0wSxXTde1S0+7+EiATj+NIlh
         kNzBiWc/POSDpx76sBqBDVax7duzrkrErgY1LMq+Wrl8psUIHAgHvil3On3mBHNCQCd7
         qTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693826970; x=1694431770;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mG6tIuG6MeJ6Vm7BapEi3ENGWqTkKkvgzZFpVTLl8o8=;
        b=iSsyd2oTmTpAzUZnnWdzRWivjZP0oOQikmR19sI0f1kuqCh+T5KN0meohwk9TJSUNx
         qKMq/I8AQLOEo2Lr3Cxo+uEivnKnMK/m0w1x8wjmvy75+5KC3Zl7t/S78cdpE3Isiyz7
         A0oHDhlq2OWAdYhfX1D11NEBeTWW9lg536lCDZdByvyaEEw5w348jefczMo6s6X5piMl
         LO/NVMQTjfA0UEx9m7wtmLKUWYZzvtcoE7vTnqMV4BaTlcymNpK+cWgw14iIZh/KzJi+
         6sGTXd4G0i9u7LH2HTvdyNqtO7z6RAz5RGvW9MYYbPGy094Ci+Jn9d34qw9yj4HLZR4y
         WJrw==
X-Gm-Message-State: AOJu0YxPOT1mtCvSPl3tsQe1sWnZ27doFTXPM370KARc7QuLPZ9E+ttv
	SSX+EuUse6pyzDRRcxN0IKs=
X-Google-Smtp-Source: AGHT+IFjGHZg3I/Q0v9VEOf/AyJ3tk6p9mRzNqUqmm8nBJKHx3QibhKlecnlW83dG5UJWCRnaAz5wg==
X-Received: by 2002:a2e:2c09:0:b0:2bc:d522:dfd4 with SMTP id s9-20020a2e2c09000000b002bcd522dfd4mr6922829ljs.8.1693826969662;
        Mon, 04 Sep 2023 04:29:29 -0700 (PDT)
Message-ID: <44ce802b41b9062a99e25f22590eac78519de908.camel@gmail.com>
Subject: Re: [PATCH v4 2/2] xen: move arm/include/asm/vm_event.h to
 asm-generic
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
	 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 04 Sep 2023 14:29:28 +0300
In-Reply-To: <464e3134-8b40-5f80-ddc8-7b523b1d3330@suse.com>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
	 <0d273a71bb3caca894485a33970a81ec9a9f44e5.1693583721.git.oleksii.kurochko@gmail.com>
	 <464e3134-8b40-5f80-ddc8-7b523b1d3330@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-09-04 at 08:54 +0200, Jan Beulich wrote:
> On 01.09.2023 18:02, Oleksii Kurochko wrote:
> > asm/vm_event.h is common for ARM and RISC-V so it will be moved to
> > asm-generic dir.
> >=20
> > Original asm/vm_event.h from ARM was updated:
> > =C2=A0* use SPDX-License-Identifier.
> > =C2=A0* update comment messages of stubs.
> > =C2=A0* update #ifdef.
> > =C2=A0* change public/domctl.h to public/vm_event.h.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> > Changes in V4:
> > =C2=A0- update path of vm_event.h from include/asm-generic/asm to
> > include/asm-generic
> > ---
> > Changes in V3:
> > =C2=A0- add Acked-by: Stefano Stabellini <sstabellini@kernel.org> for
> > "xen: move arm/include/asm/vm_event.h to asm-generic"
> > =C2=A0- update SPDX tag.
> > =C2=A0- move asm/vm_event.h to asm-generic.
> > ---
> > Changes in V2:
> > =C2=A0- change public/domctl.h to public/vm_event.h.
> > =C2=A0- update commit message of [PATCH v2 2/2] xen: move
> > arm/include/asm/vm_event.h to stubs
> > ---
> > =C2=A0xen/include/asm-generic/vm_event.h | 55
> > ++++++++++++++++++++++++++++++
> > =C2=A01 file changed, 55 insertions(+)
> > =C2=A0create mode 100644 xen/include/asm-generic/vm_event.h
>=20
> But that's not "move" anymore, as the Arm header isn't being deleted.
Yes, it is correct.

But I think we still have to remove it as this is not any sense to have
the same file for ARM, PPC and RISC-V.



