Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9038BAF25
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 16:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716518.1118676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2u6c-0002WH-DL; Fri, 03 May 2024 14:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716518.1118676; Fri, 03 May 2024 14:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2u6c-0002UO-8N; Fri, 03 May 2024 14:41:46 +0000
Received: by outflank-mailman (input) for mailman id 716518;
 Fri, 03 May 2024 14:41:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QA1=MG=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s2u6a-0002U7-VG
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 14:41:45 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41cbcce7-095b-11ef-b4bb-af5377834399;
 Fri, 03 May 2024 16:41:42 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id E5FE8800A5;
 Fri,  3 May 2024 15:41:41 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id AF1072018C; Fri,  3 May 2024 15:41:41 +0100 (BST)
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
X-Inumbo-ID: 41cbcce7-095b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1714747301;
	bh=KhHuubhLIPBWRZvjJf4xnGUWWnqkkuWA6mNwGxiVRt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yIHTe500zhFyoQtaZ4zkjaCkZJa6Q5BneUmw1Ijkt/ZikST7LrcEkv+oFVFan5vzS
	 bbMcZAeKEttsSMKI8zH3AbBoJ6rOaM6Xi1a6B5i74cX3NDlGLuXllCTrOGuinevZu4
	 xNX6FFJ4xgcgNuBu++xFPPYyBBdXoVW7Saa/25jc=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [RFC PATCH 4/5] docs/man: document VIF vid keyword
Date: Fri,  3 May 2024 15:41:23 +0100
Message-Id: <20240503144124.12931-5-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503144124.12931-1-leigh@solinno.co.uk>
References: <20240503144124.12931-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new `vid' keyword in xl-network-configuration(5).

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
---
 docs/man/xl-network-configuration.5.pod.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/man/xl-network-configuration.5.pod.in b/docs/man/xl-network-configuration.5.pod.in
index f3e379bcf8..fe2615ae30 100644
--- a/docs/man/xl-network-configuration.5.pod.in
+++ b/docs/man/xl-network-configuration.5.pod.in
@@ -259,6 +259,12 @@ Specifies the MTU (i.e. the maximum size of an IP payload, exclusing headers). T
 default value is 1500 but, if the VIF is attached to a bridge, it will be set to match
 unless overridden by this parameter.
 
+=head2 vid
+
+Specifies the VLAN ID. If this is set to a non-zero value, it will be specified
+when attaching the VIF to a bridge.  This can be used on operating systems that
+support bridge VLANs (e.g. Linux using iproute2).
+
 =head2 trusted / untrusted
 
 An advisory setting for the frontend driver on whether the backend should be
-- 
2.39.2


