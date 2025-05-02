Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8996EAA7D27
	for <lists+xen-devel@lfdr.de>; Sat,  3 May 2025 01:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975166.1362823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAzw2-0004Lr-5d; Fri, 02 May 2025 23:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975166.1362823; Fri, 02 May 2025 23:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAzw2-0004JH-2l; Fri, 02 May 2025 23:36:50 +0000
Received: by outflank-mailman (input) for mailman id 975166;
 Fri, 02 May 2025 23:36:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3DVg=XS=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uAzw0-0004Ip-0D
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 23:36:48 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2009::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a1f2335-27ae-11f0-9eb4-5ba50f476ded;
 Sat, 03 May 2025 01:36:38 +0200 (CEST)
Received: from BYAPR07CA0078.namprd07.prod.outlook.com (2603:10b6:a03:12b::19)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Fri, 2 May
 2025 23:36:31 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:12b:cafe::60) by BYAPR07CA0078.outlook.office365.com
 (2603:10b6:a03:12b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.24 via Frontend Transport; Fri,
 2 May 2025 23:36:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 23:36:30 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 18:36:29 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 May
 2025 18:36:29 -0500
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 2 May 2025 18:36:28 -0500
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
X-Inumbo-ID: 4a1f2335-27ae-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPMME8bWtV4NQgCxx7X0TEKnn2MM0PB7EInuyu1qXHin5Ss39Q5PCQlksepmpYzEHHDVumI5THRoWLwewzalPfQH+4h/E5ZVUvFA/1gu6YduqixJvH0THz+vOdUZcBEkGx5M8IpAdlQL0178jDgHC6NuMC3/c+rDkH3/nAFCrpHu/1XDg47cPmRDLB9A65kKOlD79QunNyP8UcJbGk87AMEobGJslUyLQ04TobTFaNCFSLD9V1uc1o5NUMP/OOA6IANj7lT+p9eG+blFeOMlw4ogK622mrKcGRztSV8vasLo2dL3HWQR/ywkmGfsB9VeG6n9Br5J/idq+JRQ2mtGvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebXre62h4E4lEtLtAl/1GAQOY4fnih00pEn1pTR/SJo=;
 b=qZ698n0XnmfORsZXKXg3Z0I2RywnBKkv2n3u0A3dsPnY6lMqIwo16EFJT0Ta532VjzhV1s7kDZQZUilcH9ADliBpYtJK4j9ZBWoI+Q+RAfUp69Unxsj6CWnujIY1UOs9yn33ScO0VTUU9hqAm7CRiWtzMO2KXWnBsUhCOYwcaU5BTiDVzCPPWA8K6f4zi/JXfyraztyQ0DdwVllYwqdFpOV6BzGVTZCpI4nGWfC6laLDFdyPxmiO9TxNy+GENz9NO08A8Jpgswm04WYNLdV7UnXoJIqh5bdA64sRu6SgYdspdXQjCi/HrRQgj6GLdgCqCurL6NFTscEPPlb1TacRQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebXre62h4E4lEtLtAl/1GAQOY4fnih00pEn1pTR/SJo=;
 b=bJ5uMZrLmmv0SxFGJPyxqL6CX3Nx5yYZUNuOMNUhme7AoJ7Hm2tn13jMkIKosCHjxM83I7Sdkl7AbOYxtcCMiiolbjfVplnpRWOQFnDLIkJf+VYVVpQl4geveeSdTMjc0iU+yOUWo+Iln6m0W32apiBB1VXP2G+43AxYNBwH6aM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Victor Lira <victorm.lira@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH v2 1/2] x86: x86_emulate: address violations of MISRA C Rule 19.1
