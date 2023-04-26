Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E236EF2CB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 12:52:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526636.818527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prclV-0002EN-ND; Wed, 26 Apr 2023 10:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526636.818527; Wed, 26 Apr 2023 10:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prclV-0002Be-K6; Wed, 26 Apr 2023 10:52:49 +0000
Received: by outflank-mailman (input) for mailman id 526636;
 Wed, 26 Apr 2023 10:52:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HkN=AR=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1prclU-0001z0-9t
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 10:52:48 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a7ba89e-e420-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 12:52:46 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz3QAqgIFZ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 26 Apr 2023 12:52:42 +0200 (CEST)
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
X-Inumbo-ID: 7a7ba89e-e420-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1682506362; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=fDSnyS0AnPUWEsBPNKZT8Fza6aye84168oMlcIM8ES38acohynGIhJgSIczWo1zrpX
    hZYCwtxQqZF0pZpG2VAyy309HMj8OKY/TB+AvaRv8w7P15DLVmTaYVnf7Mk2ADLtmXOd
    hzO5T1JklfEO1XZR/VNAN6qj3Ln/qiSqbNgz2vcqfHa2DBBxOlwrgNdDk0yWXFYcd5vx
    26GI4PqpSgYOxp2dtbyqUaFb4OuMwxei52tb4EJmC7vokJc7avT2erKcXLkipq/TAigz
    pKZcSxW9arADq6ypCZVbavWamAQC5R6Xxc6De8+em4vS4g8TUpG06z2mBZo1vGLl9fAW
    LLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1682506362;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=FGgNeMXD1fpexIJRy+L7hZ4dIGHGd8+SytNB0T7EbIo=;
    b=D6/CsQ4f0aYGmnI0YT7CETI+l2HWhROAw1BLQt0yUFC8egLStQawlDenTYK993ucbo
    7+VM0xSi43KAo1JzEWGNNeA4rP7HSmR1zn+TM9gU73Y5g+jHgBWfk3cGUsQyXsvtN07T
    i1gAboA4ww9SROyDQU44MGoNcqhI3JCR98FWxLZ6uiKcg/Y58x+zTeffjtpFdiUI1ZAH
    QK3iyo6Xi21+hjKmVsg/V1TDrePyoxJgnQ1Xz4e6joMYbi4R0w74r6XXLi5oqORElRfn
    ZtgYwUkMJoFut1ainqGyN+Hs4o6QlzX3O6VqH5RA8goyXGn+G2riBItZCKCrnWKpGkEL
    Ko/g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1682506362;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=FGgNeMXD1fpexIJRy+L7hZ4dIGHGd8+SytNB0T7EbIo=;
    b=qcUqHBrMyUw+8k9zC8a2mxDix5kVQgxLggr4op3S+S2ppeKaJ9gbMOQ968dfBnFA3L
    rA9gWFqvNJpxdNLUXMLtUo36MSYOBnMzXr3dkOMBFZYtEJMoh1Xm6Hm1rmzr3GLukdvV
    730t1qqPB7R80E/2bgpS5WKvJ/gTDVqWBGQf1+PW5j7I6J6p0zvaLA6qffloxvnLNFoh
    BZy27wl8q6UHlp5gwkAgAQJ42GYOGIXzAZ64Ia+KBADMzgDAcFDArgDfKhLLz4xc3qVu
    dHRxmFjb2oeWfkxLxT/ExyvZXTCqcS7k0mXIYJqCTqrjAe8QCJVEYMEy2MFSNAEkXoNE
    nXjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1682506362;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=FGgNeMXD1fpexIJRy+L7hZ4dIGHGd8+SytNB0T7EbIo=;
    b=8Y0W7mwTenpHKm7zfzP8w9KqGro7xUbeRKJJ13DUR8LjhgRkfhCpH0QO6dnr5oFKsC
    yVpNEll8ofCKJxgXnZDA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4wqlr7GpgtSxIX+ZWs95M7PYKTHoBaxED20qrwFA=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v1] stubdom: fix errors in newlib:makedoc
