Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C8C671820
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480299.744616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI51R-0007wp-Sr; Wed, 18 Jan 2023 09:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480299.744616; Wed, 18 Jan 2023 09:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI51R-0007uV-PT; Wed, 18 Jan 2023 09:46:21 +0000
Received: by outflank-mailman (input) for mailman id 480299;
 Wed, 18 Jan 2023 09:46:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xbTf=5P=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pI51N-0007uI-QS
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:46:20 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb1ebf42-9714-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 10:44:42 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pI518-00AXu0-OJ; Wed, 18 Jan 2023 09:46:02 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E4BAA30012F;
 Wed, 18 Jan 2023 10:45:44 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id ACDDF201C94B7; Wed, 18 Jan 2023 10:45:44 +0100 (CET)
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
X-Inumbo-ID: bb1ebf42-9714-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Vngt/LhqRClTSAwIT1d/lHxWy/3LcgFLtLzBhiC6+H4=; b=qN7sbrX2eZZR6fSOcS9SM2m8SL
	KggCGNxcd+u+9YxQownogqA0p2VZtU3Hko3Q0wGr2v56chdBuZQbt8ha8wwKycbmdGHoPwXPOcYWO
	npR4HyZ8Pg0qVt0FBNFD5xObAQSnYEMLBZwFFAcIp5+pvT+t6v0Ch6b71BT3vg+al7pt2SxISAwxm
	uOirgCK3BC7rZc0jC+dlSUlqxx3jQf+icqo7pPFEwKBnFFcIvrAtGbI1eSTV3BIX9HWNH1/ObOAXK
	8KY0Sz1JX97KdQvz3fvjCu3Vhs0q3pkB/tddNlhJehJbePTPSxMYlR0vdP/9hbvLbtZoxrnsCdgDx
	n6eQ3Bsw==;
Date: Wed, 18 Jan 2023 10:45:44 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org, Joan Bruguera <joanbrugueram@gmail.com>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Kees Cook <keescook@chromium.org>, mark.rutland@arm.com,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	=?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>,
	"H. Peter Anvin" <hpa@zytor.com>, jroedel@suse.de,
	kirill.shutemov@linux.intel.com, dave.hansen@intel.com,
	kai.huang@intel.com
Subject: Re: [PATCH v2 1/7] x86/boot: Remove verify_cpu() from
 secondary_startup_64()
Message-ID: <Y8e/yKgVZgbqgvAG@hirez.programming.kicks-ass.net>
References: <20230116142533.905102512@infradead.org>
 <20230116143645.589522290@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116143645.589522290@infradead.org>

On Mon, Jan 16, 2023 at 03:25:34PM +0100, Peter Zijlstra wrote:
> The boot trampolines from trampoline_64.S have code flow like:
> 
>   16bit BIOS			SEV-ES				64bit EFI
> 
>   trampoline_start()		sev_es_trampoline_start()	trampoline_start_64()
>     verify_cpu()			  |				|
>   switch_to_protected:    <---------------'				v
>        |							pa_trampoline_compat()
>        v								|
>   startup_32()		<-----------------------------------------------'
>        |
>        v
>   startup_64()
>        |
>        v
>   tr_start() := head_64.S:secondary_startup_64()
> 
> Since AP bringup always goes through the 16bit BIOS path (EFI doesn't
> touch the APs), there is already a verify_cpu() invocation.

So supposedly TDX/ACPI-6.4 comes in on trampoline_startup64() for APs --
can any of the TDX capable folks tell me if we need verify_cpu() on
these?

Aside from checking for LM, it seems to clear XD_DISABLE on Intel and
force enable SSE on AMD/K7. Surely none of that is needed for these
shiny new chips?

I mean, I can hack up a patch that adds verify_cpu() to the 64bit entry
point, but it seems really sad to need that on modern systems.

