Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47510836459
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 14:20:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669880.1042356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuDM-00062O-IS; Mon, 22 Jan 2024 13:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669880.1042356; Mon, 22 Jan 2024 13:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuDM-0005zr-FA; Mon, 22 Jan 2024 13:19:48 +0000
Received: by outflank-mailman (input) for mailman id 669880;
 Mon, 22 Jan 2024 13:19:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WAGQ=JA=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1rRuDL-0005yT-KT
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 13:19:47 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8132157-b928-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 14:19:44 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0AA1E40E0177; 
 Mon, 22 Jan 2024 13:19:42 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id kKFjKwbVE80b; Mon, 22 Jan 2024 13:19:40 +0000 (UTC)
Received: from zn.tnic (pd953099d.dip0.t-ipconnect.de [217.83.9.157])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 897B840E01B2;
 Mon, 22 Jan 2024 13:19:16 +0000 (UTC)
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
X-Inumbo-ID: e8132157-b928-11ee-9b0f-b553b5be7939
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1705929579; bh=O/+tvyIi7hu2G39Na79EAwIAhYkxG5TR/huFmkNcn9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1ufgytbqAeKU/bbx1LpJre3vS6601/SVnnwLpFjXNGMTjPY9Nm+A+yHTatEKvsrn
	 jKCRF9Ct9kuq2WaIvEZudPxuW80aQ6sV2DEgv5x5w2nNd1gm+orAggr15hPXn9LnTV
	 cUfVXHwd6vGk+xfoE0ZhIIDM7KLxFhpAn9H/ju/pxuRmHrVBnfrxOWbrue3jllAb9r
	 3Ubo8g5GoprkmY0JAoNQ/3/1gO3n8x/H3xEyXKlDPiMSZqF9LxfuaMxSF9QRFcPajr
	 8NJF5vEyW9gUmzV79jzEDWm0ZuQYIjoELZ3xVbonpik5sMvDXxAiU/QiX8bykQP7Kc
	 Cw2GHvMV759VKo5cDPP2wPZ9ll2LNdCHOaMqMNDZ39c2R8gi0mtu6DPMMNFiHbF3Yp
	 2urrXZCC1l8c5a3GmCU6TZPaFSSWTC+ELzhYkcSE3p4AoKMYNd4y7fjZB858BaEaEz
	 ziUGfyBu2TlOKwvD/W2xUhehBQpzfY5muWbfrm2iSswSPS/3uAfPffHr4k9lTsP+oE
	 BgFJhOWW1jILISG21BWkJnVsw2RiFaruT3nYvvRqjGhOESDcc0WyJIVXXm/ToE0Ynr
	 c28ogu11dMvokRps9/KMY/k6zJnVIxhaJczZEIHBpnsctGH7VtFfXrjrnLe3fXVhLk
	 zJ6/3hP9K7ehKB8eE7xkCFg0=
Date: Mon, 22 Jan 2024 14:19:10 +0100
From: Borislav Petkov <bp@alien8.de>
To: Xin Li <xin3.li@intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, luto@kernel.org, pbonzini@redhat.com,
	seanjc@google.com, peterz@infradead.org, jgross@suse.com,
	ravi.v.shankar@intel.com, mhiramat@kernel.org,
	andrew.cooper3@citrix.com, jiangshanlai@gmail.com,
	nik.borisov@suse.com, shan.kang@intel.com
Subject: Re: [PATCH v13 08/35] x86/fred: Disable FRED by default in its early
 stage
Message-ID: <20240122131910.GRZa5rTpEda4I1YfUX@fat_crate.local>
References: <20231205105030.8698-1-xin3.li@intel.com>
 <20231205105030.8698-9-xin3.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205105030.8698-9-xin3.li@intel.com>

On Tue, Dec 05, 2023 at 02:49:57AM -0800, Xin Li wrote:
>  			Warning: use of this parameter will taint the kernel
>  			and may cause unknown problems.
>  
> +	fred		[X86-64]
> +			Enable flexible return and event delivery

Let's make it accept multiple options from the get-go:

fred=on,disable-when,foo,bar,bla...

in case we need to tweak its behavior.

If it is only "fred" it will propagate this way downstream and it'll
lead to confusion later when people have to update their scripts and
config files when "fred" alone doesn't do what they're expecting
anymore.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

