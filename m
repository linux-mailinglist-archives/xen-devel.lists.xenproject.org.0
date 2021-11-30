Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C2846309E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 11:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234952.407683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms00c-0007hD-Po; Tue, 30 Nov 2021 10:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234952.407683; Tue, 30 Nov 2021 10:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms00c-0007ZU-JV; Tue, 30 Nov 2021 10:05:10 +0000
Received: by outflank-mailman (input) for mailman id 234952;
 Tue, 30 Nov 2021 10:05:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hFC=QR=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ms00b-0007QY-4G
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 10:05:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdd99465-51c4-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 11:05:07 +0100 (CET)
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
X-Inumbo-ID: fdd99465-51c4-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638266707;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IRor6soBhEeE5vF+GbxAtTh3CvJGNcaQtLYm2WQQtGk=;
  b=AcyQw7UUPh+K6JqJyDnJ/flBU1Hqtne82mhmQ4H/24uOjKRIAnWd7iAJ
   TSDbySNKdPZfCo5YTE/gdjLCuX7zgEkly70HwYl9zXnVhjc4IWL8p86ce
   saGY9xxBOteRG/O1KUX8wwEiF0pBr2kWNH5nNYSa4RewGlMI+xQfzyIks
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Quo82sqQqaS/+Qj5hxr5spjUTWJFtsz6cNMthjL+lgMeY7OeCCWO91vZRIYU+YT++nDhEeWw0I
 jRV8J6vcU4irN1b+dlbqwi//Dcz9J2mCLjW3W8vsKtm07JL3GN/QSIhOY1FyTxGb7tIy4leri/
 SlCVxFUmKYUFcCaLq6tYcAX/DeMiFgE7F1O31UAq/BhAlO4w0GDPZ1oOLitEdU6T+oS0Xhy7Hk
 S1oYzK14/DgDty3TcyT0K+Rnr9dgEekUJxKusN/raM5ZLKpqXr1ewAJ6tEDPtfxAMToRfRqUOI
 zzzAj7VeL6v547W9J4l2X/dJ
X-SBRS: 5.1
X-MesageID: 58406782
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZBDTKaKr96KYStS0FE+RHZIlxSXFcZb7ZxGr2PjKsXjdYENS02AAx
 jNKXDvVMvePN2Cmf4p3bY20o09U7MPdz9JhSQJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es4w7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB23pcJY1
 /scmaaNRCIXOLeSsslAa0FhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpg2pgQQqaED
 yYfQRZtYi2ceiVdAVlUOMoQhsWInXihYQQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wh
 EjL4mD4CREyL8GExHyO9XfErv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsgCQOcsV+QsEA1Qyo9KzOvSy0W1Bcd2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZo87SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRON7Ni2+AswGzARN8wGCxFQLpU
 J8swZX20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4LsGsnfRwybJxYI1cFh
 XM/XysKv/e/21PwMMdKj3+ZUZx2ncAM6/y7PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0DCrCjOXeOrtZIRb3IRFBiba3LRwVsXrbrCmJb9KsJUqG5LWoJd9M3kqJLuP3P+
 33hCEZUxECm3S/MKBmQa2AlY7TqBM4toXU+NC0qHFCpx3l8Ptr/sPZBL8M6Les96ehu7f9oV
 P1ZKc+ONetCF2bc8DMHYJij8IE7LEa3hRiDNjaOaSQke8IyXBTA/9LpJ1O99CQHAietm9E5p
 rmsilHSTZYZHlwwB8fKcvO/iVi2uCFFyu51WkLJJPhVeVntr9c2e3Cg0KdvLphVexvZxzac2
 wKHOjsipLHA890v7d3EpaGYtIP1QeFwKVVXQjvA5rGsOCiEomf6md1cUPyFdCz2XX/v/Pnwf
 v1cyvzxPaFVnFtOtIYgQb9nwbhnuonqrr5eiA9lAG/KfxKgDbY5eiuK2sxGt6tswL5FuFTpB
 hLTq4cCYbjZatn4FFMxJRY+arXR3P4ZrTDe8PApLRio/yRw5reGDR1fMhTkZPax91ep3FfJG
 dschfM=
IronPort-HdrOrdr: A9a23:gNv03KHx7d4inocspLqE5seALOsnbusQ8zAXP0AYc31om6uj5q
 aTdZUgpHjJYVkqKRIdcLy7V5VoIkmskaKdg7NhX4tKNTOO0ADDQe1fBOPZskTd8kbFltK1u5
 0PT0EHMqyUMWRH
X-IronPort-AV: E=Sophos;i="5.87,275,1631592000"; 
   d="scan'208";a="58406782"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/8] x86: Support for __ro_after_init
Date: Tue, 30 Nov 2021 10:04:37 +0000
Message-ID: <20211130100445.31156-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Also some prep cleanup, because the boot time pagetable handling is seemingly
impossible to edit without finding more skeletons lying around...

Andrew Cooper (8):
  x86/boot: Drop incorrect mapping at l2_xenmap[0]
  x86/boot: Better describe the pagetable relocation loops
  x86/boot: Fix data placement around __high_start()
  x86/mm: Drop bogus cacheability logic in update_xen_mappings()
  x86/boot: Drop xen_virt_end
  x86/boot: Adjust .text/.rodata/etc permissions in one place
  x86/boot: Support __ro_after_init
  x86/boot: Check that permission restrictions have taken effect

 xen/arch/x86/boot/x86_64.S        |   8 --
 xen/arch/x86/livepatch.c          |   3 +-
 xen/arch/x86/mm.c                 |  24 +++---
 xen/arch/x86/setup.c              | 153 +++++++++++++++++++-------------------
 xen/arch/x86/smpboot.c            |   3 +-
 xen/arch/x86/xen.lds.S            |   6 ++
 xen/include/asm-x86/setup.h       |   3 +
 xen/include/asm-x86/x86_64/page.h |   2 -
 xen/include/xen/cache.h           |   2 +
 9 files changed, 103 insertions(+), 101 deletions(-)

-- 
2.11.0


