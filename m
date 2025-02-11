Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7FAA312DC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 18:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885817.1295620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thu1E-0001Nj-49; Tue, 11 Feb 2025 17:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885817.1295620; Tue, 11 Feb 2025 17:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thu1E-0001La-1C; Tue, 11 Feb 2025 17:25:56 +0000
Received: by outflank-mailman (input) for mailman id 885817;
 Tue, 11 Feb 2025 17:25:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iZ/x=VC=flex--seanjc.bounces.google.com=3HIirZwYKCR8N95IE7BJJBG9.7JHS9I-89Q9GGDNON.S9IKMJE97O.JMB@srs-se1.protection.inumbo.net>)
 id 1thu1C-0001LU-Vm
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 17:25:54 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c458bcf-e89d-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 18:25:50 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2f83e54432dso18341306a91.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 09:25:49 -0800 (PST)
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
X-Inumbo-ID: 3c458bcf-e89d-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739294748; x=1739899548; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fehn8/FKPdzBZiJ7SaATTiqPDXAlgIYGKuuyWYqseyE=;
        b=ti7jpWSjW9/UMLCX1qZmqk9BUYqg+WiB8rxpPUjf8GJxMYhVUOpy3XEt8v/5bs0RhJ
         yujb3eCAdGc8VdM7vwgRF7a/jPh31+NjdJQHKYkl/Pl+VidfuxKApYwBZLNdLFu9hmkT
         VewiSal9grsCXlMf1HbEzirsWPfgNbsnVEruXi75CgFatgz46YjacY+Nab0iClB0+Dbj
         xpS9pfBhTfHJ5BjR8a3Gry6U5BHVtR9vclOXgBi6DuWR4i0ZKl54zbOUfdSc/oc0mVz2
         4NZI64PmBxQSnQJiYFFANM0p8GGKcWUPZ9XBnBX+2mPD6lTaSkhGgdrDH7T9Yjs92v08
         my3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294748; x=1739899548;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fehn8/FKPdzBZiJ7SaATTiqPDXAlgIYGKuuyWYqseyE=;
        b=byBcFRjP+ken6ReTKdv7GDcZHunTCAE2c+9mWmI7y7zicNlUmTaHb6znVKu7YmO7n9
         z+BtU66Dq7tPKQgqD31UrrAqPQy5Djbm0NcYV9U0eYcUCCYYqkeF1vKDKv8oaLkv2bnL
         8SiaAMh+IjkS3G5sAzAn0a2eq7WYraUo3o6ciOX1k+17DVGewBT6n0+oYUbs2M+PMKZW
         VugCMtvmMxMb2mVZQVsiS9SgiobZeeo8lG0q+oVbx4Jg/AP/ADIsy564BtB8HqjfcNTp
         JuldsnSx4MyIqXqjpt1HdvcNoB9xLBr4r3xlDGbrEM2M/q3C8jHKdhhu5FQeXCQ3T74S
         I1EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNrjZQNcqU1gTrXbcnpdDxRbDwGM6FwAfx303pS89mo/dxD6bym4qpfl+lAAzt6CO4ao26Rjr09ls=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywz3w74gMWswOtQ+F643re82KKYZXsR2g0GHpOsw9UG2LO1FwWO
	QhNZFAid9oo99+8sBXtkvKZBw9Fk25SEr33h6WSNG1ZjFkd71dM3FrcdU7HZ/PQxyRenrw/rbRE
	Qvw==
X-Google-Smtp-Source: AGHT+IFueIXltnSm3F29jVZndsq5T+j40lmj4UcIsQhmLdRSEShGqUPy9fjOgqE9JAinoOmES588AgdHP5k=
X-Received: from pjyf5.prod.google.com ([2002:a17:90a:ec85:b0:2fa:1481:81f5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:184d:b0:2ea:4c8d:c7a2
 with SMTP id 98e67ed59e1d1-2fa243db893mr28913562a91.24.1739294748442; Tue, 11
 Feb 2025 09:25:48 -0800 (PST)
Date: Tue, 11 Feb 2025 09:25:47 -0800
In-Reply-To: <20250211150114.GCZ6tmOqV4rI04HVuY@fat_crate.local>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-2-seanjc@google.com>
 <20250211150114.GCZ6tmOqV4rI04HVuY@fat_crate.local>
Message-ID: <Z6uIGwxx9HzZQ-N7@google.com>
Subject: Re: [PATCH 01/16] x86/tsc: Add a standalone helpers for getting TSC
 info from CPUID.0x15
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
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
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 11, 2025, Borislav Petkov wrote:
> On Fri, Jan 31, 2025 at 06:17:03PM -0800, Sean Christopherson wrote:
> > Extract retrieval of TSC frequency information from CPUID into standalone
> > helpers so that TDX guest support and kvmlock can reuse the logic.  Provide
> > a version that includes the multiplier math as TDX in particular does NOT
> > want to use native_calibrate_tsc()'s fallback logic that derives the TSC
> > frequency based on CPUID.0x16 when the core crystal frequency isn't known.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/include/asm/tsc.h | 41 ++++++++++++++++++++++++++++++++++++++
> >  arch/x86/kernel/tsc.c      | 14 ++-----------
> >  2 files changed, 43 insertions(+), 12 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
> > index 94408a784c8e..14a81a66b37c 100644
> > --- a/arch/x86/include/asm/tsc.h
> > +++ b/arch/x86/include/asm/tsc.h
> 
> Bah, why in the header as inlines?

Because obviously optimizing code that's called once during boot is super
critical?

> Just leave them in tsc.c and call them...
> 
> > @@ -28,6 +28,47 @@ static inline cycles_t get_cycles(void)
> >  }
> >  #define get_cycles get_cycles
> >  
> > +static inline int cpuid_get_tsc_info(unsigned int *crystal_khz,
> > +				     unsigned int *denominator,
> > +				     unsigned int *numerator)
> 
> Can we pls do a
> 
> struct cpuid_tsc_info {
> 	unsigned int denominator;
> 	unsigned int numerator;
> 	unsigned int crystal_khz;
> 	unsigned int tsc_khz;
> }
> 
> and hand that around instead of those I/O pointers?

Ah, yeah, that's way better.

