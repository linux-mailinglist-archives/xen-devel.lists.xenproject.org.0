Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FBDB0F4A8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 15:56:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054049.1422851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZxW-0007lk-Kx; Wed, 23 Jul 2025 13:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054049.1422851; Wed, 23 Jul 2025 13:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZxW-0007jW-IE; Wed, 23 Jul 2025 13:56:38 +0000
Received: by outflank-mailman (input) for mailman id 1054049;
 Wed, 23 Jul 2025 13:56:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I61u=2E=bounce.vates.tech=bounce-md_30504962.6880ea11.v1-e09ecc61c9564a138c55d1808e25a1a8@srs-se1.protection.inumbo.net>)
 id 1ueZxV-0007jQ-CS
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 13:56:37 +0000
Received: from mail13.wdc04.mandrillapp.com (mail13.wdc04.mandrillapp.com
 [205.201.139.13]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7fa3d0f-67cc-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 15:56:35 +0200 (CEST)
Received: from pmta16.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail13.wdc04.mandrillapp.com (Mailchimp) with ESMTP id 4bnFzj4RlZzNCd9SH
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 13:56:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e09ecc61c9564a138c55d1808e25a1a8; Wed, 23 Jul 2025 13:56:33 +0000
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
X-Inumbo-ID: d7fa3d0f-67cc-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753278993; x=1753548993;
	bh=mUk/zx/QTzzyDnJlYO/y+zk8wGz+UZMwGORRuyVlljE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=hesEuR3ZT+JqSbIZ/keG8BIMGa8Q2jHaL5otyg+UJzhibJLyUIhmixWycBzYQZlR7
	 HzgpXn50x8JCiriYdLD8+HQkbYbC1SWGxVIE7eSDL+2qyYClJnA4wDtJ+PLgTe540k
	 BV6uMjeifJ5rADlXeFqDWTuW5YFJr54I4xOnXGU44f0YnSMIoVRZERm8xdsl5oGfrr
	 a1lZFCSG6QpssSRna/3ZUGCqcPIgcHrDUq+6F9cftw/fF1fTRNL51QPiydC/eHiF1Y
	 xrz6Cb4aqadjf7rzkIkyoRiDti6R8bIqQDWt45gbYSnfgA3j0m4OFd5pk4tlmhRJJA
	 /Yuj8T0voDmoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753278993; x=1753539493; i=yann.sionneau@vates.tech;
	bh=mUk/zx/QTzzyDnJlYO/y+zk8wGz+UZMwGORRuyVlljE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=m/SykoAH2p0j3xHwLIVZUi+H12Ota4CAc74RNP3HHY1al2uJfp7otBFQu5FUr5tj3
	 kw6GvyyzvBqjeQ69pWcvMaEwSz11OrdWnSBv20o+0gVcvLprPyW2p5ue5BpKbGfNM2
	 72o6xucki13jpsm1E214TEhOgXsDCSroNgPFVxlCI3OY9cIVDT3BJEXByXlVfJK1EK
	 +y5WMHnvt6JsRIz9Uu3h6TarPWjdtzQl7QpefA3jX+72YbbZ1DNI9YfwjA6C2VxIRR
	 7gIA6Vts/+fUH2oPDlHr+UHpThrpgKHknDAms+Zv9k5PLJEn7o+ap5maxksXxb/TPb
	 4pBBEFaOTyKOg==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20xen/x86:=20fix=20xen.efi=20boot=20crash=20from=20some=20bootloaders?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753278992020
To: xen-devel@lists.xenproject.org
Cc: "Yann Sionneau" <yann.sionneau@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <20250723135620.1327914-1-yann.sionneau@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e09ecc61c9564a138c55d1808e25a1a8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250723:md
Date: Wed, 23 Jul 2025 13:56:33 +0000
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
 xen/Makefile           |   5 +-
 xen/arch/x86/Makefile  |   1 +
 xen/tools/Makefile     |   3 ++
 xen/tools/keeprelocs.c | 119 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 xen/tools/keeprelocs.c

diff --git a/xen/Makefile b/xen/Makefile
index 8fc4e042ff..7dc9cd7e05 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -299,10 +299,13 @@ export XEN_HAS_CHECKPOLICY := $(call success,$(CHECKPOLICY) -h 2>&1 | grep -q xe
 # ===========================================================================
 # Rules shared between *config targets and build targets
 
-PHONY += tools_fixdep
+PHONY += tools_fixdep tools_keeprelocs
 tools_fixdep:
 	$(Q)$(MAKE) $(build)=tools tools/fixdep
 
+tools_keeprelocs:
+	$(Q)$(MAKE) $(build)=tools tools/keeprelocs
+
 PHONY += outputmakefile
 # Before starting out-of-tree build, make sure the source tree is clean.
 # outputmakefile generates a Makefile in the output directory, if using a
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index ce724a9daa..9a47002fae 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -236,6 +236,7 @@ endif
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
+	$(objtree)/tools/keeprelocs -q -i $@
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
 endif
diff --git a/xen/tools/Makefile b/xen/tools/Makefile
index a5078b7cb8..4fd917b398 100644
--- a/xen/tools/Makefile
+++ b/xen/tools/Makefile
@@ -1,2 +1,5 @@
 hostprogs-always-y += symbols
 hostprogs-always-y += fixdep
+hostprogs-always-$(XEN_BUILD_PE) += keeprelocs
+# next line is to allow including include/efi/pe.h
+HOSTCFLAGS_keeprelocs.o := -I ../include
\ No newline at end of file
diff --git a/xen/tools/keeprelocs.c b/xen/tools/keeprelocs.c
new file mode 100644
index 0000000000..c169ddba1a
--- /dev/null
+++ b/xen/tools/keeprelocs.c
@@ -0,0 +1,119 @@
+#include <stdio.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <efi/pe.h>
+
+#undef DEBUG
+
+static void print_usage(const char *name) {
+	printf("%s: [-q] [-h] -i xen.efi\n", name);
+}
+
+int main(int argc, char **argv)
+{
+	char *filename = NULL;
+	int fd;
+	char *mem;
+	struct stat st;
+	off_t len;
+	int ret;
+	struct mz_hdr *mz;
+	struct pe_hdr *pe;
+	int opt;
+	const char *prog_name = argv[0];
+	int quiet = 0;
+
+	while ((opt = getopt(argc, argv, ":i:qh")) != -1)
+	{
+		switch (opt) {
+		case 'i':
+			filename = optarg;
+			break;
+		case 'q':
+			quiet = 1;
+			break;
+		case 'h':
+			print_usage(prog_name);
+			return 0;
+			break;
+		case '?':
+		default:
+			print_usage(prog_name);
+			return -1;
+		}
+	}
+
+
+	if (!filename) {
+		printf("Error: you must provide a `-i xen.efi` argument\n");
+		return -1;
+	}
+
+	fd = open(filename, O_RDWR);
+	if (fd < 0) {
+		printf("Could not open file %s: %s\n", filename, strerror(errno));
+		return -1;
+	}
+
+	ret = fstat(fd, &st);
+	if (ret < 0) {
+		perror("Error while getting PE file length");
+		return -1;
+	}
+
+	len = st.st_size;
+	mem = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+
+	if (mem == MAP_FAILED) {
+		perror("Failed to mmap PE file");
+		return -1;
+	}
+
+	mz = (struct mz_hdr *)mem;
+	if (mz->magic != MZ_MAGIC) { // "MZ"
+		printf("file has incorrect MZ header 0x%02x instead of 0x5a4d\n", mz->magic);
+		return -1;
+	}
+
+	pe = (struct pe_hdr *)(mem + mz->peaddr);
+	if (strncmp((char *)&pe->magic, "PE\0\0", 4)) {
+		printf("file has incorrect PE header magic %08x instead of 0x00004550\n", pe->magic);
+		return -1;
+	}
+
+	if (pe->opt_hdr_size == 0) {
+		printf("file has empty OptionalHeader\n");
+		return -1;
+	}
+
+	struct section_header *section = (struct section_header *)((uint8_t *)pe + sizeof(*pe) + pe->opt_hdr_size);
+	for (unsigned int section_id = 0; section_id < pe->sections; section_id++, section++)
+	{
+#ifdef DEBUG
+		printf("section %s\n", section->Name);
+#endif
+		if (strncmp(section->name, ".reloc", strlen(".reloc")))
+			continue;
+
+		if (!quiet)
+			printf(".reloc section characteristics: %08x\n", section->flags);
+		if (section->flags & IMAGE_SCN_MEM_DISCARDABLE) {
+			if (!quiet)
+				printf("MEM_DISCARDABLE flag found! Dropping it.\n");
+			section->flags &= ~(IMAGE_SCN_MEM_DISCARDABLE);
+		}
+	}
+
+	munmap(mem, len);
+	close(fd);
+
+	if (!quiet)
+		printf("Ok!\n");
+	return 0;
+}
-- 
2.43.0



Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


