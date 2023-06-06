Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B7724424
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 15:16:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544063.849561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6WXu-0003dQ-LX; Tue, 06 Jun 2023 13:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544063.849561; Tue, 06 Jun 2023 13:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6WXu-0003av-Ii; Tue, 06 Jun 2023 13:16:22 +0000
Received: by outflank-mailman (input) for mailman id 544063;
 Tue, 06 Jun 2023 13:16:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cPWc=B2=citrix.com=prvs=514a106d4=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q6WXt-0003ap-Qw
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 13:16:21 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 525af964-046c-11ee-b232-6b7b168915f2;
 Tue, 06 Jun 2023 15:16:19 +0200 (CEST)
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
X-Inumbo-ID: 525af964-046c-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686057379;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xKNvDM83jJo2UbvnYJs/vwQ1dW+2+/9iUrX9H2+N9PI=;
  b=Dr8KUqIHOWjL+8EbF2KW8oI4JSIxK/syc9Nmeai7Twq//jvYtbj+qFF9
   tN9EvcluE9bDflsDmsO85akTUem/2NFP9vGehyBE7rZtdg6KWkV2GiXkT
   mNLaHimzShTAd0DvQaLDU0g+gOHMmuwdS9q5yPWkFYl3H4HMsDOcJmONr
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110519653
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:BiSbvatVB7Igv+yc6q3Cg5HarOfnVJVeMUV32f8akzHdYApBsoF/q
 tZmKWqEOquKY2PxfIoiOYyx/U5Xv8eDn9dqGgtkrns2FXhE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AGGySFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCylVXy2o1s6Kmp3ib643lOgOJc7pFdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw/
 zueoj2oXExBXDCZ4RTC0ijzg8zmpCLUH9opPfqIr6VSx3TGkwT/DzVJDADm8JFVkHWWQt9aN
 gkY9zQjqYA080qkSMS7WAe3yFafohMSUtxQGsUg5Q2Nw7aS6AGcbkAfVSJIYtEisM4wRBQp2
 0WPktevAiZg2JWNQG+Z3qeZq3W1Iyd9BX8PY2oIQBUI5/HnoZovlVTfQ9B7Cqm3g9bpXzbqz
 Fi3QDMW3utJy5RRjuPioA6B2mj3znTUcuIrzibOBlOYxVJVWNSKPqnvskr3wP9HLq/MGzFto
 0M4s8SZ6ekPC7SEmyqMXPgBEdmV2hqVDNHPqQUxRsd8rlxB71bmJNkNu28meC+FJ+5eIVfUj
 FnvVRS9DXO5FF+jdudJbo24EKzGJoCwRI2+Bpg4gjejC6WdlTNrHgk0PSZ8PEi3yiDAdJ3T3
 r/FGftA9V5AVcxaIMOeHo/xK4MDyCEk3n/0Tpvm1Rmh2rf2TCfLGepUYQPWNLtktf3sTODpH
 zF3bZLi9vmieLemPnm/HXA7czjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/F/SU9UNokihrc+Rp
 ivVchYBmDLCaYjvdV3ihoZLNOm+Av6SbBsTYUQRALpf8yFyO9jzsPZDKcNfkHtO3LUL8MOYh
 sItI62oasmjgBydk9jBRfERdLBfSSk=
IronPort-HdrOrdr: A9a23:Rls876lF3u/PRdNmQs+pyuBPESbpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: =?us-ascii?q?9a23=3ApY4MAWlJ94VbM2EHGb1ORsLRFanXOV7ElEbtCB6?=
 =?us-ascii?q?UNTxGEZjSEk281apjkeM7zg=3D=3D?=
X-Talos-MUID: 9a23:KPTY7gaVSyIPoeBTmXjM3m5nF+5R4ovpUHsk1qVf4PHDHHkl
X-IronPort-AV: E=Sophos;i="6.00,221,1681185600"; 
   d="scan'208";a="110519653"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefan Hajnoczi
	<stefanha@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "Paul
 Durrant" <paul@xen.org>, <xen-devel@lists.xenproject.org>
Subject: [PATCH] xen-block: fix segv on unrealize
Date: Tue, 6 Jun 2023 14:16:05 +0100
Message-ID: <20230606131605.55596-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@citrix.com>

Backtrace:
  qemu_lockcnt_lock (lockcnt=0xb4) at ../util/lockcnt.c:238
  aio_set_fd_handler (ctx=0x0, fd=51, is_external=true, io_read=0x0, io_write=0x0, io_poll=0x0, io_poll_ready=0x0, opaque=0x0) at ../util/aio-posix.c:119
  xen_device_unbind_event_channel (xendev=0x55c6da5b5000, channel=0x55c6da6c4c80, errp=0x7fff641ac608) at ../hw/xen/xen-bus.c:926
  xen_block_dataplane_stop (dataplane=0x55c6da6ddbe0) at ../hw/block/dataplane/xen-block.c:719
  xen_block_disconnect (xendev=0x55c6da5b5000, errp=0x0) at ../hw/block/xen-block.c:48
  xen_block_unrealize (xendev=0x55c6da5b5000) at ../hw/block/xen-block.c:154
  xen_device_unrealize (dev=0x55c6da5b5000) at ../hw/xen/xen-bus.c:956
  xen_device_exit (n=0x55c6da5b50d0, data=0x0) at ../hw/xen/xen-bus.c:985
  notifier_list_notify (list=0x55c6d91f9820 <exit_notifiers>, data=0x0) at ../util/notify.c:39
  qemu_run_exit_notifiers () at ../softmmu/runstate.c:760

Fixes: f6eac904f682 ("xen-block: implement BlockDevOps->drained_begin()")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
--
CC: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/xen/xen-bus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 1e08cf027a..ece8ec40cd 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -923,8 +923,10 @@ void xen_device_unbind_event_channel(XenDevice *xendev,
 
     QLIST_REMOVE(channel, list);
 
-    aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh),
-                       NULL, NULL, NULL, NULL, NULL);
+    if (channel->ctx) {
+        aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh),
+                           NULL, NULL, NULL, NULL, NULL);
+    }
 
     if (qemu_xen_evtchn_unbind(channel->xeh, channel->local_port) < 0) {
         error_setg_errno(errp, errno, "xenevtchn_unbind failed");
-- 
Anthony PERARD


