Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A3C8566E6
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 16:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681846.1060819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1radKW-0007v1-NA; Thu, 15 Feb 2024 15:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681846.1060819; Thu, 15 Feb 2024 15:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1radKW-0007sV-KM; Thu, 15 Feb 2024 15:07:16 +0000
Received: by outflank-mailman (input) for mailman id 681846;
 Thu, 15 Feb 2024 15:07:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ebjb=JY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1radKU-0007sO-EW
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 15:07:14 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e540f787-cc13-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 16:07:12 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a34c5ca2537so116943766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 07:07:11 -0800 (PST)
Received: from EPUAKYIW03DD.. ([91.123.153.74])
 by smtp.gmail.com with ESMTPSA id
 vw3-20020a170907a70300b00a3d99415705sm565868ejc.73.2024.02.15.07.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 07:07:09 -0800 (PST)
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
X-Inumbo-ID: e540f787-cc13-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708009631; x=1708614431; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ws6LPjKtIjpFaqXAI/bgM+OTRK7Do4ioHmUfKd4c94=;
        b=lng2qRRWsAj8pbg+/It6MC8V/Jjj07NHoH0aLZbbHgdUN8E/Qtqw8AKR3QHZrdFrnC
         6tO/dayGTkBa7bAmbfSbtN2VCnrY5FFgiU0VPECIPSq/dVqFnS7SSzhE0Njh856tWKTK
         TnQXNgkd4d4Q9QpHso5M3ntwegCvgFXWTR72cGH/ieZbVBIouwKEP1aXcLzfxtmKUwWE
         6eAkaThm6462UKlXiKECCJ2r8OEablrAijPoshEH5CkNIU+mbUDUL7NlbZB5xOax4l37
         92phFQ5s5uGq5vXbSY39aHuh0LP9A7mv5aiWKDM5LWiZGZJ5eiBjRwb1x3yfv+9ISs7a
         EWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708009631; x=1708614431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ws6LPjKtIjpFaqXAI/bgM+OTRK7Do4ioHmUfKd4c94=;
        b=eXfHTcC+rfABCouhcDRY5r1HNPkRmk/+Wo+laMQIPF1Q7ZDPtjryHZ6T+xZzj76X/p
         SnX8TTg3WAAkqlfhWykKZTuBF6QK4xsNHD5BqotrkZK9a6SHQpr4zMbvpoM3ww6X/3/l
         0WR0C7/pazkNXLZLhtNE8xvMMNNQwEBegEk+JkQ17H+KD14yqciJyXj8y3BT/ZwK/Grj
         xD7OSEJiOA37nSm3h15v71jx8fGs/F3UDoSzXTM9Q59i6LxYxXpz0OrgqnxebWAvY3+t
         GAGQI9JzDwH7GfGKoJtYKqxRz1sa/yLjxerpNC4mYymm+t1bMvCQsDpqMiUxa7da5qhf
         KXdw==
X-Gm-Message-State: AOJu0YyFegNbKnZiBUtw8F9903ljFWUGoRMviZK7tPSWJ3duDd2KGsZv
	615+T9bmjmQO3A1B9ax3hVEvAppvl5jYLV6IoJ+q5JNzpiNazLzcrzdlkXxe
X-Google-Smtp-Source: AGHT+IExorXP2wMzr3mSfNJI8+mqLSGonJHYGvCsVz+DCdo7EcwCkqU6ApPhrLCVw7dZIPvH2zMzDQ==
X-Received: by 2002:a17:906:aad7:b0:a3c:b23a:9491 with SMTP id kt23-20020a170906aad700b00a3cb23a9491mr1547385ejb.19.1708009630311;
        Thu, 15 Feb 2024 07:07:10 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V3] libxl: Add "grant_usage" parameter for virtio disk devices
Date: Thu, 15 Feb 2024 17:06:44 +0200
Message-Id: <20240215150644.2477378-1-olekstysh@gmail.com>
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

 V2:
  - clarify documentation to match the implementation
  - apply a default value if "grant_usage" is missing the Xenstore
    in libxl__disk_from_xenstore()

 V3:
  - include autogenerated changes to tools/libs/util/libxlu_disk_l.c(h)
  - remove debug log from libxl__disk_from_xenstore(),
    correct coding style
---
 docs/man/xl-disk-configuration.5.pod.in |   24 +
 tools/golang/xenlight/helpers.gen.go    |    6 +
 tools/golang/xenlight/types.gen.go      |    1 +
 tools/include/libxl.h                   |    7 +
 tools/libs/light/libxl_arm.c            |    4 +-
 tools/libs/light/libxl_disk.c           |   13 +
 tools/libs/light/libxl_types.idl        |    1 +
 tools/libs/util/libxlu_disk_l.c         | 1001 ++++++++++++-----------
 tools/libs/util/libxlu_disk_l.h         |    9 +-
 tools/libs/util/libxlu_disk_l.l         |    3 +
 10 files changed, 590 insertions(+), 479 deletions(-)

diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-configuration.5.pod.in
index cb442bd5b4..986666ebf8 100644
--- a/docs/man/xl-disk-configuration.5.pod.in
+++ b/docs/man/xl-disk-configuration.5.pod.in
@@ -406,6 +406,30 @@ Virtio frontend driver (virtio-blk) to be used. Please note, the virtual
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
index 0f8e23773c..acdf1c1820 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1885,6 +1885,9 @@ x.ActiveDisk = C.GoString(xc.active_disk)
 x.HiddenDisk = C.GoString(xc.hidden_disk)
 if err := x.Trusted.fromC(&xc.trusted);err != nil {
 return fmt.Errorf("converting field Trusted: %v", err)
+}
+if err := x.GrantUsage.fromC(&xc.grant_usage);err != nil {
+return fmt.Errorf("converting field GrantUsage: %v", err)
 }
 
  return nil}
@@ -1933,6 +1936,9 @@ if x.HiddenDisk != "" {
 xc.hidden_disk = C.CString(x.HiddenDisk)}
 if err := x.Trusted.toC(&xc.trusted); err != nil {
 return fmt.Errorf("converting field Trusted: %v", err)
+}
+if err := x.GrantUsage.toC(&xc.grant_usage); err != nil {
+return fmt.Errorf("converting field GrantUsage: %v", err)
 }
 
  return nil
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 9c8b7b81f6..76b4ed991b 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -741,6 +741,7 @@ ColoExport string
 ActiveDisk string
 HiddenDisk string
 Trusted Defbool
+GrantUsage Defbool
 }
 
 type DeviceNic struct {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 46bc774126..a370528ba1 100644
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
index ee2e4b0bd3..fa7856f28c 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -183,6 +183,9 @@ static int libxl__device_disk_setdefault(libxl__gc *gc, uint32_t domid,
             return ERROR_INVAL;
         }
         disk->transport = LIBXL_DISK_TRANSPORT_MMIO;
+
+        libxl_defbool_setdefault(&disk->grant_usage,
+                                 disk->backend_domid != LIBXL_TOOLSTACK_DOMID);
     }
 
     if (hotplug && disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
@@ -468,6 +471,8 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
             flexarray_append(back, libxl__device_disk_string_of_transport(disk->transport));
             flexarray_append_pair(back, "base", GCSPRINTF("%"PRIu64, disk->base));
             flexarray_append_pair(back, "irq", GCSPRINTF("%u", disk->irq));
+            flexarray_append_pair(back, "grant_usage",
+                                  libxl_defbool_val(disk->grant_usage) ? "1" : "0");
         }
 
         flexarray_append(front, "backend-id");
@@ -662,6 +667,14 @@ static int libxl__disk_from_xenstore(libxl__gc *gc, const char *libxl_path,
             goto cleanup;
         }
         disk->irq = strtoul(tmp, NULL, 10);
+
+        tmp = libxl__xs_read(gc, XBT_NULL,
+                             GCSPRINTF("%s/grant_usage", libxl_path));
+        if (!tmp)
+            libxl_defbool_set(&disk->grant_usage,
+                              disk->backend_domid != LIBXL_TOOLSTACK_DOMID);
+        else
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
diff --git a/tools/libs/util/libxlu_disk_l.c b/tools/libs/util/libxlu_disk_l.c
index 0b59723b71..9213dd957c 100644
--- a/tools/libs/util/libxlu_disk_l.c
+++ b/tools/libs/util/libxlu_disk_l.c
@@ -1,7 +1,10 @@
 #line 1 "libxlu_disk_l.c"
+#line 31 "libxlu_disk_l.l"
 #define _GNU_SOURCE
 
-#line 4 "libxlu_disk_l.c"
+
+
+#line 7 "libxlu_disk_l.c"
 
 #define  YY_INT_ALIGNED short int
 
@@ -549,8 +552,8 @@ static void yynoreturn yy_fatal_error ( const char* msg , yyscan_t yyscanner );
 	yyg->yy_hold_char = *yy_cp; \
 	*yy_cp = '\0'; \
 	yyg->yy_c_buf_p = yy_cp;
-#define YY_NUM_RULES 37
-#define YY_END_OF_BUFFER 38
+#define YY_NUM_RULES 41
+#define YY_END_OF_BUFFER 42
 /* This struct is not used in this scanner,
    but its presence is necessary. */
 struct yy_trans_info
@@ -558,119 +561,127 @@ struct yy_trans_info
 	flex_int32_t yy_verify;
 	flex_int32_t yy_nxt;
 	};
