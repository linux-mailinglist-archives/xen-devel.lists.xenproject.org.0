Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D57F6F86F9
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 18:45:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530528.826213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puyYE-0002ha-Fb; Fri, 05 May 2023 16:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530528.826213; Fri, 05 May 2023 16:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puyYE-0002f1-CE; Fri, 05 May 2023 16:44:58 +0000
Received: by outflank-mailman (input) for mailman id 530528;
 Fri, 05 May 2023 16:44:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zlrz=A2=flex--seanjc.bounces.google.com=3hTJVZAYKCWgYKGTPIMUUMRK.IUSdKT-JKbKRROYZY.dKTVXUPKIZ.UXM@srs-se1.protection.inumbo.net>)
 id 1puyYC-0002NV-At
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 16:44:56 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29997d9a-eb64-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 18:44:55 +0200 (CEST)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-24e33239357so1041248a91.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 May 2023 09:44:55 -0700 (PDT)
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
X-Inumbo-ID: 29997d9a-eb64-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683305094; x=1685897094;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+i6WgJAJzJlKXvdjrc4sB18Bds1WwkbYsWdLgSqVp4=;
        b=5NLcQWofuV/YkKQ6oScIEQc8lVhhA2L4HU7CAnLH03mX0Px3HVPbbRo2D6swL6bYVC
         DUB3fcT4XujkVxCNaKYJ+P/Z7sNnX421VReM55ms1qzD5WRQCvJ/Kix0mSSaYy6Vuguo
         DWnNHQWNURLtT+6bY0K/Qi8QSq5fb73IsidEyosi5bDvhPv4lQKLP/WCp19+1EjcQYkT
         2ZZ09LoscjMPBSeU10UZCNvLYrLZpvQ7Vt2oUZW3pPlG97XC7fwgw982zXDkvUJKrQ1i
         ngUKTQDZ0x71ie0DU+LnkH+jsC1SnJHoK6gBPF+WpYtjUSRSNwRS6UiypPvCgognd0bl
         qZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683305094; x=1685897094;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9+i6WgJAJzJlKXvdjrc4sB18Bds1WwkbYsWdLgSqVp4=;
        b=AYI6GWCXPBkbLQUCfNbNdU6P/BjvTCHSRKPJ2j4sCK2h5wNu05jaOU1/T2utj8Mixr
         UOwarWJ61aP21teZkmRR4bILikNL9QUkpFyrsbwGrBSMIeFGLclEMguVazBCsS/Q7v1M
         D5ettck/DHnjcwPqoSyY9yn6N/haqezFgNcyGQXk+hH/grqO5ChzVHBZVsITgl+hXHk0
         9oZRG7vdXxUJrNLAyOjirqT4jFd0u9OKoqFfD0zAVm4t+VL8MkfRrOMCsDNISi2zYps2
         Nkrk2oensuRGlWoOffkDy6EhICopFyr9lrXAbVKW1sNU1/91baQOmuc0OfZ76tWbexpG
         rNlQ==
X-Gm-Message-State: AC+VfDxC0xjhEZ37sll1qUeGG2rkXzHnMJTFWSNXPFudKqeIyznhl5ZN
	7X9rQfLsxw4F6JulLMlo2JKtrbAttqw=
X-Google-Smtp-Source: ACHHUZ6aankmXvB8085gNTlbF2PCEyPixSX1tutA3Hp2uz+l8puQYKdMvvxlOn7gLaJGVxpHKJ9HgVKK2Lk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:ea0b:b0:24e:2787:405d with SMTP id
 w11-20020a17090aea0b00b0024e2787405dmr607921pjy.5.1683305093970; Fri, 05 May
 2023 09:44:53 -0700 (PDT)
Date: Fri, 5 May 2023 09:44:52 -0700
In-Reply-To: <20230505152046.6575-5-mic@digikod.net>
Mime-Version: 1.0
References: <20230505152046.6575-1-mic@digikod.net> <20230505152046.6575-5-mic@digikod.net>
Message-ID: <ZFUyhPuhtMbYdJ76@google.com>
Subject: Re: [PATCH v1 4/9] KVM: x86: Add new hypercall to set EPT permissions
From: Sean Christopherson <seanjc@google.com>
To: "=?iso-8859-1?Q?Micka=EBl_Sala=FCn?=" <mic@digikod.net>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Alexander Graf <graf@amazon.com>, Forrest Yuan Yu <yuanyu@google.com>, 
	James Morris <jamorris@linux.microsoft.com>, John Andersen <john.s.andersen@intel.com>, 
	Liran Alon <liran.alon@oracle.com>, 
	"Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>, Marian Rotariu <marian.c.rotariu@gmail.com>, 
	"Mihai =?utf-8?B?RG9uyJt1?=" <mdontu@bitdefender.com>, 
	"=?utf-8?B?TmljdciZb3IgQ8OuyJt1?=" <nicu.citu@icloud.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Thara Gopinath <tgopinath@microsoft.com>, Will Deacon <will@kernel.org>, 
	Zahra Tarkhani <ztarkhani@microsoft.com>, 
	"=?utf-8?Q?=C8=98tefan_=C8=98icleru?=" <ssicleru@bitdefender.com>, dev@lists.cloudhypervisor.org, 
	kvm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, qemu-devel@nongnu.org, 
	virtualization@lists.linux-foundation.org, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2023, Micka=EF=BF=BDl Sala=EF=BF=BDn wrote:
> Add a new KVM_HC_LOCK_MEM_PAGE_RANGES hypercall that enables a guest to
> set EPT permissions on a set of page ranges.

IMO, manipulation of protections, both for memory (this patch) and CPU stat=
e
(control registers in the next patch) should come from userspace.  I have n=
o
objection to KVM providing plumbing if necessary, but I think userspace nee=
ds to
to have full control over the actual state.

One of the things that caused Intel's control register pinning series to st=
all
out was how to handle edge cases like kexec() and reboot.  Deferring to use=
rspace
means the kernel doesn't need to define policy, e.g. when to unprotect memo=
ry,
and avoids questions like "should userspace be able to overwrite pinned con=
trol
registers".

And like the confidential VM use case, keeping userspace in the loop is a b=
ig
beneifit, e.g. the guest can't circumvent protections by coercing userspace=
 into
writing to protected memory .

