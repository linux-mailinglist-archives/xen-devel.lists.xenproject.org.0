Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF495A0F79
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 13:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393325.632199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRBFl-0004DM-IE; Thu, 25 Aug 2022 11:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393325.632199; Thu, 25 Aug 2022 11:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRBFl-0004BZ-Dh; Thu, 25 Aug 2022 11:42:29 +0000
Received: by outflank-mailman (input) for mailman id 393325;
 Thu, 25 Aug 2022 11:42:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kueA=Y5=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oRBFj-0004BP-U0
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 11:42:27 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd7f2cb0-246a-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 13:42:25 +0200 (CEST)
Received: from zn.tnic (p200300ea971b98f5329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:971b:98f5:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3CAC01EC050F;
 Thu, 25 Aug 2022 13:42:21 +0200 (CEST)
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
X-Inumbo-ID: fd7f2cb0-246a-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1661427741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=vh+yXND8jbqs07msgUgEfuD6EdfdarrOdj9azKZ93v4=;
	b=koVZ3WzX+coXmWuagCZ7A8QrddQqqwpUDOeKr40npBAQboceootNSjcsAzr0pEAXw4lDw9
	5VpOzdHcnyYMY/80uuoArWZA/m195ycE8cDnn4jx/3lRI8xKhJdFycHBSetEeSG/lU+xm0
	vEfnoVvR1SE0PfWH84erqcR76X4O0rQ=
Date: Thu, 25 Aug 2022 13:42:16 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 02/10] x86/mtrr: remove unused cyrix_set_all() function
Message-ID: <YwdgGFJWTV1YF3n2@zn.tnic>
References: <20220820092533.29420-1-jgross@suse.com>
 <20220820092533.29420-3-jgross@suse.com>
 <YwdPb4pWqppgzIpm@zn.tnic>
 <aff049cb-ebdd-68ad-5597-d22f87026297@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aff049cb-ebdd-68ad-5597-d22f87026297@suse.com>

On Thu, Aug 25, 2022 at 12:41:05PM +0200, Juergen Gross wrote:
> Maybe the alternative reasoning is much faster to understand: if the
> Cyrix set_all() could be called, the AMD and Centaur ones would be callable,
> too.

Right.

> Those being called would result in a NULL deref, so why should we keep
> the Cyrix one?

I know you're eager to remove dead code - I'd love that too. But before
we do that, we need to find out whether some Cyrix hw out there would
not need this.

I know, I know, they should've complained by now ... maybe they have but
we haven't heard about it.

What it most likely looks like is that those machines - a commit from
before git

commit 8fbdcb188e31ac901e216b466b97e90e8b057daa
Author: Dave Jones <davej@suse.de>
Date:   Wed Aug 14 21:14:22 2002 -0700

    [PATCH] Modular x86 MTRR driver.

talks about

+/*
+ * On Cyrix 6x86(MX) and M II the ARR3 is special: it has connection
+ * with the SMM (System Management Mode) mode. So we need the following:
+ * Check whether SMI_LOCK (CCR3 bit 0) is set
+ *   if it is set, write a warning message: ARR3 cannot be changed!
+ *     (it cannot be changed until the next processor reset)

which sounds like old rust. And which no one uses or such machines are
long dead already.

Wikipedia says:

https://en.wikipedia.org/wiki/Cyrix_6x86

"The Cyrix 6x86 is a line of sixth-generation, 32-bit x86
microprocessors designed and released by Cyrix in 1995..."

So I'm thinking removing it would be ok...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

