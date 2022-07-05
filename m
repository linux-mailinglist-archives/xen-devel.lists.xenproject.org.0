Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCB65673FC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 18:14:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361470.591021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8lC6-00043U-Jq; Tue, 05 Jul 2022 16:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361470.591021; Tue, 05 Jul 2022 16:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8lC6-00040j-Gr; Tue, 05 Jul 2022 16:14:34 +0000
Received: by outflank-mailman (input) for mailman id 361470;
 Tue, 05 Jul 2022 16:14:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kDjK=XK=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1o8lC4-00040d-L5
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 16:14:32 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d50984b-fc7d-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 18:14:31 +0200 (CEST)
Received: from zn.tnic (p200300ea970ff682329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:970f:f682:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EE60F1EC056D;
 Tue,  5 Jul 2022 18:14:26 +0200 (CEST)
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
X-Inumbo-ID: 8d50984b-fc7d-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1657037667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=N6tbxGmzXBxnpgTLBtsPda9RXrIjxRareOpLL9aV2cQ=;
	b=b1oDXangh6joLJ4eJiLlt65DHN5Z2xgOJEAqh8yBWaHfnBh5StIk5WDx8/vFl/Zg2uQHxr
	YDtaDYF84OYviCczo367n5Dg1lxaOv5KmseVlSKx/BLKSxtghSdfuiavw5fMJVFBq/i68g
	kPi/0377ZM6hMiN9YmdzYpu324hEM8A=
Date: Tue, 5 Jul 2022 18:14:23 +0200
From: Borislav Petkov <bp@alien8.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Lutomirski <luto@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/PAT: have pat_enabled() properly reflect state when
 running on e.g. Xen
Message-ID: <YsRjX/U1XN8rq+8u@zn.tnic>
References: <9385fa60-fa5d-f559-a137-6608408f88b0@suse.com>
 <YsRTAGI2PhfZ5V7M@zn.tnic>
 <016d281b-7e40-f1bd-66ee-c19c3cc56efe@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <016d281b-7e40-f1bd-66ee-c19c3cc56efe@suse.com>

On Tue, Jul 05, 2022 at 05:56:36PM +0200, Jan Beulich wrote:
> Re-using pat_disabled like you do in your suggestion below won't
> work, because mtrr_bp_init() calls pat_disable() when MTRRs
> appear to be disabled (from the kernel's view). The goal is to
> honor "nopat" without honoring any other calls to pat_disable().

Actually, the current goal is to adjust Xen dom0 because:

1. it uses the PAT code

2. but then it does something special and hides the MTRRs

which is not something real hardware does.

So this one-off thing should be prominent, visible and not get in the
way.

As to mtrr_bp_init(), can you use X86_FEATURE_XENPV there to detect this
special case when the kernel is running as dom0 and set stuff there
accordingly so that it doesn't disable PAT?

Then you don't have to touch pat_disabled() either but intergrate the
Xen variant properly...

> I can probably fiddle with pat_enabled() instead of with
> init_cache_modes(), but when making the change I had the feeling
> this might be less liked (as looking more hacky, at least to me).

Why would that be more hacky?

I'd much rather check upfront what the kernel is running on and act
accordingly instead of hooking into random functions and then years
later wonder why was it done in the first place.

> But besides the "where" the other question is: Do you really want
> me to limit this to Xen/PV, rather than - as I have it now -
> extending it to any hypervisor, which may behave in similar ways?

Well, do you know of some other HV which hides MTRRs from the guest?

I haven't heard of any...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

