Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0DA7C8074
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 10:37:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616274.958184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDf0-00074g-31; Fri, 13 Oct 2023 08:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616274.958184; Fri, 13 Oct 2023 08:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDez-000702-V0; Fri, 13 Oct 2023 08:36:41 +0000
Received: by outflank-mailman (input) for mailman id 616274;
 Fri, 13 Oct 2023 07:58:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XgWV=F3=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1qrD3q-0008Gq-J2
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 07:58:18 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 429e3d25-699e-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 09:58:14 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4060b623e64so11590945e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 00:58:14 -0700 (PDT)
Received: from localhost.localdomain (adsl-26.37.6.0.tellas.gr. [37.6.0.26])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a05600c224a00b003fe23b10fdfsm1798183wmm.36.2023.10.13.00.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:58:12 -0700 (PDT)
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
X-Inumbo-ID: 429e3d25-699e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697183893; x=1697788693; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26XmJrmy0yeQL+itGkgyNTL5y2J9dMpEXdNv7ZAQr48=;
        b=UzzgpqjUAziURuzBdATclQTFJ7iw7K5yPuZYWlgsNZDsunCjVQoR2EvDkq82pE7ZsR
         xguGljJkveodqpTGkCBGErhG/F8tOhlvLgiajEpQKHHV4zaVaEALKTUV9RjchsYNU8K2
         x3LREiAJQkclbpvChwWHsU2XTZZB6gXmk0y9Z70E2xk+UUaWQ4FhQJLOeUDgu/kSI4Wq
         rgie6mMzvQZv/U7zf37it57zYJ2QCR4FXvnRv5dWsXDbt4gTrn5OT21KRQq/9dj9tx9t
         Q4QjJAYkcWhHbYfNBJRr1+gYMw7DDY6JXiOmOpbmlwvSJWA2mfoJUvqYQjIVkUXfsA/h
         ZwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697183893; x=1697788693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26XmJrmy0yeQL+itGkgyNTL5y2J9dMpEXdNv7ZAQr48=;
        b=bFw4NiX72RSmSS38MCYNFNGL5kDz1INhOgriXfmag8VBU0mY30DK13TEa1a0YiV/AK
         vmzr/ddixIKYKrII9Ej3ArWWBKnmMLwXWwCi7MCEwYcQ75wIpkxMBAZWIPbHr+ef0uEv
         ujHO4JwVmU18lx1cb/Hu6Iy3FfzF2QMSmC+PLxYqGd6P3KZ/uegLk6iaIqI9UarWT290
         pVWqXmbHfCalj+bWVDk79MrwnwvB8Zl9E3/M5V3IT1Qv/waU611zzA0f34XjmDLBiPg/
         QZiUx89j52DyToMTCDQADbABI4FEFcPI0wWBzw6KjHMO9KUKwKx7RKGvzgi0JYbrSY1a
         d9HA==
X-Gm-Message-State: AOJu0YyaruxzDgS9SC4+Giio1PxIkgroSCSfcwmOYz9afwBlTCAq5Bhd
	Jy/XCslKnF0WnPOw/uTsURsvlQ==
