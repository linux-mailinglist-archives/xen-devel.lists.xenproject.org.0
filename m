Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB0471670A
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 17:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541227.843753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41H4-0001IJ-96; Tue, 30 May 2023 15:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541227.843753; Tue, 30 May 2023 15:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41H4-0001GT-5L; Tue, 30 May 2023 15:28:38 +0000
Received: by outflank-mailman (input) for mailman id 541227;
 Tue, 30 May 2023 15:28:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdt7=BT=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1q41H2-0001GN-3v
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 15:28:36 +0000
Received: from mail.skyhub.de (mail.skyhub.de [2a01:4f8:190:11c2::b:1457])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1bf72f8-fefe-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 17:28:31 +0200 (CEST)
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 17E8F1EC0411;
 Tue, 30 May 2023 17:28:30 +0200 (CEST)
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
X-Inumbo-ID: a1bf72f8-fefe-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1685460510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=7wMkihUDACMyxG5NoWweKMDlr/7la1a8uhQ7N10j4Jg=;
	b=mRke7Bdnd6HC68Ll3Z22g/XU5cqrYW9/4I7rc9xVly+dj2IbILa2Ojd4dlSH6Zmjq1e4U2
	rGgnl547wL6ZH1lBB62dbox0EFY8N1L6Wos2avbZxDKD28UgfJetes2/b3kFH8PkvJev6U
	D8v8dNzkW0mu3Ye1MfrTXEUa4/CHPgE=
Date: Tue, 30 May 2023 17:28:25 +0200
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
Message-ID: <20230530152825.GAZHYWGXAp8PHgN/w0@fat_crate.local>
References: <20230502120931.20719-1-jgross@suse.com>
 <20230509201437.GFZFqprc6otRejDPUt@fat_crate.local>
 <20230509233641.GGZFrZCTDH7VwUMp5R@fat_crate.local>
 <20230510133024.GBZFuccC1FxIZNKL+8@fat_crate.local>
 <4c47a11c-0565-678d-3467-e01c5ec16600@suse.com>
 <20230511163208.GDZF0YiOfxQhSo4RDm@fat_crate.local>
 <0cd3899b-cf3b-61c1-14ae-60b6b49d14ab@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0cd3899b-cf3b-61c1-14ae-60b6b49d14ab@suse.com>

On Mon, May 22, 2023 at 04:17:50PM +0200, Juergen Gross wrote:
> The attached diff is for patch 13.

Merged and pushed out into same branch.

Next issue. Diffing /proc/mtrr shows:

--- proc-mtrr.6.3	2023-05-30 17:00:13.215999483 +0200
+++ proc-mtrr.after	2023-05-30 16:01:38.281997816 +0200
@@ -1,8 +1,8 @@
 reg00: base=0x000000000 (    0MB), size= 2048MB, count=1: write-back
-reg01: base=0x080000000 ( 2048MB), size=  512MB, count=1: write-back
+reg01: base=0x080000000 ( 2048MB), size= 1024MB, count=1: write-back
 reg02: base=0x0a0000000 ( 2560MB), size=  256MB, count=1: write-back
 reg03: base=0x0ae000000 ( 2784MB), size=   32MB, count=1: uncachable
-reg04: base=0x100000000 ( 4096MB), size= 4096MB, count=1: write-back
+reg04: base=0x100000000 ( 4096MB), size=  256MB, count=1: write-back
 reg05: base=0x200000000 ( 8192MB), size= 8192MB, count=1: write-back
 reg06: base=0x400000000 (16384MB), size= 1024MB, count=1: write-back
 reg07: base=0x440000000 (17408MB), size=  256MB, count=1: write-back

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

