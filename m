Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24884B50FC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:05:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271644.466206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb2B-0000jL-Kv; Mon, 14 Feb 2022 13:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271644.466206; Mon, 14 Feb 2022 13:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb2B-0000h6-Fm; Mon, 14 Feb 2022 13:04:51 +0000
Received: by outflank-mailman (input) for mailman id 271644;
 Mon, 14 Feb 2022 13:04:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb29-0008IH-3O
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:04:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af28c3de-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:04:48 +0100 (CET)
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
X-Inumbo-ID: af28c3de-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=vffdhJkQcOZTM/FEyvATjcefKfxzfQ918n4MAzGwqnA=;
  b=a67BnXivL47UiuEZHpBA79Hs3m/KEqQCmrZO1KtGTSZxqoUNeiMZPM5t
   bJyckYB/Wdh/vp4hARWBbL4HH/imWaBYtsZ0JMjN2febPlovND8380wiu
   yfAiDUFfBXwt7TdRgX56sf009nFe7nZLd13Av40iorAFjDM+HwEE6xhyk
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sM20GbCcen2mFkHzTNczXs5slIOV5qqFwR8rms/1B4/eg+cCfD95Sx8tlkm9diDSkpu9Kh79KM
 IbXGPszWolfrSTN5A/PLQNqHzUnGh0/dosl4szeLcIDueiGMIRChT85psiBWhE9yDiaAk/Lcg0
 vj9OZ3jqSE6tboicide6kwTDnSUg5ep3g2RMLgKlCBhxSn6BeSwzrwCUh/AkBZcyyvGmd4Ry+g
 8ZwXUSH/kb+V9qSrG1L0ZkqKiMHWim4waoFCd6jf2mvjemmL9JVdfuBeQ3MKSZcMG2OcFOTdNY
 lXKqS5hrHkeupTHBRiWv7ABy
X-SBRS: 5.1
X-MesageID: 64149316
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qhcvE6yDkFdLcXQflUd6t+cpwSrEfRIJ4+MujC+fZmUNrF6WrkVSy
 DMXWD+HPvaOazPxLop1aoi+8EoOupXUx9JhSwE6qCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbdl2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt5Nv5
 oRMt6Tqcg0SZbXzoOgDWBRqKT4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JwXQaeFP
 pRxhTxHMzjMYS9PB24tOq0Fsc2OokXubw1BkQfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCnoM/gcNtMTvvirKcs2QDNgDxIYPELabelibqnpB+/WeoFE
 EYvoTIRlaQs/0GZdMaoCnVUv0W4lhIbXtNRFcgz5weM1rfY7m6lO4QUctJSQId47ZFrHFTGw
 nfMxoq0XmI37NV5XFrAru/8kN+kBcQCwYbujwcgRBBN3dTsqZpbYvnnHoc6S/7dYjEY9FjNL
 9G2QMoW2u97YS0jjfzTEbX7b9WE/Mahc+LNzl+LNl9JFysgDGJfW6Sm6ELA8dFLJ5uDQ1+Ks
 RAswpbCsL9eXczQzHXWGo3h+Y1FAN7fblXhbaNHRcF9p1xBBVb/FWyv3N2ODBgwaZtVEdMYS
 ETSpRlQ9Pdu0IiCNsdKj3aKI51yl8DITI29PtiNN4YmSsUhJWevoXA1DWbNjj+FraTZufxmU
 XttWZ33Vihy5GUO5GfeetrxJpd1mnFglTuLH8iTItbO+eP2WUN5gIwtaDOmBt3VJoveyOkM2
 9oAZcaM1TtFV+jyPnve/YIJdAhYJnknH5Hm7cdQc7fbcAZhHWggDd7XwK8gJNM5z/gEyL+Q8
 yHvQFJcxXr+mWbDdVeAZEd8Ze69Rp14t386Y3AhZA76x3g5bI+zx64DbJ9rL6I//eluwKcsH
 fkIcsmNGNpVTTHD92hPZJXxttU6Jh+qmRiPL2yuZz1mJ8xsQAnA+9nFeArz9XZRUnrr5JVm+
 7D5j1HVW5sOQQhmHf36UvP3wgPjp2UZlcJzQ1DMfotZdnLz/dU4MCf2lPI2fZ0BcE2R2juA2
 g+KKh4Evu2R8ZQt+dzEiK3Y/YekF+xyQhhTE2XBtOvkMCDb+iyowJNaUfbOdjfYDTum9KKnb
 ORT7vf9LPxYwwoa79siS+5mnfAk+t/ih75G1QA1TnzEYmOiBq5kPnTbj9JEsbdAx+MBtAa7M
 q5VFgK25Vld1BvZLWMs
