Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C69246A1F3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:03:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239436.415063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOh-0001kE-Da; Mon, 06 Dec 2021 17:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239436.415063; Mon, 06 Dec 2021 17:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOh-0001hG-98; Mon, 06 Dec 2021 17:03:27 +0000
Received: by outflank-mailman (input) for mailman id 239436;
 Mon, 06 Dec 2021 17:03:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOf-0005ta-M2
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b143b41-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:03:23 +0100 (CET)
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
X-Inumbo-ID: 6b143b41-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w1OhVzUVsrx+N6DExzCgUwZ3ahqbZkwu+S8c7CbAdw8=;
  b=ViSjD6rE/UWDJTaNOWM1wjzvA2LCCSzTEr2F36OlMcBoL7HwF67sGKTf
   X3oTjNiiaA4GSQN18Y+eo+b88ZsJu30CCRjMSmOve2iI3QybzW2M8sESF
   NLtyUoGpjyhnQAMzKxneZzCmT9/v69nn4BXso4XkfYdoofSEdFOqb0ggd
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bwRPUq4fICmYJLpimF/3ueD5XfxVp4E3AL4hfpYkj4/UihUftKhHUC8AsKBaP4DAe0uvstUWOH
 0UqN06As0HvWcRYdQFQZm0WCkK4mv5NcNdnSvIzV6boHkSjtGP7r4PxrwGbGj1TshW198t15v0
 wVTk3gC+dig9LOTdJ7giNmgRtkmgh6sU1KSTzBxvgj6QazJ0TmaSFqe4M2JEl7gOUn6IvCtrzz
 mCSfCbi52c9p7YrujQqvA+qL+iCv+yLzyqVNGlQDBr+0JDVgLXnDUxF6HX0ZBB2asj2bbbZwcR
 sl4lf1kMP272OmqQV4rWbXYQ
X-SBRS: 5.1
X-MesageID: 59370544
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KWF+IKpwVQiRakiB6bmxgvMxvEBeBmKFYhIvgKrLsJaIsI4StFCzt
 garIBnUaKvcYGr0fNh2adji9ENSvJGAn9RjSlQ/ripjQiwQo5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx24DnW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYCvTg0tOpTzo74UcTtYAR5xDK5DyqCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ptCNmIyMEiojxtnI1c+Jssep82TnWT0bBxojnGnt5oe7D2GpOB2+Oe0a4eEEjCQfu1Zhl2dp
 37G123hDwsGKceEzj6Y7nOrgPSJliT+MKoTC7+Q5vNsmEeUxGEYFFsRT1TTiea9ol6zXZRYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL86gCFBm8CX3hZZcYvrsMeSjkj1
 1vPlNTsbRRjv7GYRmiU3quFpjO1fy4OJCkNYjFscOcey4C9+sdp1EuJF4s9Vv7u5jHoJd3u6
 yyVqyI6g4wstpQC9Ye772/IsjGplIecG2bZ+T7rdm6i6wp4YqusaIqp9UXX4J58EWqJcrWSl
 CNawpbDtYjiGbnIzXXQG7tVQNlF8t7caGWE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOVS9/oYyjJ5fK5fTgAahwyRoAUCnSWXFXYlByCnWbKgwjQfLEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1nXBhnzKOH8qlkETPPV+iiJi9E+1t3LymNL9R0U95iF+Nr
 4Y32zWilX2zr9ESkgGIqNVOfDjm3FAwBIzsqtw/SwJwClEOJY3VMNeImelJU9U8x8x9z76Ul
 lngCh4w4Aeu3hXvdFTVAk2PnZuyBP6TW1pgZndyVbtpslB+CbuSAFA3K8FqIOJ5rbM7lpaZj
 ZAtIq29PxiGcRyfkxx1UHU3hNUKmM2DiV3cMiy7TiI4epI8FQXF9sW9Jlnk9TUUDzrxvsw7+
 uXy2gTeSJsFZgJjEMeJN67/kwLv5SAQyLBoQk/FAthPY0GwooJkHDP8060sKMYWJBSdmjbDj
 1SKAQ0VrPXmqpMu9IWbnriNqoqkSrMsHkdTE2TBw6yxMC3WojiqzYNaCb7adjHBTmLkvq6lY
 LwNnf37NfQGmndMspZ9TOk3nf5vuYO3quYDnAp+HXjNY1C6MZ9aIyGLjZtVq6lA5r5Fog/qC
 EiBzcZXZOeSM8T/HV9PeAd8Nraf1esZkyX55OguJBmo/zd++beKXBkAPxSIjyABfrJ5PJl8n
 LUksc8SrQe+lgArIpCNiSUNrzaAKXkJUqMGsJAGAdC01lp3mw8aOZGMWDXr5JyvaslXNhh4K
 zCZs6POmrBAyxeQaHE0D3XMgbJQiJlmVMqmF7Pey4BlQub4u8I=
IronPort-HdrOrdr: A9a23:23baMa/0SjlEZ9hPreJuk+DeI+orL9Y04lQ7vn2YSXRuHfBw8P
 re+8jztCWE8Qr5N0tApTntAsS9qDbnhPxICOoqTNOftWvd2FdARbsKheCJ/9SjIVyaygc079
 YHT0EUMrPN5DZB4foSmDPIcOod/A==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59370544"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 14/57] tools/flask/utils: remove unused variables/targets from Makefile
Date: Mon, 6 Dec 2021 17:01:57 +0000
Message-ID: <20211206170241.13165-15-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

They are no *.opic or *.so in this subdir, so no need to clean them.

The TEST* variables doesn't seems to be used anywhere, and they weren't
used by xen.git when introduced.
Both CLIENTS_* variables aren't used.
Both target "print-dir" and "print-end" only exist in this directory
and are probably not used anywhere.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/flask/utils/Makefile | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/tools/flask/utils/Makefile b/tools/flask/utils/Makefile
index ae87102144..5449f05b13 100644
--- a/tools/flask/utils/Makefile
+++ b/tools/flask/utils/Makefile
@@ -4,13 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 CFLAGS += -Werror
 CFLAGS += $(CFLAGS_libxenctrl)
 
-TESTDIR  = testsuite/tmp
-TESTFLAGS= -DTESTING
-TESTENV  = XENSTORED_ROOTDIR=$(TESTDIR) XENSTORED_RUNDIR=$(TESTDIR)
-
 CLIENTS := flask-loadpolicy flask-setenforce flask-getenforce flask-label-pci flask-get-bool flask-set-bool
-CLIENTS_SRCS := $(patsubst flask-%,%.c,$(CLIENTS))
-CLIENTS_OBJS := $(patsubst flask-%,%.o,$(CLIENTS))
 
 .PHONY: all
 all: $(CLIENTS)
@@ -35,21 +29,13 @@ flask-set-bool: set-bool.o
 
 .PHONY: clean
 clean: 
-	rm -f *.o *.opic *.so
+	rm -f *.o
 	rm -f $(CLIENTS)
 	$(RM) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
 
-.PHONY: print-dir
-print-dir:
-	@echo -n tools/flask/utils: 
-
-.PHONY: print-end
-print-end:
-	@echo
-
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
-- 
Anthony PERARD


