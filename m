Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D5D87A9F5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:03:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692494.1079702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQ8q-0004hG-3F; Wed, 13 Mar 2024 15:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692494.1079702; Wed, 13 Mar 2024 15:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQ8p-0004eY-Vh; Wed, 13 Mar 2024 15:03:39 +0000
Received: by outflank-mailman (input) for mailman id 692494;
 Wed, 13 Mar 2024 15:03:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwto=KT=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rkQ8p-0003t5-2J
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:03:39 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ded11ed3-e14a-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 16:03:38 +0100 (CET)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-7882e94d408so541337985a.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 08:03:38 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 s9-20020ac85ec9000000b0042ef4b5f4fbsm4930034qtx.38.2024.03.13.08.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 08:03:35 -0700 (PDT)
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
X-Inumbo-ID: ded11ed3-e14a-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710342216; x=1710947016; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4TeTAtNjsqWwlrctsZmN5LB4TEkMI5eFT9ZNBGXubI=;
        b=QXv1Ogx7cB5RsixhnMvChPv95kZ4LAXWT7izmloYZE4YqONv2wv2tDL+ftCgdwnd6a
         v9ddVubasZrGmm6qWWuf9qcOXPLhjYGreFyqjHrrnLPdhwGlXtTwVlhyrxGUnHEkExoJ
         zk1MgaZsZQ2cu9z2ep0OTxddCHTKvJFzQewi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342216; x=1710947016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4TeTAtNjsqWwlrctsZmN5LB4TEkMI5eFT9ZNBGXubI=;
        b=erm0ZfNIvFgYlJX2N5NPzEd78ZjlQfnSKthAVTCwdVvn73aSosd5ONj0NTil0P72IA
         aJYq9FTpDNH0VTd9t/mut3KM5KrpY/oMpuW4C7PTGqJxhrX+e2idLEX82Opbls/przDj
         WDcmWjzu/ubKFn1CzNQxm/bFehMpWlA3+IJxYCLzJAKuwH5cZMHMubySOG8r4B5IfwFO
         t1L0PgIv/BTVPJlAllqcBk3hA0xfi2vbx8Fzgj8HcNXlOKVodtqU46MGqAv/yVVzQUaL
         OLr58ohtswVj/w2YaNJJ/jFg432BCsaduZkOq5JSX2+FS8475/vSfogdN+wV25t3/wyR
         Mlug==
X-Gm-Message-State: AOJu0Yyuwq0Y4YgNh15ZWmtCItwWioqFN4V1Ko6oBTor4x3DpXR/ayXe
	q5LOr1vOgoz5F4rDGz1Ec2Ou73NobPU5KeQibl8rBq/5XcoXnkhQWk7NkXQQyLp7Jr/z+dFA/4B
	lSy2h
X-Google-Smtp-Source: AGHT+IE7eJh239NUg3LLwlY/kx4HoJml6ruPsHnqzezPRVHpl1dImCS7EL5JGXJT9DvImYTHuGiuAQ==
X-Received: by 2002:a05:622a:251:b0:42e:f101:952 with SMTP id c17-20020a05622a025100b0042ef1010952mr17139115qtx.11.1710342216119;
        Wed, 13 Mar 2024 08:03:36 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/4] x86: Hand-edit coff flags to remove RELOCS_STRIPPED flag
Date: Wed, 13 Mar 2024 15:04:38 +0000
Message-ID: <20240313150439.791213-4-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313150439.791213-1-ross.lagerwall@citrix.com>
References: <20240313150439.791213-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generated PE binary is generated without relocations since it does
not need them. However, the linker sets the IMAGE_FILE_RELOCS_STRIPPED
flag which implies the binary is not relocatable and this causes some
tools to refuse to handle the binary (e.g. Shim). As there is no option
to remove this flag using the linker, post-process the binary to do it.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 .gitignore                        |  1 +
 xen/arch/x86/Makefile             |  2 +
 xen/arch/x86/efi/set-coff-flags.c | 83 +++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)
 create mode 100644 xen/arch/x86/efi/set-coff-flags.c

