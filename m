Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34AC566F58
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 15:37:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361295.590736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8ijf-000597-5k; Tue, 05 Jul 2022 13:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361295.590736; Tue, 05 Jul 2022 13:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8ijf-00055d-2N; Tue, 05 Jul 2022 13:37:03 +0000
Received: by outflank-mailman (input) for mailman id 361295;
 Tue, 05 Jul 2022 13:37:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kDjK=XK=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1o8ijZ-000559-4V
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 13:37:02 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88ee498a-fc67-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 15:36:55 +0200 (CEST)
Received: from zn.tnic (p200300ea970ff682329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:970f:f682:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6F3531EC04E4;
 Tue,  5 Jul 2022 15:36:50 +0200 (CEST)
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
X-Inumbo-ID: 88ee498a-fc67-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1657028210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=GFZB6hQrFUj7F40WxfxetMyblgqJcf/FkHxEIUACZKI=;
	b=UXJSGTGPhKfbk/vTKth2c8W3kodpAwNsuy1N1adOQUCmwhQ+doBPisYXvL2+tJHpAO4SRy
	PZ2fcdm+R9pMMiuJzsvZXRgGd5Xc1qywRkYAfD59K8FhCTpvmodBn1cHTbaLuikehq0QiE
	x5aSzTULghRklPcujE5oJPxb81LwGBc=
Date: Tue, 5 Jul 2022 15:36:46 +0200
From: Borislav Petkov <bp@alien8.de>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Jan Beulich <jbeulich@suse.com>, lkml <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Lutomirski <luto@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	the arch/x86 maintainers <x86@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Ping: [PATCH] x86/PAT: have pat_enabled() properly reflect state
 when running on e.g. Xen
Message-ID: <YsQ+brh7hisR5f2Y@zn.tnic>
References: <9385fa60-fa5d-f559-a137-6608408f88b0@suse.com>
 <dff7bcd3-affc-9272-81e9-d686d9c997d5@suse.com>
 <8756355c-b586-3d1b-531c-72a04a8c047a@leemhuis.info>
 <05b5e672-0a1b-2d00-a879-b5127a94973f@suse.com>
 <4c8c9d4c-1c6b-8e9f-fa47-918a64898a28@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c8c9d4c-1c6b-8e9f-fa47-918a64898a28@leemhuis.info>

On Tue, Jul 05, 2022 at 12:57:18PM +0200, Thorsten Leemhuis wrote:
> Side note: Juergen Gross recently posted related patches in this code
> area to fix some other problems (regressions?), but his efforts look
> stalled, too:
> https://lore.kernel.org/all/ddb0cc0d-cefc-4f33-23f8-3a94c7c51a49@suse.com/

I'm still waiting for a resumbission of this:

https://lore.kernel.org/r/20220620113441.23961-1-jgross@suse.com

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

