Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C64AD7AB3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 21:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013516.1391936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPnDn-0005d4-9I; Thu, 12 Jun 2025 19:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013516.1391936; Thu, 12 Jun 2025 19:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPnDn-0005Zx-5y; Thu, 12 Jun 2025 19:04:19 +0000
Received: by outflank-mailman (input) for mailman id 1013516;
 Thu, 12 Jun 2025 19:04:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HaQ=Y3=kernel.org=ebiggers@srs-se1.protection.inumbo.net>)
 id 1uPnDm-0005Zq-M7
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 19:04:18 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 095a7d3c-47c0-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 21:04:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D085A6116E;
 Thu, 12 Jun 2025 19:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDC4C4CEEA;
 Thu, 12 Jun 2025 19:04:13 +0000 (UTC)
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
X-Inumbo-ID: 095a7d3c-47c0-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749755055;
	bh=6D6BxuzqFc6289gWzxr9MD9k6SduwODZ6NYAWgJEVvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TVg3k6+1fIFCDCqzj07OpTxgI7rzCORKFJbnqm8GeR9/Oss7I+h/K8zjYgLY7WVC2
	 w1+q2edN6g8e8Croaj+1DDwH6LAQMtjnSMyvSJZQSZsUuTEvp0KAXFESX8PacCrgJs
	 aM3hbncXgquVHDukx3NmSg6cOb/FLcRQHUlhHwyvNG0pHb532yUDsKwlX0RWY/oQZ3
	 Ov6H5FMMYGTeK/p+HkjAExQ3JC4gemnACMbtpztskO8CiI5c/QKFz9RrAEpIYHWD2y
	 ISKKCAodFRejkVVX257Qga1XEswstCcv2G8CP5fuaoGIjydsqYgaxXwTvC2YTs8QDZ
	 b/EskwBtyvQrA==
Date: Thu, 12 Jun 2025 12:03:47 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Zhenghan Cheng <chengzhenghan@uniontech.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org,
	mario.limonciello@amd.com, yazen.ghannam@amd.com,
	jpoimboe@kernel.org, tony.luck@intel.com, jarkko@kernel.org,
	bhelgaas@google.com, pbonzini@redhat.com, oleg@redhat.com,
	jbaron@akamai.com, ning.sun@intel.com, seanjc@google.com,
	luto@kernel.org, andy@kernel.org, jim.cromie@gmail.com,
	kirill.shutemov@linux.intel.com, hpa@zytor.com,
	pawan.kumar.gupta@linux.intel.com, vkuznets@redhat.com,
	rostedt@goodmis.org, ardb@kernel.org, thomas.lendacky@amd.com,
	nikunj@amd.com, ashish.kalra@amd.com, kees@kernel.org,
	alexandre.chartre@oracle.com, rppt@kernel.org, steve.wahl@hpe.com,
	jirislaby@kernel.org, apatel@ventanamicro.com, bvanassche@acm.org,
	ptsm@linux.microsoft.com, Jonathan.Cameron@huawei.com,
	beata.michalska@arm.com, xin@zytor.com, davydov-max@yandex-team.ru,
	ravi.bangoria@amd.com, joel.granados@kernel.org,
	ffmancera@riseup.net, kprateek.nayak@amd.com,
	akpm@linux-foundation.org, bhe@redhat.com, brgerst@gmail.com,
	coxu@redhat.com, dmaluka@chromium.org, linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org, linux-sgx@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux.dev,
	tboot-devel@lists.sourceforge.net, nouveau@lists.freedesktop.org,
	linux-coco@lists.linux.dev, xen-devel@lists.xenproject.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Zhenghan Cheng <your_email@example.com>
Subject: Re: [PATCH] x86: Fix build warnings about export.h
Message-ID: <20250612190347.GB1283@sol>
References: <20250612093228.7655-1-chengzhenghan@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612093228.7655-1-chengzhenghan@uniontech.com>

On Thu, Jun 12, 2025 at 05:32:28PM +0800, Zhenghan Cheng wrote:
> After commit a934a57a42f64a4 ("scripts/misc-check:
> check missing #include <linux/export.h> when W=1")
> and commit 7d95680d64ac8e836c ("scripts/misc-check:
> check unnecessary #include <linux/export.h> when W=1"),
> we get some build warnings with W=1,such as:
> 
> arch/x86/coco/sev/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> arch/x86/crypto/aria_aesni_avx2_glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> arch/x86/kernel/unwind_orc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> arch/x86/kvm/hyperv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> arch/x86/events/intel/core.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
> arch/x86/events/zhaoxin/core.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
> arch/x86/kernel/crash.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
> arch/x86/kernel/devicetree.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
> 
> so fix these build warnings for x86.
> 
> Signed-off-by: "Zhenghan Cheng" <chengzhenghan@uniontech.com>
> Suggested-by: "Huacai Chen" <chenhuacai@loongson.cn>

FYI, I'm planning to handle arch/x86/lib/crc*.c and arch/x86/lib/crypto/.

(Specifically, I'm migrating them to lib/crc/ and lib/crypto/ respectively, and
one of the effects of that is the EXPORT_SYMBOL in arch-specific crc and crypto
library files go away.  The lib/crc/ change is already in linux-next, and
https://lore.kernel.org/r/20250612183852.114878-1-ebiggers@kernel.org adds
<linux/export.h> to all files with EXPORT_SYMBOL in lib/crc/.)

- Eric

