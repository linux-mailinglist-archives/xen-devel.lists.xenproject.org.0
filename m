Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6757731A99A
	for <lists+xen-devel@lfdr.de>; Sat, 13 Feb 2021 03:06:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84480.158493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAkJe-0005ie-7a; Sat, 13 Feb 2021 02:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84480.158493; Sat, 13 Feb 2021 02:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAkJe-0005iF-4A; Sat, 13 Feb 2021 02:05:46 +0000
Received: by outflank-mailman (input) for mailman id 84480;
 Sat, 13 Feb 2021 02:05:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8A84=HP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lAkJc-0005iA-Hk
 for xen-devel@lists.xenproject.org; Sat, 13 Feb 2021 02:05:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 557ddec8-3825-44be-8940-54ff37dfe3bc;
 Sat, 13 Feb 2021 02:05:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0258C64E02;
 Sat, 13 Feb 2021 02:05:42 +0000 (UTC)
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
X-Inumbo-ID: 557ddec8-3825-44be-8940-54ff37dfe3bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613181943;
	bh=AP/Wps9XW8Z6HndHtp5zQ4prDNlOHmK5VMAi50oZeGo=;
	h=From:To:Cc:Subject:Date:From;
	b=tS710+zSkQ12Erqlct6ZnUeEIPpP7uVNkDZaDS/zYNX9hmW+rt8AAHjDc1cNaJcvY
	 GRBjVr9MlzUMuOY+MGghZVvfuvWESg+ubFuYABLz1hJQWOunQnQrCCImeMxyVRnrCj
	 xQYfAQYAkAb/rnTbzc5FZGyx6mcMtRSIZNK02YcE8qp97rjf3VJQvYN7jz8xfYLrAM
	 sFneIBvqDz/FEql1W29Edm7JT2cvdn4HvgzpzjDdayDffw0z3Mc+6vF2eqw2dwDB0M
	 g3pm6HsCPWrYvV+e9l+Bd01evq1mSGD5tsGOuVRQTyl7eAUbfcL7Ul2TnFw1cpKlII
	 h3X6OA/teFhPA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	andrew.cooper3@citrix.com,
	wl@xen.org,
	iwj@xenproject.org,
	anthony.perard@citrix.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH] firmware: don't build hvmloader if it is not needed
Date: Fri, 12 Feb 2021 18:05:40 -0800
Message-Id: <20210213020540.27894-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

If rombios, seabios and ovmf are all disabled, don't attempt to build
hvmloader.

This patches fixes the x86 alpine linux builds currently failing in
gitlab-ci.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 tools/firmware/Makefile | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/firmware/Makefile b/tools/firmware/Makefile
index 1f27117794..e68cd0d358 100644
--- a/tools/firmware/Makefile
+++ b/tools/firmware/Makefile
@@ -13,7 +13,16 @@ SUBDIRS-$(CONFIG_ROMBIOS) += rombios
 SUBDIRS-$(CONFIG_ROMBIOS) += vgabios
 SUBDIRS-$(CONFIG_IPXE) += etherboot
 SUBDIRS-$(CONFIG_PV_SHIM) += xen-dir
-SUBDIRS-y += hvmloader
+ifeq ($(CONFIG_ROMBIOS),y)
+CONFIG_HVMLOADER ?= y
+endif
+ifeq ($(CONFIG_SEABIOS),y)
+CONFIG_HVMLOADER ?= y
+endif
+ifeq ($(CONFIG_OVMF),y)
+CONFIG_HVMLOADER ?= y
+endif
+SUBDIRS-$(CONFIG_HVMLOADER) += hvmloader
 
 SEABIOSCC ?= $(CC)
 SEABIOSLD ?= $(LD)
-- 
2.17.1


