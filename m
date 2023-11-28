Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C587FC080
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643411.1003602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r82BP-0000Iq-Nx; Tue, 28 Nov 2023 17:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643411.1003602; Tue, 28 Nov 2023 17:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r82BP-0000Ew-Kx; Tue, 28 Nov 2023 17:47:39 +0000
Received: by outflank-mailman (input) for mailman id 643411;
 Tue, 28 Nov 2023 17:47:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=InPH=HJ=zen2.lab.linutronix.de=alex@srs-se1.protection.inumbo.net>)
 id 1r82BN-0000Eq-Vi
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 17:47:38 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 376fcf8c-8e16-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 18:47:36 +0100 (CET)
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
X-Inumbo-ID: 376fcf8c-8e16-11ee-98e3-6d05b1d4d9a1
From: Alexander Kanavin <alex@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701193655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6Dj6Dm0GUWm0oD+U33Q4aBpJzv9FVypp509lLyxq/40=;
	b=2fXB/nz7aYwbqNRddJ08Ts0Qevd0r93/MDQfUXaAL1pmbow0jv2oLvjeaAXnXTEhWjPHj2
	58ZmdDR2Gj/ugcE+ChCaDwmxpa9dqUK6x2BFZVfl4jfyuRjMwrqvE4HUbXNvw8o/6kNubo
	f5Q4iqMJkZJUAwxDml9+UFyl+GhUhZNLRT3SgfcMhDEZweaJkGeiD1wDcqqQsAbzBkJOJq
	2qcoJarGpw29sAO8ZQ8XaQpyDAlIKc26F5a2dW7OWMtebZch1fx42n3d4Q1IBca3yP4OXS
	Umpn4EpnxJ/t06st5/csURDoDG9feEyvcVHvcGqOlf4sUnKdN2q2FmYtK7sJjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701193656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6Dj6Dm0GUWm0oD+U33Q4aBpJzv9FVypp509lLyxq/40=;
	b=ADeq3y6n6pKlMHe1V1yK+6nRMXVIotW04wwV+hbKFuvP1f9IEHqNMt4Zvg+FZqmUSg7RO0
	Wl+c3UZtzfy6EBBQ==
To: xen-devel@lists.xenproject.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] Config.mk: drop -Wdeclaration-after-statement
Date: Tue, 28 Nov 2023 18:47:29 +0100
Message-Id: <20231128174729.3880113-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Such constructs are fully allowed by C99:
https://gcc.gnu.org/onlinedocs/gcc-12.2.0/gcc/Mixed-Labels-and-Declarations.html#Mixed-Labels-and-Declarations

If the flag is present, then building against python 3.12 will fail thusly:

| In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:44,
|                  from xen/lowlevel/xc/xc.c:8:
| /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h: In function 'Py_SIZE':
| /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/object.h:233:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
|   233 |     PyVarObject *var_ob = _PyVarObject_CAST(ob);
|       |     ^~~~~~~~~~~
| In file included from /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/Python.h:53:
| /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h: In function '_PyLong_CompactValue':
| /srv/storage/alex/yocto/build-virt/tmp/work/core2-64-poky-linux/xen-tools/4.17+stable/recipe-sysroot/usr/include/python3.12/cpython/longintrepr.h:121:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
|   121 |     Py_ssize_t sign = 1 - (op->long_value.lv_tag & _PyLong_SIGN_MASK);
|       |     ^~~~~~~~~~
| cc1: all warnings being treated as errors

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 Config.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Config.mk b/Config.mk
index 2c43702958..7e67b91de2 100644
--- a/Config.mk
+++ b/Config.mk
@@ -177,8 +177,6 @@ CFLAGS += -std=gnu99
 
 CFLAGS += -Wall -Wstrict-prototypes
 
-$(call cc-option-add,HOSTCFLAGS,HOSTCC,-Wdeclaration-after-statement)
-$(call cc-option-add,CFLAGS,CC,-Wdeclaration-after-statement)
 $(call cc-option-add,CFLAGS,CC,-Wno-unused-but-set-variable)
 $(call cc-option-add,CFLAGS,CC,-Wno-unused-local-typedefs)
 
-- 
2.39.2


