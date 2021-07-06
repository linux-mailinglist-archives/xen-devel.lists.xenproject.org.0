Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260FA3BC6BF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 08:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150753.278703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0emn-0002Ao-0m; Tue, 06 Jul 2021 06:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150753.278703; Tue, 06 Jul 2021 06:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0emm-00028V-S6; Tue, 06 Jul 2021 06:42:24 +0000
Received: by outflank-mailman (input) for mailman id 150753;
 Tue, 06 Jul 2021 06:42:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NDCi=L6=darkstar.site=sakib@srs-us1.protection.inumbo.net>)
 id 1m0eml-00026x-7m
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 06:42:23 +0000
Received: from pb-smtp1.pobox.com (unknown [64.147.108.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51266e4c-de25-11eb-8475-12813bfff9fa;
 Tue, 06 Jul 2021 06:42:22 +0000 (UTC)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id C3CCDDBCE2;
 Tue,  6 Jul 2021 02:42:21 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id ABCCEDBCE0;
 Tue,  6 Jul 2021 02:42:21 -0400 (EDT)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [91.206.32.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 9DE2ADBCDF;
 Tue,  6 Jul 2021 02:42:17 -0400 (EDT)
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
X-Inumbo-ID: 51266e4c-de25-11eb-8475-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=8zN62VEpwKBf6HVunARHc9SdCuhzxpB4cKJkCabouww=; b=BRTv
	1obdTJ6VVNUtkU/qeId/3Ofs5fEYvF6zEItbYcG9EK1l3hD9feFNkADfnqhFbdj/
	32djhR9aGwxuYG1Or0bxMUwzpVIN/OI9sGQt6W0QVKLXz37uxt8K7XCqB0hVKCs0
	YEAaIPyL/GhW8xfWT0KN+51rHLx4lqK/SiVnvzg=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Wei Liu <wl@xen.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v3] libxl/arm: provide guests with random seed
Date: Tue,  6 Jul 2021 06:33:45 +0000
Message-Id: <20210706063345.91169-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Pobox-Relay-ID:
 4E78CAF0-DE25-11EB-BDCA-8B3BC6D8090B-90055647!pb-smtp1.pobox.com
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

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Reviewed-by: Julien Grall <julien@xen.org>

---
	Changes in V3:
		- Rebased on current master

---
 tools/libs/light/libxl_arm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e2901f13b7..e3140a6e00 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -305,6 +305,9 @@ static int make_chosen_node(libxl__gc *gc, void *fdt,=
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
@@ -343,6 +346,11 @@ static int make_chosen_node(libxl__gc *gc, void *fdt=
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


