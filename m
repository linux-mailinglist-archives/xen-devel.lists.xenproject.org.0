Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9F0B10CAD
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 16:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056121.1424271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewby-00057w-Fp; Thu, 24 Jul 2025 14:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056121.1424271; Thu, 24 Jul 2025 14:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewby-00056E-CH; Thu, 24 Jul 2025 14:07:54 +0000
Received: by outflank-mailman (input) for mailman id 1056121;
 Thu, 24 Jul 2025 14:07:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cm2i=2F=bounce.vates.tech=bounce-md_30504962.68823e34.v1-37a91361c26a4bb59f27d23fc7416fe2@srs-se1.protection.inumbo.net>)
 id 1uewbx-000567-4z
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:07:53 +0000
Received: from mail180-9.suw31.mandrillapp.com
 (mail180-9.suw31.mandrillapp.com [198.2.180.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94dfa9c7-6897-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 16:07:50 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-9.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4bntBD6Qx8zK5vnMS
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 14:07:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 37a91361c26a4bb59f27d23fc7416fe2; Thu, 24 Jul 2025 14:07:48 +0000
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
X-Inumbo-ID: 94dfa9c7-6897-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753366068; x=1753636068;
	bh=cia2BzDWY4ebE/PW5ST0QN+7zrDvuTDanOKqXxDfmmM=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=SFU4JJFUmuL9NrNZ+CNA6wB68x2sB65cWCvKDM2AE6ru/EBZpW4z000y5T/+A8pYA
	 EPx0JL+iwXdJJZJKmAIqJnG9EtFK963n0QWCnYpYk1HiPwVzzSywK7yLBANe1oJRAj
	 ldJ1B1AxP0hS/ea62VVhyNbrUzAobhym8KAz5khQxXs0LnVUNRHevXCaHlS/IHKPtc
	 9vI6bRL7XTxNBWfXY5F64HSYmAoEbQvSnTp5Nxq5mnxTcSnxx/SThUs9tbEMvQlwkv
	 gy/S8hxC9tuYEMHhkgDAkf5fdRN7X8P81wbBcPMq8agUT9Z4d2/EPmv8Iq1ikHRzpC
	 JAFmCDsEwoSwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753366068; x=1753626568; i=yann.sionneau@vates.tech;
	bh=cia2BzDWY4ebE/PW5ST0QN+7zrDvuTDanOKqXxDfmmM=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=gDTDb7xTBilTejOiQLUWQzEAVuwvaGJLUmAXYf0+vggoqDgfXRrcFffa8Io+TPOYB
	 RQtoI/xE5uo5mwgfepVzZgYBScIWRONvv5a+wl5xW2lH8bq9Qdo1X0uzZhuR3mr8xu
	 aG16mga5+nS6k0UzLTbxgKoKfS7zC+EinXCUcyHam5PcYZY523Eema9xWgJSdK0an3
	 34sfAM93s2Nfrhd5Z1AVYnJXihoEMACmbB8J2K6GB9LdVuiBl0reDbn176K6Uml6Cd
	 JmigqyVZgYi5tzH8qv43OtelH/krgpG64EIGGG8Bcy7mYXWt7f4WgKp5Ori6XhXgvT
	 Ty9dIalQHBsww==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2]=20xen/x86:=20fix=20xen.efi=20boot=20crash=20from=20some=20bootloaders?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753366067577
To: xen-devel@lists.xenproject.org
Cc: "Yann Sionneau" <yann.sionneau@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <20250724140731.1502774-1-yann.sionneau@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.37a91361c26a4bb59f27d23fc7416fe2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250724:md
Date: Thu, 24 Jul 2025 14:07:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

xen.efi PE does not boot when loaded from shim or some patched
downstream grub2.

What happens is the bootloader would honour the MEM_DISCARDABLE
flag of the .reloc section meaning it would not load its content
into memory.

But Xen is parsing the .reloc section content twice at boot:
* https://elixir.bootlin.com/xen/v4.20.1/source/xen/common/efi/boot.c#L1362
* https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/efi-boot.h#L237

Therefore it would crash with the following message:
"Unsupported relocation type" as reported there:

* https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2619048838
* https://lore.kernel.org/xen-devel/7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com/T/#me122b9e6c27cd98db917da2c9f67e74a2c6ad7a5

This commit adds a small C host tool named keeprelocs
that is called after xen.efi is produced by the build system
in order to remove this bit from its .reloc section header.

Signed-off-by: Yann Sionneau <yann.sionneau@vates.tech>
---
Changes since v1:
- use xen coding style instead of Linux kernel one
- use void * to store the return value from mmap()
- PE file is passed as non-optional argument instead of -i FILE
- use bool instead of int type for "quiet" flag
- remove useless break after return
- add missing 0x before %08x conversion specifier
- add SPDX header
- remove DEBUG stuff
- improve opt_hdr_size checks
- removed useless tools_keeprelocs Makefile target
- fixed -I include path for keeprelocs tool: use $(srctree)
- use memcmp instead of strncmp
- produce an intermediate xen.efi.1 before running keeprelocs
  so that an interrupted build would not end up having a bad
  xen.efi (with MEM_DISCARDABLE flag in .reloc section).
  In other words: make sure the final xen.efi is produced only
  after all modifications are done.

Link to v1: https://lore.kernel.org/xen-devel/20250723135620.1327914-1-yann.sionneau@vates.tech/
---
 xen/arch/x86/Makefile  |   6 +-
 xen/tools/Makefile     |   3 +
 xen/tools/keeprelocs.c | 165 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+), 2 deletions(-)
 create mode 100644 xen/tools/keeprelocs.c

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index ce724a9daa..91af6ae214 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -232,10 +232,12 @@ endif
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
 	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
