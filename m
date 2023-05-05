Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 908DD6F879F
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 19:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530555.826262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzH8-0002KZ-UC; Fri, 05 May 2023 17:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530555.826262; Fri, 05 May 2023 17:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzH8-0002IH-RQ; Fri, 05 May 2023 17:31:22 +0000
Received: by outflank-mailman (input) for mailman id 530555;
 Fri, 05 May 2023 17:31:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ky0y=A2=flex--seanjc.bounces.google.com=3ZD1VZAYKCV0N95IE7BJJBG9.7JHS9I-89Q9GGDNON.S9IKMJE97O.JMB@srs-se1.protection.inumbo.net>)
 id 1puzH7-0002IB-L2
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 17:31:21 +0000
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [2607:f8b0:4864:20::549])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a432f184-eb6a-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 19:31:18 +0200 (CEST)
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-528ab7097afso1444091a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 May 2023 10:31:18 -0700 (PDT)
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
X-Inumbo-ID: a432f184-eb6a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683307876; x=1685899876;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qAOxuvlzoNXvPjKXSolx+GWj91lIdWlZPd2J+lepu+A=;
        b=YajfbfW6/wtHmrsLEvn1JkH+xI6N003d6IHsKYEdYKyQ4XBOf/ltXYAA8TT//7kx7h
         8wJuT8QRTxgAHxrmJYouhI/7YgQTZm4mO10KjPCgeJdJMeuE5+h/bLiahSr81Gm/ecKB
         zDx4TcPrzUJvkSrnc51y29YU+lehMTLTirJ8zF6Y7AvgQTUcfYtQ37OJnKLDHV7h0smL
         PJn351waqBTnvLrthFCgyYl4ojqlUIUMdMZ9mvD3/1gMVpPtasu86bb2kRnLpCKWJhO/
         k73RbTIykvnJHtRsAnnJa8Km60QZxDXHqCZ+6V04mHM7fIYa6vKKdRMKt3CdepgXl1bi
         CXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683307876; x=1685899876;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qAOxuvlzoNXvPjKXSolx+GWj91lIdWlZPd2J+lepu+A=;
        b=C724/H88uLdTPA5yUEB/JDJWbpNGEyaKFzyEhRWHwOv8IXTFt4P5wFcsJtZq0F2sXI
         ERRWX7B6BhXeKmVkpigkc8hS/D7DVd+hw5TPiffisg9Huxjwcq+HehW2vfmKXCKtXrpJ
         VZqCZn8K8vmsN3l6nEzXD6OMAXpUAaNyQAbK3+BACljsu4nV7Ds1EQd1VQwDzUk2SJu7
         YZE+ONtAPgWa7VPa0wFyGBbg2Yn8HlZosHCaO4sSpXQUaqFAyWpJaOX1jW5U4CxnK7uS
         BxS+2s5LL7uMGgBET65myJhxl4ICXHndMoKu4Ew+uFYRRrt9x9w+WnO6xk8e0HPPp512
         cTkA==
X-Gm-Message-State: AC+VfDxxHF2gPqg7yriZxhGvg53ykIMb/6wnkSe8oW6d8IqSYU87H4YD
	KOGNOkj/Ocm0hfBBVZvCDGkEZHv5QYs=
X-Google-Smtp-Source: ACHHUZ5AKtrEhFxY1tyiq165vY9w3gn7Qqc7+wcBsvMx8OszEeBENNSnTQn/dNy8sL8BRZ1pG6YlJeRQjuk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:152:0:b0:52c:407a:2279 with SMTP id
 79-20020a630152000000b0052c407a2279mr529292pgb.0.1683307876644; Fri, 05 May
 2023 10:31:16 -0700 (PDT)
Date: Fri, 5 May 2023 10:31:15 -0700
In-Reply-To: <6412bf27-4d05-eab8-3db1-d4efa44af3aa@digikod.net>
Mime-Version: 1.0
References: <20230505152046.6575-1-mic@digikod.net> <20230505152046.6575-3-mic@digikod.net>
 <ZFUumGdZDNs1tkQA@google.com> <6412bf27-4d05-eab8-3db1-d4efa44af3aa@digikod.net>
Message-ID: <ZFU9YzqG/T+Ty9gY@google.com>
Subject: Re: [PATCH v1 2/9] KVM: x86/mmu: Add support for prewrite page tracking
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
> On 05/05/2023 18:28, Sean Christopherson wrote:
> > I have no doubt that we'll need to solve performance and scaling issues=
 with the
> > memory attributes implementation, e.g. to utilize xarray multi-range su=
pport
> > instead of storing information on a per-4KiB-page basis, but AFAICT, th=
e core
> > idea is sound.  And a very big positive from a maintenance perspective =
is that
> > any optimizations, fixes, etc. for one use case (CoCo vs. hardening) sh=
ould also
> > benefit the other use case.
> >=20
> > [1] https://lore.kernel.org/all/20230311002258.852397-22-seanjc@google.=
com
> > [2] https://lore.kernel.org/all/Y2WB48kD0J4VGynX@google.com
> > [3] https://lore.kernel.org/all/Y1a1i9vbJ%2FpVmV9r@google.com
>=20
> I agree, I used this mechanism because it was easier at first to rely on =
a
> previous work, but while I was working on the MBEC support, I realized th=
at
> it's not the optimal way to do it.
>=20
> I was thinking about using a new special EPT bit similar to
> EPT_SPTE_HOST_WRITABLE, but it may not be portable though. What do you
> think?

On x86, SPTEs are even more ephemeral than memslots.  E.g. for historical r=
easons,
KVM zaps all SPTEs if _any_ memslot is deleted, which is problematic if the=
 guest
is moving around BARs, using option ROMs, etc.

ARM's pKVM tracks metadata in its stage-2 PTEs, i.e. doesn't need an xarray=
 to
otrack attributes, but that works only because pKVM is more privileged than=
 the
host kernel, and the shared vs. private memory attribute that pKVM cares ab=
out
is very, very restricted in how it can be used and changed.

I tried shoehorning private vs. shared metadata into x86's SPTEs in the pas=
t, and
it ended up being a constant battle with the kernel, e.g. page migration, a=
nd with
KVM itself, e.g. the above memslot mess.

