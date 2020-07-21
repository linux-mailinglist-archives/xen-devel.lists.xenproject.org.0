Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FCD227EA8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 13:21:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxqJx-0001zr-Py; Tue, 21 Jul 2020 11:20:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gK6X=BA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxqJv-0001zm-RF
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 11:20:27 +0000
X-Inumbo-ID: 2d1153e0-cb44-11ea-a0a0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d1153e0-cb44-11ea-a0a0-12813bfff9fa;
 Tue, 21 Jul 2020 11:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595330427;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q06uvYXZcjVkQV0AJJoSUyhD9oUjaHROy1XDVILX0TQ=;
 b=KOiMS6UH6ZT8pduSqq9zHe8meH7JJp6vMlYtl9WXECtPnyy0pJWKK70I
 5XS3dA+qECj+vmOafYeMBJTE9AB536A1pprvExVMrQnv97hnwr9lJhTie
 jLpdr+HspSJ8O04K+S9Z7xyffQss5BDSUUj4Py/QmcbtDlVcNZVKpI7x6 g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NusP+3WfHagKGzXDD04jPhhmSSh74RMZ2QVcqVKFtJCO7zCjSRQ+w5PEodj6YXcT6nI5Y5kly6
 x8ISrYcb0RajELKA5YEYWQaqj3kuVDbBROK615lnwhVDS45JBG5827YrE/G8iIx4MEb33uQiex
 DkbZlSQ2fguVtL+R+jGBIROiXm1SKO2EeD0oi145/7UwY6qiwatHS8QrpRqpYnjEURIJ9mh3sF
 oX7+88iCOa8Eh7oHWAwP4imSfzJXMgQYjTd74H3HxcjCDoUlSm5UBApPLf9ylneoj94/+pr4yZ
 l3g=
X-SBRS: 2.7
X-MesageID: 23025163
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,378,1589256000"; d="scan'208";a="23025163"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [osstest PATCH] freebsd: remove freebsd- hostflags request from guest
 tests
Date: Tue, 21 Jul 2020 13:20:16 +0200
Message-ID: <20200721112016.30133-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: ian.jackson@eu.citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Guest tests shouldn't care about the capabilities or firmware of the
underlying hosts, so drop the request of specific freebsd-<version>
hostflags for FreeBSD guest tests.

While there request the presence of the hvm hostflag since the FreeBSD
guest tests are run in HVM mode.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 make-flight | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/make-flight b/make-flight
index b8942c1c..2ea9ad29 100755
--- a/make-flight
+++ b/make-flight
@@ -241,7 +241,7 @@ do_freebsd_tests () {
       job_create_test test-$xenarch$kern-$dom0arch$qemuu_suffix-freebsd10-$freebsdarch \
                       test-freebsd xl $xenarch $dom0arch freebsd_arch=$freebsdarch \
  freebsd_image=${FREEBSD_IMAGE_PREFIX-FreeBSD-10.1-CUSTOM-}$freebsdarch${FREEBSD_IMAGE_SUFFIX--20150525.raw.xz} \
-                      all_hostflags=$most_hostflags,freebsd-10
+                      all_hostflags=$most_hostflags,hvm
     done
     return
   fi
@@ -251,11 +251,11 @@ do_freebsd_tests () {
     job_create_test test-$xenarch$kern-$dom0arch$qemuu_suffix-freebsd11-$freebsdarch \
                     test-freebsd xl $xenarch $dom0arch freebsd_arch=$freebsdarch \
  freebsd_image=${FREEBSD_IMAGE_PREFIX-FreeBSD-11.3-RELEASE-}$freebsdarch${FREEBSD_IMAGE_SUFFIX-.raw.xz} \
-                    all_hostflags=$most_hostflags,freebsd-11
+                    all_hostflags=$most_hostflags,hvm
     job_create_test test-$xenarch$kern-$dom0arch$qemuu_suffix-freebsd12-$freebsdarch \
                     test-freebsd xl $xenarch $dom0arch freebsd_arch=$freebsdarch \
  freebsd_image=${FREEBSD_IMAGE_PREFIX-FreeBSD-12.1-RELEASE-}$freebsdarch${FREEBSD_IMAGE_SUFFIX-.raw.xz} \
-                    all_hostflags=$most_hostflags,freebsd-12
+                    all_hostflags=$most_hostflags,hvm
   done
 }
 
-- 
2.27.0


