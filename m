Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE9D6FCF3E
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 22:15:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532556.828771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwTjQ-00024W-M0; Tue, 09 May 2023 20:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532556.828771; Tue, 09 May 2023 20:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwTjQ-000226-Iu; Tue, 09 May 2023 20:14:44 +0000
Received: by outflank-mailman (input) for mailman id 532556;
 Tue, 09 May 2023 20:14:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mGMN=A6=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1pwTjP-00021y-5u
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 20:14:43 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21c10306-eea6-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 22:14:41 +0200 (CEST)
Received: from zn.tnic (p5de8e8ea.dip0.t-ipconnect.de [93.232.232.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1E5041EC051E;
 Tue,  9 May 2023 22:14:41 +0200 (CEST)
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
X-Inumbo-ID: 21c10306-eea6-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1683663281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=8FPEI6O6QAK3kRZvBqgdS/NqiP5GyoVTXmMIcWstwBU=;
	b=n6OGzuOgVvJpy46SSxzCzljQXgU88uLFdQj2tc18ANXJPJ/n6DZlbqX2Ya1zBVzJP82imI
	IzJlBM+TdVBQJB0VJYtKy4Jsd+Pjk9LIoJnvGZ5lLIkJansEWD5y7tusJyVZlQ3232xtIz
	IdrfYuxRa58gLxRAKyiKW9shhR18t08=
Date: Tue, 9 May 2023 22:14:37 +0200
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
Message-ID: <20230509201437.GFZFqprc6otRejDPUt@fat_crate.local>
References: <20230502120931.20719-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230502120931.20719-1-jgross@suse.com>

On Tue, May 02, 2023 at 02:09:15PM +0200, Juergen Gross wrote:
> This series tries to fix the rather special case of PAT being available
> without having MTRRs (either due to CONFIG_MTRR being not set, or
> because the feature has been disabled e.g. by a hypervisor).

More weird stuff. With the series:

[root@vh: ~> cat /proc/mtrr 
cat: /proc/mtrr: Input/output error

before:

[root@vh: ~> cat /proc/mtrr 
reg00: base=0x000000000 (    0MB), size= 2048MB, count=1: write-back
reg01: base=0x080000000 ( 2048MB), size= 1024MB, count=1: write-back
reg02: base=0x0c0000000 ( 3072MB), size=  256MB, count=1: write-back
reg03: base=0x0ff000000 ( 4080MB), size=   16MB, count=1: write-protect

I think it wrongly determines that MTRRs are disabled by BIOS:

MTRRs disabled by BIOS
x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT

which is obviously wrong.

But more debugging later.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

