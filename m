Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A1BAB9A34
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 12:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986871.1372402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsLz-0005g9-GV; Fri, 16 May 2025 10:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986871.1372402; Fri, 16 May 2025 10:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsLz-0005bl-DU; Fri, 16 May 2025 10:31:47 +0000
Received: by outflank-mailman (input) for mailman id 986871;
 Fri, 16 May 2025 10:31:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Kg8=YA=bounce.vates.tech=bounce-md_30504962.68271246.v1-fb66e4ff4694405bb0c5bd8ca9aafaf8@srs-se1.protection.inumbo.net>)
 id 1uFsEb-0000kS-NA
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 10:24:09 +0000
Received: from mail187-4.suw11.mandrillapp.com
 (mail187-4.suw11.mandrillapp.com [198.2.187.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e61d7bd4-323f-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 12:24:08 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-4.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4ZzNTy61lZzlfcNB
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 10:24:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fb66e4ff4694405bb0c5bd8ca9aafaf8; Fri, 16 May 2025 10:24:06 +0000
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
X-Inumbo-ID: e61d7bd4-323f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747391046; x=1747661046;
	bh=dLlEWnEcFnUkrXQUBAwvC2R74dRSbryvP/QYt6wEGyA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=u6Ro8WmoVEI0JcMvbTJkiCWQSGdMOJBA8OyBM0/x4OHAYd79KxB6YmP5LjRK2Ngoa
	 RZ6LIX+LcPkUO6vfLfOdlqN/g4d0vNMt7z0YWeFsUboW+t3rPoHiLG8cl6y183zDm3
	 BOvvMzqT9emIuYDGdh5hicDzeL3qQI/iNPff2VuTRmFxfGfB7uYiP5tsbAWRUP33q/
	 EcanY2vjr+dPFSiEKqlT65eeGaCCFACzddjKm/lRq8EIwY2Tm3J01M65nGsU1V/lnv
	 PyBtqyWUy5cnmUeu4IOHVguSUMljQ+ebqg1Gj6ON91nV6luJ2p0zj26Ri6ay9jiTyk
	 yHAg2RJ2YM+AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747391046; x=1747651546; i=teddy.astie@vates.tech;
	bh=dLlEWnEcFnUkrXQUBAwvC2R74dRSbryvP/QYt6wEGyA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XFcBT+CVLxyD3IZf0ElbSrbidtiRAc30nWLKdndrVtOgFn7Fq00cpEWvR1LgwapmY
	 LKSwV4x11s8/TKDoK4Mb3ICUIXDRGCKRI2HlD0hdYVsDpMDFXAbHhiNQKFwAhidz2c
	 tiNqTzbBfaNDVOwA9FyJ/BUVRt06WUj+zbRxrxltwygr6PEzJNlemf8/iwI2LsSu+8
	 Cgml+DZ6h2V+YiLIKXjqmz6oufdslIxWwQwmi57ZVoLqmJl6fJ5KHNJlOos+zBqb0M
	 ofzgck2d/h4j7KXM6cWbI0k7tsGMu4g5vchDCP3y2sfHlWLMYtydJn+Zy+OP2ypte8
	 TNMD+QZvLV0cw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2011/16]=20x86/svm:=20Introduce=20NPCTRL=20VMCB=20bits?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747391045888
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Andrei Semenov" <andrei.semenov@vates.tech>
Message-Id: <c8b713285a918e50ee8b03b5f8f39fb695bfb83b.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
References: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fb66e4ff4694405bb0c5bd8ca9aafaf8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 10:24:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Those bits are used to enable SEV-related features in VMCB.

Signed-off-by: Andrei Semenov <andrei.semenov@vates.tech>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index 3d871b6135..fd166498f2 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -143,6 +143,17 @@ enum DRInterceptBits
     DR_INTERCEPT_DR15_WRITE = 1u << 31,
 };
 
+/* Miscellanious controls in _np_ctrl*/
+enum NpCtrlBits
+{
+    NPCTRL_NP_ENABLE    = 1 << 0,
+    NPCTRL_SEV_ENABLE   = 1 << 1,
+    NPCTRL_SEVES_ENABLE = 1 << 2,
+    NPCTRL_GMET_ENABLE  = 1 << 3,
+    NPCTRL_NPSSS_ENABL  = 1 << 4,
+    NPCTRL_VTE_ENABLE   = 1 << 5,
+};
+
 enum VMEXIT_EXITCODE
 {
     /* control register read exitcodes */
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


