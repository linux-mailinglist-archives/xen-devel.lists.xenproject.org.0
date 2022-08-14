Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07575591F59
	for <lists+xen-devel@lfdr.de>; Sun, 14 Aug 2022 11:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386701.622684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNAGR-00053a-Ml; Sun, 14 Aug 2022 09:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386701.622684; Sun, 14 Aug 2022 09:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNAGR-000514-Jq; Sun, 14 Aug 2022 09:50:35 +0000
Received: by outflank-mailman (input) for mailman id 386701;
 Sun, 14 Aug 2022 09:50:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cxLg=YS=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1oNAGQ-00050y-NF
 for xen-devel@lists.xenproject.org; Sun, 14 Aug 2022 09:50:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88f96d26-1bb6-11ed-924f-1f966e50362f;
 Sun, 14 Aug 2022 11:50:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D76D860F73;
 Sun, 14 Aug 2022 09:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF495C433D6;
 Sun, 14 Aug 2022 09:50:29 +0000 (UTC)
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
X-Inumbo-ID: 88f96d26-1bb6-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1660470630;
	bh=YMeRpElZNN0nRJL41e5QZR3ONX4RAqEuGqTmM2z0zbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zjLoF89HCesvrKOZtY0em4B9+H9L9rwDc4dwStr8iHbzRI9/hJvKTQwtu6gpAzd8G
	 72+SwBvEtfkyAgFL3zp5qFmtzH3hTEvjzVpP1QwTNMjAEU91VXU9+WDqyB2fhYBVoR
	 8v/D4AD7qaiyv7NJHVL5jlXXCXYX3Ve+e/A/5Kvo=
Date: Sun, 14 Aug 2022 11:50:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, jbeulich@suse.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	regressions@lists.linux.dev, Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/3] x86: make pat and mtrr independent from each other
Message-ID: <YvjFY1dn2Afg/mFj@kroah.com>
References: <20220715142549.25223-1-jgross@suse.com>
 <efbde93b-e280-0e40-798d-dc7bf8ca83cf@leemhuis.info>
 <a0ce2f59-b653-fa8b-a016-1335f05c86ae@netscape.net>
 <32ed59c9-c894-c426-dd27-3602625cf3b1@netscape.net>
 <4688ee9b-1b18-3204-cc93-c6ab2ce9222c@netscape.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4688ee9b-1b18-3204-cc93-c6ab2ce9222c@netscape.net>

On Sun, Aug 14, 2022 at 05:19:12AM -0400, Chuck Zmudzinski wrote:
> Well, that did not take long. Juergen responded with a message,
> which is encrypted and not delivered to my mailbox because I do not
> have the PGP keys, presumably to make it difficult for me to continue
> the discussion and defend myself after I was accused of violating
> the netiquette rules yesterday by Boris:

The message was signed, not encrypted.  Odd that your email client could
not read it, perhaps you need to use a different one?

thanks,

greg k-h

