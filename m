Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C77A8B80C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955732.1349452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51QK-0001Rq-Bt; Wed, 16 Apr 2025 11:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955732.1349452; Wed, 16 Apr 2025 11:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51QJ-0001Gn-I5; Wed, 16 Apr 2025 11:59:23 +0000
Received: by outflank-mailman (input) for mailman id 955732;
 Wed, 16 Apr 2025 11:59:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51QF-0006Ay-UK
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:20 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39b43747-1aba-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 13:59:18 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso34303275e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:18 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:59:17 -0700 (PDT)
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
X-Inumbo-ID: 39b43747-1aba-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804758; x=1745409558; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKpw9+M3DGXcB4JzTHPD/cCI8CU9x6+lpkoDYMzsF/g=;
        b=hjcen20RQKDrwoFgJeB/46xX3CUexZKA2YD8k8WKpSOJp8xXlWhoX5G1SIXHdn1DHn
         zjvL4rMsgBuO8peFqse7r0LCkbiFYONCzaGCEGAmySmlIn2SNV6mhe/3Ono4MLX6wEZV
         vZL2uZsE9CTEN1+KaKYaMl4dTaWXDs3XKqty8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804758; x=1745409558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKpw9+M3DGXcB4JzTHPD/cCI8CU9x6+lpkoDYMzsF/g=;
        b=VRSBUBVRDDcmN7ToaPFHefJBNb7+CtyH7nkaZ+w/SlckONZTDim+bV/ks/e8IW5tZV
         MmcBk+riHs65T486lvRJqAjp8iTMbfVzrt5/+KpOhwsQTRw4duUMjzMD8z/d5PDUJhHh
         HpC1u72leB1kz9QZ3ck4bBARU769eOprnPHMhOM5ddsakvhNIePLVlPgs2joyvptNCHA
         QedcMN2IvSt8kGwEsiQLNp+CWMOwoWHZke2m+k45BJHFwgkdGNpc4HPb55O9AwLYX3TL
         1IR/DHeC/AoC3JdZq3r9wbxYmYfRDMvOp8ekz1q3Td4O1VKj17x05GptU52/wRiGFzBK
         Z6xw==
X-Gm-Message-State: AOJu0YztrDCD9c/TxLaSTriJgp0TEa8OmCm2k3ZU02ODn6jqodr7Df11
	ORohD5nrK8y4vX6Gf8FwVbr5on/C2IVFVdK1r0yJ/JbTnBnhSrRL6ctE0T8uQxSqucMdZ6yOip+
	uB9Q=
X-Gm-Gg: ASbGncvYYDi0jCqwTnkjjIMqJSXB3c8lKtEZGEDpefbDIdWg2TQDMVsMIFdMRqEXkAV
	HvDBhzHN26PLf6j0SdDNIIz96xpd7mhMQKvxZgduSXQtso24ldXhm8Nxd3VMlHRwmpOQkHVMQ1Q
	AqyOyhCzhQuKHnN19BpjBEVZpg7o/P+qZ1ka1/e4R3cKSgKOPvnIV9uUZOW8mQB51i2BRNWVq5b
	FQd6gCuBcRIVDNNL4jItQTUnEvCjg4CCLDYHJHTrRvr+9BAgo43yeLOPVs73FCfUu+tLu9M0eYG
	XqJn6aOL0c2Mmp90qc0jU1bs3PymivBQVQ96/XYVfEn9F1Ohwe5cc/EXNNNzrRRaGxCQxSmoDz0
	IO7FMOV40rUS+EA==
X-Google-Smtp-Source: AGHT+IFmAEkbnGyb/KVsN4YJOPjfgZp61pqCDlyaa8aJ5EneztE/mfwwCgka0vJVdAi+aKopAXQwDg==
X-Received: by 2002:a05:600c:811b:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-4405d6cc339mr14006305e9.29.1744804757687;
        Wed, 16 Apr 2025 04:59:17 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Lin Liu <lin.liu@citrix.com>
Subject: [PATCH v6 15/15] x86: Drop asm/byteorder.h
Date: Wed, 16 Apr 2025 12:59:00 +0100
Message-Id: <20250416115900.2491661-16-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the common code moved fully onto xen/byteorder.h, clean up the dregs.

It turns out that msi.h has not needed byteorder.h since the use of
__{BIG,LITTLE}_ENDIAN_BITFIELD was dropped in commit d58f3941ce3f ("x86/MSI:
use standard C types in structures/unions").

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Lin Liu <lin.liu@citrix.com>

v5:
 * New
---
 xen/arch/x86/include/asm/byteorder.h | 6 ------
 xen/arch/x86/include/asm/msi.h       | 1 -
 2 files changed, 7 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/byteorder.h

diff --git a/xen/arch/x86/include/asm/byteorder.h b/xen/arch/x86/include/asm/byteorder.h
deleted file mode 100644
index 3524a6cee741..000000000000
--- a/xen/arch/x86/include/asm/byteorder.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifndef __ASM_X86_BYTEORDER_H__
-#define __ASM_X86_BYTEORDER_H__
-
-#include <xen/byteorder.h>
-
-#endif /* __ASM_X86_BYTEORDER_H__ */
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 975d0f26b35d..00059d4a3a9d 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -3,7 +3,6 @@
 
 #include <xen/cpumask.h>
 #include <xen/pci.h>
-#include <asm/byteorder.h>
 #include <asm/hvm/vmx/vmcs.h>
 
 /*
-- 
2.39.5