-static const flex_int16_t yy_acclist[594] =
+static const flex_int16_t yy_acclist[634] =
     {   0,
-       36,   36,   38,   34,   35,   37, 8193,   34,   35,   37,
-    16385, 8193,   34,   37,16385,   34,   35,   37,   35,   37,
-       34,   35,   37,   34,   35,   37,   34,   35,   37,   34,
-       35,   37,   34,   35,   37,   34,   35,   37,   34,   35,
-       37,   34,   35,   37,   34,   35,   37,   34,   35,   37,
-       34,   35,   37,   34,   35,   37,   34,   35,   37,   34,
-       35,   37,   34,   35,   37,   34,   35,   37,   36,   37,
-       37,   34,   34, 8193,   34, 8193,   34,16385, 8193,   34,
-     8193,   34,   34, 8225,   34,16417,   34,   34,   34,   34,
-       34,   34,   34,   34,   34,   34,   34,   34,   34,   34,
-
-       34,   34,   34,   34,   34,   34,   34,   34,   34,   34,
-       36, 8193,   34, 8193,   34, 8193, 8225,   34, 8225,   34,
-     8225,   24,   34,   34,   34,   34,   34,   34,   34,   34,
-       34,   34,   34,   34,   34,   34,   34,   34,   34,   34,
-       34,   34,   34,   34,   34,   34,   34, 8225,   34, 8225,
-       34, 8225,   24,   34,   34,   29, 8225,   34,16417,   34,
-       34,   16,   34,   34,   34,   34,   34,   34,   34,   34,
-       34, 8218, 8225,   34,16410,16417,   34,   34,   32, 8225,
-       34,16417,   34, 8217, 8225,   34,16409,16417,   34,   34,
-       34, 8220, 8225,   34,16412,16417,   34,   34,   34,   34,
-
-       34,   29, 8225,   34,   29, 8225,   34,   29,   34,   29,
-     8225,   34,    3,   34,   16,   34,   34,   34,   34,   34,
-       31, 8225,   34,16417,   34,   34,   34, 8218, 8225,   34,
-     8218, 8225,   34, 8218,   34, 8218, 8225,   34,   34,   32,
-     8225,   34,   32, 8225,   34,   32,   34,   32, 8225, 8217,
-     8225,   34, 8217, 8225,   34, 8217,   34, 8217, 8225,   34,
-       34, 8220, 8225,   34, 8220, 8225,   34, 8220,   34, 8220,
-     8225,   34,   34,   11,   34,   34,   29, 8225,   34,   29,
-     8225,   34,   29, 8225,   29,   34,   29,   34,    3,   34,
-       34,   34,   34,   34,   34,   34,   31, 8225,   34,   31,
-
-     8225,   34,   31,   34,   31, 8225,   34,   34,   30, 8225,
-       34,16417, 8218, 8225,   34, 8218, 8225,   34, 8218, 8225,
-     8218,   34, 8218,   34,   34,   32, 8225,   34,   32, 8225,
-       34,   32, 8225,   32,   34,   32, 8217, 8225,   34, 8217,
-     8225,   34, 8217, 8225, 8217,   34, 8217,   34,   34, 8220,
-     8225,   34, 8220, 8225,   34, 8220, 8225, 8220,   34, 8220,
-       34,   34,   11,   24,   11,    7,   34,   34,   34,   34,
-       34,   34,   34,   14,   34,   31, 8225,   34,   31, 8225,
-       34,   31, 8225,   31,   34,   31,    2,   34,   30, 8225,
-       34,   30, 8225,   34,   30,   34,   30, 8225,   17,   34,
-
-       34,   12,   34,   34,   23,   11,   11,   24,    7,   24,
-        7,   34,    8,   34,   34,   34,   34,    6,   34,   14,
-       34,    2,   24,    2,   34,   30, 8225,   34,   30, 8225,
-       34,   30, 8225,   30,   34,   30,   17,   34,   34,   12,
-       24,   12,   34,   27, 8225,   34,16417,   23,   24,   23,
-        7,    7,   24,   34,    8,   24,    8,   34,   34,   34,
-       34,    6,   24,    6,    6,   24,    6,   24,   34,    2,
-        2,   24,   34,   34,   12,   12,   24,   34,   27, 8225,
-       34,   27, 8225,   34,   27,   34,   27, 8225,   23,   24,
-       34,    8,    8,   24,   34,   34,   18,   19,    6,    6,
-
-       24,    6,    6,   34,   34,   15,   34,   34,   27, 8225,
-       34,   27, 8225,   34,   27, 8225,   27,   34,   27,   34,
-       34,   34,   18,   24,   18,   19,   24,   19,    6,    6,
-       34,   34,   15,   34,   34,   21,    9,   20,   18,   18,
-       24,   19,   19,   24,    6,    5,    6,   34,   22,   34,
-       21,   24,   21,    9,   24,    9,   20,   24,   20,    4,
-        6,    5,    6,   34,   22,   24,   22,   34,   21,   21,
-       24,    9,    9,   24,   20,   20,   24,    4,    6,   13,
-       34,   22,   22,   24,   10,   13,   34,   10,   24,   10,
-       10,   10,   24
-
+       40,   40,   42,   38,   39,   41, 8193,   38,   39,   41,
+    16385, 8193,   38,   41,16385,   38,   39,   41,   39,   41,
+       38,   39,   41,   38,   39,   41,   38,   39,   41,   38,
+       39,   41,   38,   39,   41,   38,   39,   41,   38,   39,
+       41,   38,   39,   41,   38,   39,   41,   38,   39,   41,
+       38,   39,   41,   38,   39,   41,   38,   39,   41,   38,
+       39,   41,   38,   39,   41,   38,   39,   41,   38,   39,
+       41,   38,   39,   41,   40,   41,   41,   38,   38, 8193,
+       38, 8193,   38,16385, 8193,   38, 8193,   38,   38, 8229,
+       38,16421,   38,   38,   38,   38,   38,   38,   38,   38,
+
+       38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
+       38,   38,   38,   38,   38,   38,   38,   38,   38,   40,
+     8193,   38, 8193,   38, 8193, 8229,   38, 8229,   38, 8229,
+       28,   38,   38,   38,   38,   38,   38,   38,   38,   38,
+       38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
+       38,   38,   38,   38,   38,   38,   38,   38,   38, 8229,
+       38, 8229,   38, 8229,   28,   38,   38,   33, 8229,   38,
+    16421,   38,   38,   16,   38,   38,   38,   38,   38,   38,
+       38,   38,   38,   38, 8222, 8229,   38,16414,16421,   38,
+       38,   36, 8229,   38,16421,   38, 8221, 8229,   38,16413,
+
+    16421,   38,   38,   38, 8224, 8229,   38,16416,16421,   38,
+       38,   38,   38,   38,   38,   38,   33, 8229,   38,   33,
+     8229,   38,   33,   38,   33, 8229,   38,    3,   38,   16,
+       38,   38,   38,   38,   38,   35, 8229,   38,16421,   38,
+       38,   38,   38, 8222, 8229,   38, 8222, 8229,   38, 8222,
+       38, 8222, 8229,   38,   38,   36, 8229,   38,   36, 8229,
+       38,   36,   38,   36, 8229, 8221, 8229,   38, 8221, 8229,
+       38, 8221,   38, 8221, 8229,   38,   38, 8224, 8229,   38,
+     8224, 8229,   38, 8224,   38, 8224, 8229,   38,   38,   38,
+       38,   11,   38,   38,   33, 8229,   38,   33, 8229,   38,
+
+       33, 8229,   33,   38,   33,   38,    3,   38,   38,   38,
+       38,   38,   38,   38,   35, 8229,   38,   35, 8229,   38,
+       35,   38,   35, 8229,   38,   38,   38,   34, 8229,   38,
+    16421, 8222, 8229,   38, 8222, 8229,   38, 8222, 8229, 8222,
+       38, 8222,   38,   38,   36, 8229,   38,   36, 8229,   38,
+       36, 8229,   36,   38,   36, 8221, 8229,   38, 8221, 8229,
+       38, 8221, 8229, 8221,   38, 8221,   38,   38, 8224, 8229,
+       38, 8224, 8229,   38, 8224, 8229, 8224,   38, 8224,   38,
+       38,   38,   38,   11,   28,   11,    7,   38,   38,   38,
+       38,   38,   38,   38,   14,   38,   35, 8229,   38,   35,
+
+     8229,   38,   35, 8229,   35,   38,   35,    2,   38,   38,
+       34, 8229,   38,   34, 8229,   38,   34,   38,   34, 8229,
+       17,   38,   38,   12,   38,   38,   27,   23,   38,   38,
+       11,   11,   28,    7,   28,    7,   38,    8,   38,   38,
+       38,   38,    6,   38,   14,   38,    2,   28,    2,   38,
+       38,   34, 8229,   38,   34, 8229,   38,   34, 8229,   34,
+       38,   34,   17,   38,   38,   12,   28,   12,   38,   31,
+     8229,   38,16421,   27,   28,   27,   23,   38,   38,    7,
+        7,   28,   38,    8,   28,    8,   38,   38,   38,   38,
+        6,   28,    6,    6,   28,    6,   28,   38,    2,    2,
+
+       28,   38,   38,   38,   12,   12,   28,   38,   31, 8229,
+       38,   31, 8229,   38,   31,   38,   31, 8229,   27,   28,
+       24,   38,   38,    8,    8,   28,   38,   38,   18,   19,
+        6,    6,   28,    6,    6,   38,   38,   38,   15,   38,
+       38,   31, 8229,   38,   31, 8229,   38,   31, 8229,   31,
+       38,   31,   24,   38,   38,   38,   38,   18,   28,   18,
+       19,   28,   19,    6,    6,   38,   38,   38,   15,   38,
+       38,   21,    9,   20,   18,   18,   28,   19,   19,   28,
+        6,    5,    6,   38,   22,   38,   21,   28,   21,    9,
+       28,    9,   20,   28,   20,    4,    6,    5,    6,   38,
+
+       26,   25,   22,   28,   22,   38,   21,   21,   28,    9,
+        9,   28,   20,   20,   28,    4,    6,   13,   38,   26,
+       25,   22,   22,   28,   10,   13,   38,   10,   28,   10,
+       10,   10,   28
     } ;
 
