Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 375A8AA08E1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 12:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971925.1360327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9iVO-0005XD-D7; Tue, 29 Apr 2025 10:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971925.1360327; Tue, 29 Apr 2025 10:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9iVO-0005Te-AB; Tue, 29 Apr 2025 10:48:02 +0000
Received: by outflank-mailman (input) for mailman id 971925;
 Tue, 29 Apr 2025 10:48:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b72w=XP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u9iVN-0005TW-Gm
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 10:48:01 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b518ef9-24e7-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 12:48:00 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ace3b03c043so900385866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 03:48:00 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ace6e4e6a05sm768483566b.57.2025.04.29.03.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 03:47:59 -0700 (PDT)
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
X-Inumbo-ID: 6b518ef9-24e7-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745923680; x=1746528480; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fpUPeXQ39OaPBBilG6YqHmYqtMU/zIZTpYEJL/AXnao=;
        b=nOw5opQRWWL0vZR2CtNyL2nJ/UQ2TsgkGEVdZGHSo/tSQ/tob8/FOqmHZbkY9KJWVa
         FvX9cIRGKViDOOmm+H4pIfk72J/1itvvAoz33IYQulAZsqdHyq2Ru+tsHaANF21vmo/w
         O+ru+r3at+s3Pk49E72U8dxXv0TDrWzZIesrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745923680; x=1746528480;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpUPeXQ39OaPBBilG6YqHmYqtMU/zIZTpYEJL/AXnao=;
        b=eh6CZeBfr563OfkjDLsClsT2EYNZHWAG3OZeHYRALhvtDMQH3+QagxPQXJdK8DwObM
         /1BIk4UvL3D2OJk1cSzoRKNNQk2702IYcfnpvcm/TUlBxHaOuOxXqVkSJGVsGKBjioLc
         IFe6GjJtELtt3y0V0U0c9PSRc/09IsII4xppHzoKpg37UMMynXQRvh88Pz8MVVbYZxlY
         mmMqQIi/fr40hXEpZEGMlnpD/hGqZRnSWJdvBZEoWYlJ3Ca3qTdz734LOpS9VWu2I4GS
         ILvJk8P8A85m+Ri0xtoWqCkyJfW7SdsQhpSAwY322WCiQsUTWUY0mrfJuUNEgnGQ4LOa
         h69g==
X-Forwarded-Encrypted: i=1; AJvYcCVEWS7V3MZt5+RwKzZLaelYPw8+dvJoLUHi3hp/Xb7BPLKYXBO2czQqLszXmSBZK4ROhTRe+BpLkKI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHfYpOyH+StSSirrh6bflFOmPJnJIb6YWRhJxcjvaSPw+VYzP7
	qnySUdswbfxnAZrgI326OgrMqX4aFy7dRY+lq8jWw1NqltzezYA79TjP8P9j0BBxrUE9XbFbmp8
	f
X-Gm-Gg: ASbGncvtXGVtPMsL96jMShqZR2nlQudKj95exvROmyvSpyOlLAy0qPpmP6bms8w32VF
	bQMwjqXh9xZsC0OqewiJoPty0o7KDkOXcQ0RwscX9mw+MHkkMHqIvWq6PygoL6nz6CgpqzAlDJ1
	cVIBIky7PGuXS9140kn9n4/vKbu9bdGevNzsi9cccBHo0v3HowTqc3RQuK9zLIdz/L0Q2NCnqiU
	u2yk1kaDT3vij3Rz6py8q6oS60/EN+JA7ateg6yp1GG9i0mDiP2OfTR49xnUCDe9NRhu56mxlyY
	tcIKHEHo08ytu0xoyT+OfMgU9pTatFWZlRq4AveYHviw2SauiWQ2uZaw
X-Google-Smtp-Source: AGHT+IF/rItJaKXqEquV9gU9YwM3ZYy4hPl/V8fGTs5masnP1DL2BHrNexx4ZMrkIAk0jYWbnLp8wA==
X-Received: by 2002:a17:907:7f0f:b0:ac3:446d:142 with SMTP id a640c23a62f3a-acec84b8840mr225568866b.2.1745923680017;
        Tue, 29 Apr 2025 03:48:00 -0700 (PDT)
