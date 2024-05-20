Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 023508C99C5
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 10:22:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725863.1130168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8yHP-0006LU-T8; Mon, 20 May 2024 08:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725863.1130168; Mon, 20 May 2024 08:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8yHP-0006Iw-QD; Mon, 20 May 2024 08:21:59 +0000
Received: by outflank-mailman (input) for mailman id 725863;
 Mon, 20 May 2024 08:21:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jwTB=MX=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s8yHN-0006HY-Vl
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 08:21:58 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 052d786d-1682-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 10:21:57 +0200 (CEST)
Received: from CY8PR12CA0054.namprd12.prod.outlook.com (2603:10b6:930:4c::17)
 by CY8PR12MB7292.namprd12.prod.outlook.com (2603:10b6:930:53::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 08:21:54 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:930:4c:cafe::c) by CY8PR12CA0054.outlook.office365.com
 (2603:10b6:930:4c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 08:21:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 08:21:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 03:21:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 03:21:52 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 03:21:50 -0500
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
X-Inumbo-ID: 052d786d-1682-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KckXvErkpYY9uKTniKW7Mva3zDb5luNOrBf3gN4UuwaLqE089usYYWB3MtIwimbvCsE64yo/DqzL6azrzwYA0s3zREuzfVBmeBH2BDWZ8Ekr/s0INqNfKneAobTpDZfRHxOvC6/JBNaZpG/hW3kEYaI6Wmf46eqtlpJB/S9BF0Ev8XQO4b+JzBqjiWPdAZfkalbzA7ppExGU5W7kw6pyzjSknvCf8SGpLOoquOJabZif39LUsXE7sE4pxKbX3Cz6fbehsMWBExxXsQsiHI/qo3cSc0YrTJmCKnve54eoMnYm6gofDskoQoh9dQRLKtiWbdSEphIComVa6xjCtSYcsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbqrXnoQt1tDj70V69JT90VeEkTrc+nsLeY+/Ia23sc=;
 b=nvGt2SkNCGctfcdfTq5zn+GeK/cAQSL7UlURPCT2brL305KUGDQ0khMRjs8dHT2h1nRSZyUnuesdJGrnO3XdTBXK6tQczHSOQ/H/lz9lbttKVLNQGgFqPnZlZZgz3fGwZMIN8wyAeu+RWPXbkpKPMk02emw8jJmkL44ctjuiPYwYjPAQcZuFvKrucZpeKTRle7PiWYBlehSAZyDnQoEAYwLYPo3buV4x7UtSVFg9Y3tzgQXDfX54oGByEzM7gzPctkdapfA+2PGRuS1sEAnXonCc3lEcx5V6yORtz5fZlQNc3iE74TCzrI+Azh6O+GiZ7vQ7yjPRErPYlmWHuakJXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbqrXnoQt1tDj70V69JT90VeEkTrc+nsLeY+/Ia23sc=;
 b=3ehfNfV3HNWVRpMdQ4QoMOzpLOHDO3ExHaslwDfFQSPKRHx1GjXOwx+5fH0mVxgiRlsq6KSUO44CAG+07wlfAKH3HsDBx6FRZXIQzzlTAkga+6Ppz7WTEMwoKQMVUFSxgysbW+hptnr/8t46Da5qRrC9ZbYQTFNSHA5FETh4mEM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Anthony PERARD <anthony@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH] tools/golang: Add missing golang bindings for vlan
