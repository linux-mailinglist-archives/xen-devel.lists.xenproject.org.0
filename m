Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F58717C9B
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 11:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541704.844712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Ib8-0002Vg-5m; Wed, 31 May 2023 09:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541704.844712; Wed, 31 May 2023 09:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Ib8-0002SV-2y; Wed, 31 May 2023 09:58:30 +0000
Received: by outflank-mailman (input) for mailman id 541704;
 Wed, 31 May 2023 09:58:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Ad7=BU=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1q4Ib6-0002SP-KH
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 09:58:28 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afc9d9dd-ff99-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 11:58:26 +0200 (CEST)
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A190C1EC04CB;
 Wed, 31 May 2023 11:58:25 +0200 (CEST)
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
X-Inumbo-ID: afc9d9dd-ff99-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1685527105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=hV5YBOIQSuwVXJ+8Bq//nWeBhs0OtlO6df6O2vn8m1U=;
	b=Z5dl/Esl28XcJGYLQMWLB7mDNT4HnJmuKuH7Q7rBtdBM4dZsUgVpe+otHybYon2eveTgiP
	AsTaFAFSoetQQLdUoW1I/5GajpeRc7w7d27DQ5wtBU0egue/Hk38/BctN3oEqzR61+V4pC
	P8u8HorX55f1Ee47CpUpGwCZiVcGwmM=
Date: Wed, 31 May 2023 11:58:21 +0200
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
Message-ID: <20230531095821.GBZHcaPUvp8jo/IwV7@fat_crate.local>
References: <20230509201437.GFZFqprc6otRejDPUt@fat_crate.local>
 <20230509233641.GGZFrZCTDH7VwUMp5R@fat_crate.local>
 <20230510133024.GBZFuccC1FxIZNKL+8@fat_crate.local>
 <4c47a11c-0565-678d-3467-e01c5ec16600@suse.com>
 <20230511163208.GDZF0YiOfxQhSo4RDm@fat_crate.local>
 <0cd3899b-cf3b-61c1-14ae-60b6b49d14ab@suse.com>
 <20230530152825.GAZHYWGXAp8PHgN/w0@fat_crate.local>
 <888f860d-4307-54eb-01da-11f9adf65559@suse.com>
 <20230531083508.GAZHcGvB68PUAH7f+a@fat_crate.local>
 <7e824a95-6676-9553-4158-d434f617fcbb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7e824a95-6676-9553-4158-d434f617fcbb@suse.com>

On Wed, May 31, 2023 at 11:31:37AM +0200, Juergen Gross wrote:
> What it did would have been printed if pr_debug() would have been
> active. :-(

Lemme turn those into pr_info(). pr_debug() is nuts.

> Did you check whether CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT was the same in both
> kernels you've tested?

Yes, it is enabled.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

