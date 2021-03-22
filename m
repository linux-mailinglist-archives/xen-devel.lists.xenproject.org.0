Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 038D2344B0F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 17:20:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100356.191154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lONI3-0003cE-Bi; Mon, 22 Mar 2021 16:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100356.191154; Mon, 22 Mar 2021 16:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lONI3-0003bp-8W; Mon, 22 Mar 2021 16:20:27 +0000
Received: by outflank-mailman (input) for mailman id 100356;
 Mon, 22 Mar 2021 16:20:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FSIZ=IU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lONI1-0003bU-58
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 16:20:25 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 867f9026-ca93-46a5-8636-ebb2ce9ba8f2;
 Mon, 22 Mar 2021 16:20:23 +0000 (UTC)
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
X-Inumbo-ID: 867f9026-ca93-46a5-8636-ebb2ce9ba8f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616430023;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=y/VrRIkRtCsbqXMRtQyZrTrERhDdgdKiJmxLk/MkOGs=;
  b=BANFuIBS5RUNTOuT2yNyVgOXADS9xqOpGANYwN2Fkcd8pb5miC37ClUy
   amJFfpbrZq0HWdX+xyCvVnlxLV7azkMG1sShadYMRT2cTQzIH7dJ+PCjR
   TlY+NMjcwvhMbpOJ2uG9Qe74cF7IMXn9LaQvf5PNwKS1ULV9pDshInUej
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2pLE+HFpiq1q2zd/dDqAWPiz/i2B0PmBiJSxieKwE2w/OIVm9cfdYWhfxQCXjcHyh+FyaZi8Hw
 idMTdKNA8wfLxLhU23Vo45rrbl3LHNFHf4rZOFv0ignK7LcCpeaUldbtpol2gzfy16VoVKDVoy
 0oDB7BpDvvV60aQ4XKn1UaKRZxWZzg7FI1MJhOtwO9ld9t/pkydUiXs5TiPqivC1eQSmQ7LmHJ
 KplKonf0fttAPPN2OtaW9OnypubLtjdfeu7UEbueHbUbie9LUoFwimxfB2xdKTnqgxZ9LE1m0u
 BDA=
X-SBRS: 5.1
X-MesageID: 39823330
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:PeERgqtcZx5B7hNHSDlXjOpg7skC54Yji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjLU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Q26Y
 5JSII7MtH5CDFB5vrSyAOzH888hPyO9661jenTpk0dNT1CQadm8gt/F0K/Gkp5WAFJCfMCZe
 Ghz+BAoCetfmlSU9SjChA+LqP+jvDotLajWx4JABY79BKD5AnF1JfWGwWVty1uNw9n7qwl9Q
 H+8jDRxqLmiP2jzw+Z6mm71eUupPLE6v9uQPOBkdIULDKEsHfjWK1EV6eZtD445MGDgWxa9+
 XkmBsrM8Rt5365RAjcznXQ8jLt3zo053jpxUXwuwqEneXCWDk4B8Bd7LgpESfx1ks6sNlwlI
 JN0m6J3qAnaC/ooSXn69DEEyxtj0q/yEBS89I7sno3a+sjQY4UibZa0FJeEZ8GEi6/wpsgCv
 NSAMbV4+sTWU+GbljC11MfjOCEbzAWJFOrU0ICssua33x9h3Zi1XYVw8QZgzMp6I89cZ9Z/O
 7JW54Y241mf4szV+ZQFe0BScy4BijmWhTXKl+fJlzhCeUhN2/SrYX0pJE4/vujdpBN7JZaou
 WObHpo8UoJP27+A8yH25NGtjrXRn+mYDjrwsZCo5djvLnxQ6fqLD2DRFgin9DImYRePuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFM0Z0+xLGG6mk4buEMnHp+bbePHcKP7GCjA/QF7yBX
 MFQXz2LMVE5Ua7R2/gjHHqKjHQU3262ag1PLnR/uAVxoRIHJZLqBIphVOw4dzOLyZDvKwwdE
 53O6jmjau/uGmz8Q/zniRUEysYKnwQzKTrUntMqwNPGVjza6w/t9KWfn0XwGGKPQZlT8TdEB
 dWolN+/a7fFe3U+QkST/acdk6KhXoao3yHC6oGkqqY/MH/Z9cTFZA9QpF8Eg3NCj14kQtns3
 14dQcBX0PTfwmezZmNvdgxPqX/f8M5qBq3KcRUwEivz3m0lIUKfD8neBKAFeSQmh0jQjJIgE
 YZyd5jvJOw3RC1KWU+h+wkNkZrc2r/OsMKMC2MeJhUlrf3eAt5UGeNgniAhwsuf3fxnn9i+l
 DJPGmaf+rGDUFavW0d2qH28ElsfmHYZE5obGtm2LcNXFjuqzJ20eWRYLC03HbUYlwewvsFOD
 WtW0pkHip+g9S23gWSgjCMCDEvwYgvJPXUCPAmf6vI0n2gbI2OmqduJY4jwL91cNTvuPQMS+
 SRZkucKy75Efog30iNvWk+URME2kUMgLftwlno/WK41HkwDb7bJ0lnXagSJ5WZ43L/T/iF3Z
 1lhbsOzKONG3S0bsTDxbDcbjZFJB+Wu2KwQu0yoZ1fvK45ttJIbu3meCqN0GsC0AQ1Lc/ymk
 9bXb9y56rZPJRzO8MVYCBU8zMS5aeyBVputhazBOAwfVsg1SCGe9yI5qfFsropDAmKohDqNV
 yW7i1a+LPEUkK4pM8nIrN1JX4Tbk42rGlm9qeFcYbbDQ2xbeFN/FagKBaGAcpgYbnAHa9Vtw
 pw5tGDgvSeeCX50h3BpDcTGNMxz0+3BcepRB+WEeFG89amKU2Bj6uj7sm0lir2Q1KAGjQlrJ
 wAc1cRYMRFgiQji4Ny0jHacN2Jnn4Y
X-IronPort-AV: E=Sophos;i="5.81,269,1610427600"; 
   d="scan'208";a="39823330"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH for-4.14] tools: Fix pkg-config file for libxenstore
Date: Mon, 22 Mar 2021 16:20:13 +0000
Message-ID: <20210322162013.12639-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

There is no dependency on libxenctrl.

Fixes: 1b008e99 ("tools: provide pkg-config file for libxenstore")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Jan Beulich <JBeulich@suse.com>

This has been fixed in Xen 4.15 by the uselibs.mk logic, but 4.14 and older
cause everything linking against libxenstore to also try linking against
libxenctrl.  It also causes RPM to create unexpected dependencies between
subpackages, which is a problem when trying to separate the stable and
unstable libs.
---
 tools/xenstore/xenstore.pc.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstore.pc.in b/tools/xenstore/xenstore.pc.in
index 2f64a6b824..98c3f1ab39 100644
--- a/tools/xenstore/xenstore.pc.in
+++ b/tools/xenstore/xenstore.pc.in
@@ -8,4 +8,4 @@ Version: @@version@@
 Cflags: -I${includedir} @@cflagslocal@@
 Libs: @@libsflag@@${libdir} -lxenstore
 Libs.private: -ldl
-Requires.private: xenevtchn,xencontrol,xengnttab,xentoolcore
+Requires.private: xenevtchn,xengnttab,xentoolcore
-- 
2.11.0


