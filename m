Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB0797E918
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 11:52:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801785.1211784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfjM-0000lK-E1; Mon, 23 Sep 2024 09:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801785.1211784; Mon, 23 Sep 2024 09:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfjM-0000iA-Af; Mon, 23 Sep 2024 09:51:44 +0000
Received: by outflank-mailman (input) for mailman id 801785;
 Mon, 23 Sep 2024 09:51:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81ci=QV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ssfjK-0000gH-Ta
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 09:51:42 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fb690e4-7991-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 11:51:42 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2f8ca33ef19so5501861fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 02:51:42 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f43f4sm1194890666b.80.2024.09.23.02.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 02:51:40 -0700 (PDT)
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
X-Inumbo-ID: 6fb690e4-7991-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727085102; x=1727689902; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lL225Y3S+GVR5FlTMHIol9awL7Mf/SWOhHbDuHHzBsM=;
        b=gGXqP005tgDcrgJs0eEqKfcPc/ahFy/lF7Wnb18e8tLhklAhCLgpiqPIgp14PVGLWM
         YwwBoDccZKPONyKRMrOYSkd6cfqe7uowIUrbnNZ7cYQRzrHnYeh9va1vDxu5m0Uq7t1z
         IaQ5+/wkDMCv54EIo6C7h4Gko9wFR2556zZbM1kH0E5euuxCtQfse0dV4+0XUrCejlch
         zNtHOJYlMZcy9Z6da/snARlpHnMoyVcO9aZLCteZBpHEkvfv5HedNw8Gx4Y167Q2zCfS
         xT+pH19dmz5OYKmsKgPTYk57CfIJ0FoLQGoGvoYoXXUhzea5ww58vvD9FQslT6P081p4
         sv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727085102; x=1727689902;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lL225Y3S+GVR5FlTMHIol9awL7Mf/SWOhHbDuHHzBsM=;
        b=AJoVo8h9Q3KKiHHrs46+jsGRmQBncHxod4rmsB/GLyNMZVSoXGZjCqXYaHamQYz+n8
         9dsrtXlFEh6L0b7rBhKPBzg5ahdnePDyNsjbe3EMu7X20T2kAdfuTVX+PqCm0r4OLmUV
         pgiLQSwIF1V0havKkf++gIzSQF2wapxM+n4k3A920dyvWEC09BwA3x8mmEpGbo92WkCM
         ydcRCXx8AmrpzwyS+hc4f2LAIaFjhlB0NKGUtUHLi8d/YYZWn8EoneLGleI5C3Appr/Y
         kwMx7wt9y+F0pwhohTsEYNp5bFpSHJZlxRPMNBkH0/cb56qxn1k7NloeMBlDZ1nYed7k
         aC/w==
X-Forwarded-Encrypted: i=1; AJvYcCV4LbM6O7EjYjyVS0P+W0kDCcHaIaqXAv9O4qA4fFyL9END+8GKXGNcfU5KrVmlVZ7L+iG9tsh3fAk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8ql1o43vpSicXam8Gy0cVq1kxV8F0OliUgwjsn+1HKQLnk5mx
	i011j66AcRaiL+TmayKCwjqY3GyiqYNyXaBrL0CC+B5v5kRWLSbw
X-Google-Smtp-Source: AGHT+IF7xVigoVZ+V4tX9B/OdDSnLQ6gRpH3aafTvIvur2OxRXVzt2fO7QX4wBnl2bU7+6Yi4qUjiQ==
X-Received: by 2002:a05:651c:1509:b0:2ef:2555:e52d with SMTP id 38308e7fff4ca-2f7cb37f0a1mr61108551fa.45.1727085101572;
        Mon, 23 Sep 2024 02:51:41 -0700 (PDT)
Message-ID: <396a16baf5ecb383c69778885dc6c073ce43ad08.camel@gmail.com>
Subject: Re: [PATCH v1 2/2] xen: move per-cpu area management into common
 code
From: oleksii.kurochko@gmail.com
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Shawn
 Anastasio <sanastasio@raptorengineering.com>,  Alistair Francis
 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>
Date: Mon, 23 Sep 2024 11:51:39 +0200
In-Reply-To: <a5b7dbdf-886b-45d6-8402-db04c58423e8@xen.org>
References: <cover.1726746877.git.oleksii.kurochko@gmail.com>
	 <15b9b94e1acb70ba713391de5bae42a622c29747.1726746877.git.oleksii.kurochko@gmail.com>
	 <a5b7dbdf-886b-45d6-8402-db04c58423e8@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

Hi Julien,

On Sun, 2024-09-22 at 10:23 +0200, Julien Grall wrote:
> > +}
> =C2=A0> +#endif> +
> > +#ifndef ARCH_CPU_PERCPU_CALLBACK
> > +inline int arch_cpu_percpu_callback(struct notifier_block *nfb,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned=
 long action, void
> > *hcpu)
>=20
> I am not entirely sure we should introduce arch_cpu_percpu_callback.
> It=20
> seems there are some redundant work. Looking at the x86
> implementation=20
> the differences are:
> =C2=A0=C2=A0 * The additional checks
> =C2=A0=C2=A0 * Extra actions (e.g CPU_RESUME_FAILED/CPU_REMOVE).
>=20
> I think the extra actions also make sense for other architectures.
> For=20
> the additional checks, the parking feature is implemented in
> common/*.
>=20
> So is there any way we could avoid introduce
> arch_cpu_percpu_callback()?

Initially, I did not want to introduce arch_cpu_percpu_callback(), and
if it were only the park_offline_cpus check, it would be safe enough
since other architectures would continue to function as before ( and
CPU parking is a common feature so it is to be expected to work on
different architectures ), with park_offline_cpus =3D false for them.

I then decided to investigate why the check system_state !=3D
SYS_STATE_suspend is necessary, and according to the commit message:
```
    xen: don't free percpu areas during suspend
   =20
    Instead of freeing percpu areas during suspend and allocating them
    again when resuming keep them. Only free an area in case a cpu
didn't
    come up again when resuming.
   =20
    It should be noted that there is a potential change in behaviour as
    the percpu areas are no longer zeroed out during suspend/resume.
While
    I have checked the called cpu notifier hooks to cope with that
there
    might be some well hidden dependency on the previous behaviour.
OTOH
    a component not registering itself for cpu down/up and expecting to
    see a zeroed percpu variable after suspend/resume is kind of broken
    already. And the opposite case, where a component is not registered
    to be called for cpu down/up and is not expecting a percpu variable
    suddenly to be zero due to suspend/resume is much more probable,
    especially as the suspend/resume functionality seems not to be
tested
    that often.
```
It is mentioned that "there is a potential change in behavior as the
percpu areas are no longer zeroed out during suspend/resume." I was
unsure if this change might break something for Arm.

I can attempt to move everything to the common percpu.c and at least
verify that there are no issues in CI. If that suffices to confirm that
everything is okay, I can create a new patch series version.

Does this make sense?

~ Oleksii

