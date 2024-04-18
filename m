Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418848A9B05
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 15:18:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708363.1107230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRee-0004tH-0o; Thu, 18 Apr 2024 13:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708363.1107230; Thu, 18 Apr 2024 13:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxRed-0004qh-Tl; Thu, 18 Apr 2024 13:18:19 +0000
Received: by outflank-mailman (input) for mailman id 708363;
 Thu, 18 Apr 2024 13:18:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wMuF=LX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rxRec-0004qW-N7
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 13:18:18 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e100822-fd86-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 15:18:16 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-516f2e0edb7so1082902e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 06:18:16 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a056512329800b00519331d8b66sm237477lfe.110.2024.04.18.06.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 06:18:15 -0700 (PDT)
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
X-Inumbo-ID: 1e100822-fd86-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713446296; x=1714051096; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hc2X3KHbrRGZpR0PRDi/EAZCMc879QJWBw32+CYQ1hc=;
        b=kM6pGBX17YOT7lXvcwfMaZT17x1QVc3DmzEa3l67Zye+uLnooh054asG6ptDlKxhkM
         9XbjwtwEmpJUZeJgrD2YhUTJpUyE4tHmGwtcX9zcN7zi/PSnZLZ8DMolQ7cDxrIxiOco
         czO1/LQyJhwUfLq42seWNBa1lNkh84lSFAe+Sbot0lhbPqpKRtP7ABI3lF+pNDFS/6jb
         pt0NBzEgwKKexRV2JdvzEJyD4Nba3vOoKqpFpEPo9ywExO8brLOSpM3SqcR1rGHdTLQQ
         6AkBuT3hJlM77RYYM9ZF/KbDDAilESNL9cUkq0j+pp5hkAvmRWtAwzdE4zyrrsT4UU9/
         Cz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713446296; x=1714051096;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hc2X3KHbrRGZpR0PRDi/EAZCMc879QJWBw32+CYQ1hc=;
        b=cNOoFKZPAjXpe6XN7NCXr+QLvmybWIehUrsVMpv7VQpYL1qdt947KT6mySAiT/NDD0
         QtmWxE7wVa5FJvGrvcpbzeJDE1Sb/5YtbKIU7s+N0U1ikaogFapNB0wjEgWb/INckfyq
         ip8JY+urZT2FZSV3QMA3sHC+MyeqpmcxaUquCD2DuJuujyIMU/PW4a6Mr5cnkUgKXcxd
         knumuOBB4/ZE2AvadfNTV/ycLKHZ6urSudh/00/Xz/0OWOQShCTaa0xiq0FiWtnFPvmM
         RlVWIY6xLvD6XclevmkVlMUiLT5FaJtO/su+tyJfKLbcqanMkKPnLU0u0E5Btxgn9OWJ
         PWkg==
X-Forwarded-Encrypted: i=1; AJvYcCXXUDR6nSlw444QsZwnBiTHufgFq0EK1lUvxPUdar6NUPgTI8yr6Fkb6xrNIv3iKnRrwI8b8ob8NT1PuiR9EnwYIzq95ubttaiDlpmCSvM=
X-Gm-Message-State: AOJu0YwrCUWq5m/hbKmY2wEpDmkjcGUe+RMhhEz/0HDKpogLyXwt8klA
	RquQ9MqPLK54SWQGTONhXIa9pcBlk9CmPU65d7hJMs4HWbjAekmi
X-Google-Smtp-Source: AGHT+IGAm7M6odkkO+BZhmj4xPM02B3Mjw2frsQThOcGb+YeJyZ3sLiKeYNM5VJmmSVfhL6azlxM4Q==
X-Received: by 2002:ac2:4465:0:b0:518:ebff:6a3 with SMTP id y5-20020ac24465000000b00518ebff06a3mr1297342lfl.16.1713446295763;
        Thu, 18 Apr 2024 06:18:15 -0700 (PDT)
Message-ID: <64c38b454ff9c1438dcd2e30a2aeddb560e3bbd1.camel@gmail.com>
Subject: Re: [PATCH v8 01/17] xen/riscv: disable unnecessary configs
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Alistair Francis <alistair.francis@wdc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Date: Thu, 18 Apr 2024 15:18:14 +0200
In-Reply-To: <9ea586eb-b9ac-441b-981d-f35ee70b9831@suse.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
	 <267bb71ebeeafde25284eff82408effebba4380b.1713347222.git.oleksii.kurochko@gmail.com>
	 <9ea586eb-b9ac-441b-981d-f35ee70b9831@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-04-18 at 09:14 +0200, Jan Beulich wrote:
> On 17.04.2024 12:04, Oleksii Kurochko wrote:
> > --- a/automation/gitlab-ci/build.yaml
> > +++ b/automation/gitlab-ci/build.yaml
> > @@ -515,10 +515,14 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
> > =C2=A0.riscv-fixed-randconfig:
> > =C2=A0=C2=A0 variables: &riscv-fixed-randconfig
> > =C2=A0=C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG: |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_BOOT_TIME_CPUPOOLS=3Dn
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_EXPERT=3Dy
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_MEM_ACCESS=3Dn
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_PERF_COUNTERS=3Dn
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_LIVEPATCH=3Dn
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_XSM=3Dn
>=20
> While XSM and BOOT_TIME_CPUPOOLS are covered in the description, I
> struggle
> with PERF_COUNTERS: What's missing there (besides trivial asm/perfc.h
> and
> asm/perfc_defn.h)?
I think only them are needed. I can wrap them by #ifdef
CONFIG_PERF_COUNTERS to check.

We could wrap asm/perfc.h by #ifdef CONFIG_PERF_COUNTERS, but it seems
it should be a separate patch and until there is no such patch it
should be disabled.


>  As to LIVEPATCH: I suppose there ought to be HAS_LIVEPATCH
> allowing arch-es to indicate whether they support that.
Hmm, I haven't seen HAS_LIVEPATCH. I think the intention was that it is
enough to have a default value, but it can be overridden.
   config LIVEPATCH
   	bool "Live patching support"
   	default X86
   ....
  =20
~ Oleksii

