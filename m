Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301A8A123B9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 13:28:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872442.1283433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2V9-0007Of-Jm; Wed, 15 Jan 2025 12:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872442.1283433; Wed, 15 Jan 2025 12:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY2V9-0007MQ-GA; Wed, 15 Jan 2025 12:28:03 +0000
Received: by outflank-mailman (input) for mailman id 872442;
 Wed, 15 Jan 2025 12:28:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WDCk=UH=bounce.vates.tech=bounce-md_30504962.6787a9cc.v1-8efef2ade84749499ffccea0abd79f50@srs-se1.protection.inumbo.net>)
 id 1tY2V7-0006fG-MR
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 12:28:01 +0000
Received: from mail128-16.atl41.mandrillapp.com
 (mail128-16.atl41.mandrillapp.com [198.2.128.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 268a449e-d33c-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 13:27:57 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-16.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4YY4yh3rrqzRKbjGW
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 12:27:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8efef2ade84749499ffccea0abd79f50; Wed, 15 Jan 2025 12:27:56 +0000
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
X-Inumbo-ID: 268a449e-d33c-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1736944076; x=1737204576;
	bh=rD0TZYM4EFPHaYU8mIWlW5dHR2cgOw47UUmTX3U9tk8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tIWPzN5RSojyiDFWRLsFOqvdd+YczZrT9cjwQavBtyDHdMKVZouHMs2GtwucQbBj5
	 YFrv8s3r9AzPO+Zg3+K9mCWLYlVSH638zZ/spvPrYG4+lWXYXjShIrWy9lHADlDJ+B
	 bfxrpd9l2F+8t/1yBD+3GAOaoiBNeVYOxiga1tly1QSVXPZWOuUxTqIcy2YtHFHBav
	 qdir7stGD59jUH1ahdtAwq9WJkTFQW1vHdVPxFD9/+dQlQ5zmacsg+/lrC08w6aotP
	 90s2H9F97DnmPFZb9RkY6WIBdTZgnHRJHp2qLh+hnGC9aj3ERJhwEpWqmAzpXFGtt/
	 MerVDirPZGxDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1736944076; x=1737204576; i=yann.dirson@vates.tech;
	bh=rD0TZYM4EFPHaYU8mIWlW5dHR2cgOw47UUmTX3U9tk8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZaibYpU+i37ILH2TF9fFP6/QUCPenhqahN3H3szktJ5Vf4tK+gR1NB+01L/PnFGZV
	 OOv/O8dmCVKlrmpwAbTNVURbw8EV+tVAyTHCkpp0bWhl6ExmVvEbzKKckpwbK4XyXM
	 8XpxhUFOY7KRQz4eStLNs7B8zTblkCbDMHdpfmguY8XkapKE/sjtMNOOSabysEFs2t
	 e56ACM5wR/cjS+kuUIbuoM2uQRkIuqIwZQ/L0qo8iQ6c6MaO21D+BSdYnlStROiYac
	 HOVkkuX2duhk/uG2CUc1BFCbBIN2JC9ipzfa+qZCoSV5/s7hgYUxonKCqcJQ0Pk+tB
	 jqbO5SGTH7I6g==
From: "Yann Dirson" <yann.dirson@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v2=202/3]=20docs:=20rationalise=20.gitignore?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1736944075408
To: xen-devel@lists.xenproject.org
Cc: "Yann Dirson" <yann.dirson@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <c3f6a2d8fd7a1df487a6fce99e8e0f785ac4fc75.1736943927.git.yann.dirson@vates.tech>
In-Reply-To: <cover.1736943927.git.yann.dirson@vates.tech>
References: <cover.1736943927.git.yann.dirson@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8efef2ade84749499ffccea0abd79f50?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250115:md
Date: Wed, 15 Jan 2025 12:27:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Note I did not transplant the patterns under doc/txt/ (since the whole
dir is ignored already), and adjusted sort order to be fully
alphabetical.

Signed-off-by: Yann Dirson <yann.dirson@vates.tech>
---
 .gitignore      | 17 -----------------
 docs/.gitignore | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 17 deletions(-)
 create mode 100644 docs/.gitignore

diff --git a/.gitignore b/.gitignore
index 25484a8fd8..53f5df0003 100644
--- a/.gitignore
+++ b/.gitignore
@@ -50,19 +50,6 @@ config/Toplevel.mk
 config/Paths.mk
 
 dist/*
-docs/tmp.*
-docs/html/
-docs/man/xl.cfg.5.pod
-docs/man/xl-disk-configuration.5.pod
-docs/man/xl-network-configuration.5.pod
-docs/man/xl.1.pod
-docs/man/xl.conf.5.pod
-docs/man1/
-docs/man5/
-docs/man7/
-docs/man8/
-docs/pdf/
-docs/txt/
 extras/
 install/*
 
@@ -302,7 +289,3 @@ tools/debugger/kdd/kdd
 tools/firmware/etherboot/ipxe.tar.gz
 tools/firmware/etherboot/ipxe/
 tools/xl/xl
-
-docs/txt/misc/*.txt
-docs/txt/man/*.txt
-docs/figs/*.png
diff --git a/docs/.gitignore b/docs/.gitignore
new file mode 100644
index 0000000000..0727c6d7cf
--- /dev/null
+++ b/docs/.gitignore
@@ -0,0 +1,14 @@
+/figs/*.png
+/html/
+/man/xl.cfg.5.pod
+/man/xl-disk-configuration.5.pod
+/man/xl-network-configuration.5.pod
+/man/xl.1.pod
+/man/xl.conf.5.pod
+/man1/
+/man5/
+/man7/
+/man8/
+/pdf/
+/tmp.*
+/txt/
-- 
2.39.5



Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

