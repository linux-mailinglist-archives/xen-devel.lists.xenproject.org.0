Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9251DA0BD
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 21:11:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7e8-00087K-MM; Tue, 19 May 2020 19:11:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7e7-00086U-Lp
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:11:23 +0000
X-Inumbo-ID: 64302fb6-9a04-11ea-b9cf-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64302fb6-9a04-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 19:10:24 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Vi-0001da-1j; Tue, 19 May 2020 20:02:42 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 23/38] Honour DebianImageFile_SUITE_ARCH
Date: Tue, 19 May 2020 20:02:15 +0100
Message-Id: <20200519190230.29519-24-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
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

This lets us specify the whole filename, not just a version.
This is needed because for buster we are going to use
   debian-10.2.0-ARCH-xfce-CD-1.iso

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 mfi-common | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mfi-common b/mfi-common
index b40f057e..640cf328 100644
--- a/mfi-common
+++ b/mfi-common
@@ -522,6 +522,15 @@ job_create_test () {
 
 usual_debianhvm_image () {
   local arch=$1; shift
+  if [ -n "$DEBIAN_IMAGE_FILE" ]; then
+      echo $DEBIAN_IMAGE_FILE
+      return
+  fi
+  local file=`getconfig DebianImageFile_${guestsuite}_${arch}`
+  if [ -n "$file " ]; then
+      echo $file
+      return
+  fi
   local ver=$DEBIAN_IMAGE_VERSION
   if [ -z "$ver" ] ; then
       ver=`getconfig DebianImageVersion_$guestsuite`
-- 
2.20.1


