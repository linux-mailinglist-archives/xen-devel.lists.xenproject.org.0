Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EE96C4B6D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 14:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513442.794430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyIS-0002a1-P4; Wed, 22 Mar 2023 13:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513442.794430; Wed, 22 Mar 2023 13:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peyIS-0002XJ-Ly; Wed, 22 Mar 2023 13:14:32 +0000
Received: by outflank-mailman (input) for mailman id 513442;
 Wed, 22 Mar 2023 13:14:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhKM=7O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1peyIR-0002XB-H8
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 13:14:31 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7af62492-c8b3-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 14:14:30 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id m2so17033634wrh.6
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 06:14:30 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 b15-20020adfe30f000000b002c706c754fesm13853046wrj.32.2023.03.22.06.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 06:14:30 -0700 (PDT)
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
X-Inumbo-ID: 7af62492-c8b3-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679490870;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aO6Z15304pPW08TN7MQ9dUl1HEgKe9k7ySFzMRK0HIc=;
        b=I5eLqtSL5iQ6W7n8RMISGDlDH91D560iwxbzry+XRWx9DAqSjdwETi0W25KQVCDEiH
         w8FqZQyi+UfAx1wJEKzVGZEv2SxMf22O+5Lw/pwjum39QqIPtldhYfaksZ1/Rt8xUi1S
         kIOFg7WxGMuvVaYXlPZCi6Tq+FhlgxN2ilVw+3LGxM7fQeKQZVA6z7+BElafMtAAbOVQ
         tBDXmTaIvNNTmPILppGq7GqMVRNbOPSE4Z/Saet9+c7PtIc1+WpSY9VUJ8/afbOMvt2H
         uzP2e5RHnrXLUNyteP6t2SCUkR9qzkInQsl1As9CX5FqjywQs6P3ltvy+mUiFKIJt8K8
         decg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679490870;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aO6Z15304pPW08TN7MQ9dUl1HEgKe9k7ySFzMRK0HIc=;
        b=G0i8EdEvlalLsz3xYISQX4KWCmkDUCZUlCY8Csunzso+xX8Z2AELchdNkEinyPEDYa
         WzI79Yc1XPDuQkmXYRzbdZqa3lwWM0iYuqAhLmG9FgkQwA+kPr4Z+2PUUyyveX+DbocZ
         4DxRkaJNKxDFrs3QxGdt/0QyTicHh/u3TJ7NQkAvVQyqRpJfZU/kVQgAVEIQBS0Io+6z
         qqr/Ado4Xznm7FCiVu7ZOTP3jadgoyaspXud9Y3I83BRAKae3NON99yQOQa1sgGiph7p
         +3bwBNmj8Y8F21NxxPppOm4o/piBHbQkNwIYwfvROtRYR1IxLGjTloar25O/TS/OYx6p
         zIAQ==
X-Gm-Message-State: AO0yUKV0CAMXAYlTIPbVOZh+cxWzjmLP8MOUYdaJKip0lYshx1hCa9fp
	YTDtiTnKEMWMr1k4KuHs6LQ=
X-Google-Smtp-Source: AK7set+5JmPjtnQCKHt1yrSQfYcXAzKGgJVKQ6UHJLMQByevmfr9Qcjy1ffAf4UqcaaemxW5GS7BRA==
X-Received: by 2002:adf:d4c5:0:b0:2cf:f3ea:533e with SMTP id w5-20020adfd4c5000000b002cff3ea533emr5749942wrk.63.1679490870241;
        Wed, 22 Mar 2023 06:14:30 -0700 (PDT)
Message-ID: <efbaf9104d63172470a8398e360b16fc9301c36a.camel@gmail.com>
Subject: Re: [PATCH v5 3/7] xen/riscv: introduce dummy <asm/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>, Julien
 Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Date: Wed, 22 Mar 2023 15:14:27 +0200
In-Reply-To: <95c763c4-034a-d478-fff9-55df1adbdc43@suse.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
	 <82aa35ce27ca11076bbafbb565e9c85e1ce7624d.1678976127.git.oleksii.kurochko@gmail.com>
	 <b28bc3fc-c38d-502b-409b-092e7398dd3a@xen.org>
	 <071f2e0971ea53d37b9b645ebce6d169fcc642ff.camel@gmail.com>
	 <95c763c4-034a-d478-fff9-55df1adbdc43@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-22 at 11:27 +0100, Jan Beulich wrote:
> On 22.03.2023 11:09, Oleksii wrote:
> > On Tue, 2023-03-21 at 17:21 +0000, Julien Grall wrote:
> > > On 16/03/2023 14:39, Oleksii Kurochko wrote:
> > > > <xen/lib.h> will be used in the patch "xen/riscv: introduce
> > > > decode_cause() stuff" and requires <asm/bug.h>
> > > >=20
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > Changes in V5:
> > > > =C2=A0 * the patch was introduced in the current patch series (V5)
> > > > ---
> > > > =C2=A0 xen/arch/riscv/include/asm/bug.h | 10 ++++++++++
> > > > =C2=A0 1 file changed, 10 insertions(+)
> > > > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/bug.h
> > > >=20
> > > > diff --git a/xen/arch/riscv/include/asm/bug.h
> > > > b/xen/arch/riscv/include/asm/bug.h
> > > > new file mode 100644
> > > > index 0000000000..e8b1e40823
> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/include/asm/bug.h
> > > > @@ -0,0 +1,10 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +/*
> > > > + * Copyright (C) 2012 Regents of the University of California
> > > > + * Copyright (C) 2021-2023 Vates
> > >=20
> > > I am a bit puzzled with those copyright given the header is
> > > empty.
> > >=20
> > > But is there any reason this can't be folded in #6 or part of #6
> > > moved=20
> > > forward?
> > Initially it was folded in #6 but in this case a build will be
> > failed
> > after introduction of #5 as <asm/bug.h> is needed for <xen/lib.h>
>=20
> But what about the other option Julien mentioned, moving ahead the
> later "filling" of asm/bug.h, so it wouldn't be introduced empty and
> then (almost immediately) touched again to actually populate it?
I think I can move the content of <asm/bug.h> from #6 to the current
patch.

~ Oleksii


