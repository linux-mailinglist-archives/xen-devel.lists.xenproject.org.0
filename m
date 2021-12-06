Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D80946A1E8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:03:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239417.414959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOF-00061e-5N; Mon, 06 Dec 2021 17:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239417.414959; Mon, 06 Dec 2021 17:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOF-0005vh-1H; Mon, 06 Dec 2021 17:02:59 +0000
Received: by outflank-mailman (input) for mailman id 239417;
 Mon, 06 Dec 2021 17:02:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOD-0005ti-PF
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:02:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aafbb36-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:02:56 +0100 (CET)
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
X-Inumbo-ID: 5aafbb36-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TKhye1HdvBigP9+nr6Vr3o8+wKLgJNZaOQSBuxAwT3A=;
  b=D9pSmLqtU6tjHnaq4wiHRboT7YKSEUgXwBxwKlV6AJ0leXicu4zpK17s
   oUNOiAYaI8Pk0UJEEukdILCH/TcFNldERvuHVTlugF2/hYAvhrUvvVArL
   IS1fvldlg43w5FH+bSxmJZiTECMTBXdwZY0H4ZasEv5gOu2+19IW5PzvB
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IoCEYYuY/DFWYmh5ZyCzieeAJWqnNZtsTDbox4g5TBa6c6aASZlK9sGjCzw/778vYTuenwhs/1
 BabPmbzf8+v3CPGnaSHZqaYLPJQ7TlcfQS36CWLgBaJ1fPfEa+IZDHlAQVLzRXvN1ZZlYFfC6E
 AmvWDkK4vJ3edBmZczrFyOymvFF9G8QsAdaAgp4uwdcVhqfj1USGS5TT29Kyhx6SLliwjb1eeg
 WKq+y97A/5MtXWZcr7lfuspnw4SllwDM594lJpZz5iI/zdUkPVefQAc9NnBksUxlGmpf/UHveD
 KH1phze3r0WTLoP4of1TZDrE
X-SBRS: 5.1
X-MesageID: 58884262
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HBweeasv9KWcO5iyglgQT8dxpufnVM1ZMUV32f8akzHdYApBsoF/q
 tZmKT/XM/yMMWH9eoojO4m09RkA7JaHy9BkTAtu+CozHn8b+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cy2YbhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpllseRQgIYH7L1gN8SWT14CCFxD6Ia0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6DN
 5pJNWAxNnwsZTUXNn4HLZE6mdvyhybWS2EAhA/El7Qetj27IAtZj+G2bYu9lsaxbcdImkeVo
 ErW8mK/BQsVXPSE0iaM+H+ogu7JnAv4VZgUGbn+8eRl6HWMwkQDBRtQUkG0ydG7gEOjX9NUK
 2QP5zEj66M18SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZIbsAms8knAyQnz
 FaTk/vmADVutPueTnf13raLrxuiNC4NN2gAaCQYCwwf7LHeTJob10yVCIw5Sejs04OzSWqYL
 y22QDYWpO4yhss69rqC5WvIiRaMvZjGfAFpz1CCNo661T9RaImgbo2uzFHU6/dcMYqUJmW8U
 Gg4d9u2t75XU8zU/MCZaKBURezyua7ZWNHJqQc3R8FJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5yYCkPGI+TfNDKm8gj9yjn5ZLlXvEMZGPxH44owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2IFc+hnkn9i+TBNBZ5rIvp1nPUNIjVC4ve/23oH
 yt3bZPWm32zrsWgCsUozWLjBQ9TdiVqbXwHg8dWavSCMmJb9JIJUJfsLUcaU9U9xcx9z76Ql
 lnkAxMw4Aev1BXvdFTRAlg+OeyHYHqKhS9iVcDaFQ3zgCZLjEfGxPp3SqbbipF7rrE+lqAtE
 KFeEyhCa9wWIgn6F/0mRcGVhORfmN6D3Gpi5gKpP2oyeYBOXQvM9oO2dwfj7nBWXCG2qdE/s
 /ur0QaCGcgPQAFrDcD3bvOzzgzu4ShBybwqB0aYcMNOfEjM8ZRxL3CjhPEAPMxRew7IwSGX1
 ljKDE5A9/XNuYI87PLAmbuA89WyC+J7E0cDRzvb4L+6ODP05G2mxYMcAu+EcSqEDDH/+bm4Z
 PUTxPb5aaVVkFFPuot6MrBq0aNhuIe/++4EllxpRSyZYU6qB7VsJmi98fNO7qAdlKVEvQaWW
 16U/oUIM7u+J864QkUaIxAob7rf2KhMyCXS9/k8PG7z+DRzoOicSUxXMhSB1H5dIb9yPN93y
 OstopdLuQm2ix5sOdealCFEsW+LKyVYAakgs5gbBq7tixYqlQ4eMcCNVHeu7cHdcchIP2krP
 iSQ1fjLiLlrz0bfd2Y+SCrW1u1HiJVS4B1HwTfu/bhSdgYpUhPv4CBszA==
IronPort-HdrOrdr: A9a23:/6+aKqCLRx9gtI3lHemq55DYdb4zR+YMi2TC1yhKJiC9Ffbo8P
 xG/c5rrCMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SXzJ866U
 4KScZD4bPLYWSS9fyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="58884262"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 01/57] .gitignore: Non existing toolcore/include files.
Date: Mon, 6 Dec 2021 17:01:44 +0000
Message-ID: <20211206170241.13165-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

4664034cdc (tools/libs: move official headers to common directory)
forgot one .gitignore update.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 .gitignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 9513506dd9..cad5aacd8d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -384,7 +384,6 @@ tools/include/xen-foreign/arm64.h
 .git
 tools/misc/xen-hptool
 tools/misc/xen-mfndump
-tools/libs/toolcore/include/_*.h
 tools/firmware/etherboot/eb-roms.h
 tools/firmware/etherboot/gpxe-git-snapshot.tar.gz
 tools/misc/xenhypfs
-- 
Anthony PERARD


