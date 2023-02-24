Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFC86A207D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 18:29:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501345.773069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbt0-0001Dn-EF; Fri, 24 Feb 2023 17:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501345.773069; Fri, 24 Feb 2023 17:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbt0-0001AU-A2; Fri, 24 Feb 2023 17:29:34 +0000
Received: by outflank-mailman (input) for mailman id 501345;
 Fri, 24 Feb 2023 17:29:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+11/=6U=citrix.com=prvs=4121c3e27=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pVbsy-0000bj-1s
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 17:29:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8f907a6-b468-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 18:29:29 +0100 (CET)
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
X-Inumbo-ID: c8f907a6-b468-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677259769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1ZVP9ILrNhbusIRgE8ATcFEGu4Gjie58ccJgoiV0r98=;
  b=X0Vij8GE+XKzqzP8iINDyFxUbYiR63g9uOezhfy10fmFZrm2YMI0TimO
   fH/+AToj+WTO/zySdXxKMQWDP8awDaliWlkfTNg17na/JbfNtdiyRmuRX
   KlqbQzyItX+erRR8oS6V+xV6rkCjOF3oGs8z6oUujQtwzvbtX8p+FtJdK
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98354844
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:6RPR6qlcfYMDshxa1vzFXybo5gyZJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMDzqDM/vYMWSjKNskO97l9BhTvcLdy9VnT1RurCk8ECMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5gOGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 e0cORogSi6EvsP18eOKUedhv54CC+C+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthfI/
 T+arzilav0cHMaF8hWCr2qdv7PwgHL3cqspHaT7+sc/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JbGvc27wylwaPO7wGUQGMDS1Zpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhqgGqy89G3of3JPdClbOHFCFFFeizX+nG0tpgPLX/xONJCyt/y2KGDB2
 D6HlXIfoJxG2KbnyJ6H1VzAhjutoL3AQQg0+hjbUwqZ0+9pWGK2T9f2sAaGtJ6sOK7cFwDc5
 yZcx6By+chUVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romxezP
 Sc/WisLvve/2UdGiocmC79d8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFyzv5mZ
 sjBLpv9XSdy5UFbIN2eHbp17FPW7npmmTO7qW7TknxLLoZylFbKEOxYYTNin8gy7b+eoRW9z
 jqsH5Li9vmra8WnOnO/2ddKfTg3wY0TWcieRzp/KrTSfWKL2QgJV5fs/F/WU9A6w/8Izr+Vp
 xlQmCZwkTLCuJEOEi3SAlgLVV8ldc8XQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:FZq3Zq6fLKauuWrWPwPXwM7XdLJyesId70hD6qhwISY7TiX+rb
 HIoB17726MtN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4ZmpM
 FdmsNFZuEYY2IXsS+D2njaL+od
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="98354844"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH v3 3/4] automation: Remove expired root certificates used to be used by let's encrypt
Date: Fri, 24 Feb 2023 17:29:14 +0000
Message-ID: <20230224172915.39675-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230224172915.39675-1-anthony.perard@citrix.com>
References: <20230224172915.39675-1-anthony.perard@citrix.com>
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
    v3:
    - remove change to Debian Jessie containers, as we won't use them with
      HTTPS urls.
    
    v2:
    - remove unneeded changes to CentOS containers

 automation/build/ubuntu/trusty.dockerfile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
index b298a515c6..22e294c20c 100644
--- a/automation/build/ubuntu/trusty.dockerfile
+++ b/automation/build/ubuntu/trusty.dockerfile
@@ -47,3 +47,8 @@ RUN apt-get update && \
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


