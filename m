Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 486046C3860
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 18:35:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512937.793382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peftS-0005eC-OQ; Tue, 21 Mar 2023 17:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512937.793382; Tue, 21 Mar 2023 17:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peftS-0005cS-Ld; Tue, 21 Mar 2023 17:35:30 +0000
Received: by outflank-mailman (input) for mailman id 512937;
 Tue, 21 Mar 2023 17:35:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kq8e=7N=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1peftQ-0003LR-PW
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 17:35:28 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c43538fb-c80e-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 18:35:27 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 66A793200900;
 Tue, 21 Mar 2023 13:35:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 21 Mar 2023 13:35:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 13:35:24 -0400 (EDT)
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
X-Inumbo-ID: c43538fb-c80e-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1679420125; x=1679506525; bh=EdSxOH/DvP
	fgJJdpKCG9kK9DWDf/bTe5jrk5GM6DX40=; b=oAMTJFqdjAJVe440lHv33Iv1gw
	15vWHAcnEn2LkrakwJ2/W/xjrDBPufbAQyl57SAjQUGj2VEpaZiKkxHa5UK9+McI
	hVi3/yWsgNDZN95otrEBEFFhwJo22qzQFd19wQr4PU+wzHsDAa5bP4nDURfOQDNu
	5958WAGKw5GNHYCdnL6mmmT8X3ehuvsagqBtBTV6LzSrVlKJ+LrL0D7rvP4KBwpK
	1sUukX/3wuuFqZtkVHi9bBEIChyFDFYBfD4oGkT/3DzNbDQKO4Y0QoJndzdhn2GM
	q8HfPKfWU4c8M6g1NXKNAQE40EAT2yqNpXUWk26sX3LqraJvE+4cXoCAg2+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679420125; x=
	1679506525; bh=EdSxOH/DvPfgJJdpKCG9kK9DWDf/bTe5jrk5GM6DX40=; b=d
	NIpYlJ4csbB3JuUFQAJGZMX7wbxlZYZnK0PMqmPFZg7Lex6DbCAwgoAZUyE/lV8d
	OXmkELgFS8m2tLQlldlv7mDiT+UucG1U6HE8CS3DDbIBEtCQu3UvaoBlZhl5gsMm
	FV5E0pbzilRJ+EMFJPlglKo5blEliY625uMGIDG5OdtcuYq/zYEU6DcAFigsYkjG
	iQzIUfKSBDTYawtgwjpjD9oTpeuPUzlVXY5+g1TBtuTSqywNFcvswcwKKTvQkkEP
	e5oA3qcwqwJseN9mA2mr78CiaaHJv66B5oCkuJ+QQ86f1+TX41kMA0CL0+8W5ndv
	ApIndtAIUwmswVSOEAPRQ==
X-ME-Sender: <xms:3OoZZKmOrouIrTpTKfaxQtxdvpjofOf9BjOhnmPXZQE1VFKSo28KPw>
    <xme:3OoZZB2wQKfts90pKhTeMMjZdXe3Yd2vjbiUH8HMrw-EajwCxF69lluMxoT-7kqki
    oBHNar4T4s5qas>
X-ME-Received: <xmr:3OoZZIpi4cx_nAyNb0y34ao1z53rmYw6GYU-1H1ucYPBCEFYllFeUVoTgWWodwnRJsOkCjhi8Oc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvueejvefgffevgfdvvdegtedv
    veeiffeileffleevteeifeeviedufeejudduvdenucffohhmrghinhepphihthhhohhnrd
    horhhgpdhinhhtvghlrdgtohhmpdhllhhvmhdrohhrghenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:3OoZZOlcmoKd2b50fBd6wWvrG7Kp74uKFFHkLkmST_kHc5O2e_6uqg>
    <xmx:3OoZZI2pQjwLreNDLhdemj-tKVMvJj5riL_rMtqGDZNp_vbTGpbc-g>
    <xmx:3OoZZFt7maFIatdUSjIMv_GlMEYkWq2MVBITmGO4aT-sj5l2YgMiLg>
    <xmx:3eoZZJl7WpjpbrDkBzGE-p37NjutydYpIakMIY5cfI6C6q9SHycU2Q>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v6 5/5] Automation and CI: Replace git:// and http:// with https://
Date: Tue, 21 Mar 2023 13:33:42 -0400
Message-Id: <d311daf2c5b0b03e8000b3b1ba6a405b19d8c461.1679412247.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679412247.git.demi@invisiblethingslab.com>
References: <cover.1679412247.git.demi@invisiblethingslab.com>
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
 2 files changed, 4 insertions(+), 4 deletions(-)

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
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


