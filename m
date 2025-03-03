Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67493A4CCF9
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 21:54:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900608.1308467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpCmv-0000pJ-B8; Mon, 03 Mar 2025 20:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900608.1308467; Mon, 03 Mar 2025 20:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpCmv-0000n8-8V; Mon, 03 Mar 2025 20:53:21 +0000
Received: by outflank-mailman (input) for mailman id 900608;
 Mon, 03 Mar 2025 20:53:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GARz=VW=flex--seanjc.bounces.google.com=3uBbGZwYKCUMxjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@srs-se1.protection.inumbo.net>)
 id 1tpCmt-0000n2-86
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 20:53:19 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 859ced2f-f871-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 21:53:13 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2feb8d29740so7299462a91.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 12:53:13 -0800 (PST)
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
X-Inumbo-ID: 859ced2f-f871-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741035192; x=1741639992; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sN1tRRXOdkRuhSE1RMnqdPqM5oFgXi6jywzgZSSDWUM=;
        b=yZHRnzneg4gPAHWUyM3ybBCgbSYiz9NWziYIQFlMuIw7yjMJLRFXM9UtCWOLySVSvA
         Q261vMpHel3qq4q4/s1d9MVWmUiFlIZw9Tuqs5hnmQH25ciXCyGWRL4YFeBzHBuzta4s
         H3LHTyp4G4aKKVT0thYtb/UuKFOdc42MUI2Hu2cYfPeHUBCbTMI3ZqCSUXAPtk/j0+FG
         J36edgaCHDDtc4zqoGZsEwgebfN4shP2j7absjPl49nipaVJhRJv3oLSfPZIB/ZmAGNX
         j4/hwdqMk3IaFd6XZHFbMmTXx4XT7JTaNPIvGXafGNJeD1jOhndk6FuWxLSQ3aj6eQyB
         sIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741035192; x=1741639992;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sN1tRRXOdkRuhSE1RMnqdPqM5oFgXi6jywzgZSSDWUM=;
        b=YnZE09VOhgFp7V9sXE8mRDwLsXGEk7DX1bOZ3NUQNU3tc5DvBkcuXoso5OyvYAGrSB
         eaQCU5XbxCXycqjnr1q72DTAISIDA1e4W196jvjWK2iXfT2iJBQ6trqQ74L0kgFuR66L
         zB9FQZquK3pfsstmGK0VEpXANbSNnNU5SOK0zbnjMoB116Xi0yP3bAsfY/qLfv+9+6VX
         /mnBaWH79t4r88TzB+mY/PSEkKKUE9sEOcwsDOply4/WcwEGm1Qhdz9OUVnjrE0zm9a7
         bznepgEmS/jgdFevYIkiy7G4eISkJFNy1geNbI65NT8eXxlWJUEZ8jcKo7Y85Zs/1pW5
         zpIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPwqbo+9BbUZnAWmKz5rlevdae6762McPLcu/QUtqOJdnJRc3yJt3TN7ECQ2rge7TU8AI3TxRAgqA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCByL40H/1wvGcK6ub9uZGLp77ZFhwWWyvROiqxzy/lCm2WrJ8
	7kd4/INdElcw6ai1PqRDyVjU1FIHUGdN4spGhnKEKk8R2NU5tIXAkS7OMJ1YVTsHe10mAyxVuFM
	Q4g==
X-Google-Smtp-Source: AGHT+IGvAbM1SbEAkwQZlxQS7zV3KYE59+INXt1p2VCN8UPIm/E/EWQNfbPJi6CZOYL8GIUxW/fPR5QROP8=
X-Received: from pjn11.prod.google.com ([2002:a17:90b:570b:b0:2f5:4762:e778])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1a86:b0:2ee:ab29:1a63
 with SMTP id 98e67ed59e1d1-2febab30c7amr20186639a91.3.1741035192190; Mon, 03
 Mar 2025 12:53:12 -0800 (PST)
Date: Mon, 3 Mar 2025 12:53:10 -0800
In-Reply-To: <5bdb92ab83269b49ad8fbbe8f54df01f6b98ea8f.camel@infradead.org>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com> <5bdb92ab83269b49ad8fbbe8f54df01f6b98ea8f.camel@infradead.org>
Message-ID: <Z8YWttWDtvkyCtdJ@google.com>
Subject: Re: [PATCH v2 00/38] x86: Try to wrangle PV clocks vs. TSC
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Juergen Gross <jgross@suse.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025, David Woodhouse wrote:
> On Wed, 2025-02-26 at 18:18 -0800, Sean Christopherson wrote:
> > This... snowballed a bit.
> >=20
> > The bulk of the changes are in kvmclock and TSC, but pretty much every
> > hypervisor's guest-side code gets touched at some point.=C2=A0 I am rea=
onsably
> > confident in the correctness of the KVM changes.=C2=A0 For all other hy=
pervisors,
> > assume it's completely broken until proven otherwise.
> >
> > Note, I deliberately omitted:
> >=20
> > =C2=A0 Alexey Makhalov <alexey.amakhalov@broadcom.com>
> > =C2=A0 jailhouse-dev@googlegroups.com
> >=20
> > from the To/Cc, as those emails bounced on the last version, and I have=
 zero
> > desire to get 38*2 emails telling me an email couldn't be delivered.
> >=20
> > The primary goal of this series is (or at least was, when I started) to
> > fix flaws with SNP and TDX guests where a PV clock provided by the untr=
usted
> > hypervisor is used instead of the secure/trusted TSC that is controlled=
 by
> > trusted firmware.
> >=20
> > The secondary goal is to draft off of the SNP and TDX changes to slight=
ly
> > modernize running under KVM.=C2=A0 Currently, KVM guests will use TSC f=
or
> > clocksource, but not sched_clock.=C2=A0 And they ignore Intel's CPUID-b=
ased TSC
> > and CPU frequency enumeration, even when using the TSC instead of kvmcl=
ock.
> > And if the host provides the core crystal frequency in CPUID.0x15, then=
 KVM
> > guests can use that for the APIC timer period instead of manually calib=
rating
> > the frequency.
> >=20
> > Lots more background on the SNP/TDX motiviation:
> > https://lore.kernel.org/all/20250106124633.1418972-13-nikunj@amd.com
>=20
> Looks good; thanks for tackling this.
>=20
> I think there are still some things from my older series at
> https://lore.kernel.org/all/20240522001817.619072-1-dwmw2@infradead.org/
> which this doesn't address.

Most definitely.  I was/am assuming you're going to send a v4 at some point=
?

