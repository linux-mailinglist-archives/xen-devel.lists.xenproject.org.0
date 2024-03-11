Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAF8877E6E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 11:54:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691382.1077314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjdIe-0003AE-00; Mon, 11 Mar 2024 10:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691382.1077314; Mon, 11 Mar 2024 10:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjdId-00038F-Tf; Mon, 11 Mar 2024 10:54:31 +0000
Received: by outflank-mailman (input) for mailman id 691382;
 Mon, 11 Mar 2024 10:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UbMp=KR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rjdIc-000389-7c
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 10:54:30 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc056e20-df95-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 11:54:29 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4132c64fdceso2158835e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 03:54:29 -0700 (PDT)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b00412f83e0c11sm15195642wms.22.2024.03.11.03.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 03:54:27 -0700 (PDT)
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
X-Inumbo-ID: bc056e20-df95-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710154468; x=1710759268; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qFSbJRUt82khlam4F2vn9PAAVNAJOSdtfHu56s/6wSM=;
        b=itgv/4mnIAW4XOYQ7E2ujHbGmoiIIj1m313EW3/B7+72JZlZcdLku0kkPsh4K3a+4+
         3JHV3q35QdORpYZTKJSLIrTGkIcwsqGRcggfYAM0780uC3G75raICAIMT65dsdomtcjh
         KVQ1Zaq9KH/s6mueXfCFr8GhQ+mcwr/WueX5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710154468; x=1710759268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFSbJRUt82khlam4F2vn9PAAVNAJOSdtfHu56s/6wSM=;
        b=ORE5+PYd3yHLzZsL3mcvEfrVk/29kv8nIx7GBb7KMBYUJ+/01KcFfI9PMQ90Jvj9CL
         vpMJe3Lfilj+u1I19+wqg3855iyBdGoYpNjJOy8i3KQFlSDAfPgWMZs6jUJ/ZVm6zkJR
         Ydd0wSYh+ZhzDp+f3LHMyU2ki6KraU3SXGcDICGpkoonQa5toea415RRhw2r5aX3wuk+
         /Phxmy/+AeQTKDR+13nkHUcxkW7oUdEMWIZqZS8IocVsXIcWexOtVOINqmIrbGbIGG6T
         FvpJrOnkUOCVwIGMHOjMI1h8gpP2uHGPo2bw2xRUJPujMcm1N56dKBfyHEcsWDR+iiGG
         eewQ==
X-Gm-Message-State: AOJu0Yz8eDJoGo0MF5Zeu0jdDt9eTReavTOwJ0doIQgP68pdqEKyPs1n
	XJk5LC362AN/0+viO9eR5H9M3ZS1hxQszCbs+sc5+1bAnLz4Il8s3lQVmCc92aeSWWSnM/TTbeN
	0
X-Google-Smtp-Source: AGHT+IGiNELZqdLPiQLT4VoVaFfhmhTBYxmO60jlc4Sn12sHDUzMgsHvokkcLAwKi5bqGtHyYKQw1w==
X-Received: by 2002:a05:600c:4449:b0:413:1f5c:baa6 with SMTP id v9-20020a05600c444900b004131f5cbaa6mr4765016wmn.30.1710154468051;
        Mon, 11 Mar 2024 03:54:28 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/mm: fix detection of last L1 entry in modify_xen_mappings_lite()
Date: Mon, 11 Mar 2024 11:54:16 +0100
Message-ID: <20240311105416.4556-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic to detect when to switch to the next L1 table is incorrectly
using l2_table_offset() in order to notice when the last entry on the current
L1 table has been reached.

It should instead use l1_table_offset() to check whether the index has wrapped
to point to the first entry, and so the next L1 table should be used.

Fixes: 8676092a0f16 ('x86/livepatch: Fix livepatch application when CET is active')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
This fixes the osstest livepatch related crash, we have been lucky so far that
the .text section didn't seem to have hit this.
---
 xen/arch/x86/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 2aff6d4b5338..0c6658298de2 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5959,7 +5959,7 @@ void init_or_livepatch modify_xen_mappings_lite(
 
                 v += 1UL << L1_PAGETABLE_SHIFT;
 
-                if ( l2_table_offset(v) == 0 )
+                if ( l1_table_offset(v) == 0 )
                     break;
             }
 
-- 
2.44.0


