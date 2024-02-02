Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF758846E48
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 11:51:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674988.1050164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVr7X-0001cY-CT; Fri, 02 Feb 2024 10:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674988.1050164; Fri, 02 Feb 2024 10:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVr7X-0001a1-8U; Fri, 02 Feb 2024 10:50:07 +0000
Received: by outflank-mailman (input) for mailman id 674988;
 Fri, 02 Feb 2024 10:50:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cnb7=JL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rVr7V-0001HW-Ck
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 10:50:05 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2229aa4-c1b8-11ee-8a43-1f161083a0e0;
 Fri, 02 Feb 2024 11:50:03 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50eac018059so2430102e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 Feb 2024 02:50:03 -0800 (PST)
Received: from EPUAKYIW03DD.. ([91.123.150.198])
 by smtp.gmail.com with ESMTPSA id
 k14-20020ac2456e000000b005110e924453sm270644lfm.286.2024.02.02.02.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 02:50:02 -0800 (PST)
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
X-Inumbo-ID: d2229aa4-c1b8-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706871003; x=1707475803; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TfsdWJKAZazVraSPY8diG0NYRmfnCFQmfv0c0xO59nM=;
        b=BZTl2YDiifZjOt8MEPRpy5lufKt3UWc1gKAVkXkLmGDsxDgtr8EOu+cG7yifGqOYat
         PezueYkSzwBHkMhwaHpLHp7Bou/CNPlFgeRryv0P8L3BMpdLgAwhydrYC+WtjikgZp7Y
         3fdv6gCGwfaovlu3nBKcxUYao3uBKogatlBIJ5bwIs0AaIBruAiXwhW7tUwyzJBfEh/B
         Tzfi+T9LdHwCh/uI6ZUmq8nyyL486QNvf+KgcrC1YPRKF8I/6PeiOaB3vGkezufAkhIG
         dYpLgbjZXM38WcF6Y2hyOaJ/TSI2/aAc0aK9A9CFkiiRRax39bB00jhjcKM39ECjH63w
         5kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706871003; x=1707475803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfsdWJKAZazVraSPY8diG0NYRmfnCFQmfv0c0xO59nM=;
        b=KCDuUvK7gplF+MFWQlv8ZqOMf7UA6mfIogb58KN6kzQfi+xdoQfBWQT+h5p+wuLTdT
         insews0J/Y4gG/H4COAKayztrdkhBxogImo8bwPb77sTWjppxDbcf1wQlW/cGJ47EETi
         dReY72zu6OU650K5aKf8KWfW8K3F6yfdkcPqEw2GZlFfXCY4hPUET+ygGZH6MJcFJt50
         PfqXqGYGH+fFA4XSxnetOJ+WDhQ2jTplNNhmInByOZ8iPL1DxSY1q/tuOYBXP6s7Eu6i
         tshsZ5Wr/sRa9CR3YGh9fDkV6RniVmGps47BglnpkdlFkqWfxj82Wu7GHSpuXfs6oNYu
         r2Xg==
X-Gm-Message-State: AOJu0YzO5uzcm3fvo/aDlrpwXUX6NPPQfHeMaQ94pmMcrp0GMGpvkOQa
	rV3YhBYvPORYpHeifvJfWvqWseEcutE9VgRX7DmPiMt23Eyv4hZcGG4hXQOV
X-Google-Smtp-Source: AGHT+IEJsdTpLw5yxxcHCog1lfDFwhuKJVr+GAko6THzmfwj3QKZeiNYAT69tLMVBJrWwAYYNt+m7A==
X-Received: by 2002:ac2:5e62:0:b0:50e:fd98:8ad0 with SMTP id a2-20020ac25e62000000b0050efd988ad0mr951236lfr.63.1706871002711;
        Fri, 02 Feb 2024 02:50:02 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUFb7gY5eK6aA/parcPv1ltuJIMIwI11j4EuHhKmIP3oDlV5gqwO3r1F0mpLzlxy+L7vc8qt+lrIx7X/kQCrbZj3+7eJwlQp3qoPSREeBZIsFJRQxKx2D0SJL6RNzxhc37jhZAl+bieaUVpe8cu7s0ZpTmKN0Pp4keCqin1qKypc1LyxG2h9YxvKQAtHtMnn36+DICRXnoKbcXP049mB5RkJlb3toUb9Ay/yTWatlY=
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] libxl: Add "grant_usage" parameter for virtio disk devices
Date: Fri,  2 Feb 2024 12:49:03 +0200
Message-Id: <20240202104903.1112772-1-olekstysh@gmail.com>
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
---
 docs/man/xl-disk-configuration.5.pod.in | 25 +++++++++++++++++++++++++
 tools/golang/xenlight/helpers.gen.go    |  6 ++++++
 tools/golang/xenlight/types.gen.go      |  1 +
 tools/include/libxl.h                   |  7 +++++++
 tools/libs/light/libxl_arm.c            |  4 ++--
 tools/libs/light/libxl_disk.c           | 13 +++++++++++++
 tools/libs/light/libxl_types.idl        |  1 +
 tools/libs/util/libxlu_disk_l.l         |  3 +++
 8 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-configuration.5.pod.in
index bc945cc517..3c035456d5 100644
--- a/docs/man/xl-disk-configuration.5.pod.in
+++ b/docs/man/xl-disk-configuration.5.pod.in
@@ -404,6 +404,31 @@ Virtio frontend driver (virtio-blk) to be used. Please note, the virtual
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
+If this option is B<true>, the Xen grants are always enabled.
+If this option is B<false>, the Xen grants are always disabled.
+
+=item Mandatory
+
+No
+
+=item Default value
+
+If this option is missing, then the default grant setting will be used,
+i.e. enable grants if backend-domid != 0.
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
index ea3623dd6f..f39f427091 100644
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
@@ -623,6 +628,14 @@ static int libxl__disk_from_xenstore(libxl__gc *gc, const char *libxl_path,
             goto cleanup;
         }
         disk->irq = strtoul(tmp, NULL, 10);
+
+        tmp = libxl__xs_read(gc, XBT_NULL,
+                             GCSPRINTF("%s/grant_usage", libxl_path));
+        if (!tmp) {
+            LOG(ERROR, "Missing xenstore node %s/grant_usage", libxl_path);
+            goto cleanup;
+        }
+        libxl_defbool_set(&disk->grant_usage, strtoul(tmp, NULL, 0));
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