IronPort-HdrOrdr: A9a23:D+YHTa9R+7BH4lPnc1Nuk+DaI+orL9Y04lQ7vn2YSXRuHPBw9v
 re5cjzuiWVtN98Yh0dcJW7Scy9qBDnhPhICOsqTNSftWDd0QPCRuxfBMnZslnd8kXFh4lgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149316"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 26/70] xen/decompress: CFI hardening
Date: Mon, 14 Feb 2022 12:50:43 +0000
Message-ID: <20220214125127.17985-27-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/bunzip2.c            | 2 +-
 xen/common/decompress.c         | 2 +-
 xen/common/unlzma.c             | 2 +-
 xen/common/zstd/zstd_common.c   | 4 ++--
 xen/common/zstd/zstd_internal.h | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/common/bunzip2.c b/xen/common/bunzip2.c
index 2087cfbbedc8..782b589a8b01 100644
--- a/xen/common/bunzip2.c
+++ b/xen/common/bunzip2.c
@@ -607,7 +607,7 @@ static int __init read_bunzip(struct bunzip_data *bd, unsigned char *outbuf, int
 	goto decode_next_byte;
 }
 
-static int __init nofill(void *buf, unsigned int len)
+static int __init cf_check nofill(void *buf, unsigned int len)
 {
 	return -1;
 }
diff --git a/xen/common/decompress.c b/xen/common/decompress.c
index 79e60f4802d5..989336983f61 100644
--- a/xen/common/decompress.c
+++ b/xen/common/decompress.c
@@ -3,7 +3,7 @@
 #include <xen/string.h>
 #include <xen/decompress.h>
 
-static void __init error(const char *msg)
+static void __init cf_check error(const char *msg)
 {
     printk("%s\n", msg);
 }
diff --git a/xen/common/unlzma.c b/xen/common/unlzma.c
index d0ef78eef0d1..6cd99023adf6 100644
--- a/xen/common/unlzma.c
+++ b/xen/common/unlzma.c
@@ -76,7 +76,7 @@ struct rc {
 #define RC_MODEL_TOTAL_BITS 11
 
 
-static int __init nofill(void *buffer, unsigned int len)
+static int __init cf_check nofill(void *buffer, unsigned int len)
 {
 	return -1;
 }
diff --git a/xen/common/zstd/zstd_common.c b/xen/common/zstd/zstd_common.c
index 9a85e938cdd6..5c44e5db7671 100644
--- a/xen/common/zstd/zstd_common.c
+++ b/xen/common/zstd/zstd_common.c
@@ -54,12 +54,12 @@ void *__init ZSTD_stackAllocAll(void *opaque, size_t *size)
 	return stack_push(stack, *size);
 }
 
-void *__init ZSTD_stackAlloc(void *opaque, size_t size)
+void *__init cf_check ZSTD_stackAlloc(void *opaque, size_t size)
 {
 	ZSTD_stack *stack = (ZSTD_stack *)opaque;
 	return stack_push(stack, size);
 }
-void __init ZSTD_stackFree(void *opaque, void *address)
+void __init cf_check ZSTD_stackFree(void *opaque, void *address)
 {
 	(void)opaque;
 	(void)address;
diff --git a/xen/common/zstd/zstd_internal.h b/xen/common/zstd/zstd_internal.h
index b7dd14f6ce79..94f8c586220e 100644
--- a/xen/common/zstd/zstd_internal.h
+++ b/xen/common/zstd/zstd_internal.h
@@ -351,8 +351,8 @@ typedef struct {
 ZSTD_customMem ZSTD_initStack(void *workspace, size_t workspaceSize);
 
 void *ZSTD_stackAllocAll(void *opaque, size_t *size);
-void *ZSTD_stackAlloc(void *opaque, size_t size);
-void ZSTD_stackFree(void *opaque, void *address);
+void *cf_check ZSTD_stackAlloc(void *opaque, size_t size);
+void cf_check ZSTD_stackFree(void *opaque, void *address);
 
 /*======  common function  ======*/
 
-- 
2.11.0


