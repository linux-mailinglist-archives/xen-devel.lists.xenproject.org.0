Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C953290F40C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 18:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743931.1150936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJyDB-0007Kt-9V; Wed, 19 Jun 2024 16:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743931.1150936; Wed, 19 Jun 2024 16:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJyDB-0007J2-5z; Wed, 19 Jun 2024 16:31:05 +0000
Received: by outflank-mailman (input) for mailman id 743931;
 Wed, 19 Jun 2024 16:31:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXUT=NV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJyD9-0007IR-Uk
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 16:31:03 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51b6ff07-2e59-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 18:31:03 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57d1782679fso786922a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 09:31:03 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72cdfc4sm8468996a12.19.2024.06.19.09.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 09:31:01 -0700 (PDT)
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
X-Inumbo-ID: 51b6ff07-2e59-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718814662; x=1719419462; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNRqIMjqDxOHB6YZkGrW+54h7mw46IrFeNy59xj3dpo=;
        b=M7hKZOBO7JcfPJIh6JIVbbNZT/XHlGxZGqEhjsY5Y05NfiN/bP0su80St5wX0ZgSGJ
         +UEFuh0vKLs3KC+jzMKxiQsrQY4q/1Dk9k1JoEM64LGxB9Stg2BmLp9an9834WDesQu5
         mXncwU7Lv05qo/RzaL4v6qrk3ra1b8ec5CSYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718814662; x=1719419462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNRqIMjqDxOHB6YZkGrW+54h7mw46IrFeNy59xj3dpo=;
        b=rYCWVAOVSgoEciYXX5g1H8ce4YdXO+Jl02V+x/khjb/sUAQpRDkkyiypXQP3scWUs3
         N8GNLUR6qBQWDlakp9i+e3uIaa3aPfaHeMnfJFdXzJ5vBk93LH3ypqvAddn/ygo2k4mb
         +iJgrRCvqyD5WvYvP0NtUQYI95dfD6jGMKPqaTTUGElh3cbkCyUlHc4CFMA6isNaV2e2
         V7dPRr1rMbXF4BWMfUVj4PRgkPBTZrr+0Bh44TxmUdEr0vqXCVMJPpWXhXOIkqtXlhAg
         v9g8VaDErx2+O3YF4K7qq7GZQ27izZS1V/UMz4jSbo12Sc8tX8+C7f8+Cx5PAX1S91iI
         OyLQ==
X-Gm-Message-State: AOJu0YyDxy3FqXIlbUGZ35KjiwgCR1mPS9BlMy7O3afIEaJGLnoDRV/u
	R5xXfIPf1HHn2RSf51qU1gXLKifIE9Ngv3rhY+PDr7htHnkbPzKvhjCuR2siqeRSZYLZ0FzmQI4
	I+TM=
X-Google-Smtp-Source: AGHT+IEgA4/HyMhc+2wKZZn6cXI1BIGalLsPk0Gby+OcIz04oDGrUjOq1SQIC2Hlmrzn0Usi6pTxeg==
X-Received: by 2002:a50:d50a:0:b0:57c:628d:f0eb with SMTP id 4fb4d7f45d1cf-57d07e6f85emr1809324a12.24.1718814661884;
        Wed, 19 Jun 2024 09:31:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] xen/guest_access: Fix accessors for 32bit builds of Xen
