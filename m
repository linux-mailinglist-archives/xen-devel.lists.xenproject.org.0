Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0AAB2FE43
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 17:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088823.1446602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Ax-0007XA-FH; Thu, 21 Aug 2025 15:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088823.1446602; Thu, 21 Aug 2025 15:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Ax-0007LS-2s; Thu, 21 Aug 2025 15:26:03 +0000
Received: by outflank-mailman (input) for mailman id 1088823;
 Thu, 21 Aug 2025 15:26:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dq/S=3B=bounce.vates.tech=bounce-md_30504962.68a73a85.v1-47dc19ba76e54838851cc4cccb3d1af9@srs-se1.protection.inumbo.net>)
 id 1up7Au-0005nU-Cp
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 15:26:00 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 240c6faf-7ea3-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 17:25:59 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4c76bT2FwSzBsVD77
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 15:25:57 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 47dc19ba76e54838851cc4cccb3d1af9; Thu, 21 Aug 2025 15:25:57 +0000
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
X-Inumbo-ID: 240c6faf-7ea3-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755789957; x=1756059957;
	bh=kpYZUErpssBf7MVl+uYwZzjx0Pc3VDlf3LtSHI87KkE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=w/gsmN7H993Gmo656k5OzLLrDVxpNMErKjOux3xEWbglu0H+qrJLLYU2JTx6zvPqz
	 +lryNDur2KmTZN02Bmlk0M0P1OSc+ySINKtbNIUMX5bzxE4RxfnxVfbcUeOam6JFTt
	 wxao0H+1MplBWXu7Zvo5wRSNlZA6nsR3Y1coI6Ph/o3dwM2uuUUxscFtJQcX1Vyjyq
	 FS8UEYmEjzs6GOL4ZGvgpxuDkR7mDucy2L7itCk3+T0MOrASF+dp3LmowkJsLd6t+Y
	 nXNlvhA/PcATyCFho0eMK+o1SemtFruak6npkdB2GCyj7FWv6xAx3MZGdFQrr/0Haa
	 RfNSWCwaOvnJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755789957; x=1756050457; i=teddy.astie@vates.tech;
	bh=kpYZUErpssBf7MVl+uYwZzjx0Pc3VDlf3LtSHI87KkE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=UU3kuTzMinmiWb+UF0dk+V+w7aWYJ+6OLeRf4bLis83sMgca93kkHOxp8hQConbxF
	 zR1j2rSyn+L9cw0dSr4ju19liheZ5GvlOdqet4ghW6hoq4oYjdr5MhmPkceV+8rz35
	 oqJYeyqMZ2XjhzaD26sfwfon9DH9XZlmX7eOCnCDaubCSuiy0pVRgYZitgp2OESQ6g
	 gyRcaf8CssOyZqGv6cqxSHpV8QADNW0YGJgX7IvSqkp77xkPNVQ2WibZKHn2zrqCDo
	 aiTQFE0ABcyAVDeBrCHnK9jt7U03Mt91T6TQdyR27g0THmW2a6Zbqo85VxfD5vsKNA
	 t1iNET+mbmDgg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=208/9]=20hvm:=20Introduce=20XEN=5FHVM=5FMEMMAP=5FTYPE=5FHOTPLUG=5FZONE?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755789956401
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <3fe81c78b95f60353a84b8394883ecfeee066732.1755785258.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1755785258.git.teddy.astie@vates.tech>
References: <cover.1755785258.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.47dc19ba76e54838851cc4cccb3d1af9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250821:md
Date: Thu, 21 Aug 2025 15:25:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Allow specifying in memory map a region which can be hotplugged.

This will be used by a future memory hotplug feature.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/include/public/arch-x86/hvm/start_info.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/include/public/arch-x86/hvm/start_info.h b/xen/include/public/arch-x86/hvm/start_info.h
index 0b3dfe91af..bdae8371d6 100644
--- a/xen/include/public/arch-x86/hvm/start_info.h
+++ b/xen/include/public/arch-x86/hvm/start_info.h
@@ -105,6 +105,7 @@
 #define XEN_HVM_MEMMAP_TYPE_GNTTAB_STATUS 0xF0000003 /* Grant table status page (v2) */
 #define XEN_HVM_MEMMAP_TYPE_FOREIGN_REG   0xF0000004 /* Suitable region for grant mappings */
                                                      /* and foreign mappings */
+#define XEN_HVM_MEMMAP_TYPE_HOTPLUG_ZONE  0xF0000005 /* Memory hotpluggable zone */
 
 /*
  * C representation of the x86/HVM start info layout.
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


