Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ED97F9AF3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 08:29:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641630.1000361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7W3E-0005BB-QK; Mon, 27 Nov 2023 07:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641630.1000361; Mon, 27 Nov 2023 07:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7W3E-000580-NV; Mon, 27 Nov 2023 07:29:04 +0000
Received: by outflank-mailman (input) for mailman id 641630;
 Mon, 27 Nov 2023 07:29:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRKV=HI=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1r7W3D-0004kO-BF
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 07:29:03 +0000
Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1998854-8cf6-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 08:29:01 +0100 (CET)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 0EDD41A518;
 Mon, 27 Nov 2023 02:28:59 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 064691A517;
 Mon, 27 Nov 2023 02:28:59 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [188.163.75.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id B2C721A516;
 Mon, 27 Nov 2023 02:28:55 -0500 (EST)
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
X-Inumbo-ID: a1998854-8cf6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=JxaNh5W5NVw14x6LTlh4LsUYY
	sXdhWV9cMoMNLEDhSM=; b=jqHc+rVh38HE5GawOxoTPLHXqGIuJB5IUfFZjkvlk
	QrKYYmSPtTgyO/nyWGDxNynmNVNDRmyij8vh+9KYzm8bozxS9T4J8X8Ue/JcRWZd
	vm9YB1UmiR9FGHbrURTvFaTOM+tc09UIwMbS7Q6bWRWLHP6JsFDI7P8qAMqUrPZo
	lw=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org,
	Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [RFC PATCH v1 1/5] libxl: Pass max_vcpus to Qemu in case of PVH domain (Arm) as well
Date: Mon, 27 Nov 2023 09:27:50 +0200
Message-Id: <20231127072754.4045254-2-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127072754.4045254-1-Sergiy_Kibrik@epam.com>
References: <20231127072754.4045254-1-Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 9F4C56C2-8CF6-11EE-888E-A19503B9AAD1-90055647!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The number of vCPUs used for the IOREQ configuration (machine->smp.cpus)
should really match the system value as for each vCPU we setup a dedicate=
d
evtchn for the communication with Xen at the runtime. This is needed
for the IOREQ to be properly configured and work if the involved domain
has more than one vCPU assigned.

Note that Qemu should set mc->max_cpus to GUEST_MAX_VCPUS in
xen_arm_machine_class_init().

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 tools/libs/light/libxl_dm.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 14b593110f..0b2548d35b 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1553,18 +1553,6 @@ static int libxl__build_device_model_args_new(libx=
l__gc *gc,
         if (!libxl__acpi_defbool_val(b_info)) {
             flexarray_append(dm_args, "-no-acpi");
         }
-        if (b_info->max_vcpus > 1) {
-            flexarray_append(dm_args, "-smp");
-            if (b_info->avail_vcpus.size) {
-                int nr_set_cpus =3D 0;
-                nr_set_cpus =3D libxl_bitmap_count_set(&b_info->avail_vc=
pus);
-
-                flexarray_append(dm_args, GCSPRINTF("%d,maxcpus=3D%d",
-                                                    nr_set_cpus,
-                                                    b_info->max_vcpus));
-            } else
-                flexarray_append(dm_args, GCSPRINTF("%d", b_info->max_vc=
pus));
-        }
         for (i =3D 0; i < num_nics; i++) {
             if (nics[i].nictype =3D=3D LIBXL_NIC_TYPE_VIF_IOEMU) {
                 char *smac =3D GCSPRINTF(LIBXL_MAC_FMT,
@@ -1800,6 +1788,22 @@ static int libxl__build_device_model_args_new(libx=
l__gc *gc,
     for (i =3D 0; b_info->extra && b_info->extra[i] !=3D NULL; i++)
         flexarray_append(dm_args, b_info->extra[i]);
=20
+    if (b_info->type =3D=3D LIBXL_DOMAIN_TYPE_HVM ||
+        b_info->type =3D=3D LIBXL_DOMAIN_TYPE_PVH) {
+        if (b_info->max_vcpus > 1) {
+            flexarray_append(dm_args, "-smp");
+            if (b_info->avail_vcpus.size) {
+                int nr_set_cpus =3D 0;
+                nr_set_cpus =3D libxl_bitmap_count_set(&b_info->avail_vc=
pus);
+
+                flexarray_append(dm_args, GCSPRINTF("%d,maxcpus=3D%d",
+                                                    nr_set_cpus,
+                                                    b_info->max_vcpus));
+            } else
+                flexarray_append(dm_args, GCSPRINTF("%d", b_info->max_vc=
pus));
+        }
+    }
+
     flexarray_append(dm_args, "-machine");
     switch (b_info->type) {
     case LIBXL_DOMAIN_TYPE_PVH:
--=20
2.25.1


