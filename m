Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDC685D838
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 13:48:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684007.1063641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcm0U-0005nn-Ac; Wed, 21 Feb 2024 12:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684007.1063641; Wed, 21 Feb 2024 12:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcm0U-0005kz-7p; Wed, 21 Feb 2024 12:47:26 +0000
Received: by outflank-mailman (input) for mailman id 684007;
 Wed, 21 Feb 2024 12:47:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tO1j=J6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rcm0S-0005ka-6c
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 12:47:24 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5afc927b-d0b7-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 13:47:22 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d10ad265d5so72467941fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 04:47:22 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a05651c103200b002d250e323edsm378476ljm.89.2024.02.21.04.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 04:47:20 -0800 (PST)
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
X-Inumbo-ID: 5afc927b-d0b7-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708519641; x=1709124441; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bh3Pt3NERQ8sAQrTrTMndX28uy4hyOof3AfoSJBo/MM=;
        b=Qo1KDwsaiGmsLIiWlAVhINFfm0nURxa8kh20o6uzGu355QtHAisLfvuuwxAai+/0ku
         Xuou5oZwUTZUxl5iI8UdLES/6/LuMFlTK/Ii6YUtjbysoPwKNhdfe4AWg8jdylxQp2a/
         shkhi3IqQzho5wNIBTyIiJVfPnRxCICwSxXR5sb6VyWmzIdhzzsC19fxX35vIMpXMz7s
         lfxFmsLwsJxtCeJWSYVDcUGWc/KWur6+SWcSq/tNz7zRzbog8zxNGSwAthX/fyVWd7LW
         EKM1WmKYa2fHDrlXqvcO3e/kPp/xiP5CNon71MhV026F3Js20BD2dybFBnvKVZKkiT+/
         92ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708519641; x=1709124441;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bh3Pt3NERQ8sAQrTrTMndX28uy4hyOof3AfoSJBo/MM=;
        b=XGOQTVBRVY8iO7H6gfAbmK3YU2SnepYCNfs1pQjNp16NfCuQPh/bQcVS+3t2gLijLz
         FsCXGyqd8XCYFv4WzAPhbJTi8ZzwJ4U/sDUhaQJ7dkhLjeE89xl6EtpHC2mI4cXSO90P
         +8vOTMlql45EVHSgDvk+sg4JdNIZKenP1MuygNK1rjBEA3FdcVBOc5wRlkuG9CxPSHYO
         1sL1anAs+ESyAEVtjpjU6ZOEhQnkDPsemZX4yL6r5DJ+/tIyhYHU8BQvkHS8xOeUKb3g
         zeOladn9my+ti6S+JJQ6as5fBFIi1ucr4IfwFoW80Y1vNPNySGO+SjUZvQ5uXYicA+Dm
         Eufg==
X-Forwarded-Encrypted: i=1; AJvYcCVBQJXeK9jrEvJsYoMXAyNzpzBH5UrRqZFK9n3adDfOKwGoeWl0o1aRcODndH+ZF2V6FAmrh9yjzzo2OxWPe0a4dtGp/zIiH7vw2OClEYM=
X-Gm-Message-State: AOJu0Yz48gY6Mt2BDZTUaz5auA4SDXZ02oEmDBGrkpDzirFGs0lLW3Zp
	yKNj+SYphw5peMink7oG9hL0hEgsh3uvOxcgmBJEz/KTaA9eHFeV
X-Google-Smtp-Source: AGHT+IHEv2NoRIaXgY/O+6NofEY9+X1hHJnSiU3+cHQnm/kUqzszER7JKjArHoeyorpnk3znuotcYQ==
X-Received: by 2002:a05:651c:1043:b0:2d2:329f:7a7e with SMTP id x3-20020a05651c104300b002d2329f7a7emr7477351ljm.6.1708519641080;
        Wed, 21 Feb 2024 04:47:21 -0800 (PST)
Message-ID: <3e0c83fd0e3dc424059575cf9da9d57a87d90736.camel@gmail.com>
Subject: Re: [PATCH v4 07/30] xen/asm-generic: introdure nospec.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,  Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, 
 xen-devel@lists.xenproject.org
Date: Wed, 21 Feb 2024 13:47:19 +0100
In-Reply-To: <a6394d8a-63d0-42bf-8ed7-a7722cb7e71c@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <5889d7a5fa81722472f95cc1448af0be8f359a7d.1707146506.git.oleksii.kurochko@gmail.com>
	 <510d74ca-5cce-48f8-93f6-407cd727cf7b@xen.org>
	 <8a09e386b709f780f193af39af63b6aeb75c868e.camel@gmail.com>
	 <aaf86d31-7ae0-4e33-8386-dda4bd21496a@suse.com>
	 <ab040f3c8ee35f49fffac385053b55053c52da8c.camel@gmail.com>
	 <a6394d8a-63d0-42bf-8ed7-a7722cb7e71c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-02-21 at 12:00 +0100, Jan Beulich wrote:
