Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6427222268
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 14:37:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw38U-00017M-Rz; Thu, 16 Jul 2020 12:37:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QxFF=A3=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jw38U-000173-23
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 12:37:14 +0000
X-Inumbo-ID: 110dedde-c761-11ea-8496-bc764e2007e4
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 110dedde-c761-11ea-8496-bc764e2007e4;
 Thu, 16 Jul 2020 12:37:10 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id j18so10150079wmi.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2020 05:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G5sq9E9UDOnIr1aJgtoFVrLHsTos8+IaCLhksEowqzI=;
 b=XA9l6EiVlZzlbxHORQGsXcyp3vsil3xpF2im2hzpEfWVcmC7O75p+0YEKm3qeqs8gS
 QQRrZbZQmPKph88kE7PY/ZdUba/yzS6pNIb4zDgjxFa6Ge9Ovjp6dTZ+BWzLEqQ3HvCw
 dwzxMAVNCldSl6TKnRCtMhGp0oyThLDZ9I5+qVord9YFhNqmY42BP6aBQm3nEffu4EdR
 FL6sf5bKQDFl1c8XCsCgbmi5KxnvBAv+CuQRJanggG5UMy0p+an7A/tJKI7iTHjXwJN8
 7hbD0ga9bU3ln8RZB9mARbjebQId1iY6ONSkhv6Qf61BiACUkHuhnjXnjpxmR1WDn8Pa
 QJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=G5sq9E9UDOnIr1aJgtoFVrLHsTos8+IaCLhksEowqzI=;
 b=mi7kPNIRV4F5Up7LmzKnXJqojRs8WHmWRzgNORqut4NrUhLO02fsa0cQV7tcfMfb/o
 j+fANil10w3DeD0GgfnpkUIVQgx1tixbdZY1gqCN4anqUFkCSBVxOJaEtrZxfQMg5sga
 nljILHGTctH3uBkqiWTw1zKnjBszSpTDuUOpSrzAJq3ZlxtitGzBALf7sA+hIgK0URAb
 5GY0gInUlM/VMrIeCARgvy623xVaf59be753Bdg18OMGXwVKAz/VAsGrFVnPuNvpVpZU
 6+AFt1gI9smuKzhzDNl72ksTpVESH53bbJw0Pof9MN/rqeKQ9xSFwO14RIxna+CjYfVm
 WIww==
X-Gm-Message-State: AOAM532vhEsxQFS2bAn/1AQ3kiCFk0OW70788e2s2eAF22qY/ngna+cy
 hnd6v3sU8m/DuKwnTRwwJUw=
X-Google-Smtp-Source: ABdhPJxNr5sWe/rAQ0WwFmtNZQKrc+IVyitTjIZZS8rdOwUabdDJ5fZYRWatelaG7xt8QwLRVW+hrA==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr4196642wmg.48.1594903029736; 
 Thu, 16 Jul 2020 05:37:09 -0700 (PDT)
Received: from x1w.redhat.com (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id c194sm8336673wme.8.2020.07.16.05.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 05:37:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 1/2] block/block-backend: Trace blk_attach_dev()
Date: Thu, 16 Jul 2020 14:37:03 +0200
Message-Id: <20200716123704.6557-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200716123704.6557-1-f4bug@amsat.org>
References: <20200716123704.6557-1-f4bug@amsat.org>
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
index 0bf0188133..63ff940ef9 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -888,6 +888,7 @@ void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm)
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