Date: Mon, 20 May 2024 16:21:45 +0800
Message-ID: <20240520082145.1571451-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|CY8PR12MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf4bfd3-2c01-4f76-ed01-08dc78a5e816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|82310400017|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GaTe1HXb79Vh//ZEBx2k7DGXtHENqlGOHhPsg7CldIJRFhmNwS7KOncVSTCQ?=
 =?us-ascii?Q?/o9cRntLb+qfIWPyiozKyxbChfdjVex6Czd+l2JQ8Z7kvvNUmi5B+90xzfqh?=
 =?us-ascii?Q?2S6aTn74BVrpWI+j8JzVjXMYXy0EmelA59XQwou6JhnxM8GNpG3SqTLAXtTk?=
 =?us-ascii?Q?iJqtGqPzHJlYMojL9sqJvffYczSOgCp5GmB+XGJcyW5fvXczhnDY1EgkrMvL?=
 =?us-ascii?Q?NFOfLuUl6ZZ5vjQQ8ZJ0QuLV3IfC0LXGwxPSRWu1jgmvPTKkyRRmNwi8BGY4?=
 =?us-ascii?Q?fvA/959ijXU5p78VxA6TqDv7bLMsHw7FV8xblpHDXyiliGZr6IKTXMj8SV1C?=
 =?us-ascii?Q?Tb+Xcwunht67AfDgG8Ag9LA/Pzf1ZSYn/y98sSNzF5LFopSIAMZeCNztDKmo?=
 =?us-ascii?Q?W1DZ6Lvu685+JA2C53t7IG/JhqJDL9nAjocsQaylRFl5J1vLWqsOmv86R9IV?=
 =?us-ascii?Q?HmH7JwvraZ95HdmuENz8elKJx5G3AGAhJCz+aa2etoFU3WiWlC8zqds3IvtF?=
 =?us-ascii?Q?G25c9MHrFH8GQukkg0y/Lb1seQNCKU2pCM4SGaEAokc0YXjP1LChpYe5E68y?=
 =?us-ascii?Q?SJRQJv5r0et5CNpFO8s9gfAGenmV07d4se5uDr8SSjibcpK3RHq+RoK+LHys?=
 =?us-ascii?Q?xkc3SzImvwKPlH4IFdOvXqp4cTxtpuxnlk/psrs3opXB4A+AjHy8FD4idBap?=
 =?us-ascii?Q?Nf4Hd0v8/FOiSQVChUZvTnoPvGYsgYZvoMZeyWeG6lcP6mMQuU+vm7P2vYak?=
 =?us-ascii?Q?12mqfQu4h+AS678R8iWVZBEFJCF5eARedczbJ062xINRTZLc4vqzXZ1UXGZ1?=
 =?us-ascii?Q?jJ3YoYxtbJs21sxL+POW+avXTP04f95zr1d37vVxsHgU7YkCkJk5en7//R4F?=
 =?us-ascii?Q?XnQPIEnOpDrJU33HVYD+9euf3jIvzIJ0gRdqO7tDLcQ2Xf6fxrsgbnacbSa2?=
 =?us-ascii?Q?fSDtcs9Uic2I7EeId3gANDYu33W6wFCfQ7v/KhQjkXuTFKqBD3CS1Sbn/M4+?=
 =?us-ascii?Q?BifAq6h8Y9EghXjDAQ7YZqeYCHm6DjmRhVHRH3ElFS7/zBPxP7REAJ+2sw6r?=
 =?us-ascii?Q?lIu96+twxEwJRL+k1j4I6zp2hD8lqIxrZAavQ2RN4s6KjbHV3FxU8DKwcK9o?=
 =?us-ascii?Q?A49rHl1OXHtaN8ZN+Jktstm47CImb7HIHAvri29THynrYlnO6pvSm89FuwYs?=
 =?us-ascii?Q?6rTtzLoLLVeFmJqjnVp2ZmGOmvVq0fyLqO3NR71yGUj8enFtuKWYZVpbL2VZ?=
 =?us-ascii?Q?cwqEgENMN1PZaTUkTrA7WTe/3MPI6wkmYqRBsLvtP9c1AIGtcXR8Zcd6xLdc?=
 =?us-ascii?Q?M9fcudN+kLhTHzeFKhWsP93keGF/JDt+2FPrnuGd9+YfVVuxq7byIx6eWnSN?=
 =?us-ascii?Q?XFHHvG8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400017)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 08:21:53.7583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf4bfd3-2c01-4f76-ed01-08dc78a5e816
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7292

It is noticed that commit:
3bc14e4fa4b9 ("tools/libs/light: Add vlan field to libxl_device_nic")
introduces a new "vlan" string field to libxl_device_nic. But the
golang bindings are missing. Add it in this patch.

Fixes: 3bc14e4fa4b9 ("tools/libs/light: Add vlan field to libxl_device_nic")
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
The code is automatically generated by:
```
./configure
make tools
```
---
 tools/golang/xenlight/helpers.gen.go | 3 +++
 tools/golang/xenlight/types.gen.go   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 78bdb08b15..b9cb5b33c7 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1963,6 +1963,7 @@ func (x *DeviceNic) fromC(xc *C.libxl_device_nic) error {
 x.BackendDomname = C.GoString(xc.backend_domname)
 x.Devid = Devid(xc.devid)
 x.Mtu = int(xc.mtu)
+x.Vlan = C.GoString(xc.vlan)
 x.Model = C.GoString(xc.model)
 if err := x.Mac.fromC(&xc.mac);err != nil {
 return fmt.Errorf("converting field Mac: %v", err)
@@ -2040,6 +2041,8 @@ if x.BackendDomname != "" {
 xc.backend_domname = C.CString(x.BackendDomname)}
 xc.devid = C.libxl_devid(x.Devid)
 xc.mtu = C.int(x.Mtu)
+if x.Vlan != "" {
+xc.vlan = C.CString(x.Vlan)}
 if x.Model != "" {
 xc.model = C.CString(x.Model)}
 if err := x.Mac.toC(&xc.mac); err != nil {
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index ccfe18019e..5b293755d7 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -756,6 +756,7 @@ BackendDomid Domid
 BackendDomname string
 Devid Devid
 Mtu int
+Vlan string
 Model string
 Mac Mac
 Ip string
-- 
2.34.1