X-Google-Smtp-Source: AGHT+IFPp/vslpqtiq6MhCP5bCFD2mV7aQKOj1sYJ7qIAvuG33PUl/ItLll0JRAfcAt73agowriq2w==
X-Received: by 2002:a05:600c:450a:b0:401:c7ec:b930 with SMTP id t10-20020a05600c450a00b00401c7ecb930mr18118050wmo.10.1697183893283;
        Fri, 13 Oct 2023 00:58:13 -0700 (PDT)
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
Subject: [RFC PATCH v2 08/78] hw/block: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:56:35 +0300
Message-Id: <23f52f392ad16af6ae923fae526b7c13daf2a0e2.1697183699.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183699.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183699.git.manos.pitsidianakis@linaro.org>
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
@@ -144,59 +144,59 @@ static void xen_block_complete_request(XenBlockRequest *request)
 /*
  * translate request into iovec + start offset
  * do sanity checks along the way
  */
 static int xen_block_parse_request(XenBlockRequest *request)
 {
     XenBlockDataPlane *dataplane = request->dataplane;
     size_t len;
     int i;
 
     switch (request->req.operation) {
     case BLKIF_OP_READ:
         break;
     case BLKIF_OP_FLUSH_DISKCACHE:
         request->presync = 1;
         if (!request->req.nr_segments) {
             return 0;
         }
-        /* fall through */
+        fallthrough;
     case BLKIF_OP_WRITE:
         break;
     case BLKIF_OP_DISCARD:
         return 0;
     default:
         error_report("error: unknown operation (%d)", request->req.operation);
         goto err;
     };
 
     if (request->req.operation != BLKIF_OP_READ &&
         !blk_is_writable(dataplane->blk)) {
         error_report("error: write req for ro device");
         goto err;
     }
 
     request->start = request->req.sector_number * dataplane->sector_size;
     for (i = 0; i < request->req.nr_segments; i++) {
         if (i == BLKIF_MAX_SEGMENTS_PER_REQUEST) {
             error_report("error: nr_segments too big");
             goto err;
         }
         if (request->req.seg[i].first_sect > request->req.seg[i].last_sect) {
             error_report("error: first > last sector");
             goto err;
         }
         if (request->req.seg[i].last_sect * dataplane->sector_size >=
             XEN_PAGE_SIZE) {
             error_report("error: page crossing");
             goto err;
         }
 
         len = (request->req.seg[i].last_sect -
                request->req.seg[i].first_sect + 1) * dataplane->sector_size;
         request->size += len;
     }
     if (request->start + request->size > blk_getlength(dataplane->blk)) {
         error_report("error: access beyond end of file");
         goto err;
     }
     return 0;
@@ -257,63 +257,63 @@ static int xen_block_do_aio(XenBlockRequest *request);
 static void xen_block_complete_aio(void *opaque, int ret)
 {
     XenBlockRequest *request = opaque;
     XenBlockDataPlane *dataplane = request->dataplane;
 
     aio_context_acquire(dataplane->ctx);
 
     if (ret != 0) {
         error_report("%s I/O error",
                      request->req.operation == BLKIF_OP_READ ?
                      "read" : "write");
         request->aio_errors++;
     }
 
     request->aio_inflight--;
     if (request->presync) {
         request->presync = 0;
         xen_block_do_aio(request);
         goto done;
     }
     if (request->aio_inflight > 0) {
         goto done;
     }
 
     switch (request->req.operation) {
     case BLKIF_OP_READ:
         /* in case of failure request->aio_errors is increased */
         if (ret == 0) {
             xen_block_copy_request(request);
         }
         break;
     case BLKIF_OP_WRITE:
     case BLKIF_OP_FLUSH_DISKCACHE:
     default:
         break;
     }
 
     request->status = request->aio_errors ? BLKIF_RSP_ERROR : BLKIF_RSP_OKAY;
 
     switch (request->req.operation) {
     case BLKIF_OP_WRITE:
     case BLKIF_OP_FLUSH_DISKCACHE:
         if (!request->req.nr_segments) {
             break;
         }
-        /* fall through */
+        fallthrough;
     case BLKIF_OP_READ:
         if (request->status == BLKIF_RSP_OKAY) {
             block_acct_done(blk_get_stats(dataplane->blk), &request->acct);
         } else {
             block_acct_failed(blk_get_stats(dataplane->blk), &request->acct);
         }
         break;
     case BLKIF_OP_DISCARD:
     default:
         break;
     }
 
     xen_block_complete_request(request);
 
     if (dataplane->more_work) {
         qemu_bh_schedule(dataplane->bh);
     }
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index afc3fdf4d6..523c34da71 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1117,360 +1117,360 @@ static bool is_valid_aai_cmd(uint32_t cmd)
 static void decode_new_cmd(Flash *s, uint32_t value)
 {
     int i;
 
     s->cmd_in_progress = value;
     trace_m25p80_command_decoded(s, value);
 
     if (value != RESET_MEMORY) {
         s->reset_enable = false;
     }
 
     if (get_man(s) == MAN_SST && s->aai_enable && !is_valid_aai_cmd(value)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "M25P80: Invalid cmd within AAI programming sequence");
     }
 
     switch (value) {
 
     case ERASE_4K:
     case ERASE4_4K:
     case ERASE_32K:
     case ERASE4_32K:
     case ERASE_SECTOR:
     case ERASE4_SECTOR:
     case PP:
     case PP4:
     case DIE_ERASE:
     case RDID_90:
     case RDID_AB:
         s->needed_bytes = get_addr_length(s);
         s->pos = 0;
         s->len = 0;
         s->state = STATE_COLLECTING_DATA;
         break;
     case READ:
     case READ4:
         if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) == MODE_STD) {
             s->needed_bytes = get_addr_length(s);
             s->pos = 0;
             s->len = 0;
             s->state = STATE_COLLECTING_DATA;
         } else {
             qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
                           "DIO or QIO mode\n", s->cmd_in_progress);
         }
         break;
     case DPP:
         if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_QIO) {
             s->needed_bytes = get_addr_length(s);
             s->pos = 0;
             s->len = 0;
             s->state = STATE_COLLECTING_DATA;
         } else {
             qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
                           "QIO mode\n", s->cmd_in_progress);
         }
         break;
     case QPP:
     case QPP_4:
     case PP4_4:
         if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_DIO) {
             s->needed_bytes = get_addr_length(s);
             s->pos = 0;
             s->len = 0;
             s->state = STATE_COLLECTING_DATA;
         } else {
             qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
                           "DIO mode\n", s->cmd_in_progress);
         }
         break;
 
     case FAST_READ:
     case FAST_READ4:
         decode_fast_read_cmd(s);
         break;
     case DOR:
     case DOR4:
         if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_QIO) {
             decode_fast_read_cmd(s);
         } else {
             qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
                           "QIO mode\n", s->cmd_in_progress);
         }
         break;
     case QOR:
     case QOR4:
         if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_DIO) {
             decode_fast_read_cmd(s);
         } else {
             qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
                           "DIO mode\n", s->cmd_in_progress);
         }
         break;
 
     case DIOR:
     case DIOR4:
         if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_QIO) {
             decode_dio_read_cmd(s);
         } else {
             qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
                           "QIO mode\n", s->cmd_in_progress);
         }
         break;
 
     case QIOR:
     case QIOR4:
         if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) != MODE_DIO) {
             decode_qio_read_cmd(s);
         } else {
             qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute cmd %x in "
                           "DIO mode\n", s->cmd_in_progress);
         }
         break;
 
     case WRSR:
         /*
          * If WP# is low and status_register_write_disabled is high,
          * status register writes are disabled.
          * This is also called "hardware protected mode" (HPM). All other
          * combinations of the two states are called "software protected mode"
          * (SPM), and status register writes are permitted.
          */
         if ((s->wp_level == 0 && s->status_register_write_disabled)
             || !s->write_enable) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "M25P80: Status register write is disabled!\n");
             break;
         }
 
         switch (get_man(s)) {
         case MAN_SPANSION:
             s->needed_bytes = 2;
             s->state = STATE_COLLECTING_DATA;
             break;
         case MAN_MACRONIX:
             s->needed_bytes = 2;
             s->state = STATE_COLLECTING_VAR_LEN_DATA;
             break;
         default:
             s->needed_bytes = 1;
             s->state = STATE_COLLECTING_DATA;
         }
         s->pos = 0;
         break;
 
     case WRDI:
         s->write_enable = false;
         if (get_man(s) == MAN_SST) {
             s->aai_enable = false;
         }
         break;
     case WREN:
         s->write_enable = true;
         break;
 
     case RDSR:
         s->data[0] = (!!s->write_enable) << 1;
         s->data[0] |= (!!s->status_register_write_disabled) << 7;
         s->data[0] |= (!!s->block_protect0) << 2;
         s->data[0] |= (!!s->block_protect1) << 3;
         s->data[0] |= (!!s->block_protect2) << 4;
         if (s->pi->flags & HAS_SR_TB) {
             s->data[0] |= (!!s->top_bottom_bit) << 5;
         }
         if (s->pi->flags & HAS_SR_BP3_BIT6) {
             s->data[0] |= (!!s->block_protect3) << 6;
         }
 
         if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
             s->data[0] |= (!!s->quad_enable) << 6;
         }
         if (get_man(s) == MAN_SST) {
             s->data[0] |= (!!s->aai_enable) << 6;
         }
 
         s->pos = 0;
         s->len = 1;
         s->data_read_loop = true;
         s->state = STATE_READING_DATA;
         break;
 
     case READ_FSR:
         s->data[0] = FSR_FLASH_READY;
         if (s->four_bytes_address_mode) {
             s->data[0] |= FSR_4BYTE_ADDR_MODE_ENABLED;
         }
         s->pos = 0;
         s->len = 1;
         s->data_read_loop = true;
         s->state = STATE_READING_DATA;
         break;
 
     case JEDEC_READ:
         if (get_man(s) != MAN_NUMONYX || numonyx_mode(s) == MODE_STD) {
             trace_m25p80_populated_jedec(s);
             for (i = 0; i < s->pi->id_len; i++) {
                 s->data[i] = s->pi->id[i];
             }
             for (; i < SPI_NOR_MAX_ID_LEN; i++) {
                 s->data[i] = 0;
             }
 
             s->len = SPI_NOR_MAX_ID_LEN;
             s->pos = 0;
             s->state = STATE_READING_DATA;
         } else {
             qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Cannot execute JEDEC read "
                           "in DIO or QIO mode\n");
         }
         break;
 
     case RDCR:
         s->data[0] = s->volatile_cfg & 0xFF;
         s->data[0] |= (!!s->four_bytes_address_mode) << 5;
         s->pos = 0;
         s->len = 1;
         s->state = STATE_READING_DATA;
         break;
 
     case BULK_ERASE_60:
     case BULK_ERASE:
         if (s->write_enable) {
             trace_m25p80_chip_erase(s);
             flash_erase(s, 0, BULK_ERASE);
         } else {
             qemu_log_mask(LOG_GUEST_ERROR, "M25P80: chip erase with write "
                           "protect!\n");
         }
         break;
     case NOP:
         break;
     case EN_4BYTE_ADDR:
         s->four_bytes_address_mode = true;
         break;
     case EX_4BYTE_ADDR:
         s->four_bytes_address_mode = false;
         break;
     case BRRD:
     case EXTEND_ADDR_READ:
         s->data[0] = s->ear;
         s->pos = 0;
         s->len = 1;
         s->state = STATE_READING_DATA;
         break;
     case BRWR:
     case EXTEND_ADDR_WRITE:
         if (s->write_enable) {
             s->needed_bytes = 1;
             s->pos = 0;
             s->len = 0;
             s->state = STATE_COLLECTING_DATA;
         }
         break;
     case RNVCR:
         s->data[0] = s->nonvolatile_cfg & 0xFF;
         s->data[1] = (s->nonvolatile_cfg >> 8) & 0xFF;
         s->pos = 0;
         s->len = 2;
         s->state = STATE_READING_DATA;
         break;
     case WNVCR:
         if (s->write_enable && get_man(s) == MAN_NUMONYX) {
             s->needed_bytes = 2;
             s->pos = 0;
             s->len = 0;
             s->state = STATE_COLLECTING_DATA;
         }
         break;
     case RVCR:
         s->data[0] = s->volatile_cfg & 0xFF;
         s->pos = 0;
         s->len = 1;
         s->state = STATE_READING_DATA;
         break;
     case WVCR:
         if (s->write_enable) {
             s->needed_bytes = 1;
             s->pos = 0;
             s->len = 0;
             s->state = STATE_COLLECTING_DATA;
         }
         break;
     case REVCR:
         s->data[0] = s->enh_volatile_cfg & 0xFF;
         s->pos = 0;
         s->len = 1;
         s->state = STATE_READING_DATA;
         break;
     case WEVCR:
         if (s->write_enable) {
             s->needed_bytes = 1;
             s->pos = 0;
             s->len = 0;
             s->state = STATE_COLLECTING_DATA;
         }
         break;
     case RESET_ENABLE:
         s->reset_enable = true;
         break;
     case RESET_MEMORY:
         if (s->reset_enable) {
             reset_memory(s);
         }
         break;
     case RDCR_EQIO:
         switch (get_man(s)) {
         case MAN_SPANSION:
             s->data[0] = (!!s->quad_enable) << 1;
             s->pos = 0;
             s->len = 1;
             s->state = STATE_READING_DATA;
             break;
         case MAN_MACRONIX:
             s->quad_enable = true;
             break;
         default:
             break;
         }
         break;
     case RSTQIO:
         s->quad_enable = false;
         break;
     case AAI_WP:
         if (get_man(s) == MAN_SST) {
             if (s->write_enable) {
                 if (s->aai_enable) {
                     s->state = STATE_PAGE_PROGRAM;
                 } else {
                     s->aai_enable = true;
                     s->needed_bytes = get_addr_length(s);
                     s->state = STATE_COLLECTING_DATA;
                 }
             } else {
                 qemu_log_mask(LOG_GUEST_ERROR,
                               "M25P80: AAI_WP with write protect\n");
             }
         } else {
             qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
         }
         break;
     case RDSFDP:
         if (s->pi->sfdp_read) {
             s->needed_bytes = get_addr_length(s) + 1; /* SFDP addr + dummy */
             s->pos = 0;
             s->len = 0;
             s->state = STATE_COLLECTING_DATA;
             break;
         }
