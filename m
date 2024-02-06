Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E134784B565
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 13:38:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676889.1053212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXKiU-0005c9-55; Tue, 06 Feb 2024 12:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676889.1053212; Tue, 06 Feb 2024 12:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXKiU-0005aU-1N; Tue, 06 Feb 2024 12:38:22 +0000
Received: by outflank-mailman (input) for mailman id 676889;
 Tue, 06 Feb 2024 12:38:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3A9u=JP=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rXKiS-0005ZV-Fu
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 12:38:20 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b6f7579-c4ec-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 13:38:19 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a293f2280c7so730991166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 04:38:19 -0800 (PST)
Received: from EPUAKYIW03DD.. ([91.123.150.198])
 by smtp.gmail.com with ESMTPSA id
 cw9-20020a170907160900b00a31805b4165sm1113495ejd.11.2024.02.06.04.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 04:38:17 -0800 (PST)
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
X-Inumbo-ID: 9b6f7579-c4ec-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707223098; x=1707827898; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BWugegBYO7vklVvyXEYXtd27rTRIL053PsXMtxyCO3w=;
        b=GLLsP552F5YeDFoafXIfPcyOJDVduQ7gLx5uOBlP+6rqW/bkER6WbyofArPziN+U1H
         Ox+9teb5S3q2vMDcikGMAgt/hOXLccbPDX70lpU4s3z9QOBtLw+fLpHBcgfSDr4zcVEQ
         zTcg9utVnXH+CUpsb5EjU60K4Ovd5KaWncwgSikfF5gkQ8L9E6+N0xK7opn73gnZUa8O
         eEp6BhGTze38qx7BifLRr8wSuV19U75GfZcOFYyRfio9JMiFywH47gjwKi9oG5+UtQpn
         +U1j2hRB0kVWrlDFR3ifcbN/Smf4l+zRC61ZUCdalNqeD+YY8aSg/quHKrMgrrh9BUjv
         8IRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707223098; x=1707827898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWugegBYO7vklVvyXEYXtd27rTRIL053PsXMtxyCO3w=;
        b=tKpLbi69FCsM6hH8kG+wVWvjkbpjNztIROyyYWB7Um02xSf2wLaUuxlFD603mLOWEt
         xVpxcLUCUmIFHZ2Tx2Yvze8tISfw9qDb/NP9hO9ZZGWuRzoP1bAoWIRoTw7od4xFg/RM
         JjfOnPyrtoJXWJxfgukTt9rkRld+EkU6S+jO0ICRyJCFPx5tK3rB3e0JsInV4kdunSI6
         6T4/S+LU2XxCfxUBAaLzi0gP9lELFZCMT6reTuTpIU7Np7q/f5o86Z2gu6a5EpJIoP+K
         7gPNcDm0pCKxXpNVPwkSf5ZO0jrT6xbpHZwXKLN5nQAdhm1KZ1055JPi5yYE3qYrluPY
         RsQg==
X-Gm-Message-State: AOJu0Yyj/LigbAmLby1YQBDjBXr0pYOWm+GPaWIFmIiyAyGBBNPPDdb6
	npkN/3uSNv7rU2fcuR5It3IvRRjtmzkCAIDn/ZyTmUS+rVltFm8tEaHtV3v8
X-Google-Smtp-Source: AGHT+IHJitrq8+qdsPlsncfVI4fWtYH1dtuN6vBNvqEF/1lNW69vEcx2f7uthyA5Wyq8XUxWMwF3GQ==
X-Received: by 2002:a17:906:3e56:b0:a37:f60d:1cf3 with SMTP id t22-20020a1709063e5600b00a37f60d1cf3mr1412206eji.7.1707223098301;
        Tue, 06 Feb 2024 04:38:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW4UPLLt2HFoC5B9r1C7Jpq6gix6M2xaHmIxK48D+w6cGxeCMSkDzt0T1vsz0lpeQnJ1TjTm95VuRENoXHPRhuUwhTuzgJqxKKnIqov3sismgF5qyQO1SphAJDMlglm0MIvwLGYatwt37z+9KAI8KXmmR0F91IZnMEUXchwWurGrNC2xH6UrtYuZicA9FJ0999iFHBp3UBrcyIOHutb40K0II+L/N7x9qGyoyBtfZk=
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V2] libxl: Add "grant_usage" parameter for virtio disk devices
Date: Tue,  6 Feb 2024 14:38:14 +0200
Message-Id: <20240206123814.2308837-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Allow administrators to control whether Xen grant mappings for
the virtio disk devices should be used. By default (when new
parameter is not specified), the existing behavior is retained
(we enable grants if backend-domid != 0).

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
In addition to "libxl: arm: Add grant_usage parameter for virtio devices"
https://github.com/xen-project/xen/commit/c14254065ff4826e34f714e1790eab5217368c38

