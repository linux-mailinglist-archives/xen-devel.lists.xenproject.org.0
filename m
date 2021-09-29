Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B60241C4EC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 14:45:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199041.352853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVYxG-0003Lh-Hj; Wed, 29 Sep 2021 12:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199041.352853; Wed, 29 Sep 2021 12:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVYxG-0003Ia-EO; Wed, 29 Sep 2021 12:44:58 +0000
Received: by outflank-mailman (input) for mailman id 199041;
 Wed, 29 Sep 2021 12:44:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2G/I=OT=yandex.ru=isaikin-dmitry@srs-us1.protection.inumbo.net>)
 id 1mVYxE-0003IR-1q
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 12:44:56 +0000
Received: from forward102p.mail.yandex.net (unknown
 [2a02:6b8:0:1472:2741:0:8b7:102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e13ae57-78b4-40f3-8600-e51c00de66f5;
 Wed, 29 Sep 2021 12:44:52 +0000 (UTC)
Received: from iva4-b3068118e41e.qloud-c.yandex.net
 (iva4-b3068118e41e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:14a6:0:640:b306:8118])
 by forward102p.mail.yandex.net (Yandex) with ESMTP id 66918393E589;
 Wed, 29 Sep 2021 15:44:49 +0300 (MSK)
Received: from iva3-dd2bb2ff2b5f.qloud-c.yandex.net
 (2a02:6b8:c0c:7611:0:640:dd2b:b2ff [2a02:6b8:c0c:7611:0:640:dd2b:b2ff])
 by iva4-b3068118e41e.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 JFJqoQ9Dp9-imDq9flO; Wed, 29 Sep 2021 15:44:49 +0300
Received: by iva3-dd2bb2ff2b5f.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id
 D9RmO3nEvp-ikxqcVOA; Wed, 29 Sep 2021 15:44:46 +0300
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
X-Inumbo-ID: 5e13ae57-78b4-40f3-8600-e51c00de66f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1632919489;
	bh=bO0ezWmpyOcx1EZo5WBqFSk2HkPLSeWwEOd1JNPNNR0=;
	h=Message-Id:Date:Subject:To:From:Cc;
	b=bgHPrd6ROwwLuzvJkz/emHb2qOqT8thC7a19wt2t5u85DbY1RtbfH+/2V7cLdEDg5
	 jBxukboCLAW2XPmVzMfGg1PanHnEQVk90K4iLGfllYH3MiVg2ZM3u1b/l2Z/YEvcgj
	 pfVPK7QmaBUTpUmxpyw9HPtvu/fsD/ihm/CADCkQ=
Authentication-Results: iva4-b3068118e41e.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
To: xen-devel@lists.xenproject.org
Cc: Dmitry Isaykin <isaikin-dmitry@yandex.ru>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4] tools/xl: fix autoballoon regex
Date: Wed, 29 Sep 2021 15:44:33 +0300
Message-Id: <57f69075b77651c64b7dc6d86acd03fe03b4a18f.1632907890.git.isaikin-dmitry@yandex.ru>
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
Changes in v4:
- improve regex after code review

Changes in v3:
- add support for [tT] granularity suffix
- add support for memory fractions

Changes in v2:
- add missing Signed-off-by tag

NB! New autoballon regex pattern is good enough, but not fully correct.
See test below.

```
import pytest
import re

size_pattern = r"-?[0-9]+[bBkKmMgGtT]?"
pattern = r"(^| )dom0_mem=((|min:|max:)({size}|({size}\+)?[0-9]{{1,2}}%),?)+($| )".format(size=size_pattern)

@pytest.mark.parametrize('cmdline', [
    'dom0_mem=1',
    ' dom0_mem=1',
    'dom0_mem=1G',
    'dom0_mem=25%',
    'dom0_mem=1g+25% ',
    ' dom0_mem=1G+10%,max:100T+50%',
    'dom0_mem=-1B',
    'dom0_mem=-10240M+5%,min:512M ',
    ' dom0_mem=min:-2048m,max:-2048M ',
])
def test_autoballoon_regex_match(cmdline):
    assert re.match(pattern, cmdline)

@pytest.mark.parametrize('cmdline', [
    'dom0_mem = 1',
    'dom0_mem= ',
    'dom0_mem',
    'DOM0_mem=10G',
    'dom0_mem=-10%', # does not pass
    ' dom0_mem=-10%+10G ',
    'dom0_mem=1G,', # does not pass
    'dom0_mem=1G,max:25%,', #does not pass
])
def test_autoballoon_regex_dont_match(cmdline):
    assert not re.match(pattern, cmdline)
```
---
 tools/xl/xl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 4107d10fd4..58af7936fa 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -80,9 +80,14 @@ static int auto_autoballoon(void)
     if (!info)
         return 1; /* default to on */
 
+#define SIZE_PATTERN "-?[0-9]+[bBkKmMgGtT]?"
+
     ret = regcomp(&regex,
-                  "(^| )dom0_mem=((|min:|max:)[0-9]+[bBkKmMgG]?,?)+($| )",
+                  "(^| )dom0_mem=((|min:|max:)(" SIZE_PATTERN "|(" SIZE_PATTERN "\\+)?[0-9]{1,2}%),?)+($| )",
                   REG_NOSUB | REG_EXTENDED);
+
+#undef SIZE_PATTERN
+
     if (ret)
         return 1;
 
-- 
2.33.0


