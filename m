Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C09488B7D
	for <lists+xen-devel@lfdr.de>; Sun,  9 Jan 2022 19:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255170.437272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6cYg-0000kD-6X; Sun, 09 Jan 2022 18:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255170.437272; Sun, 09 Jan 2022 18:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6cYg-0000i4-39; Sun, 09 Jan 2022 18:04:46 +0000
Received: by outflank-mailman (input) for mailman id 255170;
 Sun, 09 Jan 2022 18:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/oUG=RZ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1n6cYf-0000hy-7Z
 for xen-devel@lists.xenproject.org; Sun, 09 Jan 2022 18:04:45 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f6671ba-7176-11ec-9ce5-af14b9085ebd;
 Sun, 09 Jan 2022 19:04:44 +0100 (CET)
Received: by mail-qv1-xf32.google.com with SMTP id kc16so12154831qvb.3
 for <xen-devel@lists.xenproject.org>; Sun, 09 Jan 2022 10:04:44 -0800 (PST)
Received: from shine.lan ([2001:470:8:67e:f1cf:3fc:7c72:5d])
 by smtp.gmail.com with ESMTPSA id l203sm2950171qke.44.2022.01.09.10.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 10:04:41 -0800 (PST)
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
X-Inumbo-ID: 9f6671ba-7176-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k+eEj6jZ9SwYT86CY9jQdLefEzfnqb021ofP7z26oIk=;
        b=QKk9sBLhDmK2s/13XBuNthm2Z6zF0jkCTx2Qdb/CAatIQRayfFADLVQ72uk9nDa2Ca
         qLZByTzcKDG3LRwre39aLDZ4kaVeUsbxqfldXRUb/RoH59jNY2z7V7w1XwiyLH8C1ylT
         +aBY2FWA6rXVSkXg10F0JoIGTdmc9eJTWRMFX628ws4tUSzqEQ5eZKySvqqgOG4AUOf9
         SQkZzQEwfOXZPg11hUO2SAzX3HMmQG0rtXZo9Dw8gWAVcJd9UL8kFYpoXhL6FVtCr/UU
         wnsPf5xT8UV7VL/daswUHK5eaXi01VEXw7NI4UCE+3C+Bprgx7LX6oUIXygnTnm1jMwE
         mhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k+eEj6jZ9SwYT86CY9jQdLefEzfnqb021ofP7z26oIk=;
        b=KCOAPHAMsyvILVjBuuwyt1GLaRT9G6dL3bfS8PyFZLEnWrSOkpIaaF6/PIBTgSX3iH
         CnBIl/oHkH3KeEDoqvBYPRUlTE2z6rFTUUrJ3iV5ig06AB6wdG/c+mPC7sNBYjAua/3Z
         atUP2qwLMWZ28/ymOvu2Fc0qATNEj13FmCp6oeXbyv4RKP5ZgS/MBMMO/gfW5sHVywZT
         CCuakdAqBVRd3I5EX+JpIVKfi1k9gqbaa7GhAHNKa3Bg+8DE8wMVctQsEJ5qeodz2W7J
         R8AN/KGAAxj24B4AShpW+doe3Y/aQaPpRAzs5UvwfbyxvgTwu+Q2evGvSQLMuFx9N9Ff
         19fQ==
X-Gm-Message-State: AOAM530za7iX+dNIc/Mdf6nVscHrOk3R2CLOO+aGBlG3Z2n7j+eoriid
	r8UVZcS7kcIcHmvansOHm3GH2M3iSis=
X-Google-Smtp-Source: ABdhPJz/yDUN+Hj8KFSilR976nsAtQbiYuip7ChB/oFEZWUdle3OVO4XM+4ET6Sw86rYUiLJ051wrw==
X-Received: by 2002:a05:6214:da6:: with SMTP id h6mr3391131qvh.100.1641751482808;
        Sun, 09 Jan 2022 10:04:42 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3] libxl/PCI: Fix PV hotplug & stubdom coldplug
Date: Sun,  9 Jan 2022 13:04:36 -0500
Message-Id: <20220109180436.4112-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit 0fdb48ffe7a1 "libxl: Make sure devices added by pci-attach are
reflected in the config" broken PCI hotplug (xl pci-attach) for PV
domains when it moved libxl__create_pci_backend() later in the function.

This also broke HVM + stubdom PCI passthrough coldplug.  For that, the
PCI devices are hotplugged to a running PV stubdom, and then the QEMU
QMP device_add commands are made to QEMU inside the stubdom.

Are running PV domain calls libxl__wait_for_backend().  With the current
placement of libxl__create_pci_backend(), the path does not exist and
the call immediately fails:
libxl: error: libxl_device.c:1388:libxl__wait_for_backend: Backend /local/domain/0/backend/pci/43/0 does not exist
libxl: error: libxl_pci.c:1764:device_pci_add_done: Domain 42:libxl__device_pci_add failed for PCI device 0:2:0.0 (rc -3)
libxl: error: libxl_create.c:1857:domcreate_attach_devices: Domain 42:unable to add pci devices

The wait is only relevant when the backend is already present.  num_devs
is already used to determine if the backend needs to be created.  Re-use
num_devs to determine if the backend wait is necessary.  The wait is
necessary to avoid racing with another PCI attachment reconfiguring the
front/back or changing to some other state like closing. If we are
creating the backend, then we don't have to worry about the state since
it is being created.

Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are
reflected in the config")

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Alternative to Jan's patch:
https://lore.kernel.org/xen-devel/5114ae87-bc0e-3d58-e16e-6d9d2fee0801@suse.com/

v3:
Change title & commit message

v2:
https://lore.kernel.org/xen-devel/20210812005700.3159-1-jandryuk@gmail.com/
Add Fixes
Expand num_devs use in commit message
---
 tools/libs/light/libxl_pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 4c2d7aeefb..e8fd3bd937 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -157,8 +157,10 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
     if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
         return ERROR_FAIL;
 
-    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
-        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
+    /* wait is only needed if the backend already exists (num_devs != NULL) */
+    if (num_devs && !starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
+        if (libxl__wait_for_backend(gc, be_path,
+                                    GCSPRINTF("%d", XenbusStateConnected)) < 0)
             return ERROR_FAIL;
     }
 
-- 
2.32.0


