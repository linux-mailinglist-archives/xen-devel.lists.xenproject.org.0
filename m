Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB1585C5CF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 21:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683728.1063301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcWl2-0004MW-Ai; Tue, 20 Feb 2024 20:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683728.1063301; Tue, 20 Feb 2024 20:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcWl2-0004Kd-7z; Tue, 20 Feb 2024 20:30:28 +0000
Received: by outflank-mailman (input) for mailman id 683728;
 Tue, 20 Feb 2024 20:30:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvC9=J5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rcWl1-0004KX-08
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 20:30:27 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0485907-d02e-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 21:30:24 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5129e5b8cecso4898286e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 12:30:24 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a199142000000b00511570bf1desm1450031lfj.240.2024.02.20.12.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 12:30:23 -0800 (PST)
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
X-Inumbo-ID: e0485907-d02e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708461024; x=1709065824; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lbwkuduf+qdvroYy9Nltc2Q0VqNnF6JVyR/T8bbpGHo=;
        b=IMl7wcS4dxV2939dNJwJOrmOvoJvcDW8nBpTErKtG6FyR9zKXN2dmenZMOqAvWrbRD
         ao8kTMLymBte7sZV6IJUl45ujrsjrTBzIkVfX7HJorKXYWaohXhT3c0bjsdMRNPRRo04
         UQvm5klz7BAVDj8uqIHDZQJX/7bNldo+poFMicyE16X8mXWBpbvnuKQo/1XTh8h1jIBR
         iboncJX2G4piNAE6K+EVBH0qKRKZGC2iYtrF7zpDYnyaKzc/c/91SHDslK0MJLqc8k2K
         jFYRLEOZ8vpssL06w1M1S6Z48BGP2QQcnQSOkek+raJ1mUwHYjkN8N0QNwl+VxB3ebGr
         Hajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708461024; x=1709065824;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lbwkuduf+qdvroYy9Nltc2Q0VqNnF6JVyR/T8bbpGHo=;
        b=CJeohzYOCudWkdPUwiCRpjt3RyisSGl33a2u3C/B5hGsBQx9ZGqwmYG0oRzXx0cYFa
         i0kia1VbbQ4SuzPv6aGEDv2I+jRD/L76W8ro0AViuYCqZXZSryEEo7m8yQ7ZA4h0Thcx
         rNCcYR1YvtifnhHQnRFsStCIfXvRGFV1IijcR8KRX0MxOj8P9yeDpbLByxRTqaFitVb3
         QsHlXluvfyWBNGWM9gZBkVBLa2ndFwLnsrPoW8zJROmijRG22Vz4IagYRB/i6An7ZLvS
         AZI6B7pjQHO5PQph4M3jdkoubbCJxwbFKjWqocidVPINquy8ugi5jTO4JHcaLvAp+a9w
         RBAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjChxPZ9T4pogzjwNlPKrrjzpaSF4l6qChISqS9Fqjo2Fme2Nv1L5IawadpUlYsZUueZ5nPLB1M5IUfMV3tAjQRJ9rovy8zMS5GaiWsGs=
X-Gm-Message-State: AOJu0Yx2HKGHh3uYdmrtWOOj8T58pZqSNSNtkwTjQJLZC449FXJvVc9k
	e4Zwo8/FdL+hN482gQIpWUPVUirGYLQx9YDploMqTMaSS9cTdgHv
X-Google-Smtp-Source: AGHT+IG42Y7mHPXbC+/kWmdTEpgcWa/OVZJ2SqxHd1CNTvHiBtxAw9LRQu2P+poXm5oKVU6q58F3Jg==
X-Received: by 2002:ac2:4a68:0:b0:512:a37a:bde2 with SMTP id q8-20020ac24a68000000b00512a37abde2mr6506385lfp.67.1708461023724;
        Tue, 20 Feb 2024 12:30:23 -0800 (PST)
Message-ID: <ab040f3c8ee35f49fffac385053b55053c52da8c.camel@gmail.com>
Subject: Re: [PATCH v4 07/30] xen/asm-generic: introdure nospec.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,  Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Julien
 Grall <julien@xen.org>,  xen-devel@lists.xenproject.org
Date: Tue, 20 Feb 2024 21:30:22 +0100
In-Reply-To: <aaf86d31-7ae0-4e33-8386-dda4bd21496a@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <5889d7a5fa81722472f95cc1448af0be8f359a7d.1707146506.git.oleksii.kurochko@gmail.com>
	 <510d74ca-5cce-48f8-93f6-407cd727cf7b@xen.org>
	 <8a09e386b709f780f193af39af63b6aeb75c868e.camel@gmail.com>
	 <aaf86d31-7ae0-4e33-8386-dda4bd21496a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-19 at 13:18 +0100, Jan Beulich wrote:
> On 19.02.2024 12:59, Oleksii wrote:
> > Hi Julien,
> >=20
> > On Sun, 2024-02-18 at 18:30 +0000, Julien Grall wrote:
> > > Hi Oleksii,
> > >=20
> > > Title: Typo s/introdure/introduce/
> > >=20
> > > On 05/02/2024 15:32, Oleksii Kurochko wrote:
> > > > The <asm/nospec.h> header is similar between Arm, PPC, and
> > > > RISC-V,
> > > > so it has been moved to asm-generic.
> > >=20
> > > I am not 100% convinced that moving this header to asm-generic is
> > > a
> > > good=20
> > > idea. At least for Arm, those helpers ought to be non-empty, what
> > > about=20
> > > RISC-V?
> > For Arm, they are not taking any action, are they? There are no
> > specific fences or other mechanisms inside
> > evaluate_nospec()/block_speculation() to address speculation.
>=20
> The question isn't the status quo, but how things should be looking
> like
> if everything was in place that's (in principle) needed.
>=20
> > For RISC-V, it can be implemented in a similar manner, at least for
> > now. Since these functions are only used in the grant tables code (
> > for
> > Arm and so for RISC-V ), which is not supported by RISC-V.
>=20
> Same here - the question is whether long term, when gnttab is also
> supported, RISC-V would get away without doing anything. Still ...
>=20
> > > If the answer is they should be non-empty. Then I would consider
> > > to
> > > keep=20
> > > the duplication to make clear that each architecture should take
> > > their=20
> > > own decision in term of security.
> > >=20
> > > The alternative, is to have a generic implementation that is safe
> > > by=20
> > > default (if that's even possible).
> > I am not certain that we can have a generic implementation, as each
> > architecture may have specific speculation issues.
>=20
> ... it's theoretically possible that there'd be an arch with no
> speculation issues, maybe simply because of not speculating.

I am not sure that understand your and Julien point.

For example, modern CPU uses speculative execution to reduce the cost
of conditional branch instructions using schemes that predict the
execution path of a program based on the history of branch executions.

Arm CPUs are vulnerable for speculative execution, but if to look at
the code of evaluate_nospec()/block_speculation() functions they are
doing nothing for Arm.

~ Oleksii

