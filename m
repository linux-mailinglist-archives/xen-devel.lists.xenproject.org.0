Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB7A2604FA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 21:00:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFMNf-0001fv-4v; Mon, 07 Sep 2020 19:00:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGN5=CQ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kFMNe-0001fo-74
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 19:00:42 +0000
X-Inumbo-ID: 57360c6e-177f-4993-b26f-45df74ffc041
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57360c6e-177f-4993-b26f-45df74ffc041;
 Mon, 07 Sep 2020 19:00:40 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 087J0eCJ028417
 for <xen-devel@lists.xenproject.org>; Mon, 7 Sep 2020 13:00:40 -0600
Received-SPF: neutral (ame7.swcp.com: 62.251.112.184 is neither permitted nor
 denied by domain of hudson@trmm.net) receiver=ame7.swcp.com;
 client-ip=62.251.112.184; helo=diamond.fritz.box;
 envelope-from=hudson@trmm.net;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.10; 
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 087J0RtL061615
 for <xen-devel@lists.xenproject.org>; Mon, 7 Sep 2020 13:00:35 -0600 (MDT)
 (envelope-from hudson@trmm.net)
X-Authentication-Warning: ame7.swcp.com: Host 62-251-112-184.ip.xs4all.nl
 [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 1/4] x86/xen.lds.S: Work around binutils build id alignment
 bug
Date: Mon,  7 Sep 2020 15:00:24 -0400
Message-Id: <20200907190027.669086-2-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907190027.669086-1-hudson@trmm.net>
References: <20200907190027.669086-1-hudson@trmm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.83
X-Greylist: Message whitelisted by DRAC access database, not delayed by
 milter-greylist-4.6.2 (ame7.swcp.com [216.184.2.128]);
 Mon, 07 Sep 2020 13:00:35 -0600 (MDT)
X-Virus-Scanned: clamav-milter 0.100.2 at ame7
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ame7.swcp.com
X-Spam-Status: No, hits=0.7 tests=NO_RECEIVED,NO_RELAYS,SPF_NEUTRAL
 version=3.4.2
X-Spam-Level: 
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Trammell hudson <hudson@trmm.net>

binutils in most distrbutions have a bug in find_section_by_vma()
that causes objcopy round section addresses incorrectly and that
think the .buildid section overlaps with the .rodata.  Aligning the
sections allows these older verisons of the tools to work on the
xen.efi executable image.

Mailing list discussion: https://sourceware.org/pipermail/binutils/2020-August/112746.html

Fixed in: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=610ed3e08f13b3886fd7194fb7a248dee8724685

Signed-off-by: Trammell hudson <hudson@trmm.net>
---
 xen/arch/x86/xen.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 0273f79152..ba691b1890 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -156,6 +156,7 @@ SECTIONS
        __note_gnu_build_id_end = .;
   } :note :text
 #elif defined(BUILD_ID_EFI)
+  . = ALIGN(32); /* workaround binutils section overlap bug */
   DECL_SECTION(.buildid) {
        __note_gnu_build_id_start = .;
        *(.buildid)
-- 
2.25.1


