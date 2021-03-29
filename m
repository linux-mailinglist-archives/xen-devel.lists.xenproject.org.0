Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E752B34D4A7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 18:15:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103137.196844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuYH-0007C1-6j; Mon, 29 Mar 2021 16:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103137.196844; Mon, 29 Mar 2021 16:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuYH-0007B5-1U; Mon, 29 Mar 2021 16:15:41 +0000
Received: by outflank-mailman (input) for mailman id 103137;
 Mon, 29 Mar 2021 16:15:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HZ2U=I3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lQuYF-0006uY-JM
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 16:15:39 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f436a48c-e889-44cb-a018-0a580cb45e05;
 Mon, 29 Mar 2021 16:15:25 +0000 (UTC)
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
X-Inumbo-ID: f436a48c-e889-44cb-a018-0a580cb45e05
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617034525;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c8Acnbxa1/yeuV9OWwGU3B027d8moILUgTfc1XUj1e4=;
  b=PiiU9pTNNPdesQvrBAusZWMbuoRfGsB1efOe+4QmukO2fpUoQaa9QbBg
   rl+ZONq9xahcagIcwT7VZz/reyt9+sXRWmuGbaAcT95uCh6fv6akoPTcx
   KA8nq5V3nRE4m51XIpUV/0ebuiuxuCLAkqhNx+IXqeCxXhMEMh46RGHJS
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LcZaO3GFR9GBSvb5lK9PQ0TuL/7h/fK8SFLTgKqz8WhjDBybJO+lPpA0IwBvcw2ftxJ9WcgZw2
 hlmMfNKEp37TzqXg8I9N2rpQkB96sVqq+9HWkFbOzWgC/UHaGq9WIPDkTS//mBwXewfVQz7iBl
 IB9V+lgxrTQ7b1FMkVDvIgeua5QX/8W4OBx94eR+Uw0/bhH3oj8BTS0sPelX/VMo1HeU7va1am
 wdDN184pURlkMB2QqONjAFV98tbZKozrqzWUAcuegzFA2njeLDAW1U/TEj4E9ea7bJycQgzSqp
 2ZU=
X-SBRS: 5.1
X-MesageID: 41809680
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:La6nDKDmZw08/EzlHekr55DYdL4zR+YMi2QD/WoZc31oW+afkN
 2jm+le6AT9jywfVGpltdeLPqSBRn20z+8N3aA6O7C+UA76/Fa5NY0K1/qY/xTMEzDzn9Qttp
 tIXLN5DLTLYmRSrcG/2wWgFsZl/d/vytHNuc7771NACT5ncLth6QARMHf8LmRTSBNdDZQ0UL
 qwj/A3xQaIQngcYsSlCnRtZYGqzLen+K7OWhIICwUq7wODl1qTmdnHOiOVwwsEVHd3yaoimF
 K16zDR3LmpsP2w13bnt1P70pI+orXc4+oGIMSNj8QPQw+c7zqVWA==
X-IronPort-AV: E=Sophos;i="5.81,288,1610427600"; 
   d="scan'208";a="41809680"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Ian Jackson <ian.jackson@citrix.com>
Subject: [PATCH v2 for-4.15 5/7] CHANGELOG.md: Add entries for emulation
Date: Mon, 29 Mar 2021 17:14:55 +0100
Message-ID: <20210329161457.345360-5-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329161457.345360-1-george.dunlap@citrix.com>
References: <20210329161457.345360-1-george.dunlap@citrix.com>
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
index fdad864a1f..62174c8c74 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Named PCI devices for xl/libxl
  - Support for zstd-compressed dom0 and domU kernels
  - Library improvements from NetBSD ports upstreamed
+ - x86_emulate: Support AVX-VNNI instructions
+ - x86_emulate: Expanded testing for several instruction classes
 
 ## Removed / support downgraded
 
-- 
2.30.2


