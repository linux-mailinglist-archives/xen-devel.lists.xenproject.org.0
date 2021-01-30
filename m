Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FEA30916C
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 03:00:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78622.143106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5fYN-0002Vd-Nx; Sat, 30 Jan 2021 01:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78622.143106; Sat, 30 Jan 2021 01:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5fYN-0002VE-Kh; Sat, 30 Jan 2021 01:59:59 +0000
Received: by outflank-mailman (input) for mailman id 78622;
 Sat, 30 Jan 2021 01:59:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UkB/=HB=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1l5fYM-0002V6-3r
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 01:59:58 +0000
Received: from MTA-13-3.privateemail.com (unknown [198.54.118.204])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57e428bb-bf56-472e-a33c-955c6c65ff45;
 Sat, 30 Jan 2021 01:59:57 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 67F72800E2;
 Fri, 29 Jan 2021 20:59:56 -0500 (EST)
Received: from drt-xps-ubuntu.lan (unknown [10.20.151.217])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 63B58800DC;
 Sat, 30 Jan 2021 01:59:55 +0000 (UTC)
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
X-Inumbo-ID: 57e428bb-bf56-472e-a33c-955c6c65ff45
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/debug: fix page-overflow bug in dbg_rw_guest_mem
Date: Fri, 29 Jan 2021 20:59:53 -0500
Message-Id: <caba05850df644814d75d5de0574c62ce90e8789.1611971959.git.tamas@tklengyel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

When using gdbsx dbg_rw_guest_mem is used to read/write guest memory. When the
buffer being accessed is on a page-boundary, the next page needs to be grabbed
to access the correct memory for the buffer's overflown parts. While
dbg_rw_guest_mem has logic to handle that, it broke with 229492e210a. Instead
of grabbing the next page the code right now is looping back to the
start of the first page. This results in errors like the following while trying
to use gdb with Linux' lx-dmesg:

[    0.114457] PM: hibernation: Registered nosave memory: [mem
0xfdfff000-0xffffffff]
[    0.114460] [mem 0x90000000-0xfbffffff] available for PCI demem 0
[    0.114462] f]f]
Python Exception <class 'ValueError'> embedded null character:
Error occurred in Python: embedded null character

Fixing this bug by taking the variable assignment outside the loop.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/debug.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
index 4356039ed2..f32d4b0bcc 100644
--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/debug.c
@@ -112,10 +112,11 @@ static unsigned int dbg_rw_guest_mem(struct domain *dp, void * __user gaddr,
                                      void * __user buf, unsigned int len,
                                      bool toaddr, uint64_t pgd3)
 {
+    unsigned long addr = (unsigned long)gaddr;
+
     while ( len > 0 )
     {
         char *va;
-        unsigned long addr = (unsigned long)gaddr;
         mfn_t mfn;
         gfn_t gfn = INVALID_GFN;
         unsigned long pagecnt;
-- 
2.27.0


