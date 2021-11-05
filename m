Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 887E1446481
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 14:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222345.384492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizhc-0006ME-CB; Fri, 05 Nov 2021 13:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222345.384492; Fri, 05 Nov 2021 13:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizhc-0006Jm-8O; Fri, 05 Nov 2021 13:56:20 +0000
Received: by outflank-mailman (input) for mailman id 222345;
 Fri, 05 Nov 2021 13:56:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VR3F=PY=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mizha-00063k-Nb
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 13:56:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 249af9b0-3e40-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 14:56:17 +0100 (CET)
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
X-Inumbo-ID: 249af9b0-3e40-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636120577;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=Kmw99jHG9jZ0ybbWkzYmVYV9drXXHgz8umrrykspItg=;
  b=ADcBoKsfJB6TLheLNHIOE3GbjMH02AzO0ahmXxFeF+TJYBzPJV7ElZqO
   pzuL09sajVwnfeXH2uwh2sjmatJBd47BMBa4OCexfSwiKctGaM5hr0kwz
   17RFr29h+uNY6/pXVTVS2ybUtGcJ49/rjBX43n5XyO3m4IYoAI8OJ7di/
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: foJkf00BqU59HBw2PvkXMG7tO9sOgLFTWQ5o6P2DSvHWI3EaUP4QbWCS8zVHC06brEccZC2Ig1
 h/3NLyeBCc9RzY9Q26NW+X8QhGfL7dA89suBhIkJ8xpHp0oG4NZybnx1a2Z39JLGvXxbS69tGm
 yhh5EW6ST6zr4lQQrSYX6w0+c8391KOg2OoXooxj1i0dw/JpUyui/aHQ0yigcPu8JfSTu155I7
 tI/cKgMQTGc2UAvxzLfDlwfr7X7IGyrdpku1b0UmuHMYEBRiqMm/3DR0CZML1fiJRAuA4McOKY
 8AmtWSI6i8QH4SO59XQz/9dD
X-SBRS: 5.1
X-MesageID: 57553079
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uc1LUa59sRbNW/FYvFFVyQxRtM3AchMFZxGqfqrLsTDasY5as4F+v
 jMeUGvTb/aMazfxc4p1Ponl8xgA7JDczNFnTwFopCtmHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2tMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z6
 +pSsKG6aB8SZo6Svv4lWEloSnBgMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTQquDP
 JJGOFKDajzyZj5oako6M6gEgceopj7DLiYIk0m88P9fD2/7k1UqjemF3MDuUtCSXsBUgkawr
 3rL5XjkGQodMMGDyD2D6TSngeqntQHRVZ8WFba43uV3m1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHKLshMTQdN4D/wx6AbLzLHdpQmeGAA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9ak2C84qejCuJYQtLC3U6bn80FFob7Iy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxlohPNbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/03QEH83oJrW3FF5ufkWZ4umwWyKBBaJdsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QVPMAsLVTaon42NCZ8OlwBdmB2zMnT3
 r/BIK6R4YsyU/w7nFJauc9EidfHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgp
 SrhBRMBkQKXaL+uAVziV02PoYjHBf5XxU/X9wR3Vbpx83R8M4up8okFcJ47Iesu+OB5lKYmR
 PgZYcSQRP9IT22fqTgaaJD8qq1kdQiq2l3Sb3b0PmBncs4yXRHN9//lYhDrqHsEAB2ouJZsu
 LanzA7aH8YOHlwwEMbMZfuz5FqtpnxByvlqVk7FL4ALKkXh+YRnMQLrifozL51eIBnP3GLCh
 Q2XHQ0Zta/GpIpsqIvFgqWNroGIFepiHxUFQzmHvOjubSSDpzit245NVuqMbAvxbmKs9fXwf
 /hRwtH9LOYDwARAvb1jHus51qk5/dbu+eNXl1w2AHXRYl23Ibp8OX3aj9JXv6hAy7IF6wu7X
 kWDpotTNbmTYZ63FVcQIEwub/iZ1OFSkT7XtKxnLEL/7S5x3byGTUQNYEXc1H0DdON4YNE/3
 OMsmM8K8Aju2BMlP+GPgj1Q62nRfGcLVL8qt81CDYLm4ubxJoquvXAI5vfK3ayy
IronPort-HdrOrdr: A9a23:HvAdW6DWw9adfa3lHem655DYdb4zR+YMi2TC1yhKJyC9E/bo8P
 xG88566faZslossRIb6LS90cu7MBDhHPdOiOF7V9qftWHdyQ6VxepZjLcKrQeOJ8SHzJ8+6Z
 td
X-IronPort-AV: E=Sophos;i="5.87,211,1631592000"; 
   d="scan'208";a="57553079"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>, "Jan
 Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/5] XSM: cleanups
Date: Fri, 5 Nov 2021 13:55:50 +0000
Message-ID: <20211105135555.24261-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Various XSM cleanups from observations based on Daniel's previous cleanup
series.

Andrew Cooper (4):
  xen/xsm: Complete altcall conversion of xsm interface
  xen/xsm: Drop xsm_hvm_control() hook
  xen/xsm: Improve fallback handling in xsm_fixup_ops()
  xen/xsm: Address hypercall ABI problems

Jan Beulich (1):
  x86/altcall: allow compound types to be passed

 xen/include/Makefile              |   2 +-
 xen/include/asm-x86/alternative.h |   4 +-
 xen/include/xsm/dummy.h           |  19 ---
 xen/include/xsm/xsm.h             |  39 ++----
 xen/xsm/Makefile                  |   1 +
 xen/xsm/dummy.c                   | 254 ++++++++++++++++++++------------------
 xen/xsm/flask/flask_op.c          |  60 ++++-----
 xen/xsm/flask/hooks.c             |   9 --
 xen/xsm/private.h                 |  16 +++
 xen/xsm/xsm_core.c                |  12 --
 xen/xsm/xsm_op.c                  |  51 ++++++++
 11 files changed, 245 insertions(+), 222 deletions(-)
 create mode 100644 xen/xsm/private.h
 create mode 100644 xen/xsm/xsm_op.c

-- 
2.11.0