-        /* Fallthrough */
+        fallthrough;
 
     default:
         s->pos = 0;
         s->len = 1;
         s->state = STATE_READING_DATA;
         s->data_read_loop = true;
         s->data[0] = 0;
         qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
         break;
     }
 }
diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 50d3d1c985..87583c48a0 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -406,202 +406,202 @@ fail:
 static void onenand_command(OneNANDState *s)
 {
     int b;
     int sec;
     void *buf;
 #define SETADDR(block, page)                                \
     sec = (s->addr[page] & 3) +                             \
           ((((s->addr[page] >> 2) & 0x3f) +                 \
             (((s->addr[block] & 0xfff) |                    \
               (s->addr[block] >> 15 ? s->density_mask : 0)) \
              << 6))                                         \
            << (PAGE_SHIFT - 9));
 #define SETBUF_M()                                                           \
     buf = (s->bufaddr & 8) ? s->data[(s->bufaddr >> 2) & 1][0] : s->boot[0]; \
     buf += (s->bufaddr & 3) << 9;
 #define SETBUF_S()                                          \
     buf = (s->bufaddr & 8) ?                                \
             s->data[(s->bufaddr >> 2) & 1][1] : s->boot[1]; \
     buf += (s->bufaddr & 3) << 4;
 
     switch (s->command) {
     case 0x00:  /* Load single/multiple sector data unit into buffer */
         SETADDR(ONEN_BUF_BLOCK, ONEN_BUF_PAGE)
 
         SETBUF_M()
         if (onenand_load_main(s, sec, s->count, buf))
             s->status |= ONEN_ERR_CMD | ONEN_ERR_LOAD;
 
 #if 0
         SETBUF_S()
         if (onenand_load_spare(s, sec, s->count, buf))
             s->status |= ONEN_ERR_CMD | ONEN_ERR_LOAD;
 #endif
 
         /* TODO: if (s->bufaddr & 3) + s->count was > 4 (2k-pages)
          * or    if (s->bufaddr & 1) + s->count was > 2 (1k-pages)
          * then we need two split the read/write into two chunks.
          */
         s->intstatus |= ONEN_INT | ONEN_INT_LOAD;
         break;
     case 0x13:  /* Load single/multiple spare sector into buffer */
         SETADDR(ONEN_BUF_BLOCK, ONEN_BUF_PAGE)
 
         SETBUF_S()
         if (onenand_load_spare(s, sec, s->count, buf))
             s->status |= ONEN_ERR_CMD | ONEN_ERR_LOAD;
 
         /* TODO: if (s->bufaddr & 3) + s->count was > 4 (2k-pages)
          * or    if (s->bufaddr & 1) + s->count was > 2 (1k-pages)
          * then we need two split the read/write into two chunks.
          */
         s->intstatus |= ONEN_INT | ONEN_INT_LOAD;
         break;
     case 0x80:  /* Program single/multiple sector data unit from buffer */
         SETADDR(ONEN_BUF_BLOCK, ONEN_BUF_PAGE)
 
         SETBUF_M()
         if (onenand_prog_main(s, sec, s->count, buf))
             s->status |= ONEN_ERR_CMD | ONEN_ERR_PROG;
 
 #if 0
         SETBUF_S()
         if (onenand_prog_spare(s, sec, s->count, buf))
             s->status |= ONEN_ERR_CMD | ONEN_ERR_PROG;
 #endif
 
         /* TODO: if (s->bufaddr & 3) + s->count was > 4 (2k-pages)
          * or    if (s->bufaddr & 1) + s->count was > 2 (1k-pages)
          * then we need two split the read/write into two chunks.
          */
         s->intstatus |= ONEN_INT | ONEN_INT_PROG;
         break;
     case 0x1a:  /* Program single/multiple spare area sector from buffer */
         SETADDR(ONEN_BUF_BLOCK, ONEN_BUF_PAGE)
 
         SETBUF_S()
         if (onenand_prog_spare(s, sec, s->count, buf))
             s->status |= ONEN_ERR_CMD | ONEN_ERR_PROG;
 
         /* TODO: if (s->bufaddr & 3) + s->count was > 4 (2k-pages)
          * or    if (s->bufaddr & 1) + s->count was > 2 (1k-pages)
          * then we need two split the read/write into two chunks.
          */
         s->intstatus |= ONEN_INT | ONEN_INT_PROG;
         break;
     case 0x1b:  /* Copy-back program */
         SETBUF_S()
 
         SETADDR(ONEN_BUF_BLOCK, ONEN_BUF_PAGE)
         if (onenand_load_main(s, sec, s->count, buf))
             s->status |= ONEN_ERR_CMD | ONEN_ERR_PROG;
 
         SETADDR(ONEN_BUF_DEST_BLOCK, ONEN_BUF_DEST_PAGE)
         if (onenand_prog_main(s, sec, s->count, buf))
             s->status |= ONEN_ERR_CMD | ONEN_ERR_PROG;
 
         /* TODO: spare areas */
 
         s->intstatus |= ONEN_INT | ONEN_INT_PROG;
         break;
 
     case 0x23:  /* Unlock NAND array block(s) */
         s->intstatus |= ONEN_INT;
 
         /* XXX the previous (?) area should be locked automatically */
         for (b = s->unladdr[0]; b <= s->unladdr[1]; b ++) {
             if (b >= s->blocks) {
                 s->status |= ONEN_ERR_CMD;
                 break;
             }
             if (s->blockwp[b] == ONEN_LOCK_LOCKTIGHTEN)
                 break;
 
             s->wpstatus = s->blockwp[b] = ONEN_LOCK_UNLOCKED;
         }
         break;
     case 0x27:  /* Unlock All NAND array blocks */
         s->intstatus |= ONEN_INT;
 
         for (b = 0; b < s->blocks; b ++) {
             if (s->blockwp[b] == ONEN_LOCK_LOCKTIGHTEN)
                 break;
 
             s->wpstatus = s->blockwp[b] = ONEN_LOCK_UNLOCKED;
         }
         break;
 
     case 0x2a:  /* Lock NAND array block(s) */
         s->intstatus |= ONEN_INT;
 
         for (b = s->unladdr[0]; b <= s->unladdr[1]; b ++) {
             if (b >= s->blocks) {
                 s->status |= ONEN_ERR_CMD;
                 break;
             }
             if (s->blockwp[b] == ONEN_LOCK_LOCKTIGHTEN)
                 break;
 
             s->wpstatus = s->blockwp[b] = ONEN_LOCK_LOCKED;
         }
         break;
     case 0x2c:  /* Lock-tight NAND array block(s) */
         s->intstatus |= ONEN_INT;
 
         for (b = s->unladdr[0]; b <= s->unladdr[1]; b ++) {
             if (b >= s->blocks) {
                 s->status |= ONEN_ERR_CMD;
                 break;
             }
             if (s->blockwp[b] == ONEN_LOCK_UNLOCKED)
                 continue;
 
             s->wpstatus = s->blockwp[b] = ONEN_LOCK_LOCKTIGHTEN;
         }
         break;
 
     case 0x71:  /* Erase-Verify-Read */
         s->intstatus |= ONEN_INT;
         break;
     case 0x95:  /* Multi-block erase */
         qemu_irq_pulse(s->intr);
-        /* Fall through.  */
+        fallthrough;
     case 0x94:  /* Block erase */
         sec = ((s->addr[ONEN_BUF_BLOCK] & 0xfff) |
                         (s->addr[ONEN_BUF_BLOCK] >> 15 ? s->density_mask : 0))
                 << (BLOCK_SHIFT - 9);
         if (onenand_erase(s, sec, 1 << (BLOCK_SHIFT - 9)))
             s->status |= ONEN_ERR_CMD | ONEN_ERR_ERASE;
 
         s->intstatus |= ONEN_INT | ONEN_INT_ERASE;
         break;
     case 0xb0:  /* Erase suspend */
         break;
     case 0x30:  /* Erase resume */
         s->intstatus |= ONEN_INT | ONEN_INT_ERASE;
         break;
 
     case 0xf0:  /* Reset NAND Flash core */
         onenand_reset(s, 0);
         break;
     case 0xf3:  /* Reset OneNAND */
         onenand_reset(s, 0);
         break;
 
     case 0x65:  /* OTP Access */
         s->intstatus |= ONEN_INT;
         s->blk_cur = NULL;
         s->current = s->otp;
         s->secs_cur = 1 << (BLOCK_SHIFT - 9);
         s->addr[ONEN_BUF_BLOCK] = 0;
         s->otpmode = 1;
         break;
 
     default:
         s->status |= ONEN_ERR_CMD;
         s->intstatus |= ONEN_INT;
         qemu_log_mask(LOG_GUEST_ERROR, "unknown OneNAND command %x\n",
                       s->command);
     }
 
     onenand_intr_update(s);
 }
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 62056b1d74..cb58f08f53 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -261,123 +261,124 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl, hwaddr offset,
 static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
                             int width, int be)
 {
     hwaddr boff;
     uint32_t ret;
 
     ret = -1;
     switch (pfl->cmd) {
     default:
         /* This should never happen : reset state & treat it as a read */
         trace_pflash_read_unknown_state(pfl->name, pfl->cmd);
         pfl->wcycle = 0;
         /*
          * The command 0x00 is not assigned by the CFI open standard,
          * but QEMU historically uses it for the READ_ARRAY command (0xff).
          */
         pfl->cmd = 0x00;
         /* fall through to read code */
+        fallthrough;
     case 0x00: /* This model reset value for READ_ARRAY (not CFI compliant) */
         /* Flash area read */
         ret = pflash_data_read(pfl, offset, width, be);
         break;
     case 0x10: /* Single byte program */
     case 0x20: /* Block erase */
     case 0x28: /* Block erase */
     case 0x40: /* single byte program */
     case 0x50: /* Clear status register */
     case 0x60: /* Block /un)lock */
     case 0x70: /* Status Register */
     case 0xe8: /* Write block */
         /*
          * Status register read.  Return status from each device in
          * bank.
          */
         ret = pfl->status;
         if (pfl->device_width && width > pfl->device_width) {
             int shift = pfl->device_width * 8;
             while (shift + pfl->device_width * 8 <= width * 8) {
                 ret |= pfl->status << shift;
                 shift += pfl->device_width * 8;
             }
         } else if (!pfl->device_width && width > 2) {
             /*
              * Handle 32 bit flash cases where device width is not
              * set. (Existing behavior before device width added.)
              */
             ret |= pfl->status << 16;
         }
         trace_pflash_read_status(pfl->name, ret);
         break;
     case 0x90:
         if (!pfl->device_width) {
             /* Preserve old behavior if device width not specified */
             boff = offset & 0xFF;
             if (pfl->bank_width == 2) {
                 boff = boff >> 1;
             } else if (pfl->bank_width == 4) {
                 boff = boff >> 2;
             }
 
             switch (boff) {
             case 0:
                 ret = pfl->ident0 << 8 | pfl->ident1;
                 trace_pflash_manufacturer_id(pfl->name, ret);
                 break;
             case 1:
                 ret = pfl->ident2 << 8 | pfl->ident3;
                 trace_pflash_device_id(pfl->name, ret);
                 break;
             default:
                 trace_pflash_device_info(pfl->name, boff);
                 ret = 0;
                 break;
             }
         } else {
             /*
              * If we have a read larger than the bank_width, combine multiple
              * manufacturer/device ID queries into a single response.
              */
             int i;
             for (i = 0; i < width; i += pfl->bank_width) {
                 ret = deposit32(ret, i * 8, pfl->bank_width * 8,
                                 pflash_devid_query(pfl,
                                                  offset + i * pfl->bank_width));
             }
         }
         break;
     case 0x98: /* Query mode */
         if (!pfl->device_width) {
             /* Preserve old behavior if device width not specified */
             boff = offset & 0xFF;
             if (pfl->bank_width == 2) {
                 boff = boff >> 1;
             } else if (pfl->bank_width == 4) {
                 boff = boff >> 2;
             }
 
             if (boff < sizeof(pfl->cfi_table)) {
                 ret = pfl->cfi_table[boff];
             } else {
                 ret = 0;
             }
         } else {
             /*
              * If we have a read larger than the bank_width, combine multiple
              * CFI queries into a single response.
              */
             int i;
             for (i = 0; i < width; i += pfl->bank_width) {
                 ret = deposit32(ret, i * 8, pfl->bank_width * 8,
                                 pflash_cfi_query(pfl,
                                                  offset + i * pfl->bank_width));
             }
         }
 
         break;
     }
     trace_pflash_io_read(pfl->name, offset, width, ret, pfl->cmd, pfl->wcycle);
 
     return ret;
 }
 
 /* update flash content on disk */
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 2a99b286b0..711f978d7c 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -307,87 +307,89 @@ static bool pflash_sector_is_erasing(PFlashCFI02 *pfl, hwaddr offset)
 static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
 {
     PFlashCFI02 *pfl = opaque;
     hwaddr boff;
     uint64_t ret;
 
     /* Lazy reset to ROMD mode after a certain amount of read accesses */
     if (!pfl->rom_mode && pfl->wcycle == 0 &&
         ++pfl->read_counter > PFLASH_LAZY_ROMD_THRESHOLD) {
         pflash_mode_read_array(pfl);
     }
     offset &= pfl->chip_len - 1;
     boff = offset & 0xFF;
     if (pfl->width == 2) {
         boff = boff >> 1;
     } else if (pfl->width == 4) {
         boff = boff >> 2;
     }
     switch (pfl->cmd) {
     default:
         /* This should never happen : reset state & treat it as a read*/
         trace_pflash_read_unknown_state(pfl->name, pfl->cmd);
         pflash_reset_state_machine(pfl);
         /* fall through to the read code */
+        fallthrough;
     case 0x80: /* Erase (unlock) */
         /* We accept reads during second unlock sequence... */
     case 0x00:
         if (pflash_erase_suspend_mode(pfl) &&
             pflash_sector_is_erasing(pfl, offset)) {
             /* Toggle bit 2, but not 6. */
             toggle_dq2(pfl);
             /* Status register read */
             ret = pfl->status;
             trace_pflash_read_status(pfl->name, ret);
             break;
         }
         /* Flash area read */
         ret = pflash_data_read(pfl, offset, width);
         break;
     case 0x90: /* flash ID read */
         switch (boff) {
         case 0x00:
         case 0x01:
             ret = boff & 0x01 ? pfl->ident1 : pfl->ident0;
             break;
         case 0x02:
             ret = 0x00; /* Pretend all sectors are unprotected */
             break;
         case 0x0E:
         case 0x0F:
             ret = boff & 0x01 ? pfl->ident3 : pfl->ident2;
             if (ret != (uint8_t)-1) {
                 break;
             }
             /* Fall through to data read. */
+            fallthrough;
         default:
             ret = pflash_data_read(pfl, offset, width);
         }
         trace_pflash_read_done(pfl->name, boff, ret);
         break;
     case 0x10: /* Chip Erase */
     case 0x30: /* Sector Erase */
         /* Toggle bit 2 during erase, but not program. */
         toggle_dq2(pfl);
-        /* fall through */
+        fallthrough;
     case 0xA0: /* Program */
         /* Toggle bit 6 */
         toggle_dq6(pfl);
         /* Status register read */
         ret = pfl->status;
         trace_pflash_read_status(pfl->name, ret);
         break;
     case 0x98:
         /* CFI query mode */
         if (boff < sizeof(pfl->cfi_table)) {
             ret = pfl->cfi_table[boff];
         } else {
             ret = 0;
         }
         break;
     }
     trace_pflash_io_read(pfl->name, offset, width, ret, pfl->cmd, pfl->wcycle);
 
     return ret;
 }
 
 /* update flash content on disk */
