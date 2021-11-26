Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C745EEA1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232784.403812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawR-0004BW-GS; Fri, 26 Nov 2021 13:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232784.403812; Fri, 26 Nov 2021 13:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawR-0003yh-8n; Fri, 26 Nov 2021 13:07:03 +0000
Received: by outflank-mailman (input) for mailman id 232784;
 Fri, 26 Nov 2021 13:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqav8-0002zD-HD
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:42 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e17ee3d-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:05:41 +0100 (CET)
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
X-Inumbo-ID: 8e17ee3d-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rj13aauZ5p/MtXm9lZgjoTPFAuAFcCO95ql16j4Ncjk=;
  b=KFNTYugEMJ9BRHAVbHhF+ZQJN05DCEhGjr2V0OunvXuHAoO3fWFdhaPk
   JqQz4E8SG8x/Br9LY/EJ2FiXOJ/pkGGOlvrjSOEFkstBjZA8Jh0mGPlTN
   8rSdcQDbyIkuX37Ujtf1rdBIn/k0w5mX7kMYOve6n8ulpM9pcCMGULXj6
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1c/C4dHXEf3cDxntLF1CvYAOF9ZtVrjHWTbw0UM8D///AVi5TL6nGQlUl4auXKmXn22nKIhprj
 TQNVx33bb5ZnM/4/Y+iuhfevxBJgHGl973nBg4eiEGcENeM5f9Vvjb367bAAtsBCE13Dg75Wzi
 RhBPRwzt6tYLv4HGUxQ+2RoOOLaSdB8gllcrsGlNgoCfYGiTyayhAFho+thnyPypXz2W5dnyuY
 m3bYeJLkpP6YfNvePLiXG9YyEtwR4j5xDu+0jJL9q7RLoflqrFRCEunv9Exo1vWdSA64Ph0m30
 owsXgGIF+Fk8Xv14+K070UQd
X-SBRS: 5.1
X-MesageID: 59064039
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rmyK5KN7ynEs+UjvrR1okMFynXyQoLVcMsEvi/4bfWQNrUp0gmMDn
 TQdDT2Aaa7YazeneIgjPIW0oBsD7cTTmtQyTAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Eg9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYow+7hN1uz
 I5Hj6y9Qi4MNPPmnOojdxYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWZo2JwWRqe2i
 8wxMChTdhjbaUJ0FQlQOL8flcKUl0j6bGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvla+jAURRN4LGdcK5Qqk76CKyQKXOEwLG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslO+ZJhKTysDA3CMqsyq7CFTFtW
 1BexqCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sPsG8jexY1bJpfEdMMX
 KM1kVgKjHO0FCH3BZKbnqrrU5h6pUQePYiNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid940kFDbClPHCIqdV7wJJjBSFTOK0aYvd/LoarSjeK0kl7YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:8tL796A9HyFJHj7lHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="59064039"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 58/65] x86/alternatives: Clear CR4.CET when clearing CR0.WP
Date: Fri, 26 Nov 2021 12:34:39 +0000
Message-ID: <20211126123446.32324-59-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This allows us to have CET active much earlier in boot.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Still TODO: Implement alternatives in a way which doesn't depend on clearing
CR0.WP
---
 xen/arch/x86/alternative.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 436047abe021..ec24692e9595 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -333,9 +333,13 @@ static int __init cf_check nmi_apply_alternatives(
      */
     if ( !(alt_done & alt_todo) )
     {
-        unsigned long cr0;
+        unsigned long cr0, cr4;
 
         cr0 = read_cr0();
+        cr4 = read_cr4();
+
+        if ( cr4 & X86_CR4_CET )
+            write_cr4(cr4 & ~X86_CR4_CET);
 
         /* Disable WP to allow patching read-only pages. */
         write_cr0(cr0 & ~X86_CR0_WP);
@@ -345,6 +349,9 @@ static int __init cf_check nmi_apply_alternatives(
 
         write_cr0(cr0);
 
+        if ( cr4 & X86_CR4_CET )
+            write_cr4(cr4);
+
         alt_done |= alt_todo;
     }
 
-- 
2.11.0