Date: Tue, 29 Apr 2025 12:47:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/4] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
Message-ID: <aBCuXtIqR_HLL1mu@macbook.lan>
References: <20250429101252.50071-1-roger.pau@citrix.com>
 <20250429101252.50071-3-roger.pau@citrix.com>
 <42b052b7-535b-4697-86d1-bae857f6ccad@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42b052b7-535b-4697-86d1-bae857f6ccad@suse.com>

On Tue, Apr 29, 2025 at 12:29:08PM +0200, Jan Beulich wrote:
> On 29.04.2025 12:12, Roger Pau Monne wrote:
> > The current logic to handle accesses to MMIO pages partially read-only is
> > based on the (now removed) logic used to handle accesses to the r/o MMCFG
> > region(s) for PVH v1 dom0.  However that has issues when running on AMD
> > hardware, as in that case the guest linear address that triggered the fault
> > is not provided as part of the VM exit.  This caused
> > mmio_ro_emulated_write() to always fail before calling
> > subpage_mmio_write_emulate() when running on AMD and called from an HVM
> > context.
> > 
> > Take a different approach and convert the handling of partial read-only
> > MMIO page accesses into an HVM MMIO ops handler, as that's the more natural
> > way to handle this kind of emulation for HVM domains.
> > 
> > This allows getting rid of hvm_emulate_one_mmio() and it's single call site
> > in hvm_hap_nested_page_fault().  As part of the fix r/o MMIO accesses are
> > now handled by handle_mmio_with_translation(), re-using the same logic that
> > was used for other read-only types part of p2m_is_discard_write().  The
> > usage of emulation for faulting p2m_mmio_direct types is limited to
> > addresses in the r/o MMIO range. The page present check is dropped as type
> > p2m_mmio_direct must have the present bit set in the PTE.
> > 
> > Note a small adjustment is needed to the `pf-fixup` dom0 PVH logic: avoid
> > attempting to fixup faults resulting from write accesses to read-only MMIO
> > regions, as handling of those accesses is now done by handle_mmio().
> > 
> > Fixes: 33c19df9a5a0 ('x86/PCI: intercept accesses to RO MMIO from dom0s in HVM containers')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with two nits:
> 
> > --- /dev/null
> > +++ b/xen/arch/x86/hvm/mmio.c
> > @@ -0,0 +1,125 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * MMIO related routines.
> > + *
> > + * Copyright (c) 2025 Cloud Software Group
> > + */
> > +
> > +#include <xen/io.h>
> > +#include <xen/mm.h>
> > +
> > +#include <asm/p2m.h>
> > +
> > +static int cf_check subpage_mmio_accept(struct vcpu *v, unsigned long addr)
> > +{
> > +    p2m_type_t t;
> > +    mfn_t mfn = get_gfn_query_unlocked(v->domain, PFN_DOWN(addr), &t);
> > +
> > +    return !mfn_eq(mfn, INVALID_MFN) && t == p2m_mmio_direct &&
> > +           subpage_mmio_find_page(mfn);
> > +}
> > +
> > +/*
> > + * The guest has read access to those regions, and consequently read accesses
> > + * shouldn't fault.  However read-modify-write operations may take this path,
> > + * so handling of reads is necessary.
> > + */
> > +static int cf_check subpage_mmio_read(
> > +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
> > +{
> > +    struct domain *d = v->domain;
> > +    unsigned long gfn = PFN_DOWN(addr);
> > +    p2m_type_t t;
> > +    mfn_t mfn;
> > +    struct subpage_ro_range *entry;
> > +    volatile void __iomem *mem;
> > +
> > +    *data = ~0UL;
> > +
> > +    if ( !len || len > 8 || len & (len - 1) || !IS_ALIGNED(addr, len) )
> 
> The & expression wants parenthesizing against the ||s.
> 
> > +    {
> > +        gprintk(XENLOG_ERR,
> > +                "ignoring unaligned read to r/o MMIO subpage %#lx size %u\n",
> 
> It's not just unaligned, but also oversized or zero-size now. Maybe better
> drop the word?
> 
> Both similarly applicable to the write path.

Hm, yes, I've failed to update this when expanding the checks, thanks
for noticing.  I agree that dropping "unaligned" seems like the best
option.

Thanks, Roger.

