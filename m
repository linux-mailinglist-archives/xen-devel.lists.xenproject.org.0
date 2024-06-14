Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59257908B13
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 13:53:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740619.1147725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI5UN-0004Tl-RJ; Fri, 14 Jun 2024 11:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740619.1147725; Fri, 14 Jun 2024 11:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI5UN-0004R0-Na; Fri, 14 Jun 2024 11:53:03 +0000
Received: by outflank-mailman (input) for mailman id 740619;
 Fri, 14 Jun 2024 11:53:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VLs9=NQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sI5UM-0004Qu-HI
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 11:53:02 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6b3d0e5-2a44-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 13:53:01 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6ef8e62935so277906566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 04:53:01 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f9c858sm175400266b.206.2024.06.14.04.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 04:53:00 -0700 (PDT)
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
X-Inumbo-ID: a6b3d0e5-2a44-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718365981; x=1718970781; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Gf2rFrdxxxqYb6NjHSYVD56Yl5jvgrIesjzPVVg/AQ=;
        b=Q5tPxqZ61Zy/zGvQ1rMWx9GmlIWUE1efzP/eoJBhwnznfwjWMA7gwLrVd9/G2c4NFo
         VFwYVI3mXIq5cPQWY4+NemqFlTjcDUD2Bi3HD7s0AjlxK6Fdb65FOheMVakbXmlNz39q
         ti1adhUSGo2shFSrGNM1TU527kkPA074xx8KvCWGeG0fa+Ihcq9XDvgv4EhIsNRvLit+
         +jjQn7AtM07BEmixOP4U4RWF0ZQr6nWcjGSbiul/zfps4XQ2TrshaPHc/tj586107BUq
         vufq9g42n6l94YFOKC8+1IgWLFcw058FjOQuJIUR4aPgHG2IUXi6OWZbfytkV2XkWlmf
         kQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718365981; x=1718970781;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Gf2rFrdxxxqYb6NjHSYVD56Yl5jvgrIesjzPVVg/AQ=;
        b=vFhcgI2NNFLPDIcny0WVMnQsRWJisH17uccC0avbY10aJbblelYMNsepFELS8uwpfc
         mh4ksUKL/KFAEVbojypBivedPRG8z8oFt0QthEFxkWnnwS7F9++dtE7sSYmmOu01YN9l
         0YLTVweqKOmME5eiZTqCGQW2Ub71O48W2Oon3UgTonvKsH/LD2UOKe9Z8q9qYChnWmX/
         6EjMo8/lFGTCBrAm1Z6O/nRlcxSlNA5BRbSSY6E1r7bJ2FVhwhBDUOgTHkJ1kXaE+0JF
         r0TUCzbbPzmRe4cU169v4BUH1DnXT2ue4d/z6hjwuJMNVbsfOGJ36niTcQSN2+43Tu9j
         z24Q==
X-Gm-Message-State: AOJu0Yy3XfzMuCSZye6ttYqvTRU689j1R3e4XZhTANJ6mUlvA7DoBTmY
	FJhOHl5B7P7mw/1LcmkvKbbhWRAdG3b8mnJFK/Y1GkRuoKKsqTt6
X-Google-Smtp-Source: AGHT+IHHjxR6DoT1uXy/OZTCzinHPLGLLPkn7w4LVlNVGMGXUxaLfocsxhXsoOeOxeESurrqj5VCdw==
X-Received: by 2002:a17:906:494c:b0:a6f:2de0:54d with SMTP id a640c23a62f3a-a6f60de60b5mr233061366b.76.1718365980640;
        Fri, 14 Jun 2024 04:53:00 -0700 (PDT)
Message-ID: <0aa934d9f4bdc8ebfa832aa56e2fe9659236441d.camel@gmail.com>
Subject: Re: [PATCH v3 0/3] x86/irq: fixes for CPU hot{,un}plug
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Date: Fri, 14 Jun 2024 13:52:59 +0200
In-Reply-To: <ZmvxBDomxxBjOYEK@macbook>
References: <20240613165617.42538-1-roger.pau@citrix.com>
	 <ZmvxBDomxxBjOYEK@macbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Fri, 2024-06-14 at 09:28 +0200, Roger Pau Monn=C3=A9 wrote:
> Sorry, forgot to add the for-4.19 tag and Cc Oleksii.
>=20
> Since we have taken the start of the series, we might as well take
> the
> remaining patches (if other x86 maintainers agree) and attempt to
> hopefully fix all the interrupt issues with CPU hotplug/unplug.
>=20
> FTR: there are further issues when doing CPU hotplug/unplug from a
> PVH
> dom0, but those are out of the scope for 4.19, as I haven't even
> started to diagnose what's going on.
And this issues were before the current patch series was introduced?

~ Oleksii
>=20
> Thanks, Roger.
>=20
> On Thu, Jun 13, 2024 at 06:56:14PM +0200, Roger Pau Monne wrote:
> > Hello,
> >=20
> > The following series aim to fix interrupt handling when doing CPU
> > plug/unplug operations.=C2=A0 Without this series running:
> >=20
> > cpus=3D`xl info max_cpu_id`
> > while [ 1 ]; do
> > =C2=A0=C2=A0=C2=A0 for i in `seq 1 $cpus`; do
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen-hptool cpu-offline $i;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen-hptool cpu-online $i;
> > =C2=A0=C2=A0=C2=A0 done
> > done
> >=20
> > Quite quickly results in interrupts getting lost and "No irq
> > handler for
> > vector" messages on the Xen console.=C2=A0 Drivers in dom0 also start
> > getting
> > interrupt timeouts and the system becomes unusable.
> >=20
> > After applying the series running the loop over night still result
> > in a
> > fully usable system, no=C2=A0 "No irq handler for vector" messages at
> > all, no
> > interrupt loses reported by dom0.=C2=A0 Test with x2apic-
> > mode=3D{mixed,cluster}.
> >=20
> > I've attempted to document all code as good as I could, interrupt
> > handling has some unexpected corner cases that are hard to diagnose
> > and
> > reason about.
> >=20
> > Some XenRT testing is undergoing to ensure no breakages.
> >=20
> > Thanks, Roger.
> >=20
> > Roger Pau Monne (3):
> > =C2=A0 x86/irq: deal with old_cpu_mask for interrupts in movement in
> > =C2=A0=C2=A0=C2=A0 fixup_irqs()
> > =C2=A0 x86/irq: handle moving interrupts in _assign_irq_vector()
> > =C2=A0 x86/irq: forward pending interrupts to new destination in
> > fixup_irqs()
> >=20
> > =C2=A0xen/arch/x86/include/asm/apic.h |=C2=A0=C2=A0 5 +
> > =C2=A0xen/arch/x86/irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 163 +++++++++++++++++++++++++---
> > ----
> > =C2=A02 files changed, 132 insertions(+), 36 deletions(-)
> >=20
> > --=20
> > 2.45.2
> >=20


