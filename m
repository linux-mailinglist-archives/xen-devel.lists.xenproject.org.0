Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A1740D9A6
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 14:16:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188437.337595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQqJK-0007MQ-UP; Thu, 16 Sep 2021 12:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188437.337595; Thu, 16 Sep 2021 12:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQqJK-0007KL-Qs; Thu, 16 Sep 2021 12:16:14 +0000
Received: by outflank-mailman (input) for mailman id 188437;
 Thu, 16 Sep 2021 12:16:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=20iF=OG=yandex.ru=isaikin-dmitry@srs-us1.protection.inumbo.net>)
 id 1mQqJI-00074J-Ek
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 12:16:12 +0000
Received: from forward105o.mail.yandex.net (unknown [2a02:6b8:0:1a2d::608])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11bc9e2e-3565-47e4-bc63-6d940a048772;
 Thu, 16 Sep 2021 12:16:00 +0000 (UTC)
Received: from myt6-48cb7adf5983.qloud-c.yandex.net
 (myt6-48cb7adf5983.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4c9c:0:640:48cb:7adf])
 by forward105o.mail.yandex.net (Yandex) with ESMTP id 731FF4C43F7;
 Thu, 16 Sep 2021 15:15:57 +0300 (MSK)
Received: from myt6-efff10c3476a.qloud-c.yandex.net
 (myt6-efff10c3476a.qloud-c.yandex.net [2a02:6b8:c12:13a3:0:640:efff:10c3])
 by myt6-48cb7adf5983.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 B2htycwpgs-FvDm3JOh; Thu, 16 Sep 2021 15:15:57 +0300
Received: by myt6-efff10c3476a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id wX5Y1UDLGI-FtDKBARt; Thu, 16 Sep 2021 15:15:56 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
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
X-Inumbo-ID: 11bc9e2e-3565-47e4-bc63-6d940a048772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1631794557;
	bh=g3vf8XCHFE0NhfW12scKRmlBoFDcRBGQvYgVAD2JBkY=;
	h=Message-Id:Date:Subject:To:From:Cc;
	b=IL4XfRKHasKz2dw63v8RALFFZD2Lku0dUKzAxPqwr7QoZaUQvskd3iDVZ07eMBdhG
	 lZOcf9QFYF0ye91MbNNpKl1C6DswKhoKrX40/nA8nLqQZleAjw4m9ZfgX5sSi1CjxP
	 Jte673XsjSAHWNnEwBNR/tQ3E8QQMY9n7pLJxxco=
Authentication-Results: myt6-48cb7adf5983.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
To: xen-devel@lists.xenproject.org
Cc: Dmitry Isaykin <isaikin-dmitry@yandex.ru>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3] tools/xl: fix autoballoon regex
Date: Thu, 16 Sep 2021 15:15:21 +0300
Message-Id: <dd3a1e1a7a3f8e7bca18dd4779efbc2af01decc7.1631793876.git.isaikin-dmitry@yandex.ru>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This regex is used for auto-balloon mode detection based on Xen command line.

The case of specifying a negative size was handled incorrectly.
From misc/xen-command-line documentation:

    dom0_mem (x86)
    = List of ( min:<sz> | max:<sz> | <sz> )

    If a size is positive, it represents an absolute value.
    If a size is negative, it is subtracted from the total available memory.

Also add support for [tT] granularity suffix.
Also add support for memory fractions (i.e. '50%' or '1G+25%').

Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
---
Changes in v3:
- add support for [tT] granularity suffix
- add support for memory fractions

Changes in v2:
- add missing Signed-off-by tag
---
 tools/xl/xl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 4107d10fd4..8500b3ac57 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -81,7 +81,7 @@ static int auto_autoballoon(void)
         return 1; /* default to on */
 
     ret = regcomp(&regex,
-                  "(^| )dom0_mem=((|min:|max:)[0-9]+[bBkKmMgG]?,?)+($| )",
+                  "(^| )dom0_mem=((|min:|max:)(-?[0-9]+[bBkKmMgGtT]?)?(\+?[0-9]+%)?,?)+($| )",
                   REG_NOSUB | REG_EXTENDED);
     if (ret)
         return 1;
-- 
2.33.0


