Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F751D6E79
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:15:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUN7-00007A-94; Mon, 18 May 2020 01:15:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUN5-00006h-So
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:15:11 +0000
X-Inumbo-ID: fc669eac-98a4-11ea-b9cf-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc669eac-98a4-11ea-b9cf-bc764e2007e4;
 Mon, 18 May 2020 01:14:56 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id n14so8611652qke.8
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iuOS5lKMe+jAFhTt05o45iDFjEi/wVIZWcBxoRF26Ho=;
 b=khyu6WsPvZWt0u9iQ2IrrvLYA9TD208VQjIiV6prcTnUX9q82CDQl3Bce5fdz4ShYr
 oEHmCVvlzBQVi7x2BasBL1ZMP9ExDSot3EEMeb968Gcg/Mpr8vjvP6lT+PbKv80Ad6B9
 fEpsLP0qfq8RVFUndXU294GOfuR+/ltCB3wulhKsTvL/KU/qdaTBg6pZulMAk6XUdoF7
 jXJ+PGISMdXbLiwF3DmUn4SpMBiKrCmf6F4kpJhr4bkoyE4Lewbq4lKbeJkYP04IXvcA
 eZLFgBP2fqjUYF2tUymdk4LQL6GfJGaDyfC/EDnF3I8H2EHQSIjWVlmcYvuI0RMG2go7
 fNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iuOS5lKMe+jAFhTt05o45iDFjEi/wVIZWcBxoRF26Ho=;
 b=D6fcNTW6tj/Sq0jQYh91W454vVlMaGS6JXewwWsD4upzFjpQpCl9KhzrkeYfOI5CE+
 fac65kvcnQFlgaW5pHSC/VdcCwewfllzD2a17/kNuMMetcYYz7Sp1wczOK9ug2+l3xTQ
 pByd+bhV7zULIZPB9swWcw4cxSfyBHIEDRQ6TJNrlB6HZ6znEAhcX9+ejS7U5iCSH+Ys
 DRfwfJ/03I8ZuKrdJUlNd6ALiGgfPf22HXpc5utIaTI0mzyuBMmDBr95WAfg4yiku7Tc
 ADuDCHwzLABIuQD5OViNWIbAMSmBT7JMgRs82pcu0gGRm2FM/TVv7aJbBi3Kj5BViqQo
 6Nig==
X-Gm-Message-State: AOAM530vGUr5j56QGEGM4KS8pDk30pgMBOqzzZz22m51OGa86Dqcyzmn
 s6Zxl4jASqbRPhP8z0jAOxBK7w1+
X-Google-Smtp-Source: ABdhPJySweQ8Z/MdXq2k2CojCoWGTbRxcoGz07qlXfFHNKgg6QHEkJNs87rXCVxXQD+S6SIkbtBZvw==
X-Received: by 2002:a05:620a:6bc:: with SMTP id
 i28mr13905580qkh.330.1589764495938; 
 Sun, 17 May 2020 18:14:55 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:14:55 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 06/18] libxl: write qemu arguments into separate xenstore
 keys
Date: Sun, 17 May 2020 21:13:41 -0400
Message-Id: <20200518011353.326287-7-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200518011353.326287-1-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

This allows using arguments with spaces, like -append, without
nominating any special "separator" character.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Re-work to use libxl_xs_* functions in a loop.  Also write arguments in
dm-argv directory instead of overloading mini-os's dmargs string.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Changes in v3:
 - previous version of this patch "libxl: use \x1b to separate qemu
   arguments for linux stubdomain" used specific non-printable
   separator, but it was rejected as xenstore doesn't cope well with
   non-printable chars
Changes in v6:
 - Re-work to use libxl__xs_ functions in a loop.
 - Drop rtc/timeoffset
---
 tools/libxl/libxl_dm.c | 56 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index dc1717bc12..eaed6e8ee7 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -2066,6 +2066,57 @@ static int libxl__vfb_and_vkb_from_hvm_guest_config(libxl__gc *gc,
     return 0;
 }
 
+static int libxl__write_stub_linux_dm_argv(libxl__gc *gc,
+                                           int dm_domid, int guest_domid,
+                                           char **args)
+{
+    const char *vm_path;
+    char *path;
+    struct xs_permissions roperm[2];
+    xs_transaction_t t = XBT_NULL;
+    int rc;
+
+    roperm[0].id = 0;
+    roperm[0].perms = XS_PERM_NONE;
+    roperm[1].id = dm_domid;
+    roperm[1].perms = XS_PERM_READ;
+
+    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
+                                  GCSPRINTF("/local/domain/%d/vm", guest_domid),
+                                  &vm_path);
+    if (rc)
+        return rc;
+
+    path = GCSPRINTF("%s/image/dm-argv", vm_path);
+
+    for (;;) {
+        int i;
+
+        rc = libxl__xs_transaction_start(gc, &t);
+        if (rc) goto out;
+
+        rc = libxl__xs_mknod(gc, t, path, roperm, ARRAY_SIZE(roperm));
+        if (rc) goto out;
+
+        for (i=1; args[i] != NULL; i++) {
+            rc = libxl__xs_write_checked(gc, t, GCSPRINTF("%s/%03d", path, i),
+                                         args[i]);
+            if (rc) goto out;
+        }
+
+        rc = libxl__xs_transaction_commit(gc, &t);
+        if (!rc) break;
+        if (rc<0) goto out;
+    }
+
+    return 0;
+
+ out:
+    libxl__xs_transaction_abort(gc, &t);
+
+    return rc;
+}
+
 static int libxl__write_stub_dmargs(libxl__gc *gc,
                                     int dm_domid, int guest_domid,
                                     char **args)
@@ -2275,7 +2326,10 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
 
     libxl__store_libxl_entry(gc, guest_domid, "dm-version",
         libxl_device_model_version_to_string(dm_config->b_info.device_model_version));
-    libxl__write_stub_dmargs(gc, dm_domid, guest_domid, args);
+    if (libxl__stubdomain_is_linux(&guest_config->b_info))
+        libxl__write_stub_linux_dm_argv(gc, dm_domid, guest_domid, args);
+    else
+        libxl__write_stub_dmargs(gc, dm_domid, guest_domid, args);
     libxl__xs_printf(gc, XBT_NULL,
                      GCSPRINTF("%s/image/device-model-domid",
                                libxl__xs_get_dompath(gc, guest_domid)),
-- 
2.25.1


