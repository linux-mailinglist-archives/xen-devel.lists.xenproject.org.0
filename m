Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EB1347DF8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 17:44:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101101.193134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6ca-0001BD-8m; Wed, 24 Mar 2021 16:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101101.193134; Wed, 24 Mar 2021 16:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6ca-0001AP-2l; Wed, 24 Mar 2021 16:44:40 +0000
Received: by outflank-mailman (input) for mailman id 101101;
 Wed, 24 Mar 2021 16:44:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwg6=IW=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lP6cY-0000tK-7k
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:44:38 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b212ca8-7197-43ec-9b5e-2948383f5ef5;
 Wed, 24 Mar 2021 16:44:18 +0000 (UTC)
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
X-Inumbo-ID: 1b212ca8-7197-43ec-9b5e-2948383f5ef5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616604258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l99nOtKLPrGEf6ULF3EGXRUV0bzZIKdFxjmIfooqryA=;
  b=C2ohTtvLxj0+gsUs/hx9KRG0eYSfOpv3xsH/Qy0YbilATxW/JXdo9JlU
   vSqUdbsebKAqq9brguNyvMfKtfluEO1N5QeqrLIscjvxNAddz/EN60QZK
   IZ5WdOtkfQTN8PIhulRXwUCnf7v8BOXiXDUZle53OGkBAwZ40uOCGdklP
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: htnATXmK+cQQ45y8DtyjhJ++/whaqkceXpfRc/s9pw0ijx8f/IjMGTFJ7f9LXQgE0C48bOuSCd
 ZQCKnw4d5tSJo98LE9XpQy9qKNJBAqPofXRYpb3AQ6/FS8dCSFeda5N2e6dEdG8qQ8JECXIXhq
 iHelVKk51aTP3MOoAntpx4bCUZeS/syX6q7FA+zR9wSv9ZZqN3tlEue2F+NR1+0wHaZ8fF2fez
 nxKCMT7NovKjFP0aLj3iRhitCQiSpIOmiVxNWg9fEOfeaBa1eL7+GU12DzxRXk+9c1SwzxdQEp
 AW4=
X-SBRS: 5.1
X-MesageID: 41481707
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:WPpXT6PkOfU6O8BcTkajsMiAIKoaSvp033AA/SlKKCB9WMqeis
 yogbAnzhfykjkcQzUNntqHNamGTxrnhOdIyKMWOqqvWxSjhXuwIOhZnPDf6hDpBiGWzJ8/6Y
 5OaK57YeeeMXFbioLA7BC8A5IcxrC8gcSVrMP/61socg1wcaFn6G5Ce2CmO2l7XhNPC5Z8NL
 f03LskmxOadX4abtu2CxA+NoCpzbCmqLvcbRELHBIh4gWV5AnYj4LSKBSEwgwYFwpG3LZKyx
 m8ryXC+q6hv/unoyW960bv6f1t9ufJ+59mDMyIhtN9EESItjqV
X-IronPort-AV: E=Sophos;i="5.81,275,1610427600"; 
   d="scan'208";a="41481707"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Ian Jackson <ian.jackson@citrix.com>
Subject: [PATCH 5/6] CHANGELOG.md: Add entries for emulation
Date: Wed, 24 Mar 2021 16:44:06 +0000
Message-ID: <20210324164407.302062-5-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324164407.302062-1-george.dunlap@citrix.com>
References: <20210324164407.302062-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <ian.jackson@citrix.com>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 3f4eed1d98..df6c638152 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Named PCI devices for xl/libxl
  - Support for zstd-compressed dom0 kernels
  - Library improvements from NetBSD ports upstreamed
+ - x86_emulate: Support AVX-VNNI instructions
+ - x86_emulate: Expanded testing for several instruction classes
 
 ## Removed / support downgraded
 
-- 
2.30.2