Date: Fri, 2 May 2025 16:35:34 -0700
Message-ID: <20250502233535.3532279-1-victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d10714d-e92b-4cb8-4925-08dd89d22aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5SZFrjy7wseBRU5Y28Rt0+Lp/BeDRDx+Xpui1S+bfreTGssOoAn54irpAVJl?=
 =?us-ascii?Q?Ob685e6nC9RZkt77BrQSKIyNGuH86UPasBsbNTK5a14PY50qE18jG53updDe?=
 =?us-ascii?Q?LL8NoYrXMPm8x0aTJBYhPxv7a4u+oUZwSVz3lZ2mRNbYf59oRL9YFdFJGuQ4?=
 =?us-ascii?Q?4qxXYKUUL+eTSmQm1/jYQUlanLe58Q8LFP2hq8GyRztbjWGdTPjJoeHOpPdc?=
 =?us-ascii?Q?jkSC8NjDRTpsHT4sBY9pRRvO3cpF09wRbPkXK/1NXy/LgKaUuxXbozLszugh?=
 =?us-ascii?Q?3PwpQYcU63JjFdgyefzXJth0zrXk0ngB+KN1BEOD2dq/qMeXdeP7BayAzPnV?=
 =?us-ascii?Q?IPl0sU7tOYZy34EcOYN9atfb8sR58NG21KxSIBFtTl2t0ryMeecBynLISLJ3?=
 =?us-ascii?Q?SWfsQrkVOglFAwyubTep5NoM3ONuyVhCTuSsLScRx6y2dxS5dJqs0ZlOEk1W?=
 =?us-ascii?Q?vU/2I6FzkHggyfnOPSDKYciqfG3YY8Gt5gI7HEAXTA2rg9bFgOm/az2uvod+?=
 =?us-ascii?Q?rOc6VcLW66wk9zB6qrVlGDeigA3mP80tOu3U4u1hVfldLkW3alQxlGIi2Wwn?=
 =?us-ascii?Q?CP2F2Nvq12NkTuMoyO7vBhVX1AnWOj+IidUtJHf9v56EGs4fVYrSDqWlGiWo?=
 =?us-ascii?Q?BvCPUhFsnegVGPmYWFYo7K8ncWeCzX/FHj6S1+qEe2tFo1IsZoFN/etdtP0I?=
 =?us-ascii?Q?pVQ7a9XrZl/hbuFomh8ZNCeuQry8X0wxg1LNNxnKcwwyGxmLAP15CWx6dfw5?=
 =?us-ascii?Q?jgCgUAvuO8MDqI0Yp+ZWXojpoAQxT1L734idxVBoUVUNAJt9SFbxED9O4Toi?=
 =?us-ascii?Q?pZMtG0qi4a1GcUlr5/iyJGDldVsCN89XJxgHVs6gwm6PVSJGx2+XSGKPH+vD?=
 =?us-ascii?Q?nDmN0rnm3yRA2c1cJKmrxQ+IfC1kUhyCjK176/TSetIAV2qcyHt4MAIIRmSV?=
 =?us-ascii?Q?GwkyiPF6qysKrEEENb2PjMDWHEA7M04ImeJBNLoPYXW6WMOi9suDRQFe/bfI?=
 =?us-ascii?Q?kvk5hIplAvVQqtRArLLAh0ondyjBgrULI74cZ+FDMyBQTIK4YkAcAaan0qFo?=
 =?us-ascii?Q?tUFWv7Cn5S2DLW4/4ya+/d/wfiyWNQjIVyHaigzfoGTjQ48awzI2p9WAOOve?=
 =?us-ascii?Q?p7vBYN7/wPLYE80FCav22ql2GGyPAqMk6e5kMFpk9rJDDj8SlConP8Bs5xm/?=
 =?us-ascii?Q?8o2VjUIhIhDMsoPRM+liWyc5CmdbVF97oC1AUzg27G0mqudAARYojrKyZQQu?=
 =?us-ascii?Q?CbuVVLqkpNU+VpD69UD/IHD037xXCjeayUgaJsYqYYUmr5STNhqLm0Ty+BMF?=
 =?us-ascii?Q?ymhrFf6PFpnFLOmugHqDLbpagMelAc8wa7MPaqJHm2Xwt+fzyarbpbD2Sopf?=
 =?us-ascii?Q?Cm2b1dpCuT+CxdrjUVaaWryv2yqUD5gVfjzGWBgk3rmgXlVf53ngZwxPZts7?=
 =?us-ascii?Q?0BdF62EguyiT3TDIZtb/bS2tzjHXfD8satlosuyd6gK82EdqEw3NaTnKLvAW?=
 =?us-ascii?Q?xa5Xofm6HQoSUWlRpCmvjBBAJfXyJB4lpVW2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 23:36:30.6770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d10714d-e92b-4cb8-4925-08dd89d22aa7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726

