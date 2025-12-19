Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF7CD0C04
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 17:10:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190839.1511089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWd2z-0004HH-JB; Fri, 19 Dec 2025 16:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190839.1511089; Fri, 19 Dec 2025 16:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWd2z-0004F9-GI; Fri, 19 Dec 2025 16:09:41 +0000
Received: by outflank-mailman (input) for mailman id 1190839;
 Fri, 19 Dec 2025 16:09:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mxbk=6Z=flex--seanjc.bounces.google.com=3vXhFaQYKCRYE0w95y2AA270.yA8J09-z0H0774EFE.J09BDA50yF.AD2@srs-se1.protection.inumbo.net>)
 id 1vWd2x-0004F3-Tt
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 16:09:39 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bbab737-dcf5-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 17:09:34 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-34cc88eca7eso3312741a91.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 08:09:34 -0800 (PST)
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
X-Inumbo-ID: 1bbab737-dcf5-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766160573; x=1766765373; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WvkkN/JVfJ0/HpY6p1MGYv4ARJvfILZSEbErMl1MA/4=;
        b=l6dEehs9riv2W9mfDFD4qn2Qi3/CWC6kejqEPn6ZaqcGtkHSwgbcGDE6kxdvqQYHQG
         wGMhIAbD7o6ee4YGG6tVISgwOBALb+jHzM4f73gzPGsXWIbA/ioCnZOQ7qXISYSaq9w/
         5kqd4RJM9TBbdTqDKgyStrGUbqyxj2wkgbrOCCtAT7Vytps6zAO9TPOhlAJzjhHX1v82
         SzY8WwuN2HCrPl29SFYO26yv/k0WVmV+zq5xPQ956DgUm0r8ZheoUOynZYc5SBkzXGYc
         TZlf0ZoTjGa/GEzx8kJLdt4/r4QqmBmUVB/elZ66NwXMvB4IQg+k29Fl51ywWGaUFe3G
         UK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766160573; x=1766765373;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WvkkN/JVfJ0/HpY6p1MGYv4ARJvfILZSEbErMl1MA/4=;
        b=rnW8Z/yQ8/P9KA/+oyyW2olMFOy8I8R3MtJHOFceWeC2sn97yafYpeqnexszhKdUGE
         i+TZtxkbhd7H+ya1tFBEhDh6j+aY/JA2L8PncH3EA7Nn+NZk4Fjjrm42zmjouX+VO0wy
         wEI0xceW/4fEmcyeiPpkBTWv3S+6FUKGgc7Yp7ozLTNYR4EVZ/7MdMD1/4WKB2kq/no+
         sUZuvC1DebFvXXZbiMkxNsdrstIn4HyNICrTpclC/hW0bpJV64gAdX+Ba1kNmvyqKMew
         2GEkH2IcE5HSnvIweIJv/fO7VR8E9r7Pydff0RmOmCkVMij5CB8WiGSq0snrO8pI7uW8
         QeQw==
X-Forwarded-Encrypted: i=1; AJvYcCWvQnpMu4UryheJX7WNJYc9nNmsbBvUlSiojdfKLxP5g5rTq6AawAcBwBj/t3DQ2r2bGzfO7nfWD48=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyK2DE9Rh7T9CJqAlPRI0alwYj5PoGH5Onbg9IwZtbN07fZj07y
	zlFJcrXDfbg89HrJ91uH+TTQI8bDvh7fFjH2m6CM6rAWrCLSHY0e8ykaHEN3CfrvrX/DabbUG00
	JDOZWCA==
X-Google-Smtp-Source: AGHT+IFi0EOmNsJLwNWNd+F7YnuERxayE0iVrblPiIXpt/oQKEFPGSZPOu2wHmeTgNma9jT1j9/KpGT8+c8=
X-Received: from pjso12.prod.google.com ([2002:a17:90a:c08c:b0:34c:6892:136f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f90:b0:340:c261:f9f3
 with SMTP id 98e67ed59e1d1-34e92130102mr3375788a91.14.1766160573108; Fri, 19
 Dec 2025 08:09:33 -0800 (PST)
Date: Fri, 19 Dec 2025 08:09:31 -0800
In-Reply-To: <7C6C14C2-ABF8-4A94-B110-7FFBE9D2ED79@alien8.de>
Mime-Version: 1.0
References: <20251219010131.12659-1-ariadne@ariadne.space> <7C6C14C2-ABF8-4A94-B110-7FFBE9D2ED79@alien8.de>
Message-ID: <aUV4u0r44V5zHV5f@google.com>
Subject: Re: [PATCH] x86/CPU/AMD: avoid printing reset reasons on Xen domU
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Ariadne Conill <ariadne@ariadne.space>, linux-kernel@vger.kernel.org, 
	mario.limonciello@amd.com, darwi@linutronix.de, sandipan.das@amd.com, 
	kai.huang@intel.com, me@mixaill.net, yazen.ghannam@amd.com, riel@surriel.com, 
	peterz@infradead.org, hpa@zytor.com, x86@kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, dave.hansen@linux.intel.com, xen-devel@lists.xenproject.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Dec 19, 2025, Borislav Petkov wrote:
> On December 19, 2025 1:01:31 AM UTC, Ariadne Conill <ariadne@ariadne.space> wrote:
> >Xen domU cannot access the given MMIO address for security reasons,
> >resulting in a failed hypercall in ioremap() due to permissions.

Why does that matter though?  Ah, because set_pte() assumes success, and so
presumably the failed hypercall goes unnoticed and trying to access the MMIO
#PFs due to !PRESENT mapping.

> >Fixes: ab8131028710 ("x86/CPU/AMD: Print the reason for the last reset")
> >Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
> >Cc: xen-devel@lists.xenproject.org
> >Cc: stable@vger.kernel.org
> >---
> > arch/x86/kernel/cpu/amd.c | 6 ++++++
> > 1 file changed, 6 insertions(+)
> >
> >diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
> >index a6f88ca1a6b4..99308fba4d7d 100644
> >--- a/arch/x86/kernel/cpu/amd.c
> >+++ b/arch/x86/kernel/cpu/amd.c
> >@@ -29,6 +29,8 @@
> > # include <asm/mmconfig.h>
> > #endif
> > 
> >+#include <xen/xen.h>
> >+
> > #include "cpu.h"
> > 
> > u16 invlpgb_count_max __ro_after_init = 1;
> >@@ -1333,6 +1335,10 @@ static __init int print_s5_reset_status_mmio(void)
> > 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
> > 		return 0;
> > 
> >+	/* Xen PV domU cannot access hardware directly, so bail for domU case */

Heh, Xen on Zen crime.

> >+	if (cpu_feature_enabled(X86_FEATURE_XENPV) && !xen_initial_domain())
> >+		return 0;
> >+
> > 	addr = ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value));
> > 	if (!addr)
> > 		return 0;
> 
> Sean, looka here. The other hypervisor wants other checks.
>
> Time to whip out the X86_FEATURE_HYPERVISOR check.

LOL, Ariadne, be honest, how much did Boris pay you?  :-D

Jokes aside, I suppose I'm fine adding a HYPERVISOR check, but at the same time,
how is this not a Xen bug?  Refusing to create a mapping because the VM doesn't
have a device defined at a given GPA is pretty hostile behavior for a hypervisor.

