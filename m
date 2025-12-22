Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A011FCD69BA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 16:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192123.1511452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXi7W-00012Y-KP; Mon, 22 Dec 2025 15:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192123.1511452; Mon, 22 Dec 2025 15:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXi7W-00010J-Hf; Mon, 22 Dec 2025 15:46:50 +0000
Received: by outflank-mailman (input) for mailman id 1192123;
 Mon, 22 Dec 2025 15:46:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G4iM=64=flex--seanjc.bounces.google.com=35mdJaQYKCS0bNJWSLPXXPUN.LXVgNW-MNeNUURbcb.gNWYaXSNLc.XaP@srs-se1.protection.inumbo.net>)
 id 1vXi7V-0000zx-2v
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 15:46:49 +0000
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [2607:f8b0:4864:20::449])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c271a5a-df4d-11f0-b15b-2bf370ae4941;
 Mon, 22 Dec 2025 16:46:47 +0100 (CET)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-7b8a12f0cb4so4767252b3a.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 07:46:47 -0800 (PST)
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
X-Inumbo-ID: 6c271a5a-df4d-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766418406; x=1767023206; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bv2gntJgBXtiu31zWj5aMqoO8tc0JdlMD+qDh291wic=;
        b=D8pWnYTYod2rdumiArk+KQ4ppuH6/tqeq93omkmcG50eNp0rCvufIgT4a0/8gmpPHb
         vpzian6wGVTWqC2ul+DP7KvFV1CxYwNpCEwGYY64g64CRqcEUH75EBWi6JnjYOAsuPW1
         JJOEi9K8xSlWhfT/5ImCGkWCgSqGuQHC/IpsbpBAsJUqHmHSSkIdimDwZ06lCl8AZtwu
         13DZqfidzI2xWAS9pzITOKjoNxCq6+h7+2qCsY+acGqLhoYZ4kEnf9/WIplP7VfcyzMR
         HWHw5XPb8PLxbGGqxTIhA4yODSXrnorbQAZ005Bx13UmPKYL+nplL942Lxf1VcH9ogsw
         uJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766418406; x=1767023206;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bv2gntJgBXtiu31zWj5aMqoO8tc0JdlMD+qDh291wic=;
        b=HnmDp4nzzVSfX0LcooKjTKJkeRtVGCHot7HiFcKM0D3cy6NV7Gf2s+TrThOz34lqaR
         MvvrIhHv7HsyrP7k91yyBNifwijAGENa+vjSbmsoOmLoHxjaHltzP79dGTko6welS36I
         7liZ8QV3RS427P7X3NFbJRSP/TvkgJEvFmJLtHXbBkG3nx61+ohxuspyWKXb4BYO4S2d
         1TMM0Ebe46V9KyOUpb5qqLl2aznIGSMysR5wIRjnrIXAA6/+tXsqRdR0Ovww0V0rzJQZ
         ERE+SYRF3toWfo+NGxslc7nHp1CV3LaDQ4hzPFBHO9bVxZWdEnZF5KOW1yX7wF7ul2Ok
         rCUg==
X-Forwarded-Encrypted: i=1; AJvYcCXUvC2lm/FtepUv58rprRRak8EipavCc9GSyqfxKOviZi66dQW+H3QmJAoJc7oJR+e7t0hU3PMhbuw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBC2UAcaDgZG4VImkqGoIbVNW0FDSIHEDqwRzF7YxJZHyY49lr
	7akU2vvGDomD69kXgmSGQM1ng0JhWel4J/8lRTgImuu3v+8c7wTJRJl7sbfwVOtMlHrqp1InfCG
	mHV02og==
X-Google-Smtp-Source: AGHT+IGvLBoGsXVzBr3m/Do0woX/jUwcUSCQPKj8JoQh4+EdFhAiTc99FBbRBZXfb91qRfmoWJoeFEq2Qbw=
X-Received: from pfuj2.prod.google.com ([2002:a05:6a00:1302:b0:7e5:5121:f943])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6ca8:b0:7e8:43f5:bd51
 with SMTP id d2e1a72fcca58-7ff676624demr9901855b3a.61.1766418406100; Mon, 22
 Dec 2025 07:46:46 -0800 (PST)
