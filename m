Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478297C8098
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 10:48:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616310.958206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDpU-00020g-Ao; Fri, 13 Oct 2023 08:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616310.958206; Fri, 13 Oct 2023 08:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDpU-0001xx-75; Fri, 13 Oct 2023 08:47:32 +0000
Received: by outflank-mailman (input) for mailman id 616310;
 Fri, 13 Oct 2023 08:47:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XgWV=F3=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1qrDpT-0001xr-1h
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 08:47:31 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23d0b646-69a5-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 10:47:28 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c17de836fbso23787811fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 01:47:28 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 v10-20020a5d678a000000b0032d9f32b96csm569185wru.62.2023.10.13.01.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 01:47:27 -0700 (PDT)
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
X-Inumbo-ID: 23d0b646-69a5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697186848; x=1697791648; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcZTSQIpbpwyV8p0pRSuuu/VA6jNLdNli4zn1qzWBPs=;
        b=FI4i+PcKVTNNACTXf1GRvFqYPJawDbu6OGqMg4rWyu58eIqfDfdHtm95ur2xuwQCvG
         kJu4fv0Q1D1dw7HeyLL873xWegVZ7wqvnTHZxH/X3754osd4jRgcvWJJSYPmJdTRQKkS
         N4k7kOLZtoG1ymBuTYLcahHBFX8Wwr52HsptTbv+5eitSpTIgT59Yidu54BzffjmnU/L
         H3/ZCZXHT9ogIVT0kDjQCAuXUbLOaOOW+m8VmuyE65pAuQ9mmgc9bEUq13knizjOQWml
         jSNXckZiyX2jugBsTByvu9A1sKzFoPbOVgnL8E6KsVGcQE+BP8QDhw5pX25T6d7K2edM
         Ge4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697186848; x=1697791648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JcZTSQIpbpwyV8p0pRSuuu/VA6jNLdNli4zn1qzWBPs=;
        b=eF4vC23nBgo+HA0k3lbM/1RzTJCKtWrmjf13wQKg3d8BIBUn6JFLXPAd5qIH9x5hU2
         wkpMn6U/mgnAQzPIJj+IrKRsNoPIdYdWvaAaz7ZzNlVUQnFYgm2S6Ej71PqMNepe8tML
         SST8Uyed3Ip8KxyYZA2I0SKDEpkqXLbAEBk3I38nzA0Quc6eL1yz/WbHnNL+qQlI88CV
         7K/Dl1ubILXhNFCbvF5jE96qSQZZp9tsAvGYQ3yjBszdclbNlMpAng+WymRN+5eQLbgQ
         Oggno0M+a+025eqnXT07F5ABD6thIl/xQi2cpHcptrD7igdCP7auLLPgqQP0yv/kSoTj
         gA2g==
X-Gm-Message-State: AOJu0YyP0zEFZlzlnqralKQSx0En2/rKNq6/6A+AAOP9z9W62iUucdjw
	vX1c7oJaHqntL6rk3fNoKTxhgg==
X-Google-Smtp-Source: AGHT+IGLuC9HKW/QNYVooLucDlhbrhXRUmiwPIIyaiW89GtG8Q02ZXeqgArmC7ch07Ic5cPqZPab5A==
X-Received: by 2002:a2e:9a84:0:b0:2c2:8e57:24a7 with SMTP id p4-20020a2e9a84000000b002c28e5724a7mr24325725lji.21.1697186848424;
        Fri, 13 Oct 2023 01:47:28 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-block@nongnu.org (open list:virtio-blk),
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [RFC PATCH v3 08/78] hw/block: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 11:45:36 +0300
Message-Id: <88122696480ffb58fa39af81d254aa656afbcd64.1697186560.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
References: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/block/dataplane/xen-block.c | 4 ++--
 hw/block/m25p80.c              | 2 +-
 hw/block/onenand.c             | 2 +-
 hw/block/pflash_cfi01.c        | 1 +
 hw/block/pflash_cfi02.c        | 6 ++++--
 5 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 3b6f2b0aa2..1ae25a73b2 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -159,7 +159,7 @@ static int xen_block_parse_request(XenBlockRequest *request)
         if (!request->req.nr_segments) {
             return 0;
         }
-        /* fall through */
+        fallthrough;
     case BLKIF_OP_WRITE:
         break;
     case BLKIF_OP_DISCARD:
@@ -299,7 +299,7 @@ static void xen_block_complete_aio(void *opaque, int ret)
         if (!request->req.nr_segments) {
             break;
         }
-        /* fall through */
+        fallthrough;
     case BLKIF_OP_READ:
         if (request->status == BLKIF_RSP_OKAY) {
             block_acct_done(blk_get_stats(dataplane->blk), &request->acct);
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index afc3fdf4d6..523c34da71 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1462,7 +1462,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
             s->state = STATE_COLLECTING_DATA;
             break;
         }
-        /* Fallthrough */
+        fallthrough;
 
     default:
         s->pos = 0;
diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 50d3d1c985..87583c48a0 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -564,7 +564,7 @@ static void onenand_command(OneNANDState *s)
         break;
     case 0x95:  /* Multi-block erase */
         qemu_irq_pulse(s->intr);
-        /* Fall through.  */
+        fallthrough;
     case 0x94:  /* Block erase */
         sec = ((s->addr[ONEN_BUF_BLOCK] & 0xfff) |
                         (s->addr[ONEN_BUF_BLOCK] >> 15 ? s->density_mask : 0))
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 62056b1d74..cb58f08f53 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -276,6 +276,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
          */
         pfl->cmd = 0x00;
         /* fall through to read code */
+        fallthrough;
     case 0x00: /* This model reset value for READ_ARRAY (not CFI compliant) */
         /* Flash area read */
         ret = pflash_data_read(pfl, offset, width, be);
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 2a99b286b0..711f978d7c 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -328,6 +328,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
         trace_pflash_read_unknown_state(pfl->name, pfl->cmd);
         pflash_reset_state_machine(pfl);
         /* fall through to the read code */
+        fallthrough;
     case 0x80: /* Erase (unlock) */
         /* We accept reads during second unlock sequence... */
     case 0x00:
@@ -359,6 +360,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
                 break;
             }
             /* Fall through to data read. */
+            fallthrough;
         default:
             ret = pflash_data_read(pfl, offset, width);
         }
@@ -368,7 +370,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
     case 0x30: /* Sector Erase */
         /* Toggle bit 2 during erase, but not program. */
         toggle_dq2(pfl);
-        /* fall through */
+        fallthrough;
     case 0xA0: /* Program */
         /* Toggle bit 6 */
         toggle_dq6(pfl);
@@ -582,7 +584,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
                 pfl->cmd = 0x98;
                 return;
             }
-            /* fall through */
+            fallthrough;
         default:
             trace_pflash_write_invalid(pfl->name, pfl->cmd);
             goto reset_flash;
-- 
2.39.2