@@ -431,277 +433,277 @@ static void pflash_sector_erase(PFlashCFI02 *pfl, hwaddr offset)
 static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
                          unsigned int width)
 {
     PFlashCFI02 *pfl = opaque;
     hwaddr boff;
     uint8_t *p;
     uint8_t cmd;
 
     trace_pflash_io_write(pfl->name, offset, width, value, pfl->wcycle);
     cmd = value;
     if (pfl->cmd != 0xA0) {
         /* Reset does nothing during chip erase and sector erase. */
         if (cmd == 0xF0 && pfl->cmd != 0x10 && pfl->cmd != 0x30) {
             if (pfl->wcycle == WCYCLE_AUTOSELECT_CFI) {
                 /* Return to autoselect mode. */
                 pfl->wcycle = 3;
                 pfl->cmd = 0x90;
                 return;
             }
             goto reset_flash;
         }
     }
     offset &= pfl->chip_len - 1;
 
     boff = offset;
     if (pfl->width == 2) {
         boff = boff >> 1;
     } else if (pfl->width == 4) {
         boff = boff >> 2;
     }
     /* Only the least-significant 11 bits are used in most cases. */
     boff &= 0x7FF;
     switch (pfl->wcycle) {
     case 0:
         /* Set the device in I/O access mode if required */
         if (pfl->rom_mode) {
             pfl->rom_mode = false;
             memory_region_rom_device_set_romd(&pfl->orig_mem, false);
         }
         pfl->read_counter = 0;
         /* We're in read mode */
     check_unlock0:
         if (boff == 0x55 && cmd == 0x98) {
             /* Enter CFI query mode */
             pfl->wcycle = WCYCLE_CFI;
             pfl->cmd = 0x98;
             return;
         }
         /* Handle erase resume in erase suspend mode, otherwise reset. */
         if (cmd == 0x30) { /* Erase Resume */
             if (pflash_erase_suspend_mode(pfl)) {
                 /* Resume the erase. */
                 timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                           pfl->erase_time_remaining);
                 pfl->erase_time_remaining = 0;
                 pfl->wcycle = 6;
                 pfl->cmd = 0x30;
                 set_dq7(pfl, 0x00);
                 assert_dq3(pfl);
                 return;
             }
             goto reset_flash;
         }
         /* Ignore erase suspend. */
         if (cmd == 0xB0) { /* Erase Suspend */
             return;
         }
         if (boff != pfl->unlock_addr0 || cmd != 0xAA) {
             trace_pflash_unlock0_failed(pfl->name, boff,
                                         cmd, pfl->unlock_addr0);
             goto reset_flash;
         }
         trace_pflash_write(pfl->name, "unlock sequence started");
         break;
     case 1:
         /* We started an unlock sequence */
     check_unlock1:
         if (boff != pfl->unlock_addr1 || cmd != 0x55) {
             trace_pflash_unlock1_failed(pfl->name, boff, cmd);
             goto reset_flash;
         }
         trace_pflash_write(pfl->name, "unlock sequence done");
         break;
     case 2:
         /* We finished an unlock sequence */
         if (!pfl->bypass && boff != pfl->unlock_addr0) {
             trace_pflash_write_failed(pfl->name, boff, cmd);
             goto reset_flash;
         }
         switch (cmd) {
         case 0x20:
             pfl->bypass = 1;
             goto do_bypass;
         case 0x80: /* Erase */
         case 0x90: /* Autoselect */
         case 0xA0: /* Program */
             pfl->cmd = cmd;
             trace_pflash_write_start(pfl->name, cmd);
             break;
         default:
             trace_pflash_write_unknown(pfl->name, cmd);
             goto reset_flash;
         }
         break;
     case 3:
         switch (pfl->cmd) {
         case 0x80: /* Erase */
             /* We need another unlock sequence */
             goto check_unlock0;
         case 0xA0: /* Program */
             if (pflash_erase_suspend_mode(pfl) &&
                 pflash_sector_is_erasing(pfl, offset)) {
                 /* Ignore writes to erasing sectors. */
                 if (pfl->bypass) {
                     goto do_bypass;
                 }
                 goto reset_flash;
             }
             trace_pflash_data_write(pfl->name, offset, width, value, 0);
             if (!pfl->ro) {
                 p = (uint8_t *)pfl->storage + offset;
                 if (pfl->be) {
                     uint64_t current = ldn_be_p(p, width);
                     stn_be_p(p, width, current & value);
                 } else {
                     uint64_t current = ldn_le_p(p, width);
                     stn_le_p(p, width, current & value);
                 }
                 pflash_update(pfl, offset, width);
             }
             /*
              * While programming, status bit DQ7 should hold the opposite
              * value from how it was programmed.
              */
             set_dq7(pfl, ~value);
             /* Let's pretend write is immediate */
             if (pfl->bypass)
                 goto do_bypass;
             goto reset_flash;
         case 0x90: /* Autoselect */
             if (pfl->bypass && cmd == 0x00) {
                 /* Unlock bypass reset */
                 goto reset_flash;
             }
             /*
              * We can enter CFI query mode from autoselect mode, but we must
              * return to autoselect mode after a reset.
              */
             if (boff == 0x55 && cmd == 0x98) {
                 /* Enter autoselect CFI query mode */
                 pfl->wcycle = WCYCLE_AUTOSELECT_CFI;
                 pfl->cmd = 0x98;
                 return;
             }
-            /* fall through */
+            fallthrough;
         default:
             trace_pflash_write_invalid(pfl->name, pfl->cmd);
             goto reset_flash;
         }
     case 4:
         switch (pfl->cmd) {
         case 0xA0: /* Program */
             /* Ignore writes while flash data write is occurring */
             /* As we suppose write is immediate, this should never happen */
             return;
         case 0x80: /* Erase */
             goto check_unlock1;
         default:
             /* Should never happen */
             trace_pflash_write_invalid_state(pfl->name, pfl->cmd, 5);
             goto reset_flash;
         }
         break;
     case 5:
         if (pflash_erase_suspend_mode(pfl)) {
             /* Erasing is not supported in erase suspend mode. */
             goto reset_flash;
         }
         switch (cmd) {
         case 0x10: /* Chip Erase */
             if (boff != pfl->unlock_addr0) {
                 trace_pflash_chip_erase_invalid(pfl->name, offset);
                 goto reset_flash;
             }
             /* Chip erase */
             trace_pflash_chip_erase_start(pfl->name);
             if (!pfl->ro) {
                 memset(pfl->storage, 0xff, pfl->chip_len);
                 pflash_update(pfl, 0, pfl->chip_len);
             }
             set_dq7(pfl, 0x00);
             /* Wait the time specified at CFI address 0x22. */
             timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                       (1ULL << pfl->cfi_table[0x22]) * SCALE_MS);
             break;
         case 0x30: /* Sector erase */
             pflash_sector_erase(pfl, offset);
             break;
         default:
             trace_pflash_write_invalid_command(pfl->name, cmd);
             goto reset_flash;
         }
         pfl->cmd = cmd;
         break;
     case 6:
         switch (pfl->cmd) {
         case 0x10: /* Chip Erase */
             /* Ignore writes during chip erase */
             return;
         case 0x30: /* Sector erase */
             if (cmd == 0xB0) {
                 /*
                  * If erase suspend happens during the erase timeout (so DQ3 is
                  * 0), then the device suspends erasing immediately. Set the
                  * remaining time to be the total time to erase. Otherwise,
                  * there is a maximum amount of time it can take to enter
                  * suspend mode. Let's ignore that and suspend immediately and
                  * set the remaining time to the actual time remaining on the
                  * timer.
                  */
                 if ((pfl->status & 0x08) == 0) {
                     pfl->erase_time_remaining = pflash_erase_time(pfl);
                 } else {
                     int64_t delta = timer_expire_time_ns(&pfl->timer) -
                         qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
                     /* Make sure we have a positive time remaining. */
                     pfl->erase_time_remaining = delta <= 0 ? 1 : delta;
                 }
                 reset_dq3(pfl);
                 timer_del(&pfl->timer);
                 pflash_reset_state_machine(pfl);
                 return;
             }
             /*
              * If DQ3 is 0, additional sector erase commands can be
              * written and anything else (other than an erase suspend) resets
              * the device.
              */
             if ((pfl->status & 0x08) == 0) {
                 if (cmd == 0x30) {
                     pflash_sector_erase(pfl, offset);
                 } else {
                     goto reset_flash;
                 }
             }
             /* Ignore writes during the actual erase. */
             return;
         default:
             /* Should never happen */
             trace_pflash_write_invalid_state(pfl->name, pfl->cmd, 6);
             goto reset_flash;
         }
         break;
     /* Special values for CFI queries */
     case WCYCLE_CFI:
     case WCYCLE_AUTOSELECT_CFI:
         trace_pflash_write(pfl->name, "invalid write in CFI query mode");
         goto reset_flash;
     default:
         /* Should never happen */
         trace_pflash_write(pfl->name, "invalid write state (wc 7)");
         goto reset_flash;
     }
     pfl->wcycle++;
 
     return;
 
     /* Reset flash */
  reset_flash:
     pfl->bypass = 0;
     pflash_reset_state_machine(pfl);
     return;
 
  do_bypass:
     pfl->wcycle = 2;
     pfl->cmd = 0;
 }
-- 
2.39.2