diff --git a/.gitignore b/.gitignore
index d8b57e32f888..ab0b18352a0f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -256,6 +256,7 @@ xen/arch/x86/boot/*.lnk
 xen/arch/x86/efi.lds
 xen/arch/x86/efi/check.efi
 xen/arch/x86/efi/mkreloc
+xen/arch/x86/efi/set-coff-flags
 xen/arch/x86/include/asm/asm-macros.h
 xen/arch/*/xen.lds
 xen/arch/*/efi/boot.c
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index e26b1cb35036..73b16ddeb976 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -86,6 +86,7 @@ extra-y += xen.lds
 
 hostprogs-y += boot/mkelf32
 hostprogs-y += efi/mkreloc
+hostprogs-y += efi/set-coff-flags
 
 # Allows usercopy.c to include itself
 $(obj)/usercopy.o: CFLAGS-y += -iquote .
@@ -157,6 +158,7 @@ endif
 		{ echo "No Multiboot1 header found" >&2; false; }
 	od -t x4 -N 32768 $@.tmp | grep e85250d6 > /dev/null || \
 		{ echo "No Multiboot2 header found" >&2; false; }
+	$(obj)/efi/set-coff-flags $@.tmp
 	mv $@.tmp $(TARGET)
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
diff --git a/xen/arch/x86/efi/set-coff-flags.c b/xen/arch/x86/efi/set-coff-flags.c
new file mode 100644
index 000000000000..a99415e6bcbf
--- /dev/null
+++ b/xen/arch/x86/efi/set-coff-flags.c
@@ -0,0 +1,83 @@
+#include <stdio.h>
+#include <stdint.h>
+#include <unistd.h>
+#include <fcntl.h>
+
+struct mz_hdr {
+    uint16_t signature;
+#define MZ_SIGNATURE 0x5a4d
+    uint16_t last_page_size;
+    uint16_t page_count;
+    uint16_t relocation_count;
+    uint16_t header_paras;
+    uint16_t min_paras;
+    uint16_t max_paras;
+    uint16_t entry_ss;
+    uint16_t entry_sp;
+    uint16_t checksum;
+    uint16_t entry_ip;
+    uint16_t entry_cs;
+    uint16_t relocations;
+    uint16_t overlay;
+    uint8_t reserved[32];
+    uint32_t extended_header_base;
+};
+
+struct coff_hdr {
+    uint32_t signature;
+    uint16_t cpu;
+    uint16_t section_count;
+    int32_t timestamp;
+    uint32_t symbols_file_offset;
+    uint32_t symbol_count;
+    uint16_t opt_hdr_size;
+    uint16_t flags;
+};
+
+int main(int argc, char **argv)
+{
+    int fd;
+    struct mz_hdr mz_hdr;
+    struct coff_hdr coff_hdr;
+
+    if ( argc != 2 )
+    {
+        fprintf(stderr, "usage: %s <image>\n", argv[0]);
+        return 1;
+    }
+
+    fd = open(argv[1], O_RDWR);
+    if ( fd < 0 ||
+         read(fd, &mz_hdr, sizeof(mz_hdr)) != sizeof(mz_hdr) )
+    {
+        perror(argv[1]);
+        return 2;
+    }
+
+    if ( mz_hdr.signature != MZ_SIGNATURE ||
+         !mz_hdr.extended_header_base )
+    {
+        fprintf(stderr, "%s: Wrong DOS file format\n", argv[1]);
+        return 2;
+    }
+
+    if ( lseek(fd, mz_hdr.extended_header_base, SEEK_SET) < 0 ||
+         read(fd, &coff_hdr, sizeof(coff_hdr)) != sizeof(coff_hdr) )
+    {
+        perror(argv[1]);
+        return 2;
+    }
+
+    coff_hdr.flags &= ~0x1;
+
+    if ( lseek(fd, mz_hdr.extended_header_base, SEEK_SET) < 0 ||
+         write(fd, &coff_hdr, sizeof(coff_hdr)) != sizeof(coff_hdr) )
+    {
+        perror(argv[1]);
+        return 3;
+    }
+
+    close(fd);
+
+    return 0;
+}
-- 
2.43.0


