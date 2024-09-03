Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4749697EA
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 10:54:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788867.1198361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slPIq-0006Ph-SO; Tue, 03 Sep 2024 08:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788867.1198361; Tue, 03 Sep 2024 08:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slPIq-0006NP-Pm; Tue, 03 Sep 2024 08:54:20 +0000
Received: by outflank-mailman (input) for mailman id 788867;
 Tue, 03 Sep 2024 08:54:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oq6X=QB=bounce.vates.tech=bounce-md_30504962.66d6ceb2.v1-590df50ca5a542b8b1a05e442b61fa3f@srs-se1.protection.inumbo.net>)
 id 1slPIp-0006NH-1W
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 08:54:19 +0000
Received: from mail177-17.suw61.mandrillapp.com
 (mail177-17.suw61.mandrillapp.com [198.2.177.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 192d4a4a-69d2-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 10:54:16 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-17.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4WyfYt1dXJzRKLfGg
 for <xen-devel@lists.xenproject.org>; Tue,  3 Sep 2024 08:54:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 590df50ca5a542b8b1a05e442b61fa3f; Tue, 03 Sep 2024 08:54:10 +0000
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
X-Inumbo-ID: 192d4a4a-69d2-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725353650; x=1725614150;
	bh=O8MWTXa18Q9Fk3Virh59oseSFbXd7CxePBA++DDaytQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=bppI+2DdfMOCDc66XG85yJNKsgivYgkWMOlbgxcEr0/De1l+/ZqVoV3jnKd2YIU3N
	 hf3WuAS4KdLhp1PKDMXlWf1BiKR6VPOyMWlR68WvMOw9q5hYY/Q5BmCuA7p7VwYw7K
	 iumX1a46E4PY/rHcEIAwYo9LjgRqOZd+14Ad7lujXgFfQmWpmqsHucLGn3fqXIxwqw
	 mBnY+vn1bY2vrfAB3EbR0jp+4aC72PKOzVx+9HnEqZBSTjdY4EHYJ70PnJobAZn36r
	 RkRpOmZL4gFqozeIB1S8FXkqJ1M2ZODw27INtIf5/Bb9FZIHexL4kaQlPNry5d5nTl
	 7h09mW3qn0cEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725353650; x=1725614150; i=anthony.perard@vates.tech;
	bh=O8MWTXa18Q9Fk3Virh59oseSFbXd7CxePBA++DDaytQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=h1AilKKzm5UkIa53Tl0HQAbzPMCxvaiAyjoYpt+cQSzMUeRPVjhE1Xvy4OBq2sP19
	 UMKWHZHLIoKWgp7DS4eKJsuvOn9bkZrY4+zHCl/BQTywJc5oE/zewAnD7bsxOg0bVZ
	 j0rJZUGIMNi4BPKwNTgi9YB3lFKNRGz3mrnxz8qlTxc8jnYy7+2bAsJNW0etfPlVpG
	 27l0F0zVPGUp/W7tN3/p7r3h4ZXzydci87ZPZukEsktJv6Ny31pwfK6MZnDAw0gpOm
	 qyryzgewSXWCOISsPyLDFaf2ryMuGzAxOZ3wCEzagW5ix95OLd4QPHa08ckg2SNbui
	 pHBqOUAGCOv8w==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH]=20CHANGELOG:=20Update=20after=20fixing=20dm=5Frestrict?=
X-Mailer: git-send-email 2.39.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725353649432
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager <community.manager@xenproject.org>
Message-Id: <20240903085311.49818-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.590df50ca5a542b8b1a05e442b61fa3f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240903:md
Date: Tue, 03 Sep 2024 08:54:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Fixed by change 82335a8cc54c ("libxl: Probe QEMU for -run-with
chroot=dir and use it").

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 CHANGELOG.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5521ae5bb3..fb9a66c727 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On x86:
    - Support for running on Xeon Phi processors.
 
+### Fixed
+ - Fixed xl/libxl dm\_restrict feature with QEMU 9.0.
+
+
 ## [4.19.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.19.0) - 2024-07-29
 
 ### Changed
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

