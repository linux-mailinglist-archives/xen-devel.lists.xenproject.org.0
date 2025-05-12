Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F61DAB3212
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 10:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980961.1367360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOnw-0003gv-Ur; Mon, 12 May 2025 08:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980961.1367360; Mon, 12 May 2025 08:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOnw-0003eP-Qk; Mon, 12 May 2025 08:46:32 +0000
Received: by outflank-mailman (input) for mailman id 980961;
 Mon, 12 May 2025 08:46:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4gEQ=X4=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1uEOnw-0003Qj-2f
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 08:46:32 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 970efc9c-2f0d-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 10:46:28 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54C8jqc41586901
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 12 May 2025 01:45:59 -0700
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
X-Inumbo-ID: 970efc9c-2f0d-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54C8jqc41586901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747039560;
	bh=7a7DioSZkOkbzgFBLNF+1MMN8PbvCPClN1vs7CkMDT4=;
	h=From:To:Cc:Subject:Date:From;
	b=g9yE1SUIh+a4/A07fhKWcikSvZS/B1o32tMs/ljMYpKNDM5Mzs8/5CLXUUzW+O2d9
	 anFCSIGiPm6lXib7pAMPfKu9y7K6kCM65jPzDHqpFTNgaiVUrnm8LLASk4DkkPleFV
	 KXWcQs4YY0htPPFfCvcSwzJaxgP0bip3uPvcLW58ILxilulgaXhzoJ3fH7rYGNjr2W
	 Jti+nP3nWugH5PAeH7DXNtt/R17RvC/pPhDLA2a7XbxaimpeGRXO4LZHZhIhz24/d8
	 76LsC0rfGbo5S8nmx6unBRR1HHW9iyGvQiDbgcMLTqL2t+jkloEdlVTsyQg+vtg+z7
	 TwX8Nrssqf2bQ==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org
Cc: tglx@linutronix.de, mingo@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        peterz@infradead.org, jgross@suse.com, boris.ostrovsky@oracle.com,
        rafael@kernel.org, lenb@kernel.org
Subject: [PATCH v1 0/3] MSR fixes and cleanups after last round of MSR cleanups
Date: Mon, 12 May 2025 01:45:49 -0700
Message-ID: <20250512084552.1586883-1-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches:

1) remove a superfluous inclusion of <asm/asm.h> accidently added to
   drivers/acpi/processor_throttling.c in commit:

     efef7f184f2e ("x86/msr: Add explicit includes of <asm/msr.h>").

2) Fix uninitialized symbol 'err' introduced by:

     d815da84fdd0 ("x86/msr: Change the function type of native_read_msr_safe()").

3) Convert a native_wrmsr() use to native_wrmsrq() in
   arch/x86/coco/sev/core.c.


Xin Li (Intel) (3):
  x86/msr: Remove a superfluous inclusion of <asm/asm.h>
  x86/xen/msr: Fix uninitialized symbol 'err'
  x86/msr: Convert a native_wrmsr() use to native_wrmsrq()

 arch/x86/coco/sev/core.c            | 7 +------
 arch/x86/xen/enlighten_pv.c         | 5 ++++-
 drivers/acpi/processor_throttling.c | 1 -
 3 files changed, 5 insertions(+), 8 deletions(-)


base-commit: 9cf78722003178b09c409df9aafe9d79e5b9a74e
-- 
2.49.0