-static const flex_int16_t yy_accept[373] =
+static const flex_int16_t yy_accept[406] =
     {   0,
         1,    1,    1,    2,    3,    4,    7,   12,   16,   19,
        21,   24,   27,   30,   33,   36,   39,   42,   45,   48,
-       51,   54,   57,   60,   63,   66,   69,   71,   72,   73,
-       74,   76,   79,   81,   82,   83,   84,   87,   87,   88,
-       89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
-       99,  100,  101,  102,  103,  104,  105,  106,  107,  108,
-      109,  110,  111,  112,  114,  116,  117,  119,  121,  122,
-      123,  124,  125,  126,  127,  128,  129,  130,  131,  132,
-      133,  134,  135,  136,  137,  138,  139,  140,  141,  142,
-      143,  144,  145,  146,  147,  148,  150,  152,  153,  154,
-
-      155,  156,  160,  161,  162,  164,  165,  166,  167,  168,
-      169,  170,  171,  172,  177,  178,  179,  183,  184,  189,
-      190,  191,  192,  197,  198,  199,  200,  201,  202,  205,
-      208,  210,  212,  213,  215,  217,  218,  219,  220,  221,
-      225,  226,  227,  228,  231,  234,  236,  238,  239,  240,
-      243,  246,  248,  250,  253,  256,  258,  260,  261,  262,
-      265,  268,  270,  272,  273,  274,  275,  276,  277,  280,
-      283,  285,  287,  288,  289,  291,  292,  293,  294,  295,
-      296,  297,  300,  303,  305,  307,  308,  309,  313,  316,
-      319,  321,  323,  324,  325,  326,  329,  332,  334,  336,
-
-      337,  340,  343,  345,  347,  348,  349,  350,  353,  356,
-      358,  360,  361,  362,  363,  365,  366,  367,  368,  369,
-      370,  371,  372,  373,  374,  376,  379,  382,  384,  386,
-      387,  388,  389,  392,  395,  397,  399,  401,  402,  403,
-      404,  405,  406,  407,  409,  411,  412,  413,  414,  415,
-      416,  417,  418,  419,  420,  422,  424,  425,  426,  429,
-      432,  434,  436,  437,  439,  440,  442,  443,  444,  448,
-      450,  451,  452,  454,  455,  457,  458,  459,  460,  461,
-      462,  464,  465,  467,  469,  470,  471,  473,  474,  475,
-      476,  478,  479,  482,  485,  487,  489,  491,  492,  493,
-
-      495,  496,  497,  498,  499,  500,  502,  503,  504,  505,
-      506,  508,  509,  512,  515,  517,  519,  520,  521,  522,
-      523,  525,  526,  528,  529,  530,  531,  532,  533,  535,
-      536,  537,  538,  539,  540,  542,  543,  545,  546,  548,
-      549,  550,  551,  553,  554,  556,  557,  559,  560,  562,
-      564,  565,  567,  568,  569,  570,  572,  573,  575,  576,
-      578,  580,  582,  583,  585,  586,  588,  590,  591,  592,
-      594,  594
+       51,   54,   57,   60,   63,   66,   69,   72,   75,   77,
+       78,   79,   80,   82,   85,   87,   88,   89,   90,   93,
+       93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
+      103,  104,  105,  106,  107,  108,  109,  110,  111,  112,
+      113,  114,  115,  116,  117,  118,  119,  120,  121,  123,
+      125,  126,  128,  130,  131,  132,  133,  134,  135,  136,
+      137,  138,  139,  140,  141,  142,  143,  144,  145,  146,
+      147,  148,  149,  150,  151,  152,  153,  154,  155,  156,
+
+      157,  158,  159,  160,  162,  164,  165,  166,  167,  168,
+      172,  173,  174,  176,  177,  178,  179,  180,  181,  182,
+      183,  184,  185,  190,  191,  192,  196,  197,  202,  203,
+      204,  205,  210,  211,  212,  213,  214,  215,  216,  217,
+      220,  223,  225,  227,  228,  230,  232,  233,  234,  235,
+      236,  240,  241,  242,  243,  244,  247,  250,  252,  254,
+      255,  256,  259,  262,  264,  266,  269,  272,  274,  276,
+      277,  278,  281,  284,  286,  288,  289,  290,  291,  292,
+      293,  294,  295,  298,  301,  303,  305,  306,  307,  309,
+      310,  311,  312,  313,  314,  315,  318,  321,  323,  325,
+
+      326,  327,  328,  332,  335,  338,  340,  342,  343,  344,
+      345,  348,  351,  353,  355,  356,  359,  362,  364,  366,
+      367,  368,  369,  372,  375,  377,  379,  380,  381,  382,
+      383,  384,  386,  387,  388,  389,  390,  391,  392,  393,
+      394,  395,  397,  400,  403,  405,  407,  408,  409,  410,
+      411,  414,  417,  419,  421,  423,  424,  425,  426,  427,
+      428,  430,  431,  432,  434,  436,  437,  438,  439,  440,
+      441,  442,  443,  444,  445,  447,  449,  450,  451,  452,
+      455,  458,  460,  462,  463,  465,  466,  468,  469,  470,
+      474,  476,  477,  479,  480,  481,  483,  484,  486,  487,
+
+      488,  489,  490,  491,  493,  494,  496,  498,  499,  500,
+      502,  503,  504,  505,  506,  508,  509,  512,  515,  517,
+      519,  521,  523,  524,  525,  527,  528,  529,  530,  531,
+      532,  534,  535,  536,  537,  538,  539,  541,  542,  545,
+      548,  550,  552,  553,  555,  556,  557,  558,  560,  561,
+      563,  564,  565,  566,  567,  568,  569,  571,  572,  573,
+      574,  575,  576,  578,  579,  581,  582,  584,  585,  585,
+      586,  587,  589,  590,  592,  593,  595,  596,  598,  600,
+      601,  602,  603,  605,  606,  607,  608,  610,  611,  613,
+      614,  616,  618,  620,  621,  622,  623,  625,  626,  628,
+
+      630,  631,  632,  634,  634
     } ;
 
 static const YY_CHAR yy_ec[256] =
@@ -679,16 +690,16 @@ static const YY_CHAR yy_ec[256] =
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    2,    1,    1,    1,    1,    1,    1,    1,    1,
-        1,    1,    1,    4,    5,    1,    1,    6,    6,    7,
-        6,    6,    6,    6,    6,    6,    6,    8,    1,    1,
-        9,    1,    1,    1,    1,    1,    1,    1,    1,    1,
+        1,    1,    1,    4,    5,    1,    1,    6,    7,    8,
+        9,    9,    9,    9,    9,    9,    9,   10,    1,    1,
+       11,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
-        1,    1,    1,    1,    1,    1,   10,   11,   12,   13,
+        1,    1,    1,    1,   12,    1,   13,   14,   15,   16,
 
-       14,   15,   16,   17,   18,   19,   20,   21,   22,   23,
-       24,   25,   26,   27,   28,   29,   30,   31,   32,   33,
-       34,   19,    1,    1,    1,    1,    1,    1,    1,    1,
+       17,   18,   19,   20,   21,   22,   23,   24,   25,   26,
+       27,   28,   29,   30,   31,   32,   33,   34,   35,   36,
+       37,   22,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
@@ -705,340 +716,362 @@ static const YY_CHAR yy_ec[256] =
         1,    1,    1,    1,    1
     } ;
 
-static const YY_CHAR yy_meta[35] =
+static const YY_CHAR yy_meta[38] =
     {   0,
-        1,    1,    2,    3,    1,    1,    1,    1,    4,    1,
+        1,    1,    2,    3,    1,    1,    1,    1,    1,    1,
+        4,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
-        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
-        1,    1,    1,    1
+        1,    1,    1,    1,    1,    1,    1
     } ;
 
