Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A45578219
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 14:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369754.601239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDPjy-0005Fy-LS; Mon, 18 Jul 2022 12:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369754.601239; Mon, 18 Jul 2022 12:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDPjy-0005Di-IP; Mon, 18 Jul 2022 12:20:46 +0000
Received: by outflank-mailman (input) for mailman id 369754;
 Mon, 18 Jul 2022 12:20:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dcrJ=XX=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oDPjv-0005C4-6D
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 12:20:45 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09d28439-0694-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 14:20:41 +0200 (CEST)
Received: from zn.tnic (p200300ea972976d7329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9729:76d7:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EC8681EC04F0;
 Mon, 18 Jul 2022 14:20:35 +0200 (CEST)
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
X-Inumbo-ID: 09d28439-0694-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1658146836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=YUsHaSIKv5mhVert20B83ArzxD5bMsOqQGQm2WfFNQY=;
	b=Ga6lTw52ypWNCa7ANAt/KfjkmVyY188H+6CK9mutryTo0MlTHD49tBVIAgvT3rAxlb5hBH
	x//kdGxXjpUKs4jyHamB06xu9+kdpmUNNZGYHG5m8FEI0HMZ9vzqjGmulqnxN1BfUIp9QQ
	dKivWsgLjUwBv94Pm38Ha6t5kSXbj9s=
Date: Mon, 18 Jul 2022 14:20:32 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, brchuckz@netscape.net,
	jbeulich@suse.com, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] x86: move some code out of arch/x86/kernel/cpu/mtrr
Message-ID: <YtVQEIuHa6qGXFxs@zn.tnic>
References: <20220715142549.25223-1-jgross@suse.com>
 <20220715142549.25223-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220715142549.25223-2-jgross@suse.com>

On Fri, Jul 15, 2022 at 04:25:47PM +0200, Juergen Gross wrote:
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 736262a76a12..e43322f8a4ef 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c

I guess the move's ok but not into cpu/common.c pls. That thing is
huuuge and is a dumping ground for everything.

arch/x86/kernel/cpu/cacheinfo.c looks like a more viable candidate for
all things cache.

Rest looks trivial.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

