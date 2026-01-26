Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEM1J8Vtd2nCfQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 14:36:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4395988E69
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 14:36:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213711.1524188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkMkc-0003Gh-Tz; Mon, 26 Jan 2026 13:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213711.1524188; Mon, 26 Jan 2026 13:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkMkc-0003Da-Qx; Mon, 26 Jan 2026 13:35:30 +0000
Received: by outflank-mailman (input) for mailman id 1213711;
 Mon, 26 Jan 2026 13:35:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygru=77=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1vkMkb-0003DU-6V
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 13:35:29 +0000
Received: from out28-100.mail.aliyun.com (out28-100.mail.aliyun.com
 [115.124.28.100]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dac7d4c8-fabb-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 14:35:21 +0100 (CET)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.gGHqk0X_1769434515 cluster:ay29) by smtp.aliyun-inc.com;
 Mon, 26 Jan 2026 21:35:16 +0800
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
X-Inumbo-ID: dac7d4c8-fabb-11f0-b15f-2bf370ae4941
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1769434518; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=EUFZPihEfz/fncyKdMh9AsZHIUnCljxK4T+gNK+kZwk=;
	b=gMwNPKSRoWPqvorcUyrIHEplhefn4xaX3686NBbqfptrokbf3WECTxggZ86GW2v1jn2GfbkOxRA2Fzcb7jSHpJM9dnpE0GNcsHyunGg40IO3qg6H3O6fjd9eyhbjoWqjT+Dz4irJkfBsmAH2tRVmiXk1G+aZ0ufu1OpmFKdqWNk=
From: Hou Wenlong <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <jiangshan.ljs@antgroup.com>,
	Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Brian Gerst <brgerst@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Graf <graf@amazon.com>,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	"Xin Li (Intel)" <xin@zytor.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH 0/5] x86/boot: Allow to perform randomization for uncompressed kernel image
Date: Mon, 26 Jan 2026 21:33:50 +0800
Message-Id: <cover.1769434279.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[antgroup.com,quarantine];
	R_DKIM_ALLOW(-0.20)[antgroup.com:s=default];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[antgroup.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,oracle.com,weissschuh.net,gmail.com,linux-foundation.org,amazon.com,roeck-us.net,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:jiangshan.ljs@antgroup.com,m:houwenlong.hwl@antgroup.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:ardb@kernel.org,m:nathan@kernel.org,m:masahiroy@kernel.org,m:vkuznets@redhat.com,m:linux@weissschuh.net,m:brgerst@gmail.com,m:jpoimboe@kernel.org,m:akpm@linux-foundation.org,m:graf@amazon.com,m:joel.granados@kernel.org,m:thuth@redhat.com,m:ubizjak@gmail.com,m:kas@kernel.org,m:pawan.kumar.gupta@linux.intel.com,m:linux@roeck-us.net,m:xin@zytor.com,m:ilpo.jarvinen@linux.intel.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[houwenlong.hwl@antgroup.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[antgroup.com:mid,antgroup.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[houwenlong.hwl@antgroup.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[antgroup.com:+];
	NEURAL_HAM(-0.00)[-0.899];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4395988E69
X-Rspamd-Action: no action

Hi all,

This RFC patch series introduces relocatable uncompressed kernel image,
which is allowed to perform kerenl image virtual address randomization
in 64-bit booting entry instead of decompression phase.

- Background

Currently, kernel image virtual address randomization is only performed
during the decompression phase. However, in certain scenarios, such as
secure container environments (e.g., Kata Containers), to speed up the
boot process, the system may boot directly from an uncompressed kernel
image. In such cases, virtual address randomization cannot be executed.
Although the security enhancement provided by KASLR is limited, there is
still a potential demand to allow uncompressed kernel images to perform
virtual address randomization (for example, future support for x86 PIE).

- Approaches

Currently, the x86 kernel uses static compilation, but it retains
relocation information through the '--emit-relocs' option, which is then
simplified into a relocation table using 'relocs' tool. To enable
virtual address randomization for uncompressed kernel images, relocation
information is required, and there are several possible approaches:

1) Who will perform the randomization:

VMM: The VMM reads vmlinux.relocs after loading vmlinux to perform
randomization. This would require additional modifications to the VMM,
and vmlinux.relocs needs to be packaged when shipping.

Kernel: The kernel performs randomization itself at the kernel
entry point, requiring no modifications to the VMM.

2) relocation information format:

vmlinux.relocs: It only contains the necessary relocation entries and is
simplified, making it small enough. However, it is a format defined
within the kernel that was previously used only internally and is not
part of the ABI.

rela.* sections: It is the standard ELF ABI, but
it contains RIP-relative relocation entries, which are more common in
kernel, causing the kernel image to be larger.

- Implementation

The final implementation of this plan extends the 'relocs' tool to allow
the insertion of relocation information into a reserved section of the
kernel (referencing the MIPS implementation). This enables the reading
of that information and subsequent execution of relocations when booting
directly from an uncompressed kernel. Currently, this implementation is
only available for 64-bit and has been tested with both PVH entry
booting and standard 64-bit Linux entry. And the default reserve size is
1MB for now, which is enough for defconfig.

- TODO

Clean up the decompression KASLR code to allow it to be shared with the
booting phase.


Thanks!

Hou Wenlong (5):
  x86/relocs: Cleanup cmdline options
  x86/relocs: Insert relocations into input file
  x86: Allow to build relocatable uncompressed kernel binary
  x86/boot: Perform virtual address relocation in kernel entry
  x86/boot: Use '.data.relocs' section for performing relocations during
    decompression

 arch/x86/Kconfig                  |  20 ++++++
 arch/x86/Makefile.postlink        |  33 +++++++++
 arch/x86/boot/compressed/Makefile |   6 +-
 arch/x86/boot/compressed/misc.c   |   8 +++
 arch/x86/boot/startup/Makefile    |   1 +
 arch/x86/boot/startup/kaslr.c     | 116 ++++++++++++++++++++++++++++++
 arch/x86/include/asm/setup.h      |   1 +
 arch/x86/kernel/head_64.S         |   7 ++
 arch/x86/kernel/vmlinux.lds.S     |  20 ++++++
 arch/x86/lib/cmdline.c            |   6 ++
 arch/x86/lib/kaslr.c              |   5 ++
 arch/x86/platform/pvh/head.S      |  15 +++-
 arch/x86/tools/relocs.c           |  64 ++++++++++++++---
 arch/x86/tools/relocs.h           |  15 ++--
 arch/x86/tools/relocs_common.c    |  24 ++++---
 15 files changed, 309 insertions(+), 32 deletions(-)
 create mode 100644 arch/x86/Makefile.postlink
 create mode 100644 arch/x86/boot/startup/kaslr.c

--
2.31.1


