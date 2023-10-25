Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D45147D6D91
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 15:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622891.970128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveBr-0003XR-Vm; Wed, 25 Oct 2023 13:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622891.970128; Wed, 25 Oct 2023 13:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveBr-0003U7-Sp; Wed, 25 Oct 2023 13:44:55 +0000
Received: by outflank-mailman (input) for mailman id 622891;
 Wed, 25 Oct 2023 13:44:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KNSz=GH=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1qveBq-0003T0-Ee
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 13:44:54 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac25864e-733c-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 15:44:52 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8D95A40E00B3; 
 Wed, 25 Oct 2023 13:44:50 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Fc0bnT_9t_Uq; Wed, 25 Oct 2023 13:44:49 +0000 (UTC)
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6C1F840E0187;
 Wed, 25 Oct 2023 13:44:30 +0000 (UTC)
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
X-Inumbo-ID: ac25864e-733c-11ee-98d5-6d05b1d4d9a1
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1698241488; bh=+ieImtZGj+VOp5ccDeztXRroa/BoBO+stfynN77x4s4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMcAKbyUkyhuqj1UFc9ljgQxXx/4iDnowTXeq7KTMybgZzdM7S0yqlfMFwMNQogK+
	 o7cds6WEPJevCOXRK3/plplccqOSImH8RhAjRDu+ivVcaAoc4+flNZBJ7P9p8ExOz9
	 eE6xO9TRFbtCyPrNWN1aMmrvTXdra/rLEIhKFMcK+Z4FWklW+46Mr9NfRFTWdx442C
	 vQf0ziYnpiAejiwLDVDqN/3skD2n8Z8VmLa5GFnLcfvXxT/EIk4OpvgDUK4Kw/5CU+
	 2eZJh92QixzUyta0Vcn51qj3YFDBJbP1Qu2fLKY1Nqc3iTmCfvIZIa63Fmx8KRJAyb
	 aGPCeBmtg5fkgb82mRF6wA3bM6IXyjEVs4QQm2Pare6nAha+WmH3QeCz+RSlhdN7iH
	 cYkUWvfPzT8EspK1cwlTD6AHy7W2Zz0PYeC/aRQuiBN0ts4jvY6jpTRaJ+4Ak0MBBf
	 dMe+r6HUKUPf5a8xS9nhwlgsmk7RaIIsNG35ykeiNGOJd8Ktxewx9K0xkXwYuSHMjR
	 TGBdHsXswCUnMdLud8l56yK+te3+72BH2EL+90wue8aqWKUjRW+6AZDoIcsAvCPf0L
	 L/HnqzY/x2fUdh7331lw3NQ5alr6ljA/L+9+f8+l5oeP3Xb7gR68t6Z+R0JI3jOSZr
	 TgkiOe1BkQgz8i9OugTPbVGQ=
Date: Wed, 25 Oct 2023 15:44:25 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ajay Kaher <akaher@vmware.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 1/5] x86/paravirt: move some functions and defines to
 alternative
Message-ID: <20231025134425.GEZTkbua5w0bI2GQlP@fat_crate.local>
References: <20231019091520.14540-1-jgross@suse.com>
 <20231019091520.14540-2-jgross@suse.com>
 <20231025103402.GBZTjvGse9c0utZGO0@fat_crate.local>
 <fde7ffdd-4d12-4821-ac51-e67e65637111@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fde7ffdd-4d12-4821-ac51-e67e65637111@suse.com>

On Wed, Oct 25, 2023 at 03:31:07PM +0200, Juergen Gross wrote:
> There is
> 
> #define nop() asm volatile ("nop")
> 
> in arch/x86/include/asm/special_insns.h already.

Then call it "nop_func" or so.

> It might not be needed now, but are you sure we won't need it in future?

No, I'm not.

What I'm sure of is: stuff should be added to the kernel only when
really needed. Not in the expectation that it might potentially be
needed at some point.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

