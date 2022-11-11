Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425CF62593F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 12:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442457.696632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otS7Q-0001kh-KV; Fri, 11 Nov 2022 11:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442457.696632; Fri, 11 Nov 2022 11:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otS7Q-0001hz-HW; Fri, 11 Nov 2022 11:22:44 +0000
Received: by outflank-mailman (input) for mailman id 442457;
 Fri, 11 Nov 2022 11:22:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FoG2=3L=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1otS7O-0001Qu-W8
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 11:22:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 282bbb6c-61b3-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 12:22:42 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADBE623A;
 Fri, 11 Nov 2022 03:22:47 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 66DE33F73D;
 Fri, 11 Nov 2022 03:22:30 -0800 (PST)
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
X-Inumbo-ID: 282bbb6c-61b3-11ed-8fd2-01056ac49cbb
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Nathan Studer <nathan.studer@dornerworks.com>,
	Stewart Hildebrand <stewart@stew.dk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tim Deegan <tim@xen.org>,
	Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Meng Xu <mengxu@cis.upenn.edu>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: [PATCH 1/3] CHANGELOG: Update link for RELEASE-4.16.0
Date: Fri, 11 Nov 2022 19:22:06 +0800
Message-Id: <20221111112208.451449-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111112208.451449-1-Henry.Wang@arm.com>
References: <20221111112208.451449-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 CHANGELOG.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5e4bae5f35..adbbb216fa 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,7 +18,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Removed / support downgraded
  - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap" command line options
 
-## [4.16.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - 2021-12-02
+## [4.16.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.16.0) - 2021-12-02
 
 ### Removed
  - XENSTORED_ROOTDIR environment variable from configuartion files and
-- 
2.25.1


