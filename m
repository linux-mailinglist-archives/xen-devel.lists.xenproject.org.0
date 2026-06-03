Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CpGVMKrrH2qwsQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:54:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 723B8635E37
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:54:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=CwCbnY1b;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1325897.1591266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhM6-0003ZV-PK; Wed, 03 Jun 2026 08:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325897.1591266; Wed, 03 Jun 2026 08:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhM6-0003Ux-Jm; Wed, 03 Jun 2026 08:53:42 +0000
Received: by outflank-mailman (input) for mailman id 1325897;
 Wed, 03 Jun 2026 08:53:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUhM4-0003L6-Dq
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:53:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUhM3-006GVP-Qd
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 10:53:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1feb91-e002-0a2a0a5209dd-0a2a450cddea-16
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:53:39 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a1feb93-62f1-0a2a450c0019-d155802cc043-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:53:39 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4903f7a90d1so113292725e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 01:53:39 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b7c6b966sm24070335e9.2.2026.06.03.01.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 01:53:38 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1780476819; x=1781081619; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G9hdlfubYAVkY5BTqL/WBD4kbNC0poE5EI/Mq9Bxg0=;
        b=CwCbnY1b5UdGD0Eu1sUlOOofdu+IQaHFUCyaTwsaWsUTZvmtAYzf1WXoe+tj5F5lwB
         hBHTKeIBTzFCJ3cGiA+VtARLKMHxD7AvBwK1zOz/Cjwt9BwT4QQhUA3IMAqWxlnKS7jS
         b7xMQhJ9rd7KLXU0GjfiD+v0fWK8OAZSktwj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780476819; x=1781081619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7G9hdlfubYAVkY5BTqL/WBD4kbNC0poE5EI/Mq9Bxg0=;
        b=Yn7h+MowgG+NyjmZywyJqZaYJrEPNjQ2YWTZdXuDsuccIe7MIM3NjUg2s18ultMw5P
         DNjgFIaW0MGhITtZNwA5IARRmHCr1lJb4WrKaxHJq48DJOhNgrDNEuUTp8y7zcq6r944
         AK4uHvONbRd7NBte7Ktba1jrV6hESpzx88A9Souu2wVRfx/F14kwoTC57BCyIv7Sinnq
         kOHHLFJYmiHzPOulM8kCIm6ncfRG+yhKQ4ESR6vf+/m2AzlA3Sc9Cdl3zNGoXmjsMrR3
         qahf1Lqv8qQ0bwxLYulrHdSjoa7kCp+sRuoHHfu/q7NW0jEcx10YDBtOiFahzA97lCZl
         olbg==
X-Gm-Message-State: AOJu0YwZ5u0aODpvpX+yJoGjGNCUbdX6trJ2bhhY+nRhXq7Lwu/xjkHC
	jPR90WOCiI70qj44JU3o73O3Tbi+2UrmUSPEVg30dKWWkQEUM5DP5OOerlXMN5X74oHsWowUaiF
	vQ7YK
X-Gm-Gg: Acq92OGaJyMVW8s3DTXGh5YMsgPX+2evR9WVmpENBxTFVskqcmKGT9ZyQrP+Pxvvonj
	YiydUhuuWFGD5XNIU5og7bE2rrOJiZuiSa9FbnKHY2Gh8lSfZpVvD7eLj84ingsL7ANOC5t8RBZ
	oVGwroL73oEU0y8dXO0Exo9XHSYi41tBTOxGHtsalfFRBUReKPJjxFsmTB1NVRM9+DrDky94zfX
	kSWetca0paH80Zy2sV32xxHxN7Ffxivj78c9N+j5U0wSdpV1IMUNawRrr1cy9gW3c9zHCCE4KDv
	1NL7qWqx8NXC8KzB9N4yo+hcsv6xIyCs3BBv08Dded+5j7JS92DYNO2cEDhrmDvzdpm9tF6HPkR
	0sY4eb88MeqwZa3fKFcv6mBX6BnzYpgWCM/5wxiftAaa51O0gNps7lLGus1kbMvkEMBQ/JM9e69
	EO9cwQtm8uERK/yOLPE3uVn5u+8AmZWyJZV10mKf+PcGihxI4gSbAqrS1Y5Ovv93+CSrhRPpwfD
	ux6/yP4AULaFdsW8X/wXi6CwA==
X-Received: by 2002:a05:600c:1d86:b0:48a:58ae:9938 with SMTP id 5b1f17b1804b1-490b5fe95ebmr39488945e9.19.1780476819121;
        Wed, 03 Jun 2026 01:53:39 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/2] tools/libs/guest: Use the system liblz4 in the bzimage loader
