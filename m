Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6B26F8765
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 19:18:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530550.826252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puz4I-0008Hv-Pp; Fri, 05 May 2023 17:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530550.826252; Fri, 05 May 2023 17:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puz4I-0008Fq-Mu; Fri, 05 May 2023 17:18:06 +0000
Received: by outflank-mailman (input) for mailman id 530550;
 Fri, 05 May 2023 17:18:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4wjn=A2=flex--seanjc.bounces.google.com=3SDpVZAYKCTspbXkgZdlldib.Zljubk-absbiifpqp.ubkmolgbZq.lod@srs-se1.protection.inumbo.net>)
 id 1puz4G-0008Fk-GK
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 17:18:04 +0000
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [2607:f8b0:4864:20::549])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9d079b0-eb68-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 19:18:02 +0200 (CEST)
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-517baf1bc93so1573140a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 May 2023 10:18:02 -0700 (PDT)
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
X-Inumbo-ID: c9d079b0-eb68-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683307081; x=1685899081;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxwNvfp9yRlruqDpvJxkAnrRtCk6mE67Bd3BubjypxQ=;
        b=cXXc3M6yYogaCUYe2c+SrQc2MIdAmLJbXRkHUS9zG7xhw6MiEu2sitOw7/Gs8N+qYL
         oXgYeStpeUI6b4JASS0HSftlcCCRj/X7n1N9WbKprVd/yNpe36+Ro8ZtPUj3p6Ld50JH
         pqxQnHXwImJi8vy3sHQBgx80mx2LtgRBbImqJGjt3ifJhQvYtGUkTdTjALM0pcmAV+1D
         6vpr8yMdnFBHG32elxIu/SKRWE8X5JKVIrtIk1RplILzJzkSNycRYJAr+Iqs6tbgmR/S
         ugGjoODz+nslHOA/c91Rz89LssATB8IAOjXVho0NUWdysNmyIv7F6uQ3Fm1u7pfzIzFf
         Lo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683307081; x=1685899081;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SxwNvfp9yRlruqDpvJxkAnrRtCk6mE67Bd3BubjypxQ=;
        b=HYrL+5HltJa36ItWjhdifRWAQ01e5NypMS9Z6GIH4+CHoUK6oxNkoYVmpd0Fh83CH/
         XVwLXv553eqBL2KA7/nHFfl9LnqMsD3ekHPQhcNduHOzZNiTMsk62qghSWlQXJiT2o+j
         NvQXcFD7cBzsAm36Hvm9MT5+TzOOstLWB4xXoy30lXaAevVUo5yhCfIjUR/B0p7Q0xs9
         VuzSSJgsmKexZzGtu+YZtzrweMzTimxq1mjpbbXKyvUF6p/qR6Fezc8v+BxixeBfOTuy
         4RZijT/it1ld8YX1fxJy8zBViaFiwLmfme6KjD7rLORescHyEylExiGB+MuLRO7qCFVM
         juzA==
X-Gm-Message-State: AC+VfDyOI5KJYVxgXbCrXRNjLryp5ocSlV1v++n9ui6dEu9hbM5W91M9
	sAnS38Ygj8G5taGK1/fJitnIMcb7jTY=
X-Google-Smtp-Source: ACHHUZ6uHVJCOE/ldx1w0hZ4Jds3kKbtJzThF7Cs+tG2xUZ0aBKcfdgS0+FUqexTD5OeTy31Ux2XqzCsKXc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:8ac1:0:b0:513:efd4:d76 with SMTP id
 y184-20020a638ac1000000b00513efd40d76mr529931pgd.5.1683307080808; Fri, 05 May
 2023 10:18:00 -0700 (PDT)
Date: Fri, 5 May 2023 10:17:59 -0700
In-Reply-To: <39125b11-659f-35f4-ac7a-a3ba31365950@digikod.net>
Mime-Version: 1.0
References: <20230505152046.6575-1-mic@digikod.net> <20230505152046.6575-5-mic@digikod.net>
 <ZFUyhPuhtMbYdJ76@google.com> <39125b11-659f-35f4-ac7a-a3ba31365950@digikod.net>
Message-ID: <ZFU6R2pZ0Vx5RpAj@google.com>
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
>=20
> On 05/05/2023 18:44, Sean Christopherson wrote:
> > On Fri, May 05, 2023, Micka=EF=BF=BDl Sala=EF=BF=BDn wrote:
> > > Add a new KVM_HC_LOCK_MEM_PAGE_RANGES hypercall that enables a guest =
to
> > > set EPT permissions on a set of page ranges.
> >=20
> > IMO, manipulation of protections, both for memory (this patch) and CPU =
state
> > (control registers in the next patch) should come from userspace.  I ha=
ve no
> > objection to KVM providing plumbing if necessary, but I think userspace=
 needs to
> > to have full control over the actual state.
>=20
> By user space, do you mean the host user space or the guest user space?

Host userspace, a.k.a. the VMM.  Definitely not guest userspace.

> About the guest user space, I see several issues to delegate this kind of
> control:
> - These are restrictions only relevant to the kernel.
> - The threat model is to protect against user space as early as possible.
> - It would be more complex for no obvious gain.
>=20
> This patch series is an extension of the kernel self-protections mechanis=
ms,
> and they are not configured by user space.
>=20
>=20
> >=20
> > One of the things that caused Intel's control register pinning series t=
o stall
> > out was how to handle edge cases like kexec() and reboot.  Deferring to=
 userspace
> > means the kernel doesn't need to define policy, e.g. when to unprotect =
memory,
> > and avoids questions like "should userspace be able to overwrite pinned=
 control
> > registers".
>=20
> The idea is to authenticate every changes. For kexec, the VMM (or somethi=
ng
> else) would have to authenticate the new kernel. Do you have something el=
se
> in mind that could legitimately require such memory or CR changes?

I think we're on the same page, the VMM (host userspace) would need to ack =
any
changes.

FWIW, SMM is another wart as entry to SMM clobbers CRs.  Now that CONFIG_KV=
M_SMM
is a thing, the easiest solution would be to disallow coexistence with SMM,=
 though
that might not be an option for many use cases (IIUC, QEMU-based deployment=
s use
SMM to implement secure boot).

> > And like the confidential VM use case, keeping userspace in the loop is=
 a big
> > beneifit, e.g. the guest can't circumvent protections by coercing users=
pace into
> > writing to protected memory .
>=20
> I don't understand this part. Are you talking about the host user space? =
How
> the guest could circumvent protections?

Host userspace.  Guest configures a device buffer in write-protected memory=
, gets
a host (synthetic) device to write into the memory.

