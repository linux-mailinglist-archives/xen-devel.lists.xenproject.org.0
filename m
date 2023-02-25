Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118C56A2BB4
	for <lists+xen-devel@lfdr.de>; Sat, 25 Feb 2023 21:38:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501880.773719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW1Iw-0000qf-SO; Sat, 25 Feb 2023 20:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501880.773719; Sat, 25 Feb 2023 20:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW1Iw-0000nA-OF; Sat, 25 Feb 2023 20:38:02 +0000
Received: by outflank-mailman (input) for mailman id 501880;
 Sat, 25 Feb 2023 20:38:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wch7=6V=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pW1Iv-0007yc-Kw
 for xen-devel@lists.xenproject.org; Sat, 25 Feb 2023 20:38:01 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a402e81-b54c-11ed-a82a-c9ca1d2f71af;
 Sat, 25 Feb 2023 21:37:59 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 806CA320027A;
 Sat, 25 Feb 2023 15:37:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 25 Feb 2023 15:37:58 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Feb 2023 15:37:56 -0500 (EST)
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
X-Inumbo-ID: 4a402e81-b54c-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1677357477; x=1677443877; bh=aeHQ0E9NgzibaZKiBNAkgq+kKk4grLArxug
	vf6LHwOg=; b=D6N1DVw74iEbjkNOvY2tQon8e7KjPb/cJNu/aVwlZ75ZCzkiLW0
	2+94ASDCQZSRTD5JQcUX7H5YouCHLbFdqwct3iLrFezVQxcJSx1htoSFTadmszec
	KLU/gwAV3M0KZOa8QwuB6WEeplmPzpLUJ9/Sa+EZTv7bJ6RgjsR456KaB9wGTb+j
	hvWbcewzbLcwxs8K5F6JAwkXNPXhDmsI+jJkj243AjQ2x4/wHYRDUTK8KlviwJZB
	kW1z5mevFOuJSomWpXudNqjrl+oxNhJvvK/62jpchQRKKDPlUF4fgTq0eaY7zqVL
	Mjna/9HruhbeoyJ9rPmgRN4sgw2U0vtLLmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677357477; x=1677443877; bh=aeHQ0E9Ngziba
	ZKiBNAkgq+kKk4grLArxugvf6LHwOg=; b=m0jDBj19PfIQ6V2R7GErPlwkEJzi8
	dpTq9O4poS7zCXRu9SFMWC5Fc2KrvID8OhrSMIB+7Z0nmQFgJuV1LHZzWkMr6Efv
	MJUY1LZhMYKOkHsmuelUSPeY2Yq4lAgGZHXwbjUHvkzV9BgD+UIqrb9KMvWe1/O7
	4B9pzA+CvnCWzkjIOPUygFkqRuPfWTNmsTPbehNlkl4z7bQKywA8YYQtKRi835Mf
	NpidjeSZDhiIpecFBTpTTo+w3EyOmvcGacNMqzqq+wJilmRqEntQd614QTs0ksM6
	FU5oppYRWjRSd68lKtpAvRN2SbORB3KTdAyFTe3nz035OAmSz76ayoJdA==
X-ME-Sender: <xms:pHH6Y1SuKj15ZvmjSkXrrAcDDrSPRNpR_vckfWis8MFApvE3kAG0LA>
    <xme:pHH6Y-zNMTkonTZDycmgdxiQyt3O7ifeRrjSiw5rKz7h-f66L_bY9dOuydyIbDALn
    L25gsFyYky3WCc>
X-ME-Received: <xmr:pHH6Y60NJ46JqOhV5FByDAU2zO0jjK8pc1dS7UW-S9icPZT2M818CM_IRiMSW-RJ_-UEywOYSkk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekiedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteffheeiudduhefhffeigfegiedv
    leehhfdtvdduhffhudelkeefvdduueejkeevnecuffhomhgrihhnpehphihthhhonhdroh
    hrghdpihhnthgvlhdrtghomhdplhhlvhhmrdhorhhgpdguvggsihgrnhdrohhrghdprghl
    phhinhgvlhhinhhugidrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhm
X-ME-Proxy: <xmx:pXH6Y9CsSYNI4KXqgdnIxEexUmvDp2gDlP3lsfzSm6L6qEBitUwP3w>
    <xmx:pXH6Y-g4pQPNbKogp7MMfv540WbRLqbJHfuK-POE5T_7RcOrlqfP-Q>
    <xmx:pXH6YxpHQCXlKddf1wNAjEPQLIDilcHpuJ3mEFEh29LxKxqEUQI_9g>
    <xmx:pXH6YyirmqosGMM05n__POHVG6XP7sag9apAWoBdn7TbbfNO1ic96Q>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v5 5/5] Automation and CI: Replace git:// and http:// with https://
Date: Sat, 25 Feb 2023 15:37:15 -0500
Message-Id: <8ca85b30b903512fc07e95cf4e07ea4b0623ba99.1677356813.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1677356813.git.demi@invisiblethingslab.com>
References: <cover.1677356813.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtaining code over an insecure transport is a terrible idea for
blatently obvious reasons.  Even for non-executable data, insecure
transports are considered deprecated.

This patch enforces the use of secure transports in automation and CI.
All URLs are known to work.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 README                                      | 4 ++--
 automation/build/debian/stretch-llvm-8.list | 4 ++--
 automation/scripts/qemu-smoke-dom0-arm32.sh | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/README b/README
index 755b3d8eaf8f7a58a945b7594e68a3fe455a7bdf..f8cc426f78d690f37e013242e81d4e440556c330 100644
--- a/README
+++ b/README
@@ -181,7 +181,7 @@ Python Runtime Libraries
 Various tools, such as pygrub, have the following runtime dependencies:
 
     * Python 2.6 or later.
-          URL:    http://www.python.org/
+          URL:    https://www.python.org/
           Debian: python
 
 Note that the build system expects `python` to be available. If your system
@@ -197,7 +197,7 @@ Intel(R) Trusted Execution Technology Support
 Intel's technology for safer computing, Intel(R) Trusted Execution Technology
 (Intel(R) TXT), defines platform-level enhancements that provide the building
 blocks for creating trusted platforms.  For more information, see
-http://www.intel.com/technology/security/.
+https://www.intel.com/technology/security/.
 
 Intel(R) TXT support is provided by the Trusted Boot (tboot) module in
 conjunction with minimal logic in the Xen hypervisor.
diff --git a/automation/build/debian/stretch-llvm-8.list b/automation/build/debian/stretch-llvm-8.list
index 09fe843fb2a31ae38f752d7c8c71cf97f5b14513..590001ca81e826ab624ba9185423adf4b0c51a21 100644
--- a/automation/build/debian/stretch-llvm-8.list
+++ b/automation/build/debian/stretch-llvm-8.list
@@ -1,3 +1,3 @@
 # Strech LLVM 8 repos
-deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
-deb-src http://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
+deb https://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
+deb-src https://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index 98e4d481f65c2b29ac935ddf6247132ddf94fa1d..950ad3a0daa63d66fc8647c0a390ff59c2f22b1a 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -4,7 +4,7 @@ set -ex
 
 cd binaries
 # Use the kernel from Debian
-curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
+curl --fail --silent --show-error --location --output vmlinuz https://ftp.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
 # Use a tiny initrd based on busybox from Alpine Linux
 curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

