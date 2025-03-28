Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DE0A74B96
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930762.1333384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA7l-0006Nq-Gf; Fri, 28 Mar 2025 13:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930762.1333384; Fri, 28 Mar 2025 13:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA7l-0006Li-Da; Fri, 28 Mar 2025 13:51:53 +0000
Received: by outflank-mailman (input) for mailman id 930762;
 Fri, 28 Mar 2025 13:51:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA10-0005Dj-Tq
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:54 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d24769c3-0bda-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 14:44:50 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso13827195e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:50 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:49 -0700 (PDT)
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
X-Inumbo-ID: d24769c3-0bda-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169490; x=1743774290; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZUHv1N8vC2mMF6eWvDAbxG4QVBLI9VbNCfXt15VpfQ=;
        b=p66dy26dzXdb/XfM8MUYs/aMwxlllqZYYPjH2HUv82xFo+6VLze3WiDIrVgxlZauvm
         O2vye+zfNPiKjD5yIHBPkS5ho9Mpf8uKRaKMfkvmy1eTRg8gN3dIsDx2FA5X98MwbBaa
         6F0OMz0NNs3qOqlqPKOL337EtwtjjYxMLQRgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169490; x=1743774290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZUHv1N8vC2mMF6eWvDAbxG4QVBLI9VbNCfXt15VpfQ=;
        b=UhDRMQfAetTkyN/zLuMkSxuUNdafuJ9vhr2/qI/nB5tFGXvRQCm4b9lSwGedV0j7bt
         NZHkVAaCi4ZePfCsGkradtKFUXf0vNPi5/17d14PP2dsU9INR/5knoOmJVHp7LUzmNzZ
         uyMb4SHc/6l0zk4tiBTDJuLW1IfIXbbujWCB2YNwfnmYTfatIgSmGIWhNORXJBrtliGY
         IrGncHsY9wblOC/jMp0oz+fEiVKMWXTVnnd6ZrMoKDjuul9gQmZYga3zqhZxASxLxoVN
         0NCkYNu0CGEPFgA8F6PZLgejRzxCfXGpF6Cxt4tQR9cDDZZht8YbOednuW/bByo5SlZj
         VbzA==
X-Gm-Message-State: AOJu0Yzh9RRNi7FukezqpZDFtjbcIP8dtIHTIEDVwhMPDKBFYI5zL7iH
	BT8IeJ9TECvyXKY0Doo145Dq1yX9YGXnsJlGa7HOyh99Vp0cnWQeoBNO9NIyrG45+o5+Fnq1vD3
	WPBk=
X-Gm-Gg: ASbGnctBPNHPY4lpVFKfJKOoRsHMBVHgS2Dk9TplAS5mFC2bHc2eTTJDqWu8scbLGgq
	6JNnaUb57xLUk5b6d5XmWMZ3U7tn8N4gSKTt4J6JBas0Jti5OB/xnTxhdjcusAJ1JUfgtqka7pi
	NOY5TmhBBvnu8f5HY3veXDkMLgub1o+sMRmimY83WDC23zKOymA+Ff276xwX7l/9va3hCrRJJEc
	nCu9Im1ai+ht1yTIltx79ZdqRIZUYtzOc3aoe8MWLdMi9YgCfJVUvHDYpi9ctktEPk/x4ojq7kD
	TvszuwKSIn664Fd81jknDB+hqrohr2GoHOBmk9X+jVL3yUX5/Mtmp66NsWKgHpO/Bz/KTm/126D
	qin+Xuukn27MnwPJFRQ==
X-Google-Smtp-Source: AGHT+IHw+QsVzsomMfTCdpkftRub0+DzPQiQkS8UhilMb7h18EvQMtpeEMKhngv8Jt618dN3evt5ew==
X-Received: by 2002:a05:600c:5026:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-43d91435e08mr26331665e9.5.1743169489894;
        Fri, 28 Mar 2025 06:44:49 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Lin Liu <lin.liu@citrix.com>
Subject: [PATCH v5 16/16] x86: Drop asm/byteorder.h
Date: Fri, 28 Mar 2025 13:44:27 +0000
Message-Id: <20250328134427.874848-17-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the common code moved fully onto xen/byteorder.h, clean up the dregs.

It turns out that msi.h has not needed byteorder.h since the use of
__{BIG,LITTLE}_ENDIAN_BITFIELD was dropped in commit d58f3941ce3f ("x86/MSI:
use standard C types in structures/unions").

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
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


