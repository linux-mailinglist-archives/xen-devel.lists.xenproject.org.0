Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5DA1BFE10
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 16:26:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUA8T-0002UD-5t; Thu, 30 Apr 2020 14:25:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ng0l=6O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUA8S-0002U2-2v
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 14:25:56 +0000
X-Inumbo-ID: 80baa85c-8aee-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80baa85c-8aee-11ea-ae69-bc764e2007e4;
 Thu, 30 Apr 2020 14:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LkqaSMJfdGvWDRCP/rOkol/7V/PWobTan66+EekWFD4=; b=Gjyoe0CU4QC1Jt77HcEX/kccin
 ibpqN7ioH1wzM3XEhjDpLXvnT1oxbThyxSSup3pPoToUWimkWWFC68iYTOMncU2CJ3kkMxVZopYha
 Xg718/tfsBevj5lypkXXEisGmOoICA6r6fFQFNEBsOcqjtJ+ubW+ayp3ygw+FckJNJ3w=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUA8R-0004pR-8s; Thu, 30 Apr 2020 14:25:55 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUA8Q-0008UY-Vr; Thu, 30 Apr 2020 14:25:55 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
Date: Thu, 30 Apr 2020 15:25:48 +0100
Message-Id: <20200430142548.23751-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430142548.23751-1-julien@xen.org>
References: <20200430142548.23751-1-julien@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

EXPERT mode is currently used to gate any options that are in technical
preview or not security supported At the moment, the only way to select
it is to use XEN_CONFIG_EXPERT=y on the make command line.

However, if the user forget to add the option of one of the make
command (even a clean), then .config will get rewritten. This may lead
to a rather frustrating experience as it is difficult to diagnostic the
issue.

A lot of the options behind EXPERT would benefit to get more tested in
order to be mark as fully supported in the future.

In order to make easier to experiment, the option EXPERT can now be
selected from the menuconfig rather than make command line. This does
not change the fact a kernel with EXPERT mode selected will not be
security supported.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

This may require some changes in OSSTest as we select the EXPERT mode
when building (This is necessary for booting Xen on Thunder-X box).
---
 xen/Kconfig  | 10 +++++++++-
 xen/Makefile |  1 -
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 120b5f412993..34c318bfa2c7 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -35,7 +35,15 @@ config DEFCONFIG_LIST
 	default ARCH_DEFCONFIG
 
 config EXPERT
-	def_bool y if "$(XEN_CONFIG_EXPERT)" = "y"
+	bool "Configure standard Xen features (expert users)"
+	help
+	  This option allows certain base Xen options and settings
+	  to be disabled or tweaked. This is for specialized environments
+	  which can tolerate a "non-standard" Xen.
+	  Only use this if you really know what you are doing.
+	  Xen binaries built with this option enabled are not security
+	  supported.
+	default n
 
 config LTO
 	bool "Link Time Optimisation"
diff --git a/xen/Makefile b/xen/Makefile
index 2b1dacb49754..286f374b549f 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -11,7 +11,6 @@ export XEN_DOMAIN	?= $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) |
 export XEN_BUILD_DATE	?= $(shell LC_ALL=C date)
 export XEN_BUILD_TIME	?= $(shell LC_ALL=C date +%T)
 export XEN_BUILD_HOST	?= $(shell hostname)
-export XEN_CONFIG_EXPERT ?= n
 
 # Best effort attempt to find a python interpreter, defaulting to Python 3 if
 # available.  Fall back to just `python` if `which` is nowhere to be found.
-- 
2.17.1


