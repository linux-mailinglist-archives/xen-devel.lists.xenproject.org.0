Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F2356FF42
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 12:40:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365021.595050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAqqB-0004fT-TV; Mon, 11 Jul 2022 10:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365021.595050; Mon, 11 Jul 2022 10:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAqqB-0004cZ-Q7; Mon, 11 Jul 2022 10:40:35 +0000
Received: by outflank-mailman (input) for mailman id 365021;
 Mon, 11 Jul 2022 10:40:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZAJ=XQ=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oAqqA-0004cL-3N
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 10:40:34 +0000
Received: from mail.skyhub.de (mail.skyhub.de [2a01:4f8:190:11c2::b:1457])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2d6b493-0105-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 12:40:31 +0200 (CEST)
Received: from zn.tnic (p200300ea970ff601329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:970f:f601:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 964B31EC0518;
 Mon, 11 Jul 2022 12:40:26 +0200 (CEST)
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
X-Inumbo-ID: e2d6b493-0105-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1657536026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=DQveIvP21h/SanKF+N0Kr1ZyhDAmgYuWOYIW71suvFg=;
	b=CnP+YTdQFXXeMz4yz7lRKZrtDOotgh/qmneigxkyjFPzRx22eIHesEikobYkfzhA0eFGHx
	bgWLcABXTonqdCSQS/VeaNriU3qJ60lGziMlFEFviVrJ4ncqEsKyuMs/HXtUf2QXs9ucao
	boRyB8MdlK+myKDMfvTxFNaK5ZPE7Hk=
Date: Mon, 11 Jul 2022 12:40:26 +0200
From: Borislav Petkov <bp@alien8.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Lutomirski <luto@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/PAT: have pat_enabled() properly reflect state when
 running on e.g. Xen
Message-ID: <Ysv+Gh0Gk4+uGwrb@zn.tnic>
References: <9385fa60-fa5d-f559-a137-6608408f88b0@suse.com>
 <YsRTAGI2PhfZ5V7M@zn.tnic>
 <016d281b-7e40-f1bd-66ee-c19c3cc56efe@suse.com>
 <YsRjX/U1XN8rq+8u@zn.tnic>
 <b7fa785b-cea3-3e05-c101-d6c7bd101ef3@suse.com>
 <YsW/3/fEuNYAuFwZ@zn.tnic>
 <bc13c66d-a885-e405-7b53-8cd7afdbecff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bc13c66d-a885-e405-7b53-8cd7afdbecff@suse.com>

On Thu, Jul 07, 2022 at 08:38:44AM +0200, Jan Beulich wrote:
> Well, right now the pvops hook for Xen swallows #GP anyway (wrongly
> so imo, but any of my earlier pointing out of that has been left
> unheard, despite even the code comments there saying "It may be worth
> changing that").

Oh great. ;-\

> The point is therefore that after writing PAT, it would need reading
> back. In which case it feels (slightly) more clean to me to avoid the
> write attempt in the first place, when we know it's not going to work.

X86_FEATURE_XENPV check then.

> If I may ask - doesn't this mean this patch, in its current shape, is
> already a (small) step in that direction? In any event what you say
> doesn't sound to me like a viable (backportable) route to addressing
> the regression at hand.

Backportable to where? To whatever tree has

bdd8b6c98239 ("drm/i915: replace X86_FEATURE_PAT with pat_enabled()")

? If it is that, then 5.17 and newer.

Anyway, I don't mind it as long as you put the proper splitting out
ontop and it all goes as a single patchset, with the minimal fix
CC:stable and queued first.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

