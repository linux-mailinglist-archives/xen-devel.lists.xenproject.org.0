Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE8C1E7C0A
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:35:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedIJ-0003DJ-Ff; Fri, 29 May 2020 11:35:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedIH-0003By-Ss
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:35:21 +0000
X-Inumbo-ID: 539bf114-a1a0-11ea-9dbe-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 539bf114-a1a0-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 11:34:16 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3a-0003xZ-Kc; Fri, 29 May 2020 12:20:10 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 45/49] setupboot_grub2: Recognise --nounzip for
 initramfs
Date: Fri, 29 May 2020 12:19:41 +0100
Message-Id: <20200529111945.21394-46-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Modern versions of update-grub like to add this.  We need to spot this
so that under EFI we generate the right things in xen.cfg.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 615047cb..de53c1ac 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -551,7 +551,7 @@ sub setupboot_grub2 ($$$$) {
                 $entry->{KernVer}= $2;
                 $entry->{KernOpts}= $3;
             }
-            if (m/^\s*module2?\s+(?:\/boot)?\/(initrd\S+)/) {
+            if (m/^\s*module2?\s+(?:--nounzip\s+)*(?:\/boot)?\/(initrd\S+)/) {
                 $entry->{Initrd}= $1;
             }
 	    if (m/^\s*module2?\s*\/(xenpolicy\S+)/) {
-- 
2.20.1


