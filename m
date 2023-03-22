Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AB16C4EC0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 16:00:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513503.794587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pezw3-0006e3-IO; Wed, 22 Mar 2023 14:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513503.794587; Wed, 22 Mar 2023 14:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pezw3-0006b8-FP; Wed, 22 Mar 2023 14:59:31 +0000
Received: by outflank-mailman (input) for mailman id 513503;
 Wed, 22 Mar 2023 14:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhKM=7O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pezw2-0006b2-L8
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 14:59:30 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25739743-c8c2-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 15:59:29 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id l12so17378393wrm.10
 for <xen-devel@lists.xenproject.org>; Wed, 22 Mar 2023 07:59:29 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 c9-20020a5d4cc9000000b002d21379bcabsm13988188wrt.110.2023.03.22.07.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 07:59:28 -0700 (PDT)
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
X-Inumbo-ID: 25739743-c8c2-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679497169;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZWhTIjwftH5tgD5lx0w9vZEyC4F6aQl72KqxgpQSYHM=;
        b=hm1UFCgHqdUjlyrqKl11AVdTIDUUhB8zcGOv9/hhT/NTlpwC/BGZozYIVy3IZQoqrC
         8tEHttlb9HX5RnCb9hnLV85dh6F77kS+T7G2fVbkBbIJ9denl7/JMt4XSnPRjZGkofOq
         qNHrofRz671NiSHjsaKDUbR36F1+NFfdVkCSjaNqGGFypK8VF5/LDE36LQnYcvF10ecC
         qETIgRiagfiMb969cHLanQqPpL4DcIBgDTsBXy2o+WtNCyY9kBGbZ8SRrgQDKHD97tEP
         XrQG1U7wO2AIMVvt2Mdf7i+dBAWsDbzm5TFiMQitCmwzTwIJasWmKFfFEnuNdyXk+6Uq
         QKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679497169;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZWhTIjwftH5tgD5lx0w9vZEyC4F6aQl72KqxgpQSYHM=;
        b=o2NUt69TmFrZbya1O45eXs+1xmxqbvHaZcz/cbouwBjPCitXARZRgTMtuYX2+qc61g
         y5whwNHl+hhd6FcoXwbTNzcnw7YjWFrnoKNDKZ6KeaQIqnBbl8AGKSmSgue5QyjrFuQU
         ptbnAhhDrSZ4X+xavHrWFHOvejQ99ByV8FWepIwglzeqjc10MOMkRhoL77mwLu83OnMY
         FQU6CNU8O3OVSNlLN2+RZryAOhJImG8QtAWSfYJC3cy1bAtukqiYXxjaxDxfGHxJ37HV
         6ZFsvc1vHAyiGHwijfhWpwCnan0QF4Sfuy7RY0xXqvLPUWgvUwoT8yIRdd8qygxtRgPt
         NmDg==
X-Gm-Message-State: AAQBX9c7W97BiRigpvXvzYmIHv9q1K5wcuGe0TNX8Rnq2SU4SgC24v/H
	+82Nj0NLfsZvfR2/YWHp0Vg=
X-Google-Smtp-Source: AKy350ZA53biLX6QOpfGZ0omEMXOWfXQRJG25nl3g2Vr0myXyDIsfDXg7T2hSF/YZ2jQ5zShgdkC7w==
X-Received: by 2002:a5d:534d:0:b0:2c7:194c:5e41 with SMTP id t13-20020a5d534d000000b002c7194c5e41mr79518wrv.51.1679497169153;
        Wed, 22 Mar 2023 07:59:29 -0700 (PDT)
Message-ID: <4803eb7e39a66ec8d9db767e979d66034197a358.camel@gmail.com>
Subject: Re: [PATCH v5 4/7] xen/riscv: introduce decode_cause() stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>, Julien
 Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Date: Wed, 22 Mar 2023 16:59:26 +0200
In-Reply-To: <486cf6f9-4e28-17b5-3ab3-31272955926b@suse.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
	 <8c7b4a5d328be8b1cd2aa99c8d9a7883e4969600.1678976127.git.oleksii.kurochko@gmail.com>
	 <0b94be57-b8fb-6c38-9ed8-dc8482694153@xen.org>
	 <cf883a86eac88c11d02768eb64adb2b418c6ba2e.camel@gmail.com>
	 <771418cf-9515-cc93-14c7-4bea60c30b2b@suse.com>
	 <98a891792446e72d910ee49a62c7e3b3d2d6c186.camel@gmail.com>
	 <486cf6f9-4e28-17b5-3ab3-31272955926b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-22 at 14:46 +0100, Jan Beulich wrote:
> On 22.03.2023 14:32, Oleksii wrote:
> > On Wed, 2023-03-22 at 13:26 +0100, Jan Beulich wrote:
> > > But as said before - I'm unconvinced this approach will scale,
> > > because
> > > you'll need to apply the wrapper to anything which can be reached
> > > prior
> > > to you enabling the MMU. Whether you can contain this to RISC-V-
> > > only
> > > code is unclear; I don't think it'll be acceptable to change any
> > > part
> > > of common code to meet your special needs.
> > But it looks like it is only two places where it should be done:
> > 1. As you mentioned LINK_TO_LOAD() should be applied for
> > trap_causes.
> > 2. And it should be applied inside do_bug_frame() for getting an
> > start/end address of bug_frame. I want to note that do_bug_frame()
> > will
> > be removed after RISC-V is ready to switch to generic bug
> > implementation.
> >=20
> > The next step after the current patch series is merged is to enable
> > MMU, so it shouldn't be new use cases where it is needed to use
> > LINK_TO_LOAD().
>=20
> I'm not convinced. You can't stick to using earlyprintk only beyond
> very short term. Yet I expect you also don't want to use
>=20
> =C2=A0=C2=A0=C2=A0 if ( early )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 earlyprintk();
> =C2=A0=C2=A0=C2=A0 else
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk();
>=20
> everywhere in exception handling code (and anywhere else in code
> which is reachable before the MMU is turned on). This extends to
> uses of BUG() and alike in such early code, which - when they
> trigger - want to use printk() (only). Whether printk(), somehow,
> involves an array access similar to the ones you're presently
> aware of you simply shouldn't depend on (it's an implementation
> detail in a separate subsystem).
I planned to changed all earlyprintk() to printk() in traps.c after
printk will be ready.

I would like to remind that xen/common code isn't compiled now for
RISC-V.
>=20
> > If it is not acceptable to change any part of common code ( as I
> > understand in this case it is do_unexpected_trap() and all that is
> > called inside it ) have I to introduce two types of function
> > do_unexpected_trap() for when MMU is enabled and not?
>=20
> By "common code" I mean code outside of arch/riscv/. And I
> sincerely hope you / we can get away without duplicated functions.
Got it.

Than it might be an issue with do_bug_frame() as RISCV should be
switched to it at the end.

Then it looks like enabling of MMU should go first but in that case
this not clear what to do with BUG(), WARN() etc as for them it is
needed excpetion handling functionality and MMU related code uses the
macros.

~ Oleksii