-static const flex_int16_t yy_base[443] =
+static const flex_int16_t yy_base[476] =
     {   0,
-        0,    0,  936,  935,  937,  932,   33,   36,  940,  940,
-       45,   63,   31,   42,   51,   52,  925,   33,   65,   67,
-       69,   70,  924,   71,  923,   75,    0,  940,  928,  940,
-       91,   95,    0,    0,  104,  921,  113,    0,   91,   99,
-      114,   92,  115,   80,  100,   48,  119,  121,  122,   74,
-      123,  128,  131,  129,  125,  133,  135,  136,  137,  143,
-      138,  145,    0,  157,    0,    0,  168,    0,    0,  926,
-      140,  146,  165,  159,  152,  164,  155,  168,  171,  176,
-      177,  170,  180,  175,  184,  188,  212,  191,  185,  192,
-      193,  194,  219,  212,  199,  230,    0,    0,  940,  195,
-
-      200,  239,  235,  197,  246,  225,  226,  919,  244,  918,
-      243,  236,  245,  266,  248,  264,  282,  271,  291,  248,
-      270,  254,  300,  279,  296,  302,  288,  303,  311,    0,
-      315,    0,  311,  318,  940,  313,  319,  208,  313,  344,
-      321,  331,  325,  333,    0,  352,    0,  345,  347,  359,
-        0,  361,    0,  368,    0,  370,    0,  322,  366,  379,
-        0,  381,    0,  359,  357,  923,  382,  384,  392,    0,
-        0,    0,    0,  387,  940,  386,  390,  392,  329,  401,
-      397,  409,    0,  417,    0,  399,  412,  426,  429,    0,
-        0,    0,    0,  412,  427,  438,    0,    0,    0,    0,
-
-      440,    0,    0,    0,    0,  436,  405,  447,    0,    0,
-        0,    0,  438,  443,  922,  940,  921,  442,  450,  449,
-      452,  454,  459,  458,  453,  469,    0,    0,    0,    0,
-      920,  470,  481,    0,  483,    0,  484,  481,  919,  368,
-      467,  495,  918,  940,  917,  940,  488,  916,  479,  490,
-      492,  495,  505,  498,  940,  915,  940,  507,  523,    0,
-        0,    0,    0,  940,  503,  864,  940,  846,  532,  836,
-        0,  824,  940,  516,  796,  940,  513,  530,  536,  538,
-      784,  940,  542,  535,  547,  772,  940,  549,  551,  768,
-      940,  502,  562,    0,  564,    0,    0,  562,  764,  940,
-
-      544,  557,  760,  752,  744,  940,  552,  568,  571,  568,
-      581,  577,  588,    0,    0,    0,    0,  589,  580,  591,
-      736,  940,  728,  940,  601,  602,  597,  599,  940,  603,
-      720,  712,  700,  672,  940,  665,  940,  610,  656,  603,
-      648,  607,  629,  940,  627,  940,  625,  940,  624,  940,
-      607,  574,  940,  614,  572,  940,  491,  940,  433,  940,
-      940,  622,  389,  940,  303,  940,  261,  940,  204,  940,
-      940,  635,  639,  642,  646,  650,  654,  658,  662,  666,
-      670,  674,  678,  682,  686,  690,  694,  698,  702,  706,
-      710,  714,  718,  722,  726,  730,  734,  738,  742,  746,
-
-      750,  754,  758,  762,  766,  770,  774,  778,  782,  786,
-      790,  794,  798,  802,  806,  810,  814,  818,  822,  826,
-      830,  834,  838,  842,  846,  850,  854,  858,  862,  866,
-      870,  874,  878,  882,  886,  890,  894,  898,  902,  906,
-      910,  914
+        0,    0, 1008, 1007, 1009, 1004,   36,   39, 1012, 1012,
+       50,   71,   32,   72,   31,   43,   33,   45,   64,  994,
+       65,   67,   54,  993,   73,   77,   83,   84,    0, 1012,
+     1001, 1012,   95,  108,    0,    0,  119,  991,  131,    0,
+      112,   81,   90,  115,  100,  103,  125,  101,  104,  126,
+      127,  990,  133,  134,  139,  145,  154,  135,  147,  140,
+      149,  151,  150,  152,   36,  153,  160,    0,  178,    0,
+        0,  180,    0,    0,  998,  173,  156,  182,  174,  175,
+      180,  181,  183,  186,  190,  191,  185,  192,  196,  198,
+      201,  206,  232,  207,  202,  211,  209,  212,  241,  226,
+
+      215,  225,  216,  249,    0,    0, 1012,  227,  228,  262,
+      258,  243,  265,  246,  264,  988,  271,  987,  248,  269,
+      263,  272,  296,  275,  273,  308,  313,  326,  304,  274,
+      312,  338,  303,  334,  301,  302,  292,  321,  340,  351,
+        0,  355,    0,  343,  357, 1012,  348,  332,  354,  358,
+      388,  362,  360,  361,  367,  392,    0,  398,    0,  389,
+      366,  403,    0,  407,    0,  412,    0,  416,    0,  399,
+      213,  418,    0,  421,    0,  395,  404,  366,  415,  995,
+      333,  425,  430,    0,    0,    0,    0,  424, 1012,  427,
+      429,  432,  422,  444,  437,  451,    0,  457,    0,  453,
+
+      447,  460,  480,  466,    0,    0,    0,    0,  459,  369,
+      468,    0,    0,    0,    0,  484,    0,    0,    0,    0,
+      465,  476,  490,    0,    0,    0,    0,  483,  487,  486,
+      490,  994, 1012,  993,  489,  496,  495,  498,  500,  506,
+      505,  454,  521,    0,    0,    0,    0,  992,  504,  518,
+      533,    0,  535,    0,  527,  532,  991,  536,  540,  537,
+      514,  539,  990, 1012,  989, 1012,  539,  988,  544,  543,
+      546,  548,  561,  552, 1012,  987, 1012,  562,  567,  581,
+        0,    0,    0,    0, 1012,  556,  986, 1012,  976,  592,
+      984,    0, 1012,  574,  983, 1012,  558,  982, 1012,  578,
+
+      583,  594,  596,  981, 1012,  288,  596,  603,  930, 1012,
+      597,  599,  605,  918, 1012,  609,  620,    0,  622,    0,
+        0,  623,  619,  902, 1012,  615,  622,  890,  862,  850,
+     1012,  625,  635,  628,  636,  633,  642,  639,  658,    0,
+        0,    0,    0, 1012,  652,  634,  659,  838, 1012,  834,
+     1012,  646,  660,  663,  661,  666, 1012,  658,  830,  826,
+      818,  810, 1012,  802, 1012,  676,  794,  671,  684,  786,
+      671,  778, 1012,  766, 1012,  738, 1012,  731, 1012,  677,
+      722,  714,  691, 1012,  685,  647, 1012,  565, 1012,  508,
+     1012, 1012,  684, 1012, 1012,  448, 1012,  374, 1012,  167,
+
+     1012,  122, 1012, 1012,  701,  705,  708,  712,  716,  720,
+      724,  728,  732,  736,  740,  744,  748,  752,  756,  760,
+      764,  768,  772,  776,  780,  784,  788,  792,  796,  800,
+      804,  808,  812,  816,  820,  824,  828,  832,  836,  840,
+      844,  848,  852,  856,  860,  864,  868,  872,  876,  880,
+      884,  888,  892,  896,  900,  904,  908,  912,  916,  920,
+      924,  928,  932,  936,  940,  944,  948,  952,  956,  960,
+      964,  968,  972,  976,  980
     } ;
 
-static const flex_int16_t yy_def[443] =
+static const flex_int16_t yy_def[476] =
     {   0,
-      371,    1,  372,  372,  371,  373,  374,  374,  371,  371,
-      375,  375,   12,   12,   12,   12,   12,   12,   12,   12,
-       12,   12,   12,   12,   12,   12,  376,  371,  373,  371,
-      377,  374,  378,  378,  379,   12,  373,  380,   12,   12,
+      404,    1,  405,  405,  404,  406,  407,  407,  404,  404,
+      408,  408,   12,   12,   12,   12,   12,   12,   12,   12,
+       12,   12,   12,   12,   12,   12,   12,   12,  409,  404,
+      406,  404,  410,  407,  411,  411,  412,   12,  406,  413,
+       12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
        12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
+       12,   12,   12,   12,   12,   12,   12,  409,  410,  411,
+      411,  414,  415,  415,  404,   12,   12,   12,   12,   12,
        12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
-       12,   12,  376,  377,  378,  378,  381,  382,  382,  371,
+       12,   12,  412,   12,   12,   12,   12,   12,   12,   12,
+
+       12,   12,   12,  414,  415,  415,  404,   12,   12,  416,
        12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
-       12,   12,   12,   12,   12,   12,  379,   12,   12,   12,
-       12,   12,   12,   12,   12,  381,  382,  382,  371,   12,
-
-       12,  383,   12,   12,   12,   12,   12,   12,   12,   12,
-       12,   12,   12,  384,   87,   87,  385,   12,  386,   12,
-       12,   12,  387,   12,   12,   12,   12,   12,  388,  389,
-      383,  389,   12,   12,  371,   87,   12,   12,   12,  390,
-       12,   12,   12,  391,  392,  384,  392,   87,   87,  393,
-      394,  385,  394,  395,  396,  386,  396,   12,   12,  397,
-      398,  387,  398,   12,   12,  399,   12,   12,  388,  389,
-      389,  400,  400,   12,  371,   87,   87,   87,   12,   12,
-       12,  401,  402,  390,  402,   12,   12,  403,  391,  392,
-      392,  404,  404,   87,   87,  393,  394,  394,  405,  405,
-
-      395,  396,  396,  406,  406,   12,   12,  397,  398,  398,
-      407,  407,   12,   12,  408,  371,  409,   87,   12,   87,
-       87,   87,   12,   87,   12,  401,  402,  402,  410,  410,
-      411,   87,  412,  413,  403,  413,   87,   87,  414,   12,
-       12,  415,  408,  371,  416,  371,   87,  417,   12,   87,
-       87,   87,  418,   87,  371,  419,  371,   87,  412,  413,
-      413,  420,  420,  371,   87,  421,  371,   12,  422,  423,
-      423,  416,  371,   87,  424,  371,   12,   87,   87,   87,
-      425,  371,  425,  425,   87,  419,  371,   87,   87,  421,
-      371,   12,  426,  427,  422,  427,  423,   87,  424,  371,
-
-       12,   87,  428,  429,  425,  371,  425,  425,   87,   87,
-       87,   12,  426,  427,  427,  430,  430,   87,   12,   87,
-      431,  371,  432,  371,  425,  425,   87,   87,  371,   12,
-      433,  434,  435,  431,  371,  432,  371,  425,  425,   87,
-      436,   12,  437,  371,  438,  371,  439,  371,  425,  371,
-       87,  440,  371,   12,  437,  371,  438,  371,  439,  371,
-      371,   87,  440,  371,  441,  371,  442,  371,  442,  371,
-        0,  371,  371,  371,  371,  371,  371,  371,  371,  371,
-      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
-      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
-
-      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
-      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
-      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
-      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
-      371,  371
+       12,   12,  417,   93,   93,  418,   12,  419,   12,   12,
+       12,  420,   12,   12,   12,   12,   12,   12,   12,  421,
+      422,  416,  422,   12,   12,  404,   93,   12,   12,   12,
+      423,   12,   12,   12,   12,  424,  425,  417,  425,   93,
+       93,  426,  427,  418,  427,  428,  429,  419,  429,   12,
+       12,  430,  431,  420,  431,   12,   12,   12,   12,  432,
+       12,   12,  421,  422,  422,  433,  433,   12,  404,   93,
+       93,   93,   12,   12,   12,  434,  435,  423,  435,   12,
+
+      406,   12,  436,  424,  425,  425,  437,  437,   93,   93,
+      426,  427,  427,  438,  438,  428,  429,  429,  439,  439,
+       12,   12,  430,  431,  431,  440,  440,   12,   12,   12,
+       12,  441,  404,  442,   93,   12,   93,   93,   93,   12,
+       93,   12,  434,  435,  435,  443,  443,  444,  406,   93,
+      445,  446,  436,  446,   93,   93,  447,   12,   12,  448,
+       12,   12,  441,  404,  449,  404,   93,  450,   12,   93,
+       93,   93,  451,   93,  404,  452,  404,  406,   93,  445,
+      446,  446,  453,  453,  404,   93,  454,  404,   12,  455,
+      456,  456,  404,   12,  449,  404,   93,  457,  404,   12,
+
+       93,   93,   93,  458,  404,  458,  458,   93,  452,  404,
+      406,   93,   93,  454,  404,   12,  459,  460,  455,  460,
+      456,   12,   93,  457,  404,   12,   93,  461,  462,  458,
+      404,  458,  458,   93,  406,   93,   93,   12,  459,  460,
+      460,  463,  463,  404,   93,   12,   93,  464,  404,  465,
+      404,  458,  458,   93,  406,   93,  404,   12,  466,  467,
+      468,  464,  404,  465,  404,  458,  458,   93,  404,  469,
+       12,  470,  404,  471,  404,  472,  404,  458,  404,   93,
+      404,  404,  473,  404,   12,  470,  404,  471,  404,  472,
+      404,  404,   93,  404,  404,  473,  404,  474,  404,  475,
+
+      404,  475,  404,    0,  404,  404,  404,  404,  404,  404,
+      404,  404,  404,  404,  404,  404,  404,  404,  404,  404,
+      404,  404,  404,  404,  404,  404,  404,  404,  404,  404,
+      404,  404,  404,  404,  404,  404,  404,  404,  404,  404,
+      404,  404,  404,  404,  404,  404,  404,  404,  404,  404,
+      404,  404,  404,  404,  404,  404,  404,  404,  404,  404,
+      404,  404,  404,  404,  404,  404,  404,  404,  404,  404,
+      404,  404,  404,  404,  404
     } ;
 
