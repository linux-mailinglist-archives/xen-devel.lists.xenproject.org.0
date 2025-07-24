Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A1CB1154E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 02:37:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056739.1424737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6Qs-0006z2-Cw; Fri, 25 Jul 2025 00:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056739.1424737; Fri, 25 Jul 2025 00:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6Qs-0006wP-AI; Fri, 25 Jul 2025 00:37:06 +0000
Received: by outflank-mailman (input) for mailman id 1056739;
 Fri, 25 Jul 2025 00:37:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf6Qr-0006uM-2o
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 00:37:05 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2412::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ad6cd3f-68ef-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 02:37:03 +0200 (CEST)
Received: from CH0PR03CA0029.namprd03.prod.outlook.com (2603:10b6:610:b0::34)
 by PH0PR12MB7837.namprd12.prod.outlook.com (2603:10b6:510:282::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 00:36:53 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::46) by CH0PR03CA0029.outlook.office365.com
 (2603:10b6:610:b0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Fri,
 25 Jul 2025 00:36:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 00:36:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 19:35:04 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 19:35:04 -0500
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
X-Inumbo-ID: 7ad6cd3f-68ef-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+Ufg1aMMppYmlmwZQps1oRB56G5rNVJVDZd4/v0XG66F8i+zdJyhnV7ASBypa/4rA79zw4uQRihdoUdKP85BADR3Msi9S5IuYAexFj/qewFduUqpzjefivwz38b/Ls5xdyodzSK3PC7JG30pfsMCx8WxrxjmrACdjs1kcYWVrhvajCgGjrbLj8iGjjXj4wuk8xBuxGLstTc4oLvPUML3YnINw/ueQh+q/sLrpV/LxJ4ywbiGiqsM1fLaOxD4S2cvMRjwhwdCBa6exVJDxMq0/AEq65zhkoZ/+rP7yp1pdRjdjjPhjqsgTFqjAGCl8+m8SSQsjQq8GCduAEoTP/P6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRouyvPinzYBcMxdnHpXDLd7WIT4Kufxlp3INtE/EH0=;
 b=mTbEIStV85vs64WhH/X1MIue8z9kmLA4pPfvZlAFp99M2934HjNAZvNMpNKaO60CtZpt+oK42JKGdEPJuRapJR36jUXE/U6KZnWNspxeS6rJXLQXnn5Kw3fC7mh7mwuuVG/I0CbLRSGYexbuJ8Jn8NRNSPX0yamIuayHWPiyw/+zeBYvqZNEqmM8VuNfCDDm9UuSgd5/m7hQcFsA9IEaXTvXESkCIf9hOePDPf/GmDj9Pw6YA3q9MMnUolO8PL5GPQX4ByBwq6nrU/He9axvmLObKED4WLwdTqugQ11jJs5BYJt1SJNEgmqfRuwGkGcQg+o4wdjTkn4mbPxGWnG66w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRouyvPinzYBcMxdnHpXDLd7WIT4Kufxlp3INtE/EH0=;
 b=j5jhKrASXhkMTSgGMTnA/pBcOVqLAPS8ynCgTuyi4XfYIMeWpoALXVvpmWiJFj6XZTJpL8gOUJweBz5erLZjOor7pvApUIxIeaBWct0fjxBIKaNIhtOkOejjfjGn3SesileRBYgRF9jkVlLhTWr3+qdIUERnrr6r1/TX6Do2zJo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <fb2499bd-8711-46f5-a2e4-285488c52f8f@amd.com>
Date: Thu, 24 Jul 2025 18:52:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] tools/xenstored: support SET/GET_FEATURE commands
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250722140628.28947-1-jgross@suse.com>
 <20250722140628.28947-6-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250722140628.28947-6-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|PH0PR12MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: a333a24a-ca5f-4447-07c6-08ddcb1359cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2R6cmtEYU5VQVJ0aEwxSS9hZDVwZ3ppQURpZU1lWElqTVV3ZldvRzlSRVIx?=
 =?utf-8?B?bS9QVEZpRTJ2b3NUa2tURnFvL2NqWS9veHZxUjBSQ3ZNQ1BDcVd1Rnc5WGc1?=
 =?utf-8?B?MXg5b3Y0YVpTbW5IaEtjTmdvczR6dWlSQnc3MHJoZGszSTlaMXl4azN0TTFW?=
 =?utf-8?B?NjI0L0laZTVNVXZnT3l3RnAvOGFBNVlWUGxoay9MTGJ4SEtqTndWWjV3Q3B6?=
 =?utf-8?B?OVlISE1WdjE1YWd0OVdPSzR3S3UvL3d1cm5QcklEak1WTEZ0LzlsalRSdXh6?=
 =?utf-8?B?R1Rvb0NVZU5POVdaV0ZFenNQY2FIZjBtMGxUSnNOTDE5U3RTKzhoYzRqSmdC?=
 =?utf-8?B?NHVzNEVKTUZ0cGFpZGVtWUgyMEY1NUZQcWFvNW41eTZYRUt0R0VzclJVNGRt?=
 =?utf-8?B?ejRSK1pTeVRMd3lOdHI3QzRId3NybVZjd2piaUdocjdTR2x6QWZPVmhTclZy?=
 =?utf-8?B?VmFZRllsUDMxNUgxVEdiNUpNYmxrcDEzcmhUY3pySlhsMGExbDFCSy9nUzUv?=
 =?utf-8?B?cDN0WnQ0bDRvdm9DTVphNFpPNUJhNjc4em02STBSNTc0dk5VdGxGeXp5bHNq?=
 =?utf-8?B?QjZMeU5NY2NsK2hnTzNoRW1pK09Gd3orZzZDRUwwWWlhQ2ZMd09KdHo5TDRQ?=
 =?utf-8?B?b1ZYQk5aQlIrbGJMazdUczRtc3FLSlluUytwamZZbTVjSjJZYW5MbFlnbG9m?=
 =?utf-8?B?SS9hQllyS1hmWG5jaFE3N01aejUwczdBaUV1YjNFcXNkdWVqSzJZMFA0Sm5Y?=
 =?utf-8?B?L1ZlUDlLQlBocmJ0TzJCODNiKzNUeDczblNIN2lSc2t2WmV1b3p5SG1Hdm1S?=
 =?utf-8?B?NlhqakMvSXE1ME9KTlZ0dHdaTytEWW55YVhlNnppSFFaS0pLbDcxNTBCSkNU?=
 =?utf-8?B?WUtMUnlITCtyUlZZRXUrMFdBNDczdHl2aWlscnlmUmFydHMzcEpudUkvRmli?=
 =?utf-8?B?UlFxNVk3MUExOU5HMFJrS3lnMW1CL1Z1Z2RoREVtREgxMTdxenB6LzZLeERE?=
 =?utf-8?B?akNMQWIyTTJFYzBQWTREaUxCSmhRT2pvZFBVdDdvM3ErWXNnRHc4eHo0dmk0?=
 =?utf-8?B?eXI0clRrdThydCtGYVFtaFc3K2xJTU9jMUF3WS9MaXQxY0VrdGNXbGJQQ2hH?=
 =?utf-8?B?bjVDV0hHMTdKWkUzWnZ3ZVZhbnRHZnBHbHErZG43UnhraXlDM0VUZG9DQWtT?=
 =?utf-8?B?UmVtbGRzQTY5am1jT3padFlIUjBrNW5UOU9jSzJEUjcyaWc1TVhTR202QTNE?=
 =?utf-8?B?Q0UrU0x6N1g3ZndsVHNZeU8rVHFxSDhQZDBJcERwQnpSK0N3d2Jmd1FYbFhl?=
 =?utf-8?B?RUlBanJUYWl3ejQyVW5EdVJJME15cWhIc0duMzVQaWN4aG5maTNIVFdWVFJj?=
 =?utf-8?B?WCt0ZVdvSEROTFZzMCsyQW42aWs5SDg5ZjBFZGNidnVGcjFyM0tCWTkreWJ3?=
 =?utf-8?B?L1VRMDlSYlB0SzlzN01ialRMWHFDUE1VVzJtVHFnNS9FL25ubFQ0Q1VOOWUv?=
 =?utf-8?B?NGFvbFB4RGtGeHZ4aXI5dVN2dFJrRGxRUEw0V0lHSmFIcm5kSCtLYzFJRWIv?=
 =?utf-8?B?ZDh3cXNHTHRvRmpWYXZEVWs1LzF6eU9WZHprZk9sK2NaTmNGcmU5R0doUytn?=
 =?utf-8?B?RUxSR1Jkc0FISU1xTjN6SlByMHl4OE9Nd1lqMEhOdFZUb0VIQXdFYk9Cc2dX?=
 =?utf-8?B?eGFhNEJJSEJuaFdJRHU1Vit2SkpTYU5YL2hDMEhLUkZhTTdMRStkVjUzMWx3?=
 =?utf-8?B?YzFwOEI3RGVCR2JYSlBsMnV3a1BvSDBNQ3lDY1BkZlJzYTNqNjdOeUc1RHVO?=
 =?utf-8?B?akQxNDIyL2Z2WlpnbjYwZ2ZPa1M3VklWTlNMckhrSjRkNXQreGFBWjdhdENm?=
 =?utf-8?B?bTVGeDhKUTJ6TzNRdEZpRGJhUUpkRGw5eVZKK3NwcHBFU2JaM2lvaHVJbVl6?=
 =?utf-8?B?b2NmSGVpSGU0WnpQZTV1Yk9QT2VQUFptMjhINmlPWE5pbncxRGQzZk96NWdx?=
 =?utf-8?B?ZUYxaDZSRkpzNCtHSXh0dm9hVGNlZ3ZzSndieFJUZFQ4T2NSbWVjWFFxMm4z?=
 =?utf-8?Q?AHos64?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 00:36:52.3903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a333a24a-ca5f-4447-07c6-08ddcb1359cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7837

On 2025-07-22 10:06, Juergen Gross wrote:
> Add support for XS_SET_FEATURE and XS_GET_FEATURE to xenstored.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

