Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3384FAB98DE
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986616.1372140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrPt-0007jt-FA; Fri, 16 May 2025 09:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986616.1372140; Fri, 16 May 2025 09:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrPt-0007hZ-CT; Fri, 16 May 2025 09:31:45 +0000
Received: by outflank-mailman (input) for mailman id 986616;
 Fri, 16 May 2025 09:31:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JiiK=YA=bounce.vates.tech=bounce-md_30504962.682705f8.v1-e905edda31bd41638873149f1747232e@srs-se1.protection.inumbo.net>)
 id 1uFrPr-0007hQ-Vn
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:31:44 +0000
Received: from mail133-28.atl131.mandrillapp.com
 (mail133-28.atl131.mandrillapp.com [198.2.133.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90e034ba-3238-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 11:31:38 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-28.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZzMKP0Rm0zMQxXYB
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 09:31:37 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e905edda31bd41638873149f1747232e; Fri, 16 May 2025 09:31:36 +0000
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
X-Inumbo-ID: 90e034ba-3238-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747387897; x=1747657897;
	bh=f70Avydbv7fxeXt+EdaNyvnxvCPINflZRbLz61xdssw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FRv/5/OF+HVskBSUlGtONazTlE1SgrS8pXDk5rVIYNXuctnvk1YMT9gbrTAE9yTHA
	 M7wmHX/IGRDPVLWuRGM+abmInGCZEvKwPVmdjUIn30PjbHtbYtdwegu3KuAgVC33Bd
	 g5zwOXWjn/J1G6LiJuqRzYu4+hl6F1HcfUH/XWqlDRAb4cMdLuLs25yNap+e6cdI6T
	 HlryXHfZ97pJ7L3cl3kANtTfC/e0iQS8/+O7006UBA5vW+E8Sm6BYqyaNYkLKtDAKE
	 2ekcVEmDGWy/44gUpDEYozBzF7A701sbZ+w8tYlaK8SiHzLeKO9WGrH5dvKb1hVoik
	 HYA+tYVDXnKHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747387897; x=1747648397; i=teddy.astie@vates.tech;
	bh=f70Avydbv7fxeXt+EdaNyvnxvCPINflZRbLz61xdssw=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yF4qbLCvoj7Ciung1VcGXxR3J8MIQ5HpfnTriJv5fdlrNaCxQQW66RsQUSI0yAJSv
	 R8lc6sc92lKOCzqOwWszsinTA1QKFWcuCtEVpxcmMFuKGCbTAAyKINKaX4+sTK6fac
	 EFBXupdh5TXoPjWeb7NoC5cAPaBeIcWA1YEeOjrzo1TMv5EaWm7fdbsVSyID4Rb39C
	 by+OmNLImfq5EHJwp6sBn6KQIxWHgZPLb+YUNbt8kM65bDkgGWVCc7ctCHxcK7sxg+
	 YU3tL60p0w3sdHpkkYRHkaITN/iiwIsG3fx/yhnqpR3EcTT59PID9Q0xAplNshnXmo
	 erYsnBALWiQew==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2001/16]=20x86/msr:=20Introduce=20SYSCFG=5FMEM=5FENCRYPT=20MSR.?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747387896147
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Andrei Semenov" <andrei.semenov@vates.tech>
Message-Id: <72dca4861d81ca418e244526babd48d511b9baa3.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
References: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e905edda31bd41638873149f1747232e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 09:31:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Andrei Semenov <andrei.semenov@vates.tech>

SYSCFG_MEM_ENCRYPT is the AMD SME MSR used to enable SME and AMD SEV.

Signed-off-by: Andrei Semenov <andrei.semenov@vates.tech>
---
 xen/arch/x86/include/asm/msr-index.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 22d9e76e55..7620c4cd2e 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -221,6 +221,7 @@
 #define  SYSCFG_MTRR_VAR_DRAM_EN            (_AC(1, ULL) << 20)
 #define  SYSCFG_MTRR_TOM2_EN                (_AC(1, ULL) << 21)
 #define  SYSCFG_TOM2_FORCE_WB               (_AC(1, ULL) << 22)
+#define  SYSCFG_MEM_ENCRYPT                 (_AC(1, ULL) << 23)
 
 #define MSR_K8_IORR_BASE0                   _AC(0xc0010016, U)
 #define MSR_K8_IORR_MASK0                   _AC(0xc0010017, U)
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