-static const flex_int16_t yy_nxt[975] =
+static const flex_int16_t yy_nxt[1050] =
     {   0,
-        6,    7,    8,    9,    6,    6,    6,    6,   10,   11,
-       12,   13,   14,   15,   16,   17,   18,   19,   17,   17,
-       17,   17,   20,   17,   21,   22,   23,   24,   25,   17,
-       26,   17,   17,   17,   32,   32,   33,   32,   32,   33,
-       36,   34,   36,   42,   34,   29,   29,   29,   30,   35,
-       50,   36,   37,   38,   43,   44,   39,   36,   80,   45,
-       36,   36,   40,   29,   29,   29,   30,   35,   46,   48,
-       37,   38,   41,   47,   36,   49,   36,   53,   36,   36,
-       36,   56,   58,   36,   36,   55,   83,   61,   51,   36,
-       54,   62,   52,   29,   65,   59,   32,   32,   33,   66,
-
-       36,   36,   71,   34,   29,   29,   29,   30,   36,   36,
-       77,   29,   38,   67,   67,   67,   68,   67,   75,   72,
-       67,   69,   73,   36,   36,   74,   78,   79,   36,   53,
-       36,   36,   36,   87,   36,   76,   84,   36,   36,   85,
-       36,   81,   36,   86,   36,   36,   36,   36,   82,   36,
-       92,   95,   36,  100,   36,   36,   89,   90,   88,   29,
-       65,   36,   91,  101,   36,   66,   90,   93,   36,   94,
-       29,   97,  102,   36,   36,  104,   98,   36,  103,   36,
-       36,  107,  108,  106,   36,   36,   36,  105,   86,   36,
-      109,  110,  111,   36,   36,  114,  112,   36,  117,  119,
-
-       36,   36,   36,   36,   36,  121,   36,  368,   36,   36,
-      120,  113,   29,   29,   29,   30,  118,   36,  134,   29,
-       38,   36,  127,  115,  116,  122,  123,  125,   36,  126,
-      128,  124,   29,   97,   36,   36,  180,  138,   98,  129,
-      129,   67,  130,  129,   36,   36,  129,  132,  133,  135,
-      136,  140,   36,   36,   36,   36,  142,   36,  137,   35,
-       35,  123,   86,   36,  370,  143,  144,  144,   67,  145,
-      144,  148,  158,  144,  147,   35,   35,   90,  119,   36,
-       36,  149,  150,  150,   67,  151,  150,  159,   36,  150,
-      153,  154,  154,   67,  155,  154,  164,   36,  154,  157,
-
-      160,  160,   67,  161,  160,   36,  368,  160,  163,  165,
-      166,   36,   36,   29,  170,  167,  168,   29,  172,  171,
-       36,  175,   36,  173,   35,   35,  176,   36,   36,  177,
-       36,   36,  188,  174,   36,   29,  190,  178,   36,  181,
-       36,  191,  223,  179,  182,  182,   67,  183,  182,  186,
-      206,  182,  185,  187,   29,  192,   35,   35,   35,   35,
-      193,   29,  197,   29,  199,  194,   36,  198,   36,  200,
-       29,  202,   29,  204,  195,   36,  203,   36,  205,  268,
-      207,   29,  209,   29,  211,  214,  213,  210,  218,  212,
-      217,   36,  353,   36,   29,  170,   36,   35,   35,  219,
-
-      171,   35,   35,   35,   35,  224,   36,  231,   36,  225,
-       36,   29,  227,  221,   36,  222,  232,  228,  220,   29,
-      229,   36,  240,   35,   35,  230,  233,  233,   67,  234,
-      233,   29,  190,  233,  236,  237,  348,  191,  238,   35,
-       29,  197,   29,  202,  239,   36,  198,   36,  203,   29,
-      209,  242,   36,   35,  247,  210,  255,  241,  248,   36,
-       35,   35,   36,   35,   35,   35,   35,  253,   36,   35,
-       35,   29,  227,  250,  269,  254,   36,  228,  249,  251,
-      252,   35,  258,   29,  260,   29,  262,  264,   36,  261,
-      265,  263,   35,   35,  346,   35,   35,   70,  271,   35,
-
-       35,   35,   35,   35,   35,  274,   35,   35,  282,   35,
-       35,   36,  277,  278,   35,   35,  283,  284,   35,   35,
-      279,  285,   36,  280,  288,   29,  260,   35,   35,  289,
-      312,  261,  293,  293,   67,  294,  293,  301,  306,  293,
-      296,   35,   35,  298,  303,  306,  304,   35,   35,   35,
-       35,  309,  308,   36,  307,  282,  302,  319,   35,   35,
-       35,   35,   35,  311,   29,  314,   29,  316,   35,   35,
-      315,  282,  317,   35,   35,  344,  310,  364,  325,   35,
-       35,  318,   35,   35,  329,  320,   36,  328,  332,   36,
-       29,  314,   35,   35,  330,  326,  315,  331,  327,  333,
-
-       35,   35,   35,   35,  282,  282,  340,  341,   35,   35,
-       35,   35,   36,  282,   35,   35,   36,  351,   35,   35,
-      362,  339,  365,   36,  338,  366,  342,  361,  360,  354,
-      358,  349,  356,   35,   35,   27,   27,   27,   27,   29,
-       29,   29,   31,   31,   31,   31,   36,   36,   36,   36,
-       63,  353,   63,   63,   64,   64,   64,   64,   66,  350,
-       66,   66,   35,   35,   35,   35,   70,   70,  324,   70,
-       96,   96,   96,   96,   98,  322,   98,   98,  131,  131,
-      131,  131,  146,  146,  146,  146,  152,  152,  152,  152,
-      156,  156,  156,  156,  162,  162,  162,  162,  169,  169,
-
-      169,  169,  171,  348,  171,  171,  184,  184,  184,  184,
-      189,  189,  189,  189,  191,  346,  191,  191,  196,  196,
-      196,  196,  198,  344,  198,  198,  201,  201,  201,  201,
-      203,  337,  203,  203,  208,  208,  208,  208,  210,  335,
-      210,  210,  215,  215,  215,  215,  173,  282,  173,  173,
-      226,  226,  226,  226,  228,  324,  228,  228,  235,  235,
-      235,  235,  193,  322,  193,  193,  200,  276,  200,  200,
-      205,  267,  205,  205,  212,  257,  212,  212,  243,  243,
-      243,  243,  245,  245,  245,  245,  230,  306,  230,  230,
-      256,  256,  256,  256,  259,  259,  259,  259,  261,  300,
-
-      261,  261,  266,  266,  266,  266,  270,  270,  270,  270,
-      272,  272,  272,  272,  275,  275,  275,  275,  281,  281,
-      281,  281,  286,  286,  286,  286,  263,  246,  263,  263,
-      290,  290,  290,  290,  295,  295,  295,  295,  271,  297,
-      271,  271,  299,  299,  299,  299,  305,  305,  305,  305,
-      313,  313,  313,  313,  315,  292,  315,  315,  321,  321,
-      321,  321,  323,  323,  323,  323,  317,  291,  317,  317,
-      334,  334,  334,  334,  336,  336,  336,  336,  343,  343,
-      343,  343,  345,  345,  345,  345,  347,  347,  347,  347,
-      352,  352,  352,  352,  355,  355,  355,  355,  357,  357,
-
-      357,  357,  359,  359,  359,  359,  363,  363,  363,  363,
-      367,  367,  367,  367,  369,  369,  369,  369,  287,  276,
-      273,  216,  267,  257,  246,  244,  216,  141,  139,   99,
-       36,   30,   60,   57,   36,   30,  371,   28,   28,    5,
-      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
-      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
-      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
-      371,  371,  371,  371
+        6,    7,    8,    9,    6,    6,    6,    6,    6,    6,
+       10,    6,   11,   12,   13,   14,   15,   16,   17,   18,
+       19,   20,   20,   20,   20,   21,   20,   22,   23,   24,
+       25,   26,   27,   28,   20,   20,   20,   34,   34,   35,
+       34,   34,   35,   38,   38,   38,   36,   44,   38,   36,
+       31,   31,   31,   32,   37,   38,   49,   38,   45,   39,
+       40,   31,   52,   50,   41,   53,   38,  102,   59,   51,
+       42,   31,   31,   31,   32,   37,   38,   38,   56,   38,
+       39,   40,   31,   43,   38,   38,   58,   61,   46,   63,
+       54,   57,   47,   38,   55,   38,   38,   31,   70,   66,
+
+       62,   48,   38,   67,   79,   71,   64,   78,   65,   34,
+       34,   35,   38,   38,   85,   38,   38,   56,   36,   31,
+       31,   31,   32,   81,   38,  401,   76,   38,   31,   40,
+       31,   72,   72,   72,   73,   72,   82,   38,   38,   38,
+       72,   74,   72,   77,   80,   38,   38,   38,   89,   86,
+       90,   38,   38,   91,   83,   84,   87,   38,   93,   38,
+       92,   38,   38,   38,   38,   38,   38,   98,   38,  103,
+      403,   94,   38,   95,   96,   96,  109,   99,   97,  100,
+       31,   70,   31,  105,  101,   38,   38,   38,   71,  108,
+      106,  110,   38,   38,   38,   38,  111,   38,   38,  115,
+
+      116,  112,   38,   38,   38,   92,  113,  117,   38,  118,
+       38,  120,  114,   38,   38,  123,  126,  119,   38,   38,
+      128,   38,  121,   38,   38,   38,  130,   38,   38,  129,
+      222,  122,   31,   31,   31,   32,  127,   38,   38,   38,
+       38,   31,   40,   31,  134,  135,  124,  125,  131,  137,
+      132,   31,  105,   38,  136,   38,  133,  138,   38,  106,
+       38,  139,  140,  140,   72,  141,  140,  145,  146,  147,
+       38,  140,  143,  140,  144,   38,   38,   38,  149,  153,
+      151,   38,  148,   38,   38,  154,   38,   37,   37,   37,
+       37,  331,   92,  161,  171,  155,  156,  156,   72,  157,
+
+      156,  160,  180,  332,   38,  156,  159,  156,  162,  162,
+       72,  163,  162,   38,   38,   38,   38,  162,  165,  162,
+       96,  132,  128,  176,   38,   38,  166,  166,   72,  167,
+      166,  170,  178,   38,  179,  166,  169,  166,  172,  172,
+       72,  173,  172,  234,   38,   38,   38,  172,  175,  172,
+      177,  181,   38,   31,  184,   38,  182,   31,  186,  193,
+      189,  185,   37,   37,  190,  187,   38,  191,  188,   38,
+       38,  201,   38,   38,   38,  192,  203,  401,   38,   38,
+       37,   37,  230,  256,   37,  194,  202,  195,  196,  196,
+       72,  197,  196,  200,   31,  205,  210,  196,  199,  196,
+
+       31,  207,  206,   37,   37,   31,  212,   38,  208,   31,
+      214,   38,  209,  213,   31,  217,   38,  215,   31,  219,
+       31,  224,  218,   31,  226,  228,  220,   38,  225,  235,
+      221,  227,   31,  184,   38,  229,   38,   38,  240,  236,
+      185,   37,   37,   37,   37,  231,   37,   37,  241,   38,
+       32,  384,  242,   31,  244,  238,   38,  275,  239,   31,
+      246,  245,  237,  248,  250,   38,   38,  247,   31,  205,
+       31,  212,   38,   37,   37,  257,  206,   38,  213,  249,
+      251,  251,   72,  252,  251,  255,   31,  217,   38,  251,
+      254,  251,   31,  224,  218,   38,  258,  260,   38,   38,
+
+      225,  261,   38,   37,  267,  259,  268,   32,   38,   37,
+       37,  377,   37,   37,   37,   37,  273,  293,   38,   37,
+       37,  262,  270,   31,  244,  274,   38,  269,  271,  272,
+      285,  245,   37,  279,  278,   31,  281,   31,  283,   75,
+      292,   37,   37,  282,  286,  284,   37,   37,   38,  290,
+      289,   38,   38,   37,   37,  294,   38,   37,   37,  297,
+       37,   37,   37,   37,  305,   32,   37,   37,  375,  301,
+       37,   37,   37,   37,  311,  306,  307,  302,  308,  303,
+      300,   37,   37,   31,  281,  313,   38,  312,  323,  322,
+       38,  282,  317,  317,   72,  318,  317,   37,   37,  331,
+
+       32,  317,  320,  317,  328,  326,  329,  334,   37,   37,
+       37,   37,  327,   37,   37,  335,  333,   37,   37,   37,
+      337,   38,   31,  340,   31,  342,  344,   38,  305,  336,
+      341,  346,  343,   37,   37,   38,   37,   37,  305,   32,
+      338,  345,   37,   37,  360,  357,   38,   37,   37,  305,
+      373,   38,  355,  347,  352,  356,   37,   37,  354,  358,
+       31,  340,  359,  305,   32,  353,   37,   37,  341,  361,
+       38,  369,  366,   37,   37,  368,  370,   37,   37,  305,
+       37,   37,  367,   38,  371,   37,   37,  399,  380,  381,
+      382,   37,   37,  393,  397,  398,  385,   38,   37,   37,
+
+      378,   29,   29,   29,   29,   31,   31,   31,   33,   33,
+       33,   33,   38,   38,   38,   38,   68,  395,   68,   68,
+       69,   69,   69,   69,   71,  394,   71,   71,   37,   37,
+       37,   37,   75,   75,  392,   75,  104,  104,  104,  104,
+      106,  391,  106,  106,  142,  142,  142,  142,  158,  158,
+      158,  158,  164,  164,  164,  164,  168,  168,  168,  168,
+      174,  174,  174,  174,  183,  183,  183,  183,  185,  389,
+      185,  185,  198,  198,  198,  198,  204,  204,  204,  204,
+      206,  387,  206,  206,  211,  211,  211,  211,  213,  384,
+      213,  213,  216,  216,  216,  216,  218,  379,  218,  218,
+
+      223,  223,  223,  223,  225,  351,  225,  225,  232,  232,
+      232,  232,  187,  349,  187,  187,  243,  243,  243,  243,
+      245,  377,  245,  245,  253,  253,  253,  253,  208,  375,
+      208,  208,  215,  373,  215,  215,  220,  365,  220,  220,
+      227,  363,  227,  227,  263,  263,  263,  263,  265,  265,
+      265,  265,  247,  305,  247,  247,  276,  276,  276,  276,
+      280,  280,  280,  280,  282,  351,  282,  282,  287,  287,
+      287,  287,  291,  291,  291,  291,  295,  295,  295,  295,
+      298,  298,  298,  298,  304,  304,  304,  304,  309,  309,
+      309,  309,  284,  349,  284,  284,  314,  314,  314,  314,
+
+      319,  319,  319,  319,  292,  299,  292,  292,  324,  324,
+      324,  324,  330,  330,  330,  330,  339,  339,  339,  339,
+      341,  288,  341,  341,  348,  348,  348,  348,  350,  350,
+      350,  350,  343,  277,  343,  343,  362,  362,  362,  362,
+      364,  364,  364,  364,  372,  372,  372,  372,  374,  374,
+      374,  374,  376,  376,  376,  376,  383,  383,  383,  383,
+      386,  386,  386,  386,  388,  388,  388,  388,  390,  390,
+      390,  390,  396,  396,  396,  396,  400,  400,  400,  400,
+      402,  402,  402,  402,  331,  325,  266,  321,  316,  315,
+      310,  299,  296,  233,  288,  277,  266,  264,  233,  152,
+
+      150,  107,   88,   38,   32,   60,   38,   32,  404,   30,
+       30,    5,  404,  404,  404,  404,  404,  404,  404,  404,
+      404,  404,  404,  404,  404,  404,  404,  404,  404,  404,
+      404,  404,  404,  404,  404,  404,  404,  404,  404,  404,
+      404,  404,  404,  404,  404,  404,  404,  404,  404
     } ;
 
