Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5iAkOuNMLGoxPAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 20:16:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B7167B962
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 20:16:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=B+JfpKpE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1336981.1598666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY6Py-0000QL-DH; Fri, 12 Jun 2026 18:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336981.1598666; Fri, 12 Jun 2026 18:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY6Py-0000NZ-AF; Fri, 12 Jun 2026 18:15:46 +0000
Received: by outflank-mailman (input) for mailman id 1336981;
 Fri, 12 Jun 2026 18:15:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <VictorM.Lira@amd.com>) id 1wY6Pw-0000NR-GO
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 18:15:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY6Pv-00AhET-Pl
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 20:15:43 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <VictorM.Lira@amd.com>)
 id 6a2c4cb3-2eae-0a2a0a5409dd-0a2a4503ca3c-30
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 20:15:43 +0200
Received: from [40.93.198.33]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <VictorM.Lira@amd.com>)
 id 6a2c4ccd-672d-0a2a45030019-285dc6219e61-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 20:15:43 +0200
Received: from BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::14)
 by PH0PR12MB7009.namprd12.prod.outlook.com (2603:10b6:510:21c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 18:15:38 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::50) by BY1P220CA0022.outlook.office365.com
 (2603:10b6:a03:5c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.15 via Frontend Transport; Fri,
 12 Jun 2026 18:15:38 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 18:15:38 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 12 Jun
 2026 13:15:37 -0500
Received: from [172.19.160.128] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Fri, 12 Jun 2026 13:15:37 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqbHGu50kT+d2nZGEJiRKLoYAoYs3S5ptYvtseKie1J9eUf7F7aynrwU2KS/ln8GeuoEF1xWmXB+wmFXkoDxriiJ3k8VqVwAuHlflkMLxsYQ0N/ZoZ/yDlcQcQnRsYRBsGJTq0okRevkgzjZZa6OqsZsHlX83crQ3HAW1crvX+QNHiGFS+7LVyxUWlvekD5bR8Kgcq9FHQWqbk3Elp91Y7b0DdsNNZ4mWIPGdXX844O1nxtd23j8800NjQ6tBHKvPDkjvGUT28dmLmob+0IETfsg7H5rwQKVezQQ56pCH8mDMy2PAxVCONrclWCJrkjNMGiwXzIvdg/k6PjvkIxirg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Z4MYsshMW/Vo+tYRDVIqLMswI2d6uTmS6FjGso4Tq8=;
 b=waIGH4c8BPjZkuYhub7s7hBwYLuD6sbfxXaI8m4D8CmPxPV+/aE+PvR5eK1KL2DVrnW/RdBkRzbqZR+UGbWgnoH0w3NMDyYvb6G1jIHJd3QYyoAs+xTIeV/mhTh/SXOcXeNyhRDvY5kIqI+l6PjUOrCFQlPXIFKPo0vCTU+CBEgWtdmxZ9q0WJuhu29W1j1gT3V6cH9jxPZ5r5fkTNR8rM/HJP9kCjamTKUtsgQ1Eg78snlqIe0xKmLvv8cK16FRO6FoJskWVvGBBV9zpfLZ9OtlPWN76MY8oLBm7UoMNW/qrG7hM5UUe3iVc+x8s1VmrmLgZJ2DTZ5v2tD9SAHU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z4MYsshMW/Vo+tYRDVIqLMswI2d6uTmS6FjGso4Tq8=;
 b=B+JfpKpE63S3Xy13Nwm8IwCarO/GNWw/E1gCi8fylAOuUh+W4rFBuIUwOpVXlZNzgJl2aBo+mKGv5zISwWPuuNgx9acOthVWuyyw6/HtXFMZWn7fi3At0NHbi2tvgOf/CPxcaIS1AadukHip3tbQ1FfS4CalFEwF5Su0yyUx+Sk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <38a4713d-71e6-4d64-8f04-cfbb970a10fd@amd.com>
Date: Fri, 12 Jun 2026 11:15:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] CI: Use more specific Xilinx runner tags
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Doug Goldstein
	<cardoe@cardoe.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20260612180341.3152136-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Lira, Victor M" <victorm.lira@amd.com>
In-Reply-To: <20260612180341.3152136-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|PH0PR12MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f45959f-9b46-43cf-32e9-08dec8ae9b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	sEkxXwQFpFHvkCuMSAOPuWbSHulXIjE1MUp50b0PqeYzKah/3z85KK7f5PJzgW/+svWy2XPbn7pjtos+vQxbcFGj/raP5ZVx7xBD8x7FGfkN0WLAqQxsAWSunlfi9OmqLCHavxRDA0zoopE1WDB3hBfmVVlqwffx33eYWGCIZjmTI5BSNmm/7/Dfh9rtZTwZW/e47Yml9thN0P120F9tdnFF0B5npGJwRKAUx8OcxQf83HV/iwHh/aTV2dUL/2ct1F6Yto/FRR0GgrzO9MNui6mUEdUe0ukdGpMl+YUMYRgq58/1nkXvjoyU3Jni2//nlbMbZEZKw2I3dM1kQxHwuY9/j2yNsMjeqQGnMWVEDBSxzc2ullEUNdBI08pCt0qooC8KUHu35aaR43lgLXTz6jJ81w0qxpJiOLEhWo/GI6SwRlqmCEg12hPDFlNPNSDDHo7tIIQi9nmKC1F+wCbQb1kwqVyntklnpOMskq95nL/QXUKyNE/g/ZqXfACaUKyZiwzd+iJTi0sLrNQDGBg1iGlZWi5YG8UvT7h6GcYRG8C7BfLtlngdKgdU4ebo1TOX6JzxjK2HZyoKqUFQW56aSh6DwOGZuDkXU6bG2DIAdfSwotlUyUFQwDQAxsNPbAGuvTzldszQ6ICK79pn6bKb0OXHdlYAYy8eWlolMEosbw1tKsnZ2XSrv68FiiI8PTW+jVoRS2Jvsk1dYe1xRFx2PXemjRJ9cszEPHIBud3hWN0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KHBgUgPSrdFM4d0fcXXum40tyZtVIF9dXM8F4JBEXz+DhQd5bMz+gPsoO/+sgcsrCiP6R4DHIRYjba5anP7U2yMFnAYa9t/QbciSkRPjCegaqdj/SLQ5b5QIWoOWc6tVk4vk4ck2jaX5tpzjDYy1jlkH6gL3wxoDeMEmbvv9ouh0O3lPDTtrVXxKVy7i+PezcU8OzRNDrEO+JhKim0Lz//W6nJx5z7zajWLaiTojvJQJvdW/4D+UVIbwHAINnog0h0g2r5xwpNt+nd0zBeGLBJqhocSIqnIk9it34icDbM1N7NjGgUUVgE/6OmJ5ZhWKcMexhriR6oJiWAwyzKLzQb5VSt6NcYG3eTX+MmkxifGwGiWW1318jXkPekKT3Q8IGL/xrROWTMEO3HCQ1dAyrM1pBuELoNQ2t+ge7A8rdQZxPFOKKte/0ToGrpBw7oMZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 18:15:38.2846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f45959f-9b46-43cf-32e9-08dec8ae9b02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7009
X-purgate-ID: tlsNG-33051d/1781288143-3754F938-E3D66404/0/0
X-purgate-type: clean
X-purgate-size: 61
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vates.tech,kernel.org,amd.com,cardoe.com,gmail.com];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[victorm.lira@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victorm.lira@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	SINGLE_SHORT_PART(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30B7167B962

Reviewed-by: Victor Lira <victorm.lira@amd.com>


Victor

