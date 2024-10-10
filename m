Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7DE9985EF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 14:29:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816083.1230259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sysHs-0007rQ-Mu; Thu, 10 Oct 2024 12:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816083.1230259; Thu, 10 Oct 2024 12:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sysHs-0007pY-JA; Thu, 10 Oct 2024 12:29:00 +0000
Received: by outflank-mailman (input) for mailman id 816083;
 Thu, 10 Oct 2024 12:28:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5QbA=RG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sysHq-0007oG-VO
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 12:28:59 +0000
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [2607:f8b0:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3863ac35-8703-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 14:28:58 +0200 (CEST)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3e41eabddffso502086b6e.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 05:28:57 -0700 (PDT)
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
X-Inumbo-ID: 3863ac35-8703-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728563336; x=1729168136; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVr2tzjp7mndwbJzY9Kp8a1hGwAvtSwRwSWeTlIqfNA=;
        b=X4S9hbhZXOnZ0Bo07aJBLYr2NQVojq3Joy3Fn5ohsoaWKy/KnCKnYYLCqZNfXYQWtU
         HF3abXrVAmWCbKXmUjqymXKLIptRTC1APxq1rbCyIhd2b8e7cepVH6HfxOQXyPXt1mQJ
         fY6n162NWmkcAzaxuVrP22bKDNYb3cEuHlKRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728563336; x=1729168136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVr2tzjp7mndwbJzY9Kp8a1hGwAvtSwRwSWeTlIqfNA=;
        b=paely/Tjqr9kSPZ743xxAxAIOtxM6BCDyFA+MbihKfywQlknfzqSVAFDfZYW8GH8LH
         WTtGLZ64LkAX0MiForaP4hVOXSzdv9fpgP0fadnhG0YsVOpbtrbffzl2npn16TR5P2Ml
         uLpdIVV7waZjo3FYJKegK3MiMMO37cny5UxNamYpEJmCv3H2nciC7pF3dY6Kp5npPrAV
         C8u2Pssgn9ffzFTqaJw1LgDY3EPzKDwR0YbMkm53+0RmzphyalqM0wjgOLaqy0ADecwb
         cnNe7yHfJzNssRcCLTg1Z86rH+iOihkVgxMeYPdfIm2VEPRMkbSgqq4yM514zYkFMxRQ
         VKKw==
X-Gm-Message-State: AOJu0Yx9FwNO/cpP9DA/c4uxRLiW/eOit+DcxK3NtvLJP8zsiShMqNeo
	05O/BbanQys0s4rfCDfc9mWmVt5ZEQNmaRXh/zaO+tmgTMqTFsy7LhaR6NpzRZa9HqQQpVvGkkz
	+CNS7pKD4BrD+vE0U8LTQGz1MSKd/GFSTvnrToA==
X-Google-Smtp-Source: AGHT+IHq7AAWWoKX1+RBP5j6WQHwgCCNE4MfqYWI/STTo0yBAyFuTrrWPI8vrSuiavwgasWj9XfNiIVs/8AoRnFnltk=
X-Received: by 2002:a05:6870:b623:b0:287:81cd:1452 with SMTP id
 586e51a60fabf-288345ac979mr4851272fac.46.1728563336594; Thu, 10 Oct 2024
 05:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20241004081713.749031-1-frediano.ziglio@cloud.com> <cf65ab1b-c7d6-430f-a747-3fa0185881e6@citrix.com>
In-Reply-To: <cf65ab1b-c7d6-430f-a747-3fa0185881e6@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 10 Oct 2024 13:28:45 +0100
Message-ID: <CACHz=ZguquL7igxUYw=V1tzDjJbHg0UV++WWBjRjcB_DYmx8TQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/19] Update header guards bases on new coding style
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Paul Durrant <paul@xen.org>, Tim Deegan <tim@xen.org>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, 
	Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>, 
	Doug Goldstein <cardoe@cardoe.com>, Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, 
	George Dunlap <gwd@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 12:26=E2=80=AFPM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 04/10/2024 9:16 am, Frediano Ziglio wrote:
> > Frediano Ziglio (19):
> >   xen: Update header guards - Generic
> >   xen: Update header guards - X86
> >   xen: Update header guards - ACPI
> >   xen: Update header guards - ARGO
> >   xen: Update header guards - ARM
> >   xen: Update header guards - Device tree
> >   xen: Update header guards - EFI
> >   xen: Update header guards - HYPFS
> >   xen: Update header guards - Intel TXT
> >   xen: Update header guards - I/O MMU
> >   xen: Update header guards - Kconfig
> >   xen: Update header guards - KEXEC
> >   xen: Update header guards - Live patch
> >   xen: Update header guards - PPC 64
> >   xen: Update header guards - RISC-V
> >   xen: Update header guards - Scheduling
> >   xen: Update header guards - VM event, mem access, monitor
> >   xen: Update header guards - VPCI
> >   xen: Update header guards - XSM/Flask
>
> This scheme is under dispute within the core maintainership.  One thing
> it has highlighted is that the MISRA identifier-length limit isn't being
> correctly enforced in Eclair right now.
>
> Please do not continue with this any further at this juncture.
>
> ~Andrew

No problems, I'll keep the branch and scripts waiting for correction
to our CODING_STYLE that are technically correct and agreed.
In the meantime, I would suggest to rollback the CODING_STYLE commit
about it, specifically commit a7201c021174efc908d939079db5bb2f89962a0d
"CODING_STYLE: header file guard naming rules".


Frediano

