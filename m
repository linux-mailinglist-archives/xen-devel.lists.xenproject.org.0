Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798176FD310
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 01:37:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532589.828801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwWt3-0006yV-2X; Tue, 09 May 2023 23:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532589.828801; Tue, 09 May 2023 23:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwWt2-0006vz-W6; Tue, 09 May 2023 23:36:52 +0000
Received: by outflank-mailman (input) for mailman id 532589;
 Tue, 09 May 2023 23:36:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mGMN=A6=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1pwWt1-0006vt-GB
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 23:36:51 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c55ad76-eec2-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 01:36:50 +0200 (CEST)
Received: from zn.tnic (p5de8e8ea.dip0.t-ipconnect.de [93.232.232.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6BA1D1EC0338;
 Wed, 10 May 2023 01:36:45 +0200 (CEST)
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
X-Inumbo-ID: 5c55ad76-eec2-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1683675405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=5lxz18Yo5hMImpwUjevLsHYDBAq+H3HMlQ4JsgvZNfQ=;
	b=ViBwKc/E9IwalgWRG3DAMDt1hENvVWCAvfGWo6kvQLcZaCN/W2U+PshsC+Sx7GbxRQ37Ra
	jHwik+DHKo+xHqa20cn0nYZe9SzXWFt4Kl9kgOWriVsLyd3kk0m9fU0QJL5+ZgYsnH7c4M
	Pq3h+M+VcNVK8HRaDnJtcn8Stpmew8s=
Date: Wed, 10 May 2023 01:36:41 +0200
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
Message-ID: <20230509233641.GGZFrZCTDH7VwUMp5R@fat_crate.local>
References: <20230502120931.20719-1-jgross@suse.com>
 <20230509201437.GFZFqprc6otRejDPUt@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230509201437.GFZFqprc6otRejDPUt@fat_crate.local>

On Tue, May 09, 2023 at 10:14:37PM +0200, Borislav Petkov wrote:
> On Tue, May 02, 2023 at 02:09:15PM +0200, Juergen Gross wrote:
> > This series tries to fix the rather special case of PAT being available
> > without having MTRRs (either due to CONFIG_MTRR being not set, or
> > because the feature has been disabled e.g. by a hypervisor).
> 
> More weird stuff. With the series:

Yah, that was me.

That ->enabled thing is *two* bits. FFS.

More staring at this tomorrow, on a clear head.

diff --git a/arch/x86/include/uapi/asm/mtrr.h b/arch/x86/include/uapi/asm/mtrr.h
index a28e6bbd8f21..f476a1355182 100644
--- a/arch/x86/include/uapi/asm/mtrr.h
+++ b/arch/x86/include/uapi/asm/mtrr.h
@@ -84,7 +84,7 @@ typedef __u8 mtrr_type;
 struct mtrr_state_type {
 	struct mtrr_var_range var_ranges[MTRR_MAX_VAR_RANGES];
 	mtrr_type fixed_ranges[MTRR_NUM_FIXED_RANGES];
-	bool enabled;
+	unsigned char enabled;
 	bool have_fixed;
 	mtrr_type def_type;
 };

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

