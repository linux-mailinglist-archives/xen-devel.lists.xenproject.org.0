Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F71D67C615
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 09:41:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484823.751647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKxoJ-0005j6-K8; Thu, 26 Jan 2023 08:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484823.751647; Thu, 26 Jan 2023 08:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKxoJ-0005g5-HL; Thu, 26 Jan 2023 08:40:43 +0000
Received: by outflank-mailman (input) for mailman id 484823;
 Thu, 26 Jan 2023 08:40:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xrEi=5X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pKxoH-0005fz-MU
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 08:40:41 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bfa8f44-9d55-11ed-91b6-6bf2151ebd3b;
 Thu, 26 Jan 2023 09:40:40 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id n7so981129wrx.5
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 00:40:38 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 h12-20020a056000000c00b002bdd96d88b4sm666153wrx.75.2023.01.26.00.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 00:40:37 -0800 (PST)
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
X-Inumbo-ID: 1bfa8f44-9d55-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t7R7kW3+kQQwunvG4xN2f7eHPAYe6arAoTmJi5SsZ9M=;
        b=jlsaszc3U+bs1Y1M7iTjODGwgHPMxFmkB1Bt6yeOkARxajYiU9SaPJdbSZsth175eZ
         rRg423RUBuFWGWKdqlmJppn3esZuA/4Yo1/BDRk6O0j0vtNutKO2zkpCdDc+24Wczqql
         FN0gmmzT8dTDFZpJ4eLKdPasrdYlz0nBRFEc9tgU3tVuANEWgUUtZyyFQKVshpgqu15G
         jl5uW9DGRf3JRLaoWTGj6PMjHUhC3meVVo5kTYccTENwzp3Uc6brjWCImw9R7CmHLldi
         sugFK0pZnUH0W1BrcUr4xxdrEhcKNkEwX4y61Ny+u9LyJt/fb7uxI6yDkYzMRCsxEvPx
         309A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7R7kW3+kQQwunvG4xN2f7eHPAYe6arAoTmJi5SsZ9M=;
        b=Xa2s4NNpiVidklIcpXsBorKqlnclkZER3NRvswWSxYLgh/dwAQVEGkf55+jdTOehlZ
         wFkqf6zbQdZGblj+Ek2zu/UBCop4lFZPGB4nYGiAO124uVKXhcMH8o+imnQQv0AVwDPd
         PUx1pdn9vff5k1Wvrs15NZsqDTX66CzRsIQmm7vlucQKpvuGfzh0sCZxMCiAMIRS4sEj
         DFo9lqvghpT2kBpTzOTg+N0FAyNvTA5nEaqNUtluFYHuq47i2qVZPCCSvxQpfbEQv7TS
         ektkKFpcHOiNUGqLaPBjLs7zf8iiTHyI0Lr7uhSp1F+DXZ/UvatPbOUspzOm57sJFtVT
         Lqag==
X-Gm-Message-State: AO0yUKVqrNYjB4jOlHH8oN4hpDOXTNa+qtrSF/F0DAw04MxlsVhpokQc
	Y9DcC7DfOJnKkq2jlew88Tw=
X-Google-Smtp-Source: AK7set9FBE7uLh+inpdRGiHFJL+HTb8FJNSLkaDzd5jCVifeNizxcxqtiLVfha2p7juBVST2diAP0w==
X-Received: by 2002:adf:b35e:0:b0:2bf:cab7:cc36 with SMTP id k30-20020adfb35e000000b002bfcab7cc36mr198608wrd.23.1674722438145;
        Thu, 26 Jan 2023 00:40:38 -0800 (PST)
Message-ID: <ed76d0891b9c8f30acb14ecaf434dd1d1910b26b.camel@gmail.com>
Subject: Re: [PATCH v1 09/14] xen/riscv: introduce do_unexpected_trap()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <amc96@srcf.net>, Alistair Francis <alistair23@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Thu, 26 Jan 2023 10:40:36 +0200
In-Reply-To: <c12689b9-950c-94f5-e54b-490eea19b066@srcf.net>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
	 <74ca10d9be1dfc3aed4b3b21a79eae88c9df26a4.1674226563.git.oleksii.kurochko@gmail.com>
	 <CAKmqyKNtFGoXmF1SJWO+JBJQvPSyDYEfpaYn2YBMQ=BsCk6VPQ@mail.gmail.com>
	 <df6bd499b06c2e4997a3b647624aa2163e7f23d6.camel@gmail.com>
	 <c12689b9-950c-94f5-e54b-490eea19b066@srcf.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-01-25 at 17:15 +0000, Andrew Cooper wrote:
> On 25/01/2023 5:01 pm, Oleksii wrote:
> > On Mon, 2023-01-23 at 09:39 +1000, Alistair Francis wrote:
> > > On Sat, Jan 21, 2023 at 1:00 AM Oleksii Kurochko
> > > <oleksii.kurochko@gmail.com> wrote:
> > > > The patch introduces the function the purpose of which is to
> > > > print
> > > > a cause of an exception and call "wfi" instruction.
> > > >=20
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > =C2=A0xen/arch/riscv/traps.c | 14 +++++++++++++-
> > > > =C2=A01 file changed, 13 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> > > > index dd64f053a5..fc25138a4b 100644
> > > > --- a/xen/arch/riscv/traps.c
> > > > +++ b/xen/arch/riscv/traps.c
> > > > @@ -95,7 +95,19 @@ const char *decode_cause(unsigned long
> > > > cause)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 return decode_trap_cause(cause);
> > > > =C2=A0}
> > > >=20
> > > > -void __handle_exception(struct cpu_user_regs *cpu_regs)
> > > > +static void do_unexpected_trap(const struct cpu_user_regs
> > > > *regs)
> > > > =C2=A0{
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long cause =3D csr_read(CSR_SCAUSE);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 early_printk("Unhandled exception: ");
> > > > +=C2=A0=C2=A0=C2=A0 early_printk(decode_cause(cause));
> > > > +=C2=A0=C2=A0=C2=A0 early_printk("\n");
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 // kind of die...
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 wait_for_interrupt();
> > > We could put this in a loop, to ensure we never progress
> > >=20
> > I think that right now there is no big difference how to stop
> > because we have only 1 CPU, interrupts are disabled and we are in
> > exception so it looks like anything can interrupt us.
> > And in future it will be changed to panic() so we won't need here
> > wfi()
> > any more.
>=20
> WFI is permitted to be implemented as a NOP by hardware.=C2=A0
> Furthermore,
> WFI with interrupts already disabled is a supported usecase, and will
> resume execution without taking the interrupt that became pending.
>=20
> You need an infinite loop of WFI's for execution to halt here.
>=20
Thanks a lot for clarification!
Then definitely it should changed to loop.
> ~Andrew


