Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AFAA6B731
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:25:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923442.1326994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYct-0006j8-BB; Fri, 21 Mar 2025 09:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923442.1326994; Fri, 21 Mar 2025 09:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYct-0006e4-6D; Fri, 21 Mar 2025 09:25:15 +0000
Received: by outflank-mailman (input) for mailman id 923442;
 Fri, 21 Mar 2025 09:25:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wue=WI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvYcr-0005O8-6Z
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:25:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6320e932-0636-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 10:25:11 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9FBF321CBC;
 Fri, 21 Mar 2025 09:25:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76C10139AA;
 Fri, 21 Mar 2025 09:25:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id E4WYG3Yw3WcYGQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Mar 2025 09:25:10 +0000
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
X-Inumbo-ID: 6320e932-0636-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMWRBt5CGXERaPO06Vbkq8ejeIXBFGe0ATkvAiDSWpM=;
	b=LUIwIFlc/illNUWSIYY2hdD17DWH+AeZXRbkNFdiKaj5kS9nntqRnAzhy/8QG06VJe4tE0
	1ceWb+fNBeXQ2WdwRwdjX+OWJHnMcAgMgspdvyrdzf4Y0k4tKNo/zHAY9z+3HVoCtGL5xZ
	D6CKiZaPY2n+Sd//d0HPJ7lCNSVIyug=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=LUIwIFlc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMWRBt5CGXERaPO06Vbkq8ejeIXBFGe0ATkvAiDSWpM=;
	b=LUIwIFlc/illNUWSIYY2hdD17DWH+AeZXRbkNFdiKaj5kS9nntqRnAzhy/8QG06VJe4tE0
	1ceWb+fNBeXQ2WdwRwdjX+OWJHnMcAgMgspdvyrdzf4Y0k4tKNo/zHAY9z+3HVoCtGL5xZ
	D6CKiZaPY2n+Sd//d0HPJ7lCNSVIyug=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 03/12] add elf.h
Date: Fri, 21 Mar 2025 10:24:42 +0100
Message-ID: <20250321092451.17309-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092451.17309-1-jgross@suse.com>
References: <20250321092451.17309-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9FBF321CBC
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Add some definitions for accessing an ELF file. Only the file header
and the program header are needed.

The main source for those are elfstructs.h and libelf.h from the Xen
tree. The license boiler plate of those files is being kept in the
resulting header file.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/elf.h | 340 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 340 insertions(+)
 create mode 100644 include/elf.h