-static const flex_int16_t yy_chk[975] =
+static const flex_int16_t yy_chk[1050] =
     {   0,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
-        1,    1,    1,    1,    7,    7,    7,    8,    8,    8,
-       13,    7,   18,   13,    8,   11,   11,   11,   11,   11,
-       18,   14,   11,   11,   13,   14,   11,   46,   46,   14,
-       15,   16,   11,   12,   12,   12,   12,   12,   14,   16,
-       12,   12,   12,   15,   19,   16,   20,   20,   21,   22,
-       24,   22,   24,   50,   26,   21,   50,   26,   19,   44,
-       20,   26,   19,   31,   31,   24,   32,   32,   32,   31,
-
-       39,   42,   39,   32,   35,   35,   35,   35,   40,   45,
-       44,   35,   35,   37,   37,   37,   37,   37,   42,   39,
-       37,   37,   40,   41,   43,   41,   45,   45,   47,   47,
-       48,   49,   51,   54,   55,   43,   51,   52,   54,   52,
-       53,   48,   56,   53,   57,   58,   59,   61,   49,   71,
-       59,   61,   60,   71,   62,   72,   56,   62,   55,   64,
-       64,   75,   58,   72,   77,   64,   57,   60,   74,   60,
-       67,   67,   73,   76,   73,   75,   67,   78,   74,   82,
-       79,   78,   79,   77,   84,   80,   81,   76,   80,   83,
-       81,   82,   83,   85,   89,   86,   84,   86,   88,   90,
-
-       88,   90,   91,   92,  100,   92,  104,  369,   95,  101,
-       91,   85,   87,   87,   87,   87,   89,  138,  104,   87,
-       87,   94,  100,   87,   87,   93,   93,   94,   93,   95,
-      101,   93,   96,   96,  106,  107,  138,  107,   96,  102,
-      102,  102,  102,  102,  103,  112,  102,  102,  103,  105,
-      105,  109,  111,  109,  113,  105,  111,  120,  106,  115,
-      115,  122,  113,  122,  367,  112,  114,  114,  114,  114,
-      114,  115,  120,  114,  114,  116,  116,  118,  118,  121,
-      118,  116,  117,  117,  117,  117,  117,  121,  124,  117,
-      117,  119,  119,  119,  119,  119,  124,  127,  119,  119,
-
-      123,  123,  123,  123,  123,  125,  365,  123,  123,  125,
-      126,  126,  128,  129,  129,  127,  128,  131,  131,  129,
-      133,  134,  139,  131,  136,  136,  136,  134,  137,  136,
-      141,  158,  143,  133,  143,  144,  144,  136,  179,  139,
-      142,  144,  179,  137,  140,  140,  140,  140,  140,  141,
-      158,  140,  140,  142,  146,  146,  148,  148,  149,  149,
-      146,  150,  150,  152,  152,  148,  165,  150,  164,  152,
-      154,  154,  156,  156,  149,  159,  154,  240,  156,  240,
-      159,  160,  160,  162,  162,  165,  164,  160,  168,  162,
-      167,  167,  363,  168,  169,  169,  174,  176,  176,  174,
-
-      169,  177,  177,  178,  178,  180,  181,  186,  186,  181,
-      180,  182,  182,  177,  207,  178,  187,  182,  176,  184,
-      184,  187,  207,  194,  194,  184,  188,  188,  188,  188,
-      188,  189,  189,  188,  188,  194,  359,  189,  195,  195,
-      196,  196,  201,  201,  206,  206,  196,  213,  201,  208,
-      208,  214,  214,  218,  218,  208,  225,  213,  219,  219,
-      220,  220,  225,  221,  221,  222,  222,  223,  223,  224,
-      224,  226,  226,  220,  241,  224,  241,  226,  219,  221,
-      222,  232,  232,  233,  233,  235,  235,  237,  249,  233,
-      238,  235,  238,  238,  357,  237,  237,  242,  242,  247,
-
-      247,  250,  250,  251,  251,  247,  252,  252,  253,  254,
-      254,  292,  249,  250,  265,  265,  253,  253,  258,  258,
-      251,  254,  277,  252,  258,  259,  259,  274,  274,  265,
-      292,  259,  269,  269,  269,  269,  269,  277,  284,  269,
-      269,  278,  278,  274,  279,  283,  280,  279,  279,  280,
-      280,  285,  284,  301,  283,  307,  278,  301,  285,  285,
-      288,  288,  289,  289,  293,  293,  295,  295,  302,  302,
-      293,  308,  295,  298,  298,  355,  288,  352,  307,  310,
-      310,  298,  309,  309,  311,  302,  312,  310,  319,  319,
-      313,  313,  311,  311,  312,  308,  313,  318,  309,  320,
-
-      318,  318,  320,  320,  325,  326,  327,  328,  327,  327,
-      328,  328,  330,  338,  340,  340,  342,  340,  351,  351,
-      351,  326,  354,  354,  325,  362,  330,  349,  347,  342,
-      345,  338,  343,  362,  362,  372,  372,  372,  372,  373,
-      373,  373,  374,  374,  374,  374,  375,  375,  375,  375,
-      376,  341,  376,  376,  377,  377,  377,  377,  378,  339,
-      378,  378,  379,  379,  379,  379,  380,  380,  336,  380,
-      381,  381,  381,  381,  382,  334,  382,  382,  383,  383,
-      383,  383,  384,  384,  384,  384,  385,  385,  385,  385,
-      386,  386,  386,  386,  387,  387,  387,  387,  388,  388,
-
-      388,  388,  389,  333,  389,  389,  390,  390,  390,  390,
-      391,  391,  391,  391,  392,  332,  392,  392,  393,  393,
-      393,  393,  394,  331,  394,  394,  395,  395,  395,  395,
-      396,  323,  396,  396,  397,  397,  397,  397,  398,  321,
-      398,  398,  399,  399,  399,  399,  400,  305,  400,  400,
-      401,  401,  401,  401,  402,  304,  402,  402,  403,  403,
-      403,  403,  404,  303,  404,  404,  405,  299,  405,  405,
-      406,  290,  406,  406,  407,  286,  407,  407,  408,  408,
-      408,  408,  409,  409,  409,  409,  410,  281,  410,  410,
-      411,  411,  411,  411,  412,  412,  412,  412,  413,  275,
-
-      413,  413,  414,  414,  414,  414,  415,  415,  415,  415,
-      416,  416,  416,  416,  417,  417,  417,  417,  418,  418,
-      418,  418,  419,  419,  419,  419,  420,  272,  420,  420,
-      421,  421,  421,  421,  422,  422,  422,  422,  423,  270,
-      423,  423,  424,  424,  424,  424,  425,  425,  425,  425,
-      426,  426,  426,  426,  427,  268,  427,  427,  428,  428,
-      428,  428,  429,  429,  429,  429,  430,  266,  430,  430,
-      431,  431,  431,  431,  432,  432,  432,  432,  433,  433,
-      433,  433,  434,  434,  434,  434,  435,  435,  435,  435,
-      436,  436,  436,  436,  437,  437,  437,  437,  438,  438,
-
-      438,  438,  439,  439,  439,  439,  440,  440,  440,  440,
-      441,  441,  441,  441,  442,  442,  442,  442,  256,  248,
-      245,  243,  239,  231,  217,  215,  166,  110,  108,   70,
-       36,   29,   25,   23,   17,    6,    5,    4,    3,  371,
-      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
-      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
-      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
-      371,  371,  371,  371
+        1,    1,    1,    1,    1,    1,    1,    7,    7,    7,
+        8,    8,    8,   15,   13,   17,    7,   13,   65,    8,
+       11,   11,   11,   11,   11,   16,   15,   18,   13,   11,
+       11,   11,   17,   16,   11,   18,   23,   65,   23,   16,
+       11,   12,   12,   12,   12,   12,   19,   21,   21,   22,
+       12,   12,   12,   12,   14,   25,   22,   25,   14,   26,
+       19,   21,   14,   42,   19,   27,   28,   33,   33,   28,
+
+       25,   14,   43,   28,   43,   33,   26,   42,   27,   34,
+       34,   34,   45,   48,   48,   46,   49,   49,   34,   37,
+       37,   37,   37,   45,   41,  402,   41,   44,   37,   37,
+       37,   39,   39,   39,   39,   39,   46,   47,   50,   51,
+       39,   39,   39,   41,   44,   53,   54,   58,   53,   50,
+       54,   55,   60,   55,   47,   47,   51,   56,   57,   59,
+       56,   61,   63,   62,   64,   66,   57,   62,   77,   66,
+      400,   58,   67,   59,   60,   67,   77,   63,   61,   63,
+       69,   69,   72,   72,   64,   76,   79,   80,   69,   76,
+       72,   78,   81,   82,   78,   83,   79,   87,   84,   83,
+
+       84,   80,   85,   86,   88,   85,   81,   86,   89,   87,
+       90,   89,   82,   91,   95,   92,   94,   88,   92,   94,
+       96,   97,   90,   96,   98,  171,   98,  101,  103,   97,
+      171,   91,   93,   93,   93,   93,   95,  102,  100,  108,
+      109,   93,   93,   93,  100,  101,   93,   93,   99,  103,
+       99,  104,  104,   99,  102,  112,   99,  108,  114,  104,
+      119,  109,  110,  110,  110,  110,  110,  112,  113,  113,
+      111,  110,  110,  110,  111,  121,  115,  113,  115,  119,
+      117,  120,  114,  117,  122,  120,  130,  125,  125,  124,
+      124,  306,  122,  125,  130,  121,  123,  123,  123,  123,
+
+      123,  124,  137,  306,  137,  123,  123,  123,  126,  126,
+      126,  126,  126,  135,  136,  133,  129,  126,  126,  126,
+      127,  131,  127,  133,  131,  127,  128,  128,  128,  128,
+      128,  129,  135,  138,  136,  128,  128,  128,  132,  132,
+      132,  132,  132,  181,  148,  181,  134,  132,  132,  132,
+      134,  138,  139,  140,  140,  144,  139,  142,  142,  148,
+      145,  140,  147,  147,  147,  142,  149,  147,  144,  145,
+      150,  153,  153,  154,  152,  147,  155,  398,  178,  155,
+      161,  161,  178,  210,  210,  149,  154,  150,  151,  151,
+      151,  151,  151,  152,  156,  156,  161,  151,  151,  151,
+
+      158,  158,  156,  160,  160,  162,  162,  176,  158,  164,
+      164,  170,  160,  162,  166,  166,  177,  164,  168,  168,
+      172,  172,  166,  174,  174,  176,  168,  179,  172,  182,
+      170,  174,  183,  183,  193,  177,  188,  182,  193,  188,
+      183,  190,  190,  191,  191,  179,  192,  192,  194,  195,
+      201,  396,  195,  196,  196,  191,  194,  242,  192,  198,
+      198,  196,  190,  200,  202,  200,  242,  198,  204,  204,
+      211,  211,  202,  209,  209,  221,  204,  221,  211,  201,
+      203,  203,  203,  203,  203,  209,  216,  216,  222,  203,
+      203,  203,  223,  223,  216,  228,  222,  229,  230,  229,
+
+      223,  230,  231,  235,  235,  228,  236,  249,  236,  237,
+      237,  390,  238,  238,  239,  239,  240,  261,  240,  241,
+      241,  231,  237,  243,  243,  241,  261,  236,  238,  239,
+      255,  243,  250,  250,  249,  251,  251,  253,  253,  260,
+      260,  255,  255,  251,  256,  253,  256,  256,  258,  259,
+      258,  262,  259,  267,  267,  262,  269,  270,  270,  267,
+      271,  271,  272,  272,  273,  278,  274,  274,  388,  270,
+      286,  286,  297,  297,  278,  273,  273,  271,  274,  272,
+      269,  279,  279,  280,  280,  286,  294,  279,  297,  294,
+      300,  280,  290,  290,  290,  290,  290,  301,  301,  307,
+
+      311,  290,  290,  290,  302,  300,  303,  308,  302,  302,
+      303,  303,  301,  312,  312,  311,  307,  308,  308,  313,
+      313,  316,  317,  317,  319,  319,  322,  326,  332,  312,
+      317,  326,  319,  323,  323,  322,  327,  327,  333,  335,
+      316,  323,  334,  334,  346,  337,  346,  336,  336,  352,
+      386,  338,  335,  327,  332,  336,  337,  337,  334,  338,
+      339,  339,  345,  353,  355,  333,  345,  345,  339,  347,
+      358,  355,  352,  347,  347,  354,  356,  354,  354,  366,
+      356,  356,  353,  371,  358,  368,  368,  393,  368,  369,
+      369,  380,  380,  380,  383,  385,  371,  385,  393,  393,
+
+      366,  405,  405,  405,  405,  406,  406,  406,  407,  407,
+      407,  407,  408,  408,  408,  408,  409,  382,  409,  409,
+      410,  410,  410,  410,  411,  381,  411,  411,  412,  412,
+      412,  412,  413,  413,  378,  413,  414,  414,  414,  414,
+      415,  376,  415,  415,  416,  416,  416,  416,  417,  417,
+      417,  417,  418,  418,  418,  418,  419,  419,  419,  419,
+      420,  420,  420,  420,  421,  421,  421,  421,  422,  374,
+      422,  422,  423,  423,  423,  423,  424,  424,  424,  424,
+      425,  372,  425,  425,  426,  426,  426,  426,  427,  370,
+      427,  427,  428,  428,  428,  428,  429,  367,  429,  429,
+
+      430,  430,  430,  430,  431,  364,  431,  431,  432,  432,
+      432,  432,  433,  362,  433,  433,  434,  434,  434,  434,
+      435,  361,  435,  435,  436,  436,  436,  436,  437,  360,
+      437,  437,  438,  359,  438,  438,  439,  350,  439,  439,
+      440,  348,  440,  440,  441,  441,  441,  441,  442,  442,
+      442,  442,  443,  330,  443,  443,  444,  444,  444,  444,
+      445,  445,  445,  445,  446,  329,  446,  446,  447,  447,
+      447,  447,  448,  448,  448,  448,  449,  449,  449,  449,
+      450,  450,  450,  450,  451,  451,  451,  451,  452,  452,
+      452,  452,  453,  328,  453,  453,  454,  454,  454,  454,
+
+      455,  455,  455,  455,  456,  324,  456,  456,  457,  457,
+      457,  457,  458,  458,  458,  458,  459,  459,  459,  459,
+      460,  314,  460,  460,  461,  461,  461,  461,  462,  462,
+      462,  462,  463,  309,  463,  463,  464,  464,  464,  464,
+      465,  465,  465,  465,  466,  466,  466,  466,  467,  467,
+      467,  467,  468,  468,  468,  468,  469,  469,  469,  469,
+      470,  470,  470,  470,  471,  471,  471,  471,  472,  472,
+      472,  472,  473,  473,  473,  473,  474,  474,  474,  474,
+      475,  475,  475,  475,  304,  298,  295,  291,  289,  287,
+      276,  268,  265,  263,  257,  248,  234,  232,  180,  118,
+
+      116,   75,   52,   38,   31,   24,   20,    6,    5,    4,
+        3,  404,  404,  404,  404,  404,  404,  404,  404,  404,
+      404,  404,  404,  404,  404,  404,  404,  404,  404,  404,
+      404,  404,  404,  404,  404,  404,  404,  404,  404,  404,
+      404,  404,  404,  404,  404,  404,  404,  404,  404
     } ;
 
 #define YY_TRAILING_MASK 0x2000
