Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1FA7EA2D9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 19:30:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631956.985744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bha-0003e2-6A; Mon, 13 Nov 2023 18:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631956.985744; Mon, 13 Nov 2023 18:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2bha-0003bl-3P; Mon, 13 Nov 2023 18:30:26 +0000
Received: by outflank-mailman (input) for mailman id 631956;
 Mon, 13 Nov 2023 18:30:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yu24=G2=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1r2bhY-0003aS-Un
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 18:30:25 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3c843c9-8252-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 19:30:21 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 849C740E0191; 
 Mon, 13 Nov 2023 18:30:17 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id vIR0tkFfDk7P; Mon, 13 Nov 2023 18:30:15 +0000 (UTC)
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B6D7140E0171;
 Mon, 13 Nov 2023 18:29:52 +0000 (UTC)
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
X-Inumbo-ID: b3c843c9-8252-11ee-9b0e-b553b5be7939
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1699900215; bh=QGUJ2C4j4YRZSL/U1xa+aaW+qjnM9Ayip2GHUoCQbrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=URdSOo5atytuczMmbDY6wONUqVHGwPzBY+Ft6r7t2wqWxYpmjhb8q5WUpOi/bXSA5
	 fJ5TW/gAX2J5Fg3Yrixa37rJaTWaX2xG2GP2Srly/D51K8bIlKWqgqEj1TFiEGKM6B
	 MDKQ3/YghE54YThudVhfA3Jm4PDiKtKqksPmrK+PeJ8FVtgBtNckL3zManei+Pyi1f
	 e3dsFQBcbGTQsF2fhzV/KYCdRhzBSc/UfuYV9q6kZFEK9XxiacsmrtEVwSIQQ6sge8
	 1cjKTmrp4l91XDbS3OkHDBCSMZSAaB8rhMsfg0Zkr8yFHr+jualMdcmrmSLxbxpAMZ
	 gXkKKAduMrUEw3/crCu69g1FUTrLbM+aBp8q5qMu+mb+WVawknTYPZ2PrJzaSLOMzW
	 eI2IleRus14qCFdmSYWN32apAmJBpfkEFdkSEeb44MzcNJ8qVuttPQIBmxH0O9j/17
	 qx2UYOK2bVXxXs8ovE3SvECy+JZz2HeNXN3hh5lL7l0qOQ8EiRVCoXpUT7220lntyq
	 4YAZ2HblHaiSC/1DRV/ic58WOM/BHcuaqykTtiPq+Y5r8Y/7iW+yg7Fd6v/9I/X0jl
	 rL9BIJh+KcXziVjf09XFcoI+uWyBh9S5dBkFNlCLgPKN003pXaJ13c3sMBO5iB4cmR
	 hDLQpgt7qlF5RnhXKZicYwPs=
Date: Mon, 13 Nov 2023 19:29:47 +0100
From: Borislav Petkov <bp@alien8.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org, tglx@linutronix.de,
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
	luto@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	peterz@infradead.org, jgross@suse.com, ravi.v.shankar@intel.com,
	mhiramat@kernel.org, andrew.cooper3@citrix.com,
	jiangshanlai@gmail.com, nik.borisov@suse.com
Subject: Re: [PATCH v12 19/37] x86/fred: Update MSR_IA32_FRED_RSP0 during
 task switch
Message-ID: <20231113182947.GEZVJrGyMS4KzQafIK@fat_crate.local>
References: <20231003062458.23552-1-xin3.li@intel.com>
 <20231003062458.23552-20-xin3.li@intel.com>
 <20231113093742.GAZVHuZk9CGTRIfAWb@fat_crate.local>
 <3BFEBDE8-6F90-43A5-AE34-07B0ED0CAAAE@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3BFEBDE8-6F90-43A5-AE34-07B0ED0CAAAE@zytor.com>

On Mon, Nov 13, 2023 at 12:36:04PM -0500, H. Peter Anvin wrote:
> A resource cannot be consumed after the value has been written; this
> is the only necessary level of serialization, equivalent to, say, RAX.

Lemme see if I understand this correctly using this context as an
example: after this MSR_IA32_FRED_RSP0 write, any FRED events determined
to be delivered to level 0 will use this new task stack ptr?

And since the new task is not running yet and the old one isn't running
either, we're fine here. So the "serialization point" I was talking
about above is bollocks.

Close? :)

> A serializing instruction stops the entire pipeline until everything
> has retired and any stores have become globally visible.

Right, we don't need that here.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