I wonder, whether I had to also include autogenerated changes to:
 - tools/libs/util/libxlu_disk_l.c
 - tools/libs/util/libxlu_disk_l.h

 V2:
  - clarify documentation to match the implementation
  - apply a default value if "grant_usage" is missing in the Xenstore
    in libxl__disk_from_xenstore()
---
 docs/man/xl-disk-configuration.5.pod.in | 24 ++++++++++++++++++++++++
 tools/golang/xenlight/helpers.gen.go    |  6 ++++++
 tools/golang/xenlight/types.gen.go      |  1 +
 tools/include/libxl.h                   |  7 +++++++
 tools/libs/light/libxl_arm.c            |  4 ++--
 tools/libs/light/libxl_disk.c           | 14 ++++++++++++++
 tools/libs/light/libxl_types.idl        |  1 +
 tools/libs/util/libxlu_disk_l.l         |  3 +++
 8 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-configuration.5.pod.in
index bc945cc517..55e78005cf 100644
--- a/docs/man/xl-disk-configuration.5.pod.in
+++ b/docs/man/xl-disk-configuration.5.pod.in
@@ -404,6 +404,30 @@ Virtio frontend driver (virtio-blk) to be used. Please note, the virtual
 device (vdev) is not passed to the guest in that case, but it still must be
 specified for the internal purposes.
 
+=item B<grant_usage=BOOLEAN>
+
+=over 4
+
+=item Description
+
+Specifies the usage of Xen grants for accessing guest memory. Only applicable
+to specification "virtio".
+
+=item Supported values
+
+1, 0
+
+=item Mandatory
+
+No
+
+=item Default value
+
+If this option is missing, then the default grant setting will be used,
+i.e. "grant_usage=1" if backend-domid != 0 or "grant_usage=0" otherwise.
+
+=back
+
 =back
 
 =head1 COLO Parameters
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 35e209ff1b..768ab0f566 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1879,6 +1879,9 @@ x.ActiveDisk = C.GoString(xc.active_disk)
 x.HiddenDisk = C.GoString(xc.hidden_disk)
 if err := x.Trusted.fromC(&xc.trusted);err != nil {
 return fmt.Errorf("converting field Trusted: %v", err)
+}
+if err := x.GrantUsage.fromC(&xc.grant_usage);err != nil {
+return fmt.Errorf("converting field GrantUsage: %v", err)
 }
 
  return nil}
@@ -1927,6 +1930,9 @@ if x.HiddenDisk != "" {
 xc.hidden_disk = C.CString(x.HiddenDisk)}
 if err := x.Trusted.toC(&xc.trusted); err != nil {
 return fmt.Errorf("converting field Trusted: %v", err)
+}
+if err := x.GrantUsage.toC(&xc.grant_usage); err != nil {
+return fmt.Errorf("converting field GrantUsage: %v", err)
 }
 
  return nil
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 7907aa8999..0b712d2aa4 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -740,6 +740,7 @@ ColoExport string
 ActiveDisk string
 HiddenDisk string
 Trusted Defbool