Date: Mon, 22 Dec 2025 07:46:44 -0800
In-Reply-To: <190f226a-a92f-4dab-ad7a-f7ea22e6a976@vates.tech>
Mime-Version: 1.0
References: <20251219010131.12659-1-ariadne@ariadne.space> <dbe68678-0bc4-483f-aef3-e4c7462bcaff@vates.tech>
 <aUWNlTAmbSTXsBDE@google.com> <190f226a-a92f-4dab-ad7a-f7ea22e6a976@vates.tech>
Message-ID: <aUln5DdCMcvhJzl9@google.com>
Subject: Re: [PATCH] x86/CPU/AMD: avoid printing reset reasons on Xen domU
From: Sean Christopherson <seanjc@google.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Ariadne Conill <ariadne@ariadne.space>, linux-kernel@vger.kernel.org, 
	mario.limonciello@amd.com, darwi@linutronix.de, sandipan.das@amd.com, 
	kai.huang@intel.com, me@mixaill.net, yazen.ghannam@amd.com, riel@surriel.com, 
	peterz@infradead.org, hpa@zytor.com, x86@kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	xen-devel@lists.xenproject.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 20, 2025, Teddy Astie wrote:
> Le 19/12/2025 =C3=A0 18:40, Sean Christopherson a =C3=A9crit=C2=A0:
> > On Fri, Dec 19, 2025, Teddy Astie wrote:
> >>> @@ -1333,6 +1335,10 @@ static __init int print_s5_reset_status_mmio(v=
oid)
> >>>    	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
> >>>    		return 0;
> >>>
> >>> +	/* Xen PV domU cannot access hardware directly, so bail for domU ca=
se */
> >>> +	if (cpu_feature_enabled(X86_FEATURE_XENPV) && !xen_initial_domain()=
)
> >>> +		return 0;
> >>> +
> >>>    	addr =3D ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(val=
ue));
> >>>    	if (!addr)
> >>>    		return 0;
> >>
> >> Such MMIO only has a meaning in a physical machine, but the feature
> >> check is bogus as being on Zen arch is not enough for ensuring this.
> >>
> >> I think this also translates in most hypervisors with odd reset codes
> >> being reported; without being specific to Xen PV (Zen CPU is
> >> unfortunately not enough to ensuring such MMIO exists).
> >>
> >> Aside that, attempting unexpected MMIO in a SEV-ES/SNP guest can cause
> >> weird problems since they may not handled MMIO-NAE and could lead the
> >> hypervisor to crash the guest instead (unexpected NPF).
> >
> > IMO, terminating an SEV-ES+ guest because it accesses an unknown MMIO r=
ange is
> > unequivocally a hypervisor bug.
>=20
> Terminating may be a bit excessive, but the hypervisor can respond #GP
> to either unexpected MMIO-NAE and NPF-AE if it doesn't know how to deal
> with this MMIO/NPF (xAPIC has a similar behavior when it is disabled).

Maybe with a very liberal interpretation of AMD specs, e.g. to mimic the re=
served
HyperTransport region behavior.  Defining a virtual platform/bus that #GPs =
on
accesses to any "unknown" MMIO region would be incredibly hostile behavior =
for
a hypervisor.

> > The right behavior there is to configure a reserved NPT entry
> > to reflect the access into the guest as a #VC.
>=20
> I'm not sure this is the best approach, that would allow the guest to
> trick the hypervisor into making a unbounded amount of reserved entries.

No, the maximum number of reserved entries is bounded by the number of vCPU=
s in
the VM, because each reserved entry only needs to exist long enough to refe=
ct
the access into the guest.  Recycling NPT page tables after every MMIO-NAE =
would
be comically agressively, but it's very doable for a hypervisor to set a re=
asonable
limit on the number of NPT page tables it creates for a VM.

