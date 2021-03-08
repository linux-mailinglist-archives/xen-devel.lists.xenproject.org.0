Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AA93310D0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 15:33:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94986.179113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGwP-0003EQ-Tx; Mon, 08 Mar 2021 14:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94986.179113; Mon, 08 Mar 2021 14:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGwP-0003E0-Qv; Mon, 08 Mar 2021 14:33:01 +0000
Received: by outflank-mailman (input) for mailman id 94986;
 Mon, 08 Mar 2021 14:32:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d+V0=IG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lJGwN-0003Du-Pf
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 14:32:59 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34e8f0b7-2b49-45dd-bda8-ba886754379e;
 Mon, 08 Mar 2021 14:32:58 +0000 (UTC)
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
X-Inumbo-ID: 34e8f0b7-2b49-45dd-bda8-ba886754379e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615213978;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Q1bwcy8zs0Y3OOtedWN1SdTn52JflrxXUJhjBz32qYs=;
  b=c6dhUoD8LHLcZjnC2FpYoDKjm7QPsgf6T2TX5lssFSpTpF8l2udw0wsl
   9Fs9trijOp2S0WhRszNcu+A0ABkBJo5o0zg/+yTpG5U6qcAsMYkapmgcl
   fJFYtR0dK9ceH1caFqz97wzSK7i+QIT0VHwdbBNaVI0YsVPLc7TJAoN59
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Cyr/TUjEwVfGjW7hRbaKiJa1Ckr9xfodS8EQgLVEM1gUMrkAfx9be9upn8cgb8gLbQX8urcaVU
 rebXD0ABAkaDYMK3UoXdTT8u0RnZ2ljfVX5/Fi+OFVGGlt4/DSrgq1BwpAg19mrJWZvjNQzTgD
 AMIPyx12eIEUeEPmGHSYIbsgiKI28Ss6cq4O5iDxKR6A5KGLnu+Fli/dnwx9RjlyRfjNDascwa
 xjHeFBARuwB8x1Oqu8ZWasTkn0lfa5Y6F8wLK/3jxBXuf6769k5uTPxD+ht0YQg0xPWGKh5Mdr
 +gE=
X-SBRS: 4.0
X-MesageID: 38766920
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; 
   d="scan'208";a="38766920"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
	<stefanha@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
	<mreitz@redhat.com>, <xen-devel@lists.xenproject.org>,
	<qemu-block@nongnu.org>
Subject: [PATCH] xen-block: Fix removal of backend instance via xenstore
Date: Mon, 8 Mar 2021 14:32:32 +0000
Message-ID: <20210308143232.83388-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@citrix.com>

Whenever a Xen block device is detach via xenstore, the image
associated with it remained open by the backend QEMU and an error is
logged:
    qemu-system-i386: failed to destroy drive: Node xvdz-qcow2 is in use

This happened since object_unparent() doesn't immediately frees the
object and thus keep a reference to the node we are trying to free.
The reference is hold by the "drive" property and the call
xen_block_drive_destroy() fails.

In order to fix that, we call drain_call_rcu() to run the callback
setup by bus_remove_child() via object_unparent().

Fixes: 2d24a6466154 ("device-core: use RCU for list of children of a bus")

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
CCing people whom introduced/reviewed the change to use RCU to give
them a chance to say if the change is fine.
---
 hw/block/xen-block.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index a3b69e27096f..fe5f828e2d25 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -972,6 +972,15 @@ static void xen_block_device_destroy(XenBackendInstance *backend,
 
     object_unparent(OBJECT(xendev));
 
+    /*
+     * Drall all pending RCU callbacks as object_unparent() frees `xendev'
+     * in a RCU callback.
+     * And due to the property "drive" still existing in `xendev', we
+     * cann't destroy the XenBlockDrive associated with `xendev' with
+     * xen_block_drive_destroy() below.
+     */
+    drain_call_rcu();
+
     if (iothread) {
         xen_block_iothread_destroy(iothread, errp);
         if (*errp) {
-- 
Anthony PERARD


