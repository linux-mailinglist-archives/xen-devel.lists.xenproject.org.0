Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB372D6442
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 18:59:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49658.87809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knQDR-0004og-At; Thu, 10 Dec 2020 17:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49658.87809; Thu, 10 Dec 2020 17:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knQDR-0004oJ-7W; Thu, 10 Dec 2020 17:58:57 +0000
Received: by outflank-mailman (input) for mailman id 49658;
 Thu, 10 Dec 2020 17:58:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=57pE=FO=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1knQDP-0004oE-90
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 17:58:55 +0000
Received: from mail.skyhub.de (unknown [2a01:4f8:190:11c2::b:1457])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 944c9135-2f20-4747-ba46-25eed1eb33df;
 Thu, 10 Dec 2020 17:58:52 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0d410017205789a0fcbfc3.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:4100:1720:5789:a0fc:bfc3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BC6941EC0266;
 Thu, 10 Dec 2020 18:58:51 +0100 (CET)
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
X-Inumbo-ID: 944c9135-2f20-4747-ba46-25eed1eb33df
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1607623131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MwyvOQBqxuMUG7KzYXJrCDdCJAVHNYnOubZCd9QHgEo=;
	b=QAbiXUnnXNeeVEl8f1bWlVdTRkQaqyuO5GwcX57rzx5YgNGyAoPsKd8SiHoQhEKOL3cswb
	xJFTBEQqrivdDf2SutMFerrTsDT8f2MUOi3bt/x+qDD+kGByiHPn6aZFFd6jQgbpBKA5EE
	NQZ4t6DTvpVHfanMjclYCmWpEGp+G0c=
Date: Thu, 10 Dec 2020 18:58:46 +0100
From: Borislav Petkov <bp@alien8.de>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, peterz@infradead.org, luto@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 07/12] x86: add new features for paravirt patching
Message-ID: <20201210175846.GE26529@zn.tnic>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-8-jgross@suse.com>
 <20201208184315.GE27920@zn.tnic>
 <2510752e-5d3d-f71c-8a4c-a5d2aae0075e@suse.com>
 <20201209120307.GB18203@zn.tnic>
 <9e989b07-84e8-b07b-ba6e-c2a3ed19d7b1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e989b07-84e8-b07b-ba6e-c2a3ed19d7b1@suse.com>

On Wed, Dec 09, 2020 at 01:22:24PM +0100, Jürgen Groß wrote:
> Lets take the spin_unlock() case. With patch 11 of the series this is
> 
> PVOP_ALT_VCALLEE1(lock.queued_spin_unlock, lock,
>                   "movb $0, (%%" _ASM_ARG1 ");",
>                   X86_FEATURE_NO_PVUNLOCK);
> 
> which boils down to ALTERNATIVE "call *lock.queued_spin_unlock"
>                                 "movb $0,(%rdi)" X86_FEATURE_NO_PVUNLOCK
> 
> The initial (paravirt) code is an indirect call in order to allow
> spin_unlock() before paravirt/alternative patching takes place.
> 
> Paravirt patching will then replace the indirect call with a direct call
> to the correct unlock function. Then alternative patching might replace
> the direct call to the bare metal unlock with a plain "movb $0,(%rdi)"
> in case pvlocks are not enabled.

Aha, that zeros the locking var on unlock, I see.

> In case alternative patching would occur first, the indirect call might
> be replaced with the "movb ...", and then paravirt patching would
> clobber that with the direct call, resulting in the bare metal
> optimization being removed again.

Yeah, that explains the whole situation much better - thanks - and
considering how complex the whole patching is, I wouldn't mind the gist
of it as text in alternative_instructions() or in a comment above it so
that we don't have to swap everything back in, months and years from
now, when we optimize it yet again. :-}

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

