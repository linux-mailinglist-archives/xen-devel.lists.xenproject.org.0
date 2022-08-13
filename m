Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D34591CD6
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 23:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386424.622404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMyzi-0000eZ-17; Sat, 13 Aug 2022 21:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386424.622404; Sat, 13 Aug 2022 21:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMyzh-0000cn-T4; Sat, 13 Aug 2022 21:48:33 +0000
Received: by outflank-mailman (input) for mailman id 386424;
 Sat, 13 Aug 2022 21:48:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j5iD=YR=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oMyzg-0000ch-1I
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 21:48:32 +0000
Received: from mail.skyhub.de (mail.skyhub.de [2a01:4f8:190:11c2::b:1457])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa647d88-1b51-11ed-924f-1f966e50362f;
 Sat, 13 Aug 2022 23:48:29 +0200 (CEST)
Received: from zn.tnic (p2e55d27b.dip0.t-ipconnect.de [46.85.210.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 032B81EC067E;
 Sat, 13 Aug 2022 23:48:24 +0200 (CEST)
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
X-Inumbo-ID: aa647d88-1b51-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1660427304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=fz37332wiyn8xQubKBZViow+AZzqnLB/tSNjoT3q33w=;
	b=I7+hyv2sQPb93AEybpUHKY08eB77sAwaoHenTwceUENNJJMIyIC/Ox7n7SlyTOp9A5mt1H
	/S3M4Z18PCt0cBj/MqT9dgXm8E1pi03QhHfZqm2bp3/twcuf/oi4tnp8NvCNJGOeZQB9ju
	YV/XDWfjLIBP2016iz4+2X0TlBxXOis=
Date: Sat, 13 Aug 2022 23:48:18 +0200
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
Message-ID: <YvgcIu/Y1GMD5WNo@zn.tnic>
References: <20220715142549.25223-1-jgross@suse.com>
 <20220715142549.25223-4-jgross@suse.com>
 <YtbKf51S4lTaziKm@zn.tnic>
 <d838264a-bcd0-29e2-3b23-5427ee0ee041@netscape.net>
 <YvfdYS81vU66tQSs@zn.tnic>
 <3de36953-9b8a-d040-c8dd-44af1ae2d56d@netscape.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3de36953-9b8a-d040-c8dd-44af1ae2d56d@netscape.net>

On Sat, Aug 13, 2022 at 05:40:34PM -0400, Chuck Zmudzinski wrote:
> I did a search for Juergen Gross on lkml and he is active submitting and
> reviewing patches during the past few weeks. However, he is ignoring
> comments on his patch to fix this regression.

Please stop this non-sense and be patient. We will fix this soon. For
the time being you can use Jan's patch locally.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

