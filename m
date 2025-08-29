Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5562B3B7E5
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 11:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101003.1454252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urvsE-0006cU-LM; Fri, 29 Aug 2025 09:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101003.1454252; Fri, 29 Aug 2025 09:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urvsE-0006Zj-Hc; Fri, 29 Aug 2025 09:58:22 +0000
Received: by outflank-mailman (input) for mailman id 1101003;
 Fri, 29 Aug 2025 09:58:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yRcD=3J=bounce.vates.tech=bounce-md_30504962.68b179b8.v1-b609b0b9d6014b79849173438dece5da@srs-se1.protection.inumbo.net>)
 id 1urvsC-00065v-I8
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 09:58:20 +0000
Received: from mail180-6.suw31.mandrillapp.com
 (mail180-6.suw31.mandrillapp.com [198.2.180.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af8dfdcf-84be-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 11:58:18 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-6.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4cCtxh6d6Lz2K249B
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 09:58:16 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b609b0b9d6014b79849173438dece5da; Fri, 29 Aug 2025 09:58:16 +0000
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
X-Inumbo-ID: af8dfdcf-84be-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756461496; x=1756731496;
	bh=JA+/yfk9Af6wY74EpBXK3E5RVQRYRs4jfDuZX0QuHCg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=m2Vx8GKRi5XQ1WlIKrO9KhCYAsYZvk/GwIH5fkiib+MuocsH5tl6CX7hZOt3V8fPv
	 NQihH04Z4VEADubO/W+oEUOVUICsuvYNr9u78l3DgalL98ppwWb2t0VGMxelFyV/Lg
	 8AWiLNzVwpBgw0YAUSZDNcAosZzJP1OtpfqloKFbKIBt3bpi8tjQrpDdOpADk3Z/ws
	 KvEKYFOQ/sWqt6oUCgkia3HPmTY7/ckhKZn4DmZrgiDVKFR+6xygl7QWSU6w2RMwYf
	 NEpJF617dgd4BWD3sRzR0wFfpIUWSYK5etQHlrMI1WCoVM86tuW4XlRpcZdDOgZnGI
	 UO6t856Hc/yLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756461496; x=1756721996; i=teddy.astie@vates.tech;
	bh=JA+/yfk9Af6wY74EpBXK3E5RVQRYRs4jfDuZX0QuHCg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aYysHQ4nIG733K+5u2ICwbw03ZwehDibwUXK0bCrnk5upmo/EYZ0Qms2dtCiNNmye
	 rnOrI+9J3jCbYIrOHaq61uWHODqlSzcIiJL8bSEKZy9gM8CQpgEoY6zHtRBZXPb4GH
	 1mlITo7YG6wju6MIP8B9v08TzrQlx7oO1uyMpFkqNnmzgjgxN+KlXrTe3VCXYpQUWV
	 n4G+FeI56U75WhWy3uv0iYYM7r6dyWVrXIRdIVEftNTW82l8nVTo02JXvMUXIFPBdu
	 rMODGIqWmasWB5g5xE+NZ1lMIzKT0QZcUh0wHxReMHm47UkUvTeLiADhi9DMTaLobB
	 TwcM5grDqaiqw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RESEND=20PATCH=20v2=203/3]=20CHANGELOG.md:=20Add=20SMBIOS=202.6=20update=20statement?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756461496237
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>
Message-Id: <301a84287488629932950c1cefef3a97c3d9ba0d.1756460430.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1756460430.git.teddy.astie@vates.tech>
References: <cover.1756460430.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b609b0b9d6014b79849173438dece5da?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250829:md
Date: Fri, 29 Aug 2025 09:58:16 +0000
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


