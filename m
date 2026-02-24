Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IMyAocVnWkGMwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 04:05:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712F418144F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 04:05:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239410.1540820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuijp-0003Sp-Ax; Tue, 24 Feb 2026 03:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239410.1540820; Tue, 24 Feb 2026 03:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuijp-0003Q2-7O; Tue, 24 Feb 2026 03:05:29 +0000
Received: by outflank-mailman (input) for mailman id 1239410;
 Tue, 24 Feb 2026 03:05:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmFV=A4=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vuijo-0003Pw-DR
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 03:05:28 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa3b689b-112d-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 04:05:25 +0100 (CET)
Received: from SA1P222CA0069.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::29)
 by CH2PR12MB9542.namprd12.prod.outlook.com (2603:10b6:610:27d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 03:05:21 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:2c1:cafe::97) by SA1P222CA0069.outlook.office365.com
 (2603:10b6:806:2c1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 03:05:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 03:05:20 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 21:05:19 -0600
Received: from ubuntu (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Mon, 23
 Feb 2026 21:05:19 -0600
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
X-Inumbo-ID: aa3b689b-112d-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrKocwPgNOjSINh/R5GWrr5tVCG5dCQXmzJdlclzeEKg/JDPBpvoo/nlFqGOUZG7g+KpOH1w9cxIYSMhMTLSSPRi+jp6c7oSRQfHgSm6uUvqFQCLovnqo6fIA4/YLGATDi64bxSINxkseR0N8oTk4Frjyeci1rx/ZLYWFkI1Pw0IkMGJevFqZwL1ilzIXEeG2dJ1b7jTnd6dmz6wCxmyokL/qBgQXYSLJY4wip2HhqTZ+mbeZgodyKt+6UVOMJyuRG1B/X+NBXApVy5czZg+NplHFcbeS+rnNKjS1onJUTN/RW1T0h0PT8iP4YDujd/WTut+DFLUnnVAYhJLhN0r7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqKURGGCLOhSOOZZLDdqmhevzpWzHw0X6/XVJSMdc0A=;
 b=GQdQD1JEupm0FUAVH1C5za/jcETGcu/n17DaQTZhvDuSq1j2rdAjjY5jEBhU5XNfzCHXMX2LuKcPeQdmowxN34/+7emFKOZpN70oLOPmWuRewMi5LjrFGQ2c/mKiXCA82+BRPma3RaSPNIy8Ob36f2Hef1d5PZwUSqLPzB6GnTUqb4tQfLXdxhkdH9k0CIzd452UiOAfNITJZVllgPADgesiYOBpvOblWB+n5UBRfzxA4BTIC+V9+GXMUMuz34gdYIx57D0pFNllu3oElJUjw3qPCxjIjNoD4bYjVEmK0JEjLDDpmUvY0yIVMx2Owk/jG/QpsXQy26KCyClZLhH5ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqKURGGCLOhSOOZZLDdqmhevzpWzHw0X6/XVJSMdc0A=;
 b=1pUHtnvZ3bAAnQbaQUwH4ivsCWyMDNxQO/v4gBaB7c3P0hFPpUtkrnSiPyseB9EqiIIIf5ra5po659ItXJpSVlZlyyrxt7HfCpxWg+SyTLYZV+ahBMQE/8a7W/S3Md1ED6HRIIawzgAnvTBrp+Km+WicWqv8hb0GwfwSJVdezqk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] vpci/msix: fix typo
Date: Mon, 23 Feb 2026 22:05:15 -0500
Message-ID: <20260224030519.27104-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|CH2PR12MB9542:EE_
X-MS-Office365-Filtering-Correlation-Id: 6218ed41-a955-4d97-9f5e-08de73518b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p6aUqkayEUWXuFMhSUbFZtc/lpQdtJWrprFXNbninND8FYomh74osJ2B2CCF?=
 =?us-ascii?Q?LXO5dnpuhhS1Udc9pg8Kq8W/V3XsG+9Sr1RSmlbEm+4PfWLrmOUqNAfRfRNm?=
 =?us-ascii?Q?EPYN7imPp9BmnpFZAdl54/ZIViYIOg+/J7LIDF+1Eh64UvcH2PMSWo3cCnri?=
 =?us-ascii?Q?yr+lTN56Ju9hBvZwHN/jblwPMQmURSAE2hazxgSHyl9WECAWVDPcwa/ZDzwO?=
 =?us-ascii?Q?IwbGtPY5HsaNyyLji87rdSsLl2A0GLggLi4lp6GUMT/tR7wv1eWchyivxO4z?=
 =?us-ascii?Q?e0aqiKp7sHn1tWw/Z6Q5c1hnwogKwBecC3+VpABUgwvIjkAlzyl7IqiDcHDz?=
 =?us-ascii?Q?Go6C4QIQ3RgTMcFG1x3H6G1/c1exAARF4PkFgE3KNAjWI+Ukm360Y4J4xQVr?=
 =?us-ascii?Q?Uf7pbkKOEP4tz5gu/cweyax8yZEhjW48BaEHEQdkkCEyu6MnCaKn8iH6ldGa?=
 =?us-ascii?Q?HKz8qJVg7WBRwGs9mQ8PTkyt24IFvyFcRRkFRbmYw8aHQmJbIM0gIZxY/yhm?=
 =?us-ascii?Q?CunRk4PbcAwdr2RopomLVMkBlUpQoTZ88D5EBpbQ36Bd5S9UtcVYnZfiZrWK?=
 =?us-ascii?Q?Td1d+HOwo7ImnAJ71xGtH4hAxrcHXyYgpWK5E2t8nfvMUzCdR+rAy4gLoXSD?=
 =?us-ascii?Q?2vR9U9DdFOz1SwiPK3kdtvzIH2AqlnENI1pkxeXLymAfizPPkHvNF1VdWMnl?=
 =?us-ascii?Q?VG5XPprtVHAy+/SR14qqCn7Fmbtx2TBPj6gE9zOnKpBabgKNCbZ8kp0lLwTr?=
 =?us-ascii?Q?Xerojh+WxOBLenqeM/a6mQBWqPXhzNP1RmrrfC+fCnxVdxck7gQvGtarUGH8?=
 =?us-ascii?Q?1Z/eQQPvjpn9p19DQUCmRTL3b1AzlP9xbmAvNL+ls+TFjfxreu+nU1mgMOYL?=
 =?us-ascii?Q?J7u7vuRUXAkDb1Ef5Vqvbr1eAy6/gY9UmT5iwqbV4KMycM8HbzpDksL0ogPW?=
 =?us-ascii?Q?DBqhhzgWj92/Shpkg5utaBmEFw0qAZC7djdChSPqMiixEuaqm8b1L2jRSXqB?=
 =?us-ascii?Q?4zrnig68o3WMEtZp7YDjORKHB1QAOVJ6gd84mCnN80kUlD6HsuC3JOb2MW5j?=
 =?us-ascii?Q?s8EyL9fraGV/ctIrC9uZ3LTpa4zgGime5bgwJ3kRwI2aeAkPcySHOAnEeeeS?=
 =?us-ascii?Q?3O67gbOwDNpXsXOBoMuceqJ+D2ynSVGoJXd0qqjU0IVH/lFLv58jIGb2R0Qw?=
 =?us-ascii?Q?3WjtT/nufYN2E8dVXWiFBidb74jXdkzMtgeg2PpJMOxWKXH/60v1/tZq+5Jq?=
 =?us-ascii?Q?FgxyEVUKWNScx+YWZ0nsIKyLfxamSd/WEASQtc846ft71fIHHPpG5Ueyfd+c?=
 =?us-ascii?Q?Kq3DHTDocP0QJIZMfjxD516DDkVcC2wwDiqljOGzW0MF18W/MLqSJop6+HAi?=
 =?us-ascii?Q?6+HqrZTSGRcrDda/ilq5jShr2Rx01iFZgyrI1rsSDfkSaRZN1x9Ultn+AYAU?=
 =?us-ascii?Q?y8TiCDQrMGVNo46+3OSZEbaXUdALYJgk6AjpJ626inPxANRFIyj8CwfdpDsk?=
 =?us-ascii?Q?uZPavjl20gWneiMNtbYcb+uWcpjZNnRUpWKtdu1hprwck3JsDxzoPPafXjdW?=
 =?us-ascii?Q?mfQHa5E0p4MSMHTSSHyGUO/8ZZ/etlD0IityKoHtRMWS7vNhy/1ah8Po0yut?=
 =?us-ascii?Q?1a2p16tMTi1kVzT6t6RejlcVJIOhxaW9Jp+9yxFeR3tR6j3oM7mMaUPvVZlo?=
 =?us-ascii?Q?XEU+Ng=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kKRe8VYD3mszEvpbq9zFBu6dIyCGZ7HDhenuPFb+Z2LXcCOBEngGqfFlg9tbAeejQj4fV9DZYJfSm/r2wSIr4rkCN/YbtNWTGD/N0mK+YLKHSthUmogIAMsrS368HYtw99xh31EASlS75XmbQvGL5EH1P0Im1qxudb6AOyyfqRNSJSc+pXWspTHaCupustpRrhGYucZ1OMfn6OYVa6HjWWue4+sscQEK6Wzrr5JWRWkqTsqNOx4HPM6JkoDnntte+8KmVGHEYexpMh/5OmHCR2K6GZ7eKiHLxfXaM6s2+Ibi1SwnGEdfOPZD2mJAkcZA51XwtWVwZaxMhSWo1i7VFC9O/Z4sz3IKhipbjFrGg3LqFIpEh4her1HAKECuo19K1Wdb1kR+U+gnfcjO+3q+bq1v6R4vgOT7gxltrwbYTxH0CvS8Q/oSFl/IcvYLkQWw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 03:05:20.2752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6218ed41-a955-4d97-9f5e-08de73518b84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9542
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 712F418144F
X-Rspamd-Action: no action

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/drivers/vpci/msix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 516282205a53..eaf8fae970f8 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -795,7 +795,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
 
     /*
      * vPCI header initialization will have mapped the whole BAR into the
-     * p2m, as MSI-X capability was not yet initialized.  Crave a hole for
+     * p2m, as MSI-X capability was not yet initialized.  Carve a hole for
      * the MSI-X table here, so that Xen can trap accesses.
      */
     return vpci_make_msix_hole(pdev);

base-commit: 5eb84d6c992cf4e81936872c441b649057947442
-- 
2.53.0


