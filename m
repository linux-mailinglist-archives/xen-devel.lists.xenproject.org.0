Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6FB738ADC
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 18:20:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552934.863211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0ZI-0001SY-5K; Wed, 21 Jun 2023 16:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552934.863211; Wed, 21 Jun 2023 16:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0ZI-0001Pt-0S; Wed, 21 Jun 2023 16:20:28 +0000
Received: by outflank-mailman (input) for mailman id 552934;
 Wed, 21 Jun 2023 16:20:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=30K1=CJ=citrix.com=prvs=529504c83=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qC0ZG-0000tN-ES
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 16:20:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86a7faa8-104f-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 18:20:24 +0200 (CEST)
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
X-Inumbo-ID: 86a7faa8-104f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687364424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=za3buGGichHq8l7ZDrIYQqz3imkrrBJj9JEN24suhkc=;
  b=BnJ2InxGIyHAzTl85hY7P6iqsPdEBPE60odSxjFeW85R99MT69EUXIEV
   yJHrGS0Fl+rXHsk01FaGztC26zyIPw+cdqh5/vn45IEBLmD1XyYeVOeiw
   vqJaST2jXCsp9C9kA8g5NNYn8WEAXa9TM6cMrURDzj8HfEfEkS8QJelo7
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112968613
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:d68rDq1mvf/mAbqcQvbD5e1xkn2cJEfYwER7XKvMYLTBsI5bp2RSy
 2IWCjyFOfzZNmanLYslbYjl8RgP7JLUnNRjHgs5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJkPKgX1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfIzwTq
 dUdKWwxSxmDp7ik3LThcOdRmZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJwPzxjI+
 Dudl4j/KjMZNJ+0ygeMzm2D16zonT7+B5I9OKLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUtxcCfwn6ymCz6PV50CSAW1sZjxLZcEitcQ2bSc3z
 VLPlNTsbRRtrbmURHS15rqS6zSoNkA9NnQebCUJSQ8E5djLo4wpiB/LCNF5H8adkdndCTz2h
 TeQo0ADa6471JBRkf/hpBae3mzq/8KSJuIo2unJdkD4s19QYY/5W6mh6XiB/+pGdryXc0bU6
 RDohPOiAPAy4YClzXLdH79dQ+j5vZ5pIxWH3wcxQsBJGyCFvif6INsOuGwWyFJBaJ5sRNP/X
 KPEVeq9Drd3NWDiU6J4apnZ5y8Cnfm5ToSNuhw5g7NzjnlNmOyvpnsGiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymHBhnzONHc2rlUT9uVZ7WJJyYe1fWGZik8hjtP/UyOkr2
 4s32zS2J+V3D7SlP3i/HX87JlEWN3krba0aWOQOHtNv1jFOQTl7Y9eImONJRmCQt/gN/gs+1
 i3nCxAwJZuWrSGvFDhmnVgzNO+wBcoj9ilT0O5FFQ/A5kXPqL2HtM83H6bbt5F9rISPEdYco
 yE5Rvi9
IronPort-HdrOrdr: A9a23:O4+ueq38PCzK4QmNl4MYoAqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-Talos-CUID: 9a23:qAvoRGBp+nLofdL6Ews6qRI9H8F5TljUzFeKMVO+U1xndaLAHA==
X-Talos-MUID: 9a23:51LYawp+qJH4NQlFhRoezxNhNIRD4JmnNF8iwNYhu9SBajxfFyjI2Q==
X-IronPort-AV: E=Sophos;i="6.00,261,1681185600"; 
   d="scan'208";a="112968613"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 2/3] build: evaluate XEN_BUILD_* and XEN_DOMAIN on first use
Date: Wed, 21 Jun 2023 17:19:58 +0100
Message-ID: <20230621161959.1061178-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621161959.1061178-1-anthony.perard@citrix.com>
References: <20230621161959.1061178-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

With GNU make 4.4, the number of execution of the command present in
these $(shell ) increased greatly. This is probably because as of make
4.4, exported variable are also added to the environment of $(shell )
construct.

Also, `make -d` shows a lot of these:
    Makefile:15: not recursively expanding XEN_BUILD_DATE to export to shell function
    Makefile:16: not recursively expanding XEN_BUILD_TIME to export to shell function
    Makefile:17: not recursively expanding XEN_BUILD_HOST to export to shell function
    Makefile:14: not recursively expanding XEN_DOMAIN to export to shell function

So, to avoid having these command been run more than necessery, we
will use a construct to evaluate on first use.

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 9631e45cfb9b..b58c2a7f4539 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -11,10 +11,10 @@ export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
 -include xen-version
 
 export XEN_WHOAMI	?= $(USER)
-export XEN_DOMAIN	?= $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown]))
-export XEN_BUILD_DATE	?= $(shell LC_ALL=C date)
-export XEN_BUILD_TIME	?= $(shell LC_ALL=C date +%T)
-export XEN_BUILD_HOST	?= $(shell hostname)
+export XEN_DOMAIN	?= $(eval XEN_DOMAIN := $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown])))$(XEN_DOMAIN)
+export XEN_BUILD_DATE	?= $(eval XEN_BUILD_DATE := $(shell LC_ALL=C date))$(XEN_BUILD_DATE)
+export XEN_BUILD_TIME	?= $(eval XEN_BUILD_TIME := $(shell LC_ALL=C date +%T))$(XEN_BUILD_TIME)
+export XEN_BUILD_HOST	?= $(eval XEN_BUILD_HOST := $(shell hostname))$(XEN_BUILD_HOST)
 
 # Best effort attempt to find a python interpreter, defaulting to Python 3 if
 # available.  Fall back to just `python` if `which` is nowhere to be found.
-- 
Anthony PERARD


