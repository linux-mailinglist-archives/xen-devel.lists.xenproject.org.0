Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED85A46A250
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239492.415255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSs-00034T-6B; Mon, 06 Dec 2021 17:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239492.415255; Mon, 06 Dec 2021 17:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSr-0002wC-I9; Mon, 06 Dec 2021 17:07:45 +0000
Received: by outflank-mailman (input) for mailman id 239492;
 Mon, 06 Dec 2021 17:07:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOa-0005ti-Li
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 689c9f84-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:19 +0100 (CET)
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
X-Inumbo-ID: 689c9f84-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810199;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o+VIkl7f43OW2o365l1olvv7vAkXSoY1AlwWimrAG00=;
  b=THkylvUyJ5DCfhEqb6RvhlFWZay+kQisAdmvxQvS+giF4tH/D13Cob/n
   BXOXXVMDL6hJ58W81RgkQasX3nUwpQEz4Gnu7ojGdoTmozwuXWTXdCLpn
   34ZHaW6fouxbRc5Wc1D4e+/TMUsK9hwwyH6+VL/J5L6cRfxdb/E5Caok8
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0u3+9w6TGNhrEv6BTnCAmsn0lu//TRr+GLUBiUyj5sWVevqLmlzTFlq60tqodiJ4DpEl4WBbVD
 mBSA/JV/bsdIHKk8KmvM+AH4BsGEYCUjMRhizOEECYvPUM7UmOj1nFAR/IoUOUcuFj3fezBwoN
 kPb/MYMaAA+UwUPBhJjAIPq5v48XlOP0Bz1k70HePCxfVQj4D41yWnzisQ3eJp4/TqZ0I/WFxu
 sOs7snehAiFw2E40cZY6HNh0kVrvX6pBQxnfqYLEzmifHJ/nk0dYtf5JnNJb+K2ywYfsyhKu8h
 9tijHoiQOyz2cTa8VMoWX5/V
X-SBRS: 5.1
X-MesageID: 59387780
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0tTLJKBZwyv3zhVW/8/kw5YqxClBgxIJ4kV8jS/XYbTApDh00WYGy
 2AaDzrSOKmPZjD2c9Fxa4rj9EoB7ZCEyIBqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX570Uw7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/lQvSjfNsw
 oV3tI2MSSYTPvySieU3akwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcFjWxg2Z8eRZ4yY
 eIEUwJTNzLcQiZTBWkHU6t5oOSFqkLGJmgwRFW9+vNsvjm7IBZK+LnyMvLFd9qSX8JXk02E4
 GXc8AzRHRUyJNGZjz2f/RqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma3Xc5fL
 EoFvDIjt6Eo+GSkS9D8W1uzp3vsg/IHc4MOSatgsljLk/eKpVbCboQZctJfQMIY790VWDZ67
 F6Yo9PIPzw+7qyUY0vIo994sgiOESQSKGYDYwoNQg0E/8TvrekPs/7fcjpwOPXr14OoQFkc1
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
IronPort-HdrOrdr: A9a23:p5n6PK3LpLGMJROv8H3UUAqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59387780"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 12/57] tools: remove some unneeded subdir-distclean-* targets
Date: Mon, 6 Dec 2021 17:01:55 +0000
Message-ID: <20211206170241.13165-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Those two are already covered by subdir-distclean-% target in
Rules.mk.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/Makefile          | 3 ---
 tools/firmware/Makefile | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index 757a560be0..8936b754c8 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -296,9 +296,6 @@ subdir-uninstall-debugger/kdd: .phony
 subdir-all-debugger/kdd: .phony
 	$(MAKE) -C debugger/kdd all
 
-subdir-distclean-firmware: .phony
-	$(MAKE) -C firmware distclean
-
 subtree-force-update:
 ifeq ($(CONFIG_QEMU_XEN),y)
 	$(MAKE) qemu-xen-dir-force-update
diff --git a/tools/firmware/Makefile b/tools/firmware/Makefile
index 1f27117794..345037b93b 100644
--- a/tools/firmware/Makefile
+++ b/tools/firmware/Makefile
@@ -85,9 +85,6 @@ clean: subdirs-clean
 .PHONY: distclean
 distclean: subdirs-distclean
 
-subdir-distclean-etherboot: .phony
-	$(MAKE) -C etherboot distclean
-
 subdir-distclean-ovmf-dir: .phony
 	rm -rf ovmf-dir ovmf-dir-remote
 
-- 
Anthony PERARD


