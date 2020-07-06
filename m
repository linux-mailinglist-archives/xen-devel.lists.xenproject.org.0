Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F4B215847
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 15:27:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsR8m-00037J-4E; Mon, 06 Jul 2020 13:26:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MnCI=AR=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jsR8l-00036i-5j
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 13:26:35 +0000
X-Inumbo-ID: 4da95cd8-bf8c-11ea-8496-bc764e2007e4
Received: from mail-wm1-x332.google.com (unknown [2a00:1450:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4da95cd8-bf8c-11ea-8496-bc764e2007e4;
 Mon, 06 Jul 2020 13:26:31 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id o8so39335467wmh.4
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3YzIzSCf4xQQ4VX+CJllu+9r7xAX8oggdf7gxj4TtyA=;
 b=OLOCiChN4U2lmokDjguLFHw3NqgvzCz+ll7+2OxnLlKwNm/dOiupl0tgi/aB+OAAyK
 I/F6mS93iP2S859lCocZLYpI9hQ85S/00BO+Hlc4l8+Zno1Q3ve55ymxlclpIRWSSEzf
 dL1ciEGs3i7GHTaDS/vcjcuqtxw0BHZi/GGbuuJ2Z39hhexlqPdC1MHrt6mmmo4K09Qx
 6ESeQafi2xa8PK2l9D4UBFncrvVNv0BYL1B3PsGbkc0GhKxJEufjJpSnNYqcmxEeMFO+
 2iEI9NBmhocTbqGetsGXVwYt+C5l1sLBzikTUOq4PzOO6dixzuba1/zNRepylUTvGcgV
 ne1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3YzIzSCf4xQQ4VX+CJllu+9r7xAX8oggdf7gxj4TtyA=;
 b=d4exX0Z/P1fQJALxTMuznEVouY4W0phtdpkEY/7iteI1PvXYodLSpIth1UlYL1BWGK
 X88Un0SNpAdlxn2hun+/gLRdZTTRKkYVikgUEPC5/cwuDrRdM2oNf8DraGwQKMhmlYDz
 0X3k2/OLKB3s8Q8s1cSMMehXvTjiH3lIHWAzpxkg7SGfPTmUDK0z5JfG5kZgmEYQxhfj
 ifdNV1Ej0nWvYdfdcSj/LxvAlczlVj+CY29VhK0Kvp/2ot06kQAO/4iR5T//ARfAzcQ9
 MM8Uw9PwBHcHP4IeRhaB4o8tNz9jNrwY6U3nzaO8UtXHP2zj2Jity+ALIQtjoXdz/+26
 sB6w==
X-Gm-Message-State: AOAM5322jA0yLOcDhKE3FRqgwDi+xfwzPS1aZ4RZ51B9RHt9oE90c3/6
 rhrkARXYZ+jG2q2Tcv9S6lE=
X-Google-Smtp-Source: ABdhPJzzgZUaGkuExMqbsCd96/zTEdWjJCyCUJK2slIkLxntVuI+YroZIga1OuRs954c/HT+Jfs5VQ==
X-Received: by 2002:a1c:1b0d:: with SMTP id b13mr47841887wmb.169.1594041990469; 
 Mon, 06 Jul 2020 06:26:30 -0700 (PDT)
Received: from localhost.localdomain
 (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id w2sm24447004wrs.77.2020.07.06.06.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 06:26:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] block/block-backend: Trace blk_attach_dev()
Date: Mon,  6 Jul 2020 15:26:25 +0200
Message-Id: <20200706132626.22133-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200706132626.22133-1-f4bug@amsat.org>
References: <20200706132626.22133-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add a trace event to follow devices attaching block drives:

  $ qemu-system-arm -M n800 -trace blk_\*
  9513@1594040428.738162:blk_attach_dev attaching blk 'sd0' to device 'omap2-mmc'
  9513@1594040428.738189:blk_attach_dev attaching blk 'sd0' to device 'sd-card'
  qemu-system-arm: sd_init failed: blk 'sd0' already attached by device 'sd-card'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 block/block-backend.c | 1 +
 block/trace-events    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index 6936b25c83..23caa45e6a 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -886,6 +886,7 @@ void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm)
  */
 int blk_attach_dev(BlockBackend *blk, DeviceState *dev)
 {
+    trace_blk_attach_dev(blk_name(blk), object_get_typename(OBJECT(dev)));
     if (blk->dev) {
         return -EBUSY;
     }
diff --git a/block/trace-events b/block/trace-events
index dbe76a7613..aa641c2034 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -9,6 +9,7 @@ blk_co_preadv(void *blk, void *bs, int64_t offset, unsigned int bytes, int flags
 blk_co_pwritev(void *blk, void *bs, int64_t offset, unsigned int bytes, int flags) "blk %p bs %p offset %"PRId64" bytes %u flags 0x%x"
 blk_root_attach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
 blk_root_detach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
+blk_attach_dev(const char *blk_name, const char *dev_name) "attaching blk '%s' to device '%s'"
 
 # io.c
 bdrv_co_preadv(void *bs, int64_t offset, int64_t nbytes, unsigned int flags) "bs %p offset %"PRId64" nbytes %"PRId64" flags 0x%x"
-- 
2.21.3


