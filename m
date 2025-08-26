Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DE1B35086
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 02:55:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093760.1449181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqhyI-0001Av-Nd; Tue, 26 Aug 2025 00:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093760.1449181; Tue, 26 Aug 2025 00:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqhyI-00018g-KY; Tue, 26 Aug 2025 00:55:34 +0000
Received: by outflank-mailman (input) for mailman id 1093760;
 Tue, 26 Aug 2025 00:55:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etY1=3G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uqhyG-0000hD-Ot
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 00:55:32 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20630.outbound.protection.outlook.com
 [2a01:111:f403:240a::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c29db93-8217-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 02:55:30 +0200 (CEST)
Received: from SJ0PR03CA0215.namprd03.prod.outlook.com (2603:10b6:a03:39f::10)
 by IA4PR12MB9833.namprd12.prod.outlook.com (2603:10b6:208:55b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 00:55:26 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::3) by SJ0PR03CA0215.outlook.office365.com
 (2603:10b6:a03:39f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.22 via Frontend Transport; Tue,
 26 Aug 2025 00:55:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 00:55:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 19:55:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 19:55:24 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Aug 2025 19:55:24 -0500
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
X-Inumbo-ID: 5c29db93-8217-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZodWxUddWnEIx7z0b2zX7txpHzAoO3EqhGsUZxTcI4Ago8/T0fGkPFSWbvQ/daYjT6vNi0t9h+ktuWo3r+0okaan42V2JV7ku8i/RZpCUnkphTR/hWGxJUzYJSmAM4sShXkwBcLIKW9UvbvsygoViF/IK1GeuZoP5K7IYMKg0HoIPWuJPGqwIV22In7slGSKum6Uq+LBI9rNSx7xcGjikIjoabZoaVOmfpnFe3QVkG6dzBcyCpZgXuIul7WxkJhVE3hs4ZRqDP8eBMByI4O97OMylqVeH7uUb3WcC8wu4/6m0L1xfoXV8F5a/r0ekZZTaUolo41EsYGVnj4PlEm3qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/m+tvcvgsOF/8B6DaahRF/VzF29+Oz9jjZk9+yNmhNg=;
 b=KpL5/56cglfcEMtkYk1tDkbc5fx+xj5j7qOokdW+ISey/i2z6iNjYGXekq5z8XklkuK1pZrV62sKohX4t2Ec+V1Ed6TP0eJyzddYrMpLq6IcBNVardGIB5Fd5C9tCwCukYSx1XB8e6skjlSuewKKnpfKBJq9ldX7AhuZ08KlgjPW0DbDzusNCuhhX87Wnv1Zk+JBAIRtTmcDrqrFAD58TFizPiFzT4EaV6DB/N2vGr7qieakFuxzNZsVhBPGwQ6vD9MUGHBS/zyk3AE0JGBOtrRMoZxx0s30CgMAic2kkMaEkRF4YtziJoFLnfFjEeUcQpg9JRZcHQxlMheARpp1rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/m+tvcvgsOF/8B6DaahRF/VzF29+Oz9jjZk9+yNmhNg=;
 b=cWnVB2CJbAxzZ8nZrBZ5l8xLsXoWHAz2rfJa1RRNDtxAbpQy5D5abNbxjI9pODFHAyOAIwt9zPTawaxfqKddjSyUZ5YxC2VZqTneVJAm5HiB5W+re1L5JWj1vPv+7879/qMfK2lxOnWDFqV88wwWnH8moNBC/FuollcHg+c6R1k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] xen/events: Return -EEXIST for bound VIRQs
Date: Mon, 25 Aug 2025 20:55:14 -0400
Message-ID: <20250826005517.41547-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826005517.41547-1-jason.andryuk@amd.com>
References: <20250826005517.41547-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|IA4PR12MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa155ba-1ebd-4105-3e60-08dde43b3e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?38iIKXpC09JDHX0ZCkjhkR5vmjROByzF0lghqWR76d1yl06m3Q9OvfdoAHlY?=
 =?us-ascii?Q?g6cWPPb0Z53AsLFQL2XtRM0Bk8znD121cSil6utMwfaoMiLOksLd21UG+tTn?=
 =?us-ascii?Q?OFBRVT/8gEUDjuO6LZbATX76FKPGHpazWzqaY4jgQv4kcwHaMbJGSbRAA/nx?=
 =?us-ascii?Q?qd/YndzXKVQdq4hRiQIgJUNVN21ITftwq0+qHel8qklJ/PwNivwYJ0mwuHKm?=
 =?us-ascii?Q?iaznGYj86E817Fu7NPMMiO0Y0aVj/+HV1QHf8fuTX0ySAKxD8dGUWsjY1555?=
 =?us-ascii?Q?bs+88DCcAuhhxKLiu7D9ifVfDMdc2YXm4r0h8e6bspy4bJHyYJEJ2RttX0WR?=
 =?us-ascii?Q?uu0YLvwZKG1ZA9qmmtIez/ZBzMNOOtRpze4i98pyDaZ5ADZwYpVpVN6pd8aj?=
 =?us-ascii?Q?hPzFjh0ZGmGCTVtypxQkUnlqM1B/fJjaj6LlK580zlsfuRWDhNfmTiuCLD7D?=
 =?us-ascii?Q?TcVDb7LMrCg+L2AbaE9dUFaJmy/nmamrBKLTux+tv7kr2I48v9NQZt3Tp7PE?=
 =?us-ascii?Q?Pqy6hvADm7dqAx7Li9B9GmFCKMKlE631PqbIfUzISOYicMg/Mum5+2m56nR7?=
 =?us-ascii?Q?mlQr7TaxglPOos70MgleUOQGNRSHxuEM+Ow2S6mOAYOuX4uAOo0WTrKUUIYr?=
 =?us-ascii?Q?5kggSyzz8aMrdCp4MuZLYfTPV6wbCt7/2o7Ua0vT8vQyNboV1Up9ax738heU?=
 =?us-ascii?Q?EFnSTm5/xNWlXQZPnuZHEk4pbTcXEYULtIYkZKvi9Pm6AU2HBLa6GAHdTq+a?=
 =?us-ascii?Q?3Kq/Bo8MliqmTbVK9ZUsUiRoYj/Q3Gv8FyQ0g0NNRExBE3HAKeLOP5Aif6uS?=
 =?us-ascii?Q?XV6lngP68qRtXZyP0qwTdX4eW8haV474lRqfziQO4w79VT0dc38KbmHhDu5X?=
 =?us-ascii?Q?ZuejFaDjJ+bshgpENSzKPdLmdfeNF+VNDUhFsy0hZRT6e6cPnpBSr34pipyD?=
 =?us-ascii?Q?Y9YrQfrFiW4r7EHRgWcTWtMJSS0nIEPa6nsWx+wvaVkNZxc9okBjCeD+DMYt?=
 =?us-ascii?Q?o0b0ZOiDl/k0JEGSqnn2XaBc728eHOeJpxph+EBVn3cdpWd9Zu6eTu3rwgmF?=
 =?us-ascii?Q?84cwtmv/WzPlMskIriDJ9DmDW2V4uPhjVotM7ecde80AYBsj8XnkjODqGcDb?=
 =?us-ascii?Q?HcVoq1D5nqdW4U/pnC0HBMFeUSKcLwyduZfHGiLmdi+ZQn3CcyYdLwYytxTf?=
 =?us-ascii?Q?1CKTNnjMikLO/PcaOEHXtPVcR3P0ldQysvfcJ0b54ad9m8LgtUB/oGzqGjBP?=
 =?us-ascii?Q?KTANBOZmCKtXDQYIKOmCOt13BbTIEDAu3Ta9r9iaL6a6RkZicgQbtr/acdD3?=
 =?us-ascii?Q?lw1RFiZK16Sj0EJAjcg37060u/pNtA5o6KELAGwI2RKjk3v9l9wqggdXUm2z?=
 =?us-ascii?Q?Dz6eQHXZjJcVjlKBEYkYSy+8fmyFvsxumXRF8YUUywIt8Wwf6OWhh0wov2uZ?=
 =?us-ascii?Q?Zm/i/lEmTSfhrUOa0PA2Nv6LgW5YOIOfvE+v05gOPpsJCaxL96q3uy38zRKI?=
 =?us-ascii?Q?iotoGf/ok8Pls7TfuVw5EGUB2kn2xLpNkfAW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 00:55:25.5614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa155ba-1ebd-4105-3e60-08dde43b3e57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9833

Change find_virq() to return -EEXIST when a VIRQ is bound to a
different CPU than the one passed in.  With that, remove the BUG_ON()
from bind_virq_to_irq() to propogate the error upwards.

Some VIRQs are per-cpu, but others are per-domain or global.  Those must
be bound to CPU0 and can then migrate elsewhere.  The lookup for
per-domain and global will probably fail when migrated off CPU 0,
especially when the current CPU is tracked.  This now returns -EEXIST
instead of BUG_ON().

A second call to bind a per-domain or global VIRQ is not expected, but
make it non-fatal to avoid trying to look up the irq, since we don't
know which per_cpu(virq_to_irq) it will be in.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
V2:
New
---
 drivers/xen/events/events_base.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 199afe59f357..a85bc43f4344 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1314,10 +1314,12 @@ int bind_interdomain_evtchn_to_irq_lateeoi(struct xenbus_device *dev,
 }
 EXPORT_SYMBOL_GPL(bind_interdomain_evtchn_to_irq_lateeoi);
 
-static int find_virq(unsigned int virq, unsigned int cpu, evtchn_port_t *evtchn)
+static int find_virq(unsigned int virq, unsigned int cpu, evtchn_port_t *evtchn,
+		     bool percpu)
 {
 	struct evtchn_status status;
 	evtchn_port_t port;
+	bool exists = false;
 	int rc;
 
 	memset(&status, 0, sizeof(status));
@@ -1329,12 +1331,16 @@ static int find_virq(unsigned int virq, unsigned int cpu, evtchn_port_t *evtchn)
 			continue;
 		if (status.status != EVTCHNSTAT_virq)
 			continue;
-		if (status.u.virq == virq && status.vcpu == xen_vcpu_nr(cpu)) {
+		if (status.u.virq != virq)
+			continue;
+		if (status.vcpu == xen_vcpu_nr(cpu)) {
 			*evtchn = port;
 			return 0;
+		} else if (!percpu) {
+			exists = true;
 		}
 	}
-	return -ENOENT;
+	return exists ? -EEXIST : -ENOENT;
 }
 
 /**
@@ -1381,8 +1387,9 @@ int bind_virq_to_irq(unsigned int virq, unsigned int cpu, bool percpu)
 			evtchn = bind_virq.port;
 		else {
 			if (ret == -EEXIST)
-				ret = find_virq(virq, cpu, &evtchn);
-			BUG_ON(ret < 0);
+				ret = find_virq(virq, cpu, &evtchn, percpu);
+			if (ret)
+				goto out;
 		}
 
 		ret = xen_irq_info_virq_setup(info, cpu, evtchn, virq);
-- 
2.50.1


