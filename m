Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB2364597
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 16:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112932.215308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTI-00062z-W1; Mon, 19 Apr 2021 14:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112932.215308; Mon, 19 Apr 2021 14:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTI-00062H-S6; Mon, 19 Apr 2021 14:01:52 +0000
Received: by outflank-mailman (input) for mailman id 112932;
 Mon, 19 Apr 2021 14:01:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3l5R=JQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYUTH-00061N-Ga
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 14:01:51 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecb8b980-4f33-41e0-a0f6-492d4d5acdf7;
 Mon, 19 Apr 2021 14:01:49 +0000 (UTC)
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
X-Inumbo-ID: ecb8b980-4f33-41e0-a0f6-492d4d5acdf7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618840909;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TA5ZKAuUwi4CHsYgJ25Kg8HIPW9/JmPHtVST3zPieb0=;
  b=cDQ75ETNDtCEjGA/sxnJFDdZxJPCtjwZp16m6/C1FAU9obRRxsDPfzgF
   /dNHaW70bpSu+iw1v+Qev1MzzcwDtnnCJx8QqXdb50tQ05VsdQO+lAFXJ
   J/aoc9++NPMReO/XYUytwMj2/YMsRUmKkbBvz2iCkCM1XcN8EIe2WESDc
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: nKAw0paORZWMn2xzxBZJ2gUU4K0T24s3gCftZ+WLUFp7Wc7pFBsBftdOgcZEd9J0sgnBF31DiR
 SSIyoOJ4OQ/xIwm/ShX4wGAFGRFnhtH2svdemK1CK9cBWQqxtrFhKq5waGiPTf81k3ZyfsRusH
 EIm0FKVkByrusRU7vH4wKhyEvIbfkP5GP8E6AgC6NUMO2JYXfGKoGsJPYDiIHPin0YZFvMHqjO
 AC/ApiRRfIvXlLFENcv6m5ExEpvGhVW4r2ZbKikcRreLDiilHvpK33F4BQbYJ1NZaXLavKNV6D
 E5s=
X-SBRS: 5.1
X-MesageID: 41892058
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Rd5jdKopNcXHAQ2UlMnTX4YaV5u6KtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQZ3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIRg/I
 9aWexFBNX0ZGIQse/T6gO1Cstl5dGB/ryhi+u29QYUcShBbaZ84wBlTiOSFUNrTAdLbKBJb6
 a0zMxBujamZDArft22b0N1FNTriv/qsNbdYRAADwM68wXmt1+VwZPzDhTw5GZ7bxph2rEnmF
 KlryXY4eGZv+i/2lvg0Qbonu1rsf/A7vcGO8CWkMgSLVzX+0yVTaBsQaeLsjxwgMzH0idMrP
 D2rx0tP9t+5hrqFwnbzyfF4AXu3C0j7HXv0zaj8B3eiPbkTzE3Adcpv/M7TjLl6lEttNw58K
 VH03PxjeszMTr8nT/w79WNahdylkDcmwtBrccviRVkMbc2Wft0l8gy7UlVGJAPEGbR84Y8Ct
 RjC8na+bJ/bU6aR2qxhBgi/PWcGlAIWjuWSEkLvcKYlxJMmmpi8kcezMsD2l8d6ZMGTYVe7e
 isCNUmqJh+CustKY5tDuYIRsW6TkbXRwjXDW6UKVP7UIYKJmzKsJyyxLku/umldNgpwfIJ6d
 r8eWIdkVR3V1PlCMWI0pEO2AvKWn+BUTPkzdwb6IN+vrH6Wbr3ISyOQF0jiKKb0rUiK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbUMB9gKd5Z3u+5ubwbqH6vO3Sd/jeYJD3Fyw/Z2/5Cn
 wfGDz6JMBK6FG3Smb16SKhGU/FSwjax9ZdAaLa9+8cxMwmLYtXqDUYjly/+4WMMj1Nsqs/eU
 NkO7P5mqanpW27lFy4rllBC154NAJ48b/gW3RFqUshKEXva4sOvN2ZZCRPxnedPwR+SMnXCQ
 ZboFxy9cuMXtmt7BFnL+jiHnORjnMVqn7PcowVnbeb49z5PrkiCIw9ZaB3HQLXNhB8lApwsl
 1fYAscSkK3LEKrtYyVyLgvQMDWbZ1VnRqiK888kwOkiWys4eUUAkY9cxHre8iNmgoqTydTnT
 RKgtIiqYvFvy2uJ2s5iPk/K3tWZg2scf97JQyYeYRZna3qcglsTWGMwSeXkQ03Z3CCzTRvuk
 XxaSKTYv3FGVxbpzRR1bvr6kp9ciGHc1t3cW0Si/wKKU3W/nJy2/SMfKy9zi+YbUYD2PgUNF
 j+EE8vCxIrw9C8zxiOnjmeUX0g25U1J+TYSLAuaava1H/oKIqGk8g9bohp1YcgMNDlqekQV+
 2DPweTMTPjEussnxWPuWxNAlgGlFA01ffznBH15mmx23AyRfLUPVR9XrkeZ9WR9XLtSfqE2I
 hw5OhF9NeYIyH0cJqL2KvXZzlMJlfIrWm6Q/ohpJpUsagx3YEDaqXzQH/NzjVKzR8+JMD7mA
 cCW6x9+qnGIZIqcMoIeS5Vl2BZ3OinPQ8uqEjxDeA/d1120COeMNON/rbSqb0gRkeGvxD9PF
 GD8ytbu/fJNhHzpIIyGuY1OyBRbkN59XFpuOWFfIfUAB+xd+5C8EGhW0XNAoN1WeyAA/EIsh
 1+49uUhOeZeCrzxRDIsVJAU9xz2nfiRdn3HRmFFuFJ+cGrIFiAgqOl58iokTf8IAHLG3gwlM
 lCbkwfbsNKlzkkgsk2y0GJO9PKnn4=
X-IronPort-AV: E=Sophos;i="5.82,234,1613451600"; 
   d="scan'208";a="41892058"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 7/7] xen: Use -Og for debug builds when available
Date: Mon, 19 Apr 2021 15:01:32 +0100
Message-ID: <20210419140132.16909-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210419140132.16909-1-andrew.cooper3@citrix.com>
References: <20210419140132.16909-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The recommended optimisation level for debugging is -Og, and is what tools
such as gdb prefer.  In practice, it equates to -01 with a few specific
optimisations turned off.

While the use of gdb isn't necessarily very helpful for Xen, the disassembly
will have fewer structural transformations vs C, and therefore will be easier
to follow.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Juergen Gross <jgross@suse.com>

Successful CI runs:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/287769787
  https://cirrus-ci.com/build/5086280275984384
---
 xen/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index 9f3be7766d..128de93f5e 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -195,7 +195,9 @@ include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
 	$(MAKE) $(kconfig) syncconfig
 
 ifeq ($(CONFIG_DEBUG),y)
-CFLAGS += -O1
+# Use -Og if available, -O1 otherwise
+dbg_opt_level := $(call cc-option,$(CC),-Og,-O1)
+CFLAGS += $(dbg_opt_level)
 else
 CFLAGS += -O2
 endif
-- 
2.11.0


