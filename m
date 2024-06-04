Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D9E8FA70A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 02:31:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735062.1141209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEI3p-0006u2-Di; Tue, 04 Jun 2024 00:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735062.1141209; Tue, 04 Jun 2024 00:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEI3p-0006s4-AV; Tue, 04 Jun 2024 00:29:57 +0000
Received: by outflank-mailman (input) for mailman id 735062;
 Tue, 04 Jun 2024 00:29:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWSe=NG=flex--seanjc.bounces.google.com=3_l9eZgYKCXEhTPcYRVddVaT.RdbmTc-STkTaaXhih.mTcegdYTRi.dgV@srs-se1.protection.inumbo.net>)
 id 1sEI3n-0006ry-2M
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 00:29:55 +0000
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [2607:f8b0:4864:20::649])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ec18a40-2209-11ef-b4bb-af5377834399;
 Tue, 04 Jun 2024 02:29:52 +0200 (CEST)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-1f6582eca2bso20755445ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 17:29:52 -0700 (PDT)
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
X-Inumbo-ID: 8ec18a40-2209-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717460991; x=1718065791; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxIMQXFvRFWSOBKMLO/Pb11VLx9FgWxOAKpcjqg1q6M=;
        b=dJ2ShQMh3hc4yiE61PsP9IkkrlHw5+NxTDZLMlmh5xRqfR5mzP93zwUzZJh5NYQkRd
         V7/shSpH1IIrjwrCbhOeuNLgeMCRbkM2jeqC3fSF1aF0yE+HYtFJ0jUmLwz6eHDOkt1a
         PAXwlHlYThQiZ+IqQmBU4pOTrkkYL8IMiBcAt3eMQiJGTZ/2KW6pCpGQo+p0rZDBUSWF
         AnCuYGyBFZkgKI7+V6BcBKeZFa/Wrr/KYfiVlZfHbRvZLo7KJXK8YBEWO0EOYmbLtNqA
         jVWod18rVtis0gUF/IPyxTipnGVZpta0icYWnPj5o61u56VWJPp1nFot4D7duDwfGwUO
         JnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717460991; x=1718065791;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QxIMQXFvRFWSOBKMLO/Pb11VLx9FgWxOAKpcjqg1q6M=;
        b=UZM8I30WOvoMdjG66mJ8xmb7JhxMvtbBQs9gm7glpqzSH6DUeHr2X8FUaz6Uj3M5eD
         brpkrg2uwIVRO1Kf2GJ9OcZ+ET6v34TBTllc39LD8igbIaDyznoxZ35TgBeMm8rOaU8o
         CeL1NtYLd/a9BVukzK11DC1OO0NIYV7T337kv0HPH1eliPiKuYdTdIjIkZZMj8K1HM3I
         6q6JJbM9PWhScWHBwwhD3lkzX+ryAXbW3dnAU8pXyn9PXbg51BtauM68SmNgzImjO5X2
         Vq9Du3YRaJ8dUGU5KfM+xi6U+eVoP28+IsZw7Fei9nrx/4IEWQqp6PW0XKIOZ+KColbE
         5Pcw==
X-Forwarded-Encrypted: i=1; AJvYcCW7QfN9ifOXJ21PRbINn2hvOiayQ9qZIrQOPTIpa75b9SWBoAMj3PcR1gKz71Hq6ZhS0npimUfHA9ya5qdr6yVCUDIJqHHETxQyIjW+4Nc=
X-Gm-Message-State: AOJu0YyhTNtZv8ZBRBy2dPlX8sJikIgMeitVuK/Pm8kJQH5yovkxjK3R
	bDEJWCW0c40CnkZ0UcC/RbZx2iIGtuJbeOb6cDe1Csi69YBoUB/1MFVdq4iJaykpm1dkZbwSaAF
	Y7g==
X-Google-Smtp-Source: AGHT+IENLGEaWbs37HwWar6l9tfsoGWg6m42nFsyoTQfIezFlKVeE9IraziAYhpEU9jmdwNYoPJqg3Pzh8c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f7c1:b0:1f4:620b:6a47 with SMTP id
 d9443c01a7336-1f6370524bemr2945395ad.4.1717460990723; Mon, 03 Jun 2024
 17:29:50 -0700 (PDT)
Date: Mon, 3 Jun 2024 17:29:49 -0700
In-Reply-To: <20240514.OoPohLaejai6@digikod.net>
Mime-Version: 1.0
References: <20240503131910.307630-1-mic@digikod.net> <20240503131910.307630-4-mic@digikod.net>
 <ZjTuqV-AxQQRWwUW@google.com> <20240506.ohwe7eewu0oB@digikod.net>
 <ZjmFPZd5q_hEBdBz@google.com> <20240507.ieghomae0UoC@digikod.net>
 <ZjpTxt-Bxia3bRwB@google.com> <20240514.OoPohLaejai6@digikod.net>
Message-ID: <Zl5f_T7Nb-Fk8Y1o@google.com>
Subject: Re: [RFC PATCH v3 3/5] KVM: x86: Add notifications for Heki policy
 configuration and violation
From: Sean Christopherson <seanjc@google.com>
To: "=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>
Cc: Nicolas Saenz Julienne <nsaenz@amazon.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>, 
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

On Tue, May 14, 2024, Micka=C3=ABl Sala=C3=BCn wrote:
> On Tue, May 07, 2024 at 09:16:06AM -0700, Sean Christopherson wrote:
> > On Tue, May 07, 2024, Micka=C3=ABl Sala=C3=BCn wrote:
> > > If yes, that would indeed require a *lot* of work for something we're=
 not
> > > sure will be accepted later on.
> >=20
> > Yes and no.  The AWS folks are pursuing VSM support in KVM+QEMU, and SV=
SM support
> > is trending toward the paired VM+vCPU model.  IMO, it's entirely feasib=
le to
> > design KVM support such that much of the development load can be shared=
 between
> > the projects.  And having 2+ use cases for a feature (set) makes it _mu=
ch_ more
> > likely that the feature(s) will be accepted.
> >=20
> > And similar to what Paolo said regarding HEKI not having a complete sto=
ry, I
> > don't see a clear line of sight for landing host-defined policy enforce=
ment, as
> > there are many open, non-trivial questions that need answers. I.e. upst=
reaming
> > HEKI in its current form is also far from a done deal, and isn't guaran=
teed to
> > be substantially less work when all is said and done.
>=20
> I'm not sure to understand why "Heki not having a complete story".  The
> goal is the same as the current kernel self-protection mechanisms.

HEKI doesn't have a complete story for how it's going to play nice with kex=
ec(),
emulated RESET, etc.  The kernel's existing self-protection mechanisms Just=
 Work
because the protections are automatically disabled/lost on such transitions=
.
They are obviously significant drawbacks to that behavior, but they are acc=
epted
drawbacks, i.e. solving those problems isn't in scope (yet) for the kernel.=
  And
the "failure" mode is also loss of hardening, not an unusable guest.

In other words, the kernel's hardening is firmly best effort at this time,
whereas HEKI likely needs to be much more than "best effort" in order to ju=
stify
the extra complexity.  And that means having answers to the various interop=
erability
questions.