Date: Wed,  3 Jun 2026 09:53:31 +0100
Message-Id: <20260603085331.2704108-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
References: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1780476819-D996DCF5-EAD92777/10/73395122804
X-purgate-type: spam
X-purgate-size: 11004
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 723B8635E37

Right now lz4, unlike every other compression scheme, unconditionally uses
Xen's unsafe decompressor.  Make it consistent with all other compression
schemes by using liblz4.

The unsafe decompression is still required for the MiniOS build, so rename
xg_dom_decompress_lz4.c to xg_dom_decompress_unsafe_lz4.c and drop the
non-MiniOS content.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 tools/libs/guest/Makefile.common              |   2 +-
 tools/libs/guest/xg_dom_bzimageloader.c       | 128 +++++++++++++++-
 tools/libs/guest/xg_dom_decompress.h          |   6 -
 tools/libs/guest/xg_dom_decompress_lz4.c      | 143 ------------------
 tools/libs/guest/xg_dom_decompress_unsafe.h   |   2 +
 .../libs/guest/xg_dom_decompress_unsafe_lz4.c |  39 +++++
 6 files changed, 169 insertions(+), 151 deletions(-)
 delete mode 100644 tools/libs/guest/xg_dom_decompress.h
 delete mode 100644 tools/libs/guest/xg_dom_decompress_lz4.c
 create mode 100644 tools/libs/guest/xg_dom_decompress_unsafe_lz4.c

diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.common
index b928a4a246a9..86b1f160e536 100644
--- a/tools/libs/guest/Makefile.common
+++ b/tools/libs/guest/Makefile.common
@@ -46,7 +46,6 @@ OBJS-y                 += xg_dom_core.o
 OBJS-y                 += xg_dom_boot.o
 OBJS-y                 += xg_dom_elfloader.o
 OBJS-$(CONFIG_X86)     += xg_dom_bzimageloader.o
-OBJS-$(CONFIG_X86)     += xg_dom_decompress_lz4.o
 OBJS-$(CONFIG_X86)     += xg_dom_hvmloader.o
 OBJS-$(CONFIG_ARM)     += xg_dom_armzimageloader.o
 OBJS-y                 += xg_dom_binloader.o
@@ -59,6 +58,7 @@ OBJS-$(CONFIG_ARM)     += xg_dom_arm.o
 ifeq ($(CONFIG_LIBXC_MINIOS),y)
 OBJS-y                 += xg_dom_decompress_unsafe.o
 OBJS-y                 += xg_dom_decompress_unsafe_bzip2.o
+OBJS-y                 += xg_dom_decompress_unsafe_lz4.o
 OBJS-y                 += xg_dom_decompress_unsafe_lzma.o
 OBJS-y                 += xg_dom_decompress_unsafe_lzo1x.o
 OBJS-y                 += xg_dom_decompress_unsafe_xz.o
diff --git a/tools/libs/guest/xg_dom_bzimageloader.c b/tools/libs/guest/xg_dom_bzimageloader.c
index 1fb4e5a1f728..32b3c682a447 100644
--- a/tools/libs/guest/xg_dom_bzimageloader.c
+++ b/tools/libs/guest/xg_dom_bzimageloader.c
@@ -32,7 +32,6 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xg_dom_decompress.h"
 
 #include <xen-tools/common-macros.h>
 
