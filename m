Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE14A6F86BB
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 18:28:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530516.826183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puyI2-0007ri-Fj; Fri, 05 May 2023 16:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530516.826183; Fri, 05 May 2023 16:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puyI2-0007p5-CV; Fri, 05 May 2023 16:28:14 +0000
Received: by outflank-mailman (input) for mailman id 530516;
 Fri, 05 May 2023 16:28:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nPXv=A2=flex--seanjc.bounces.google.com=3mi5VZAYKCXUlXTgcVZhhZeX.VhfqXg-WXoXeeblml.qXgikhcXVm.hkZ@srs-se1.protection.inumbo.net>)
 id 1puyI1-0007ow-AZ
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 16:28:13 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d33406e0-eb61-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 18:28:11 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-559e281c5dfso19662157b3.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 May 2023 09:28:11 -0700 (PDT)
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
X-Inumbo-ID: d33406e0-eb61-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683304090; x=1685896090;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpG4xiqP3mzArRx9Ask1She9PnSIKi9NV0T7HckdUAY=;
        b=R7ZId5oM7hLrX+tcfVm/Bnk2u8JbAC1I8QSh2twc/YutVfGMASmtW7tbm2YP3uHqlk
         RwtPwL861jZAZsMdLif5CXyQc6HVUK4hq+Rsigm7g9H5SwYxxSrPZKroysdphn0wBKMc
         5pkuhlqCX/BOp4yTuk4h5T1NCQgcpfPZ9KLIiem4KASWPyrgXBR48rcxQa06YhEaqMbn
         orfLSFQcdN2vNomHtco8b3soICbHS5a9W6R91ScgWRyqTuI6OJFa+omcbJE3G4QloJsc
         Zd/UhaIHTp9GBfbJO6BShFyMFzXWMH9S7e+yp/9GzVVu/Y2uZsmKlNFrDjrpY2RYPhtU
         7R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683304090; x=1685896090;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tpG4xiqP3mzArRx9Ask1She9PnSIKi9NV0T7HckdUAY=;
        b=JZcmGMH0Sk7khgu/cTCb7OlxOtGYfhG7uzwjCfAALOyOMVhIR7NVjT6WzB7c+L5Qek
         ACtGA059m4FaZCbRSJ6UOBO/IZljlDlvYBfOnG6ST77PNJti86HuLL635G1s/ZF6o1kn
         GSmBod7sGZLPDLmdqhvhiT9xZr2nto3f6Qes7WX67lDhWKGo5vkUlDwKbvrAZzSSldeZ
         41bHMDjsNTal9dxBDN4MkMLYmOymbx+oHZoOrxzmwiAfyi3n65dhdS3RK6g9RLyezhSZ
         bSuxQpkhDPUzVYtD6GmPa0qDS0VALRy+Ra/+ieLElIJQysaDI4gsI8ye1hxyYmxIOtVY
         1sBw==
X-Gm-Message-State: AC+VfDw9csWhAxSBmzSVe0ZGipJ3DIkVCdu1sNmCU/ISL4yqz5BkXAF5
	5fir944kfNVsUDgb+omwMVsNMdTTtI8=
X-Google-Smtp-Source: ACHHUZ6MaxIQ4e6CYkENF40G6p9cF+vIn2nNSO3VXw5131N/TbPSwiBkXRT2QEZKyWmorm0BLuruUfs9Bhg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ac24:0:b0:559:d859:d746 with SMTP id
 k36-20020a81ac24000000b00559d859d746mr1208880ywh.10.1683304090087; Fri, 05
 May 2023 09:28:10 -0700 (PDT)
Date: Fri, 5 May 2023 09:28:08 -0700
In-Reply-To: <20230505152046.6575-3-mic@digikod.net>
Mime-Version: 1.0
References: <20230505152046.6575-1-mic@digikod.net> <20230505152046.6575-3-mic@digikod.net>
Message-ID: <ZFUumGdZDNs1tkQA@google.com>
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
> diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm=
/kvm_page_track.h
> index eb186bc57f6a..a7fb4ff888e6 100644
> --- a/arch/x86/include/asm/kvm_page_track.h
> +++ b/arch/x86/include/asm/kvm_page_track.h
> @@ -3,6 +3,7 @@
>  #define _ASM_X86_KVM_PAGE_TRACK_H
> =20
>  enum kvm_page_track_mode {
> +	KVM_PAGE_TRACK_PREWRITE,

Heh, just when I decide to finally kill off support for multiple modes[1] :=
-)

My assessment from that changelog still holds true for this case:

  Drop "support" for multiple page-track modes, as there is no evidence
  that array-based and refcounted metadata is the optimal solution for
  other modes, nor is there any evidence that other use cases, e.g. for
  access-tracking, will be a good fit for the page-track machinery in
  general.
 =20
  E.g. one potential use case of access-tracking would be to prevent guest
  access to poisoned memory (from the guest's perspective).  In that case,
  the number of poisoned pages is likely to be a very small percentage of
  the guest memory, and there is no need to reference count the number of
  access-tracking users, i.e. expanding gfn_track[] for a new mode would be
  grossly inefficient.  And for poisoned memory, host userspace would also
  likely want to trap accesses, e.g. to inject #MC into the guest, and that
  isn't currently supported by the page-track framework.
 =20
  A better alternative for that poisoned page use case is likely a
  variation of the proposed per-gfn attributes overlay (linked), which
  would allow efficiently tracking the sparse set of poisoned pages, and by
  default would exit to userspace on access.

Of particular relevance:

  - Using the page-track machinery is inefficient because the guest is like=
ly
    going to write-protect a minority of its memory.  And this

      select KVM_EXTERNAL_WRITE_TRACKING if KVM

    is particularly nasty because simply enabling HEKI in the Kconfig will =
cause
    KVM to allocate rmaps and gfn tracking.

  - There's no need to reference count the protection, i.e. 15 of the 16 bi=
ts of
    gfn_track are dead weight.

  - As proposed, adding a second "mode" would double the cost of gfn tracki=
ng.

  - Tying the protections to the memslots will create an impossible-to-main=
tain
    ABI because the protections will be lost if the owning memslot is delet=
ed and
    recreated.

  - The page-track framework provides incomplete protection and will lead t=
o an
    ongoing game of whack-a-mole, e.g. this patch catches the obvious cases=
 by
    adding calls to kvm_page_track_prewrite(), but misses things like kvm_v=
cpu_map().

  - The scaling and maintenance issues will only get worse if/when someone =
tries
    to support dropping read and/or execute permissions, e.g. for execute-o=
nly.

  - The code is x86-only, and is likely to stay that way for the foreseeabl=
e
    future.

The proposed alternative is to piggyback the memory attributes implementati=
on[2]
that is being added (if all goes according to plan) for confidential VMs.  =
This
use case (dropping permissions) came up not too long ago[3], which is why I=
 have
a ready-made answer).

I have no doubt that we'll need to solve performance and scaling issues wit=
h the
memory attributes implementation, e.g. to utilize xarray multi-range suppor=
t
instead of storing information on a per-4KiB-page basis, but AFAICT, the co=
re
idea is sound.  And a very big positive from a maintenance perspective is t=
hat
any optimizations, fixes, etc. for one use case (CoCo vs. hardening) should=
 also
benefit the other use case.

[1] https://lore.kernel.org/all/20230311002258.852397-22-seanjc@google.com
[2] https://lore.kernel.org/all/Y2WB48kD0J4VGynX@google.com
[3] https://lore.kernel.org/all/Y1a1i9vbJ%2FpVmV9r@google.com

