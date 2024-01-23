Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCAF8395EF
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 18:08:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670562.1043442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSKFq-0003Rr-DL; Tue, 23 Jan 2024 17:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670562.1043442; Tue, 23 Jan 2024 17:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSKFq-0003Ol-AB; Tue, 23 Jan 2024 17:08:06 +0000
Received: by outflank-mailman (input) for mailman id 670562;
 Tue, 23 Jan 2024 17:08:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OrDF=JB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSKFo-0003Of-V7
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 17:08:04 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8802119-ba11-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 18:08:04 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cf0e9f76b4so12076001fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 09:08:04 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a056512102900b0050ecc0a943bsm2366046lfr.129.2024.01.23.09.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 09:08:03 -0800 (PST)
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
X-Inumbo-ID: f8802119-ba11-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706029684; x=1706634484; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sk4PfIM452cg2zCEPsY8/ioEgB4N/hJnhE6ESMbtVFc=;
        b=Pvd7y712EuT+45cpQoFKbfs/Tbh9z87VY42HQ8WStqPx5Fuvps2uy7wZErI069ZzWW
         gDQ4SpJ37oUVMxWvDiwmjYP0nZA/acqRsUhYJvLcdsapfCld24ygI/eo6EmVmx+Nz9qB
         EX4KtS/HJiw0DDSwU4cZCs4DbhNtQ1sqDwDaM/HG2l2pAePpcEhBsTMZVVlN0I1z2noP
         hOhG+ELMKQZJ3/jxqvaOV+/BtT5kpoC3WBzZcA+So1PYcj+m+kShS3N3ITDMQqhKPaPZ
         LdUq3R88d+1WUAzxgn8pdL9k0viqmjvClEmr8rTUf9Quj5iEEArS3mx+MdyrlfBTJ+MX
         PM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706029684; x=1706634484;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sk4PfIM452cg2zCEPsY8/ioEgB4N/hJnhE6ESMbtVFc=;
        b=SKI76g1rs1apUrjNM5QCuWJMZnGER23GPr/4nKX+bHW96f1sVIxB7T2Qm+PdELW1Db
         EUSCgUEXhLRlbLuRvp3Au5ZDPACNjpWmdDDMDlTlFnjdWyF5f2m2QILapaK3uOYiyvi3
         jzlVSB+MV8nlxUQQhpSOXtH1N2ak7tNGjQScRAU4aU78f5rINRsd+HFAOAQjn4irMZmX
         MvFuNtT1TxnFe6NvTV0wzu1rvetTBA06azXBJVXmOnp5ADBv5YorE6Q9mQ/Sg0Fd1Bb6
         2lOnv7A7s4iUrl/vsKf7DgOsjq3B0ap9YT0lSFP5ftfaDNMEx+N0rCS6DIOp62EAZHhk
         Cn2A==
X-Gm-Message-State: AOJu0YzpmWx91GcAj4vBrOpv41wRBZ6Tfz6C0cAXWT6Nylt7zcTmXBDr
	Hn5n8tXsuNH13rKsa0UG/7B9lqjr5QPJ3+88O707TJ3MLXnqcBwM
X-Google-Smtp-Source: AGHT+IFw7fQdeWOqICOgRSpu+HUm93pX+9/Ri0QybMgNE3QPW6t5yK9RDPn4OA4svALr4hz5T+ge9w==
X-Received: by 2002:ac2:548c:0:b0:510:d5f:1bce with SMTP id t12-20020ac2548c000000b005100d5f1bcemr68036lfk.240.1706029683681;
        Tue, 23 Jan 2024 09:08:03 -0800 (PST)
Message-ID: <5f8291916b01a2b29a16bd1345fc20e3d4f29cab.camel@gmail.com>
Subject: Re: [PATCH v3 30/34] xen/riscv: add minimal stuff to processor.h to
 build full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 23 Jan 2024 19:08:02 +0200
In-Reply-To: <aa4d18c5-a8e0-44a6-ae7e-16fd9cd029b4@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <5bd7c5db6638f09dabdc13a6e12f0b204eacb234.1703255175.git.oleksii.kurochko@gmail.com>
	 <aa4d18c5-a8e0-44a6-ae7e-16fd9cd029b4@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-23 at 12:39 +0100, Jan Beulich wrote:
> On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V3:
> > =C2=A0- Update the commit message
>=20
> ??? (again)
The same as with previous. asm/processor.h was changed to processor.h

>=20
> > @@ -53,6 +56,18 @@ struct cpu_user_regs
> > =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pregs;
> > =C2=A0};
> > =C2=A0
> > +/* TODO: need to implement */
> > +#define cpu_to_core(cpu)=C2=A0=C2=A0 (0)
> > +#define cpu_to_socket(cpu) (0)
> > +
> > +static inline void cpu_relax(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* Encoding of the pause instruction */
> > +=C2=A0=C2=A0=C2=A0 __asm__ __volatile__ ( ".insn 0x100000F" );
>=20
> binutils 2.40 knows "pause" - why use .insn then?
I thought that for this instruction it is needed to have extension
ZIHINTPAUSE ( according to Linux Kernel source code [1] ) and to cover
older version.
But looking at [2] and considering that I announced that we expected
binutils >=3D 2.40 ( or 2.39 as I mentioned as an reply to patch to
README file ) it can be used pause instruction.

>=20
> > +=C2=A0=C2=A0=C2=A0 barrier();
>=20
> Why?
Just to be aligned with Linux kernel implemetation from where this
function was taken.

~ Oleksii

[1]
https://elixir.bootlin.com/linux/latest/source/arch/riscv/include/asm/vdso/=
processor.h#L9

[2]https://elixir.bootlin.com/linux/latest/source/arch/riscv/Kconfig#L582

