Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97866A30E92
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 15:40:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885625.1295435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thrQa-0008DT-N6; Tue, 11 Feb 2025 14:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885625.1295435; Tue, 11 Feb 2025 14:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thrQa-0008C0-KL; Tue, 11 Feb 2025 14:39:56 +0000
Received: by outflank-mailman (input) for mailman id 885625;
 Tue, 11 Feb 2025 14:39:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zckm=VC=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1thrQY-0008Bu-IE
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 14:39:54 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dedd0a4-e886-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 15:39:53 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F29FE40E0224; 
 Tue, 11 Feb 2025 14:39:50 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BL9hIm6yGZuQ; Tue, 11 Feb 2025 14:39:47 +0000 (UTC)
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DA33A40E01AE;
 Tue, 11 Feb 2025 14:39:20 +0000 (UTC)
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
X-Inumbo-ID: 0dedd0a4-e886-11ef-a075-877d107080fb
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1739284787; bh=MoLQPIRFF2ToK9+6OuM2hGZjp5T1q9wl8C6INqwMDng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRFd+IWFE5uOVAGwcy61fj/qecexF/x6y0dBm5TTJhmz0rCYYi9HD4fjWg4bUc5AD
	 RaursO1ZfrbphRYdloM13lR8JpbQ3oLvf3B9U0RWR6A7wsKDCpf7zObqSW/LefYsGD
	 mofk9b4zTUI1p0Dm8LVCYKiTQO6opHxlXtvmcLXHpvXK+h0ibfbN6i4en/hBXmxfxg
	 0pzWUdIiUKDo47yq0cMJHEdHx1r+gFjG26rGUDB47uaL3Aiklj6Ff3VDYqBcdJgWu4
	 PZmwpbxQz5QqI/modawN5aPQqoU1R4cFpgJAwfBnM1v0+sRhMXgxgEBjr0dgfRmv7i
	 +ymUCw5jsWZxqLHy7QBa8r5ltbfDdI5maVH27rTjsqRRIYcNdj+2QVZj/IGdfsHJoC
	 79PtuaPe/amSI3Ng/Uj4RwfdQYq7RTPgLmjMeKZkR2w7cpzzIRoPAbfpHf8/xRVT8Q
	 QYOSfzJT/cWwewyoir2VSOwmvsZhaa90jzypbbtCv0cRBF94hCumUj0rvkZHfvzsKO
	 rYQ8duFT6aDEMGpTrDjPWe59lV5O8/wkTUA4cpOGNvcG6EN1K9abvMPmZdwfTTZl7V
	 eVmi1Cv8ke8wfVlvgW0h91AsbdJpGGK9HtRa58ADZA/WVQePFf3cO8QVyxz698kH5s
	 yYToDTss4L2jNyGdDV/Lu3i0=
Date: Tue, 11 Feb 2025 15:39:19 +0100
From: Borislav Petkov <bp@alien8.de>
To: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Juergen Gross <jgross@suse.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, virtualization@lists.linux.dev,
	linux-hyperv@vger.kernel.org, jailhouse-dev@googlegroups.com,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	Nikunj A Dadhania <nikunj@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 00/16] x86/tsc: Try to wrangle PV clocks vs. TSC
Message-ID: <20250211143919.GBZ6thF2Ryx-D2YpDz@fat_crate.local>
References: <20250201021718.699411-1-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>

On Fri, Jan 31, 2025 at 06:17:02PM -0800, Sean Christopherson wrote:
> And if the host provides the core crystal frequency in CPUID.0x15, then KVM
> guests can use that for the APIC timer period instead of manually
> calibrating the frequency.

Hmm, so that part: what's stopping the host from faking the CPUID leaf? I.e.,
I would think that actually doing the work to calibrate the frequency would be
more reliable/harder to fake to a guest than the guest simply reading some
untrusted values from CPUID...

Or are we saying here: oh well, there are so many ways for a normal guest to
be lied to so that we simply do the completely different approach and trust
the HV to be benevolent when we're not dealing with confidential guests which
have all those other things to keep the HV honest?

Just checking the general thinking here.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

