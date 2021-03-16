Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5B033D902
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 17:19:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98384.186630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMCPd-0002q2-Q2; Tue, 16 Mar 2021 16:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98384.186630; Tue, 16 Mar 2021 16:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMCPd-0002pR-Mv; Tue, 16 Mar 2021 16:19:17 +0000
Received: by outflank-mailman (input) for mailman id 98384;
 Tue, 16 Mar 2021 16:19:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kyr7=IO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lMCPc-0002kv-S1
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 16:19:16 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9863bba2-0946-4b55-9ef0-6c206ee58d6e;
 Tue, 16 Mar 2021 16:19:13 +0000 (UTC)
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
X-Inumbo-ID: 9863bba2-0946-4b55-9ef0-6c206ee58d6e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615911553;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qDVzQrkqOORjK1tpTv/h9844QV+q3KXmjnsN49ior48=;
  b=PvHkHYGRvijSWYUvobdTJSv5H2IAJWA7O8yyJ337TIUjhKBs+5LwrSSj
   37CC6rJji6KQ8iAIlBVbgpCh7D9zuewC0+bZeGzLBryfHTD+adfDAeoTl
   951Yelsbyb8O/Cm5sshYDbNkqgx5PymFVM6qw4CPhN5ODiK99K9JIrCZA
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: P3HDpFx97VuZkhun39VBuWLw8ueXFh3aqbIIpafB+iRN7D4Z2dbRuNZm6M/yDqzNduKmCFKYKS
 0zSCLPtGNlFqaPkLl5IFE3wFshwhLS91k224IT8L/0LhCkPTO4682Pe3ctGYa3fWyG9J+daJg+
 NFazLYr5Z7e5WplqV9557kTJpQZV8RZQHjUAY2hiPuAv5CBsBqCfaoV44QBxx/XVIzNkyV3P8U
 mZNufYDbeGbxhJrxLg6nEj7qFikycVm7j/SZsVfeu9JhTOZiPzHNs+If6j2g5LuG3uckMelSNt
 7N8=
X-SBRS: 5.1
X-MesageID: 39309516
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8lR+Pqg5dmupob9vJkJu5o3vynBQXj4ji2hD6mlwRA09T+Wzva
 mV8sgz/xnylToXRTUcgtiGIqaNWjfx8pRy7IkXM96ZLW7bkUGvK5xv6pan/i34F0TFh4pg/I
 ppbqQWMr3NJHdgi8KS2mWFOvIB5PXCz6yyn+fZyB5WPGRXQoVt9R1wBAreMmAefngkObMDGJ
 CR5tVKqlObEBx9BKmGL0IIQvTZoJnznI/mCCR2YSIP0hWEjj+j9dfBciSw4xF2aVxy6IZn1W
 DElgDjj5/T0c2G9g==
X-IronPort-AV: E=Sophos;i="5.81,251,1610427600"; 
   d="scan'208";a="39309516"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.15 0/3] x86/msr: Fixes for XSA-351
Date: Tue, 16 Mar 2021 16:18:41 +0000
Message-ID: <20210316161844.1658-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is slightly complicated.  Patches 1 and 2 rearrange the code to look and
behave more like 4.14, and patch 3 fixes a Solaris (and turbostat) bug in a
manner which can be backported to all security trees.

Andrew Cooper (3):
  Revert "x86/msr: drop compatibility #GP handling in guest_{rd,wr}msr()"
  x86/msr: Forward port XSA-351 changes from 4.14
  x86/msr: Fix Solaris and turbostat following XSA-351

 xen/arch/x86/msr.c              | 78 +++++++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/msr-index.h | 39 +++++++++++++++++++++
 2 files changed, 117 insertions(+)

-- 
2.11.0


