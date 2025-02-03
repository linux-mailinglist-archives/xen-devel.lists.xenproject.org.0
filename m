Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE7DA26654
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 23:04:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880998.1291102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tf4XP-0000vX-9v; Mon, 03 Feb 2025 22:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880998.1291102; Mon, 03 Feb 2025 22:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tf4XP-0000sQ-6y; Mon, 03 Feb 2025 22:03:27 +0000
Received: by outflank-mailman (input) for mailman id 880998;
 Mon, 03 Feb 2025 22:03:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OMNE=U2=flex--seanjc.bounces.google.com=3KD2hZwYKCWsbNJWSLPXXPUN.LXVgNW-MNeNUURbcb.gNWYaXSNLc.XaP@srs-se1.protection.inumbo.net>)
 id 1tf4XN-0000s4-Sn
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 22:03:25 +0000
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [2607:f8b0:4864:20::64a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeb45bf4-e27a-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 23:03:22 +0100 (CET)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-2166855029eso100398335ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 14:03:22 -0800 (PST)
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
X-Inumbo-ID: aeb45bf4-e27a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738620201; x=1739225001; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aKyU5o4qg4MzJLbHNBTuIVedrQGzcqdvvxUHOUnfSU8=;
        b=KOoojyS7FNdDI5p1Y3CMQ+FoGCfdDcaK7cNozewWGvpS2QtvX5+C5JRgOPW45KEAaW
         q3SSe8CAC2V2Lid611zyCwXjf2DzIS7aWEBs9Ma50RDDIqhFwRW/D0pYdbJZLoSzq2OI
         y2+v+ss5L6he67k/P7QHoPNiPIT2caYLcibDcef3CNlOK4I9cq5kP8E5YEzSVfuMAjqJ
         AUrhS6Ya9EW07JOEMPnvzSUx1mBhDJMIEpyDw8XGRkWN4bGRKdGrQqOaJVXLogBEvzcb
         8DZ/3/Ufg907TI/PnRibARxl4w6FF0BNsc2GTzS/9jXqilK7T5Rfl3nOIadssawBkMjX
         Th1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738620201; x=1739225001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKyU5o4qg4MzJLbHNBTuIVedrQGzcqdvvxUHOUnfSU8=;
        b=r7nhN+xx7uDuEpAl4+vh3HfI+2WFLxP/y1yq2KojcLpzZa0FUh8rZPyKtb3DMJFz7g
         TZL+pAKyXAAJAraLNCiITA6TRZg7FSF3PpArrs68o14r+HBU8ExD9QU89IDYE5tYP5jV
         yZWa0BXJzXyXkhmslnFQ4m20Ggk9gyTVVgwFapkQLR19VTqxZXR9TFs2XN9zBZn6Ccea
         fTrlXALw2+RnpnNqlcttykcti0ruFdCkYqPTpy0tnkI7HpqTQEjZ1kdPo4qh2TLD16dj
         zyfpQqgJPKocBnKjq6iUlYgl4t7t2qo90/V5ZAQlyNPdyFgQNwtfzYTdw9uL2DmwV+s9
         CZKg==
X-Forwarded-Encrypted: i=1; AJvYcCXUE3F3SohEz2ltePhyd8uXFHzVH3Wc93oCsEdTf/p35k11De9BdMZu1bqaTjA+SEM2t/nhSCj/u+k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZabPUOf+O+ENdptN6uMi96NJnY/2zqRnpJhiXtJmDBphayzEg
	VpLCL4L5uYnbMkaymMlJhv+lIS9Zo0fAjZWkhJSKyw5EWxvDCjwo2MeaewyLRj7oQY6MhLEO7NM
	rrg==
X-Google-Smtp-Source: AGHT+IFdBp/YFKt3tvbP89npJlfJHjx2Z4+9Qkgevwe01Rjz28QPVaPLsqR/RKs2uDbYm8l82lXHNvJ4gI0=
X-Received: from pfbfb39.prod.google.com ([2002:a05:6a00:2da7:b0:728:e945:d2c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:acc:b0:71d:f2e3:a878
 with SMTP id d2e1a72fcca58-72fd0bc6c50mr33717772b3a.5.1738620200924; Mon, 03
 Feb 2025 14:03:20 -0800 (PST)
Date: Mon, 3 Feb 2025 14:03:19 -0800
In-Reply-To: <855xlra7yh.fsf@amd.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-2-seanjc@google.com>
 <855xlra7yh.fsf@amd.com>
Message-ID: <Z6E9JyybI6SUWlcG@google.com>
Subject: Re: [PATCH 01/16] x86/tsc: Add a standalone helpers for getting TSC
 info from CPUID.0x15
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
Content-Type: text/plain; charset="us-ascii"

On Mon, Feb 03, 2025, Nikunj A Dadhania wrote:
> Sean Christopherson <seanjc@google.com> writes:
> > Extract retrieval of TSC frequency information from CPUID into standalone
> > helpers so that TDX guest support and kvmlock can reuse the logic.  Provide
> 
> s/kvmlock/kvmclock
> 
> > a version that includes the multiplier math as TDX in particular does NOT
> > want to use native_calibrate_tsc()'s fallback logic that derives the TSC
> > frequency based on CPUID.0x16 when the core crystal frequency isn't known.
> >
> > No functional change intended.
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> 
> ...
> 
> > +
> > +static inline int cpuid_get_tsc_freq(unsigned int *tsc_khz,
> > +				     unsigned int *crystal_khz)
> 
> Should we add this in patch 6/16 where it is being used for the first time ?

No strong preference on my end.  I put it here mostly to keep each patch focused
on a single subsystem where possible, since the series touches so many areas.  I
also wanted to show the "full" API in a single patch, but I agree that adding a
helper without a user is generally undesirable.