-	      $(note_file_option) -o $@
-	$(NM) -pa --format=sysv $@ \
+	      $(note_file_option) -o $@.1
+	$(NM) -pa --format=sysv $@.1 \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
+	$(objtree)/tools/keeprelocs -q $@.1
+	mv $@.1 $@
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
 endif
diff --git a/xen/tools/Makefile b/xen/tools/Makefile
index a5078b7cb8..620063ab1e 100644
--- a/xen/tools/Makefile
+++ b/xen/tools/Makefile
@@ -1,2 +1,5 @@
 hostprogs-always-y += symbols
 hostprogs-always-y += fixdep
+hostprogs-always-$(XEN_BUILD_PE) += keeprelocs
+# next line is to allow including include/efi/pe.h
+HOSTCFLAGS_keeprelocs.o := -I $(srctree)/include
\ No newline at end of file
diff --git a/xen/tools/keeprelocs.c b/xen/tools/keeprelocs.c
new file mode 100644
index 0000000000..284378564a
--- /dev/null
+++ b/xen/tools/keeprelocs.c
@@ -0,0 +1,165 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <stdio.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <stdbool.h>
+#include <efi/pe.h>
+
+static void print_usage(const char *name)
+{
+    printf("%s: [-q] [-h] xen.efi\n", name);
+}
+
+static int get_minimum_opt_hdr_size(uint16_t opt_hdr_magic)
+{
+    switch ( opt_hdr_magic )
+    {
+        case PE_OPT_MAGIC_PE32:
+            return sizeof(struct pe32_opt_hdr);
+        case PE_OPT_MAGIC_PE32PLUS:
+            return sizeof(struct pe32plus_opt_hdr);
+        default:
+            return -1;
+    }
+}
+
+int main(int argc, char **argv)
+{
+    char *filename = NULL;
+    int fd;
+    void *mem;
+    struct stat st;
+    off_t len;
+    int ret;
+    struct mz_hdr *mz;
+    struct pe_hdr *pe;
+    int opt;
+    const char *prog_name = argv[0];
+    bool quiet = false;
+    int min_opt_hdr_size;
+    unsigned int section_id;
+
+    while ( (opt = getopt(argc, argv, ":qh")) != -1 )
+    {
+        switch ( opt )
+        {
+            case 'q':
+                quiet = true;
+                break;
+            case 'h':
+                print_usage(prog_name);
+                return 0;
+            case '?':
+            default:
+                print_usage(prog_name);
+                return -1;
+            }
+    }
+
+    if ( optind < argc )
+        filename = argv[optind++];
+    else
+    {
+        printf("Error: you must provide the PE file name as first and only non-optional argument\n");
+        return -1;
+    }
+
+    if ( optind != argc )
+    {
+        printf("Only one non-optional argument should be supplied: the PE file name\n");
+        return -1;
+    }
+
+    fd = open(filename, O_RDWR);
+    if ( fd < 0 )
+    {
+        printf("Could not open file %s: %s\n", filename, strerror(errno));
+        return -1;
+    }
+
+    ret = fstat(fd, &st);
+    if ( ret < 0 )
+    {
+        perror("Error while getting PE file length");
+        return -1;
+    }
+
+    len = st.st_size;
+    mem = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+
+    if ( mem == MAP_FAILED )
+    {
+        perror("Failed to mmap PE file");
+        return -1;
+    }
+
+    mz = mem;
+    if ( mz->magic != MZ_MAGIC )
+    {
+        printf("file has incorrect MZ header 0x%02x instead of 0x5a4d\n",
+                mz->magic);
+        return -1;
+    }
+
+    pe = mem + mz->peaddr;
+    if ( memcmp((char *)&pe->magic, "PE\0\0", 4) )
+    {
+        printf("file has incorrect PE header magic 0x%08x instead of 0x00004550\n",
+                pe->magic);
+        return -1;
+    }
+
+    if ( pe->opt_hdr_size < 2 )
+    {
+        printf("file has too small OptionalHeaderSize: %d\n", pe->opt_hdr_size);
+        return -1;
+    }
+
+    /* Compute minimum optional header size, based on its
+     * first field (uint16_t magic).
+     */
+    min_opt_hdr_size = get_minimum_opt_hdr_size(*(uint16_t *)((void *)pe
+                                                + sizeof(*pe)));
+    if ( min_opt_hdr_size < 0 )
+    {
+        printf("Incorrect binary type, should be PE32 or PE32+\n");
+        return -1;
+    }
+
+    if ( pe->opt_hdr_size < min_opt_hdr_size )
+    {
+        printf("file has too small OptionalHeaderSize: %d\n", pe->opt_hdr_size);
+        return -1;
+    }
+
+    struct section_header *section = (struct section_header *)((uint8_t *)pe
+                                     + sizeof(*pe) + pe->opt_hdr_size);
+    for ( section_id = 0; section_id < pe->sections; section_id++, section++ )
+    {
+        if ( memcmp(section->name, ".reloc", strlen(".reloc") + 1) )
+            continue;
+
+        if ( !quiet )
+            printf(".reloc section characteristics: %08x\n", section->flags);
+        if ( section->flags & IMAGE_SCN_MEM_DISCARDABLE )
+        {
+            if ( !quiet )
+                printf("MEM_DISCARDABLE flag found! Dropping it.\n");
+            section->flags &= ~(IMAGE_SCN_MEM_DISCARDABLE);
+        }
+    }
+
+    munmap(mem, len);
+    close(fd);
+
+    if ( !quiet )
+        printf("Ok!\n");
+    return 0;
+}
-- 
2.43.0



Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