@@ -1224,9 +1257,9 @@ static int vdev_and_devtype(DiskParseContext *dpc, char *str) {
 #undef DPC /* needs to be defined differently the actual lexer */
 #define DPC ((DiskParseContext*)yyextra)
 
-#line 1227 "libxlu_disk_l.c"
+#line 1260 "libxlu_disk_l.c"
 
-#line 1229 "libxlu_disk_l.c"
+#line 1262 "libxlu_disk_l.c"
 
 #define INITIAL 0
 #define LEXERR 1
@@ -1508,7 +1541,7 @@ YY_DECL
 #line 188 "libxlu_disk_l.l"
  /*----- the scanner rules which do the parsing -----*/
 
-#line 1511 "libxlu_disk_l.c"
+#line 1544 "libxlu_disk_l.c"
 
 	while ( /*CONSTCOND*/1 )		/* loops until end-of-file is reached */
 		{
@@ -1540,14 +1573,14 @@ yy_match:
 			while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 				{
 				yy_current_state = (int) yy_def[yy_current_state];
-				if ( yy_current_state >= 372 )
+				if ( yy_current_state >= 405 )
 					yy_c = yy_meta[yy_c];
 				}
 			yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
 			*yyg->yy_state_ptr++ = yy_current_state;
 			++yy_cp;
 			}
-		while ( yy_current_state != 371 );
+		while ( yy_current_state != 404 );
 
 yy_find_action:
 		yy_current_state = *--yyg->yy_state_ptr;
@@ -1721,34 +1754,54 @@ YY_RULE_SETUP
 #line 219 "libxlu_disk_l.l"
 { STRIP(','); SAVESTRING("hidden-disk", hidden_disk, FROMEQUALS); }
 	YY_BREAK
-/* the target magic parameter, eats the rest of the string */
 case 23:
 YY_RULE_SETUP
-#line 223 "libxlu_disk_l.l"
+#line 221 "libxlu_disk_l.l"
+{ libxl_defbool_set(&DPC->disk->trusted, true); }
+	YY_BREAK
+case 24:
+YY_RULE_SETUP
+#line 222 "libxlu_disk_l.l"
+{ libxl_defbool_set(&DPC->disk->trusted, false); }
+	YY_BREAK
+case 25:
+YY_RULE_SETUP
+#line 224 "libxlu_disk_l.l"
+{ libxl_defbool_set(&DPC->disk->grant_usage, true); }
+	YY_BREAK
+case 26:
+YY_RULE_SETUP
+#line 225 "libxlu_disk_l.l"
+{ libxl_defbool_set(&DPC->disk->grant_usage, false); }
+	YY_BREAK
+/* the target magic parameter, eats the rest of the string */
+case 27:
+YY_RULE_SETUP
+#line 229 "libxlu_disk_l.l"
 { STRIP(','); SAVESTRING("target", pdev_path, FROMEQUALS); }
 	YY_BREAK
 /* unknown parameters */
-case 24:
-/* rule 24 can match eol */
+case 28:
+/* rule 28 can match eol */
 YY_RULE_SETUP
-#line 227 "libxlu_disk_l.l"
+#line 233 "libxlu_disk_l.l"
 { xlu__disk_err(DPC,yytext,"unknown parameter"); }
 	YY_BREAK
 /* deprecated prefixes */
 /* the "/.*" in these patterns ensures that they count as if they
    * matched the whole string, so these patterns take precedence */
-case 25:
+case 29:
 YY_RULE_SETUP
-#line 234 "libxlu_disk_l.l"
+#line 240 "libxlu_disk_l.l"
 {
                     STRIP(':');
                     DPC->had_depr_prefix=1; DEPRECATE("use `[format=]...,'");
                     setformat(DPC, yytext);
                  }
 	YY_BREAK
-case 26:
+case 30:
 YY_RULE_SETUP
-#line 240 "libxlu_disk_l.l"
+#line 246 "libxlu_disk_l.l"
 {
                     char *newscript;
                     STRIP(':');
@@ -1762,65 +1815,65 @@ YY_RULE_SETUP
                     free(newscript);
                 }
 	YY_BREAK
-case 27:
+case 31:
 *yy_cp = yyg->yy_hold_char; /* undo effects of setting up yytext */
 yyg->yy_c_buf_p = yy_cp = yy_bp + 8;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
-#line 253 "libxlu_disk_l.l"
+#line 259 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
-case 28:
+case 32:
 YY_RULE_SETUP
-#line 254 "libxlu_disk_l.l"
+#line 260 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
-case 29:
+case 33:
 *yy_cp = yyg->yy_hold_char; /* undo effects of setting up yytext */
 yyg->yy_c_buf_p = yy_cp = yy_bp + 4;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
-#line 255 "libxlu_disk_l.l"
+#line 261 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
-case 30:
+case 34:
 *yy_cp = yyg->yy_hold_char; /* undo effects of setting up yytext */
 yyg->yy_c_buf_p = yy_cp = yy_bp + 6;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
-#line 256 "libxlu_disk_l.l"
+#line 262 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
-case 31:
+case 35:
 *yy_cp = yyg->yy_hold_char; /* undo effects of setting up yytext */
 yyg->yy_c_buf_p = yy_cp = yy_bp + 5;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
-#line 257 "libxlu_disk_l.l"
+#line 263 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
-case 32:
+case 36:
 *yy_cp = yyg->yy_hold_char; /* undo effects of setting up yytext */
 yyg->yy_c_buf_p = yy_cp = yy_bp + 4;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
-#line 258 "libxlu_disk_l.l"
+#line 264 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
-case 33:
-/* rule 33 can match eol */
+case 37:
+/* rule 37 can match eol */
 YY_RULE_SETUP
-#line 260 "libxlu_disk_l.l"
+#line 266 "libxlu_disk_l.l"
 {
 		  xlu__disk_err(DPC,yytext,"unknown deprecated disk prefix");
 		  return 0;
 		}
 	YY_BREAK
 /* positional parameters */
-case 34:
-/* rule 34 can match eol */
+case 38:
+/* rule 38 can match eol */
 YY_RULE_SETUP
-#line 267 "libxlu_disk_l.l"
+#line 273 "libxlu_disk_l.l"
 {
     STRIP(',');
 
@@ -1847,27 +1900,27 @@ YY_RULE_SETUP
     }
 }
 	YY_BREAK
