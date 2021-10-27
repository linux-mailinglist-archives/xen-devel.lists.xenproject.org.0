Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A745243D21C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 22:08:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217198.377093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfpCp-00020Q-KW; Wed, 27 Oct 2021 20:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217198.377093; Wed, 27 Oct 2021 20:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfpCp-0001xr-Gu; Wed, 27 Oct 2021 20:07:27 +0000
Received: by outflank-mailman (input) for mailman id 217198;
 Wed, 27 Oct 2021 20:07:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMsA=PP=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mfpCn-0001xl-N5
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 20:07:25 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fd9d3ba-3761-11ec-8484-12813bfff9fa;
 Wed, 27 Oct 2021 20:07:24 +0000 (UTC)
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
X-Inumbo-ID: 7fd9d3ba-3761-11ec-8484-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635365244;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V33m3v63LC16O+vDvWblrhoA4NK0Cb2mmG8ztXFT6fo=;
  b=T2hUGOEmjyod3q4D91ozKKseDFumI7WNr+K8lFrjL6Ra9+w5RuE3up/Z
   YETTGZmbC/2o1LXppltrK+ba1OLRbcDp8ncKYuFe/tqE4U6qKJcB61mXm
   8NcMAFmZP+AMW26aPcSrnHAMl3X2DKyyvG30lWEZ/sNM2Unid+wq9mQ7K
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: BbQZr1aRdwIkuFaquRS7cSViqFtnf+JMrqL/1ynUsz42973fNPxg/r+H4Pwjs8itO3LMt2kCPF
 /nHD07j70Ue0yXmnvdK6cipIA7y8c2q0dpzCAv1qu+1/l0rMqEdezpT5B4V50oIx7A8G54p6hm
 TxyCtMUMUMEpLxy3t7fHas7oHFy5lAxylikD1yFDRnUKFw2fl+fAotJfSF1uRBtNCoxvk4Qxcg
 s5mVzYsXRNHg7xO7yWLBOwalOIVdyh2ZgYEjuyOy65L+h/7csxLbOjRS9aGaSWFxLNYIUIMBqG
 pKAjOvt7dZ1wtCs+EOShxPko
X-SBRS: 5.1
X-MesageID: 56878025
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1nTlQ68AZdzE8JI8GSZ+DrUDZHmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 2seWTvUOPqJM2Gjet1wOY3go0wGscCDyNdlQAtl+S48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrZj3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgp7
 dpvs7/gWT1yI7Hnkb8/aUhcMAhhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp0QTamOP
 5BEAdZpRBXqTRRtYkwcMZlgk+H4v3XOXRhRo13A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/nv7KgEXMsSFzjiI+W7qgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03A
 24+9zcqrKMy3Fe2VdS7VBq9yENopTZFBYAWSbdjrljQlOyEuG51G1ToUBYZTdMEsuxmVQZxy
 0OilojLP21rk5SKHCf1GqivkRu+Pi0cLGknbCACTBcY79SLnLzfni4jXf44T/br1oyd9SXYh
 mnQ9nBn1up7Ydsjjv3jpTj6bySQSo8lp+Lfzj7cWX659UtHbYqhap3ABbPzvKsYctjxorVsu
 hE5dymiAAImUc7leM+lGrxl8FSVCxCtamW0bblHRMBJythV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEsPtjuUJRwlfG4SLwJs8w4iPIUOvCdkyfcpUlTibO4hTixwCDAb4lmY
 f93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcuT8vhT6pLHPCT9Ye5caDOmN7llhIvZ8FS92
 4sObKOilkQAONASlwGKqOb/23hRdiNlbX03wuQKHtO+zv1OQzB8VaWJm+p9K+SIXc19z4/1w
 510YWcAoHKXuJENAV/ihqlLZOy9UJBhg2g8OCBwb1+k12J6OdSk7bsFdotxdr4irbQxwflxR
 vgDWsOBHvUQFWiXp2VDNcHw/N54aRCmpQOSJC75MjIxSIFtGl7S8dj+cwqxqCRXVnirtdEzq
 qGL3x/ARcZRXBxrCcvbMar9z164sXUHtvh1Wk/EfotadEn2qdA4IC3tlP4nZcoLLEyblDed0
 g+XBzYepPXM/NBpoIWY2/jcot7wQeVkH0dcE23K1pqMNHHXrji53ItNcOeUZjSBBmn6z7qvO
 LdOxPbmPfxZwFsT69hgE6xmxL4V7sf0o+MI1RxtGXjGYgj5Cr5kJXXaj8BDurcUm+1csAqyH
 EmO5sNbKfOCP8a8SAwdIw8sb+Ki0/AIm2aNsaRpcRuivCInrqCaVUhyPgWXjH0PJbR4B4op3
 OM9tZNE8Ae4kBcrbo6Lgy08G75g9ZDcv3HLbq0nPbI=
