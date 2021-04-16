Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 807FD3624D0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 18:00:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111892.213954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXQt0-0000DG-Uj; Fri, 16 Apr 2021 16:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111892.213954; Fri, 16 Apr 2021 16:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXQt0-00009a-Qf; Fri, 16 Apr 2021 16:00:02 +0000
Received: by outflank-mailman (input) for mailman id 111892;
 Fri, 16 Apr 2021 16:00:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kml=JN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lXQsz-0008GA-Si
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 16:00:01 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26e5a2a0-22f1-437a-ae68-1823a4628f45;
 Fri, 16 Apr 2021 16:00:00 +0000 (UTC)
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
X-Inumbo-ID: 26e5a2a0-22f1-437a-ae68-1823a4628f45
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618588800;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=za/SREf9oZvlS20TUv3QJjA9r1M3Ryy8U2rNawKnKzo=;
  b=e1DcMhDU+TBB7L/SkAbs4y5WSf456xN0D8nepVxaGUqULMlj7IU/uX9u
   Z3AhWYj7v9KhzyYYNNCpJk3fsk7sW3UcbnaMfzcWHGBwY4+ZD3jCFdOMN
   hVclmO5G7StJh074ZFftWLtPa7W0xhk26R/JS9I6j4saEGL+WeHB7aRgi
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: p70reUZBzNMeOnw4zDx9u2g3m/tYSya1S9DLvxoo+4n8KaLdWqhqUl29oNzOdKD1EXvtHb9LCE
 NqLclbZrtJhKXNGxTFUe/gOTO/Vwopkk8oE88YLzmuZKQK3fBY2tZfi2Bw30r2tBy0ym1x2uDw
 joZMAHrVZwzNOJ+JMVTY3wGUXSfG9mofCQkcYg65ycKr0hFIPAlfniUatYJv38pI5FN/cKJUt3
 XcQ9WjuVLSgGoWI8Dq+GJfilYKXb3FYH9vSy8giauHtxivJlrU7OGr301cpGPxt9WKZXVeVdy2
 x54=
X-SBRS: 4.0
X-MesageID: 41900411
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:h0eUn6ojNkHfKqVZJnGl2zcaV5oHeYIsi2QD101hICF9X+65s4
 SVnPod3QLpkzp5YhpLpfmsMLSNKEmxybdb+o8UVI3CYCDDtHGzJI9vqavuqgeOJwTE+uRQ1b
 htfsFFYbWcY2RStsri5Rn9LtBI+qjlzImTmezcw31xJDsaCZ1I0gERMGamLnE=
X-IronPort-AV: E=Sophos;i="5.82,226,1613451600"; 
   d="scan'208";a="41900411"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools: Drop XGETTEXT from Tools.mk.in
Date: Fri, 16 Apr 2021 16:59:41 +0100
Message-ID: <20210416155941.15454-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This hunk was missing from the work to drop gettext as a build dependency.

Fixes: e21a6a4f96 ("tools: Drop gettext as a build dependency")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>
CC: Juergen Gross <jgross@suse.com>
---
 config/Tools.mk.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index d47936686b..934d899967 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -12,7 +12,6 @@ PYTHON              := @PYTHON@
 PYTHON_PATH         := @PYTHONPATH@
 PY_NOOPT_CFLAGS     := @PY_NOOPT_CFLAGS@
 PERL                := @PERL@
-XGETTTEXT           := @XGETTEXT@
 AS86                := @AS86@
 LD86                := @LD86@
 BCC                 := @BCC@
-- 
2.11.0