From: Nicola Vetrini <nicola.vetrini@bugseng.com>=0D

Rule 19.1 states: "An object shall not be assigned or copied=0D
to an overlapping object". In the function like macro "get_rep_prefix",=0D
one member of a union is assigned the value of another member. Reading from=
 one=0D
member and writing to the other violates the rule, while not causing Undefi=
ned=0D
Behavior due to their relative sizes. Instead, use casts combined with exac=
tly=0D
overlapping accesses to address violations.=0D
=0D
No functional change.=0D
=0D
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>=0D
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>=0D
Signed-off-by: Victor Lira <victorm.lira@amd.com>=0D
---=0D
Changes in v2:=0D
- Use casts combined with exactly overlapping accesses to address=0D
  violations=0D
- fix commit message=0D
---=0D
Cc: Andrew Cooper <andrew.cooper3@citrix.com>=0D
Cc: Anthony PERARD <anthony.perard@vates.tech>=0D
Cc: Michal Orzel <michal.orzel@amd.com>=0D
Cc: Jan Beulich <jbeulich@suse.com>=0D
Cc: Julien Grall <julien@xen.org>=0D
Cc: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=0D
Cc: Stefano Stabellini <sstabellini@kernel.org>=0D
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>=0D
Cc: Federico Serafini <federico.serafini@bugseng.com>=0D
Cc: Bertrand Marquis <bertrand.marquis@arm.com>=0D
---=0D
 xen/arch/x86/x86_emulate/x86_emulate.c | 6 +++---=0D
 1 file changed, 3 insertions(+), 3 deletions(-)=0D
=0D
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emul=
ate/x86_emulate.c=0D
index 8e14ebb35b..d678855238 100644=0D
--- a/xen/arch/x86/x86_emulate/x86_emulate.c=0D
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c=0D
@@ -527,8 +527,8 @@ static inline void put_loop_count(=0D
         if ( !amd_like(ctxt) && mode_64bit() && ad_bytes =3D=3D 4 )       =
  \=0D
         {                                                               \=
=0D
             _regs.r(cx) =3D 0;                                            =
\=0D
-            if ( extend_si ) _regs.r(si) =3D _regs.esi;                   =
\=0D
-            if ( extend_di ) _regs.r(di) =3D _regs.edi;                   =
\=0D
+            if ( extend_si ) _regs.r(si) =3D (uint32_t)_regs.r(si);       =
 \=0D
+            if ( extend_di ) _regs.r(di) =3D (uint32_t)_regs.r(di);       =
 \=0D
         }                                                               \=
=0D
         goto complete_insn;                                             \=
=0D
     }                                                                   \=
=0D
@@ -2029,7 +2029,7 @@ x86_emulate(=0D
         switch ( op_bytes )=0D
         {=0D
         case 2: _regs.ax =3D (int8_t)_regs.ax; break; /* cbw */=0D
-        case 4: _regs.r(ax) =3D (uint32_t)(int16_t)_regs.ax; break; /* cwd=
e */=0D
+        case 4: _regs.r(ax) =3D (uint32_t)(int16_t)_regs.r(ax); break; /* =
cwde */=0D
         case 8: _regs.r(ax) =3D (int32_t)_regs.r(ax); break; /* cdqe */=0D
         }=0D
         break;=0D
--=0D
2.25.1=0D