Date: Wed, 26 Apr 2023 10:52:39 +0000
Message-Id: <20230426105239.2496-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

rpm post-build-checks found a few code bugs in newlib, and marks them as
errors. Add another newlib patch and apply it during stubdom build.

[  227s] ../../../../newlib-1.16.0/newlib/doc/makedoc.c: In function 'lookup_word':
[  227s] ../../../../newlib-1.16.0/newlib/doc/makedoc.c:1147:10: warning: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
[  227s]       if (strcmp(ptr->word, word) == 0) return ptr;
[  227s]           ^

[  460s] I: Program is using implicit definitions of special functions.
[  460s]    these functions need to use their correct prototypes to allow
[  460s]    the lightweight buffer overflow checking to work.
[  460s]      - Implicit memory/string functions need #include <string.h>.
[  460s]      - Implicit *printf functions need #include <stdio.h>.
[  460s]      - Implicit *printf functions need #include <stdio.h>.
[  460s]      - Implicit *read* functions need #include <unistd.h>.
[  460s]      - Implicit *recv* functions need #include <sys/socket.h>.
[  460s] E: xen implicit-fortify-decl ../../../../newlib-1.16.0/newlib/doc/makedoc.c:1147

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---

Depends on newlib-cygmon-gmon.patch

 stubdom/Makefile             |  1 +
 stubdom/newlib-makedoc.patch | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 stubdom/newlib-makedoc.patch

diff --git a/stubdom/Makefile b/stubdom/Makefile
index cddbbe2da0..a21e1c3fa3 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -96,6 +96,7 @@ newlib-$(NEWLIB_VERSION): newlib-$(NEWLIB_VERSION).tar.gz
 	patch -d $@ -p1 < newlib-stdint-size_max-fix-from-1.17.0.patch
 	patch -d $@ -p1 < newlib-disable-texinfo.patch
 	patch -d $@ -p1 < newlib-cygmon-gmon.patch
+	patch -d $@ -p1 < newlib-makedoc.patch
 	find $@ -type f | xargs perl -i.bak \
 		-pe 's/\b_(tzname|daylight|timezone)\b/$$1/g'
 	touch $@
diff --git a/stubdom/newlib-makedoc.patch b/stubdom/newlib-makedoc.patch
new file mode 100644
index 0000000000..90678f1b63
--- /dev/null
+++ b/stubdom/newlib-makedoc.patch
@@ -0,0 +1,35 @@
+stubdom: fix errors in newlib
+
+rpm post-build-checks found a few code bugs in newlib, and marks them as
+errors. Add another newlib patch and apply it during stubdom build.
+
+[  227s] ../../../../newlib-1.16.0/newlib/doc/makedoc.c: In function 'lookup_word':
+[  227s] ../../../../newlib-1.16.0/newlib/doc/makedoc.c:1147:10: warning: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
+[  227s]       if (strcmp(ptr->word, word) == 0) return ptr;
+[  227s]           ^
+
+[  460s] I: Program is using implicit definitions of special functions.
+[  460s]    these functions need to use their correct prototypes to allow
+[  460s]    the lightweight buffer overflow checking to work.
+[  460s]      - Implicit memory/string functions need #include <string.h>.
+[  460s]      - Implicit *printf functions need #include <stdio.h>.
+[  460s]      - Implicit *printf functions need #include <stdio.h>.
+[  460s]      - Implicit *read* functions need #include <unistd.h>.
+[  460s]      - Implicit *recv* functions need #include <sys/socket.h>.
+[  460s] E: xen implicit-fortify-decl ../../../../newlib-1.16.0/newlib/doc/makedoc.c:1147
+---
+ newlib/doc/makedoc.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: newlib-1.16.0/newlib/doc/makedoc.c
+===================================================================
+--- newlib-1.16.0.orig/newlib/doc/makedoc.c
++++ newlib-1.16.0/newlib/doc/makedoc.c
+@@ -38,6 +38,7 @@ There is  no
+ #include "ansidecl.h"
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <ctype.h>
+ 
+ #define DEF_SIZE 5000

