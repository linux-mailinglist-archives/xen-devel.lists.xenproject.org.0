Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E53F9C3CC7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 12:15:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833567.1248738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASO8-0004pZ-CK; Mon, 11 Nov 2024 11:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833567.1248738; Mon, 11 Nov 2024 11:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASO8-0004nu-9c; Mon, 11 Nov 2024 11:15:20 +0000
Received: by outflank-mailman (input) for mailman id 833567;
 Mon, 11 Nov 2024 11:15:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dX8x=SG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tASO6-0004no-1j
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 11:15:18 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39bdb10a-a01e-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 12:15:15 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5ceca0ec4e7so5750507a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 03:15:15 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03c9b9b9sm5019318a12.89.2024.11.11.03.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 03:15:13 -0800 (PST)
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
X-Inumbo-ID: 39bdb10a-a01e-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmIiLCJoZWxvIjoibWFpbC1lZDEteDUyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM5YmRiMTBhLWEwMWUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzIzNzE1LjI1NzE4Niwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731323715; x=1731928515; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DsavfJtuSvVD7nAFjOoR0x05eM0KCRZ6QYZ5iqOH+qo=;
        b=g4CIDkieYFBM4LD0am4hTJyvlZx+eMZ5UmZ45+fGADyWwUkO6UH7RBetP3j2txffR8
         tpf13z+VzFbXYhAoHu/YmWQtF4Nl351ZErBwCfR+CFHNR/c8hJdt1sRj/jTvKoZ+EDE7
         o7enJ1NbmzXJGNF4NnPnsjQvNWHWRWK7nVbQZfW8sxih6esFb9HmIJOhXvHFHxal6z5Q
         pktjOU7LnIrIGrobFPy/tlsePXiGlFx6wmoFnFSTcTUZoHZUTFA9Ct7BphxdOA4Fw/XM
         qEZvpktp2T+f/ePJXCwxNPDXmqJ6SlxiKi4lKSNpy2zh1Cbrwp+CsLTq8RTbCS4+IRLr
         XR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323715; x=1731928515;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DsavfJtuSvVD7nAFjOoR0x05eM0KCRZ6QYZ5iqOH+qo=;
        b=Ng9N04tfiBFcdGzBI/UL85eQDYB2wxeICY5Jb02f7iNHS6+hUzbYMgYzSjGzhpdR33
         N30c5V2AO1C3Ub7E2eTKa1gJlkyji70OAmajoMJzkDEekipbXLPoN3SpOh77petQ9yx2
         sP9Vbk6kSPquXxjW6ixkhjefCIzh3lUz1soggmcrIwApLLuRt0d6R9ncSI1q3rGwhnfL
         tEGvfqn5h9tKTtHhKvYbiapXXXoQaLUzADqa91s/98KIpceVG3FVdNMyuwRQa93OfKrl
         9PUe9bOMp3JPI/3SRoBX6aZfpWOBfPXrpBJQt7SSQxn1vuM0WpeKYeiciw6FzLPK11zY
         bDvA==
X-Forwarded-Encrypted: i=1; AJvYcCVe/VqWzRcvl2a8IT7zIy3+Sv2hPareZzLizBDzYBNLfW9nb0bXRk4QTXCwAjQ3f3mi30NePRAhNXg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMJlV94RcesL+SVVVCQyeA7HFt19tMEyvYo6FfYgotU5mOq203
	Up1cyJfo/viLQtEYsS2ExMNrLsYQ0e29pqk2cADB2GHnADumxAgz
X-Google-Smtp-Source: AGHT+IEA6SIRTW3viUyNwSU4+pavEIqlMuP/hjim8bVUc7/YKyey2VuYz9+Q7hJb7nWPj1isbm5Ycg==
X-Received: by 2002:a05:6402:2692:b0:5c8:9f81:43e4 with SMTP id 4fb4d7f45d1cf-5cf0a2faeb2mr10778891a12.7.1731323714339;
        Mon, 11 Nov 2024 03:15:14 -0800 (PST)
Message-ID: <0b9d8841733cd5450daeb55eb0339264c601e4c5.camel@gmail.com>
Subject: Re: [PATCH v1] drivers/char: move dt_uart_init() to dt-uart.c
From: oleksii.kurochko@gmail.com
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel	 <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Mon, 11 Nov 2024 12:15:13 +0100
In-Reply-To: <96d8d5c0-015a-4dd5-8ef1-6d9cd6948cab@xen.org>
References: 
	<8e1036a7e6c884702d46e377c1c5b723570c819e.1731077742.git.oleksii.kurochko@gmail.com>
	 <96d8d5c0-015a-4dd5-8ef1-6d9cd6948cab@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

Hi Julien,

On Mon, 2024-11-11 at 10:24 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 08/11/2024 14:56, Oleksii Kurochko wrote:
> > The `dt_uart_init()` functions is relocated to a new file `dt-
> > uart.c` to allow
> > for reuse across architectures that utilize the device tree to
> > describe hardware
> > components.
> >=20
> > RISC-V is going to follow the same approach to UART initialization,
> > which
> > includes checking for the presence of `dtuart` in the console
> > string or verifying
> > the `stdout-path` property in the `/chosen` node, followed by
> > searching for the UART
> > node and calling `device_init()` for UART setup.
> >=20
> > Add `xen/drivers/char/dt-uart.c` to the ARM ARCHITECTURE section in
> > the MAINTAINERS
> > file, as ARM maintainers are best suited to maintain this code.
> >=20
> > No functional change.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 xen/drivers/char/Makefile=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 xen/drivers/char/arm-uart.c | 80 -------------------------------
>=20
> The only thing left in arm-uart.c is the ACPI initialize. I guess at
> the=20
> some point this will be needed for other architectures. I think it
> would=20
> be more suitable if the file is renamed, maybe uart-init.c?
It seems like you are right and it would be better just to rename the
file. ( I checked Linux kernel source code and RISC-V there also is
using SPCR table to store the configuration of console.

I will send a new patch version.


Thanks!

~ Oleksii

