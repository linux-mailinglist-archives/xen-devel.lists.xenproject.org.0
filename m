Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E5DB39F46
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 15:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098896.1452864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcvF-0001IU-3c; Thu, 28 Aug 2025 13:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098896.1452864; Thu, 28 Aug 2025 13:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcvF-0001Fl-0I; Thu, 28 Aug 2025 13:44:13 +0000
Received: by outflank-mailman (input) for mailman id 1098896;
 Thu, 28 Aug 2025 13:44:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eArr=3I=bounce.vates.tech=bounce-md_30504962.68b05d28.v1-c0fa1d0cf4064c84899b1ef9bfdfb85b@srs-se1.protection.inumbo.net>)
 id 1urcvD-0000IL-5j
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 13:44:11 +0000
Received: from mail180-6.suw31.mandrillapp.com
 (mail180-6.suw31.mandrillapp.com [198.2.180.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1292fa90-8415-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 15:44:09 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-6.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4cCN0m4zzWz2K22BX
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 13:44:08 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c0fa1d0cf4064c84899b1ef9bfdfb85b; Thu, 28 Aug 2025 13:44:08 +0000
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
X-Inumbo-ID: 1292fa90-8415-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756388648; x=1756658648;
	bh=JA+/yfk9Af6wY74EpBXK3E5RVQRYRs4jfDuZX0QuHCg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YicXwdNJk3iA5Stv0Ge2sMhZpQLkbo3xKq9fnHqkpw3+DfQ/IJ5rvs6KpdpSwwO/m
	 1AcVRXc3OYe0izsI7p/P36oLpEsUM5qKJCyGUdReoYW1oZIwAAWVz2BCmu8x6jt1Ia
	 RbHUqqZoPQBFSvRVqFR2EfL0IPkUE6xD569uWYFTvV4SHXWpK9+GzNcrK5UG1TArkV
	 Eji9D5+v9NMmI6WPfXcfGswrCEUvs6BPrHpZZwugaUcFPCoRoC2BQGvlDRU1cwG6Jt
	 Xv4Ol6F2i6MXX+fIKp5fDpk1/vmBKTmDiXOsVmDaswlO2z9PUt3ZdPPIfzJvXzTpt+
	 8RyAj9t/cruIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756388648; x=1756649148; i=teddy.astie@vates.tech;
	bh=JA+/yfk9Af6wY74EpBXK3E5RVQRYRs4jfDuZX0QuHCg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=kUnHqb+cou97i8ychepgLOMS8D2sJGoCdlM3wIvmqQ+ZnO2O67+rTV1H3DPgPHDqK
	 tw4tJEaQsyTj3ZBn9KneA8qrD6vfBpynInPqcA3in6kxEReogu+xUXPeQTMiYZLDC0
	 jAhalROmYtZXPOda71/t3ulE+BTMplK40k0Ly3vOChaaVjtRH48Y7y4T6TslO00OnF
	 bnFHyEI9lESmsDQTf0NVZzZ8U30QNrIqbqFMbPuNFa18Aak/RCgVeqzmYy7KWeW5Kn
	 HEwVUyzFVqBBPP20HNymz3l2U7em88mUjhFU+WIOQG2pLPHgNaQAUC5BViTHjdI+sf
	 89JSYJQ0ZdIOA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=203/3]=20CHANGELOG.md:=20Add=20SMBIOS=202.6=20update=20statement?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756388647890
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>
Message-Id: <189aa906a1061a209f982f68291df12194a4f6fe.1756386155.git.teddy.astie@vates.tech>
In-Reply-To: <8c36ee844f69c59cf2c504b411e6cf9c5617511b.1756386155.git.teddy.astie@vates.tech>
References: <8c36ee844f69c59cf2c504b411e6cf9c5617511b.1756386155.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c0fa1d0cf4064c84899b1ef9bfdfb85b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250828:md
Date: Thu, 28 Aug 2025 13:44:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - introduced
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8c4435c181..80a8273d7e 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -34,6 +34,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Support in hvmloader for new SMBIOS tables: 7 (Cache Info), 8 (Port
      Connector), 9 (System Slots), 26 (Voltage Probe), 27 (Cooling Device),
      and 28 (Temperature Probe).
+   - Updated SMBIOS version to 2.6.
 
  - On Arm:
     - Ability to enable stack protector
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


