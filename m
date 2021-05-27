Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B548392A1B
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 10:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132928.247876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmBlC-00072j-Bs; Thu, 27 May 2021 08:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132928.247876; Thu, 27 May 2021 08:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmBlC-00070d-8q; Thu, 27 May 2021 08:52:58 +0000
Received: by outflank-mailman (input) for mailman id 132928;
 Thu, 27 May 2021 08:52:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dwL=KW=darkstar.site=sakib@srs-us1.protection.inumbo.net>)
 id 1lmBlA-00070X-DZ
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 08:52:56 +0000
Received: from pb-smtp2.pobox.com (unknown [64.147.108.71])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1113c13b-c9a8-4107-834e-9619cb4dc8b0;
 Thu, 27 May 2021 08:52:54 +0000 (UTC)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 90AF6CEDCB;
 Thu, 27 May 2021 04:52:54 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 86F59CEDCA;
 Thu, 27 May 2021 04:52:54 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [95.67.114.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id C2A06CEDC9;
 Thu, 27 May 2021 04:52:53 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
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
X-Inumbo-ID: 1113c13b-c9a8-4107-834e-9619cb4dc8b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=pSkglQJM+7qceceFKKwFTWVbzJdX1y2GYzYnRFShvQs=; b=VdZR
	TxT1GbOMZuEC3XnM3lC/+uRDjNcy8WKRV68el2EiGzrWgqLyn4762nB/q17AzZeW
	1tRM5qdoiIHBBSp4JxUYde6Cm081/YUHwplJbnqyYcZkVu72iYllj7FVDuaPiVVH
	EfFUchIj7/FwIpmwNagz/EELW7ye7sQgWuL/E4Q=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Wei Liu <wl@xen.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v2] libxl/arm: provide guests with random seed
Date: Thu, 27 May 2021 08:52:33 +0000
Message-Id: <20210527085233.69917-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 ECA8B4A0-BEC8-11EB-ADE8-FD8818BA3BAF-90055647!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

Pass 128 bytes of random seed via FDT, so that guests' CRNGs are better s=
eeded
early at boot. This is larger than ChaCha20 key size of 32, so each byte =
of
CRNG state will be mixed 4 times using this seed. There does not seem to =
be
advantage in larger seed though.

Depending on its configuration Linux can use the seed as device randomnes=
s
or to just quickly initialize CRNG.
In either case this will provide extra randomness to further harden CRNG.

CC: Julien Grall <julien@xen.org>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 tools/libxl/libxl_arm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
index 34f8a29056..d3a4a72fb7 100644
--- a/tools/libxl/libxl_arm.c
+++ b/tools/libxl/libxl_arm.c
@@ -304,6 +304,9 @@ static int make_chosen_node(libxl__gc *gc, void *fdt,=
 bool ramdisk,
 {
     int res;
=20
+    /* 1024 bit enough to mix Linux CRNG state several times */
+    uint8_t seed[128];
+
     /* See linux Documentation/devicetree/... */
     res =3D fdt_begin_node(fdt, "chosen");
     if (res) return res;
@@ -342,6 +345,11 @@ static int make_chosen_node(libxl__gc *gc, void *fdt=
, bool ramdisk,
         if (res) return res;
     }
=20
+    res =3D libxl__random_bytes(gc, seed, sizeof(seed));
+    if (res) return res;
+    res =3D fdt_property(fdt, "rng-seed", seed, sizeof(seed));
+    if (res) return res;
+
     res =3D fdt_end_node(fdt);
     if (res) return res;
=20
--=20
2.25.1


