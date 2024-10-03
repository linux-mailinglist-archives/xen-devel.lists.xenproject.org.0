Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8096398EF12
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 14:19:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809338.1221697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKnz-0007Kq-Os; Thu, 03 Oct 2024 12:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809338.1221697; Thu, 03 Oct 2024 12:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKny-000775-Ti; Thu, 03 Oct 2024 12:19:38 +0000
Received: by outflank-mailman (input) for mailman id 809338;
 Thu, 03 Oct 2024 12:19:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swKnv-00043W-OI
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 12:19:35 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c03a5288-8181-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 14:19:34 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d51a7d6f5so129144266b.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 05:19:34 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a991047319asm77328366b.184.2024.10.03.05.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 05:19:33 -0700 (PDT)
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
X-Inumbo-ID: c03a5288-8181-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727957974; x=1728562774; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zpj+H43/zUHJOCA2rQ61rrJy8km2CNAr8k6Cjf/e1HY=;
        b=BEG8uQTP/MzFzJspe04WJH3MCcEPIitC10kDAR+tFDe1Xuwhhz8xjWZxBDqHwY1Xfg
         JBCNkNAsRhnS8JXqZ9E9wHsetLu57wE8zaptEn361ONZGS+Kbnp+YK8cAeoVYcFiLypQ
         Lq/Ga3h40rm4VVaXMAoYrKacrUuEbJ3LIj/XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727957974; x=1728562774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zpj+H43/zUHJOCA2rQ61rrJy8km2CNAr8k6Cjf/e1HY=;
        b=uzhPSlf0mu2sumwDkpnAdXMr0svRsUY41sM694AuX3r125gQekPzXnJ2h3A1+i1n8P
         dTKQEc+cnlwgTGt6ihkZmmcn2H5NOpVEC62Qjgn+/R3kKOE9HQZxmdWuoEVqKS/ceFe6
         vELC89HOyCt9UYV0VajvSjUOYZs7mwdCOKY3YADCMfp+PRweWtnflu7p+kmgHPmi7MET
         8t7Rm5F8QctAesSWKlD42OXEZoeT/CbI671cq5UjGxUkOGmxdzTFeLLGivDDGMYDw7h7
         eU5qGoAn8/B0BRssZwEM+Vjm4FyBfW6OKJjImec97xKh+2JeyTBIcV2PV5rGEPHEMXk2
         0xjg==
X-Gm-Message-State: AOJu0YxaGt4IvhgP/E3/p3TVeSDWNCFFoAqJDkleavvBejNPZ8LNGPay
	xChs2tdc+CcxZ4QRtodlrZBK2EOCRiizU2aKLSuK262PwfUTipXRneTHzsx/EoKUJRJuwmQYn76
	6
X-Google-Smtp-Source: AGHT+IGA0CP3Ai8jKkp0TGden7YWJIRnZvGayzfb/xHbDfIpZF/Drffv2BsOoPac8DPd4Rl10n/ItQ==
X-Received: by 2002:a17:907:a4b:b0:a90:349e:2465 with SMTP id a640c23a62f3a-a98f83a119amr560980166b.65.1727957973794;
        Thu, 03 Oct 2024 05:19:33 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 15/20] xen: Update header guards - Public I/O
Date: Thu,  3 Oct 2024 13:19:03 +0100
Message-Id: <20241003121908.362888-16-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003121908.362888-1-frediano.ziglio@cloud.com>
References: <20241003121908.362888-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to public I/O interfaces.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/include/public/io/9pfs.h      | 4 ++--
 xen/include/public/io/blkif.h     | 6 +++---
 xen/include/public/io/cameraif.h  | 6 +++---
 xen/include/public/io/console.h   | 6 +++---
 xen/include/public/io/displif.h   | 6 +++---
 xen/include/public/io/fbif.h      | 4 ++--
 xen/include/public/io/fsif.h      | 4 ++--
 xen/include/public/io/kbdif.h     | 6 +++---
 xen/include/public/io/netif.h     | 4 ++--
 xen/include/public/io/pciif.h     | 6 +++---
 xen/include/public/io/protocols.h | 4 ++--
 xen/include/public/io/pvcalls.h   | 4 ++--
 xen/include/public/io/ring.h      | 6 +++---
 xen/include/public/io/sndif.h     | 6 +++---
 xen/include/public/io/tpmif.h     | 4 ++--
 xen/include/public/io/usbif.h     | 6 +++---
 xen/include/public/io/vscsiif.h   | 6 +++---
 xen/include/public/io/xenbus.h    | 6 +++---
 xen/include/public/io/xs_wire.h   | 6 +++---
 19 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/xen/include/public/io/9pfs.h b/xen/include/public/io/9pfs.h
