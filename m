Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF221BB4FB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:07:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHWW-0001U8-0f; Tue, 28 Apr 2020 04:07:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHWU-0001SI-4H
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:07:06 +0000
X-Inumbo-ID: a1128498-8905-11ea-b07b-bc764e2007e4
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1128498-8905-11ea-b07b-bc764e2007e4;
 Tue, 28 Apr 2020 04:06:25 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id y19so9757542qvv.4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OmhxLHIrfW/RVN+5SOVZowWAiFw0cbMfDhtgV3wqCnU=;
 b=bg3Zvrsiv9zFYEa7cM5egtX3ROnTgjnrSRZM1p8HrJD7F7FrT7TlrnPZGsmZzEzL4J
 b/2pDHw/WTDLcNYgFN0+74nMz9im+XtS3TQNEewchEmgSc70bLKM4JEAJvw1sBsQvkFi
 f3z2EBAxhoF9o24idxWib8NC3zFgfUlM9o+5ULORuy7gzdWgd9uezem5DxhTHDX62V43
 KBVVWGTX40Dr7YF081F9jzvfsquJ++gCRlf1rfpeC67SaAyzHGJaiqijK+6EEY+l3FC0
 THR95kTDJ8g9MrQnJwMjvcf3RSpK2gRnTE2CE7BVOZu4mplpvRWZr/XIDx4VgbNhK3Rq
 i6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OmhxLHIrfW/RVN+5SOVZowWAiFw0cbMfDhtgV3wqCnU=;
 b=m6XvqjW87BozZVH5zFj2cA5jZTUGFz6tzQrzocTySwtHDZM4m00zTkRg5bm8iq3hp4
 QTmCT9/Z+quEN3jrjvZzhpoblDo03ufoUZVYpLkuIW9QE7TEo7/793WdmYv2jul4yego
 ti5RNve2I0DW894kyy6wrMXonHSMZYJWlg4MmwNpIRVDLBssu0R5jQsD3z6ANEuF/r0e
 gcvODuSWLALg83NsOk7eF/TQMSUw4O28vBlNoTRCsdI2DVBrxn26f/0YyV+W4aSbS7eX
 0jhuckqTcr9lQ5jlRZwccRhiyPTMvXBHhlGZzatI3NkODmnqJSLwsjBq2xoYwuK3qlDq
 FEDQ==
X-Gm-Message-State: AGi0PubbDDpT1j9Q3lBNCnwifcjTBIiX7wcfn6+FC+j+olMSfeAzGnI/
 zbfHve+uMaNnNkdxSnEWAsYvnvI9
X-Google-Smtp-Source: APiQypI52GnSDDusVyNK8D3yfYR5vLp0fsZOWFVjbEe/0XywspZxG4Cr6dMdTn7fq5ST5MCLx8XDQw==
X-Received: by 2002:a0c:99ca:: with SMTP id y10mr19107544qve.217.1588046785230; 
 Mon, 27 Apr 2020 21:06:25 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:06:24 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 20/21] libxl: Kill vchan-socket-proxy when cleaning up qmp
Date: Tue, 28 Apr 2020 00:04:32 -0400
Message-Id: <20200428040433.23504-21-jandryuk@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200428040433.23504-1-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
MIME-Version: 1.0
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We need to kill the vchan-socket-proxy so we don't leak the daemonized
processes.  libxl__stubdomain_is_linux_running works against the
guest_domid, but the xenstore path is beneath the stubdomain.  This
leads to the use of libxl_is_stubdom in addition to
libxl__stubdomain_is_linux_running so that the stubdomain calls kill for
the qmp-proxy

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
libxl__qmp_cleanup was considered, but it is not called for guests with
a stubdomain.
---
 tools/libxl/libxl_domain.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/libxl/libxl_domain.c b/tools/libxl/libxl_domain.c
index fef2cd4e13..3b66e25aa7 100644
--- a/tools/libxl/libxl_domain.c
+++ b/tools/libxl/libxl_domain.c
@@ -1260,10 +1260,17 @@ static void dm_destroy_cb(libxl__egc *egc,
     libxl__destroy_domid_state *dis = CONTAINER_OF(ddms, *dis, ddms);
     STATE_AO_GC(dis->ao);
     uint32_t domid = dis->domid;
+    uint32_t target_domid;
 
     if (rc < 0)
         LOGD(ERROR, domid, "libxl__destroy_device_model failed");
 
+    if (libxl_is_stubdom(CTX, domid, &target_domid) &&
+        libxl__stubdomain_is_linux_running(gc, target_domid)) {
+        char *path = GCSPRINTF("/local/domain/%d/image/qmp-proxy-pid", domid);
+        libxl__kill_xs_path(gc, path, "QMP Proxy");
+    }
+
     dis->drs.ao = ao;
     dis->drs.domid = domid;
     dis->drs.callback = devices_destroy_cb;
-- 
2.20.1


