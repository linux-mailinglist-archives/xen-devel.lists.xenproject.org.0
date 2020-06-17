Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6731FC607
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 08:09:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlRFu-0006W1-Ft; Wed, 17 Jun 2020 06:09:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gOQl=76=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jlRFs-0006Vu-9j
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 06:09:01 +0000
X-Inumbo-ID: 078b6d8e-b061-11ea-b7bb-bc764e2007e4
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 078b6d8e-b061-11ea-b7bb-bc764e2007e4;
 Wed, 17 Jun 2020 06:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592374137;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=BPYpE9GksVEBqAS0fZJlKXX9acwPilfaAPWjwRABGJo=;
 b=AC8gwV4pgt0HB3V79wmnnfRHrfvykVtFBM01ZZ48yWKy3zEX2Y3AJOc5s0DsR0NiJr
 z9pua3jb9FeX86x560sQWZ88IsTmhBa7xnYu01LHtdknR8phrdgPx0PgPvSZMFVTBts5
 dktq/NvXhkmvVo7G1SmlZWGmiXDmRpsVdEROT//fEXpsEn96r982t5+hPU0NgixKa77E
 vGTzeOwKN+XM5DBOGhUu/CfDwMkgWD0HeRNpCmWjtRLYKWluE2uFbu1UQEdcn5JJOYLo
 ugMcZiXRQov+lWGi6JzEdxxRMuAFcjqnpxzdnM30avl638xPNm1WJwx4t8TOCp2Biuy9
 xRvQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GpKjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
 with ESMTPSA id 0013a0w5H68mGuq
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 17 Jun 2020 08:08:48 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v1] stubdom/vtpm: add extern to function declarations
Date: Wed, 17 Jun 2020 08:08:41 +0200
Message-Id: <20200617060841.7241-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Code compiled with gcc10 will not link properly due to multiple definition of the same function.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 stubdom/Makefile          |  1 +
 stubdom/vtpm_extern.patch | 48 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 stubdom/vtpm_extern.patch

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 12aa211ac3..af8cde41b9 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -231,6 +231,7 @@ tpm_emulator-$(XEN_TARGET_ARCH): tpm_emulator-$(TPMEMU_VERSION).tar.gz
 	patch -d $@ -p1 < vtpm-cmake-Wextra.patch
 	patch -d $@ -p1 < vtpm-implicit-fallthrough.patch
 	patch -d $@ -p1 < vtpm_TPM_ChangeAuthAsymFinish.patch
+	patch -d $@ -p1 < vtpm_extern.patch
 	mkdir $@/build
 	cd $@/build; CC=${CC} $(CMAKE) .. -DCMAKE_C_FLAGS:STRING="-std=c99 -DTPM_NO_EXTERN $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) -Wno-declaration-after-statement"
 	touch $@
diff --git a/stubdom/vtpm_extern.patch b/stubdom/vtpm_extern.patch
new file mode 100644
index 0000000000..5ea4023e6d
--- /dev/null
+++ b/stubdom/vtpm_extern.patch
@@ -0,0 +1,48 @@
+ld: /home/abuild/rpmbuild/BUILD/xen-4.8.20191211T160002.8db85532cb/non-dbg/stubdom/vtpm/vtpm.a(vtpm_cmd.o):(.bss+0x28): multiple definition of `tpm_malloc'; /home/abuild/rpmbuild/BUILD/xen-4.8.20191211T160002.8db85532cb/non-dbg/stubdom/vtpm/vtpm.a(vtpm.o):(.bss+0x728): first defined here
+--- a/tpm/tpm_emulator_extern.h
++++ b/tpm/tpm_emulator_extern.h
+@@ -29,7 +29,7 @@ enum {
+   TPM_LOG_ERROR
+ };
+ 
+-void (*tpm_log)(int priority, const char *fmt, ...);
++extern void (*tpm_log)(int priority, const char *fmt, ...);
+ 
+ #if defined(_WIN32) || defined(_WIN64)
+ #define __BFILE__ ((strrchr(__FILE__, '\\') ? : __FILE__ - 1) + 1)
+@@ -44,27 +44,27 @@ void (*tpm_log)(int priority, const char
+ #define error(fmt, ...) tpm_log(TPM_LOG_ERROR, "%s:%d: Error: " fmt "\n", \
+                                 __BFILE__, __LINE__, ## __VA_ARGS__)
+ /* initialization */
+-int (*tpm_extern_init)(void);
+-void (*tpm_extern_release)(void);
++extern int (*tpm_extern_init)(void);
++extern void (*tpm_extern_release)(void);
+ 
+ /* memory allocation */
+ 
+-void* (*tpm_malloc)(size_t size);
++extern void* (*tpm_malloc)(size_t size);
+ 
+-void (*tpm_free)(/*const*/ void *ptr);
++extern void (*tpm_free)(/*const*/ void *ptr);
+ 
+ /* random numbers */
+ 
+-void (*tpm_get_extern_random_bytes)(void *buf, size_t nbytes);
++extern void (*tpm_get_extern_random_bytes)(void *buf, size_t nbytes);
+ 
+ /* usec since last call */
+ 
+-uint64_t (*tpm_get_ticks)(void);
++extern uint64_t (*tpm_get_ticks)(void);
+ 
+ /* file handling */
+ 
+-int (*tpm_write_to_storage)(uint8_t *data, size_t data_length);
+-int (*tpm_read_from_storage)(uint8_t **data, size_t *data_length);
++extern int (*tpm_write_to_storage)(uint8_t *data, size_t data_length);
++extern int (*tpm_read_from_storage)(uint8_t **data, size_t *data_length);
+ 
+ #endif /* _TPM_EMULATOR_EXTERN_H_ */
+ 

