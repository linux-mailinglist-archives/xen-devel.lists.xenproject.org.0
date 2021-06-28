Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E23AE3B5F42
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 15:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147879.272999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxrX2-0006x6-A4; Mon, 28 Jun 2021 13:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147879.272999; Mon, 28 Jun 2021 13:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxrX2-0006uf-71; Mon, 28 Jun 2021 13:42:36 +0000
Received: by outflank-mailman (input) for mailman id 147879;
 Mon, 28 Jun 2021 13:42:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPZa=LW=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lxrX0-0006uZ-GC
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 13:42:34 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79d6af25-9e46-4954-944d-a37b6652b773;
 Mon, 28 Jun 2021 13:42:33 +0000 (UTC)
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
X-Inumbo-ID: 79d6af25-9e46-4954-944d-a37b6652b773
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624887753;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5GABtzq/aApw+RmaCklAMEhAkSpVLs8/ZGT9NtYDllw=;
  b=IrLyyvs+5M2lB2mwgDyT5AaKKizPBRcejdxVOdLJmu17g+kmmRsMAzqi
   WRPtFf7UY38NBP8aW78PR7aG5wdpL8jkUHiTAtjmhO3rEtuQgwgLKiDHz
   eWTlMC5SLLoaWcTfTvQQdHx0kGgOp+Wqrc1YplgYy180Bgu5VdCg7TOuq
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: LOVd+2YJSp/+4OH/j3/N4E1gvEKfNex1rOR3qesyCciiE+fJtZZNMhfg3zvi3Z5+HjhH+uXgdA
 qrw89qXWLp3Ym16c+AotBa1ExQaeQxJQ9hzN0xTakk9of4kuGV5oOXRbNzj2+fRKQA5OWE9jcV
 eb00YJALzi/16TrTTIMF97MWbf4ogMcx5bl5dNJcVaWUf0ITNfOVXBdWnjGKKd1N8ePs72iYOw
 8z8C7kn+yGZkONYVGKPlfOqzeWfO9fE71V+oEjp7h66a1tl1SpR1OpF5tuPGlUMQ2CTrplyjBM
 3tU=
X-SBRS: 5.1
X-MesageID: 47472394
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:evEiqqB3klI8HDTlHemm55DYdb4zR+YMi2TC1yhKJiC9Ffbo8v
 xG/c5rsiMc5wxxZJhNo7290cq7MBHhHPxOgbX5VI3KNGKNhILBFvAH0WKI+VPd8kPFmtK1rZ
 0QEJRDNA==
X-IronPort-AV: E=Sophos;i="5.83,306,1616472000"; 
   d="scan'208";a="47472394"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH] Config.mk: re-pin OVMF changeset and unpin qemu-xen
Date: Mon, 28 Jun 2021 14:42:17 +0100
Message-ID: <20210628134217.47622-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

qemu-xen tree have a osstest gate and doesn't need to be pinned.

On the other hand, OVMF's xen repository doesn't have a gate and needs
to be pinned. The "master" branch correspond now to the tag
"edk2-stable202105", so pin to that commit.

Fixes: a04509d34d72 ("Branching: Update version files etc. for newly unstable")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Config.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.mk b/Config.mk
index 9a174c77f383..f9dce4549b7c 100644
--- a/Config.mk
+++ b/Config.mk
@@ -244,8 +244,8 @@ QEMU_TRADITIONAL_URL ?= git://xenbits.xen.org/qemu-xen-traditional.git
 SEABIOS_UPSTREAM_URL ?= git://xenbits.xen.org/seabios.git
 MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
 endif
-OVMF_UPSTREAM_REVISION ?= master
-QEMU_UPSTREAM_REVISION ?= 7ea428895af2840d85c524f0bd11a38aac308308
+OVMF_UPSTREAM_REVISION ?= e1999b264f1f9d7230edf2448f757c73da567832
+QEMU_UPSTREAM_REVISION ?= master
 MINIOS_UPSTREAM_REVISION ?= 051b87bb9c19609976fb038f386920e1ce5454c5
 
 SEABIOS_UPSTREAM_REVISION ?= rel-1.14.0
-- 
Anthony PERARD


