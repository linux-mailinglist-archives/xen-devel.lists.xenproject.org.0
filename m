Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 399E997516E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:06:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796485.1206086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soM69-00084R-3P; Wed, 11 Sep 2024 12:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796485.1206086; Wed, 11 Sep 2024 12:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soM69-00082v-0g; Wed, 11 Sep 2024 12:05:25 +0000
Received: by outflank-mailman (input) for mailman id 796485;
 Wed, 11 Sep 2024 12:05:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TDmC=QJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1soM66-00082p-Re
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:05:22 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1eb654e8-7036-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 14:05:21 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f753375394so47932411fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:05:21 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f8cb7f7sm1566682e87.168.2024.09.11.05.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 05:05:20 -0700 (PDT)
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
X-Inumbo-ID: 1eb654e8-7036-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726056321; x=1726661121; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4JmZ2ysTbysxlJUkLGgqwxAISZikgF8AIoI1EJPfWis=;
        b=YY5mORsUdcmtYw/zoN3SLcshfQ5RuVvmbZylAwko4AQzAJcZod16uMO2A82H5PjkiF
         pS0vZkRyZlR+OC1ag3Ym/yycdn7Z2KMmo9wKBrmug2Vxi1nu2TxdNJC3mISKsRvOdBwZ
         rLbHu3OkXvTyzqfe5BT2tWSGXL3HfmCcCFnoMR8YN32qUz+4Q4g/Ph5E7MLU8fYC7Pe9
         6nWj1W8j/QpbJjA2y+CVdjxzby3TF5k1x1aX9Mn0uYFcjgMIGd7CkrB5AJXDUI7dE52t
         MlUjf+3C+o7SIVHGXy+zWQSkWlIHyBanenB+zKTbLH7GPVDugMVoOUhcS5YEiVj4qRTL
         fbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726056321; x=1726661121;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4JmZ2ysTbysxlJUkLGgqwxAISZikgF8AIoI1EJPfWis=;
        b=ui9SssDtoY6HyOieHUUhRTXJG8mbQOHwsdKItfWkxl/SjtLAZ8wRsWwkRqTXJVGoU+
         jZthqz6QUFTTjd6rHwUg8bHZn9IBTogWrsapHiCcc2Hp8AM4v9AYs1Or/jefrjau4yMj
         QT2SekZDft4bebdauy7XHj9kYBTQHSck8qtAm+XBX0TsjM0o3pXQVBjsU+QC18b7Em0L
         ALr+MSkHSgNazzQS5F5OoMoo7mjd0IMm4DDhzpuG47+yk4ljeNzfquwXVkOxujGAkahz
         TWIBrpjB9ta18SJR5QLQ3BNmo/olrypmYsYfuU+fvXjWsHbWhpsSky5uZlGhJMBtojnr
         fVNw==
X-Forwarded-Encrypted: i=1; AJvYcCVGgTvFYMm0ayE3twf9D6FOu5s/34dVhDO9sFBc16CRWT12Yzs7ehGSGWyaSc1fNXShR+fg4T9DgK8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTu7qYRLFcq7WAhbcj7DU5HLPu5U2hJhtnPsRQ/JrB1wPICISc
	HIlHpDc9+Y1evQA4StIRpT8kqmVhWgIfiQV1BYmZn+Iu0r2QWntj
X-Google-Smtp-Source: AGHT+IELiyMlNra2awSNNSEwgre8z/JznF5qbST4ddSq9dNVXyVozLczCs7k3Tl6l3/KUv+r7JQ/Fg==
X-Received: by 2002:a05:6512:2389:b0:533:901:e441 with SMTP id 2adb3069b0e04-536587a54f5mr9682331e87.10.1726056320808;
        Wed, 11 Sep 2024 05:05:20 -0700 (PDT)
Message-ID: <de3f5c4fd5dd2a8533ea376a013f8e40b85dc6b7.camel@gmail.com>
Subject: Re: [PATCH v6 6/9] xen/riscv: introduce functionality to work with
 CPU info
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 11 Sep 2024 14:05:19 +0200
In-Reply-To: <6c43c528-daa9-4449-a383-aade3da73160@suse.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
	 <77a00222008f8b41d2454e74d1c9247252d7ccd9.1725295716.git.oleksii.kurochko@gmail.com>
	 <6c43c528-daa9-4449-a383-aade3da73160@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-09-10 at 12:33 +0200, Jan Beulich wrote:
