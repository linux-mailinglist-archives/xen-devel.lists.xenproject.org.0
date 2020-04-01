Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DDE19ADDC
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 16:31:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJeNI-0005K9-42; Wed, 01 Apr 2020 14:29:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1qDs=5R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJeNG-0005K2-8E
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 14:29:46 +0000
X-Inumbo-ID: 3b8615b2-7425-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b8615b2-7425-11ea-9e09-bc764e2007e4;
 Wed, 01 Apr 2020 14:29:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6C259ABC6;
 Wed,  1 Apr 2020 14:29:44 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] guestcopy: evaluate {, __}copy{, _field}_to_guest*() arguments
 just once
Message-ID: <9918b339-e914-7228-5f8e-86c82090b5bd@suse.com>
Date: Wed, 1 Apr 2020 16:29:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There's nothing wrong with having e.g.

    copy_to_guest(uarg, ptr++, 1);

yet until now this would increment "ptr" twice.

Also drop a pair of unneeded parentheses from every instance at this
occasion.

Fixes: b7954cc59831 ("Enhance guest memory accessor macros so that source operands can be")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Arm side untested so far, as I don't have all the tool chain pieces
available at home.
---
This goes on top of the assumed v2 of Julien's "xen/guest_access: Harden
copy_to_guest_offset to prevent const dest operand".

--- a/xen/include/asm-arm/guest_access.h
+++ b/xen/include/asm-arm/guest_access.h
@@ -79,7 +79,7 @@ int access_guest_memory_by_ipa(struct do
     const typeof(*(ptr)) *_s = (ptr);                   \
     char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
     void *__maybe_unused _t = (hnd).p;                  \
-    ((void)((hnd).p == (ptr)));                         \
+    (void)((hnd).p == _s);                              \
     raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));  \
 })
 
@@ -106,7 +106,7 @@ int access_guest_memory_by_ipa(struct do
 #define copy_field_to_guest(hnd, ptr, field) ({         \
     const typeof(&(ptr)->field) _s = &(ptr)->field;     \
     void *_d = &(hnd).p->field;                         \
-    ((void)(&(hnd).p->field == &(ptr)->field));         \
+    (void)(&(hnd).p->field == _s);                      \
     raw_copy_to_guest(_d, _s, sizeof(*_s));             \
 })
 
@@ -129,7 +129,7 @@ int access_guest_memory_by_ipa(struct do
     const typeof(*(ptr)) *_s = (ptr);                   \
     char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
     void *__maybe_unused _t = (hnd).p;                  \
-    ((void)((hnd).p == (ptr)));                         \
+    (void)((hnd).p == _s);                              \
     __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
 })
 
@@ -146,7 +146,7 @@ int access_guest_memory_by_ipa(struct do
 #define __copy_field_to_guest(hnd, ptr, field) ({       \
     const typeof(&(ptr)->field) _s = &(ptr)->field;     \
     void *_d = &(hnd).p->field;                         \
-    ((void)(&(hnd).p->field == &(ptr)->field));         \
+    (void)(&(hnd).p->field == _s);                      \
     __raw_copy_to_guest(_d, _s, sizeof(*_s));           \
 })
 
--- a/xen/include/asm-x86/guest_access.h
+++ b/xen/include/asm-x86/guest_access.h
@@ -88,7 +88,7 @@
     const typeof(*(ptr)) *_s = (ptr);                   \
     char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
     void *__maybe_unused _t = (hnd).p;                  \
-    ((void)((hnd).p == (ptr)));                         \
+    (void)((hnd).p == _s);                              \
     raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));  \
 })
 
@@ -111,7 +111,7 @@
 #define copy_field_to_guest(hnd, ptr, field) ({         \
     const typeof(&(ptr)->field) _s = &(ptr)->field;     \
     void *_d = &(hnd).p->field;                         \
-    ((void)(&(hnd).p->field == &(ptr)->field));         \
+    (void)(&(hnd).p->field == _s);                      \
     raw_copy_to_guest(_d, _s, sizeof(*_s));             \
 })
 
@@ -139,7 +139,7 @@
     const typeof(*(ptr)) *_s = (ptr);                   \
     char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
     void *__maybe_unused _t = (hnd).p;                  \
-    ((void)((hnd).p == (ptr)));                         \
+    (void)((hnd).p == _s);                              \
     __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
 })
 
@@ -157,7 +157,7 @@
 #define __copy_field_to_guest(hnd, ptr, field) ({       \
     const typeof(&(ptr)->field) _s = &(ptr)->field;     \
     void *_d = &(hnd).p->field;                         \
-    ((void)(&(hnd).p->field == &(ptr)->field));         \
+    (void)(&(hnd).p->field == _s);                      \
     __raw_copy_to_guest(_d, _s, sizeof(*_s));           \
 })
 