IronPort-HdrOrdr: A9a23:DmuOPa/9YiIiu6FsAShuk+DWI+orL9Y04lQ7vn2YSXRuE/Bw8P
 re+sjztCWE7wr5N0tQ+uxoVJPufZq+z+8Q3WByB8bBYOCOggLBR+sOgbcKqweQYhEWndQ86U
 4PScZD4aXLfD1Hsfo=
X-IronPort-AV: E=Sophos;i="5.87,187,1631592000"; 
   d="scan'208";a="56878025"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH] x86/passthrough:  Fix hvm_gsi_eoi() build with GCC 12
Date: Wed, 27 Oct 2021 21:07:13 +0100
Message-ID: <20211027200713.22625-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

GCC master (nearly version 12) complains:

  hvm.c: In function 'hvm_gsi_eoi':
  hvm.c:905:10: error: the comparison will always evaluate as 'true' for the
  address of 'dpci' will never be NULL [-Werror=address]
    905 |     if ( !pirq_dpci(pirq) )
        |          ^
  In file included from /local/xen.git/xen/include/xen/irq.h:73,
                   from /local/xen.git/xen/include/xen/pci.h:13,
                   from /local/xen.git/xen/include/asm/hvm/io.h:22,
                   from /local/xen.git/xen/include/asm/hvm/domain.h:27,
                   from /local/xen.git/xen/include/asm/domain.h:7,
                   from /local/xen.git/xen/include/xen/domain.h:8,
                   from /local/xen.git/xen/include/xen/sched.h:11,
                   from /local/xen.git/xen/include/xen/event.h:12,
                   from hvm.c:20:
  /local/xen.git/xen/include/asm/irq.h:140:34: note: 'dpci' declared here
    140 |             struct hvm_pirq_dpci dpci;
        |                                  ^~~~

The location marker is unhelpfully positioned and upstream may get around to
fixing it.  The complaint is intended to be:

  if ( !((pirq) ? &(pirq)->arch.hvm.dpci : NULL) )
                  ^~~~~~~~~~~~~~~~~~~~~~

which is a hint that the code is should be simplified to just:

  if ( !pirq )

Do so.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>

Request for 4.16, as being very low risk.

This is a build problem with a soon-to-be-released compiler, but the issue it
highlights is real and the fix is a clear improvement in code quality.  There
is no difference in the compiled binary as a result of this change.

  $ diff -u dis-before dis-after
  --- dis-before       2021-10-27 21:00:07.512530321 +0100
  +++ dis-after        2021-10-27 21:00:25.996752544 +0100
  @@ -1,5 +1,5 @@

  -xen-syms-before:     file format elf64-x86-64
  +xen-syms-after:     file format elf64-x86-64

   Disassembly of section .text:

If this does not get taken at this point, it will need backporting after the
release, when GCC 12 is released.
---
 xen/drivers/passthrough/x86/hvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 351daafdc9bf..22bf84639f22 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -902,7 +902,7 @@ static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
     struct pirq *pirq = pirq_info(d, gsi);
 
     /* Check if GSI is actually mapped. */
-    if ( !pirq_dpci(pirq) )
+    if ( !pirq )
         return;
 
     hvm_gsi_deassert(d, gsi);
-- 
2.11.0