diff --git a/include/elf.h b/include/elf.h
new file mode 100644
index 00000000..35a9c9fe
--- /dev/null
+++ b/include/elf.h
@@ -0,0 +1,340 @@
+#ifndef __ELF_H__
+#define __ELF_H__
+/*
+ * Copyright (c) 1995, 1996 Erik Theisen.  All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 3. The name of the author may not be used to endorse or promote products
+ *    derived from this software without specific prior written permission
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
+ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
+ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
+ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
+ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <stdbool.h>
+#include <mini-os/types.h>
+
+typedef uint32_t    Elf32_Addr;  /* Unsigned program address */
+typedef uint32_t    Elf32_Off;   /* Unsigned file offset */
+typedef uint16_t    Elf32_Half;  /* Unsigned medium integer */
+typedef uint32_t    Elf32_Word;  /* Unsigned large integer */
+
+typedef uint64_t    Elf64_Addr;
+typedef uint64_t    Elf64_Off;
+typedef uint16_t    Elf64_Half;
+typedef uint32_t    Elf64_Word;
+typedef uint64_t    Elf64_Xword;
+
+/* Unique build id string format when using --build-id. */
+#define NT_GNU_BUILD_ID 3
+
+/*
+ * e_ident[] identification indexes
+ * See http://www.caldera.com/developers/gabi/2000-07-17/ch4.eheader.html
+ */
+#define EI_MAG0        0         /* file ID */
+#define EI_MAG1        1         /* file ID */
+#define EI_MAG2        2         /* file ID */
+#define EI_MAG3        3         /* file ID */
+#define EI_CLASS       4         /* file class */
+#define EI_DATA        5         /* data encoding */
+#define EI_VERSION     6         /* ELF header version */
+#define EI_OSABI       7         /* OS/ABI ID */
+#define EI_ABIVERSION  8         /* ABI version */
+#define EI_PAD         9         /* start of pad bytes */
+#define EI_NIDENT     16         /* Size of e_ident[] */
+
+/* e_ident[] magic number */
+#define ELFMAG0        0x7f      /* e_ident[EI_MAG0] */
+#define ELFMAG1        'E'       /* e_ident[EI_MAG1] */
+#define ELFMAG2        'L'       /* e_ident[EI_MAG2] */
+#define ELFMAG3        'F'       /* e_ident[EI_MAG3] */
+#define ELFMAG         "\177ELF" /* magic */
+#define SELFMAG        4         /* size of magic */
+
+/* e_ident[] file class */
+#define ELFCLASSNONE   0         /* invalid */
+#define ELFCLASS32     1         /* 32-bit objs */
+#define ELFCLASS64     2         /* 64-bit objs */
+#define ELFCLASSNUM    3         /* number of classes */
+
+/* e_ident[] data encoding */
+#define ELFDATANONE    0         /* invalid */
+#define ELFDATA2LSB    1         /* Little-Endian */
+#define ELFDATA2MSB    2         /* Big-Endian */
+#define ELFDATANUM     3         /* number of data encode defines */
+
+/* e_ident[] Operating System/ABI */
+#define ELFOSABI_SYSV         0  /* UNIX System V ABI */
+#define ELFOSABI_NONE         0  /* Same as ELFOSABI_SYSV */
+#define ELFOSABI_HPUX         1  /* HP-UX operating system */
+#define ELFOSABI_NETBSD       2  /* NetBSD */
+#define ELFOSABI_LINUX        3  /* GNU/Linux */
+#define ELFOSABI_HURD         4  /* GNU/Hurd */
+#define ELFOSABI_86OPEN       5  /* 86Open common IA32 ABI */
+#define ELFOSABI_SOLARIS      6  /* Solaris */
+#define ELFOSABI_MONTEREY     7  /* Monterey */
+#define ELFOSABI_IRIX         8  /* IRIX */
+#define ELFOSABI_FREEBSD      9  /* FreeBSD */
+#define ELFOSABI_TRU64       10  /* TRU64 UNIX */
+#define ELFOSABI_MODESTO     11  /* Novell Modesto */
+#define ELFOSABI_OPENBSD     12  /* OpenBSD */
+#define ELFOSABI_ARM         97  /* ARM */
+#define ELFOSABI_STANDALONE 255  /* Standalone (embedded) application */
+
+/* e_ident */
+#define IS_ELF(ehdr) ((ehdr).e_ident[EI_MAG0] == ELFMAG0 && \
+                      (ehdr).e_ident[EI_MAG1] == ELFMAG1 && \
+                      (ehdr).e_ident[EI_MAG2] == ELFMAG2 && \
+                      (ehdr).e_ident[EI_MAG3] == ELFMAG3)
+
+/* e_flags */
+#define EF_ARM_EABI_MASK    0xff000000
+#define EF_ARM_EABI_UNKNOWN 0x00000000
+#define EF_ARM_EABI_VER1    0x01000000
+#define EF_ARM_EABI_VER2    0x02000000
+#define EF_ARM_EABI_VER3    0x03000000
+#define EF_ARM_EABI_VER4    0x04000000
+#define EF_ARM_EABI_VER5    0x05000000
+
+/* ELF Header */
+typedef struct {
+    unsigned char e_ident[EI_NIDENT]; /* ELF Identification */
+    Elf32_Half    e_type;        /* object file type */
+    Elf32_Half    e_machine;     /* machine */
+    Elf32_Word    e_version;     /* object file version */
+    Elf32_Addr    e_entry;       /* virtual entry point */
+    Elf32_Off     e_phoff;       /* program header table offset */
+    Elf32_Off     e_shoff;       /* section header table offset */
+    Elf32_Word    e_flags;       /* processor-specific flags */
+    Elf32_Half    e_ehsize;      /* ELF header size */
+    Elf32_Half    e_phentsize;   /* program header entry size */
+    Elf32_Half    e_phnum;       /* number of program header entries */
+    Elf32_Half    e_shentsize;   /* section header entry size */
+    Elf32_Half    e_shnum;       /* number of section header entries */
+    Elf32_Half    e_shstrndx;    /* section header table's "section
+                                    header string table" entry offset */
+} Elf32_Ehdr;
+
+typedef struct {
+    unsigned char e_ident[EI_NIDENT]; /* Id bytes */
+    Elf64_Half    e_type;        /* file type */
+    Elf64_Half    e_machine;     /* machine type */
+    Elf64_Word    e_version;     /* version number */
+    Elf64_Addr    e_entry;       /* entry point */
+    Elf64_Off     e_phoff;       /* Program hdr offset */
+    Elf64_Off     e_shoff;       /* Section hdr offset */
+    Elf64_Word    e_flags;       /* Processor flags */
+    Elf64_Half    e_ehsize;      /* sizeof ehdr */
+    Elf64_Half    e_phentsize;   /* Program header entry size */
+    Elf64_Half    e_phnum;       /* Number of program headers */
+    Elf64_Half    e_shentsize;   /* Section header entry size */
+    Elf64_Half    e_shnum;       /* Number of section headers */
+    Elf64_Half    e_shstrndx;    /* String table index */
+} Elf64_Ehdr;
+
+/* e_type */
+#define ET_NONE      0           /* No file type */
+#define ET_REL       1           /* relocatable file */
+#define ET_EXEC      2           /* executable file */
+#define ET_DYN       3           /* shared object file */
+#define ET_CORE      4           /* core file */
+#define ET_NUM       5           /* number of types */
+#define ET_LOPROC    0xff00      /* reserved range for processor */
+#define ET_HIPROC    0xffff      /*   specific e_type */
+
+/* e_machine */
+#define EM_NONE      0           /* No Machine */
+#define EM_M32       1           /* AT&T WE 32100 */
+#define EM_SPARC     2           /* SPARC */
+#define EM_386       3           /* Intel 80386 */
+#define EM_68K       4           /* Motorola 68000 */
+#define EM_88K       5           /* Motorola 88000 */
+#define EM_486       6           /* Intel 80486 - unused? */
+#define EM_860       7           /* Intel 80860 */
+#define EM_MIPS      8           /* MIPS R3000 Big-Endian only */
+/*
+ * Don't know if EM_MIPS_RS4_BE,
+ * EM_SPARC64, EM_PARISC,
+ * or EM_PPC are ABI compliant
+ */
+#define EM_MIPS_RS4_BE 10        /* MIPS R4000 Big-Endian */
+#define EM_SPARC64     11        /* SPARC v9 64-bit unoffical */
+#define EM_PARISC      15        /* HPPA */
+#define EM_SPARC32PLUS 18        /* Enhanced instruction set SPARC */
+#define EM_PPC         20        /* PowerPC */
+#define EM_PPC64       21        /* PowerPC 64-bit */
+#define EM_ARM         40        /* Advanced RISC Machines ARM */
+#define EM_ALPHA       41        /* DEC ALPHA */
+#define EM_SPARCV9     43        /* SPARC version 9 */
+#define EM_ALPHA_EXP   0x9026    /* DEC ALPHA */
+#define EM_IA_64       50        /* Intel Merced */
+#define EM_X86_64      62        /* AMD x86-64 architecture */
+#define EM_VAX         75        /* DEC VAX */
+#define EM_AARCH64    183        /* ARM 64-bit */
+
+/* Version */
+#define EV_NONE      0           /* Invalid */
+#define EV_CURRENT   1           /* Current */
+#define EV_NUM       2           /* number of versions */
+
+/* Program Header */
+typedef struct {
+    Elf32_Word    p_type;        /* segment type */
+    Elf32_Off     p_offset;      /* segment offset */
+    Elf32_Addr    p_vaddr;       /* virtual address of segment */
+    Elf32_Addr    p_paddr;       /* physical address - ignored? */
+    Elf32_Word    p_filesz;      /* number of bytes in file for seg. */
+    Elf32_Word    p_memsz;       /* number of bytes in mem. for seg. */
+    Elf32_Word    p_flags;       /* flags */
+    Elf32_Word    p_align;       /* memory alignment */
+} Elf32_Phdr;
+
+typedef struct {
+    Elf64_Word    p_type;        /* entry type */
+    Elf64_Word    p_flags;       /* flags */
+    Elf64_Off     p_offset;      /* offset */
+    Elf64_Addr    p_vaddr;       /* virtual address */
+    Elf64_Addr    p_paddr;       /* physical address */
+    Elf64_Xword   p_filesz;      /* file size */
+    Elf64_Xword   p_memsz;       /* memory size */
+    Elf64_Xword   p_align;       /* memory & file alignment */
+} Elf64_Phdr;
+
+/* Segment types - p_type */
+#define PT_NULL      0           /* unused */
+#define PT_LOAD      1           /* loadable segment */
+#define PT_DYNAMIC   2           /* dynamic linking section */
+#define PT_INTERP    3           /* the RTLD */
+#define PT_NOTE      4           /* auxiliary information */
+#define PT_SHLIB     5           /* reserved - purpose undefined */
+#define PT_PHDR      6           /* program header */
+#define PT_NUM       7           /* Number of segment types */
+#define PT_LOPROC    0x70000000  /* reserved range for processor */
+#define PT_HIPROC    0x7fffffff  /*  specific segment types */
+
+/* Segment flags - p_flags */
+#define PF_X         0x1        /* Executable */
+#define PF_W         0x2        /* Writable */
+#define PF_R         0x4        /* Readable */
+#define PF_MASKPROC  0xf0000000 /* reserved bits for processor */
+                                /*  specific segment flags */
+
+/* Section Header */
+typedef struct {
+    Elf32_Word    sh_name;      /* name - index into section header
+                                   string table section */
+    Elf32_Word    sh_type;      /* type */
+    Elf32_Word    sh_flags;     /* flags */
+    Elf32_Addr    sh_addr;      /* address */
+    Elf32_Off     sh_offset;    /* file offset */
+    Elf32_Word    sh_size;      /* section size */
+    Elf32_Word    sh_link;      /* section header table index link */
+    Elf32_Word    sh_info;      /* extra information */
+    Elf32_Word    sh_addralign; /* address alignment */
+    Elf32_Word    sh_entsize;   /* section entry size */
+} Elf32_Shdr;
+
+typedef struct {
+    Elf64_Word    sh_name;      /* section name */
+    Elf64_Word    sh_type;      /* section type */
+    Elf64_Xword   sh_flags;     /* section flags */
+    Elf64_Addr    sh_addr;      /* virtual address */
+    Elf64_Off     sh_offset;    /* file offset */
+    Elf64_Xword   sh_size;      /* section size */
+    Elf64_Word    sh_link;      /* link to another */
+    Elf64_Word    sh_info;      /* misc info */
+    Elf64_Xword   sh_addralign; /* memory alignment */
+    Elf64_Xword   sh_entsize;   /* table entry size */
+} Elf64_Shdr;
+
+/* sh_type */
+#define SHT_NULL        0       /* inactive */
+#define SHT_PROGBITS    1       /* program defined information */
+#define SHT_SYMTAB      2       /* symbol table section */
+#define SHT_STRTAB      3       /* string table section */
+#define SHT_RELA        4       /* relocation section with addends*/
+#define SHT_HASH        5       /* symbol hash table section */
+#define SHT_DYNAMIC     6       /* dynamic section */
+#define SHT_NOTE        7       /* note section */
+#define SHT_NOBITS      8       /* no space section */
+#define SHT_REL         9       /* relation section without addends */
+#define SHT_SHLIB      10       /* reserved - purpose unknown */
+#define SHT_DYNSYM     11       /* dynamic symbol table section */
+#define SHT_NUM        12       /* number of section types */
+
+/* Note definitions */
+typedef struct {
+    Elf32_Word namesz;
+    Elf32_Word descsz;
+    Elf32_Word type;
+    char data[];
+} Elf32_Note;
+
+typedef struct {
+    Elf64_Word namesz;
+    Elf64_Word descsz;
+    Elf64_Word type;
+    char data[];
+} Elf64_Note;
+
+/* Abstraction layer for handling 32- and 64-bit ELF files. */
+
+typedef union {
+    Elf32_Ehdr e32;
+    Elf64_Ehdr e64;
+} elf_ehdr;
+
+static inline bool elf_is_32bit(elf_ehdr *ehdr)
+{
+    return ehdr->e32.e_ident[EI_CLASS] == ELFCLASS32;
+}
+
+static inline bool elf_is_64bit(elf_ehdr *ehdr)
+{
+    return ehdr->e32.e_ident[EI_CLASS] == ELFCLASS64;
+}
+
+#define ehdr_val(ehdr, elem) (elf_is_32bit(ehdr) ? (ehdr)->e32.elem : (ehdr)->e64.elem)
+
+typedef union {
+    Elf32_Phdr e32;
+    Elf64_Phdr e64;
+} elf_phdr;
+
+#define phdr_val(ehdr, phdr, elem) (elf_is_32bit(ehdr) ? (phdr)->e32.elem : (phdr)->e64.elem)
+
+typedef union {
+    Elf32_Shdr e32;
+    Elf64_Shdr e64;
+} elf_shdr;
+
+#define shdr_val(ehdr, shdr, elem) (elf_is_32bit(ehdr) ? (shdr)->e32.elem : (shdr)->e64.elem)
+
+typedef union {
+    Elf32_Note e32;
+    Elf64_Note e64;
+} elf_note;
+
+#define note_val(ehdr, note, elem) (elf_is_32bit(ehdr) ? (note)->e32.elem : (note)->e64.elem)
+
+static inline void *elf_ptr_add(void *ptr, unsigned long add)
+{
+    return (char *)ptr + add;
+}
+#endif /* __ELF_H__ */
-- 
2.43.0