> On 20.02.2024 21:30, Oleksii wrote:
> > On Mon, 2024-02-19 at 13:18 +0100, Jan Beulich wrote:
> > > On 19.02.2024 12:59, Oleksii wrote:
> > > > Hi Julien,
> > > >=20
> > > > On Sun, 2024-02-18 at 18:30 +0000, Julien Grall wrote:
> > > > > Hi Oleksii,
> > > > >=20
> > > > > Title: Typo s/introdure/introduce/
> > > > >=20
> > > > > On 05/02/2024 15:32, Oleksii Kurochko wrote:
> > > > > > The <asm/nospec.h> header is similar between Arm, PPC, and
> > > > > > RISC-V,
> > > > > > so it has been moved to asm-generic.
> > > > >=20
> > > > > I am not 100% convinced that moving this header to asm-
> > > > > generic is
> > > > > a
> > > > > good=20
> > > > > idea. At least for Arm, those helpers ought to be non-empty,
> > > > > what
> > > > > about=20
> > > > > RISC-V?
> > > > For Arm, they are not taking any action, are they? There are no
> > > > specific fences or other mechanisms inside
> > > > evaluate_nospec()/block_speculation() to address speculation.
> > >=20
> > > The question isn't the status quo, but how things should be
> > > looking
> > > like
> > > if everything was in place that's (in principle) needed.
> > >=20
> > > > For RISC-V, it can be implemented in a similar manner, at least
> > > > for
> > > > now. Since these functions are only used in the grant tables
> > > > code (
> > > > for
> > > > Arm and so for RISC-V ), which is not supported by RISC-V.
> > >=20
> > > Same here - the question is whether long term, when gnttab is
> > > also
> > > supported, RISC-V would get away without doing anything. Still
> > > ...
> > >=20
> > > > > If the answer is they should be non-empty. Then I would
> > > > > consider
> > > > > to
> > > > > keep=20
> > > > > the duplication to make clear that each architecture should
> > > > > take
> > > > > their=20
> > > > > own decision in term of security.
> > > > >=20
> > > > > The alternative, is to have a generic implementation that is
> > > > > safe
> > > > > by=20
> > > > > default (if that's even possible).
> > > > I am not certain that we can have a generic implementation, as
> > > > each
> > > > architecture may have specific speculation issues.
> > >=20
> > > ... it's theoretically possible that there'd be an arch with no
> > > speculation issues, maybe simply because of not speculating.
> >=20
> > I am not sure that understand your and Julien point.
> >=20
> > For example, modern CPU uses speculative execution to reduce the
> > cost
> > of conditional branch instructions using schemes that predict the
> > execution path of a program based on the history of branch
> > executions.
> >=20
> > Arm CPUs are vulnerable for speculative execution, but if to look
> > at
> > the code of evaluate_nospec()/block_speculation() functions they
> > are
> > doing nothing for Arm.
>=20
> Which, as I understood Julien say, likely isn't correct. In which
> case
> this header shouldn't be dropped, using the generic one instead. The
> generic headers, as pointed out several times before, should imo be
> used
> only if their use results in correct behavior. What is acceptable is
> if
> their use results in sub-optimal behavior (e.g. reduced performance
> or
> lack of a certain feature that another architecture maybe
> implements).

As I understand it, evaluate_nospec()/block_speculation() were
introduced for x86 to address the L1TF vulnerability specific to x86
CPUs. This vulnerability is exclusive to x86 architectures [1], which
explains why evaluate_nospec()/block_speculation() are left empty for
Arm, RISC-V, and PPC.

It is unclear whether these functions should be utilized to mitigate
other speculation vulnerabilities. If they should, then, based on the
current implementation, the Arm platform seems to accept having
speculative vulnerabilities.

The question arises: why can't other architectures make their own
decisions regarding security? By default, if an architecture leaves the
mentioned functions empty, it implies an agreement to potentially have
speculative vulnerabilities. Subsequently, if an architecture needs to
address such vulnerabilities, they can develop arch-specific nospec.h
to implement the required code.

If reaching an agreement to potentially have speculative
vulnerabilities is deemed unfavorable, I am open to reconsidering these
changes and reverting to the use of arch-specific nospec.h.
Your input on this matter is appreciated.

[1] https://docs.kernel.org/admin-guide/hw-vuln/l1tf.html


