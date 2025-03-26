Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5B8A71881
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 15:29:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927892.1330651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRkl-0004TO-Lz; Wed, 26 Mar 2025 14:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927892.1330651; Wed, 26 Mar 2025 14:29:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txRkl-0004QG-JD; Wed, 26 Mar 2025 14:29:11 +0000
Received: by outflank-mailman (input) for mailman id 927892;
 Wed, 26 Mar 2025 14:29:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ewd=WN=bounce.vates.tech=bounce-md_30504962.67e40f30.v1-01eb9fc5f2164be6b9193a22c4edc3f9@srs-se1.protection.inumbo.net>)
 id 1txRkk-0003uH-BW
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 14:29:10 +0000
Received: from mail134-16.atl141.mandrillapp.com
 (mail134-16.atl141.mandrillapp.com [198.2.134.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab6b8ad6-0a4e-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 15:29:05 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-16.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4ZN8L84BmnzB5pcCD
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 14:29:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 01eb9fc5f2164be6b9193a22c4edc3f9; Wed, 26 Mar 2025 14:29:04 +0000
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
X-Inumbo-ID: ab6b8ad6-0a4e-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1742999344; x=1743269344;
	bh=eY1oVEpxOLdf54J5uK7qrk5FR4y9+Fa2bULSrs7a3Es=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=lNGnI39swTinGA0cD/lRLf1WpQGfF8UDWB2sswM/9e/gBtWJTi2dpiDMy17BhCSiR
	 fiJNWfnXD+Plw7LgMThF+c4nzBm/5azBpYg78C5x9pF958DgK3sjZ6Yun0Cej/yNhr
	 A1zVmBGo6ZgJchDQ4LvkulCrqd/Z7TNTGvvvPukxg/w1Gq6oJTM98dHVIghR1jaRCd
	 W0QmHFwvRMAQXuaArN2BE25JniU6XzIw0OqKyH5LKA/S9haskOVTdpk7IMI2BTf31h
	 yg/a2L+gAA4wwU6szzEtqFeu+IRmqa+YUBwVM2EdUVje+ZsPC603aUk2UulAPRKb2I
	 68ZSu1MM6R1mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1742999344; x=1743259844; i=anthony.perard@vates.tech;
	bh=eY1oVEpxOLdf54J5uK7qrk5FR4y9+Fa2bULSrs7a3Es=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Sa8RdRT3QKaYuN/aUjB46HKxmmSYI6zVbrxTYBDgGpaR7ziAlZOZcjRXJ8g7X7kqS
	 WaARJ9oCYfgxxa/cF1vsr1tcsEdJmeCGuFEzd5KemRrfDFE9sTcuU8OdOf2GS00o9r
	 bqiNqkza4DJMEClc+4Zz0sWbYoF0jVHVWH0kIV1plub/5X53By4nm8FuKxiZV3LyLF
	 IdHGMuwlB/ZGcNO7mXB/B+P/NZibE0wnkNSP9TY6O8o0Hq6hwJ1V5F+1y3WRv5Ja3j
	 i9vP79FTKvRcRIIeFE3z+rt3Kk9oX309v6GRviDBIRNOqBAwy8fHtux5Do5QnY9P95
	 nYTsv8vpjj04Q==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH]=20kconfig/randconfig:=20Remove=20non-existing=20config?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1742999343805
To: xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Doug Goldstein" <cardoe@cardoe.com>
Message-Id: <20250326142900.5630-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.01eb9fc5f2164be6b9193a22c4edc3f9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250326:md
Date: Wed, 26 Mar 2025 14:29:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

CONFIG_GCOV_FORMAT_AUTODETECT has been removed in 767e6c5fd55b.

Fixes: 767e6c5fd55b ("kconfig/gcov: remove gcc version choice from kconfig")
Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 xen/tools/kconfig/allrandom.config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/tools/kconfig/allrandom.config b/xen/tools/kconfig/allrandom.config
index c7753ac4ad..f04b589a80 100644
--- a/xen/tools/kconfig/allrandom.config
+++ b/xen/tools/kconfig/allrandom.config
@@ -1,3 +1,2 @@
 # Explicit option choices not subject to regular RANDCONFIG
 
-CONFIG_GCOV_FORMAT_AUTODETECT=y
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

