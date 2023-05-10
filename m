Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743BF6FDE99
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 15:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532816.829131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwjuW-0006SW-Ar; Wed, 10 May 2023 13:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532816.829131; Wed, 10 May 2023 13:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwjuW-0006P8-88; Wed, 10 May 2023 13:31:16 +0000
Received: by outflank-mailman (input) for mailman id 532816;
 Wed, 10 May 2023 13:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SHWl=A7=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1pwjuV-0005Ki-El
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 13:31:15 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efaea832-ef36-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 15:31:14 +0200 (CEST)
Received: from zn.tnic (p5de8e8ea.dip0.t-ipconnect.de [93.232.232.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 779BD1EC067E;
 Wed, 10 May 2023 15:31:14 +0200 (CEST)
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
X-Inumbo-ID: efaea832-ef36-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1683725474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=nWEfS1oddXK3hwI0/gOtdcGGJ/0GZlUs3Fe3QO+YY7U=;
	b=jqkCdYyYkR38aWrhTJTu89bZLN/65qIr5shR0DFR44C13mCnkvAF8rdLFKZ4X/lwpKdawL
	2f1YmXXPJo6kZjS0vCIouVQs0dFXSgTFUgridFZQN8QYGK0Q3Fk+bR65n3MqsN9r5IzNl2
	QmVzxYJ0e1AnYp+oY6FWtrhcOdOPXpg=
Date: Wed, 10 May 2023 15:31:14 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-hyperv@vger.kernel.org, linux-doc@vger.kernel.org,
	mikelley@microsoft.com, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org, Jonathan Corbet <corbet@lwn.net>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6 00/16] x86/mtrr: fix handling with PAT but without MTRR
Message-ID: <20230510133114.GCZFucoi32pjSFbEHr@fat_crate.local>
References: <20230502120931.20719-1-jgross@suse.com>
 <20230509201437.GFZFqprc6otRejDPUt@fat_crate.local>
 <20230509233641.GGZFrZCTDH7VwUMp5R@fat_crate.local>
 <20230510133024.GBZFuccC1FxIZNKL+8@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230510133024.GBZFuccC1FxIZNKL+8@fat_crate.local>

On Wed, May 10, 2023 at 03:30:24PM +0200, Borislav Petkov wrote:
> So this map lookup thing is wrong in this case.

Btw, current tree is:

https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git/log/?h=rc1-mtrr

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

