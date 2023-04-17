Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1A46E4A5D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 15:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522145.811364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPIz-0004BR-LB; Mon, 17 Apr 2023 13:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522145.811364; Mon, 17 Apr 2023 13:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPIz-00048v-Hs; Mon, 17 Apr 2023 13:54:05 +0000
Received: by outflank-mailman (input) for mailman id 522145;
 Mon, 17 Apr 2023 13:54:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMb/=AI=citrix.com=prvs=464dae365=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1poPIy-00047e-Ip
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 13:54:04 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4def2296-dd27-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 15:54:01 +0200 (CEST)
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
X-Inumbo-ID: 4def2296-dd27-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681739641;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=PgPnbMZmAtpUANOitlWrq21FjsYwMoYfOaJIFf4YOcw=;
  b=CvLmJ+HGOBFfrtLyVMnFdWMJ6rrlXAP0qkAv3tv91sa2j0OZjhY7s2RA
   lJxkQfnb96TScofw4pFj8+ydD4dKTkoVspn8WnITbM81hYCNNbHEFRkl6
   jbWqK/BJDBHWvaSmIw5oVRcsnj4yPHMHdM/co6r6c3ZmUKabusmch+jia
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106220666
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:JkgybKAVXgW+qRVW/x7jw5YqxClBgxIJ4kV8jS/XYbTApDolhTEPm
 GNLW2HSP/6OZmSjeopwO9i1pB9Sv57dm9IxQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9B4QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwo7pMHlpE9
 eYkNCEKLTfAoPDq0L6+Y7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIIkzhuillz/zYjRDrFO9rqsr+WnDigd21dABNfKMIoLQH50LwBjwS
 mTu+lSmGx9GEOWllGCU43jxxc+IvHqrcddHfFG/3qEz2wDCroAJMzUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHyOswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3Oc0SiYtz
 UShhM7yCHpkt7j9YXCA8raZqxuiNC5TKnUNDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cQwc2
 BjT8nJ43e9Ky5dWiePipwuvby+QSobhF1IO+T7dXniZ8hJ+J6nmQJ70+VTexKMVRGqGdWVtr
 EToiuDHsrBXUcrcyX3RKAkeNOr3vqjYaVUwlXYqRsB8rGr1phZPaKgKuFlDyFFV3tHokNMDS
 Gvaoktv6ZBaJxNGhocnMtvqW6zGIUUNfOkJt8w4jfIUOPCdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoF75Djudzm31hnT+7qXXHI/OPiOP2WZJoYe1dbAvmgh4Rt8toXzk5A
 /4AbpDXmn2zocX1YzXN8J57EG3m2UMTXMisw+QOL77rH+aTMD15YxMn6e97KtMNcmU8vrugw
 0xRrWcCkAKl2iafeVvTAp2hAZu2NatCQbsAFXREFT6VN7ILP+5DMI93m0MLQIQa
IronPort-HdrOrdr: A9a23:SpMJWqqFQNsMS5y66q00PjcaV5o/eYIsimQD101hICG8cqSj+P
 xG/c5rsSMc5wxxZJhNo7290cq7MBbhHPxOgbX5VI3KNGKNhILBFvAB0WKI+VPd8kPFmtK1rZ
 0QEJRDNA==
X-Talos-CUID: 9a23:B6aS52PlugfumO5DAXVc63UeGtoZbmzaj1CTBF3kGWpsYejA
X-Talos-MUID: 9a23:r6IPVQaZznoZjuBTsg+znT8+EP5Svv6/GUpQ0rVBmpDUHHkl
X-IronPort-AV: E=Sophos;i="5.99,204,1677560400"; 
   d="scan'208";a="106220666"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v5 0/3] xen-ucode: print information about currently loaded ucode
Date: Mon, 17 Apr 2023 14:53:32 +0100
Message-ID: <20230417135335.17176-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Currently it's impossible to get CPU's microcode revision from Xen after
late loading without looking into Xen logs which is not always convenient.
Add an option to xen-ucode tool to print the currently loaded ucode
revision.

Sergey Dyasli (3):
  tools/xenctrl: add xc_get_cpu_version()
  x86/platform: introduce XENPF_get_ucode_revision
  tools/xen-ucode: print information about currently loaded ucode

 tools/include/xenctrl.h                  |  3 +
 tools/libs/ctrl/xc_misc.c                | 35 ++++++++++
 tools/misc/xen-ucode.c                   | 85 +++++++++++++++++++++---
 xen/arch/x86/platform_hypercall.c        | 29 ++++++++
 xen/arch/x86/x86_64/platform_hypercall.c |  4 ++
 xen/include/public/platform.h            | 11 +++
 xen/include/xlat.lst                     |  1 +
 7 files changed, 158 insertions(+), 10 deletions(-)

-- 
2.17.1


