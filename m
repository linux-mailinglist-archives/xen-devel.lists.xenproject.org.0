Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8AE71A017
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542578.846595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jMd-0003BB-RJ; Thu, 01 Jun 2023 14:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542578.846595; Thu, 01 Jun 2023 14:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jMd-000396-OF; Thu, 01 Jun 2023 14:33:19 +0000
Received: by outflank-mailman (input) for mailman id 542578;
 Thu, 01 Jun 2023 14:33:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MNKN=BV=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1q4jMc-000390-4U
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:33:18 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ed1d6a6-0089-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 16:33:16 +0200 (CEST)
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4882C1EC069A;
 Thu,  1 Jun 2023 16:33:15 +0200 (CEST)
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
X-Inumbo-ID: 3ed1d6a6-0089-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1685629995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=lZvBDmaGdPU2hmTnAnT0K3Zl9tT18jWXHccNTnt+nRc=;
	b=YBmEepH7K+BiKRZpTNdft93h2Mn4e7UMAk+58tsTmAYPmgp0qXRA36/DLLLTFUL85dDJgh
	sHJHQvRxMmEXu2MXp9aAJvFI8wCY8Q//2limBAbLcjdnaKlKpm12BIbuNljjVReVQnmg2n
	qFM4zQSKPgSZlkAh4y/xeV48F7eNc0k=
Date: Thu, 1 Jun 2023 16:33:10 +0200
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
Message-ID: <20230601143310.GDZHisJlbH5myXGQ8d@fat_crate.local>
References: <4c47a11c-0565-678d-3467-e01c5ec16600@suse.com>
 <20230511163208.GDZF0YiOfxQhSo4RDm@fat_crate.local>
 <0cd3899b-cf3b-61c1-14ae-60b6b49d14ab@suse.com>
 <20230530152825.GAZHYWGXAp8PHgN/w0@fat_crate.local>
 <888f860d-4307-54eb-01da-11f9adf65559@suse.com>
 <20230531083508.GAZHcGvB68PUAH7f+a@fat_crate.local>
 <efe79c9e-1e31-adb9-8f93-962249bf01bb@suse.com>
 <20230531174857.GDZHeIib57h5lT5Vh1@fat_crate.local>
 <fe33476d-0ec1-16f1-5874-8a5ff1650c3f@suse.com>
 <20230601132233.GCZHibmemkxYxvTjSu@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230601132233.GCZHibmemkxYxvTjSu@fat_crate.local>

On Thu, Jun 01, 2023 at 03:22:33PM +0200, Borislav Petkov wrote:
> Now lemme restart testing.

This is from another box, with the latest changes incorporated:

https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git/log/?h=rc1-mtrr

--- proc-mtrr.before    2011-03-04 01:03:35.243994733 +0100
+++ proc-mtrr.after     2023-06-01 16:28:54.959999456 +0200
@@ -1,3 +1,3 @@
 reg00: base=0x000000000 (    0MB), size= 2048MB, count=1: write-back
 reg01: base=0x080000000 ( 2048MB), size= 1024MB, count=1: write-back
-reg02: base=0x0c0000000 ( 3072MB), size=  256MB, count=1: write-back
+reg02: base=0x0c0000000 ( 3072MB), size=  128MB, count=1: write-back

Want mtrr=debug output again?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

