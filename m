Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260193330B2
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 22:15:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95781.180791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJjh0-0008Ss-Qr; Tue, 09 Mar 2021 21:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95781.180791; Tue, 09 Mar 2021 21:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJjh0-0008ST-NS; Tue, 09 Mar 2021 21:15:02 +0000
Received: by outflank-mailman (input) for mailman id 95781;
 Tue, 09 Mar 2021 21:15:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71v0=IH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1lJjgz-0008SO-9v
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 21:15:01 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c25db99f-4637-43e6-a37a-2987387ed734;
 Tue, 09 Mar 2021 21:15:00 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 129LEhSM059926
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 9 Mar 2021 16:14:48 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 129LEgZp059925;
 Tue, 9 Mar 2021 13:14:42 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: c25db99f-4637-43e6-a37a-2987387ed734
Message-Id: <202103092114.129LEgZp059925@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>
Cc: Juergen Gross <jgross@suse.com>
Date: Mon, 8 Mar 2021 05:36:18 -0800
Subject: [PATCH] arm: replace typeof() with __typeof__()
X-Spam-Status: No, score=0.9 required=10.0 tests=DATE_IN_PAST_24_48,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

typeof() is available in Xen's build environment, which uses Xen's
compiler.  As these headers are public, they need strict standards
conformance.  Only __typeof__() is officially standardized.

A compiler in standards conformance mode should report:

warning: implicit declaration of function 'typeof' is invalid in C99
[-Wimplicit-function-declaration]

(this has been observed with FreeBSD's kernel build environment)

Based-on-patch-by: Julien Grall <julien@xen.org>, Sun Oct 4 20:33:04 2015 +0100
Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 xen/include/public/arch-arm.h | 2 +-
 xen/include/public/hvm/save.h | 4 ++--
 xen/include/public/io/ring.h  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index c365b1b39e..713fd65317 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -191,7 +191,7 @@
 #define XEN_GUEST_HANDLE_PARAM(name)    __guest_handle_ ## name
 #define set_xen_guest_handle_raw(hnd, val)                  \
     do {                                                    \
-        typeof(&(hnd)) _sxghr_tmp = &(hnd);                 \
+        __typeof__(&(hnd)) _sxghr_tmp = &(hnd);             \
         _sxghr_tmp->q = 0;                                  \
         _sxghr_tmp->p = val;                                \
     } while ( 0 )
diff --git a/xen/include/public/hvm/save.h b/xen/include/public/hvm/save.h
index f72e3a9bc4..bea5e9f50f 100644
--- a/xen/include/public/hvm/save.h
+++ b/xen/include/public/hvm/save.h
@@ -82,12 +82,12 @@ struct hvm_save_descriptor {
     struct __HVM_SAVE_TYPE_##_x { _type t; char c[_code]; char cpt[1];}
 #endif
 
-#define HVM_SAVE_TYPE(_x) typeof (((struct __HVM_SAVE_TYPE_##_x *)(0))->t)
+#define HVM_SAVE_TYPE(_x) __typeof__ (((struct __HVM_SAVE_TYPE_##_x *)(0))->t)
 #define HVM_SAVE_LENGTH(_x) (sizeof (HVM_SAVE_TYPE(_x)))
 #define HVM_SAVE_CODE(_x) (sizeof (((struct __HVM_SAVE_TYPE_##_x *)(0))->c))
 
 #ifdef __XEN__
-# define HVM_SAVE_TYPE_COMPAT(_x) typeof (((struct __HVM_SAVE_TYPE_COMPAT_##_x *)(0))->t)
+# define HVM_SAVE_TYPE_COMPAT(_x) __typeof__ (((struct __HVM_SAVE_TYPE_COMPAT_##_x *)(0))->t)
 # define HVM_SAVE_LENGTH_COMPAT(_x) (sizeof (HVM_SAVE_TYPE_COMPAT(_x)))
 
 # define HVM_SAVE_HAS_COMPAT(_x) (sizeof (((struct __HVM_SAVE_TYPE_##_x *)(0))->cpt)-1)
diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
index d68615ae2f..6a94a9fe4b 100644
--- a/xen/include/public/io/ring.h
+++ b/xen/include/public/io/ring.h
@@ -242,7 +242,7 @@ typedef struct __name##_back_ring __name##_back_ring_t
  */
 #define RING_COPY_REQUEST(_r, _idx, _req) do {				\
 	/* Use volatile to force the copy into _req. */			\
-	*(_req) = *(volatile typeof(_req))RING_GET_REQUEST(_r, _idx);	\
+	*(_req) = *(volatile __typeof__(_req))RING_GET_REQUEST(_r, _idx);	\
 } while (0)
 
 #define RING_GET_RESPONSE(_r, _idx)                                     \
-- 
2.20.1


