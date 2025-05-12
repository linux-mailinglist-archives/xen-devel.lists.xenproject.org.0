Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 067FDAB3210
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 10:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980962.1367371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOny-0003vR-8q; Mon, 12 May 2025 08:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980962.1367371; Mon, 12 May 2025 08:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOny-0003sG-5Q; Mon, 12 May 2025 08:46:34 +0000
Received: by outflank-mailman (input) for mailman id 980962;
 Mon, 12 May 2025 08:46:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4gEQ=X4=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1uEOnw-0003Qj-9c
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 08:46:32 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 970edf60-2f0d-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 10:46:28 +0200 (CEST)
Received: from terminus.zytor.com (terminus.zytor.com
 [IPv6:2607:7c80:54:3:0:0:0:136]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54C8jqc51586901
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 12 May 2025 01:46:00 -0700
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
X-Inumbo-ID: 970edf60-2f0d-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54C8jqc51586901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747039561;
	bh=irTR9cBZ/bUuJJE/VFD2XvoxgAwJuCqUqRaQbxDTnhM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VcTDFlAMSO7tiJedpeu3nDD6gS5DKigxV5zB3FuQKYZuCYrH0Lnq6AyaDavtFxQ+5
	 ivDulsoeXhp5fga7oMz3GqsLoQUCH7YHtAGOBPydV4CeUV1qfkYmG4WfTZ17vkHC8X
	 RH3QbWUsZGXrV8DJbo7Rs8XEeCcGNJQYuntOy9EF5GEngLsIAzmYPxRn2BDdyqkMbx
	 w3IxvetoI01oDeyxtBGKYR7xymh7giIgJSqj4+DupWNwLFA0keD5peqp4UGQ3ZbuxD
	 Id5FCpC5mxUpyYR4tLAS4sui06LZxoaL6E9/ixZj6OIz3pKprWQZgCloVU3I3ImoLP
	 o3GbZYpLKgr/g==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-acpi@vger.kernel.org
Cc: tglx@linutronix.de, mingo@kernel.org, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        peterz@infradead.org, jgross@suse.com, boris.ostrovsky@oracle.com,
        rafael@kernel.org, lenb@kernel.org
Subject: [PATCH v1 1/3] x86/msr: Remove a superfluous inclusion of <asm/asm.h>
Date: Mon, 12 May 2025 01:45:50 -0700
Message-ID: <20250512084552.1586883-2-xin@zytor.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512084552.1586883-1-xin@zytor.com>
References: <20250512084552.1586883-1-xin@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following commit:

  efef7f184f2e ("x86/msr: Add explicit includes of <asm/msr.h>")

added a superfluous inclusion of <asm/asm.h> to

  drivers/acpi/processor_throttling.c.

Remove it.

Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---
 drivers/acpi/processor_throttling.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/acpi/processor_throttling.c b/drivers/acpi/processor_throttling.c
index ecd7fe256153..d1541a386fbc 100644
--- a/drivers/acpi/processor_throttling.c
+++ b/drivers/acpi/processor_throttling.c
@@ -21,7 +21,6 @@
 #include <linux/uaccess.h>
 #include <acpi/processor.h>
 #include <asm/io.h>
-#include <asm/asm.h>
 #ifdef CONFIG_X86
 #include <asm/msr.h>
 #endif
-- 
2.49.0