index ac4bf0434b..46b84cf903 100644
--- a/xen/include/public/io/9pfs.h
+++ b/xen/include/public/io/9pfs.h
@@ -7,8 +7,8 @@
  * Copyright (C) 2017 Stefano Stabellini <stefano@aporeto.com>
  */
 
-#ifndef __XEN_PUBLIC_IO_9PFS_H__
-#define __XEN_PUBLIC_IO_9PFS_H__
+#ifndef PUBLIC__IO__9PFS_H
+#define PUBLIC__IO__9PFS_H
 
 #include "../grant_table.h"
 #include "ring.h"
diff --git a/xen/include/public/io/blkif.h b/xen/include/public/io/blkif.h
index 8407453324..bbc5e1d395 100644
--- a/xen/include/public/io/blkif.h
+++ b/xen/include/public/io/blkif.h
@@ -8,8 +8,8 @@
  * Copyright (c) 2012, Spectra Logic Corporation
  */
 
-#ifndef __XEN_PUBLIC_IO_BLKIF_H__
-#define __XEN_PUBLIC_IO_BLKIF_H__
+#ifndef PUBLIC__IO__BLKIF_H
+#define PUBLIC__IO__BLKIF_H
 
 #include "ring.h"
 #include "../grant_table.h"
@@ -726,7 +726,7 @@ DEFINE_RING_TYPES(blkif, struct blkif_request, struct blkif_response);
 #define VDISK_REMOVABLE    0x2
 #define VDISK_READONLY     0x4
 
-#endif /* __XEN_PUBLIC_IO_BLKIF_H__ */
+#endif /* PUBLIC__IO__BLKIF_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/io/cameraif.h b/xen/include/public/io/cameraif.h
index a389443769..56c2dd7e5b 100644
--- a/xen/include/public/io/cameraif.h
+++ b/xen/include/public/io/cameraif.h
@@ -9,8 +9,8 @@
  * Author: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
  */
 
-#ifndef __XEN_PUBLIC_IO_CAMERAIF_H__
-#define __XEN_PUBLIC_IO_CAMERAIF_H__
+#ifndef PUBLIC__IO__CAMERAIF_H
+#define PUBLIC__IO__CAMERAIF_H
 
 #include "ring.h"
 #include "../grant_table.h"
