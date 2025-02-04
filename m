Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA9BA27B41
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 20:30:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881845.1292022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOcC-00088Z-6Y; Tue, 04 Feb 2025 19:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881845.1292022; Tue, 04 Feb 2025 19:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfOcC-00086I-3V; Tue, 04 Feb 2025 19:29:44 +0000
Received: by outflank-mailman (input) for mailman id 881845;
 Tue, 04 Feb 2025 19:29:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YD+2=U3=flex--seanjc.bounces.google.com=3o2qiZwYKCUY0mivrkowwotm.kwu5mv-lm3mttq010.5mvxzwrmk1.wzo@srs-se1.protection.inumbo.net>)
 id 1tfOcA-00086C-3h
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 19:29:42 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6098bc66-e32e-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 20:29:41 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2ef775ec883so11222119a91.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 11:29:40 -0800 (PST)
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
X-Inumbo-ID: 6098bc66-e32e-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738697379; x=1739302179; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5e8UEnGVo+4lDc1cH0GoOuL8F0MUw58BGLx/3p+5fdQ=;
        b=xlyePdaVDFXm+YqBb+cPX897ZHYQzyeSmuqZQKlt/cG9zlBEtKZRm4p+LU6hiZ0rrX
         Mp0IJKpp3g4wjPQj7BA/mmZbwh3/A6SVyINDa4bE88tFzkZc8ub/JHKemXO8lzcQY7ge
         JMcAQC5Zuhy0IXEF5m2Y+SeLRQOi1H0quG9DaKqtj3SVQgf8wqa+jnE5CKZn4W3kZ6qP
         Uy5slEhAzv1bS8ALCl8UAQR+c3hegn6XNvHd0a/QHPtnjotZZZ3ss2S9i13sUpnRO5/f
         EHqgplchlNRBdgrMI/lDT4+bdhfdyRaINGI/OfOPozxtnpM+Vez9MMEhCCr16NOrGQeP
         pTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738697379; x=1739302179;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5e8UEnGVo+4lDc1cH0GoOuL8F0MUw58BGLx/3p+5fdQ=;
        b=li6x/ZixCjbLla853CpD3uUUzwE89aYjDdTjROYz6anTEXej63ccmogODXrVUWQ1WI
         1PrJmixfV7MQAxLUschIGM9eCXgG2ThP5LkeWgMR/t7/ygcTkpyaT8vIVyd/7qKcUkA6
         R5RtLWmF4EIHB1vd5cbSEeB6O7TgjnFFosEQ5iCFpIdhwdH/lMGyHMNrwmZSpR50gF1L
         0PMVOGXPk9sG0io3Xly+XDRH9VDnd5KYTkDRSiA9N7Duyy7xSuWb4pp3e9Xkb6BrZZr3
         x9QPOSPPAEeDm4/oCzbQk4aOV1Ph3VBpXIxZb86A8KTxYexEHaDilxbK/6xHo/ZK9LqN
         rTOA==
X-Forwarded-Encrypted: i=1; AJvYcCWNI/9Q9mfvL/vMJZc6SIXGCXaRVUbiEF8q7EULTaRk942xi/SA6+72k9bUs1aoDtv/D7YyS6lpzx0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8S90UPWOGzl0/+4IBIoiERfUxyir3UepbSzYTRRr2qTua23fu
	5gtJ4rwp54EeHE0qgieuhG9cR64uEsPG/B+AcP58f1i3GcH5MGKV5OKfbAeqoFUX9MwqE4V1jKF
	m2Q==
X-Google-Smtp-Source: AGHT+IF+/fBR5/RvgfgkW+k0iOimknqvbfTCdp56sFN5T8R+lSkm/qjT6GD7VseImBDz4jdwECu7ieLsEjc=
X-Received: from pjbsw5.prod.google.com ([2002:a17:90b:2c85:b0:2d3:d4ca:5fb0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5245:b0:2ee:ab29:1a65
 with SMTP id 98e67ed59e1d1-2f83abb4f94mr39965711a91.4.1738697379406; Tue, 04
 Feb 2025 11:29:39 -0800 (PST)
Date: Tue, 4 Feb 2025 11:29:38 -0800
In-Reply-To: <85r04e5821.fsf@amd.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-7-seanjc@google.com>
 <85r04e5821.fsf@amd.com>
Message-ID: <Z6JqopU5LkDIZPq6@google.com>
Subject: Re: [PATCH 06/16] x86/tdx: Override PV calibration routines with
 CPUID-based calibration
From: Sean Christopherson <seanjc@google.com>
To: Nikunj A Dadhania <nikunj@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, jailhouse-dev@googlegroups.com, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2025, Nikunj A Dadhania wrote:
> Sean Christopherson <seanjc@google.com> writes:
>=20
> > When running as a TDX guest, explicitly override the TSC frequency
> > calibration routine with CPUID-based calibration instead of potentially
> > relying on a hypervisor-controlled PV routine.  For TDX guests, CPUID.0=
x15
> > is always emulated by the TDX-Module, i.e. the information from CPUID i=
s
> > more trustworthy than the information provided by the hypervisor.
> >
> > To maintain backwards compatibility with TDX guest kernels that use nat=
ive
> > calibration, and because it's the least awful option, retain
> > native_calibrate_tsc()'s stuffing of the local APIC bus period using th=
e
> > core crystal frequency.  While it's entirely possible for the hyperviso=
r
> > to emulate the APIC timer at a different frequency than the core crysta=
l
> > frequency, the commonly accepted interpretation of Intel's SDM is that =
APIC
> > timer runs at the core crystal frequency when that latter is enumerated=
 via
> > CPUID:
> >
> >   The APIC timer frequency will be the processor=E2=80=99s bus clock or=
 core
> >   crystal clock frequency (when TSC/core crystal clock ratio is enumera=
ted
> >   in CPUID leaf 0x15).
> >
> > If the hypervisor is malicious and deliberately runs the APIC timer at =
the
> > wrong frequency, nothing would stop the hypervisor from modifying the
> > frequency at any time, i.e. attempting to manually calibrate the freque=
ncy
> > out of paranoia would be futile.
> >
> > Deliberately leave the CPU frequency calibration routine as is, since t=
he
> > TDX-Module doesn't provide any guarantees with respect to CPUID.0x16.
>=20
> Does TDX use kvmclock?

A TDX guest can.  That's up to the host (expose kvmclock) and the guest (en=
able
kvmclock).

> If yes, kvmclock would have registered the CPU frequency calibration rout=
ine:
>=20
> 	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_cpu_khz,
>  					  tsc_properties);
>=20
> so TDX will use kvm_get_cpu_khz(), which will either use CPUID.0x16 or
> PV clock, is this on the expected line ?

What do you mean by "is this on the expected line"?  If you are asking "is =
this
intended", then the answer is "yes, working as intended".  As above, the TD=
X-Module
doesn't emulate CPUID.0x16, so no matter what, the guest is relying on the =
untrusted
hypervisor to get the CPU frequency.  If someone thinks that TDX guests sho=
uld
assume the CPU runs as the same frequency as the TSC, a la SNP's Secure TSC=
, then
they are welcome to propose such a change.