Date: Wed, 19 Jun 2024 17:31:00 +0100
Message-Id: <20240619163100.2556555-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Gitlab CI reports an ARM32 randconfig failure as follows:

  In file included from common/livepatch.c:9:
  common/livepatch.c: In function ‘livepatch_list’:
  ./include/xen/guest_access.h:130:25: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
    130 |     __raw_copy_to_guest((void *)(d_ + (off) * sizeof(*_s)), \
        |                         ^
  common/livepatch.c:1283:18: note: in expansion of macro ‘__copy_to_guest_offset’
   1283 |             if ( __copy_to_guest_offset(list->name, name_offset,
        |                  ^~~~~~~~~~~~~~~~~~~~~~
  ./include/xen/guest_access.h:130:25: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
    130 |     __raw_copy_to_guest((void *)(d_ + (off) * sizeof(*_s)), \
        |                         ^
  common/livepatch.c:1287:17: note: in expansion of macro ‘__copy_to_guest_offset’
   1287 |                 __copy_to_guest_offset(list->metadata, metadata_offset,
        |                 ^~~~~~~~~~~~~~~~~~~~~~

This isn't specific to ARM32; it's LIVEPATCH on any 32bit build of Xen.

Both name_offset and metadata_offset are uint64_t, meaning that the
expression:

  (d_ + (off) * sizeof(*(hnd).p)

gets promoted to uint64_t, and is too wide to cast back to a pointer in 32bit
builds.  The expression needs casting through (unsigned long) before it can be
cast to (void *).

Xen has the _p() wrapper to do precisely this.

No functional change.

Link: https://gitlab.com/xen-project/xen/-/jobs/7136417308
Fixes: 43d5c5d5f70b ("xen: avoid UB in guest handle arithmetic")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.19, as this was found by CI.
---
 xen/include/xen/guest_access.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_access.h
index 96dbef2e0251..969813762c25 100644
--- a/xen/include/xen/guest_access.h
+++ b/xen/include/xen/guest_access.h
@@ -65,7 +65,7 @@
     /* Check that the handle is not for a const type */ \
     void *__maybe_unused _t = (hnd).p;                  \
     (void)((hnd).p == _s);                              \
-    raw_copy_to_guest((void *)(d_ + (off) * sizeof(*_s)), \
+    raw_copy_to_guest(_p(d_ + (off) * sizeof(*_s)),     \
                       _s, (nr) * sizeof(*_s));          \
 })
 
@@ -75,7 +75,7 @@
  */
 #define clear_guest_offset(hnd, off, nr) ({             \
     unsigned long d_ = (unsigned long)(hnd).p;          \
-    raw_clear_guest((void *)(d_ + (off) * sizeof(*(hnd).p)), \
+    raw_clear_guest(_p(d_ + (off) * sizeof(*(hnd).p)),  \
                     (nr) * sizeof(*(hnd).p));           \
 })
 
@@ -87,7 +87,7 @@
     unsigned long s_ = (unsigned long)(hnd).p;          \
     typeof(*(ptr)) *_d = (ptr);                         \
     raw_copy_from_guest(_d,                             \
-                        (const void *)(s_ + (off) * sizeof(*_d)), \
+                        _p(s_ + (off) * sizeof(*_d)),   \
                         (nr) * sizeof(*_d));            \
 })
 
@@ -127,13 +127,13 @@
     /* Check that the handle is not for a const type */     \
     void *__maybe_unused _t = (hnd).p;                      \
     (void)((hnd).p == _s);                                  \
-    __raw_copy_to_guest((void *)(d_ + (off) * sizeof(*_s)), \
+    __raw_copy_to_guest(_p(d_ + (off) * sizeof(*_s)),       \
                       _s, (nr) * sizeof(*_s));              \
 })
 
 #define __clear_guest_offset(hnd, off, nr) ({               \
     unsigned long d_ = (unsigned long)(hnd).p;              \
-    __raw_clear_guest((void *)(d_ + (off) * sizeof(*(hnd).p)), \
+    __raw_clear_guest(_p(d_ + (off) * sizeof(*(hnd).p)),    \
                       (nr) * sizeof(*(hnd).p));             \
 })
 
@@ -141,7 +141,7 @@
     unsigned long s_ = (unsigned long)(hnd).p;                  \
     typeof(*(ptr)) *_d = (ptr);                                 \
     __raw_copy_from_guest(_d,                                   \
-                          (const void *)(s_ + (off) * sizeof(*_d)), \
+                          _p(s_ + (off) * sizeof(*_d)),         \
                           (nr) * sizeof(*_d));                  \
 })
 

base-commit: 43d5c5d5f70b3f5419e7ef30399d23adf6ddfa8e
-- 
2.39.2


