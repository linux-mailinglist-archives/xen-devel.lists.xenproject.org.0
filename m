Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF278BAE63
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 16:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716493.1118646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2tVY-0008RL-0F; Fri, 03 May 2024 14:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716493.1118646; Fri, 03 May 2024 14:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2tVX-0008PF-Sp; Fri, 03 May 2024 14:03:27 +0000
Received: by outflank-mailman (input) for mailman id 716493;
 Fri, 03 May 2024 14:03:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MkFU=MG=flex--seanjc.bounces.google.com=3q-40ZgYKCZQG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@srs-se1.protection.inumbo.net>)
 id 1s2tVW-0008P5-HI
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 14:03:26 +0000
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [2607:f8b0:4864:20::b4a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e87e86d9-0955-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 16:03:25 +0200 (CEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-de59ff8af0bso13577809276.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2024 07:03:25 -0700 (PDT)
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
X-Inumbo-ID: e87e86d9-0955-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714745004; x=1715349804; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a136SOKV90n/XcmvCvD6zgQKrJ5kR/Q+OhiUt3FbOiE=;
        b=zvhRf2DDgMqroQU5HA7kOmbkw7yxHrj/yEbbtbWLAXQ7fyOyIVPpJvos59L39N/fuY
         cYLFeaWEGjIpunhb+m+I2h18VW00dK8vnoQbbkXzHutSG0O9CbUE2/dmdz32vIahuAVU
         1AIzyoRzvxFm4vic8c7ZbuMW7LiCGe6inUoTkLeC7ziJosDCcvOBCZBdRB8WqAgvuJ1t
         dnl5FjAzOM45sk39VO1pKAt2yBbipr2Fq2HGW/vZa8Jd+TRX6lKi31U82E7kvE+cAmzx
         RMIEOe9oFDuwtZ1KM1267QbhWeP34duM1gXGlwNW24lK1ZvlonXpedOCuHMZW1dSDfZL
         m04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714745004; x=1715349804;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a136SOKV90n/XcmvCvD6zgQKrJ5kR/Q+OhiUt3FbOiE=;
        b=bZYa6PRCjlLsIz3SmWS7suD8Uo0DSRhQJtf8lnIaJ7eigcu0B69CPx1qkhiH/0XIOY
         tFvt8ylqETGjVsuQI+egyApF3JJhW8bBm947+v2KUchjFkHT1z5PFbyKytQzff2kHH3x
         vPTyBimUcDwtPl7Vs1cjo+hdnRoVpFMVC18SVi+JJQeyPLjqHH8mCuw6Gfm8R8KjMeKY
         Eg3dr1PTGKwoZSeA0RFA8JkshNKzLIdThUgZ/N93jhHEQJSF6EbMmkAbO2yI702e6jGV
         ydEEo7oUYEHhkU8+3+8H7HSBr8n+ocyZ2BsqCqzkWZE/i2B76FtpViCgvpryqEtYtPKk
         xKXA==
X-Forwarded-Encrypted: i=1; AJvYcCUDC9mU0loYUtI0+bIvg9hJz8IaJXxNDq0y5wpYipOtKAT74jVJMeD4B9YkfpOB/A6900MguGSCUAY9FP4VGimtbdC5xhN/rvr2+MDMsqc=
X-Gm-Message-State: AOJu0YzidlMtp+HA2SHj+dZ1kr28+HnwDlL9MqX6Lw3jH8wHAmdyCfVd
	0f/sN5B5woYWTwDtGelvh7Gh+sXVuaRhG28ZBfqttF8fjrFUoB6Ou4lNt17Ksf9pDFvojyEKaGm
	IsA==
X-Google-Smtp-Source: AGHT+IG8Se+FDx3icVQiBS8y3Ql+XygTIGhFwTldpFeLgMxDQJNLd2QsRcCHI+DmhaCm9MeTHgIbmJIbKcw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1201:b0:de6:141a:b0de with SMTP id
 s1-20020a056902120100b00de6141ab0demr337561ybu.10.1714745003300; Fri, 03 May
 2024 07:03:23 -0700 (PDT)
Date: Fri, 3 May 2024 07:03:21 -0700
In-Reply-To: <20240503131910.307630-4-mic@digikod.net>
Mime-Version: 1.0
References: <20240503131910.307630-1-mic@digikod.net> <20240503131910.307630-4-mic@digikod.net>
Message-ID: <ZjTuqV-AxQQRWwUW@google.com>
Subject: Re: [RFC PATCH v3 3/5] KVM: x86: Add notifications for Heki policy
 configuration and violation
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
> Add an interface for user space to be notified about guests' Heki policy
> and related violations.
>=20
> Extend the KVM_ENABLE_CAP IOCTL with KVM_CAP_HEKI_CONFIGURE and
> KVM_CAP_HEKI_DENIAL. Each one takes a bitmask as first argument that can
> contains KVM_HEKI_EXIT_REASON_CR0 and KVM_HEKI_EXIT_REASON_CR4. The
> returned value is the bitmask of known Heki exit reasons, for now:
> KVM_HEKI_EXIT_REASON_CR0 and KVM_HEKI_EXIT_REASON_CR4.
>=20
> If KVM_CAP_HEKI_CONFIGURE is set, a VM exit will be triggered for each
> KVM_HC_LOCK_CR_UPDATE hypercalls according to the requested control
> register. This enables to enlighten the VMM with the guest
> auto-restrictions.
>=20
> If KVM_CAP_HEKI_DENIAL is set, a VM exit will be triggered for each
> pinned CR violation. This enables the VMM to react to a policy
> violation.
>=20
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
> Cc: Wanpeng Li <wanpengli@tencent.com>
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>
> Link: https://lore.kernel.org/r/20240503131910.307630-4-mic@digikod.net
> ---
>=20
> Changes since v1:
> * New patch. Making user space aware of Heki properties was requested by
>   Sean Christopherson.

No, I suggested having userspace _control_ the pinning[*], not merely be no=
tified
of pinning.

 : IMO, manipulation of protections, both for memory (this patch) and CPU s=
tate
 : (control registers in the next patch) should come from userspace.  I hav=
e no
 : objection to KVM providing plumbing if necessary, but I think userspace =
needs to
 : to have full control over the actual state.
 :=20
 : One of the things that caused Intel's control register pinning series to=
 stall
 : out was how to handle edge cases like kexec() and reboot.  Deferring to =
userspace
 : means the kernel doesn't need to define policy, e.g. when to unprotect m=
emory,
 : and avoids questions like "should userspace be able to overwrite pinned =
control
 : registers".
 :=20
 : And like the confidential VM use case, keeping userspace in the loop is =
a big
 : beneifit, e.g. the guest can't circumvent protections by coercing usersp=
ace into
 : writing to protected memory.

I stand by that suggestion, because I don't see a sane way to handle things=
 like
kexec() and reboot without having a _much_ more sophisticated policy than w=
ould
ever be acceptable in KVM.

I think that can be done without KVM having any awareness of CR pinning wha=
tsoever.
E.g. userspace just needs to ability to intercept CR writes and inject #GPs=
.  Off
the cuff, I suspect the uAPI could look very similar to MSR filtering.  E.g=
. I bet
userspace could enforce MSR pinning without any new KVM uAPI at all.

[*] https://lore.kernel.org/all/ZFUyhPuhtMbYdJ76@google.com

