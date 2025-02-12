Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ABFA332ED
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 23:55:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886881.1296476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiLdy-0004Bd-H2; Wed, 12 Feb 2025 22:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886881.1296476; Wed, 12 Feb 2025 22:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiLdy-00046D-EG; Wed, 12 Feb 2025 22:55:46 +0000
Received: by outflank-mailman (input) for mailman id 886881;
 Wed, 12 Feb 2025 22:55:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVDl=VD=flex--seanjc.bounces.google.com=37SatZwYKCTQiUQdZSWeeWbU.SecnUd-TUlUbbYiji.nUdfheZUSj.ehW@srs-se1.protection.inumbo.net>)
 id 1tiLdw-00041t-Gz
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 22:55:44 +0000
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [2607:f8b0:4864:20::649])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c93196c-e994-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 23:55:43 +0100 (CET)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-216266cc0acso27476965ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 14:55:43 -0800 (PST)
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
X-Inumbo-ID: 7c93196c-e994-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739400942; x=1740005742; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G4pJwe4WBZK7j0Qn81lTWodsKOqME7mNPJqkDCUIDvw=;
        b=jG4ez+k3h7ycDC0o/dhMvzaGrK3VV9kNyM/RmJc/I2sGStQ/ng+C8c+F3pOpMgGw1I
         rGDl4/LlnPehIMAul5VFLb3i98XRtKRIMCtHHFiB6Da/r46rZwOlQmcUadIZ4AnRBTEE
         8j1JcxtFbEVolWFTWgYvA21/XVHGqDYlAAzUNPY09tzsApT24v6GOQLwcze9gPFM4Bxn
         AglHZNP7x75PyF78Kczl2dV8TEifY1tC12VuoXS57CGI0jGjcSwLDMS6Qnps+Xix510/
         I9jmU8iVb1L1WtP/kLfDgJ9QjGA7wh+G/zFvm8v3wFirLEy9nDPelSLWLhVz2H04rsUl
         8T0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400942; x=1740005742;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G4pJwe4WBZK7j0Qn81lTWodsKOqME7mNPJqkDCUIDvw=;
        b=YHpeff+j/NRyJaYnh2luJqtx0yLUUDRM0TbnavNevpbH7HlnhCiiX3u/uTHUTxQefh
         kvij1SgKeA2h8n/dUh8NQUF7eG3HQ9DhbKuCCYKNkQ0eSqmiDWjSvzBzqXR9shpBRd/C
         f42fQ2rNlPwVPioX5Id5OtIPuSMMmJ8uCnwdwzfvddydM893hUCa+IygvxkrHxPuh1lz
         XDHNS/8IfK0dRFyY1A3bUGLimAdW5PrasVapQw8BFQapbQote+RYfS/tkn/aL5JkB7nk
         vS6uwj/DegZbF6kmsSOnAI2uA4/a1axYoCsKEhzuLgyJphb11a0uqA3y0JVGMsuCwvN6
         tKSA==
X-Forwarded-Encrypted: i=1; AJvYcCUVuoDtzM1b4g9XEHS3+vhHFVIycjgEA6RuKx4UYzwmO/jFwVJn/HsQn+RCf2Df27FN80Ml6mM9kw4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxS/BjwrUgz6dTjh19BjJEOM9HO2SrMBNxtM/FZT6PDfEqW9jl1
	5S8DvkmPjEN8fxyr4XJBFkCEOAHKIUXjmSW5uypqOmld6yDM88YyYvb/GYEKjSE1wY0WpCXlwKS
	dBA==
X-Google-Smtp-Source: AGHT+IFCvprC2FVz2MYwofAu+gOZ+t6GzfO0x6W16EewccF+NjWJufThiJaaDpuXjWvbsRckLewQnEmSOUI=
X-Received: from plbb4.prod.google.com ([2002:a17:903:c04:b0:21f:14cc:68b0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c94e:b0:220:c2bf:e8ba
 with SMTP id d9443c01a7336-220d3528cc9mr11030295ad.14.1739400941927; Wed, 12
 Feb 2025 14:55:41 -0800 (PST)
Date: Wed, 12 Feb 2025 14:55:36 -0800
In-Reply-To: <SN6PR02MB4157DBAF1E3BB0E4FFD2C92DD4FC2@SN6PR02MB4157.namprd02.prod.outlook.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-17-seanjc@google.com>
 <Z6ZBjNdoULymGgxz@google.com> <SN6PR02MB4157A85EC0B1B2D45CB611FAD4F02@SN6PR02MB4157.namprd02.prod.outlook.com>
 <Z6onnUthSBUVAklf@google.com> <SN6PR02MB4157DBAF1E3BB0E4FFD2C92DD4FC2@SN6PR02MB4157.namprd02.prod.outlook.com>
Message-ID: <Z60m6NiOlCmy4-q0@google.com>
Subject: Re: [PATCH 16/16] x86/kvmclock: Use TSC for sched_clock if it's
 constant and non-stop
From: Sean Christopherson <seanjc@google.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nikunj A Dadhania <nikunj@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 12, 2025, Michael Kelley wrote:
> From: Sean Christopherson <seanjc@google.com> Sent: Monday, February 10, 2025 8:22 AM
> > On Sat, Feb 08, 2025, Michael Kelley wrote:
> > > But I would be good with some restructuring so that setting the sched clock
> > > save/restore hooks is more closely tied to the sched clock choice,
> > 
> > Yeah, this is the intent of my ranting.  After the dust settles, the code can
> > look like this.
> 
> I'm good with what you are proposing. And if you want, there's no real need
> for hv_ref_counter_at_suspend and hv_save/restore_sched_clock_state()
> to be in the #ifdef sequence since the code has no architecture dependencies.

Right, but because they will be local/static and there are no users outside of
x86, the compiler will complain about unused variables/functions on other
architectures.