> On 02.09.2024 19:01, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/processor.h
> > +++ b/xen/arch/riscv/include/asm/processor.h
> > @@ -12,8 +12,31 @@
> > =C2=A0
> > =C2=A0#ifndef __ASSEMBLY__
> > =C2=A0
> > -/* TODO: need to be implemeted */
> > -#define smp_processor_id() 0
> > +#include <xen/bug.h>
> > +
> > +register struct pcpu_info *tp asm ( "tp" );
> > +
> > +struct pcpu_info {
> > +=C2=A0=C2=A0=C2=A0 unsigned int processor_id; /* Xen CPU id */
> > +=C2=A0=C2=A0=C2=A0 unsigned long hart_id; /* physical CPU id */
> > +} __cacheline_aligned;
>=20
> Shouldn't you include xen/cache.h for this, to be sure the header can
> be included on its own?
Agree, it would be better to include xen/cache.h header.

>=20
> I'm also unconvinced of this placement: Both Arm and x86 have similar
> structures (afaict), living in current.h.
Then for consistency it would be better to move this structure to
current.h for RISC-V.

>=20
> > +/* tp points to one of these */
> > +extern struct pcpu_info pcpu_info[NR_CPUS];
> > +
> > +#define get_processor_id()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (tp->processo=
r_id)
>=20
> Iirc it was in response to one of your earlier patches that we
> removed
> get_processor_id() from the other architectures, as being fully
> redundant with smp_processor_id(). Is there a particular reason you
> re-introduce that now for RISC-V?
No reason, just forgot that we agreed to use only smp_processor_id()
and made a bad rebase of my 'latest' branch on top of the current
staging which doesn't tell me about merge conflict in that place.
I will drop get_processor_id().

>=20
> > +#define set_processor_id(id)=C2=A0=C2=A0=C2=A0 do { \
> > +=C2=A0=C2=A0=C2=A0 tp->processor_id =3D (id);=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +} while (0)
> > +
> > +static inline unsigned int smp_processor_id(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned int id =3D get_processor_id();
> > +
> > +=C2=A0=C2=A0=C2=A0 BUG_ON(id > (NR_CPUS - 1));
>=20
> The more conventional way of expressing this is >=3D NR_CPUS.
>=20
> > @@ -14,6 +16,13 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
> > =C2=A0 */
> > =C2=A0#define park_offline_cpus false
> > =C2=A0
> > +/*
> > + * Mapping between linux logical cpu index and hartid.
> > + */
> > +#define cpuid_to_hartid(cpu) (pcpu_info[cpu].hart_id)
>=20
> Does this need to be a macro (rather than an inline function)?
No, there is no such need. I will use inline function instead.

>=20
> > @@ -72,6 +77,16 @@ FUNC(reset_stack)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret
> > =C2=A0END(reset_stack)
> > =C2=A0
> > +/* void setup_tp(unsigned int xen_cpuid); */
> > +FUNC(setup_tp)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 tp, pcpu_info
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 t0, PCPU_INFO_SIZE
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mul=C2=A0=C2=A0=C2=A0=C2=A0=
 t1, a0, t0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=C2=A0=
 tp, tp, t1
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret
> > +END(setup_tp)
>=20
> I take it this is going to run (i.e. also for secondary CPUs) ahead
> of
> Xen being able to handle any kind of exception (on the given CPU)?
Yes, I am using it for secondary CPUs and Xen are handling exceptions (
on the given CPU ) fine.

>  If
> so, all is fine here. If not, transiently pointing tp at CPU0's space
> is a possible problem.
I haven't had any problem with that at the moment.

Do you think that it will be better to use DECLARE_PER_CPU() with
updating of setup_tp() instead of pcpu_info[] when SMP will be
introduced?
What kind of problems should I take into account?

~ Oleksii




