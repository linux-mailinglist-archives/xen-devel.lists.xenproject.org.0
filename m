Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDA367B7C7
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 18:01:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484481.751070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKj98-0000J3-Av; Wed, 25 Jan 2023 17:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484481.751070; Wed, 25 Jan 2023 17:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKj98-0000FI-7m; Wed, 25 Jan 2023 17:01:14 +0000
Received: by outflank-mailman (input) for mailman id 484481;
 Wed, 25 Jan 2023 17:01:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jk/=5W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pKj96-0000FC-ST
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 17:01:12 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd94de6a-9cd1-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 18:01:10 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so1780803wms.4
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 09:01:10 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 u11-20020a05600c19cb00b003d9fb04f658sm2613027wmq.4.2023.01.25.09.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 09:01:09 -0800 (PST)
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
X-Inumbo-ID: dd94de6a-9cd1-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vjfpLOODeW3bg2TWPdcYR6eYF/INyUTmjzURQM4H7N8=;
        b=iDPs5b3JyfoadfJZQpMx58PMsbC0n7ThoK/il8W8C4w1obtX01XXG/w1mOifdyNEEg
         nZqV7vOcdXz20oiBlbc82tFv1Z9FdDleuwYym4XErXLYGc7YWiPmeDmOOLxi8dwtElPB
         RXnLxbvY6WkBRkRp2OwZREZTskLF4mDwTk133Fr5AMAAoj7Xp1b/eRpy2fZ05/FBcm2T
         WrcN91UrFlX0l1o+N0EUWju45EWP/cQIXaLRHe3kwmo1iK/i9A75wflbYkTFOiDkoU+8
         dam3Y4mF0JgX8VrQPK9clhAhODru6dOjN0DFRKEjoicD4uqNjDfjYzXEukbrg15JfRhO
         wcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjfpLOODeW3bg2TWPdcYR6eYF/INyUTmjzURQM4H7N8=;
        b=nnSnlpK0EgvztVR52TZ6SLg96kS/GqgODUW5EWdlod5jAUQDCW/1j/qTgcVHv01T/M
         Ah3Kd4Xdklrz5IbSKrsJikMJ1N1k+2HQczS0tP4rFv63jfPy3DAsQq9BtfO1M8rGTEr+
         P9PBTwj04iuuWP6XaLP7fDKOQpXjtyaa/CtVdSSTA95yrb3g9zFeq4myKwPYL6pM3l3K
         niR8ZXlXU21fsEvbBlgBFlkV436JgtujBVTZ3Opv9f7ZqJ6Wt+jGAW76qF1IAvRhE0FZ
         8SvKXRnXgu9VNXqZiYyPDBpfRZQ5PE2VRyiiwOVEoTnOpHeFWyAAPpa3dj6z6xBcw0FN
         9Hqg==
X-Gm-Message-State: AFqh2kq77cueSGdhjBhMAxp2B5OIoOyp6kr7NZw8M2F4JlJrHqS1ygOf
	OWvL0REzoiszQ9vSn71+OH8=
X-Google-Smtp-Source: AMrXdXu+Ebiv2ESP/Dm6sCF4cGTqO2Tegs9+SM8dLF1xk4C4nXagri/RlHGLkkW7Dp3cVt5D8aLnUg==
X-Received: by 2002:a05:600c:214f:b0:3cf:7197:e67c with SMTP id v15-20020a05600c214f00b003cf7197e67cmr32711922wml.25.1674666069904;
        Wed, 25 Jan 2023 09:01:09 -0800 (PST)
Message-ID: <df6bd499b06c2e4997a3b647624aa2163e7f23d6.camel@gmail.com>
Subject: Re: [PATCH v1 09/14] xen/riscv: introduce do_unexpected_trap()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Wed, 25 Jan 2023 19:01:08 +0200
In-Reply-To: <CAKmqyKNtFGoXmF1SJWO+JBJQvPSyDYEfpaYn2YBMQ=BsCk6VPQ@mail.gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
	 <74ca10d9be1dfc3aed4b3b21a79eae88c9df26a4.1674226563.git.oleksii.kurochko@gmail.com>
	 <CAKmqyKNtFGoXmF1SJWO+JBJQvPSyDYEfpaYn2YBMQ=BsCk6VPQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-01-23 at 09:39 +1000, Alistair Francis wrote:
> On Sat, Jan 21, 2023 at 1:00 AM Oleksii Kurochko
> <oleksii.kurochko@gmail.com> wrote:
> >=20
> > The patch introduces the function the purpose of which is to print
> > a cause of an exception and call "wfi" instruction.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/arch/riscv/traps.c | 14 +++++++++++++-
> > =C2=A01 file changed, 13 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> > index dd64f053a5..fc25138a4b 100644
> > --- a/xen/arch/riscv/traps.c
> > +++ b/xen/arch/riscv/traps.c
> > @@ -95,7 +95,19 @@ const char *decode_cause(unsigned long cause)
> > =C2=A0=C2=A0=C2=A0=C2=A0 return decode_trap_cause(cause);
> > =C2=A0}
> >=20
> > -void __handle_exception(struct cpu_user_regs *cpu_regs)
> > +static void do_unexpected_trap(const struct cpu_user_regs *regs)
> > =C2=A0{
> > +=C2=A0=C2=A0=C2=A0 unsigned long cause =3D csr_read(CSR_SCAUSE);
> > +
> > +=C2=A0=C2=A0=C2=A0 early_printk("Unhandled exception: ");
> > +=C2=A0=C2=A0=C2=A0 early_printk(decode_cause(cause));
> > +=C2=A0=C2=A0=C2=A0 early_printk("\n");
> > +
> > +=C2=A0=C2=A0=C2=A0 // kind of die...
> > =C2=A0=C2=A0=C2=A0=C2=A0 wait_for_interrupt();
>=20
> We could put this in a loop, to ensure we never progress
>=20
I think that right now there is no big difference how to stop
because we have only 1 CPU, interrupts are disabled and we are in
exception so it looks like anything can interrupt us.
And in future it will be changed to panic() so we won't need here wfi()
any more.
>=20

Oleksii

