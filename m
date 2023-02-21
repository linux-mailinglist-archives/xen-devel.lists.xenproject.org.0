Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B28F69E538
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 17:56:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499020.770020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVw8-0006Z5-5O; Tue, 21 Feb 2023 16:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499020.770020; Tue, 21 Feb 2023 16:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUVw7-0006Ug-W4; Tue, 21 Feb 2023 16:56:15 +0000
Received: by outflank-mailman (input) for mailman id 499020;
 Tue, 21 Feb 2023 16:56:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJL1=6R=citrix.com=prvs=409c08766=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pUVw6-0006DG-Ps
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 16:56:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5b0cede-b208-11ed-a089-e9535cc0f9c3;
 Tue, 21 Feb 2023 17:56:13 +0100 (CET)
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
X-Inumbo-ID: a5b0cede-b208-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676998573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W4o5O3b5dmJ26VW9ys1Vtbxkf00DnhjCjIf1FOqAqhM=;
  b=JbbPl/ZS1puejkGJVYT6+Xee+EhSgcdJp/MTee9Kzb8KSZGsLbQzw5UI
   /hMFtFCGGKmPeIXvOgtHeigXI04KIlypvmaqP3TRhO3yDnQOnQqKtkyu6
   jQa+jIcDyAoSsLwYkfJWnPNNv50o2fvLSaowu6P4Vq0KFz3XwpESImtpQ
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96765393
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:fx2+Fq4CpECVkqBc1o6p5wxRtCLHchMFZxGqfqrLsTDasY5as4F+v
 jAYUGyDa6zcYTT2f9hxad+/9U4Ou5XTndZlHgs5rixhHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoR5QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 8QzCRUrTC+5uc2Pwrn4YLhzmMM4M5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9zxjH+
 D+drj+R7hcyH9m6xGCJol+QiMDSjzHeB99RL4e/+as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9FZCeE95SmGw7DY5AvfDW8BJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8bnCrkb/NFMpGPsPLMGzqz6
 WGVsi8lmOBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWW0C
 KMwkVkLjHO2AJdNRfYuC79d8+xwkcDd+S3ND5g4lOZmbJlrbxOg9ypzf0OW1G2FuBFyzv9uY
 MfDIZn1Vi5y5UFbIN2eHbp17FPW7npmmTO7qW7TknxLLoZylFbKEOxYYTNin8gy7b+eoRW9z
 jqsH5Li9vmra8WnOnO/2ddKfTg3wY0TWcieRzp/KrTSfWKL2QgJV5fs/F/WU9Y7wfoPzbyQp
 ynVt40x4AOXuEAr4D6iMhhLAI4Dl74kxZ7nFUTA5WqV5kU=
IronPort-HdrOrdr: A9a23:KBwSm6nhPVGsO77zcuwGm0sYK4bpDfLa3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRcdcLW7UpVoLkmyyXcY2+cs1PKZLWvbUQiTXeZfBOnZsl7d8kTFn4Yw6U
 4jSdkaNDSZNzNHZK3BkW2F+rgboeVu8MqT9JjjJ3UGd3AVV0m3hT0JezpyESdNNXl77YJSLu
 vk2iLezQDQBEj+aK6AdwE4dtmGnfLnvrT8byULAhY2gTP+8Q9BuNbBYmOlNg51aUI0/Ysf
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="96765393"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH v2 2/7] automation: Ensure that all packages are up-to-dates in CentOS 7 container
Date: Tue, 21 Feb 2023 16:55:37 +0000
Message-ID: <20230221165542.7642-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230221165542.7642-1-anthony.perard@citrix.com>
References: <20230221165542.7642-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This was prompt by the fact that `wget https://xenbits.xenproject.org`
fails with expired certificates, which turned out to be an expired
root certificates. Updating all packages fix the issue.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - new patch, this replace a change in "Remove expired root certificates used to be used by let's encrypt"

 automation/build/centos/7.dockerfile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
index e688a4cece..f5264e02d9 100644
--- a/automation/build/centos/7.dockerfile
+++ b/automation/build/centos/7.dockerfile
@@ -15,7 +15,8 @@ RUN rpm --rebuilddb && \
     rm -rf /var/cache/yum
 
 # install Xen depends
-RUN yum -y install \
+RUN yum -y update \
+    && yum -y install \
         gcc \
         gcc-c++ \
         ncurses-devel \
-- 
Anthony PERARD


