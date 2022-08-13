Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73023591C21
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 19:21:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386365.622332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMuoZ-0007Ka-Nd; Sat, 13 Aug 2022 17:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386365.622332; Sat, 13 Aug 2022 17:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMuoZ-0007Hi-Kn; Sat, 13 Aug 2022 17:20:47 +0000
Received: by outflank-mailman (input) for mailman id 386365;
 Sat, 13 Aug 2022 17:20:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j5iD=YR=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oMuoV-0007HJ-FV
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 17:20:46 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41e03e1f-1b2c-11ed-924f-1f966e50362f;
 Sat, 13 Aug 2022 19:20:42 +0200 (CEST)
Received: from zn.tnic (p2e55d27b.dip0.t-ipconnect.de [46.85.210.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 25C451EC064C;
 Sat, 13 Aug 2022 19:20:37 +0200 (CEST)
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
X-Inumbo-ID: 41e03e1f-1b2c-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1660411237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=rFJUbH12jSbptwlGtNVGv3gua2WyWKxARb6tx5OOFhw=;
	b=dir4FhiJgml+Icpb1kS9IZrrov2qYQPKTI90LtVrPHmfYvZeNwKxTEoQqW6tlCnahQBXT3
	BjO9lEDUDTLUrsMpF8NsxRK/zfxCK4ei/1x06xe4/Yzn/hq7Mkd0K41Qd3JAlC7gZ/oU7k
	M2NpnCUoEJfO43eMfQjS2g/hvHRylvM=
Date: Sat, 13 Aug 2022 19:20:33 +0200
From: Borislav Petkov <bp@alien8.de>
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Juergen Gross <jgross@suse.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	regressions@lists.linux.dev
Subject: Re: PING [PATCH 3/3] x86: decouple pat and mtrr handling
Message-ID: <YvfdYS81vU66tQSs@zn.tnic>
References: <20220715142549.25223-1-jgross@suse.com>
 <20220715142549.25223-4-jgross@suse.com>
 <YtbKf51S4lTaziKm@zn.tnic>
 <d838264a-bcd0-29e2-3b23-5427ee0ee041@netscape.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d838264a-bcd0-29e2-3b23-5427ee0ee041@netscape.net>

On Sat, Aug 13, 2022 at 12:56:44PM -0400, Chuck Zmudzinski wrote:
> Why has Juergen not at least responded in some way to the
> comments that Boris has made here? Why has Boris not
> pinged Juergen by now,

How about: it is summer here and people usually take their vacations
during that time and everything takes a bit longer than usual?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

