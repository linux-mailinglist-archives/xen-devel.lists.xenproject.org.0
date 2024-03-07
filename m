Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C07874F8A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 14:02:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689889.1075325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riDNa-0005y6-2m; Thu, 07 Mar 2024 13:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689889.1075325; Thu, 07 Mar 2024 13:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riDNZ-0005wV-W9; Thu, 07 Mar 2024 13:01:45 +0000
Received: by outflank-mailman (input) for mailman id 689889;
 Thu, 07 Mar 2024 13:01:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqh0=KN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1riDNY-0005wP-5P
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 13:01:44 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d88b4d0d-dc82-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 14:01:43 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-513181719easo657136e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 05:01:43 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 j16-20020ac253b0000000b005131cb35b42sm3030452lfh.298.2024.03.07.05.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 05:01:42 -0800 (PST)
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
X-Inumbo-ID: d88b4d0d-dc82-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709816503; x=1710421303; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V1y2FJyPs+k3PDp6e5opcymWlk+q387INNZNDKg1BzA=;
        b=kJKX+51zS09OK0cy5QW/lDHVK8pw6MTJYPs7wIilkeSXPbWCZxtSvO3zQ3bl9/v/08
         ZZgaQfFWVKrQm4HDfNt8bOnTMDqJwOMA1Pm7be1v0uAY1MfRo9VmUkCPc8zIziyFy8uD
         Ghi/Z0dCHm/2kP1/lSydNhy+mPmLndKmRSc+il5Isftm3iHDGbVTtLE372MBUmsufdNq
         5+fsfTo+DWY6Tl4VDqcj6o1QQQcDhk62f6lHabsEp8AFEKs9fy6FbhU5rkwLYg1IRbSK
         xLkArOBOIeeLy+kM0kS1Q7peqKhM2mgzh0xZin/9JKZ0yBShVnvGmqi/2kxJpd40eeHG
         Nvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709816503; x=1710421303;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V1y2FJyPs+k3PDp6e5opcymWlk+q387INNZNDKg1BzA=;
        b=b88g3G6M5yZeHruZFGOmEUlXFs3jmQ0e6tWOULKJCIbMageBbYSDbWGHSMrPMV5SMT
         5hsyHBQSmstpfDhP4oLIfZd5kNXtxlf/Tr53mncplVxQr+sIZ5lOq0IGktv5riTHRdWF
         p6qCOy8iyp93iaYaCKBwAesAVczidOOTM7WmxuizBnz2aygJLCsQvGhanmACluo4gLmj
         XDYE7lIpbLYmKJ7Q+3z+GqDGODlmRL/QsT7S5jrJjThZ0DTPfdi9ZgMBAKfgGqtgy3Xl
         YppQe5YHRC5W2AhIlpCXLWU+LyDfTHc6gejFGADNvmsdUumQrs/40ud3n9De60zjmH7f
         yZTA==
X-Forwarded-Encrypted: i=1; AJvYcCUdVrsrIdGIUHoObJECovdER38qgfuqDaLMYS6A8RZaJhLOVVrPIJlbxGrGisIs1n0UejYH9+76bfGuXub4vl9tdAkiPHDI7lU1twwILfw=
X-Gm-Message-State: AOJu0YwMEbSVdfNOFFycZiXGybwEpkDDY9wlzQ/JlwMnOEcC7HTCFBvI
	tdQw7KVuHLX4IA5DgU0vxNpBLeBI2nlj31o2xdu+TKn1HCA4UDSh
X-Google-Smtp-Source: AGHT+IFMOjQqW9/32uytgFsRj9xGJUyGSpduAvI/Se53uWer3Rz4KEz9wCS2rGwNmMWvSI7P9prWNQ==
X-Received: by 2002:a05:6512:4851:b0:513:54c6:9f68 with SMTP id ep17-20020a056512485100b0051354c69f68mr1285058lfb.18.1709816502471;
        Thu, 07 Mar 2024 05:01:42 -0800 (PST)
Message-ID: <d047c0956f804f7191f91b1d690650e220ec0fe4.camel@gmail.com>
Subject: Re: [PATCH v5 12/23] xen/riscv: introduce io.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 07 Mar 2024 14:01:41 +0100
In-Reply-To: <807c31d5-0c5a-4646-ba90-2f284289069f@suse.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <dd7c95b5197dfd0cca0edf9c0ada631336eb60d7.1708962629.git.oleksii.kurochko@gmail.com>
	 <807c31d5-0c5a-4646-ba90-2f284289069f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-03-06 at 15:13 +0100, Jan Beulich wrote:
> > +/* Generic IO read/write.=C2=A0 These perform native-endian accesses.
> > */
> > +static inline void __raw_writeb(uint8_t val, volatile void __iomem
> > *addr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 asm volatile ( "sb %0, 0(%1)" : : "r" (val), "r" (a=
ddr) );
> > +}
>=20
> I realize this is like Linux has it, but how is the compiler to know
> that
> *addr is being access here?=C2=A0
Assembler syntax told compiler that. 0(%1) - means that the memory
location pointed to by the address in register %1.

> If the omission of respective constraints here
> and below is intentional, I think a comment (covering all instances)
> is
> needed. Note that while supposedly cloned from Arm code, Arm variants
> do
> have such constraints in Linux.
>=20
It uses this constains only in arm32:
#define __raw_writeb __raw_writeb
static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
{
	asm volatile("strb %1, %0"
		     : : "Qo" (*(volatile u8 __force *)addr), "r"
(val));
}

But in case of arm64:

#define __raw_writeb __raw_writeb
static __always_inline void __raw_writeb(u8 val, volatile void __iomem
*addr)
{
	asm volatile("strb %w0, [%1]" : : "rZ" (val), "r" (addr));
}

And again looking at the defintion they use different option of strb
instruction, and in case of strb they use [%1] which tells compiler
that %1 is addressed which should be dereferenced.

~ Oleksii

