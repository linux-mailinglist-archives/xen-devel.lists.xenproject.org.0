Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFA0697B7C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 13:09:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495925.766389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGb4-0005iu-R2; Wed, 15 Feb 2023 12:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495925.766389; Wed, 15 Feb 2023 12:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSGb4-0005gG-NR; Wed, 15 Feb 2023 12:09:14 +0000
Received: by outflank-mailman (input) for mailman id 495925;
 Wed, 15 Feb 2023 12:09:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LhbV=6L=citrix.com=prvs=4037f5ffb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pSGUh-0002d9-F0
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 12:02:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a42d2439-ad28-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 13:02:38 +0100 (CET)
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
X-Inumbo-ID: a42d2439-ad28-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676462558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9wHKZykfWSUq/3k4JKcCvIqxoN2TE4/5/U+7meTLwCo=;
  b=D2Ear6LoM6CSGkmM0X13I28VizObGgCincD71eZTYGlXU+pmCGw6MVZX
   4nqK+d+l235PSVL67NmTFPMyFsmTTc6tD9trBZRDNO/ISrNSd+XGq3gXX
   sYGwhiSgX0w48Mi5qgHq3RlDz/TMI9s0Z/9ar0/iyKPf7IChM7RxlJbhm
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 99550726
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:VNORwa6eaakAH5J93igsWwxRtBfHchMFZxGqfqrLsTDasY5as4F+v
 jBOXDqGPauINmTxKNlzPoi0pxwPsZ7QyYU1SgFl/HphHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoS4QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 9gJdzMJPy+5pcGEnq2lR+1ptvtyFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9zxfF+
 zqZpTqR7hcyEf+E4xyM6nWQpebNuXn6QYQwD7m936s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9FZCeE95SmGw7DY5AvfDW8BJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8bnDbeEdVnQZGPrP7HRy7uz
 jSPnBdvvuBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWWyC
 KMwkVkLjHO2AJdMRfUvC25WI5pC8EQYPY65Ps04l/IXCnSLSCeJ/Tt1eWmb1H33nU4nnMkXY
 MnEL539XChAWP43llJaotvxN5dxnkjSIkuJGPjGI+mPi+LCNBZ5t59bWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDjtr/qOYuwaQxBSFjX/je8pUHHtNv1yI6QAnN/deNm+J+E2Gk9owJ/tr1E
 oaVBhcHkgCl3yCccW1nqBlLMdvSYHq2llpjVQREALpi8ydLjVqHhEvHS6YKQA==
IronPort-HdrOrdr: A9a23:p1uNsq+0eO/YHcYejrxuk+DnI+orL9Y04lQ7vn2ZhyYlC/Bw9v
 re5MjzsCWftN9/YgBEpTntAtjjfZqYz+8X3WBzB9aftWvdyQ+VxehZhOOI/9SjIU3DH4VmpM
 BdmsZFebvN5JtB4foSIjPULz/t+ra6GWmT69vj8w==
X-IronPort-AV: E=Sophos;i="5.97,299,1669093200"; 
   d="scan'208";a="99550726"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 3/4] automation: Remove expired root certificates used to be used by let's encrypt
Date: Wed, 15 Feb 2023 12:02:07 +0000
Message-ID: <20230215120208.35807-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230215120208.35807-1-anthony.perard@citrix.com>
References: <20230215120208.35807-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

While the Let's Encrypt root certificate ISRG_Root_X1.crt is already
present, openssl seems to still check for the root certificate
DST_Root_CA_X3.crt which has expired. This prevent https connections.

Removing DST_Root_CA_X3 fix the issue.

centos: found the filter by looking for "DST Root" in `trust list`.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/build/centos/7.2.dockerfile         | 5 +++++
 automation/build/centos/7.dockerfile           | 5 +++++
 automation/build/debian/jessie-i386.dockerfile | 5 +++++
 automation/build/debian/jessie.dockerfile      | 5 +++++
 automation/build/ubuntu/trusty.dockerfile      | 5 +++++
 5 files changed, 25 insertions(+)

diff --git a/automation/build/centos/7.2.dockerfile b/automation/build/centos/7.2.dockerfile
index 4baa097e31..27244fd002 100644
--- a/automation/build/centos/7.2.dockerfile
+++ b/automation/build/centos/7.2.dockerfile
@@ -50,3 +50,8 @@ RUN rpm --rebuilddb && \
         bzip2 \
         nasm \
     && yum clean all
+
+# Remove expired certificate that Let's Encrypt certificates used to relie on.
+# (Not needed anymore)
+RUN trust extract --filter=pkcs11:id=%c4%a7%b1%a4%7b%2c%71%fa%db%e1%4b%90%75%ff%c4%15%60%85%89%10\;type=cert --format=pem-bundle /etc/pki/ca-trust/source/blacklist/DST_Root_CA_X3.pem && \
+    update-ca-trust
diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
index e688a4cece..b370068e3c 100644
--- a/automation/build/centos/7.dockerfile
+++ b/automation/build/centos/7.dockerfile
@@ -49,3 +49,8 @@ RUN yum -y install \
         nasm \
     && yum clean all && \
     rm -rf /var/cache/yum
+
+# Remove expired certificate that Let's Encrypt certificates used to relie on.
+# (Not needed anymore)
+RUN trust extract --filter=pkcs11:id=%c4%a7%b1%a4%7b%2c%71%fa%db%e1%4b%90%75%ff%c4%15%60%85%89%10\;type=cert --format=pem-bundle /etc/pki/ca-trust/source/blacklist/DST_Root_CA_X3.pem && \
+    update-ca-trust
diff --git a/automation/build/debian/jessie-i386.dockerfile b/automation/build/debian/jessie-i386.dockerfile
index c617b6fbfb..84135230d0 100644
--- a/automation/build/debian/jessie-i386.dockerfile
+++ b/automation/build/debian/jessie-i386.dockerfile
@@ -51,3 +51,8 @@ RUN apt-get update && \
         apt-get autoremove -y && \
         apt-get clean && \
         rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
+
+# Remove expired certificate that Let's Encrypt certificates used to relie on.
+# (Not needed anymore)
+RUN sed -i '/mozilla\/DST_Root_CA_X3\.crt/d' /etc/ca-certificates.conf && \
+    update-ca-certificates
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 8918b26d75..d11dd48e17 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -50,3 +50,8 @@ RUN apt-get update && \
         apt-get autoremove -y && \
         apt-get clean && \
         rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
+
+# Remove expired certificate that Let's Encrypt certificates used to relie on.
+# (Not needed anymore)
+RUN sed -i '/mozilla\/DST_Root_CA_X3\.crt/d' /etc/ca-certificates.conf && \
+    update-ca-certificates
diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
index b4b2f85e73..16d08ca931 100644
--- a/automation/build/ubuntu/trusty.dockerfile
+++ b/automation/build/ubuntu/trusty.dockerfile
@@ -49,3 +49,8 @@ RUN apt-get update && \
         apt-get autoremove -y && \
         apt-get clean && \
         rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
+
+# Remove expired certificate that Let's Encrypt certificates used to relie on.
+# (Not needed anymore)
+RUN sed -i 's#mozilla/DST_Root_CA_X3\.crt#!\0#' /etc/ca-certificates.conf && \
+    update-ca-certificates
-- 
Anthony PERARD


