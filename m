Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC22CD12E3
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 18:38:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190968.1511158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWeR1-0001zG-0U; Fri, 19 Dec 2025 17:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190968.1511158; Fri, 19 Dec 2025 17:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWeR0-0001xN-U9; Fri, 19 Dec 2025 17:38:34 +0000
Received: by outflank-mailman (input) for mailman id 1190968;
 Fri, 19 Dec 2025 17:38:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OW9g=6Z=flex--seanjc.bounces.google.com=3lo1FaQYKCRkH3zC815DD5A3.1DBM3C-23K3AA7HIH.M3CEGD831I.DG5@srs-se1.protection.inumbo.net>)
 id 1vWeQz-0001rO-99
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 17:38:33 +0000
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [2607:f8b0:4864:20::449])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8915cf01-dd01-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 18:38:32 +0100 (CET)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-7b80de683efso3504863b3a.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 09:38:32 -0800 (PST)
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
X-Inumbo-ID: 8915cf01-dd01-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766165911; x=1766770711; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbOhKn22cTFMoKpf/GXkxISQsKfNfALH2jWSUuo5nak=;
        b=VTSgp1GLn6DRHEXBum3DoLOvCxDO4CMLX2a1P9SEWRVCT3Hi8vJNuBFq+V5lA+BXN3
         dgFNdlEE93zOF3cBW2Pw6aEcA3AvyqirxlCkpAun/mHGufJWOt/0i4KOtFWpzeOrXefT
         5HlMcDvYBjb+WudtcJ0IhVx3MpEln8zILlFpO4toAU0YvQ2L2iFZCtAp1IcyLzud8uD8
         8pSs44+dhKdoJ35aHhIkgbYGGPHsgleO90zGGtpkykQY8GWLoJvORzibEIzZIqciXxUZ
         cw/gGZw9g9gs5wQMUCn+clsfKa5xLUPd4YjBKCn875INd5L2K4LkfDUoL3HOxCET+OPe
         zgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766165911; x=1766770711;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kbOhKn22cTFMoKpf/GXkxISQsKfNfALH2jWSUuo5nak=;
        b=k2pJbzofXMRln3oui2xUPdbD6LmdlfdYYabqYgdV6K5w8rPC19W7/vZ7vzGy4qHduH
         PFmiLgXCzOFTlijnA2IqQZL9caxMa74mNsqTayLlNtjRrv5iOqCKgDbdY0jyFWgXjdKW
         0kyDkzKm0wxMA+V9OaZ/iCU3qrFW5vYuJW1sNHWF5qT6zdWl1/QYGmIt6ZDqKMyvGThm
         at9DE4rtGpMiBiTaS3EONWz04i2NirBKvOgUwys5IFe85z3LUSDoGx/eG4W10KuWWyWw
         2Q9Ai2hKhTQUHJNg9UDNr4i3IZAegjMGzjoWx8/b4R0V1/dMTziR7xSoMttWXXOmV933
         cm9A==
X-Forwarded-Encrypted: i=1; AJvYcCU3ffDb15S6tAj3OODIvUf1HY8utCuSRxF+e+Z4ojpUy/NFZU8rQWfbtDINruI/M8xJR3mxuZMmePU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQZzMdb9I2R9oqnZ26lNW5h1xiZxJQO5isyRKT9b4InRrb1XMN
	cBsjuh5JBfA8Y1yHhGRNIgTfy+JBGvZ0ioGToLMRGPyXECT7hQ3LzNbjSOIJ4Ktn+ZOTNA48wq6
	Gb8lYMQ==
X-Google-Smtp-Source: AGHT+IFwzWgtPptIOyQJLby5S982+3QC2rN4V2KVy1J/lj/jLP6cxRNrCIT8QnhPtZST1lAtZV6zpA10OhY=
X-Received: from pfbfb38.prod.google.com ([2002:a05:6a00:2da6:b0:76b:f0d4:ac71])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:140e:b0:7ff:885f:9c2a
 with SMTP id d2e1a72fcca58-7ff885fa2d7mr3264079b3a.12.1766165910740; Fri, 19
 Dec 2025 09:38:30 -0800 (PST)
Date: Fri, 19 Dec 2025 09:38:29 -0800
In-Reply-To: <dbe68678-0bc4-483f-aef3-e4c7462bcaff@vates.tech>
Mime-Version: 1.0
References: <20251219010131.12659-1-ariadne@ariadne.space> <dbe68678-0bc4-483f-aef3-e4c7462bcaff@vates.tech>
Message-ID: <aUWNlTAmbSTXsBDE@google.com>
Subject: Re: [PATCH] x86/CPU/AMD: avoid printing reset reasons on Xen domU
From: Sean Christopherson <seanjc@google.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Ariadne Conill <ariadne@ariadne.space>, linux-kernel@vger.kernel.org, 
	mario.limonciello@amd.com, darwi@linutronix.de, sandipan.das@amd.com, 
	kai.huang@intel.com, me@mixaill.net, yazen.ghannam@amd.com, riel@surriel.com, 
	peterz@infradead.org, hpa@zytor.com, x86@kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	xen-devel@lists.xenproject.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025, Teddy Astie wrote:
> Le 19/12/2025 =C3=A0 02:04, Ariadne Conill a =C3=A9crit=C2=A0:
> > Xen domU cannot access the given MMIO address for security reasons,
> > resulting in a failed hypercall in ioremap() due to permissions.
> >
> > Fixes: ab8131028710 ("x86/CPU/AMD: Print the reason for the last reset"=
)
> > Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
> > Cc: xen-devel@lists.xenproject.org
> > Cc: stable@vger.kernel.org
> > ---
> >   arch/x86/kernel/cpu/amd.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
> > index a6f88ca1a6b4..99308fba4d7d 100644
> > --- a/arch/x86/kernel/cpu/amd.c
> > +++ b/arch/x86/kernel/cpu/amd.c
> > @@ -29,6 +29,8 @@
> >   # include <asm/mmconfig.h>
> >   #endif
> >
> > +#include <xen/xen.h>
> > +
> >   #include "cpu.h"
> >
> >   u16 invlpgb_count_max __ro_after_init =3D 1;
> > @@ -1333,6 +1335,10 @@ static __init int print_s5_reset_status_mmio(voi=
d)
> >   	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
> >   		return 0;
> >
> > +	/* Xen PV domU cannot access hardware directly, so bail for domU case=
 */
> > +	if (cpu_feature_enabled(X86_FEATURE_XENPV) && !xen_initial_domain())
> > +		return 0;
> > +
> >   	addr =3D ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value)=
);
> >   	if (!addr)
> >   		return 0;
>=20
> Such MMIO only has a meaning in a physical machine, but the feature
> check is bogus as being on Zen arch is not enough for ensuring this.
>=20
> I think this also translates in most hypervisors with odd reset codes
> being reported; without being specific to Xen PV (Zen CPU is
> unfortunately not enough to ensuring such MMIO exists).
>=20
> Aside that, attempting unexpected MMIO in a SEV-ES/SNP guest can cause
> weird problems since they may not handled MMIO-NAE and could lead the
> hypervisor to crash the guest instead (unexpected NPF).

IMO, terminating an SEV-ES+ guest because it accesses an unknown MMIO range=
 is
unequivocally a hypervisor bug.  The right behavior there is to configure a
reserved NPT entry to reflect the access into the guest as a #VC.

