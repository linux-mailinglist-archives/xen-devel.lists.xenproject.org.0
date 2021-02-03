Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E41930DFDE
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 17:38:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80965.148630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LAQ-00017n-QZ; Wed, 03 Feb 2021 16:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80965.148630; Wed, 03 Feb 2021 16:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LAQ-00017O-NL; Wed, 03 Feb 2021 16:38:10 +0000
Received: by outflank-mailman (input) for mailman id 80965;
 Wed, 03 Feb 2021 16:38:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0lb=HF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7LAP-000173-36
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 16:38:09 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd182cf8-9d51-4177-81a3-86f0af5b1151;
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
X-Inumbo-ID: fd182cf8-9d51-4177-81a3-86f0af5b1151
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612370288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Cdl5mNz4USjdmiVZYWHZGQb2t50AyQjzwU5oazAcbU=;
  b=OmWhnWsYTi4s+bXterF15k4eg78gDBPWdqOP5SC0mc9ZIGJ5kK5TmNFg
   5dRFWRar/tbwtazPfVTKpM1dEDAA/6Xdarb79d2oVzxZZhZLK1PTGZw+V
   /P4QZqW0X77pF0tefd1HpLRhsMtkAsoAAoA5kXJQf/EIYNMJDtgAPPI9V
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: me/ojDeqZUajc5mFdwnZGF5qZYFlxsh8oUn/YYd6GliaUvfbZ9mLFDAWlXsoKEZzBP5CfP9f1A
 x34qEDIWBK6NMUu2lAG7+xcaQwoOiVBhOxNZmkj68yR1suAH8jp5NGMwALHHHY9MdhsT3PK5n3
 8wFDsAK9Q8OQuai7gVmv1scV1AuMwNMi5zwvfx7pKreXu6vV/eFmAYBpV7wov4JU8LMKY5sfLp
 St+8kv1x+PHnor45aRGMSvLUNqsVY15L5ssV09DT8ij1IVJqdo2zi7BYxN24bI08yqSrg0bWyA
 +1E=
X-SBRS: 4.0
X-MesageID: 36675157
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,398,1602561600"; 
   d="scan'208";a="36675157"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Manuel Bouyer
	<bouyer@netbsd.org>
Subject: [PATCH for-4.15 2/2] libs/foreignmem: Fix/simplify errno handling for map_resource
Date: Wed, 3 Feb 2021 16:37:50 +0000
Message-ID: <20210203163750.7564-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210203163750.7564-1-andrew.cooper3@citrix.com>
References: <20210203163750.7564-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Simplify the FreeBSD logic, and duplicate it for NetBSD as the userpace ABI
appears to be to consistently provide EOPNOTSUPP for missing Xen/Kernel
support.

The Linux logic was contorted in what appears to be a deliberate attempt to
skip the now-deleted logic for the EOPNOTSUPP case.  Simplify it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/libs/foreignmemory/freebsd.c | 4 +---
 tools/libs/foreignmemory/linux.c   | 4 +---
 tools/libs/foreignmemory/netbsd.c  | 3 +++
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/tools/libs/foreignmemory/freebsd.c b/tools/libs/foreignmemory/freebsd.c
index 04bfa806b0..d94ea07862 100644
--- a/tools/libs/foreignmemory/freebsd.c
+++ b/tools/libs/foreignmemory/freebsd.c
@@ -133,9 +133,7 @@ int osdep_xenforeignmemory_map_resource(xenforeignmemory_handle *fmem,
     {
         int saved_errno;
 
-        if ( errno != ENOSYS )
-            ;
-        else
+        if ( errno == ENOSYS )
             errno = EOPNOTSUPP;
 
         if ( fres->addr )
diff --git a/tools/libs/foreignmemory/linux.c b/tools/libs/foreignmemory/linux.c
index 050b9ed3a5..c1f35e2db7 100644
--- a/tools/libs/foreignmemory/linux.c
+++ b/tools/libs/foreignmemory/linux.c
@@ -325,9 +325,7 @@ int osdep_xenforeignmemory_map_resource(
     {
         int saved_errno;
 
-        if ( errno != fmem->unimpl_errno && errno != EOPNOTSUPP )
-            ;
-        else
+        if ( errno == fmem->unimpl_errno )
             errno = EOPNOTSUPP;
 
         if ( fres->addr )
diff --git a/tools/libs/foreignmemory/netbsd.c b/tools/libs/foreignmemory/netbsd.c
index 565682e064..c0b1b8f79d 100644
--- a/tools/libs/foreignmemory/netbsd.c
+++ b/tools/libs/foreignmemory/netbsd.c
@@ -147,6 +147,9 @@ int osdep_xenforeignmemory_map_resource(
     rc = ioctl(fmem->fd, IOCTL_PRIVCMD_MMAP_RESOURCE, &mr);
     if ( rc )
     {
+        if ( errno == ENOSYS )
+            errno = EOPNOTSUPP;
+
         if ( fres->addr )
         {
             int saved_errno = errno;
-- 
2.11.0


