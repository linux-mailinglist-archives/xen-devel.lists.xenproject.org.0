Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD611AF977
	for <lists+xen-devel@lfdr.de>; Sun, 19 Apr 2020 12:50:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQ7WQ-00066z-Iw; Sun, 19 Apr 2020 10:49:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+3Jy=6D=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jQ7WP-00066u-B6
 for xen-devel@lists.xenproject.org; Sun, 19 Apr 2020 10:49:57 +0000
X-Inumbo-ID: 81d4dc88-822b-11ea-8f6c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81d4dc88-822b-11ea-8f6c-12813bfff9fa;
 Sun, 19 Apr 2020 10:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pyaiyR6L4SEuSUNV7H6kqDTjrLyJNv4ZxXTLj1xNjpU=; b=2QabZeEm/464+rrcVqpRbWq6H6
 WP3VEudpYNLbuKlMtjP3JI5ZslAwqOGHUO6kyp1BmvmlDpfWtS3LgvaZebfj8UO6b7dy7dIdNR4GK
 Rqo7vN2IIaXn+aVgnF60TSfbYIrcehp+yM3E9C8muWCBr40tQpm9RvIdFakuBMm+GBj8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQ7WN-0008Nz-LR; Sun, 19 Apr 2020 10:49:55 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQ7WN-0003bY-8v; Sun, 19 Apr 2020 10:49:55 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] pvcalls: Document explicitly the padding for all arches
Date: Sun, 19 Apr 2020 11:49:48 +0100
Message-Id: <20200419104948.31200-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

The documentation of pvcalls only describes the padding for i386. This
is a bit odd as there are some implicit padding for 64-bit (e.g in
xen_pvcalls_release) and this doesn't cater other 32-bit arch.

Remove the #ifdef in the documentation to show the padding is present on
all arches and take the opportunity to describe the padding in the
public header as well.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

AFAICT, we cannot mandate the padding to be 0 as they are already
present.
---
 docs/misc/pvcalls.pandoc        | 8 --------
 xen/include/public/io/pvcalls.h | 4 ++++
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/docs/misc/pvcalls.pandoc b/docs/misc/pvcalls.pandoc
index 665dad556c..971cd8f4b1 100644
--- a/docs/misc/pvcalls.pandoc
+++ b/docs/misc/pvcalls.pandoc
@@ -246,9 +246,7 @@ The format is defined as follows:
     			uint32_t domain;
     			uint32_t type;
     			uint32_t protocol;
-    			#ifdef CONFIG_X86_32
     			uint8_t pad[4];
-    			#endif
     		} socket;
     		struct xen_pvcalls_connect {
     			uint64_t id;
@@ -257,16 +255,12 @@ The format is defined as follows:
     			uint32_t flags;
     			grant_ref_t ref;
     			uint32_t evtchn;
-    			#ifdef CONFIG_X86_32
     			uint8_t pad[4];
-    			#endif
     		} connect;
     		struct xen_pvcalls_release {
     			uint64_t id;
     			uint8_t reuse;
-    			#ifdef CONFIG_X86_32
     			uint8_t pad[7];
-    			#endif
     		} release;
     		struct xen_pvcalls_bind {
     			uint64_t id;
@@ -276,9 +270,7 @@ The format is defined as follows:
     		struct xen_pvcalls_listen {
     			uint64_t id;
     			uint32_t backlog;
-    			#ifdef CONFIG_X86_32
     			uint8_t pad[4];
-    			#endif
     		} listen;
     		struct xen_pvcalls_accept {
     			uint64_t id;
diff --git a/xen/include/public/io/pvcalls.h b/xen/include/public/io/pvcalls.h
index cb8171275c..f6048ddc63 100644
--- a/xen/include/public/io/pvcalls.h
+++ b/xen/include/public/io/pvcalls.h
@@ -65,6 +65,7 @@ struct xen_pvcalls_request {
             uint32_t domain;
             uint32_t type;
             uint32_t protocol;
+            uint8_t pad[4];
         } socket;
         struct xen_pvcalls_connect {
             uint64_t id;
@@ -73,10 +74,12 @@ struct xen_pvcalls_request {
             uint32_t flags;
             grant_ref_t ref;
             uint32_t evtchn;
+            uint8_t pad[4];
         } connect;
         struct xen_pvcalls_release {
             uint64_t id;
             uint8_t reuse;
+            uint8_t pad[7];
         } release;
         struct xen_pvcalls_bind {
             uint64_t id;
@@ -86,6 +89,7 @@ struct xen_pvcalls_request {
         struct xen_pvcalls_listen {
             uint64_t id;
             uint32_t backlog;
+            uint8_t pad[4];
         } listen;
         struct xen_pvcalls_accept {
             uint64_t id;
-- 
2.17.1


