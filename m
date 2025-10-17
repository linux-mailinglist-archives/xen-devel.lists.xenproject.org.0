Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED1BE6142
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 04:07:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144843.1478075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9ZrN-00064U-09; Fri, 17 Oct 2025 02:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144843.1478075; Fri, 17 Oct 2025 02:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9ZrM-000634-TX; Fri, 17 Oct 2025 02:06:24 +0000
Received: by outflank-mailman (input) for mailman id 1144843;
 Fri, 17 Oct 2025 02:06:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E5B7=42=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v9ZrL-00062y-8G
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 02:06:23 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dec8375f-aafd-11f0-9d15-b5c5bf9af7f9;
 Fri, 17 Oct 2025 04:06:20 +0200 (CEST)
Received: from SJ0PR05CA0182.namprd05.prod.outlook.com (2603:10b6:a03:330::7)
 by DS0PR12MB7993.namprd12.prod.outlook.com (2603:10b6:8:14b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 02:06:15 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::b9) by SJ0PR05CA0182.outlook.office365.com
 (2603:10b6:a03:330::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.6 via Frontend Transport; Fri,
 17 Oct 2025 02:06:15 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Fri, 17 Oct 2025 02:06:15 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 16 Oct
 2025 19:06:15 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 16 Oct
 2025 21:06:14 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 16 Oct 2025 19:06:14 -0700
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
X-Inumbo-ID: dec8375f-aafd-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOan3pdaA3JLa5TW3wY6NzXlzZzZWvQUzMTggOj5FNuEZtX7xT69Rv/XVTtx/dhBhBVqrWjg7Um3ihwyB41REvcPF2zlKhym56796x+avTMaJJk1bbrFZq7bY5TWMlThyUWLbbXbsoTDaKd35REcoUvcCteHw79xiPE7UrsLFVPiT8GaQWXLAhE6/tWOWYmIl6pMUvIqYcFPNMsT0VQZdlupcID7XuUDBAkMtDLiiEywu9BNxs/X1hRbKjcq1mOIljtErYHyuXCHUsPaNKTJDKV3MolYeEPNLOg4HHaw0yPqkECFAdgMX34E0gNUg7xRprzy0RUbljAwPnSxnNhENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxI9lOxDCuyTUAzAL7oPKcrGR+xyO4sju64Gbv2QO7g=;
 b=yci0z1d8yDxlL/x3Kdc0slPsZsgCLyr/0/qlPC5vNEQWSJ9GjL8NU6TwnbbGb3/KnNlcJ5h+zH/fDIRXF0hDwmleYUi3ttHSNAU7NtW03SYfUOQn3WSovbw+v+RjGReN6HWCnL1S3yI1pyUZQfR4dEPqCUznyQU8S1TWfJL31ZBhosTGgT9aoOyF2cnGm/crsNamelaKFyaKR0jxb6Ef+AxLGCM9c8v7fmQ406+4pyvUqiwBLTyv4g1BmyUoSX5QCIBzAsFHizsrzznmFAUeQ628U4Rj5bbow169e3FZP//CTyeniA6SlLI5FQ9YgWp0McS6T0G2hCRGcvqJ0BzblA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxI9lOxDCuyTUAzAL7oPKcrGR+xyO4sju64Gbv2QO7g=;
 b=VaevSgv/LCfj8htExiNzV1BepTKya10rU+zq9ACN+Pyb6pp8IBNPhtcJ8JOcOEV+SfHqYYvNHNXPQhgdu6AwuGdoWwulPS4eNqu5DY3Qkzy2no4oYjZBMC7BYZNvf+mCm0Bd5vLEiF/4fD9uzk5UhPtgM3rWMjP+H6gAJJj0KBI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <jbeulich@suse.com>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jgross@suse.com>, <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH] tools/libxl: Make gentypes.py compatible with older Python
