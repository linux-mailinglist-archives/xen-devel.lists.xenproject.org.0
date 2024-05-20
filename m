Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2AB8CA0D2
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 18:44:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726281.1130555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s967O-0004CK-QM; Mon, 20 May 2024 16:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726281.1130555; Mon, 20 May 2024 16:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s967O-000498-Mw; Mon, 20 May 2024 16:44:10 +0000
Received: by outflank-mailman (input) for mailman id 726281;
 Mon, 20 May 2024 16:44:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+3cx=MX=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s967N-000492-7e
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 16:44:09 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d5d7a95-16c8-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 18:44:08 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 0A9908006F;
 Mon, 20 May 2024 17:44:08 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id DCEED2018A; Mon, 20 May 2024 17:44:07 +0100 (BST)
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
X-Inumbo-ID: 2d5d7a95-16c8-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1716223448;
	bh=wrswVYnquATIjozyd9IVNy44jE4XjEZ7Z1r+nDydqro=;
	h=From:To:Cc:Subject:Date:From;
	b=gVf8ulRSpwWkA8K+H1sRfQhr4iz6PkZTRyPRPjQl54t14HtJ81BXy/U4F36Yy8ouE
	 i//OM4sw3da49PWQSDGrkcEb+QV9e9cuEAVMOXYC1nEvC3GOtiPHWcTtdmRS6fvO1I
	 yFLg/ReUm5FIDd4wl1NneEfoVa5wBxNzcFZrRkSw=
From: Leigh Brown <leigh@solinno.co.uk>
To: Xen Devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH] tools/libs/light: Fix nic->vlan memory allocation
Date: Mon, 20 May 2024 17:44:00 +0100
Message-Id: <20240520164400.15740-1-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the following commit:
3bc14e4fa4b9 ("tools/libs/light: Add vlan field to libxl_device_nic")
xl list -l aborts with a double free error if a domain has at least
one vif defined:

  $ sudo xl list -l
  free(): double free detected in tcache 2
  Aborted

Orginally, the vlan field was called vid and was defined as an integer.
It was appropriate to call libxl__xs_read_checked() with gc passed as
the string data was copied to a different variable.  However, the final
version uses a string data type and the call should have been changed
to use NOGC instead of gc to allow that data to live past the gc
controlled lifetime, in line with the other string fields.

This patch makes the change to pass NOGC instead of gc and moves the
new code to be next to the other string fields (fixing a couple of
errant tabs along the way), as recommended by Jason.

Fixes: 3bc14e4fa4b9 ("tools/libs/light: Add vlan field to libxl_device_nic")
Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

---
 tools/libs/light/libxl_nic.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_nic.c b/tools/libs/light/libxl_nic.c
index d861e3726d..300a96a8b1 100644
--- a/tools/libs/light/libxl_nic.c
+++ b/tools/libs/light/libxl_nic.c
@@ -318,11 +318,6 @@ static int libxl__nic_from_xenstore(libxl__gc *gc, const char *libxl_path,
         nic->mtu = LIBXL_DEVICE_NIC_MTU_DEFAULT;
     }
 
-    rc = libxl__xs_read_checked(gc, XBT_NULL,
-                                GCSPRINTF("%s/vlan", libxl_path),
-				(const char **)(&nic->vlan));
-    if (rc) goto out;
-
     rc = libxl__xs_read_checked(gc, XBT_NULL,
                                 GCSPRINTF("%s/mac", libxl_path), &tmp);
     if (rc) goto out;
@@ -345,6 +340,10 @@ static int libxl__nic_from_xenstore(libxl__gc *gc, const char *libxl_path,
                                 GCSPRINTF("%s/script", libxl_path),
                                 (const char **)(&nic->script));
     if (rc) goto out;
+    rc = libxl__xs_read_checked(NOGC, XBT_NULL,
+                                GCSPRINTF("%s/vlan", libxl_path),
+                                (const char **)(&nic->vlan));
+    if (rc) goto out;
     rc = libxl__xs_read_checked(NOGC, XBT_NULL,
                                 GCSPRINTF("%s/forwarddev", libxl_path),
                                 (const char **)(&nic->coloft_forwarddev));
-- 
2.39.2


