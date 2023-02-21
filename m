Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7969E532
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 17:56:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499019.770013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVw7-0006Uo-RY; Tue, 21 Feb 2023 16:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499019.770013; Tue, 21 Feb 2023 16:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVw7-0006ST-NT; Tue, 21 Feb 2023 16:56:15 +0000
Received: by outflank-mailman (input) for mailman id 499019;
 Tue, 21 Feb 2023 16:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJL1=6R=citrix.com=prvs=409c08766=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pUVw5-0006DG-Pv
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 16:56:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a25355ec-b208-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 17:56:08 +0100 (CET)
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
X-Inumbo-ID: a25355ec-b208-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676998568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dejqBUDapsyzI7HHhOmckM2GIW5qoACppxaU6sOaF10=;
  b=Reuwv/iuGWcZq2cHzUtYIEuUviDT2WWnNjlE7zxui0kJ18jJK7AnQ6kI
   ffzFCJAfgywXQjiiDdZuCJwAlbeyDEl1LQO9Cz2igQ5+OOLIQZqalV/wY
   ueeH0cO2N6BAImPddMuJcSx/qdvkKYKumZJwHQwKUeEAFXz3pgCx9ruo2
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98340059
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:5brBn61BmJQpBWpJQvbD5clxkn2cJEfYwER7XKvMYLTBsI5bpzxSx
 msZXzvSafiINzTweNBwPNzipk5T65GGydFrQQA6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZkPKgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfRn0f8
 aQHAnMxZDvfq7yon5KFYdtImZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFJUOwh7A+
 zOuE2LRDB8ZGsKdwx650W+Kl/HrzTHEV44qC+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhUVQdZXHsUx4RuBzaeS6AGcbkAfVSJIYtEisM4wRBQp2
 0WPktevAiZg2IB5UlrEqO3S92nrf3FIcylbP3RsoRY5D8fL551iikrQZJVfGoXpooPrRhHO6
 AKus31r71kMtvIj26K+9FHBpjujoJnVUwI4jjnqsnKZAhBRP9D8OdHxgbTPxbMZddvCEAHd1
 JQRs5LGhN3iG61hg8BkrA8lOLiyr8iIPzTH6bKEN8lwrm/9k5JPkG053d2fGKuLGpxZEdMKS
 BWJ0e+02HO0FCLzBZKbm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzzxZ9yPFna
 cjCKp7E4ZMm5UNPlmfeegvg+eVzmnBWKZ37GPgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 483Cid+8D0GCLeWSnCOoeYuwaUicSBT6Wbe95YGKYZu42NORAkcNhMm6el/JdI/xP8Nz7+gE
 7PUchYw9WcTTEbvcW2iAk2PopuzNXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:rYtewaz3j4P9G2KmD245KrPw2r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726TtN91YhsdcL+7V5VoLUmzyXcx2/hyAV7AZniAhILLFvAA0WKK+VSJdxEWtNQtsJ
 uIG5IUNDSaNykfsS+V2miF+9ZL+qj5zEir792usUuEm2tRGtBdBwQSMHfqLqVvLjM2fKbQjP
 Cnl7d6TzzLQwVuUu2LQkMrcsLkvNPxmJfvcXc9dmIaAFnnt0LS1FbieSLopCsjbw==
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="98340059"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH v2 7/7] automation: Remove expired root certificates used to be used by let's encrypt
Date: Tue, 21 Feb 2023 16:55:42 +0000
Message-ID: <20230221165542.7642-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230221165542.7642-1-anthony.perard@citrix.com>
References: <20230221165542.7642-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

While the Let's Encrypt root certificate ISRG_Root_X1.crt is already
present, openssl seems to still check for the root certificate
DST_Root_CA_X3.crt which has expired. This prevent https connections.

Removing DST_Root_CA_X3 fix the issue.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - remove unneeded changes to CentOS containers

 automation/build/debian/jessie-i386.dockerfile | 5 +++++
 automation/build/debian/jessie.dockerfile      | 5 +++++
 automation/build/ubuntu/trusty.dockerfile      | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/automation/build/debian/jessie-i386.dockerfile b/automation/build/debian/jessie-i386.dockerfile
index 276b640ec9..e04b43f32f 100644
--- a/automation/build/debian/jessie-i386.dockerfile
+++ b/automation/build/debian/jessie-i386.dockerfile
@@ -49,3 +49,8 @@ RUN apt-get update && \
         apt-get autoremove -y && \
         apt-get clean && \
         rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
+
+# Remove expired certificate that Let's Encrypt certificates used to relie on.
+# (Not needed anymore)
+RUN sed -i '/mozilla\/DST_Root_CA_X3\.crt/d' /etc/ca-certificates.conf && \
+    update-ca-certificates
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 06128d1a40..e8aa0183ee 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -48,3 +48,8 @@ RUN apt-get update && \
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