Date: Thu, 16 Oct 2025 22:06:13 -0400
Message-ID: <20251017020613.79855-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <81c56c9c-882e-4433-b41a-6952315efa25@suse.com>
References: <81c56c9c-882e-4433-b41a-6952315efa25@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|DS0PR12MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc39fec-efe6-4bd7-0c41-08de0d21c0e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fIxncNScOHVW0Xa7KBWRbn7xRa6zIAgzDg2XXB1Eb+EvFPRzxMyFVXv3oAnw?=
 =?us-ascii?Q?zTeOC05yWt/VeS2/x3t4Q3WP848WibodY2s78u1Cy7+t6/1j3x8q+5r3hU2H?=
 =?us-ascii?Q?lDJ7P36dnmgNupjC/bbQtGVBmRKLhFhZ6+cFdDHIbeeJ4Dikm8JUBemwxoI8?=
 =?us-ascii?Q?uTMqDAIeIgtXnJMPxMt802lU+m7miL09O8WAw2DWtypOs2VtL/40OhB8nKAH?=
 =?us-ascii?Q?4ppJWG/EOp5HcDrccigqz+4LgUi0v26OP1HX40BTrBZdlfSa9wkLeH5MIKvR?=
 =?us-ascii?Q?KM6YppqYeQNqkjmnC0yvVv0ziIu9O5F9UOARkOToqGLvRghMvKmjzDjytJkb?=
 =?us-ascii?Q?ei/3eoacj+r2ouztsJgotctrqKMfYkjliMYm+qK7ipyMgzwN42qGXr3zwyLc?=
 =?us-ascii?Q?eG/GBjfaSY3xn8h0eFg55jkcJxo2TeYlX4njNgt2QaJykvHVAlFPdnMFQmfe?=
 =?us-ascii?Q?RMLhxqjW3wwwbmLkoS89/h7d2nVFPym/u+1dScJ+fQ+ZcuC7KUiQbefQlgnA?=
 =?us-ascii?Q?y8DGAJN6IKJ4rwBiamGlifJxWPY3s3kZY6K0PP4eFGSwEWGug6ANWj+Ltby5?=
 =?us-ascii?Q?gwrEi2Ix/e2tAVd3HpKJy7vqEh+vbrnsc64chB56wulze8y6Xrjj0fZ9NNhC?=
 =?us-ascii?Q?MH7NenXdLHwaSewT9/SD3Ifr57DwYYlZBCR9ML0yJ6cMmfNdd/no/KY5KMlF?=
 =?us-ascii?Q?ZLR68ETZNZ+xETdpvD1EokwjSc8vyXNWfB00pIWmwXtUxGvghkYOC50R7/Et?=
 =?us-ascii?Q?o7eIyYjlnU/9lPtm4fTbp7y5a8PKhKjqYNbg1DbKoScRNfsX5+viSpfNHVL4?=
 =?us-ascii?Q?/2/gq8lP2R/p25Phx5LSNnJJcPSAfKvaAVIQ2t7P/u1FP7htqoRV4pmJUnMv?=
 =?us-ascii?Q?j86nEhU5/3nVYm6XJ/rXdxN+y15IbhSoopkXFdyQZSNB16RGyfCXCnsJpEQV?=
 =?us-ascii?Q?CfFldOJ/8STOcq3E3sa+BY02F3GbwO0Xyn5SSa1vKyTnza8CEdV9YEdrErOF?=
 =?us-ascii?Q?v5g1Awyw1sgRENpZfy/ygpYD6acas4wrfxB8ec4LvhF1Ha53sbGaLe+/9uli?=
 =?us-ascii?Q?TCA9qDsmMKtWivVXosxHjmxHJMd8WHkdpKiaAoydn3OpBGTK+eIh6MsFfnpG?=
 =?us-ascii?Q?o7ZYLMzm4I0/jSYWg2Sjm3Ep2ie4gWZEizKCuMIohGlntYdHiczqIJ040ZL0?=
 =?us-ascii?Q?63aAm6tp4Sg5gbPh+bLr1xoSWX2veIQ8O6EWQRtei9zS2RrvfxOLE3rAeaGC?=
 =?us-ascii?Q?8MF1U3luY/pSzLY90bY68cNBOYW+IjPb5G9vteqXiVY2K9459iOD0bGeVz6j?=
 =?us-ascii?Q?n8DaocGYaTm/uy03nMjEs/1TnIjwqF9H6qWCZ54u7r9NrKHJkNuUPHKTwC1X?=
 =?us-ascii?Q?yIVDbQhOxIiIdvCRxwWsMOnIP3xyIGo5S83Cz71de2Y0JXdWMLFQmkO1HDwV?=
 =?us-ascii?Q?P2H7Py/1oQRzDlBClbLCwivKCuj7pP5l3p29Y6ZS/qYsjqeN2KGV1c5AXijl?=
 =?us-ascii?Q?2ge5OhrSEdV4ZN4TUB/BbvL2F/myOQ85WjIRhsOBxILzr7cKXtNklaWB/h4z?=
 =?us-ascii?Q?fMGd9/TERsAosuML0f4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 02:06:15.3369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc39fec-efe6-4bd7-0c41-08de0d21c0e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7993