@@ -1344,7 +1344,7 @@ struct xencamera_event_page {
 #define XENCAMERA_IN_RING_REF(page, idx) \
     (XENCAMERA_IN_RING((page))[(idx) % XENCAMERA_IN_RING_LEN])
 
-#endif /* __XEN_PUBLIC_IO_CAMERAIF_H__ */
+#endif /* PUBLIC__IO__CAMERAIF_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/io/console.h b/xen/include/public/io/console.h
index 4509b4b689..2d98564504 100644
--- a/xen/include/public/io/console.h
+++ b/xen/include/public/io/console.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2005, Keir Fraser
  */
 
-#ifndef __XEN_PUBLIC_IO_CONSOLE_H__
-#define __XEN_PUBLIC_IO_CONSOLE_H__
+#ifndef PUBLIC__IO__CONSOLE_H
+#define PUBLIC__IO__CONSOLE_H
 
 typedef uint32_t XENCONS_RING_IDX;
 
@@ -26,7 +26,7 @@ struct xencons_interface {
 DEFINE_XEN_FLEX_RING(xencons);
 #endif
 
-#endif /* __XEN_PUBLIC_IO_CONSOLE_H__ */
+#endif /* PUBLIC__IO__CONSOLE_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/io/displif.h b/xen/include/public/io/displif.h
index 132c96fa5c..68aa91f5b9 100644
--- a/xen/include/public/io/displif.h
+++ b/xen/include/public/io/displif.h
@@ -10,8 +10,8 @@
  *          Oleksandr Grytsov <oleksandr_grytsov@epam.com>
  */
 
-#ifndef __XEN_PUBLIC_IO_DISPLIF_H__
-#define __XEN_PUBLIC_IO_DISPLIF_H__
+#ifndef PUBLIC__IO__DISPLIF_H
+#define PUBLIC__IO__DISPLIF_H
 
 #include "ring.h"
 #include "../grant_table.h"
@@ -927,7 +927,7 @@ struct xendispl_event_page {
 #define XENDISPL_IN_RING_REF(page, idx) \
 	(XENDISPL_IN_RING((page))[(idx) % XENDISPL_IN_RING_LEN])
 
-#endif /* __XEN_PUBLIC_IO_DISPLIF_H__ */
+#endif /* PUBLIC__IO__DISPLIF_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/io/fbif.h b/xen/include/public/io/fbif.h
index 93c73195d8..6e6b2077ae 100644
--- a/xen/include/public/io/fbif.h
+++ b/xen/include/public/io/fbif.h
@@ -6,8 +6,8 @@
  * Copyright (C) 2006 Red Hat, Inc., Markus Armbruster <armbru@redhat.com>
  */
 
-#ifndef __XEN_PUBLIC_IO_FBIF_H__
-#define __XEN_PUBLIC_IO_FBIF_H__
+#ifndef PUBLIC__IO__FBIF_H
+#define PUBLIC__IO__FBIF_H
 
 /* Out events (frontend -> backend) */
 
diff --git a/xen/include/public/io/fsif.h b/xen/include/public/io/fsif.h
index dcade1c698..b0a30a32e6 100644
--- a/xen/include/public/io/fsif.h
+++ b/xen/include/public/io/fsif.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2007, Grzegorz Milos, <gm281@cam.ac.uk>.
  */
 
-#ifndef __XEN_PUBLIC_IO_FSIF_H__
-#define __XEN_PUBLIC_IO_FSIF_H__
+#ifndef PUBLIC__IO__FSIF_H
+#define PUBLIC__IO__FSIF_H
 
 #include "ring.h"
 #include "../grant_table.h"
diff --git a/xen/include/public/io/kbdif.h b/xen/include/public/io/kbdif.h
index 4bde6b3821..d2e316cb70 100644
--- a/xen/include/public/io/kbdif.h
+++ b/xen/include/public/io/kbdif.h
@@ -6,8 +6,8 @@
  * Copyright (C) 2006 Red Hat, Inc., Markus Armbruster <armbru@redhat.com>
  */
 
-#ifndef __XEN_PUBLIC_IO_KBDIF_H__
-#define __XEN_PUBLIC_IO_KBDIF_H__
+#ifndef PUBLIC__IO__KBDIF_H
+#define PUBLIC__IO__KBDIF_H
 
 /*
  *****************************************************************************
@@ -546,7 +546,7 @@ struct xenkbd_page
     uint32_t out_cons, out_prod;
 };
 
-#endif /* __XEN_PUBLIC_IO_KBDIF_H__ */
+#endif /* PUBLIC__IO__KBDIF_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/io/netif.h b/xen/include/public/io/netif.h
index c13b85061d..871dd51a32 100644
--- a/xen/include/public/io/netif.h
+++ b/xen/include/public/io/netif.h
@@ -7,8 +7,8 @@
  * Copyright (c) 2003-2004, Keir Fraser
  */
 
-#ifndef __XEN_PUBLIC_IO_NETIF_H__
-#define __XEN_PUBLIC_IO_NETIF_H__
+#ifndef PUBLIC__IO__NETIF_H
+#define PUBLIC__IO__NETIF_H
 
 #include "ring.h"
 #include "../grant_table.h"
diff --git a/xen/include/public/io/pciif.h b/xen/include/public/io/pciif.h
index dbe825ecc3..282c9a6b37 100644
--- a/xen/include/public/io/pciif.h
+++ b/xen/include/public/io/pciif.h
@@ -4,8 +4,8 @@
  *
  *   Author: Ryan Wilson <hap9@epoch.ncsc.mil>
  */
-#ifndef __XEN_PCI_COMMON_H__
-#define __XEN_PCI_COMMON_H__
+#ifndef PUBLIC__IO__PCIIF_H
+#define PUBLIC__IO__PCIIF_H
 
 /* Be sure to bump this number if you change this file */
 #define XEN_PCI_MAGIC "7"
@@ -95,7 +95,7 @@ struct xen_pci_sharedinfo {
     struct xen_pcie_aer_op aer_op;
 };
 
-#endif /* __XEN_PCI_COMMON_H__ */
+#endif /* PUBLIC__IO__PCIIF_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/io/protocols.h b/xen/include/public/io/protocols.h
index 7815e1ff0f..11537f2a21 100644
--- a/xen/include/public/io/protocols.h
+++ b/xen/include/public/io/protocols.h
@@ -5,8 +5,8 @@
  * Copyright (c) 2008, Keir Fraser
  */
 
-#ifndef __XEN_PROTOCOLS_H__
-#define __XEN_PROTOCOLS_H__
+#ifndef PUBLIC__IO__PROTOCOLS_H
+#define PUBLIC__IO__PROTOCOLS_H
 
 #define XEN_IO_PROTO_ABI_X86_32     "x86_32-abi"
 #define XEN_IO_PROTO_ABI_X86_64     "x86_64-abi"
diff --git a/xen/include/public/io/pvcalls.h b/xen/include/public/io/pvcalls.h
index c8c7602470..33e448363a 100644
--- a/xen/include/public/io/pvcalls.h
+++ b/xen/include/public/io/pvcalls.h
@@ -10,8 +10,8 @@
  * Copyright (C) 2017 Stefano Stabellini <stefano@aporeto.com>
  */
 
-#ifndef __XEN_PUBLIC_IO_PVCALLS_H__
-#define __XEN_PUBLIC_IO_PVCALLS_H__
+#ifndef PUBLIC__IO__PVCALLS_H
+#define PUBLIC__IO__PVCALLS_H
 
 #include "../grant_table.h"
 #include "ring.h"
diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
index a79d913142..a9bf13339b 100644
--- a/xen/include/public/io/ring.h
+++ b/xen/include/public/io/ring.h
@@ -7,8 +7,8 @@
  * Tim Deegan and Andrew Warfield November 2004.
  */
 
-#ifndef __XEN_PUBLIC_IO_RING_H__
-#define __XEN_PUBLIC_IO_RING_H__
+#ifndef PUBLIC__IO__RING_H
+#define PUBLIC__IO__RING_H
 
 /*
  * When #include'ing this header, you need to provide the following
@@ -491,7 +491,7 @@ struct name##_data_intf {                                                     \
 };                                                                            \
 DEFINE_XEN_FLEX_RING(name)
 
-#endif /* __XEN_PUBLIC_IO_RING_H__ */
+#endif /* PUBLIC__IO__RING_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/io/sndif.h b/xen/include/public/io/sndif.h
index cce1459b7b..c713d428f4 100644
--- a/xen/include/public/io/sndif.h
+++ b/xen/include/public/io/sndif.h
@@ -13,8 +13,8 @@
  *          Iurii Konovalenko <iurii.konovalenko@globallogic.com>
  */
 
-#ifndef __XEN_PUBLIC_IO_SNDIF_H__
-#define __XEN_PUBLIC_IO_SNDIF_H__
+#ifndef PUBLIC__IO__SNDIF_H
+#define PUBLIC__IO__SNDIF_H
 
 #include "ring.h"
 #include "../grant_table.h"
@@ -1061,7 +1061,7 @@ struct xensnd_event_page {
 #define XENSND_IN_RING_REF(page, idx) \
     (XENSND_IN_RING((page))[(idx) % XENSND_IN_RING_LEN])
 
-#endif /* __XEN_PUBLIC_IO_SNDIF_H__ */
+#endif /* PUBLIC__IO__SNDIF_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/io/tpmif.h b/xen/include/public/io/tpmif.h
index ad02dbaf1a..8347c739c8 100644
--- a/xen/include/public/io/tpmif.h
+++ b/xen/include/public/io/tpmif.h
@@ -14,8 +14,8 @@
  * Copyright (c) 2003-2004, Keir Fraser
  */
 
-#ifndef __XEN_PUBLIC_IO_TPMIF_H__
-#define __XEN_PUBLIC_IO_TPMIF_H__
+#ifndef PUBLIC__IO__TPMIF_H
+#define PUBLIC__IO__TPMIF_H
 
 #include "../grant_table.h"
 
diff --git a/xen/include/public/io/usbif.h b/xen/include/public/io/usbif.h
index 875af0dc7c..f8ef179173 100644
--- a/xen/include/public/io/usbif.h
+++ b/xen/include/public/io/usbif.h
@@ -8,8 +8,8 @@
  * Author: Noboru Iwamatsu <n_iwamatsu@jp.fujitsu.com>
  */
 
-#ifndef __XEN_PUBLIC_IO_USBIF_H__
-#define __XEN_PUBLIC_IO_USBIF_H__
+#ifndef PUBLIC__IO__USBIF_H
+#define PUBLIC__IO__USBIF_H
 
 #include "ring.h"
 #include "../grant_table.h"
@@ -405,4 +405,4 @@ typedef struct usbif_conn_response usbif_conn_response_t;
 DEFINE_RING_TYPES(usbif_conn, struct usbif_conn_request, struct usbif_conn_response);
 #define USB_CONN_RING_SIZE __CONST_RING_SIZE(usbif_conn, USBIF_RING_SIZE)
 
-#endif /* __XEN_PUBLIC_IO_USBIF_H__ */
+#endif /* PUBLIC__IO__USBIF_H */
diff --git a/xen/include/public/io/vscsiif.h b/xen/include/public/io/vscsiif.h
index f5fc7de725..5d6b4f1c38 100644
--- a/xen/include/public/io/vscsiif.h
+++ b/xen/include/public/io/vscsiif.h
@@ -7,8 +7,8 @@
  * Copyright(c) FUJITSU Limited 2008.
  */
 
-#ifndef __XEN__PUBLIC_IO_SCSI_H__
-#define __XEN__PUBLIC_IO_SCSI_H__
+#ifndef PUBLIC__IO__VSCSIIF_H
+#define PUBLIC__IO__VSCSIIF_H
 
 #include "ring.h"
 #include "../grant_table.h"
@@ -352,7 +352,7 @@ typedef struct vscsiif_response vscsiif_response_t;
 DEFINE_RING_TYPES(vscsiif, struct vscsiif_request, struct vscsiif_response);
 
 
-#endif  /*__XEN__PUBLIC_IO_SCSI_H__*/
+#endif  /*PUBLIC__IO__VSCSIIF_H*/
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/io/xenbus.h b/xen/include/public/io/xenbus.h
index 9cd0cd7c67..40d645ac98 100644
--- a/xen/include/public/io/xenbus.h
+++ b/xen/include/public/io/xenbus.h
@@ -7,8 +7,8 @@
  * Copyright (C) 2005 XenSource Ltd.
  */
 
-#ifndef _XEN_PUBLIC_IO_XENBUS_H
-#define _XEN_PUBLIC_IO_XENBUS_H
+#ifndef PUBLIC__IO__XENBUS_H
+#define PUBLIC__IO__XENBUS_H
 
 /*
  * The state of either end of the Xenbus, i.e. the current communication
@@ -50,7 +50,7 @@ enum xenbus_state {
 };
 typedef enum xenbus_state XenbusState;
 
-#endif /* _XEN_PUBLIC_IO_XENBUS_H */
+#endif /* PUBLIC__IO__XENBUS_H */
 
 /*
  * Local variables:
diff --git a/xen/include/public/io/xs_wire.h b/xen/include/public/io/xs_wire.h
index 04e6849feb..c5ed783e7c 100644
--- a/xen/include/public/io/xs_wire.h
+++ b/xen/include/public/io/xs_wire.h
@@ -6,8 +6,8 @@
  * Copyright (C) 2005 Rusty Russell IBM Corporation
  */
 
-#ifndef _XS_WIRE_H
-#define _XS_WIRE_H
+#ifndef PUBLIC__IO__XS_WIRE_H
+#define PUBLIC__IO__XS_WIRE_H
 
 enum xsd_sockmsg_type
 {
@@ -134,7 +134,7 @@ struct xenstore_domain_interface {
 #define XENSTORE_ERROR_RINGIDX 2 /* Invalid ring index */
 #define XENSTORE_ERROR_PROTO   3 /* Protocol violation (payload too long) */
 
-#endif /* _XS_WIRE_H */
+#endif /* PUBLIC__IO__XS_WIRE_H */
 
 /*
  * Local variables:
-- 
2.34.1


