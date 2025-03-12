Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E80BCA5E311
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 18:47:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910635.1317365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAw-0008IW-U5; Wed, 12 Mar 2025 17:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910635.1317365; Wed, 12 Mar 2025 17:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAw-0008ET-LQ; Wed, 12 Mar 2025 17:47:26 +0000
Received: by outflank-mailman (input) for mailman id 910635;
 Wed, 12 Mar 2025 17:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o35=V7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsQAu-0006eC-Dd
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 17:47:24 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0df9be76-ff6a-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 18:47:23 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso414845e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 10:47:23 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d0b79sm27333805e9.36.2025.03.12.10.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:47:22 -0700 (PDT)
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
X-Inumbo-ID: 0df9be76-ff6a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741801643; x=1742406443; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9cAeUqPHU2Cwtf0V4Y32o0EVczvwD9P2qTJlu4OoBU=;
        b=KdhM5aCh5Poc/OFmfPxHKqaQaVpuJPE0/xDVuJTPNmL23Iy/Qw+18Wf8GUxv6SYFv6
         ffp8naXpMyw7Xciqpqa8ohRrrU8HjCcL+ubig/PRkR+6s6PqxosccqvF0aYInY4mjue2
         lfNzwN9tjtvQgmULG4HK92rloLmht+/+J1fU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801643; x=1742406443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9cAeUqPHU2Cwtf0V4Y32o0EVczvwD9P2qTJlu4OoBU=;
        b=L7pJ9PuGlAPotLGs9Y+SXrNoDzaeDLcTHoctWGn+jh+8yAIDKXg3sYK6z6f2Jt8Zch
         VCKKloVkPnxLEnrVeTISVjMYS1JFvpdp5jQvVsl/hDRs8WQOUijjxOLGXR/FrDFmrGib
         VexHATMvIOjexmlmlpc4HcCK7rCJrDth6JIK7Xev81YX4MWbRbR31Y+HK3YhxPpDSTgB
         Q0MWB2TEFRPOAW7w7UItRMuLmDPalFNVymWQYAMcBpyIKnwheHO8lXIFhXjg8TmPMjvz
         GfbIXh/hGBAf7tJS3rC7+bbU8yI3IWARIspsnqYRZF6CsmD39gjWqP5DZsFPs17AzSE1
         zx4A==
X-Gm-Message-State: AOJu0YwOTP0voMABKou3GebLXqJG6hKxdKm81d4fNyPec3KEnygnK3dq
	dLK0KkQ5nX82bh+0F8r+/0VFsypUpbD89IfZ6hHwPZB/8R/doLIxbjzEIRykpgRPnO8D1TQPbDt
	+
X-Gm-Gg: ASbGncvSfFLo+OWPRES2Hf9gp8HHKflsmgI008S6VXlPVIHMwqW/08DiXkTKtVETV78
	mTb6LFNozjzdyfRTeiUzsm9RNnHyxwxgELPpWsdbPAofZjPoi8kWtUxNfYSpiXQ90Ic4gjnhDeC
	2AFcakb9OaR5FSjkdW9APgPdZymPLu9dpOInuWdHeyyuK2AliRODgyUXcaBXX0JLBTVS3z34dDh
	3YnwDAXEzs3FoWHGDjwZGLMiE3MikXpMwWu2AbAc5cZFhjPKVHuQ/XmTadlbxjmnUbcc1I3gBAP
	xpHBJz+YyxVrz1AIR2623gcL+0tR3m4F0ZyjTiVMqLRegIP7iVjNRMdPCZ4PVrOmdMGFhXrPFTQ
	lSp/aYnnnpf0vbycNtGxiSEw0
X-Google-Smtp-Source: AGHT+IG8sZ3w48VKqI38MuoFdpkslJZlClY6x5DWn0JuaiRhb3MT2pkvAQD8ztt52RawpxEzoLhf4g==
X-Received: by 2002:a05:600c:1d01:b0:43c:e467:d6ce with SMTP id 5b1f17b1804b1-43ce467d720mr153810085e9.4.1741801643163;
        Wed, 12 Mar 2025 10:47:23 -0700 (PDT)
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
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 6/8] xen/mm: Exclude flushtlb.h from mm.h for PPC and RISC-V
Date: Wed, 12 Mar 2025 17:45:11 +0000
Message-Id: <20250312174513.4075066-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

put_page_alloc_ref(), the final function in xen/mm.h uses test_and_clear_bit()
which is picked up transitively by all architectures.  RISC-V gets it only via
flushtlb.h, hence why it notices here.

ARM and x86 will be cleaned up in subsequent patches.

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
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/include/xen/mm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index fff36ff903d6..154e649db9e4 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -61,6 +61,7 @@
 #ifndef __XEN_MM_H__
 #define __XEN_MM_H__
 
+#include <xen/bitops.h>
 #include <xen/bug.h>
 #include <xen/compiler.h>
 #include <xen/list.h>
@@ -586,7 +587,9 @@ void destroy_ring_for_helper(void **_va, struct page_info *page);
 /* Return the upper bound of MFNs, including hotplug memory. */
 unsigned long get_upper_mfn_bound(void);
 
+#if defined(CONFIG_X86) || defined(CONFIG_ARM)
 #include <asm/flushtlb.h>
+#endif
 
 enum XENSHARE_flags {
     SHARE_rw,
-- 
2.39.5