removeprefix is only added in Python 3.9.

Instead of the prefix removal, switch to passing in a "depth" parameter,
and incrementing it for each level.

There is a slight change in the generated _libxl_types.c.  instances of
KeyedUnion increment depth without outputing any code.  The net result
is some cases where jso_sub_1 is followed by jso_sub_3.  As an example:

_libxl_types.c
_libxl_types.c
@@ -5535,12 +5535,12 @@
                 if (!jso_sub_1)
                     goto out;
                 if (!libxl__string_is_default(&p->u.pty.path)) {
-                    json_object *jso_sub_2 = NULL;
-                    rc = libxl__string_gen_jso(&jso_sub_2, p->u.pty.path);
+                    json_object *jso_sub_3 = NULL;
+                    rc = libxl__string_gen_jso(&jso_sub_3, p->u.pty.path);
                     if (rc)
                         goto out;
-                    if (json_object_object_add(jso_sub_1, "path", jso_sub_2)) {
-                        json_object_put(jso_sub_2);
+                    if (json_object_object_add(jso_sub_1, "path", jso_sub_3)) {
+                        json_object_put(jso_sub_3);
                         goto out;
                     }
                 }

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Here's an alternative approach to workaround removeprefix.

 tools/libs/light/gentypes.py | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/libs/light/gentypes.py b/tools/libs/light/gentypes.py
index 006bea170a..0e45c04f49 100644
--- a/tools/libs/light/gentypes.py
+++ b/tools/libs/light/gentypes.py
@@ -377,15 +377,16 @@ def get_default_expr(f, nparent, fexpr):
     return "%s" % fexpr
 
 # For json-c gen_json functions
-def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "jso"):
+def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "jso", depth = 0):
     s = ""
     if parent is None:
         s += "json_object *jso;\n"
         s += "int rc;\n"
-        sub_scope_object = "jso_sub_1"
+        depth = 1
     else:
-        sub_scope_object = "jso_sub_%d" % (1+int(scope_object.removeprefix("jso_sub_")))
+        depth += 1
 
+    sub_scope_object = "jso_sub_%d" % depth
     if isinstance(ty, idl.Array):
         if parent is None:
             raise Exception("Array type must have a parent")
@@ -398,7 +399,8 @@ def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "
         s += "        json_object *%s;\n" % (sub_scope_object)
         # remove some indent, it's over indented at least in one case libxl_vcpu_sched_params_gen_json
         s += libxl_C_type_gen_jso(ty.elem_type, v+"[i]",
-                                   indent + "    ", parent, sub_scope_object)
+                                  indent + "    ", parent, sub_scope_object,
+                                  depth)
         s += "        if (json_object_array_add(%s, %s)) {\n" % (scope_object, sub_scope_object)
         s += "            json_object_put(%s);\n" % (sub_scope_object)
         s += "            goto out;\n"
@@ -417,7 +419,7 @@ def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "
             (nparent,fexpr) = ty.member(v, f, parent is None)
             s += "case %s:\n" % f.enumname
             if f.type is not None:
-                s += libxl_C_type_gen_jso(f.type, fexpr, indent + "    ", nparent, scope_object)
+                s += libxl_C_type_gen_jso(f.type, fexpr, indent + "    ", nparent, scope_object, depth)
             else:
                 s += "    %s = json_object_new_object();\n" % (scope_object)
                 s += "    if (!%s)\n" % (scope_object)
@@ -433,7 +435,7 @@ def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "
             default_expr = get_default_expr(f, nparent, fexpr)
             s += "if (%s) {\n" % default_expr
             s += "    json_object *%s = NULL;\n" % (sub_scope_object)
-            s += libxl_C_type_gen_jso(f.type, fexpr, "    ", nparent, sub_scope_object)
+            s += libxl_C_type_gen_jso(f.type, fexpr, "    ", nparent, sub_scope_object, depth)
             s += libxl_C_type_gen_jso_map_key(f, nparent, "    ", scope_object, sub_scope_object)
 
             s += "}\n"
-- 
2.51.0


