Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAD0500C5B
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 13:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304645.519321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nexwY-0000rW-8H; Thu, 14 Apr 2022 11:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304645.519321; Thu, 14 Apr 2022 11:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nexwY-0000pF-49; Thu, 14 Apr 2022 11:47:22 +0000
Received: by outflank-mailman (input) for mailman id 304645;
 Thu, 14 Apr 2022 11:47:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNZz=UY=citrix.com=prvs=096427a9b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nexwW-0000HT-R1
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 11:47:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2bf2525-bbe8-11ec-8fbd-03012f2f19d4;
 Thu, 14 Apr 2022 13:47:19 +0200 (CEST)
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
X-Inumbo-ID: a2bf2525-bbe8-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649936839;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CH3WALc2pdQJlbn3pdA2593xBH2ZikyRFSuJJBSgE9k=;
  b=ClVBkZloSLfB2XV/cGhqVzwObiiFZ39YnXsqnaRowqF95unwoxoSwkZN
   UaE8PWt6SY693HUMnPJPU0DmQ8jZc3zg2/ME5RrAx8KyOLaWD2n89TnTq
   pXaGO9I3yE4ZNoMI/+0h3Xr7EUpeiQfafbYsJkMKtNldEXY4leHKR8wld
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68353099
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xxZC3aPTxzDrpPvvrR2gl8FynXyQoLVcMsEvi/4bfWQNrUpw3zZRm
 jAaWzuCPPaNYWGmKIxzbduw8UsCsZKBnN5kTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl29Iw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 I9tjo2rTSMTebTxn8oETENHTSR5BPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQTa2DP
 JJIOFKDajyacT1MM0gnL6kXp9qVj0jlMG0fun2a8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc8YKM9Yr8wWp8O3N3gG3H3deUWBEb+Vz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbv1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4P+RECnCBtJ6sybp1qHHb7
 RDofODEsogz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0vdB0xa5hYImS0C
 KM2he+3zMUCVJdNRfUpC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLSnPHKGoNJJcAhiwLpSLcmelvG7v9WremJOcFzNwdeLqV/9U+SJR5hoq9o=
IronPort-HdrOrdr: A9a23:z5x6xaogfuQxnulyfK6EOtAaV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.90,259,1643691600"; 
   d="scan'208";a="68353099"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH 0/3] x86/build: Clean up 32bit boot objects
Date: Thu, 14 Apr 2022 12:47:05 +0100
Message-ID: <20220414114708.4788-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Removes several unnecessary steps from the build.

Andrew Cooper (3):
  x86/build: Rework binary conversion for boot/{cmdline,reloc}.c
  x86/build: Don't convert boot/{cmdline,head}.bin back to .S
  x86/build: Clean up boot/Makefile

 xen/arch/x86/boot/Makefile    | 39 +++++++++++------------------
 xen/arch/x86/boot/build32.lds | 58 +++++++++++++++++++------------------------
 xen/arch/x86/boot/head.S      | 10 ++++++--
 3 files changed, 47 insertions(+), 60 deletions(-)

-- 
2.11.0