-case 35:
+case 39:
 YY_RULE_SETUP
-#line 293 "libxlu_disk_l.l"
+#line 299 "libxlu_disk_l.l"
 {
     BEGIN(LEXERR);
     yymore();
 }
 	YY_BREAK
-case 36:
+case 40:
 YY_RULE_SETUP
-#line 297 "libxlu_disk_l.l"
+#line 303 "libxlu_disk_l.l"
 {
     xlu__disk_err(DPC,yytext,"bad disk syntax"); return 0;
 }
 	YY_BREAK
-case 37:
+case 41:
 YY_RULE_SETUP
-#line 300 "libxlu_disk_l.l"
+#line 306 "libxlu_disk_l.l"
 YY_FATAL_ERROR( "flex scanner jammed" );
 	YY_BREAK
-#line 1870 "libxlu_disk_l.c"
+#line 1923 "libxlu_disk_l.c"
 			case YY_STATE_EOF(INITIAL):
 			case YY_STATE_EOF(LEXERR):
 				yyterminate();
@@ -2135,7 +2188,7 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 		while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 			{
 			yy_current_state = (int) yy_def[yy_current_state];
-			if ( yy_current_state >= 372 )
+			if ( yy_current_state >= 405 )
 				yy_c = yy_meta[yy_c];
 			}
 		yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
@@ -2159,11 +2212,11 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 	while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 		{
 		yy_current_state = (int) yy_def[yy_current_state];
-		if ( yy_current_state >= 372 )
+		if ( yy_current_state >= 405 )
 			yy_c = yy_meta[yy_c];
 		}
 	yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
-	yy_is_jam = (yy_current_state == 371);
+	yy_is_jam = (yy_current_state == 404);
 	if ( ! yy_is_jam )
 		*yyg->yy_state_ptr++ = yy_current_state;
 
@@ -2972,4 +3025,4 @@ void yyfree (void * ptr , yyscan_t yyscanner)
 
 #define YYTABLES_NAME "yytables"
 
-#line 300 "libxlu_disk_l.l"
+#line 306 "libxlu_disk_l.l"
diff --git a/tools/libs/util/libxlu_disk_l.h b/tools/libs/util/libxlu_disk_l.h
index 509aad67dc..c868422568 100644
--- a/tools/libs/util/libxlu_disk_l.h
+++ b/tools/libs/util/libxlu_disk_l.h
@@ -3,9 +3,12 @@
 #define xlu__disk_yyIN_HEADER 1
 
 #line 5 "libxlu_disk_l.h"
+#line 31 "libxlu_disk_l.l"
 #define _GNU_SOURCE
 
-#line 8 "libxlu_disk_l.h"
+
+
+#line 11 "libxlu_disk_l.h"
 
 #define  YY_INT_ALIGNED short int
 
@@ -694,8 +697,8 @@ extern int yylex (yyscan_t yyscanner);
 #undef yyTABLES_NAME
 #endif
 
-#line 300 "libxlu_disk_l.l"
+#line 306 "libxlu_disk_l.l"
 
-#line 699 "libxlu_disk_l.h"
+#line 702 "libxlu_disk_l.h"
 #undef xlu__disk_yyIN_HEADER
 #endif /* xlu__disk_yyHEADER_H */
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


