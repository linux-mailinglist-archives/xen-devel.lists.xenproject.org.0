Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C507EC141
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 12:26:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633570.988503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3E2L-0004Hm-5I; Wed, 15 Nov 2023 11:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633570.988503; Wed, 15 Nov 2023 11:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3E2L-0004Fb-1j; Wed, 15 Nov 2023 11:26:25 +0000
Received: by outflank-mailman (input) for mailman id 633570;
 Wed, 15 Nov 2023 11:26:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zXr+=G4=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1r3E2I-00040Y-Sb
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 11:26:22 +0000
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd496433-83a9-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 12:26:22 +0100 (CET)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id D19B71C1C52;
 Wed, 15 Nov 2023 06:26:20 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id C81E61C1C51;
 Wed, 15 Nov 2023 06:26:20 -0500 (EST)
 (envelope-from sakib@darkstar.site)
Received: from localhost (unknown [185.130.54.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 048051C1C50;
 Wed, 15 Nov 2023 06:26:19 -0500 (EST)
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
X-Inumbo-ID: cd496433-83a9-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=sasl; bh=JxaNh5W5NVw14x6LTlh4LsUYY
	sXdhWV9cMoMNLEDhSM=; b=pjR8CoD4gwzYJAPi0xYy/o769TT/+yKq/bCNtT9By
	aLAcktWXb25mxP4oFBpKdnLOt5g1TnxSjbXc78oMezBK7otKOgOdXhPEtWCh3uCL
	rOksX+7714pQMl0D8G7Fa3/sQHm0dfku1gmUz+GD4voHxJaPC3LJrFiqEksV2R8X
	VM=
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: [RFC PATCH 1/6] libxl: Pass max_vcpus to Qemu in case of PVH domain (Arm) as well
Date: Wed, 15 Nov 2023 13:26:06 +0200
Message-Id: <20231115112611.3865905-2-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID:
 CC99A9D2-83A9-11EE-8DEE-25B3960A682E-90055647!pb-smtp2.pobox.com
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


