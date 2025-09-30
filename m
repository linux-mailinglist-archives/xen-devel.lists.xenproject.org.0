Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF5DBAC163
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134080.1472097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vsf-00043I-7b; Tue, 30 Sep 2025 08:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134080.1472097; Tue, 30 Sep 2025 08:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vsf-00040D-4u; Tue, 30 Sep 2025 08:38:41 +0000
Received: by outflank-mailman (input) for mailman id 1134080;
 Tue, 30 Sep 2025 08:38:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bY3K=4J=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1v3Vsc-0003zr-VO
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:38:40 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da64eddf-9dd8-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 10:38:36 +0200 (CEST)
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1v3VsR-00000007vQP-2C9S; Tue, 30 Sep 2025 08:38:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id AAEA6300328; Tue, 30 Sep 2025 10:38:27 +0200 (CEST)
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
X-Inumbo-ID: da64eddf-9dd8-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3jlHGCv3KKfepny4/+8UDRH2Uchjm+ncAKZLjXBzPQE=; b=C8bP7++u/b5qMJnayCP05rlwX6
	siikOCS3dkib6Z13ktiKs0qkiKKxo2bs+qW2uD3E8MRuWp0Z0O4yRe2q3dJLi4I+/62oKlQOFt6JN
	esxZ861tBA7iWNxDXxOMa/7XA5jCPzTltJyqgGOSJC+5yvI90tXMXShLvSZIWZxHilpv9ZLOj6yvu
	FeknuqLFJe3UINMVdw17fYcqyoQLLavUTX4++UMaXmTpPptEmPfIe34/71CY0kDQhWW0eHM/zmqE+
	8FjOPvfqXZJ4BLRL7ZhjGC3PpCaXO//hmkJfr/x1YOeswxG0IQYA27jtiDzRwAC535u0407ggWCUC
	1+cRSFkA==;
Date: Tue, 30 Sep 2025 10:38:27 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux.dev, xin@zytor.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 11/12] x86/paravirt: Don't use pv_ops vector for MSR
 access functions
Message-ID: <20250930083827.GI3245006@noisy.programming.kicks-ass.net>
References: <20250930070356.30695-1-jgross@suse.com>
 <20250930070356.30695-12-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930070356.30695-12-jgross@suse.com>

On Tue, Sep 30, 2025 at 09:03:55AM +0200, Juergen Gross wrote:

> +static __always_inline u64 read_msr(u32 msr)
> +{
> +	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> +		return xen_read_msr(msr);
> +
> +	return native_rdmsrq(msr);
> +}
> +
> +static __always_inline int read_msr_safe(u32 msr, u64 *p)
> +{
> +	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> +		return xen_read_msr_safe(msr, p);
> +
> +	return native_read_msr_safe(msr, p);
> +}
> +
> +static __always_inline void write_msr(u32 msr, u64 val)
> +{
> +	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> +		xen_write_msr(msr, val);
> +	else
> +		native_wrmsrq(msr, val);
> +}
> +
> +static __always_inline int write_msr_safe(u32 msr, u64 val)
> +{
> +	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> +		return xen_write_msr_safe(msr, val);
> +
> +	return native_write_msr_safe(msr, val);
> +}
> +
> +static __always_inline u64 rdpmc(int counter)
> +{
> +	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> +		return xen_read_pmc(counter);
> +
> +	return native_read_pmc(counter);
> +}

Egads, didn't we just construct giant ALTERNATIVE()s for the native_
things? Why wrap that in a cpu_feature_enabled() instead of just adding
one more case to the ALTERNATIVE() ?

