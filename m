Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7D07E59FD
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 16:28:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629316.981431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0kSx-0001Yg-N1; Wed, 08 Nov 2023 15:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629316.981431; Wed, 08 Nov 2023 15:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0kSx-0001Wi-KX; Wed, 08 Nov 2023 15:27:39 +0000
Received: by outflank-mailman (input) for mailman id 629316;
 Wed, 08 Nov 2023 15:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L2E1=GV=citrix.com=prvs=669c226bb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r0kSw-0001Wb-6s
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 15:27:38 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56a7e1cb-7e4b-11ee-9b0e-b553b5be7939;
 Wed, 08 Nov 2023 16:27:35 +0100 (CET)
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
X-Inumbo-ID: 56a7e1cb-7e4b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1699457255;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8dmZtFiM4DRSISiQmMaAqoLtKPz3F8xUc92N3jcjP6A=;
  b=VzJQ90VLrkf+LLJ6Z7+yYNqRUeyZsNQHDxYcYDj6SqTGMI0p3Mp009m6
   jSdJusIqrOPsfdnebpzVOjkmOUaBkkcV/Rzj0QdEFcwJvP04At6bR0ePV
   05lve53ADBQODGUmGQn2v+mpLGDfVjBgF1lFeAcQCJ8Mdk10CUXxUkH6I
   Y=;
X-CSE-ConnectionGUID: icGm5HtAQNqgbhgNrzLpjw==
X-CSE-MsgGUID: Z6hDHVI0RA2G39vjpeSQUA==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127913160
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:vcuShKpwMsuHXMdqvIl+FCh1LLFeBmKMZRIvgKrLsJaIsI4StFCzt
 garIBnQaP+NN2LwKtAibI3n8E0A7JSHy4U1GVZq/ykzFyhD8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GhwUmAWP6gR5waHzylNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADEGQRXep/6f+ZSiReNsieI5Pu3zPpxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSaxFIUPrSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 ziZrj2iW09CXDCZ4Qjb8l6MuM6Xpwqhd9lDCr+g+8VTvXTGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOr9QqTDYn0
 luImdLBBjF1trCRD3WH+d+8sjeaKSUTa2gYakcsTxYB4tTliJE+iFTIVNkLOKW1lNzuBTbow
 z2Q6iM6jq8QpdUX3r+/9FqBgjXEjpTRVQs0+gX/V3qo9B9kf5WiY5G06F/d9rBLK4PxZl2ct
 3FClcGY5+0KCYylnTaIBu4KGdmBx/uDKiyavldpELEo7THr8HmmFb28+xkneh0vaJxdP2a0M
 QmM4Wu9+aO/IlOrZoByPqKtIv0M1KfqFdvDTOLwdthRN80ZmBC8wM1+WaKB9zmzwRlwyPxnZ
 cbzndWEVyhAVfo9pNaib6JNieV1m3pWKXb7HMijl3yaPayiiGl5oFvvGHCJdOk9pJicugTT/
 M032yCikE4HD7SWjsU66+cuwbE2wZsTX8ueRzR/LLLrH+afMDhJ5wXt6b0gYZd5uK9ei/3F+
 HqwMmcBlguu3i2dcVXVNyo8AF8KYXqYhStkVRHAwH7xhiN9CWpRxPx3m2QLkUkPq7U4kK8co
 wgtcMScGPVfIgkrCBxEBaQRWLdKLUzx7SrXZnrNXdTKV8I4L+A/0oO+L1SHGehnJnbfiPbSV
 JX5jFyCH8NdGFk5ZCsUAdr2p26MUbEmsLoadyP1zhN7Iy0ALKACx/TNs8IK
IronPort-HdrOrdr: A9a23:M0IPCq01diR+qLikM5kLGQqjBL4kLtp133Aq2lEZdPRUGvb3qy
 nIpoV+6faUskd2ZJhOo7C90cW7LU80lqQFhLX5X43SPzUO0VHAROoJgLcKqweQfBEWndQ96U
 4PScdD4aXLfDpHsfo=
X-Talos-CUID: =?us-ascii?q?9a23=3Aoamj3WjZzR66MDBQXIBZ3efD2DJuc3byySrwP2a?=
 =?us-ascii?q?BL39mQr2ab0WC3LtmjJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3ANbBkdA2ZSyBRsvNV6cMa29eR6DUj0fquJGAzsM0?=
 =?us-ascii?q?8kpOrbn1uOS+Qtw2Ka9py?=
X-IronPort-AV: E=Sophos;i="6.03,286,1694750400"; 
   d="scan'208";a="127913160"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Christopher Clark <christopher.clark@starlab.io>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.18 0/3] docs/sphinx: Fix syntax errors and warnings
Date: Wed, 8 Nov 2023 15:27:24 +0000
Message-ID: <20231108152727.58764-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Given the two mandatory 4.18 fixes, this is the remainder of the work I have
been threatening to do for a while.  Preferrably for 4.18 too, seeing as this
gets our Sphinx docs into better shape.

I still want to make sphinx problems fatal in gitlab, but that will have to
wait for now.

Andrew Cooper (3):
  docs/sphinx: Fix syntax issues in hyperlaunch.rst
  docs/sphinx: Fix syntax issues in exclude-list.rst
  docs/sphinx: Fix indexing

 docs/designs/launch/hyperlaunch.rst | 19 +++++++++++--------
 docs/index.rst                      | 13 +++++++------
 docs/misra/exclude-list.rst         |  3 ++-
 docs/misra/index.rst                | 18 ++++++++++++++++++
 4 files changed, 38 insertions(+), 15 deletions(-)
 create mode 100644 docs/misra/index.rst

-- 
2.30.2


