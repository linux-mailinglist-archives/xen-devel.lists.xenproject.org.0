Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6FD41ED56
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 14:25:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200590.355113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWHaW-0001An-Gh; Fri, 01 Oct 2021 12:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200590.355113; Fri, 01 Oct 2021 12:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWHaW-00017U-DI; Fri, 01 Oct 2021 12:24:28 +0000
Received: by outflank-mailman (input) for mailman id 200590;
 Fri, 01 Oct 2021 12:24:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81MA=OV=yandex.ru=isaikin-dmitry@srs-us1.protection.inumbo.net>)
 id 1mWHaU-00017J-9Y
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 12:24:26 +0000
Received: from forward103j.mail.yandex.net (unknown [5.45.198.246])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac2f2a9e-3bbd-40cd-b167-6b5527d66fe2;
 Fri, 01 Oct 2021 12:24:23 +0000 (UTC)
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
 by forward103j.mail.yandex.net (Yandex) with ESMTP id B5AF4100B45;
 Fri,  1 Oct 2021 15:24:20 +0300 (MSK)
Received: from vla1-faefe240866f.qloud-c.yandex.net
 (vla1-faefe240866f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:98f:0:640:faef:e240])
 by forward100q.mail.yandex.net (Yandex) with ESMTP id B189D6F40014;
 Fri,  1 Oct 2021 15:24:20 +0300 (MSK)
Received: from vla1-62318bfe5573.qloud-c.yandex.net
 (2a02:6b8:c0d:3819:0:640:6231:8bfe [2a02:6b8:c0d:3819:0:640:6231:8bfe])
 by vla1-faefe240866f.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 64SiCh0TmR-OKFeHp6E; Fri, 01 Oct 2021 15:24:20 +0300
Received: by vla1-62318bfe5573.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id
 ZeWstiiHda-OJ38tSTD; Fri, 01 Oct 2021 15:24:19 +0300
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
X-Inumbo-ID: ac2f2a9e-3bbd-40cd-b167-6b5527d66fe2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1633091060;
	bh=bgmuj30dggJ7JshrLX22yk3c/wj3X4um4/1rOX+GNV8=;
	h=Message-Id:Date:Subject:To:From:Cc;
	b=Jf0BGjyM4VfJWgVBAtilRqTFxxfRbqscRW/q9fNRpGUUUL79t1lHF26C7d6kNAmbC
	 h/Cf+kFwiKPPDejFjCSIveJO24RSym6WYRA2vAqM3yG/WNnwVuc5M9NqJHPZl/61L6
	 Ey0bKK7hDCL55kOPEtE0/SzYCMASaD02wwXhDrHc=
Authentication-Results: vla1-faefe240866f.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
To: xen-devel@lists.xenproject.org
Cc: Dmitry Isaykin <isaikin-dmitry@yandex.ru>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5] tools/xl: fix autoballoon regex
Date: Fri,  1 Oct 2021 15:24:16 +0300
Message-Id: <54c1bcb40afa8a6f36ab4bec8c91523a535c911b.1633090722.git.isaikin-dmitry@yandex.ru>
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
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes in v5:
- add Anthony's reviewed-by

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
 tools/xl/xl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 4107d10fd4..f422f9fed5 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -80,14 +80,20 @@ static int auto_autoballoon(void)
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
 
     ret = regexec(&regex, info->commandline, 0, NULL, 0);
     regfree(&regex);
+
     return ret == REG_NOMATCH;
 }
 
-- 
2.33.0


