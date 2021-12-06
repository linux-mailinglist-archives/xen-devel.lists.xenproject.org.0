Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DC346A24B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239480.415212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSm-0001bF-2g; Mon, 06 Dec 2021 17:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239480.415212; Mon, 06 Dec 2021 17:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSl-0001ME-NE; Mon, 06 Dec 2021 17:07:39 +0000
Received: by outflank-mailman (input) for mailman id 239480;
 Mon, 06 Dec 2021 17:07:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPJ-0005ta-2M
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83437ede-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:04:03 +0100 (CET)
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
X-Inumbo-ID: 83437ede-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K4Dj/rVFjE9NpLbUJO3gjrHpVBFNDjlJe0A8PqFvnrE=;
  b=cS4FK9s+UNI/2wIWZhIPFfiiUOHcJuNu/llEuqmFKBxZywzc8G9cp0Cv
   FE9C+cBv5QoMVOOnuEP1FiSEQqsNuoc1Y8koj/BK7sW9Y12CJuC6mRHfv
   Bx5F4eeMV5sJ11EYMRkxFk/RZR9P1GP+UkJHvQDHcWXusikPisCV7Ui4N
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: iabrFiwKvGkQrp4HCnq03XzGhA4+0DmWE3LQWanf1QciZdWcmxY3j1yvT03bZU5uyYRXr3SY+D
 Hex5fJbqJPan8kqZK3eJ7MQ/mHQ/s9Qx5ffrt0Zxqw+X17X/6Vkc12U5/GLdoDBbWrXznktVQ5
 tqOc9yiG2Haek+LibX+tQNNO652oFRFJ4hKWYwiusUVfBBoKM9xTfUMjRJBsnergzZIhfdsoDE
 GZ67+5zo6eRv/IJ/arCW7BM/JtzTshJVFAWDoFkWohEgPG0lsG5LvnzQXgraUwAnmbxnhBciu0
 rL6Ry2qh8Swzjd2Eo/lpG1iJ
X-SBRS: 5.1
X-MesageID: 59370667
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:naf2Oa/6aCwNHzb+Ud8ZDrUDZnmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 WFOXDuHP/bZY2GjKYx0bt63pEkBsJKBz4c3HQc/rXg8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrRh3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgrw
 +xUvqPhQz0FN4zvpacTSDJXAgNxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp0fRqmGO
 ZRGAdZpREidRRRWIg0mNIsBwf+DpFrDSyBXomvA8MLb5ECMlVcsgdABKuH9e8OIbdVYmF6Co
 WDL9Hi/BQsVXPSAzRKV/3TqgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03A
 0US5iopq7l07EGxR8PxdxK9qX+A+BUbXrJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEeHzcTz
 1S2ztnTKTVOk4DWR2m2+aa2ombnUcQKFlMqaSgBRAoDxtDspoAvkx7CJupe/L6JYs7dQm+pn
 W3TxMQqr/BK1JNQif3nlbzSq2v0/sChc+Ij2unAsotJBCtdbZXtWYGn4EOzAR1ofNfAFQnpU
 JTpdqGjAAEy4XOlyXXlrAYlRujBCxO53Nv02wQH834JrWvFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtzqW5twnPW6T4q6Bpg4i+aihLArLmdrGwk0OiatM53FyhBwwcnTx
 7/FGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlHyaPU6lTCfNE98taQLWBshgtf/siFiFo
 r53aprRoz0CAbKWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l9UaKMmu14JNQ+90mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMBiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:jMc7gKOE7fDIqsBcTsejsMiBIKoaSvp037Eqv3ofdfUzSL3+qy
 nOpoVj6faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kXFh4hgPM
 xbHZSWZuedMbEDt7eY3DWF
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59370667"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 34/57] tools/xcutils: rework Makefile
Date: Mon, 6 Dec 2021 17:02:17 +0000
Message-ID: <20211206170241.13165-35-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use TARGETS to collect targets to build

Remove "build" target.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/xcutils/Makefile | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/tools/xcutils/Makefile b/tools/xcutils/Makefile
index 82d42624c8..198be22a5a 100644
--- a/tools/xcutils/Makefile
+++ b/tools/xcutils/Makefile
@@ -11,7 +11,7 @@
 XEN_ROOT	= $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-PROGRAMS = readnotes lsevtchn
+TARGETS := readnotes lsevtchn
 
 CFLAGS += -Werror
 
@@ -19,10 +19,7 @@ CFLAGS_readnotes.o  := $(CFLAGS_libxenevtchn) $(CFLAGS_libxenctrl) $(CFLAGS_libx
 CFLAGS_lsevtchn.o   := $(CFLAGS_libxenevtchn) $(CFLAGS_libxenctrl)
 
 .PHONY: all
-all: build
-
-.PHONY: build
-build: $(PROGRAMS)
+all: $(TARGETS)
 
 readnotes: readnotes.o
 	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(APPEND_LDFLAGS)
@@ -31,17 +28,17 @@ lsevtchn: lsevtchn.o
 	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
 .PHONY: install
-install: build
+install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-	$(INSTALL_PROG) $(PROGRAMS) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC_BIN)
 
 .PHONY: uninstall
 uninstall:
-	rm -f $(addprefix $(DESTDIR)$(LIBEXECDIR)/, $(PROGRAMS))
+	rm -f $(addprefix $(DESTDIR)$(LIBEXECDIR)/, $(TARGETS))
 
 .PHONY: clean
 clean:
-	$(RM) *.o $(PROGRAMS)
+	$(RM) *.o $(TARGETS)
 	$(RM) $(DEPS_RM)
 
 .PHONY: distclean
-- 
Anthony PERARD


