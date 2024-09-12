Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1694C976582
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 11:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797136.1206962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sog6a-0007Ug-F7; Thu, 12 Sep 2024 09:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797136.1206962; Thu, 12 Sep 2024 09:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sog6a-0007SE-CN; Thu, 12 Sep 2024 09:27:12 +0000
Received: by outflank-mailman (input) for mailman id 797136;
 Thu, 12 Sep 2024 09:27:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F2hp=QK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sog6Z-0007S8-L9
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 09:27:11 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fe08037-70e9-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 11:27:10 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8d43657255so109058266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 02:27:10 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c624d4sm712033166b.112.2024.09.12.02.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 02:27:08 -0700 (PDT)
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
X-Inumbo-ID: 2fe08037-70e9-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726133230; x=1726738030; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yqPcLywO97kfYdJWR11/Jx5eDtvT9WmW4bR/+9wQlRQ=;
        b=FtHiG3zvydPmL0rTMfrfObHbejDnvrzarnOV3KqHtnRmkB+Iju21UayTX+V4pp+sou
         vaPxz+aAiaT8dt3QmllOMMOpBE3NRmvl0QACnUOHj1zQyFrj6PuraiaCDJQ3Nie1LMRU
         FBtIwBLeZKeZHTlq38e2OAa5muKOLdKVF18+6a5R3c/tQ8aVYBZQdlF4tTyk7XW86djU
         nM1LGgypOFNdraTsgaPKzCkeYm+utyudc73NCybaws20nMqo5BTSe/4lXsqdxf3JO57h
         4KlUuVuJxkWXFkA0iYOHm1y00Pqe3J70wrSZQN4BtT1xeldrd4eYtNOYwxv4LqLnTpKI
         JLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133230; x=1726738030;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqPcLywO97kfYdJWR11/Jx5eDtvT9WmW4bR/+9wQlRQ=;
        b=Z7tSzs598cPlQ7bflmtPhSMKn89hMoGK4U0+klFWEWt8z4L7L6YvrKDOXBVJFIPDk9
         IIvea0Z2Rvd5/FdvVq0tKzQdep6tIp/RuesgEfzKVrmAfp0BhDKOCKsZCpnJ2ezHMkMG
         blLBrkUN2wOHXxDhvCV3ao9NDe4xPeEGd015TxClvQHbPaI7O6GzMRFjriy67xUTeuxD
         dOg0AXtyZncxYBqH+t6rBKu0D5fFDuSBl3deSXMDAq/LspZXyfWlzg/F0VXPpg1uVvO5
         b4f6W35g593vqaE/wbZYNi6JkSTjsn788AUzXDf7LXiOpKK1YwGkMqNnIWtNqX3gp3yb
         Dmog==
X-Forwarded-Encrypted: i=1; AJvYcCWS4cOOA+RYbaoU2zysg44OmWVkcNSy1jvgbKtLTgGkgWK1Mch+oTMcPClB76GWtDQlHm16tP01tf4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBfo8zRm4c3ntirY4phlJzcYXdICTQ7E6GKADyGfiPi7T6TlQV
	PFyAIsUI4oMJ+KkAgK8MaYR5xNMTyGIfpRWlHJU4k6+1FUJ/s1hq
X-Google-Smtp-Source: AGHT+IH1Yzg5lX4184znAv8okaog5/EJJhqlpA29OiSLnco8L3CLZtyUqj2hiGxXkjDp2pi/OJnzMQ==
X-Received: by 2002:a17:906:d7c4:b0:a7a:aa35:408c with SMTP id a640c23a62f3a-a90294a861amr210281066b.8.1726133229191;
        Thu, 12 Sep 2024 02:27:09 -0700 (PDT)
Message-ID: <d04ad9b90347a69d88b67a2ec6861995ca10cb84.camel@gmail.com>
Subject: Re: [PATCH v6 6/9] xen/riscv: introduce functionality to work with
 CPU info
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 12 Sep 2024 11:27:07 +0200
In-Reply-To: <1ef2902e-b307-497b-9c97-d1e3771b62af@suse.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
	 <77a00222008f8b41d2454e74d1c9247252d7ccd9.1725295716.git.oleksii.kurochko@gmail.com>
	 <6c43c528-daa9-4449-a383-aade3da73160@suse.com>
	 <de3f5c4fd5dd2a8533ea376a013f8e40b85dc6b7.camel@gmail.com>
	 <1ef2902e-b307-497b-9c97-d1e3771b62af@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-09-11 at 14:14 +0200, Jan Beulich wrote:
> On 11.09.2024 14:05, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-09-10 at 12:33 +0200, Jan Beulich wrote:
> > > On 02.09.2024 19:01, Oleksii Kurochko wrote:
> > > > @@ -72,6 +77,16 @@ FUNC(reset_stack)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret
> > > > =C2=A0END(reset_stack)
> > > > =C2=A0
> > > > +/* void setup_tp(unsigned int xen_cpuid); */
> > > > +FUNC(setup_tp)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 tp, pcpu_info
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 t0, PCPU_INFO_SIZE
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mul=C2=A0=C2=A0=C2=A0=
=C2=A0 t1, a0, t0
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=
=C2=A0 tp, tp, t1
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret
> > > > +END(setup_tp)
> > >=20
> > > I take it this is going to run (i.e. also for secondary CPUs)
> > > ahead
> > > of
> > > Xen being able to handle any kind of exception (on the given
> > > CPU)?
> > Yes, I am using it for secondary CPUs and Xen are handling
> > exceptions (
> > on the given CPU ) fine.
>=20
> Yet that wasn't my question. Note in particular the use of "ahead
> of".
The first executed function for secondary CPU will be
(=C2=A0https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/ar=
ch/riscv/riscv64/head.S?ref_type=3Dheads#L100
) where the first instruction mask all interrupts:
           /*
            * a0 -> started hart id
            * a1 -> private data passed by boot cpu
            */
   ENTRY(secondary_start_sbi)
           /* Mask all interrupts */
           csrw    CSR_SIE, zero
           ...
   	tail    smp_callin
  =20
Then at the start of smp_callin
(=C2=A0https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/ar=
ch/riscv/smpboot.c?ref_type=3Dheads#L258
) tp register is setup ( in the old way for now using inline assembly I
will switch to setup_tp() later a little bit and call it before 'tail
smp_callin' ) and only after that local irqs are enabled:
   void __init smp_callin(unsigned int cpuid)
   {
       unsigned int hcpu =3D 1;
  =20
       for ( ; (hcpu < NR_CPUS) && (cpuid_to_hartid_map(hcpu) !=3D cpuid);
   hcpu++)
       {}
  =20
       asm volatile ("mv tp, %0" : : "r"((unsigned
   long)&pcpu_info[hcpu]));
   ...
      trap_init(); /* write handle_trap() address to CSR_STVEC */
   ...
      local_irq_enable();
   ...
  =20
>=20
> > > =C2=A0If
> > > so, all is fine here. If not, transiently pointing tp at CPU0's
> > > space
> > > is a possible problem.
> > I haven't had any problem with that at the moment.
> >=20
> > Do you think that it will be better to use DECLARE_PER_CPU() with
> > updating of setup_tp() instead of pcpu_info[] when SMP will be
> > introduced?
> > What kind of problems should I take into account?
>=20
> If exceptions can be handled by Xen already when entering this
> function,
> then the exception handler would need to be setting up tp for itself.
> If
> not, it would use whatever the interrupted context used (or what is
> brought into context by hardware while delivering the exception). If
> I
> assumed that tp in principle doesn't need setting up when handling
> exceptions (sorry, haven't read up enough yet about how guest -> host
> switches work for RISC-V), and if further exceptions can already be
> handled upon entering setup_tp(), then keeping tp properly invalid
> until
> it can be set to its correct value will make it easier to diagnose
> problems than when - like you do - transiently setting tp to CPU0's
> value (and hence risking corruption of its state).
Regarding tp in exception handler if it is an exception from Xen it
will be set to 0 ( it is done by switch CSR_SSCRATCH and tp, and
CSR_SSCRATCH is always 0 for Xen and for guest it will be set to
pcpu_info[cpuid] before returning to new
vcpu:https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch=
/riscv/entry.S?ref_type=3Dheads#L165
) at the start of the handler; otherwise if an exception from Guest it
will set to &pcpu_info[cpuid] which was stored in CSR_SSCRATCH:
https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/risc=
v/entry.S?ref_type=3Dheads#L15

As I mentioned above, interrupts will be disabled until tp is set. Even
if they aren=E2=80=99t disabled, tp will be set to 0 because, at the moment=
 the
secondary CPU boots, CSR_SSCRATCH will be 0, which indicates that the
interrupt is from Xen.

> - like you do - transiently setting tp to CPU0's value (and hence >
risking corruption of its state).
I think I=E2=80=99m missing something=E2=80=94why would the secondary CPU h=
ave the same
value as CPU0? If we don=E2=80=99t set up the tp register when the secondar=
y
CPU boots, it will contain a default value, which is expected upon
boot. It will retain this value until setup_tp() is called, which will
then set tp to pcpu_info[SECONDARY_CPU_ID].

~ Oleksii






