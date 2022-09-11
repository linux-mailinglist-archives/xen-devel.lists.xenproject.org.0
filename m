Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED3E5B4DA2
	for <lists+xen-devel@lfdr.de>; Sun, 11 Sep 2022 13:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405008.647636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXKjN-0003Dy-K6; Sun, 11 Sep 2022 11:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405008.647636; Sun, 11 Sep 2022 11:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXKjN-0003BM-GB; Sun, 11 Sep 2022 11:02:29 +0000
Received: by outflank-mailman (input) for mailman id 405008;
 Sun, 11 Sep 2022 11:02:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pbpW=ZO=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oXKjM-0003BF-5W
 for xen-devel@lists.xenproject.org; Sun, 11 Sep 2022 11:02:28 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38a5f848-31c1-11ed-9760-273f2230c3a0;
 Sun, 11 Sep 2022 13:02:26 +0200 (CEST)
Received: from nazgul.tnic (dynamic-046-114-095-207.46.114.pool.telefonica.de
 [46.114.95.207])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 330B71EC04D3;
 Sun, 11 Sep 2022 13:02:22 +0200 (CEST)
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
X-Inumbo-ID: 38a5f848-31c1-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1662894142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=P5kwIvUHBjyBBUAObapdTIJePWA8t5W0c1fO0gvG0vs=;
	b=JxDoua72qGlka0u6SbfQr0k6tskgWj4a+ra+EanXJI6cdjzdXPEn8BUPApQAAXfpU23ScR
	Mk2jxg6pbqFzDGGYrV5EZwbj6T/dyoTyEbFGAebQRmahNBMBjY/V22ilOCz3x1xZ0SOpvX
	zaQDMJML+OWaSCrr5uh+IOY9yPnhmeE=
Date: Sun, 11 Sep 2022 13:02:34 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 04/10] x86: move some code out of
 arch/x86/kernel/cpu/mtrr
Message-ID: <Yx3AP9dDPqbRn5OX@nazgul.tnic>
References: <20220908084914.21703-1-jgross@suse.com>
 <20220908084914.21703-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220908084914.21703-5-jgross@suse.com>

On Thu, Sep 08, 2022 at 10:49:08AM +0200, Juergen Gross wrote:
> Prepare making PAT and MTRR support independent from each other by
> moving some code needed by both out of the MTRR specific sources.

This needs to be two patches at least: first one is only *mechanical*
move without any changes. The next one(s) do the renaming and other
changes etc. Otherwise reviewing it is unnecessarily complicated.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

