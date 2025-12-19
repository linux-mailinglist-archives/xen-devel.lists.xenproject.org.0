Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C42C4CD12D1
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 18:37:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190954.1511149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWePM-0001IC-Jj; Fri, 19 Dec 2025 17:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190954.1511149; Fri, 19 Dec 2025 17:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWePM-0001G1-GU; Fri, 19 Dec 2025 17:36:52 +0000
Received: by outflank-mailman (input) for mailman id 1190954;
 Fri, 19 Dec 2025 17:36:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DMLK=6Z=flex--seanjc.bounces.google.com=3Lo1FaQYKCa8hTPcYRVddVaT.RdbmTc-STkTaaXhih.mTcegdYTRi.dgV@srs-se1.protection.inumbo.net>)
 id 1vWePL-0001Fv-0i
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 17:36:51 +0000
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [2607:f8b0:4864:20::64a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b37b2e9-dd01-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 18:36:48 +0100 (CET)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-29f2b45ecffso32499275ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 09:36:48 -0800 (PST)
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
X-Inumbo-ID: 4b37b2e9-dd01-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766165807; x=1766770607; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqnyJGm9t/ZyJN7mQeBjdnUbXeTdowYt1l4KyYLgPcE=;
        b=l4cLdnNUrOEIdsySHEYHih73wNDv88+5CQq6CX2xjipvmeLdnttQAAqjKAsjNfjUTC
         b9wF6w6Of4/Om1blslrneR+goqO4Z+CUPVxuYFCKV/zP/JBO9cNUb+nwGjhAb7UuY1Mw
         ykpDuMfWDe+iIjwsTMl0YZZP/nHT1aPJmh3hAGp1K3Hr8e1MC2dMOCIdlCJyo1/k3W11
         iGqlW6e7f22uLAUHR5v+syX7+xOejwMD7gj1tjadtEkS03nvLRt4cne7UW473lMklSE5
         OPq0JYPmQgZSB7pTM8AqWOC4zkFcCLnT7jDSsfERGgELbIe/vkzEjN3y5MMv3jm7wqjq
         AlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766165807; x=1766770607;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RqnyJGm9t/ZyJN7mQeBjdnUbXeTdowYt1l4KyYLgPcE=;
        b=WgmiXvfWusgU6L7K6R8mzFHVkXQA0wdlEYmoYxUjWFNlWuy4E0Kqa3V0gj8R0Uk5Ic
         pZlATiuJpCC6+wIu9TtGPZyhxbQf1ejp1xHzP8HCSATajXH+hjpEluSRQKuF2B+Q2xRI
         mf9093AjQGPFZjG2Nj+kw1oFiv4utRk37WKYC7JmjMOOs0tB3xhHIqvkWHGW5h8MKClf
         rYcUuBi0KrH7q4VaC7QZmqP2vSqTwpoHVXSFIeV9pHFkKja/ezmqV0f9mZPDJwnZBEjm
         831Tuv/Pvcbgb5uaRy/kHE2lQsLG2BSiGeTuCB1KdD4fcgF3R6TcAgt21+3dquRSvG9K
         HSBA==
X-Forwarded-Encrypted: i=1; AJvYcCVzPkJ9O24DV6Oc3VD72ZOJYv26xKeND+kEaFi4ZqLmVHqYRMbnVl3W849FTuMXvah2mtrxvItjUk0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1cT0SqxFdp/bZj8StxcUh41J1ZeO+DkEW4Mo9/Vw0+IhvjcYT
	ncGbNS9cCiwDQRLOWkOrg3Jbu0yVuv7d6xu5z6lRaFXWeoZyQe4dr0dreslnStfGMOWV/chfS0q
	UGaGxUQ==
X-Google-Smtp-Source: AGHT+IHQHE/zSpVReAa4QYKKE9L22G3Nm8CEtCKN+zptcqFuHVITJGNdcTVWwZJuDaA8gysKF1rlDI2aruk=
X-Received: from pldd12.prod.google.com ([2002:a17:902:c18c:b0:29e:fd13:927b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:fb0:b0:2a0:7f87:2347
 with SMTP id d9443c01a7336-2a2f2a536ebmr35477985ad.46.1766165806775; Fri, 19
 Dec 2025 09:36:46 -0800 (PST)
Date: Fri, 19 Dec 2025 09:36:45 -0800
In-Reply-To: <e2632ad6-6721-4697-a923-53b5bb0c9f0f@citrix.com>
Mime-Version: 1.0
References: <20251219010131.12659-1-ariadne@ariadne.space> <7C6C14C2-ABF8-4A94-B110-7FFBE9D2ED79@alien8.de>
 <aUV4u0r44V5zHV5f@google.com> <e2632ad6-6721-4697-a923-53b5bb0c9f0f@citrix.com>
Message-ID: <aUWNLUEme9FCUeAb@google.com>
Subject: Re: [PATCH] x86/CPU/AMD: avoid printing reset reasons on Xen domU
From: Sean Christopherson <seanjc@google.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Borislav Petkov <bp@alien8.de>, Ariadne Conill <ariadne@ariadne.space>, linux-kernel@vger.kernel.org, 
	mario.limonciello@amd.com, darwi@linutronix.de, sandipan.das@amd.com, 
	kai.huang@intel.com, me@mixaill.net, yazen.ghannam@amd.com, riel@surriel.com, 
	peterz@infradead.org, hpa@zytor.com, x86@kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, dave.hansen@linux.intel.com, xen-devel@lists.xenproject.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025, Andrew Cooper wrote:
> On 19/12/2025 4:09 pm, Sean Christopherson wrote:
> > On Fri, Dec 19, 2025, Borislav Petkov wrote:
> >> On December 19, 2025 1:01:31 AM UTC, Ariadne Conill <ariadne@ariadne.s=
pace> wrote:
> >>> Xen domU cannot access the given MMIO address for security reasons,
> >>> resulting in a failed hypercall in ioremap() due to permissions.
> > Why does that matter though?  Ah, because set_pte() assumes success, an=
d so
> > presumably the failed hypercall goes unnoticed and trying to access the=
 MMIO
> > #PFs due to !PRESENT mapping.
> >
> >>> Fixes: ab8131028710 ("x86/CPU/AMD: Print the reason for the last rese=
t")
> >>> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
> >>> Cc: xen-devel@lists.xenproject.org
> >>> Cc: stable@vger.kernel.org
> >>> ---
> >>> arch/x86/kernel/cpu/amd.c | 6 ++++++
> >>> 1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
> >>> index a6f88ca1a6b4..99308fba4d7d 100644
> >>> --- a/arch/x86/kernel/cpu/amd.c
> >>> +++ b/arch/x86/kernel/cpu/amd.c
> >>> @@ -29,6 +29,8 @@
> >>> # include <asm/mmconfig.h>
> >>> #endif
> >>>
> >>> +#include <xen/xen.h>
> >>> +
> >>> #include "cpu.h"
> >>>
> >>> u16 invlpgb_count_max __ro_after_init =3D 1;
> >>> @@ -1333,6 +1335,10 @@ static __init int print_s5_reset_status_mmio(v=
oid)
> >>> 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
> >>> 		return 0;
> >>>
> >>> +	/* Xen PV domU cannot access hardware directly, so bail for domU ca=
se */
> > Heh, Xen on Zen crime.
> >
> >>> +	if (cpu_feature_enabled(X86_FEATURE_XENPV) && !xen_initial_domain()=
)
> >>> +		return 0;
> >>> +
> >>> 	addr =3D ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value)=
);
> >>> 	if (!addr)
> >>> 		return 0;
> >> Sean, looka here. The other hypervisor wants other checks.
> >>
> >> Time to whip out the X86_FEATURE_HYPERVISOR check.
> > LOL, Ariadne, be honest, how much did Boris pay you?  :-D
> >
> > Jokes aside, I suppose I'm fine adding a HYPERVISOR check, but at the s=
ame time,
> > how is this not a Xen bug?  Refusing to create a mapping because the VM=
 doesn't
> > have a device defined at a given GPA is pretty hostile behavior for a h=
ypervisor.
>
> This is a Xen PV guest.=C2=A0 No SVM/VT-x.
>=20
> A PV Guest (by it's contract with Xen) cannot create mappings to host
> physical addresses it doesn't own.

Huh, assuming wiki.xenproject.org[*] can be trusted, TIL Xen PV has no noti=
on
of a virtual motherboard/chipset:

  In a paravirtualized VM, guests run with fully paravirtualized disk and
  network interfaces; interrupts and timers are paravirtualized; there is n=
o
  emulated motherboard or device bus; guests boot directly into the kernel
  in the mode the kernel wishes to run in (32-bit or 64-bit), without needi=
ng
  to start in 16-bit mode or go through a BIOS; all privileged instructions
  are replaced with paravirtualized equivalents (hypercalls), and access to
  the page tables was paravirtualized as well.

[*] https://wiki.xenproject.org/wiki/Understanding_the_Virtualization_Spect=
rum

> Xen rejects the attempt, and Linux is ignoring the failure in this case.=
=C2=A0
> This has been ABI for 25 years.

Heh, I suspected as much.

> From a more practical point of view, because guests can read their own
> pagetables, Xen can't swap the requested PTE for safe alternative to
> trap the MMIO access, because that violates Linux's model of what's
> mapped in this position.

That all makes sense, but shouldn't the inability to ioremap() chipset MMIO=
 be
addressed in ioremap()?  E.g. after poking around a bit, commit 6a92b11169a=
6
("x86/EISA: Don't probe EISA bus for Xen PV guests") fudged around the same
underlying flaw in eisa_bus_probe().  Ha!  Though maybe that's no longer ne=
cessary
as of 80a4da05642c ("x86/EISA: Use memremap() to probe for the EISA BIOS si=
gnature")?

Anyways, I'm still opposed to using HYPERVISOR.  E.g. given that Dom0 can a=
pparently
access host MMIO just fine, and that it's perfectly reasonable for a KVM-ba=
sed VMM
to emulate the chipset, assuming a guest doesn't have access to some asset =
is simply
wrong.

But rather than play whack-a-mole, can't we deal with the ignore PTE write =
failures
in ioremap()?  E.g. something like this?

diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 12c8180ca1ba..b7e2c752af1d 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -29,6 +29,8 @@
 #include <asm/memtype.h>
 #include <asm/setup.h>
=20
+#include <xen/xen.h>
+
 #include "physaddr.h"
=20
 /*
@@ -301,6 +303,20 @@ __ioremap_caller(resource_size_t phys_addr, unsigned l=
ong size,
        if (ioremap_page_range(vaddr, vaddr + size, phys_addr, prot))
                goto err_free_area;
=20
+       /*
+        * Verify the range was actually mapped when running as a Xen PV Do=
mU
+        * guest.  Xen PV doesn't emulate a virtual chipset/motherboard, an=
d
+        * disallows DomU from mapping host physical addresses that the dom=
ain
+        * doesn't own.  Unfortunately, the PTE APIs assume success, and so
+        * Xen's rejection of the mapping is ignored.
+        */
+       if (xen_pv_domain() && !xen_initial_domain()) {
+               int level;
+
+               if (!lookup_address(vaddr, &level))
+                       goto err_free_area;
+       }
+
        ret_addr =3D (void __iomem *) (vaddr + offset);
        mmiotrace_ioremap(unaligned_phys_addr, unaligned_size, ret_addr);

