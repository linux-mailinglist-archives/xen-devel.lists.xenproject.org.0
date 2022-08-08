Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C441358C732
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 13:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382387.617315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL0a3-0005gj-H7; Mon, 08 Aug 2022 11:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382387.617315; Mon, 08 Aug 2022 11:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL0a3-0005ev-E4; Mon, 08 Aug 2022 11:05:55 +0000
Received: by outflank-mailman (input) for mailman id 382387;
 Mon, 08 Aug 2022 11:05:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MrjU=YM=citrix.com=prvs=2124ac30a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oL0a1-0005ep-Qw
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 11:05:53 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f98bbb1-170a-11ed-bd2e-47488cf2e6aa;
 Mon, 08 Aug 2022 13:05:51 +0200 (CEST)
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
X-Inumbo-ID: 0f98bbb1-170a-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659956751;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LrYwBQoaATgyh7V0ViZ2IL0EZDYvWxwNLf16i7LThYw=;
  b=JyHL3wUDufgScCSCL/G4YzNmIKCiGgbTF3na1xl/ORWlpLPWJS9rV4bH
   lrii3ViAUcowYJA2oiBFyYNWHRHWcgdGSV2rtOfInq5zvya5FxZ90E6OV
   6wlxHFwGHgryTRkt0+I3E0R3tDwhafvYd4rFpg/TQKTHOmW9ix8fnEkjK
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77591055
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:d1gELalwc/FdZelG/RwLvnro5gz/JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJWD3VOa3YMzH1KNsjPN619kpUuJWAyd9jSgpl/3g9FyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37Kyi4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kmJag+x7stHVtA3
 ucfaxwudhmepfC5lefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVGPEsXD5Qv2v+lnHDlfxVTqU6PpLpx6G/WpOB0+OeybYuMIoHXLSlTtmy8h
 XidoXi6OBVEatG41QGv6HKHm8aayEsXX6pNTeblp5aGmma7xGMJDwYNfUCmuvT/gUm7M/pAL
 2QE9yxoqrI9nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbQGDq5XMFyjbrO3N62rvZ25FdgfueBPoUyMV+/zFndxpkijBZc1kU4KWltToOyP/l
 mXiQDcFu1kDsSIa//zloAGZ3W/z/8Shoh0dvVuOAD/8hu9tTMv8PtHztwCGhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JAVdoJiN2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa9RIS0CauLP4IROfCdkTNrGwk+DXN8Iki3yBR8+U3BE
 c3znTmQ4YYyVv08kWveqxY12r433CEurV7uqWTA503+idK2OS/KIYrpxXPUMYjVGovY/1iOm
 zueXuPWoyhivBrWO3WPr9ZPdQFURZX5bLivw/Fqmie4ClIOMAkc5zX5mNvNp6QNc3xpq9r1
IronPort-HdrOrdr: A9a23:TJ/ocq8DuwM7SEbY0S9uk+DUI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+MjztCWE7gr5N0tBpTntAsW9qBDnhPtICOsqTNSftWDd0QPCRuxfBOPZslrd8kbFl9K1u5
 0OT0EHMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.93,222,1654574400"; 
   d="scan'208";a="77591055"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 0/2] libxl: replace deprecated -sdl and -soundhw qemu options
Date: Mon, 8 Aug 2022 12:05:43 +0100
Message-ID: <20220808110545.62886-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.qemu-deprecated-soundhw-v1

Hi,

There's some more QEMU options that are deprecated. We still don't need to
figure out which QEMU version we are going to run as the options that replace
them already existed in QEMU 1.0, so all the version QEMU upstream that we
could possible use as device model.

Thanks,

Anthony PERARD (2):
  tools/libxl: Replace deprecated -sdl option on QEMU command line
  tools/libxl: Replace deprecated -soundhw on QEMU command line

 docs/man/xl.cfg.5.pod.in                  |  6 +++---
 tools/libs/light/libxl_types_internal.idl | 10 ++++++++++
 tools/libs/light/libxl_dm.c               | 21 +++++++++++++++++++--
 3 files changed, 32 insertions(+), 5 deletions(-)

-- 
Anthony PERARD


