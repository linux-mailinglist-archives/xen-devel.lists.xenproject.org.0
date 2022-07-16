Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 278DA576D98
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 13:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368712.600103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCgBr-00012C-S5; Sat, 16 Jul 2022 11:42:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368712.600103; Sat, 16 Jul 2022 11:42:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCgBr-0000zB-PH; Sat, 16 Jul 2022 11:42:31 +0000
Received: by outflank-mailman (input) for mailman id 368712;
 Sat, 16 Jul 2022 11:42:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+x8G=XV=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oCgBg-0000z5-8V
 for xen-devel@lists.xenproject.org; Sat, 16 Jul 2022 11:42:30 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 580f8e7e-04fc-11ed-bd2d-47488cf2e6aa;
 Sat, 16 Jul 2022 13:42:18 +0200 (CEST)
Received: from zn.tnic (p200300ea9729766f329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9729:766f:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B7A2F1EC02AD;
 Sat, 16 Jul 2022 13:42:12 +0200 (CEST)
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
X-Inumbo-ID: 580f8e7e-04fc-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1657971732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=TrWzbl6mvGD+VhoF3wfcgTYjQ8begmaufTzu3BvWSfI=;
	b=C1ExD3plau1kTCEQtER4H4Afs2+xeOeYPdQkVI3hVtoyEHvXXh4x8ST6pfJ8nCPkw5vdB6
	V/2P5mRnswj3HgN4AytzdE54tUOQgR8o4d6HIrp5I000qDMrxEZopxWIJ4elhwERZ9O4iV
	6zUwd1IRMq3uG3UdGZ568ut+/m+6Clo=
Date: Sat, 16 Jul 2022 13:42:08 +0200
From: Borislav Petkov <bp@alien8.de>
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Thorsten Leemhuis <regressions@leemhuis.info>, jbeulich@suse.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"# 5 . 17" <stable@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 0/3] x86: make pat and mtrr independent from each other
Message-ID: <YtKkECIpM5q+TCT9@zn.tnic>
References: <20220715142549.25223-1-jgross@suse.com>
 <7bf307c7-0b05-781b-a2a3-19b47589eb8a@netscape.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7bf307c7-0b05-781b-a2a3-19b47589eb8a@netscape.net>

On Sat, Jul 16, 2022 at 07:32:46AM -0400, Chuck Zmudzinski wrote:
> Can you confirm that with this patch series you are trying
> to fix that regression?

Yes, this patchset is aimed to fix the whole situation but please don't
do anything yet - I need to find time and look at the whole approach
before you can test it. Just be patient and we'll ping you when the time
comes.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

