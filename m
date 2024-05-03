Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AC48BAE0F
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 15:50:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716470.1118606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2tIQ-0002p7-4P; Fri, 03 May 2024 13:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716470.1118606; Fri, 03 May 2024 13:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2tIQ-0002nb-1k; Fri, 03 May 2024 13:49:54 +0000
Received: by outflank-mailman (input) for mailman id 716470;
 Fri, 03 May 2024 13:49:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1yCT=MG=flex--seanjc.bounces.google.com=3fes0ZgYKCWAQC8LHAEMMEJC.AMKVCL-BCTCJJGQRQ.VCLNPMHCAR.MPE@srs-se1.protection.inumbo.net>)
 id 1s2tIO-0002nT-Aq
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 13:49:52 +0000
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [2607:f8b0:4864:20::44a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02c61719-0954-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 15:49:51 +0200 (CEST)
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-6f446a1ec59so1008744b3a.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2024 06:49:50 -0700 (PDT)
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
X-Inumbo-ID: 02c61719-0954-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714744189; x=1715348989; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQGv5UfxS6jX/aTPX2JQQkA4rH0rnz4JsGbkCfvMiug=;
        b=xip0XDkZd2mt7GFPFKpe/Xyv9d85aE2dsBihmjWZ+xbDDoGgZWodKRDMhb/5V+8pkB
         fvnmIZV31JfI43aUWZ0qvTmHlPm75E8vJofwyf74i1kqDvW6F8qZ79TZl9DwbGZNwLK+
         kWdHw6ZI6HiwQAEMF/mNQ7Gr4FlPsxEKURsvC2fkcJcm10VQUfmkyMIxqf38l0g31nQu
         nBiRyNOPkL1gMFpxfnKy1PQBj4tCnKN2u73A/UCt7YJAWHYz1BmYpVMn4Sjmsj1zcFF8
         IYmyLzXEdPwaDeG87cHoURIBXfetzXrRhhEUNNjplFJL2Wi+I22PUG83L1ySYTBeoMx9
         oISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714744189; x=1715348989;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rQGv5UfxS6jX/aTPX2JQQkA4rH0rnz4JsGbkCfvMiug=;
        b=Ip0gI0vGsMjW7Vg+nngzB4g/WKzV1XSiG4+1P/nTF6M68xqn/fn6dScrFWYeo+HL4A
         CDG37qn0EHMg/PHsi8kLeqTYnhHKfM06CahsEqVc0tJ5CqQp/2KfBCtUDuCSwg1SI+uR
         zZfabpZIgXvE4Skp8DmPLpDSFjFn5QHnhPvxrlMFV37RmfG/AXsKmthFK0s5oaEVbaJH
         uK+v7Vi0OLoqkIVJOrfL65l1NQmOyXXZ9OjEpv2G2tyOIL7EBTtd1sX8WPEXYyPV8aid
         3VxAGIELBddKRRpwvZymBzjKKx7Opgy9t49TR7sqcHmw0V5HeGx8bpE/6ojcbmf6WuWG
         Im4w==
X-Forwarded-Encrypted: i=1; AJvYcCXlSBeDv4/BAM2eC4vvr02Ii/mzlSqg8VxXy58n9zF6T+WB5pr1L6AeQ5t1VfmbiJzQ10YytjXf2Nc9BbE/7zuTBQpLwsFJRR9ICpXNbJ0=
X-Gm-Message-State: AOJu0Ywu8piL8YzwL0lVsrFKQWhtyTUHJVjRx80AyGpZSvA1D4kDs00F
	alV4qt2HT8FoWIBHz6Z1ISwaxWcKEEYadJwuisZx/hb9b83rFpbiyHQNUTsGCTxIpmpWfQGnYk7
	nzQ==
X-Google-Smtp-Source: AGHT+IGc0eGZplb+oZL3dkGKqelUQj57uqxGLcLhw0noqTEVy1iaqZaCu7zCqnCr5z1/yKblcKIpSFxnXkk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2e07:b0:6ea:baf6:57a3 with SMTP id
 fc7-20020a056a002e0700b006eabaf657a3mr154355pfb.6.1714744189252; Fri, 03 May
 2024 06:49:49 -0700 (PDT)
Date: Fri, 3 May 2024 06:49:47 -0700
In-Reply-To: <20240503131910.307630-1-mic@digikod.net>
Mime-Version: 1.0
References: <20240503131910.307630-1-mic@digikod.net>
Message-ID: <ZjTre6BYRpkI_H4o@google.com>
Subject: Re: [RFC PATCH v3 0/5] Hypervisor-Enforced Kernel Integrity - CR pinning
From: Sean Christopherson <seanjc@google.com>
To: "=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Alexander Graf <graf@amazon.com>, 
	Angelina Vu <angelinavu@linux.microsoft.com>, 
	Anna Trikalinou <atrikalinou@microsoft.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Forrest Yuan Yu <yuanyu@google.com>, James Gowans <jgowans@amazon.com>, 
	James Morris <jamorris@linux.microsoft.com>, John Andersen <john.s.andersen@intel.com>, 
	"Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>, Marian Rotariu <marian.c.rotariu@gmail.com>, 
	"Mihai =?utf-8?B?RG9uyJt1?=" <mdontu@bitdefender.com>, 
	"=?utf-8?B?TmljdciZb3IgQ8OuyJt1?=" <nicu.citu@icloud.com>, Thara Gopinath <tgopinath@microsoft.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Wei Liu <wei.liu@kernel.org>, 
	Will Deacon <will@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	"=?utf-8?Q?=C8=98tefan_=C8=98icleru?=" <ssicleru@bitdefender.com>, dev@lists.cloudhypervisor.org, 
	kvm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, qemu-devel@nongnu.org, 
	virtualization@lists.linux-foundation.org, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 03, 2024, Micka=C3=ABl Sala=C3=BCn wrote:
> Hi,
>=20
> This patch series implements control-register (CR) pinning for KVM and
> provides an hypervisor-agnostic API to protect guests.  It includes the
> guest interface, the host interface, and the KVM implementation.
>=20
> It's not ready for mainline yet (see the current limitations), but we
> think the overall design and interfaces are good and we'd like to have
> some feedback on that.

...

> # Current limitations
>=20
> This patch series doesn't handle VM reboot, kexec, nor hybernate yet.
> We'd like to leverage the realated feature from KVM CR-pinning patch
> series [3].  Help appreciated!

Until you have a story for those scenarios, I don't expect you'll get a lot=
 of
valuable feedback, or much feedback at all.  They were the hot topic for KV=
M CR
pinning, and they'll likely be the hot topic now.

