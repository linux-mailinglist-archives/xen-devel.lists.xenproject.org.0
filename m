Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1BD697B7A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 13:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495922.766366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGay-00054K-6v; Wed, 15 Feb 2023 12:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495922.766366; Wed, 15 Feb 2023 12:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGay-00050y-1g; Wed, 15 Feb 2023 12:09:08 +0000
Received: by outflank-mailman (input) for mailman id 495922;
 Wed, 15 Feb 2023 12:09:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LhbV=6L=citrix.com=prvs=4037f5ffb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pSGUg-0002d9-A9
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 12:02:38 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a27f1be6-ad28-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 13:02:37 +0100 (CET)
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
X-Inumbo-ID: a27f1be6-ad28-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676462556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IenDCD+TXqlMxzZ7mL5x9hvul10g7klkJWhyIR23RNo=;
  b=ZUS98OAzysmPlnhokVDH4/ZqvkY8RctRZly72nr5kox8EsECo/Teglns
   T8nl+ezd5s9Y+4/hD4LJETlof5tyepqqvYjHM17+o2RPYZAGaJpPK6pxE
   42h9ddl1lrSvqlAameFrw1VxztMhzhawi8hIfa3k0mSjOYsp5eH0VRrbL
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 99550725
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:CmlkTKmkNiXIi6jGITPgWGPo5gyuJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYDzqBafjfNzfxe9F1YdvnpE4Ov5PSm9BnTQpq/CkwHyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5QKGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 e48OW8OakG8vcCV8uykVORog/QcffC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthfJ+
 z+eoD6kav0cHMyz9DmGw1H2vc6MnA/FSo0UEpCS+dc/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JbGvc27wylwaPO7wGUQGMDS1Zpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhqgGqy89G3of3JPdClbOHFCFFFeizX+nG0tpgDrX4lgFP+KtP/WK2/v3
 T2OqRgB1oxG2KbnyJ6H1VzAhjutoL3AQQg0+hjbUwqZ0+9pWGK2T9f2sAaGtJ6sOK7cFwDc5
 yZcx6By+chUVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romxezO
 yc/WisLvve/2UdGi4ctO+pd7Ox0pZUM7fy/CpjpgiNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FLpj3XCdEU/U9nGDeqwIhPVkDnHhWKYT7H82T8vha+eDGOC79pUktbjNikdzVHIvb+V6Io
 r6zxuOByglFUf2WX8Uk2dd7ELz+FlBiXcqeg5UOJoa+zv9ORDlJ5wn5nelwJOSIXs19yo/1w
 51KchMAlwCl3yeacl3ih7IKQOqHYKuTZEkTZUQEVWtEEVB8CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:it5cVaugjlEjrtnGAkHrLI4m7skDSdV00zEX/kB9WHVpmwKj5r
 mTdZUgpGfJYVMqMk3I9urwXZVoLUmsl6KdpLNhXotKPzOGhILLFvAH0WKK+VSJcBEWtNQ86U
 4KSdkYNDSfNykdsS842mWF+hQbreVvPJrGuQ4W9RlQcT0=
X-IronPort-AV: E=Sophos;i="5.97,299,1669093200"; 
   d="scan'208";a="99550725"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 2/4] automation: Ignore package authentification issue in Jessie container
Date: Wed, 15 Feb 2023 12:02:06 +0000
Message-ID: <20230215120208.35807-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230215120208.35807-1-anthony.perard@citrix.com>
References: <20230215120208.35807-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We can't easily install package on Debian Jessie anymore, the release
keys seems to have expired without a way to get new ones. We have
these warning:
    W: GPG error: http://deb.debian.org jessie-updates InRelease: The following signatures were invalid: KEYEXPIRED 1668891673
    W: GPG error: http://deb.debian.org jessie Release: The following signatures were invalid: KEYEXPIRED 1668891673

So, from now on, ignore the warning and force the installation of
packages that can't be authenticated.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Or, we could just not test on Jessie anymore.
---
 automation/build/debian/jessie-i386.dockerfile | 2 ++
 automation/build/debian/jessie.dockerfile      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/automation/build/debian/jessie-i386.dockerfile b/automation/build/debian/jessie-i386.dockerfile
index 3f86d91f63..c617b6fbfb 100644
--- a/automation/build/debian/jessie-i386.dockerfile
+++ b/automation/build/debian/jessie-i386.dockerfile
@@ -13,6 +13,8 @@ ENTRYPOINT ["linux32"]
 # build depends
 RUN apt-get update && \
     apt-get --quiet --yes install \
+        # WARNING! Force installation to ignore expired release key
+        --force-yes \
         build-essential \
         zlib1g-dev \
         libncurses5-dev \
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 2f19adcad3..8918b26d75 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -11,6 +11,8 @@ WORKDIR /build
 # build depends
 RUN apt-get update && \
     apt-get --quiet --yes install \
+        # WARNING! Force installation to ignore expired release key
+        --force-yes \
         build-essential \
         zlib1g-dev \
         libncurses5-dev \
-- 
Anthony PERARD


