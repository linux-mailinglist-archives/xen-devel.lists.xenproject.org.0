Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F70F28DDE5
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 11:45:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6513.17364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSdKn-00070J-39; Wed, 14 Oct 2020 09:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6513.17364; Wed, 14 Oct 2020 09:44:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSdKm-0006zu-Vy; Wed, 14 Oct 2020 09:44:36 +0000
Received: by outflank-mailman (input) for mailman id 6513;
 Wed, 14 Oct 2020 09:44:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0aJ9=DV=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kSdKl-0006zp-BG
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 09:44:35 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4709c071-a606-4c8e-af65-8719d2203dbd;
 Wed, 14 Oct 2020 09:44:32 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.2.1 DYNA|AUTH)
 with ESMTPSA id e003b5w9E9iQnCc
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 14 Oct 2020 11:44:26 +0200 (CEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0aJ9=DV=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kSdKl-0006zp-BG
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 09:44:35 +0000
X-Inumbo-ID: 4709c071-a606-4c8e-af65-8719d2203dbd
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.24])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4709c071-a606-4c8e-af65-8719d2203dbd;
	Wed, 14 Oct 2020 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1602668671;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
	Subject:Sender;
	bh=fe6M6lgrfnf/4gKNSLiJl7iE+2lMWhoUMMKrcJogwPo=;
	b=K5cxlUvJVCdf5BZpsLGmioZmgTmrQco/gZAS9f+ihzSi7AaW0l+/xl2YbdFD9WUEVG
	QOai55sN7jsW6oXw7AnbU96RyMY0cm843LkvxmvO8yWmPNbwIYYo0UsoWNRjEXwHR72k
	Wd3upn5vyvk/MyEfEv4yPiXzoRph8Vmft3vjZ71iBkHj47xSspiNkGgCsYUHRj998fmf
	3H8+jvsl8Tvq+HsdsjixPZq1XjVgpFlhvxpIDML9gcQt1WCz1zGHbuZ7W8CMAS57mMoF
	zXrsN+SA/o1x9tWmcCzd5/PE7cMfNkLE6O7lMQ42I8xY0G/vfkGTJ0use0qTnLxe8+Bl
	ur4Q==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.2.1 DYNA|AUTH)
	with ESMTPSA id e003b5w9E9iQnCc
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Wed, 14 Oct 2020 11:44:26 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1] tools/libs: remove obsolete xc_map_foreign_bulk from error string
Date: Wed, 14 Oct 2020 11:44:22 +0200
Message-Id: <20201014094422.19347-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xc_map_foreign_bulk is an obsolete API, which is only used by
qemu-xen-traditional.

Adjust the error string to refer to the current API.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/foreignmemory/freebsd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/foreignmemory/freebsd.c b/tools/libs/foreignmemory/freebsd.c
index 6e6bc4b11f..60bc87f530 100644
--- a/tools/libs/foreignmemory/freebsd.c
+++ b/tools/libs/foreignmemory/freebsd.c
@@ -66,7 +66,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
     addr = mmap(addr, num << PAGE_SHIFT, prot, flags | MAP_SHARED, fd, 0);
     if ( addr == MAP_FAILED )
     {
-        PERROR("xc_map_foreign_bulk: mmap failed");
+        PERROR("xenforeignmemory_map: mmap failed");
         return NULL;
     }
 
@@ -80,7 +80,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
     if ( rc < 0 )
     {
         int saved_errno = errno;
-        PERROR("xc_map_foreign_bulk: ioctl failed");
+        PERROR("xenforeignmemory_map: ioctl failed");
         (void)munmap(addr, num << PAGE_SHIFT);
         errno = saved_errno;
         return NULL;

