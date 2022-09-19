Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8DB5BD516
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 21:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408889.651742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaM9r-0001FQ-M4; Mon, 19 Sep 2022 19:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408889.651742; Mon, 19 Sep 2022 19:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaM9r-0001Ca-IZ; Mon, 19 Sep 2022 19:10:19 +0000
Received: by outflank-mailman (input) for mailman id 408889;
 Mon, 19 Sep 2022 19:10:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBMf=ZW=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oaM9o-0001CU-RI
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 19:10:17 +0000
Received: from mail.skyhub.de (mail.skyhub.de [2a01:4f8:190:11c2::b:1457])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0e031b9-384e-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 21:10:14 +0200 (CEST)
Received: from zn.tnic (p200300ea9733e79d329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9733:e79d:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CC4751EC01D2;
 Mon, 19 Sep 2022 21:10:09 +0200 (CEST)
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
X-Inumbo-ID: b0e031b9-384e-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1663614609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=mu2esohdM2sPF1b210YRZnBukLG7jBgVAsUUa3wE11E=;
	b=QLTTFmFiZtmxou/z76o527wSr6qZCJkH0qFFhBzI5BpmHtqIGuw/zQPA/v1DvgfSqcKY+V
	YBT9Iiu4FIfQnCerKuBmbTK+QShttbY4Cw5pIoA78zSEkHWB3oZx/xO76gi+VaVuxfdgrk
	6y43x6orRu6tHVz23i7XkbsSyaqpqTE=
Date: Mon, 19 Sep 2022 21:10:05 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 03/10] x86/mtrr: replace use_intel() with a local flag
Message-ID: <Yyi+jYB//4v4vOxa@zn.tnic>
References: <20220908084914.21703-1-jgross@suse.com>
 <20220908084914.21703-4-jgross@suse.com>
 <Yx21cizZHNzD38z7@nazgul.tnic>
 <80085512-5783-7ea0-fb7d-6e852f8942e0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <80085512-5783-7ea0-fb7d-6e852f8942e0@suse.com>

On Mon, Sep 12, 2022 at 11:10:29AM +0200, Juergen Gross wrote:
> In the end this variable doesn't specify which caching types are available,
> but the ways to select/control the caching types.
> 
> So what about "memory_caching_select" or "memory_caching_control" instead?

_control sounds like the right thing. As in, which of the memory caching
things the kernel controls. Along with a comment above it what this
exactly is. Yap.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

