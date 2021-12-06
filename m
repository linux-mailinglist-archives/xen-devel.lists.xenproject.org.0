Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DC946A27C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:09:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239546.415589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHUS-00055R-Gx; Mon, 06 Dec 2021 17:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239546.415589; Mon, 06 Dec 2021 17:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHUS-0004xI-72; Mon, 06 Dec 2021 17:09:24 +0000
Received: by outflank-mailman (input) for mailman id 239546;
 Mon, 06 Dec 2021 17:09:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPI-0005ta-2K
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:04 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81e9c64e-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:04:02 +0100 (CET)
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
X-Inumbo-ID: 81e9c64e-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lpc84js2a7j5ldQO1A3ja4tbuLNhFUTRDx1cJp21TZ8=;
  b=eOPBwlimQoYdiwIenV0vriJLN4D6h/+/KeJjTn8CqHBc2gELjOyNRi8R
   JKIP83lSSNK8IG0bmzCqKmcQ96+Romg8x+JerCfvDi+jstMCPAu7VpeOt
   oMcKMt0fY2dqLeZ2EiHez3cLvI15Hjk3oXqWZdnQF17U2gCLVKd3V6ebH
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: j0KG2gvRPE/D7iuQvUkz21OplqOlk31EUGpuyIOfhrP17do5sM7CQ/I8VUgf8lL8oRL/Xw1Nl2
 FwopbUsdB6ioUrMph607yshOEgEiMRkNNvbvF+gcH1Q7Jgqb2CMBuqgHEX75V9BdC2RYEDnUTD
 KZ55tUQ+QxjG9J6Sky3VCBp4kxzF6yBQ5H24KvpubIWuWkv8ZZfh6x8npSb6b8Ob55fREwXPDS
 GazovbgsOKuhilHVXC4O9uz5UY1JR8gK6zqy+Tb03ekiz9J6qG8vonl/da9La4UXM8ijNgWJ8j
 kM0TG6xeOo1RXX5kWAuZb5J5
X-SBRS: 5.1
X-MesageID: 59370662
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eLD++6DMLgMZFRVW/8/kw5YqxClBgxIJ4kV8jS/XYbTApGwlgmBVy
 GdJUGDSOaqLZmSne4onb4u+oUIOsMeHzt9qQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX570Uw7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/0BmquPN7k
 vR0qbu7RSdwAIeUp8EtekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFjWxv3p4QR54yY
 eIEajZpMkjnTCF3AQ83A455gsuugljWJmgwRFW9+vNsvjm7IBZK+LnyMvLFd9qSX8JXk02E4
 GXc8AzRHRUyJNGZjz2f/RqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma3Xc5fL
 EoFvDIjt6Eo+GSkS9D8W1uzp3vsg/IHc4MOSatgsljLk/eKpVbCboQZctJfQIcKl+gVT2YL7
 0OulN/JXAJF6IKweVvIo994sgiOESQSKGYDYwoNQg0E/8TvrekPs/7fcjpwOPXr14OoQFkc1
 xjP9XFj3OtL0abnwo3ipQif6w9AsKQlWeLcCu//emu+pj10a4e+D2BDwQiKtK0QRGp1o7Tog
 ZTlpyR8xL1XZX1uvHbUKAnoIF1Pz6zfWNE7qQQwd6TNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0Nv8oOdPsUZ50kviI+THZuhb8NIAmjn9ZLlDvwc2TTRTIgzCFfLYEz8nTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+8zN7Ti7eHwP9Dz+ieD2TCfMEd8taQLSBshkvPLsiFiEq
 L53aprVoyizpcWjO0E7B6ZIdgtURZX6bLirw/FqmhmrflA7RTp/UqCJmtvMueVNxsxoqwsBx
 VnlMmcw9bY1rSavxdyiZi8xZbXxc4x4qH5nbyUgMUzxgyooYJq17bdZfJwyJOF1+OtmxP9yb
 v8EZ8TfXagfFmWZo2wQPcvnsYhvVBW3ngbSbSCrVycyIsx7TAvT9966Iga2rHsSDjC6vNcVq
 qG70l+JWoIKQglvVZ6EaP+mw16rk2IaneZ+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPnd/YmzEuZ4Ek5LJEXh7O67ZXvA426u4Y5cS+LULzrTY3z5pfe5b
 uJPwvCibPBexARWs5BxGqpAxL4l44e9vKdTywlpESmZb1mvDb88cHCK0dMW6/9Iz75d/wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0jegSNQG7J5LYc5z
 Lpzo8UR8QG+1kInP9vuYvq4LIhQwqjsi5kai6w=
IronPort-HdrOrdr: A9a23:0n9VZ676BiLXgfkzbAPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59370662"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 33/57] tools/vchan: Collect targets in TARGETS
Date: Mon, 6 Dec 2021 17:02:16 +0000
Message-ID: <20211206170241.13165-34-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

And use the new TARGETS to clean them. Now "clean" will remove
"vchan-socket-proxy".

$(RM) already have the "-f" flags, so remove the second one.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/vchan/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/vchan/Makefile b/tools/vchan/Makefile
index a731e0e073..c886c22e12 100644
--- a/tools/vchan/Makefile
+++ b/tools/vchan/Makefile
@@ -11,8 +11,10 @@ NODE2_OBJS = node-select.o
 $(NODE_OBJS) $(NODE2_OBJS): CFLAGS += $(CFLAGS_libxenvchan) $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
 vchan-socket-proxy.o: CFLAGS += $(CFLAGS_libxenvchan) $(CFLAGS_libxenstore) $(CFLAGS_libxenctrl) $(CFLAGS_libxengnttab) $(CFLAGS_libxenevtchn)
 
+TARGETS := vchan-node1 vchan-node2 vchan-socket-proxy
+
 .PHONY: all
-all: vchan-node1 vchan-node2 vchan-socket-proxy
+all: $(TARGETS)
 
 vchan-node1: $(NODE_OBJS)
 	$(CC) $(LDFLAGS) -o $@ $(NODE_OBJS) $(LDLIBS_libxenvchan) $(APPEND_LDFLAGS)
@@ -30,7 +32,7 @@ install: all
 
 .PHONY: clean
 clean:
-	$(RM) -f *.o vchan-node1 vchan-node2 $(DEPS_RM)
+	$(RM) *.o $(TARGETS) $(DEPS_RM)
 
 distclean: clean
 
-- 
Anthony PERARD


