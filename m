Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 906D5347DF7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 17:44:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101097.193118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6cU-000161-V6; Wed, 24 Mar 2021 16:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101097.193118; Wed, 24 Mar 2021 16:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6cU-00015B-NX; Wed, 24 Mar 2021 16:44:34 +0000
Received: by outflank-mailman (input) for mailman id 101097;
 Wed, 24 Mar 2021 16:44:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwg6=IW=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lP6cT-0000tK-7X
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:44:33 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33457c72-4f36-4705-88af-f154b97b3ef3;
 Wed, 24 Mar 2021 16:44:17 +0000 (UTC)
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
X-Inumbo-ID: 33457c72-4f36-4705-88af-f154b97b3ef3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616604257;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=htk9xO6z3G+FcDv3EiIjr9djRWyj7OaRbk3W8bSI+ZQ=;
  b=IOut/3q+VNHlW7rg/Go7uX2rk5yrB/9nxJkgJBPxT52S3EjTF8inJfF5
   rcPLarSXK46JR0sXwdyFrkQGGTD39/9W4eI2PL2CYhwV6qWOnCv26csDp
   JZAbYNAEoRddFxD/199otYvEFPHLUMXMDHxc6nquRX01I+aqJYxAbXsVW
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: FiAo8yIHN16AxecqiGjYKuUqRVeMwc6QEKsqQoMN7FoHa7AeIXfqOZnCS0OJzQkgdJcIr7bsgY
 Z/dtu0c7UcH+nOG+cdRiC/ss1OkiLPQQOufZrHAyOoFExSb8GcV7tSfV7vkCAU+2gvXDxu58gW
 1urOfWxNVCSjq7dqrhuzrIweCOE1ITv2LrA/9h9zaQz9pzboR73za3Vq0PXd0athQJ/ECVW2jd
 0avcUgNn93KAOvwZoEtW932npaSk3K61BugKEPRpHdXVARIR7MSoKVXWGPtWB6TrOIsSM7781q
 LIA=
X-SBRS: 5.1
X-MesageID: 40402379
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:nylJxK17XkDlVqKfNhgjngqjBWByeYIsi2QD101hICF9WtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7LE/035Qd2+ksFJ2lWxTrv3btEZF64eLZslndMgDd1soY76
 dvdKBiFMb9ZGIRse/W6BS1euxO/PCp66at7N2x815IbSVHL55t9B14DAHzKDwSeCBjCYAiHJ
 SRouprzgDQGkg/VciwCnkbU+WrnbSi+K7OWhIaGwUhrDCHkDLA0tXHOiKF1RQTWS4n+8ZBzU
 H5lWXCh5mLgrWA5TL3k0TS6JlXn9WJ8Ko/OOW8zvI7Bx+ppgKhZIFKU6CPsjYvsIiUmSoXue
 iJmTgMFYBe7G7QY3GUrHLWqnbd+Qdr0VDO4xu5hmbuusPwTj5SMbs+uatpNiH3xmBlmfMU6t
 Mt40up86B5IDmFoQHGo//PbB1unlrcmwtYrccjy0ZxfKFbVKVctuUkjSVoOaZFJg3WwqY9Ht
 JjCcnNjcwmC2+yXjTism5jzMfEZAVLIj62BkwLusmi2zNLhnxOz0wB2MwFnnsbnahNM6V52w
 ==
X-IronPort-AV: E=Sophos;i="5.81,275,1610427600"; 
   d="scan'208";a="40402379"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>, "Tamas K
 Lengyel" <tamas.lengyel@zentific.com>
Subject: [PATCH 1/6] Intel Processor Trace Support: Add CHANGELOG.md and SUPPORT.md entries
Date: Wed, 24 Mar 2021 16:44:02 +0000
Message-ID: <20210324164407.302062-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Tamas K Lengyel <tamas.lengyel@zentific.com>
---
 CHANGELOG.md | 1 +
 SUPPORT.md   | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c407f6bb2f..7f03e85bd7 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -10,6 +10,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - ARM IOREQ servers (device emulation etc.) (Tech Preview)
  - Renesas IPMMU-VMSA (Supported, not security supported; was Tech Preview)
  - ARM SMMUv3 (Tech Preview)
+ - Intel Processor Trace support (Tech Preview)
 
 ## Removed / support downgraded
 
diff --git a/SUPPORT.md b/SUPPORT.md
index a1efd8fcfd..966ddf89c8 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -247,6 +247,13 @@ Export hypervisor coverage data suitable for analysis by gcov or lcov.
 
     Status: Supported, Not security supported
 
+### Processor trace support
+
+Support for using Intel Processor Trace technology to trace guests
+from dom0.
+
+    Status: Tech Preview
+
 ## Memory Management
 
 ### Dynamic memory control
-- 
2.30.2


