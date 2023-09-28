Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB347B1F76
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 16:31:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609893.949048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qls33-00014u-Bg; Thu, 28 Sep 2023 14:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609893.949048; Thu, 28 Sep 2023 14:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qls33-00011n-7q; Thu, 28 Sep 2023 14:31:25 +0000
Received: by outflank-mailman (input) for mailman id 609893;
 Thu, 28 Sep 2023 14:31:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s/xa=FM=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qls31-00011h-5u
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 14:31:23 +0000
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [2607:f8b0:4864:20::c29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b179463c-5e0b-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 16:31:21 +0200 (CEST)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-57b64731334so6417092eaf.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Sep 2023 07:31:21 -0700 (PDT)
Received: from leoy-yangtze.lan (211-75-219-203.hinet-ip.hinet.net.
 [211.75.219.203]) by smtp.gmail.com with ESMTPSA id
 r16-20020a638f50000000b00578db618c83sm13093128pgn.36.2023.09.28.07.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 07:31:19 -0700 (PDT)
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
X-Inumbo-ID: b179463c-5e0b-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695911480; x=1696516280; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BfTcJV/a1b6cAFtwTa7R4HeOQgV7MOOw/WXNMyr4BUw=;
        b=qKRP2xetvxYtT7ace+Fy3jYJMtyVyRLzd0GrVQBgQy5pNRPg7WRWXbGb8GxHlky3Nj
         5BSqq2mml7OTBv157Rz+knbTfpbcqnSdXV+UaxxacbNBRCvNtc5iGmAaJzrJd96H2IdK
         wTMjWWLjbipTN1HfnZvtNZYwkLLMcAFh1sPkCyaGP4wH3kc6MDul7yBwu1+pO27nGHcR
         HaBFtD4bWmjj35eAR9SatFlmGDFDCxCyIbOq3TMNgaNXlMNfvh3EifpmAhE6OKbe6YMI
         r8h+b8XCkee9kb8oIE8c5oJJSmC+njEmH/wmbiGZLi7KN2xkzIXd4X3TQ/ecxe59k+ms
         ULMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695911480; x=1696516280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BfTcJV/a1b6cAFtwTa7R4HeOQgV7MOOw/WXNMyr4BUw=;
        b=XrITvmj+a0y6BD4DIaZJs0H7Kxa1QmzR28dT7cB679gn34QyZmhgqH3kKPEpV1zY0x
         FG52GNehSauqOLOCY71hehiEdCEsRl/gMyaERb83JoyMg/RN0FMnFEV4Wep1i7M70s8A
         arMbecJyYsOZz8BIfQcU9bHr3xHBRrA226eKQWjZd69Qj0JQIY710e5OVd1nbI6Tu9ah
         20curik9QtDIr4BiCn56q+vF0p/4o8Ld7c59GR7zvCtLojlcQ+1T6nBKJfocTnCJZ2OD
         +HHONwRS2QA0oc73pvwqwrUjL8hVhNP6ldpnst4heIUe19IoX5LqSNzZSE2HWL4LFHiz
         s11A==
X-Gm-Message-State: AOJu0YxZjRKImEaPGK0JMCJrX6Y7Z1v5dLC5ndTR7S1BeJqIO2nCJw7F
	Enbgx/Ugt4RV6TKII4SmZiEi7FiRfMJRg0KSpKuWRMzD
X-Google-Smtp-Source: AGHT+IEycY0JaHtVyHyzFWhV7ziTWGKnK7VcK2jBVk6k15k8+iAV7xrH3ZOlHFfnhaiYHK+81bRMQw==
X-Received: by 2002:a05:6358:3406:b0:141:d2d:6da7 with SMTP id h6-20020a056358340600b001410d2d6da7mr1373240rwd.17.1695911480115;
        Thu, 28 Sep 2023 07:31:20 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2] xen/arm: Skip memory nodes if not enabled
Date: Thu, 28 Sep 2023 22:31:10 +0800
Message-Id: <20230928143110.248221-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the Xen hypervisor doesn't handle the status, the issue can
be described from two perspectives: the memory nodes and the reserved
memory nodes.

- If a memory node has a status "disabled" it implies that it should
  not be used. Xen does not handle the status property for the memory
  node and ends up using it.

- If a reserved memory node has a status "disabled", it means that this
  region is no longer reserved and can be used, but the "disabled"
  status is not handled by Xen.

  Xen passes the intact device tree binding of the reserved memory nodes
  to Dom0 and creates a memory node to cover reserved regions. Disabled
  reserved memory nodes are ignored by the Dom0 Linux kernel, thus the
  Dom0 Linux kernel will continue to allocate pages from such a region.

  On the other hand, since the disabled status is not handled by Xen,
  the disabled reserved memory regions are excluded from the page
  management in Xen which results in Xen being unable to obtain the
  corresponding MFN, in the end, Xen reports error like:

  (XEN) arch/arm/p2m.c:2202: d0v0: Failing to acquire the MFN 0x1a02dc

This patch introduces a function device_tree_node_is_available(). If it
detects a memory node is not enabled, Xen will not add the memory region
into the memory lists. In the end, this avoids to generate the memory
node for the disabled memory regions sent to the kernel and the kernel
cannot use the disabled memory nodes any longer.

Since this patch adds checking device node's status in the
device_tree_get_meminfo() function, except it checks for memory nodes
and reserved memory nodes, it also supports status for static memory
and static heap.

Suggested-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---

Changes from v1:
- Renamed function to device_tree_node_is_available() (Michal Orzel);
- Polished coding style (Michal Orzel);
- Refined commit log (Michal Orzel, Julien Grall).

 xen/arch/arm/bootfdt.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 2673ad17a1..1b80d2d622 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -16,6 +16,19 @@
 #include <xsm/xsm.h>
 #include <asm/setup.h>
 
+static bool __init device_tree_node_is_available(const void *fdt, int node)
+{
+    const char *status = fdt_getprop(fdt, node, "status", NULL);
+
+    if ( !status )
+        return true;
+
+    if ( !strcmp(status, "ok") || !strcmp(status, "okay") )
+        return true;
+
+    return false;
+}
+
 static bool __init device_tree_node_matches(const void *fdt, int node,
                                             const char *match)
 {
@@ -97,6 +110,9 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     paddr_t start, size;
     struct meminfo *mem = data;
 
+    if ( !device_tree_node_is_available(fdt, node) )
+        return 0;
+
     if ( address_cells < 1 || size_cells < 1 )
     {
         printk("fdt: property `%s': invalid #address-cells or #size-cells",
-- 
2.39.2


