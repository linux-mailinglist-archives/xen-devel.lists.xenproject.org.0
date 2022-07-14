Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842EC5750F6
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 16:40:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367663.598753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBzzq-0002fc-P7; Thu, 14 Jul 2022 14:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367663.598753; Thu, 14 Jul 2022 14:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBzzq-0002Xd-KX; Thu, 14 Jul 2022 14:39:18 +0000
Received: by outflank-mailman (input) for mailman id 367663;
 Thu, 14 Jul 2022 14:39:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SkWo=XT=citrix.com=prvs=1879e8f0d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oBzzp-0002UF-6s
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 14:39:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bba4ace8-0382-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 16:39:15 +0200 (CEST)
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
X-Inumbo-ID: bba4ace8-0382-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657809554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nc5Of1JguiIJKYdeJhWijIYiWRv/ScVk33+JiERSYGg=;
  b=KYH0OLfzZ3I0ocFT0wZbfP/EykCmbVhy1E3B5Er3oUtH+LhX67fKZoKg
   wl/oxwxiZiijxCxdm43MfIKJLZfvq9zr3FwbKo+RYn9BvB/aopS9fpAA6
   mbj4P+Pspk4J7GKyeAOK4zP2mFd3jKWa+4e9oFDIBYMIMDf5vnPr5FzsP
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 76233202
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gN8p9qD3SjtKExVW//Xjw5YqxClBgxIJ4kV8jS/XYbTApDoggz0Bz
 moXXj2EPq2La2v3Kd0jbtu09EIPvcXXx9EyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pe31GONgWYuaDpLsv7b8nuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW3S9ztlIHkQ5BIcn2MpcGCZh8
 OEjCC9YO3hvh8ruqF66Yuxlh8BlJ8j3JoIP/HpnyFk1D95/H8qFGf+To4YFgnFg3aiiHt6HD
 yYdQTNpcBTHZQwJIloNAYgytOypmmP+Y3tTr1f9Sa8fvDaJl1criOKF3Nz9J8yEX9l2tHijp
 F3Uo1zCGUEnBN2D1m/Qmp6rrrCWxn6qMG4IL5W66/prjVu71mEVThoMWjOTuuKlg0SzX9ZeL
 U08+Sc0q6U2skuxQbHVQBmQsHOC+BkGVLJ4Eec39QWMwar8+BuCCy4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9CXIJbGkqRA0O7t3nvak6lBeJRdFmeIawh8H1GDzth
 SyDtjI3g50Ll8kX0KO+9FHDxTmro/D0ohUdv1uNGDj/t0UgOdDjN9fABUXnAehoI9eUYn+Tu
 Xc9kfe8wMsXSr6IiRetX7BYdF223MppIAEwkHY2QcR+qmX1pif7FWxDyGogfRk0a67obResO
 RaO4l0Jufe/KVPwNcdKj5SN59PGJEQKPfDsTbjqY9VHefCdnyfXrXg1NSZ8M40A+XXAcJ3T2
 r/BKK5A9V5AVcxaIMOeHo/xK4MDyCEk3n/0Tpvm1Rmh2rf2TCfLFOhaawTSNr9jtPjsTODpH
 zF3bpHi9vmieLemPnm/HXA7dzjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/I7Nj7dNxvwP/s+Rp
 ynVchYBmDLX2CycQS3XOy8LVV8adcsmxZ7NFXd3ZgjANrlKSdvH0ZrzgLNtIeJ+rrUznaQrJ
 xTHEu3Zaslypv3802x1RfHAQEZKLnxHWSrm0/KZXQUC
IronPort-HdrOrdr: A9a23:RDxlcaFXdJliAEVtpLqE7seALOsnbusQ8zAXP0AYc3Nom6uj5q
 eTdZUgpGbJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQKTRekIh7cKgQeQfhEWntQts5
 uIGJIRNDSfNzRHZL7BkWqFL+o=
X-IronPort-AV: E=Sophos;i="5.92,271,1650945600"; 
   d="scan'208";a="76233202"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Date: Thu, 14 Jul 2022 15:39:06 +0100
Message-ID: <20220714143907.25938-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220714143907.25938-1-anthony.perard@citrix.com>
References: <20220714143907.25938-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

check-endbr.sh works well with gawk, but fails with mawk. The produced
$ALL file is smaller, it is missing 0x$vma_lo on every line. On mawk,
int(0x2A) just produce 0, instead of the expected value.

The use of hexadecimal-constant in awk is an optional part of the
posix spec, and mawk doesn't seems to implemented.

There is a way to convert an hexadecimal to a number be putting it in
a string, and awk as I understand is supposed to use strtod() to
convert the string to a number when needed. The expression
'int("0x15") + 21' would produce the expected value in `mawk` but now
`gawk` won't convert the string to a number unless we use the option
"--non-decimal-data".

So let's convert the hexadecimal number before using it in the awk
script. The shell as no issue with dealing with hexadecimal-constant
so we'll simply use the expression "$(( 0x15 ))" to convert the value
before using it in awk.

Fixes: 4d037425dc ("x86: Build check for embedded endbr64 instructions")
Reported-by: Luca Fancellu <Luca.Fancellu@arm.com>
Reported-by: Mathieu Tarral <mathieu.tarral@protonmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/tools/check-endbr.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/tools/check-endbr.sh b/xen/tools/check-endbr.sh
index 552f233912..64fa9a56b7 100755
--- a/xen/tools/check-endbr.sh
+++ b/xen/tools/check-endbr.sh
@@ -78,7 +78,7 @@ then
 else
     grep -aob -e "$(printf '\363\17\36\372')" -e "$(printf '\363\17\36\373')" \
          -e "$(printf '\146\17\37\1')" $TEXT_BIN
-fi | awk -F':' '{printf "%s%x\n", "'$vma_hi'", int(0x'$vma_lo') + $1}' > $ALL
+fi | awk -F':' '{printf "%s%x\n", "'$vma_hi'", int('$((0x$vma_lo))') + $1}' > $ALL
 
 # Wait for $VALID to become complete
 wait
-- 
Anthony PERARD


