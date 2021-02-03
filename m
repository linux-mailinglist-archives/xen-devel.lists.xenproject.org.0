Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7037630DFDF
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 17:38:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80966.148642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LAW-00019C-2k; Wed, 03 Feb 2021 16:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80966.148642; Wed, 03 Feb 2021 16:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LAV-00018j-VS; Wed, 03 Feb 2021 16:38:15 +0000
Received: by outflank-mailman (input) for mailman id 80966;
 Wed, 03 Feb 2021 16:38:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0lb=HF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7LAT-000173-T2
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 16:38:13 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae9366f3-35f7-471b-8c00-7c2ea9f0712f;
 Wed, 03 Feb 2021 16:38:08 +0000 (UTC)
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
X-Inumbo-ID: ae9366f3-35f7-471b-8c00-7c2ea9f0712f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612370287;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/FFMstEv10Fuz2PT9ZSanWC0I4D6HCLPZ/XglOaxIvs=;
  b=Zvja6IBJWNaVzoIIRLoruVymJU5ikPiSygIOC9IhI3bJHMdqcEIwnoq6
   MvBdleU3S86G+P7jQu67SANOHHenRtYTq081hWrIPcC7kKd8z1NzXQXA1
   HY6aUvT3b5Xs+hRVODEr6h+k+nC37zabxynGNFykKDC0fUO1nsPyV64dl
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PPlo+BQ4IBmPcKqqpQuwqGCHonp1+s7/0podmDR7vHMVbeEjx8zulOhF0QD0srgP+1/T7QtKjX
 /YaiA8nImmzAPiIrbnBH66X1YDp8n7vFzUZNr4ozJF2UJPbis1FktYnubQ7ZyfwWdkC6PvIIby
 kBfUlOQwSk2l5Jbqa4CBBiJzmzAr5KFZIJoQ0J1AUYJDjThOxA+h0XA5XqeioJABxnzdvB5yGx
 ZuBbwlt8gbEhHCSF1HkYAUjsd+ACvLv68MM/alSRIgN1FNZcc3mWlt2Ed/UaVnMrb+IyYOrb1m
 PtI=
X-SBRS: 4.0
X-MesageID: 37815366
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,398,1602561600"; 
   d="scan'208";a="37815366"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Manuel Bouyer
	<bouyer@netbsd.org>
Subject: [PATCH for-4.15 1/2] libs/foreignmem: Drop useless and/or misleading logging
Date: Wed, 3 Feb 2021 16:37:49 +0000
Message-ID: <20210203163750.7564-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These log lines are all in response to single system calls, and do not provide
any information which the immediate caller can't determine themselves.  It is
however exceedinly rude to put junk like this onto stderr, especially as
system call failures are not even error conditions in certain circumstances.

The FreeBSD logging has stale function names in, and solaris shouldn't have
passed code review to start with.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Manuel Bouyer <bouyer@netbsd.org>

The errno constructs in osdep_xenforeignmemory_map_resource() are addressed in
the following patch, to avoid adding complexity to this one.

This reduces the quantity of noise from unit tests, where certain syscall
failures are definitely not errors.
---
 tools/libs/foreignmemory/freebsd.c | 7 ++-----
 tools/libs/foreignmemory/linux.c   | 6 +-----
 tools/libs/foreignmemory/netbsd.c  | 2 --
 tools/libs/foreignmemory/solaris.c | 2 +-
 4 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/tools/libs/foreignmemory/freebsd.c b/tools/libs/foreignmemory/freebsd.c
index 9a2796f0b7..04bfa806b0 100644
--- a/tools/libs/foreignmemory/freebsd.c
+++ b/tools/libs/foreignmemory/freebsd.c
@@ -65,10 +65,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
 
     addr = mmap(addr, num << PAGE_SHIFT, prot, flags | MAP_SHARED, fd, 0);
     if ( addr == MAP_FAILED )
-    {
-        PERROR("xc_map_foreign_bulk: mmap failed");
         return NULL;
-    }
 
     ioctlx.num = num;
     ioctlx.dom = dom;
@@ -80,7 +77,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
     if ( rc < 0 )
     {
         int saved_errno = errno;
-        PERROR("xc_map_foreign_bulk: ioctl failed");
+
         (void)munmap(addr, num << PAGE_SHIFT);
         errno = saved_errno;
         return NULL;
@@ -137,7 +134,7 @@ int osdep_xenforeignmemory_map_resource(xenforeignmemory_handle *fmem,
         int saved_errno;
 
         if ( errno != ENOSYS )
-            PERROR("mmap resource ioctl failed");
+            ;
         else
             errno = EOPNOTSUPP;
 
diff --git a/tools/libs/foreignmemory/linux.c b/tools/libs/foreignmemory/linux.c
index d0eead1196..050b9ed3a5 100644
--- a/tools/libs/foreignmemory/linux.c
+++ b/tools/libs/foreignmemory/linux.c
@@ -171,10 +171,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
     addr = mmap(addr, num << PAGE_SHIFT, prot, flags | MAP_SHARED,
                 fd, 0);
     if ( addr == MAP_FAILED )
-    {
-        PERROR("mmap failed");
         return NULL;
-    }
 
     ioctlx.num = num;
     ioctlx.dom = dom;
@@ -273,7 +270,6 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
     {
         int saved_errno = errno;
 
-        PERROR("ioctl failed");
         (void)munmap(addr, num << PAGE_SHIFT);
         errno = saved_errno;
         return NULL;
@@ -330,7 +326,7 @@ int osdep_xenforeignmemory_map_resource(
         int saved_errno;
 
         if ( errno != fmem->unimpl_errno && errno != EOPNOTSUPP )
-            PERROR("ioctl failed");
+            ;
         else
             errno = EOPNOTSUPP;
 
diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory/netbsd.c
index 4ae60aafdd..565682e064 100644
--- a/tools/libs/foreignmemory/netbsd.c
+++ b/tools/libs/foreignmemory/netbsd.c
@@ -147,8 +147,6 @@ int osdep_xenforeignmemory_map_resource(
     rc = ioctl(fmem->fd, IOCTL_PRIVCMD_MMAP_RESOURCE, &mr);
     if ( rc )
     {
-        PERROR("ioctl failed");
-
         if ( fres->addr )
         {
             int saved_errno = errno;
diff --git a/tools/libs/foreignmemory/solaris.c b/tools/libs/foreignmemory/solaris.c
index ee8aae4fbd..958fb01f6d 100644
--- a/tools/libs/foreignmemory/solaris.c
+++ b/tools/libs/foreignmemory/solaris.c
@@ -83,7 +83,7 @@ void *osdep_map_foreign_batch(xenforeignmem_handle *fmem, uint32_t dom,
     if ( ioctl(fd, IOCTL_PRIVCMD_MMAPBATCH, &ioctlx) < 0 )
     {
         int saved_errno = errno;
-        PERROR("XXXXXXXX");
+
         (void)munmap(addr, num*XC_PAGE_SIZE);
         errno = saved_errno;
         return NULL;
-- 
2.11.0


