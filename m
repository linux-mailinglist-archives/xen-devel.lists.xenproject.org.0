Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AC4886AFB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 12:04:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696772.1087966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rncfv-0007FD-Jy; Fri, 22 Mar 2024 11:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696772.1087966; Fri, 22 Mar 2024 11:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rncfv-0007DP-Gt; Fri, 22 Mar 2024 11:03:03 +0000
Received: by outflank-mailman (input) for mailman id 696772;
 Fri, 22 Mar 2024 11:03:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L8LS=K4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rncfu-0007DJ-Fg
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 11:03:02 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfa9386e-e83b-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 12:03:01 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-512b3b04995so1299319e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 04:03:01 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05651238a500b00513ba3e4d3fsm304268lft.151.2024.03.22.04.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 04:03:00 -0700 (PDT)
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
X-Inumbo-ID: bfa9386e-e83b-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711105381; x=1711710181; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZBGzzfKAti0m9iCTRvKg4pTGzOqkEmldkPpLOpcV+9s=;
        b=jRkOx1h5oh0/HuBIesDmFX3MoTY9y2rI7nOTPhCGpTDgUuqiurBsP/gm4hDIzcnbPa
         AZgVK0M6ciOdu9M4RMgnB7QL93NKaKQz4EUNuPxl3XBGYRGNajccDsw8U0E0y3NC7yRv
         wh/SHB3ZzG4MF/pky5/e2kNqSDh6CqX4uU2oX+2ZrfIpHi4JpdlIcqUCbKYUYMN2S7iU
         HfoxGHyK4BpkdR6dOPKKfE6sFK/i/13gVlwFIndnB2AFBNq/TJofr8LN1jYD4heRTPYL
         x2fNIVjOw72vNGNwF+3zDbU1aNVnblY6e3202NW4p8ZBnweCa+A6GGUPHQja3SJibiT8
         c8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711105381; x=1711710181;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZBGzzfKAti0m9iCTRvKg4pTGzOqkEmldkPpLOpcV+9s=;
        b=nFDp2asR2Z0xQ72RmnbziwLjYv04IB1rrGRTL7vAzm6vsCjo27ts++seYR6xWAHvO6
         lUt6huae6PSNkWvqG06Yi4OmJ2zuz94ma2nS0eHyERJHBTu/NcY0ViIDsZwO1KDWdB0p
         CBVTzdLSvayyRlagYIYuGnPOcyAJ65DmGpWnD60ie1x12tuRQNqErsnROr/gBMAzYVxl
         954tYqcUN8eJIOCatQhCycXV+YpxX22O+ImxKcb+2F66RDMH8JT5XnRaZxyqe6PN3/UO
         +AdoTDuaoMxrtMoGtVD2AIzM9lwJUDpzutqOuEnCJYkmCHwTskOP4zV0NF4GEvdKvlLF
         Ct9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7cjwQIoCoFPXtcfaXf/4vvPKkCTKt3r2yWnXlpLvSk0g1dta6yuorzanyGJV89OY8sN+mddBnwGJVkiwn3FWRsTkbboAOTx4rnVzoNFI=
X-Gm-Message-State: AOJu0YzjT7a4xX0vIewpUNRiuZL6GdfD9Gu93Ng4lNzKXCvYUCdojURK
	iXNY1xHJJiA2gbnp7HrlKpPd+MrUPYVZkNbR4B9X2/4g93ZMsrt6
X-Google-Smtp-Source: AGHT+IG85JTogqniqYXFM7ByxNPA1nK6Hw+arOzGvpBJ8zTeII4qQbatCAU70vC0/OypJJp5PpNDqg==
X-Received: by 2002:a05:6512:32a1:b0:513:af27:df1c with SMTP id q1-20020a05651232a100b00513af27df1cmr1388849lfe.11.1711105380437;
        Fri, 22 Mar 2024 04:03:00 -0700 (PDT)
Message-ID: <2a2779011db8ba6db04e8d2e4355479b50e48e01.camel@gmail.com>
Subject: Re: [PATCH v6 09/20] xen/riscv: introduce io.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 22 Mar 2024 12:02:59 +0100
In-Reply-To: <49dd40b6-4558-4e0c-b6ab-eee5b814dd8d@suse.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <dae9f595e5afd1e6a46149919e6689afe263e1ce.1710517542.git.oleksii.kurochko@gmail.com>
	 <49dd40b6-4558-4e0c-b6ab-eee5b814dd8d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-03-21 at 13:27 +0100, Jan Beulich wrote:
> On 15.03.2024 19:06, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/io.h
> > @@ -0,0 +1,167 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + *=C2=A0 The header taken form Linux 6.4.0-rc1 and is based on
> > + *=C2=A0 arch/riscv/include/asm/mmio.h with the following changes:
> > + *=C2=A0=C2=A0 - drop forcing of endianess for read*(), write*() funct=
ions
> > as
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 no matter what CPU endianness, what endiann=
ess a particular
> > device
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 (and hence its MMIO region(s)) is using is =
entirely
> > independent.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 Hence conversion, where necessary, needs to=
 occur at a
> > layer up.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 Another one reason to drop endianess conver=
sion is:
> > + *=C2=A0=C2=A0=C2=A0=C2=A0
> > https://patchwork.kernel.org/project/linux-riscv/patch/20190411115623.5=
749-3-hch@lst.de/
> > + *=C2=A0=C2=A0=C2=A0=C2=A0 One of the answers of the author of the com=
mit:
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 And we don't know if Linux will=
 be around if that ever
> > changes.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The point is:
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a) the current RISC-V spe=
c is LE only
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b) the current linux port=
 is LE only except for this
> > little bit
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 There is no point in leaving ju=
st this bitrotting code
> > around.=C2=A0 It
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 just confuses developers, (very=
 very slightly) slows down
> > compiles
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and will bitrot.=C2=A0 It also won't =
be any significant help to
> > a future
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 developer down the road doing a=
 hypothetical BE RISC-V
> > Linux port.
> > + *=C2=A0=C2=A0 - drop unused argument of __io_ar() macros.
> > + *=C2=A0=C2=A0 - drop "#define _raw_{read,write}{b,w,l,d,q}
> > _raw_{read,write}{b,w,l,d,q}"
>=20
> In the commit message I'm not worried as much, but at least here the
> odd mention
> of d as suffixes would better be purged.
Probably, I use incorrect words, but what I meant that it was dropped:
   #define _raw_{read,write}{b,w,l,d,q} _raw_{read,write}{b,w,l,d,q}
before declaration/definition of inline functions (
__raw_{read,write}{b,w,l,d,q} ).

~ Oleksii