@@ -623,6 +622,133 @@ static int xc_try_zstd_decode(
 
 #endif
 
+#if defined(HAVE_LZ4)
+
+#include <lz4.h>
+
+#define ARCHIVE_MAGICNUMBER 0x184C2102
+
+static int xc_try_lz4_decode(struct xc_dom_image *dom, void **blob, size_t *size)
+{
+    size_t outsize, insize;
+    unsigned char *outbuf = NULL, *inp = *blob, *outp;
+    uint32_t chunksize;
+
+    /* Magic, descriptor byte, and trailing size field. */
+    if ( *size <= 8 )
+    {
+        DOMPRINTF("LZ4: insufficient input data");
+        goto err;
+    }
+
+    insize = *size - 4;
+    outsize = get_unaligned_le32(*blob + insize);
+
+    if ( xc_dom_kernel_check_size(dom, outsize) )
+    {
+        DOMPRINTF("LZ4: output too large");
+        goto err;
+    }
+
+    outbuf = malloc(outsize);
+    if ( !outbuf )
+    {
+        DOMPRINTF("LZ4: failed to alloc memory");
+        goto err;
+    }
+    outp = outbuf;
+
+    chunksize = get_unaligned_le32(inp);
+    if ( chunksize == ARCHIVE_MAGICNUMBER )
+    {
+        inp    += 4;
+        insize -= 4;
+    }
+    else
+    {
+        DOMPRINTF("LZ4: invalid header");
+        goto err;
+    }
+
+    for ( ;; )
+    {
+        int dst_len, len;
+
+        if ( insize < 4 )
+        {
+            DOMPRINTF("LZ4: missing data");
+            goto err;
+        }
+
+        chunksize = get_unaligned_le32(inp);
+        inp    += 4;
+        insize -= 4;
+
+        if ( chunksize == ARCHIVE_MAGICNUMBER )
+            continue;
+
+        if ( chunksize > insize )
+        {
+            DOMPRINTF("LZ4: insufficient input data");
+            goto err;
+        }
+
+        dst_len = outsize - (outp - outbuf);
+        len = LZ4_decompress_safe((const void *)inp,
+                                  (void *)outp, chunksize, dst_len);
+
+        if ( len < 0 )
+        {
+            DOMPRINTF("LZ4: decoding failed");
+            goto err;
+        }
+
+        outp   += len;
+        inp    += chunksize;
+        insize -= chunksize;
+
+        if ( insize == 0 )
+            break;
+    }
+
+    if ( (outp - outbuf) != outsize )
+    {
+        DOMPRINTF("LZ4: got 0x%zx bytes instead of 0x%zx",
+                  outp - outbuf, outsize);
+        goto err;
+    }
+
+    if ( xc_dom_register_external(dom, outbuf, outsize) )
+    {
+        DOMPRINTF("LZ4: error registering stream output");
+        goto err;
+    }
+
+    DOMPRINTF("%s: LZ4 decompress OK, 0x%zx -> 0x%zx",
+              __FUNCTION__, insize, outsize);
+
+    *blob = outbuf;
+    *size = outsize;
+
+    return 0;
+
+ err:
+    free(outbuf);
+    return -1;
+}
+
+#else /* !defined(HAVE_LZ4) */
+
+static int xc_try_lz4_decode(struct xc_dom_image *dom, void **blob, size_t *size)
+{
+    xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
+                 "%s: LZ4 decompress support unavailable\n",
+                 __FUNCTION__);
+    return -1;
+}
+
+#endif
+
 #endif /* !__MINIOS__ */
 
 struct setup_header {
diff --git a/tools/libs/guest/xg_dom_decompress.h b/tools/libs/guest/xg_dom_decompress.h
deleted file mode 100644
index d7a45f730d67..000000000000
--- a/tools/libs/guest/xg_dom_decompress.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifdef __MINIOS__
-# include "xg_dom_decompress_unsafe.h"
-#endif
-
-int xc_try_lz4_decode(struct xc_dom_image *dom, void **blob, size_t *size);
-
diff --git a/tools/libs/guest/xg_dom_decompress_lz4.c b/tools/libs/guest/xg_dom_decompress_lz4.c
deleted file mode 100644
index 53ef0bf328ed..000000000000
--- a/tools/libs/guest/xg_dom_decompress_lz4.c
+++ /dev/null
@@ -1,143 +0,0 @@
-#include <stdio.h>
-#include <stdlib.h>
-#include <inttypes.h>
-#include <stdint.h>
-
-#include INCLUDE_ENDIAN_H
-
-#define XG_NEED_UNALIGNED
-#include "xg_private.h"
-#include "xg_dom_decompress.h"
-
-#define CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
-
-typedef uint8_t u8;
-typedef uint16_t u16;
-typedef uint32_t u32;
-typedef uint64_t u64;
-
-#define likely(a) a
-#define unlikely(a) a
-
-static inline uint16_t le16_to_cpu(uint16_t v)
-{
-#if BYTE_ORDER == BIG_ENDIAN
-    return __builtin_bswap16(v);
-#else
-    return v;
-#endif
-}
-
-#include "../../xen/include/xen/lz4.h"
-#include "../../xen/common/decompress.h"
-
-#ifndef __MINIOS__
-
-#include "../../xen/common/lz4/decompress.c"
-
-#define ARCHIVE_MAGICNUMBER 0x184C2102
-
-int xc_try_lz4_decode(
-	struct xc_dom_image *dom, void **blob, size_t *psize)
-{
-	int ret = -1;
-	unsigned char *inp = *blob, *output, *outp;
-	ssize_t size = *psize - 4;
-	size_t out_len, dest_len, chunksize;
-	const char *msg;
-
-	if (size < 4) {
-		msg = "input too small";
-		goto exit_0;
-	}
-
-	out_len = get_unaligned_le32(inp + size);
-	if (xc_dom_kernel_check_size(dom, out_len)) {
-		msg = "Decompressed image too large";
-		goto exit_0;
-	}
-
-	output = malloc(out_len);
-	if (!output) {
-		msg = "Could not allocate output buffer";
-		goto exit_0;
-	}
-	outp = output;
-
-	chunksize = get_unaligned_le32(inp);
-	if (chunksize == ARCHIVE_MAGICNUMBER) {
-		inp += 4;
-		size -= 4;
-	} else {
-		msg = "invalid header";
-		goto exit_2;
-	}
-
-	for (;;) {
-		if (size < 4) {
-			msg = "missing data";
-			goto exit_2;
-		}
-		chunksize = get_unaligned_le32(inp);
-		if (chunksize == ARCHIVE_MAGICNUMBER) {
-			inp += 4;
-			size -= 4;
-			continue;
-		}
-		inp += 4;
-		size -= 4;
-		if (chunksize > size) {
-			msg = "insufficient input data";
-			goto exit_2;
-		}
-
-		dest_len = out_len - (outp - output);
-		ret = lz4_decompress_unknownoutputsize(inp, chunksize, outp,
-				&dest_len);
-		if (ret < 0) {
-			msg = "decoding failed";
-			goto exit_2;
-		}
-
-		ret = -1;
-		outp += dest_len;
-		size -= chunksize;
-
-		if (size == 0)
-		{
-			if ( xc_dom_register_external(dom, output, out_len) )
-			{
-				msg = "Error registering stream output";
-				goto exit_2;
-			}
-			*blob = output;
-			*psize = out_len;
-			return 0;
-		}
-
-		if (size < 0) {
-			msg = "data corrupted";
-			goto exit_2;
-		}
-
-		inp += chunksize;
-	}
-
-exit_2:
-	free(output);
-exit_0:
-	DOMPRINTF("LZ4 decompression error: %s\n", msg);
-	return ret;
-}
-
-#else /* __MINIOS__ */
-
-#include "../../xen/common/unlz4.c"
-
-int xc_try_lz4_decode(
-    struct xc_dom_image *dom, void **blob, size_t *size)
-{
-    return xc_dom_decompress_unsafe(unlz4, dom, blob, size);
-}
-
-#endif
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe.h b/tools/libs/guest/xg_dom_decompress_unsafe.h
index ac6b94288d5e..5bc222207653 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe.h
+++ b/tools/libs/guest/xg_dom_decompress_unsafe.h
@@ -16,6 +16,8 @@ int xc_dom_decompress_unsafe(
 
 int xc_try_bzip2_decode(struct xc_dom_image *dom, void **blob, size_t *size)
     __attribute__((visibility("internal")));
+int xc_try_lz4_decode(struct xc_dom_image *dom, void **blob, size_t *size)
+    __attribute__((visibility("internal")));
 int xc_try_lzma_decode(struct xc_dom_image *dom, void **blob, size_t *size)
     __attribute__((visibility("internal")));
 int xc_try_lzo1x_decode(struct xc_dom_image *dom, void **blob, size_t *size)
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_lz4.c b/tools/libs/guest/xg_dom_decompress_unsafe_lz4.c
new file mode 100644
index 000000000000..405143aa6182
--- /dev/null
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_lz4.c
@@ -0,0 +1,39 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <inttypes.h>
+#include <stdint.h>
+
+#include INCLUDE_ENDIAN_H
+
+#define XG_NEED_UNALIGNED
+#include "xg_private.h"
+#include "xg_dom_decompress.h"
+
+#define CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+
+typedef uint8_t u8;
+typedef uint16_t u16;
+typedef uint32_t u32;
+typedef uint64_t u64;
+
+#define likely(a) a
+#define unlikely(a) a
+
+static inline uint16_t le16_to_cpu(uint16_t v)
+{
+#if BYTE_ORDER == BIG_ENDIAN
+    return __builtin_bswap16(v);
+#else
+    return v;
+#endif
+}
+
+#include "../../xen/include/xen/lz4.h"
+#include "../../xen/common/decompress.h"
+#include "../../xen/common/unlz4.c"
+
+int xc_try_lz4_decode(
+    struct xc_dom_image *dom, void **blob, size_t *size)
+{
+    return xc_dom_decompress_unsafe(unlz4, dom, blob, size);
+}
-- 
2.39.5