+GrantUsage Defbool
 }
 
 type DeviceNic struct {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index f1652b1664..2b69e08466 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -578,6 +578,13 @@
  */
 #define LIBXL_HAVE_DEVICE_DISK_SPECIFICATION 1
 
+/*
+ * LIBXL_HAVE_DISK_GRANT_USAGE indicates that the libxl_device_disk
+ * has 'grant_usage' field to specify the usage of Xen grants for
+ * the specification 'virtio'.
+ */
+#define LIBXL_HAVE_DISK_GRANT_USAGE 1
+
 /*
  * LIBXL_HAVE_CONSOLE_ADD_XENSTORE indicates presence of the function
  * libxl_console_add_xenstore() in libxl.
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 1539191774..1cb89fa584 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -1372,12 +1372,12 @@ next_resize:
             libxl_device_disk *disk = &d_config->disks[i];
 
             if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
-                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID)
+                if (libxl_defbool_val(disk->grant_usage))
                     iommu_needed = true;
 
                 FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
                                            disk->backend_domid,
-                                           disk->backend_domid != LIBXL_TOOLSTACK_DOMID) );
+                                           libxl_defbool_val(disk->grant_usage)) );
             }
         }
 
diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index ea3623dd6f..ed02b655a3 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -181,6 +181,9 @@ static int libxl__device_disk_setdefault(libxl__gc *gc, uint32_t domid,
             return ERROR_INVAL;
         }
         disk->transport = LIBXL_DISK_TRANSPORT_MMIO;
+
+        libxl_defbool_setdefault(&disk->grant_usage,
+                                 disk->backend_domid != LIBXL_TOOLSTACK_DOMID);
     }
 
     if (hotplug && disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
@@ -429,6 +432,8 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
             flexarray_append(back, libxl__device_disk_string_of_transport(disk->transport));
             flexarray_append_pair(back, "base", GCSPRINTF("%"PRIu64, disk->base));
             flexarray_append_pair(back, "irq", GCSPRINTF("%u", disk->irq));
+            flexarray_append_pair(back, "grant_usage",
+                                  libxl_defbool_val(disk->grant_usage) ? "1" : "0");
         }
 
         flexarray_append(front, "backend-id");
@@ -623,6 +628,15 @@ static int libxl__disk_from_xenstore(libxl__gc *gc, const char *libxl_path,
             goto cleanup;
         }
         disk->irq = strtoul(tmp, NULL, 10);
+
+        tmp = libxl__xs_read(gc, XBT_NULL,
+                             GCSPRINTF("%s/grant_usage", libxl_path));
+        if (!tmp) {
+            LOG(DEBUG, "Missing xenstore node %s/grant_usage, using default value", libxl_path);
+            libxl_defbool_set(&disk->grant_usage,
+                              disk->backend_domid != LIBXL_TOOLSTACK_DOMID);
+        } else
+            libxl_defbool_set(&disk->grant_usage, strtoul(tmp, NULL, 0));
     }
 
     disk->vdev = xs_read(ctx->xsh, XBT_NULL,
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 899ad30969..6d76f25528 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -803,6 +803,7 @@ libxl_device_disk = Struct("device_disk", [
     ("active_disk", string),
     ("hidden_disk", string),
     ("trusted", libxl_defbool),
+    ("grant_usage", libxl_defbool),
     ])
 
 libxl_device_nic = Struct("device_nic", [
diff --git a/tools/libs/util/libxlu_disk_l.l b/tools/libs/util/libxlu_disk_l.l
index 6d53c093a3..f37dd443bd 100644
--- a/tools/libs/util/libxlu_disk_l.l
+++ b/tools/libs/util/libxlu_disk_l.l
@@ -220,6 +220,9 @@ hidden-disk=[^,]*,?	{ STRIP(','); SAVESTRING("hidden-disk", hidden_disk, FROMEQU
 trusted,?		{ libxl_defbool_set(&DPC->disk->trusted, true); }
 untrusted,?		{ libxl_defbool_set(&DPC->disk->trusted, false); }
 
+grant_usage=1,?		{ libxl_defbool_set(&DPC->disk->grant_usage, true); }
+grant_usage=0,?		{ libxl_defbool_set(&DPC->disk->grant_usage, false); }
+
  /* the target magic parameter, eats the rest of the string */
 
 target=.*	{ STRIP(','); SAVESTRING("target", pdev_path, FROMEQUALS); }
-- 
2.34.1


