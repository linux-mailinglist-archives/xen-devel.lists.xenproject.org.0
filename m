Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EEEAP3MkmnxyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 08:53:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E1A141610
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 08:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233721.1537085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrtPz-00030n-SH; Mon, 16 Feb 2026 07:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233721.1537085; Mon, 16 Feb 2026 07:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrtPz-0002zV-PC; Mon, 16 Feb 2026 07:53:19 +0000
Received: by outflank-mailman (input) for mailman id 1233721;
 Mon, 16 Feb 2026 07:53:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRIP=AU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vrtPx-0002zP-V9
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 07:53:18 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c3b03be-0b0c-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 08:53:15 +0100 (CET)
Received: from MW4PR03CA0021.namprd03.prod.outlook.com (2603:10b6:303:8f::26)
 by LV9PR12MB9830.namprd12.prod.outlook.com (2603:10b6:408:2ec::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 07:53:11 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:303:8f:cafe::21) by MW4PR03CA0021.outlook.office365.com
 (2603:10b6:303:8f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 07:53:08 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 07:53:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 16 Feb
 2026 01:53:09 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Feb
 2026 01:53:09 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Feb 2026 01:53:08 -0600
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
X-Inumbo-ID: 8c3b03be-0b0c-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAw3GsNH3nezouKWA8ZhZ+zUevcm8E9Y7uIKRdml13whk7DfFIG72RyLskRawAVZIG/dfGqug1nDbSNeGsYLI+KYxHE7p/7WhTsLFqFSP1d8u0W56QEWiZJGzpAlQgu6zzKtyN76whsaAAvgKrWfYH7kVv9kNelV4KVo0kxu8iA7OO9BAxGeaTt+Jhrke+I/3DaNRWWM8LB6rTy4oE10cHdspqIhVeC5iFqd0SOBKaeeMpREwYc43+AY3oPcECJAtGldzyDhkn5mXStU2mjMPrCx9bSK3pFsdpARy/XlHfkhv38eShBdZGS/4+paRmLqs1WO1xFBdXziSPYz5158EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQUtTnOcLFv6dyWBn4pVzq3JVCF4sqS6YPDgpC1FCF4=;
 b=AX29MxTp6OlsbSBfOJ5V41Hw1EzWzYIU9vQk663+PhB3jDUA2HCQ/EW8JMcq9IjUYTOQrcz1vC/AvEHg/65ew95fdqaYcapvjTPhAipqNau1TAwbIrNeUA0sSiVR19KjBxW4mnjqcFtHWJaixwsitdivz8/qmrES8DKrz1vBmRN9IxuQDOwNINLcqw5VqKAhNIVvBrfmdoC3+c8hSSal8x6cHHSDSjKF2lg7eoFIhSwLVFqkoOtIbufB0kIIui8o3KAokqBJR+KaR+ee68W03Fhl6gnStfvUDJZ4pWgyOCeB/5H8EHsvNzFGfZ2HHdCgLIoSRe9Hs6K3mjCR4xREbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQUtTnOcLFv6dyWBn4pVzq3JVCF4sqS6YPDgpC1FCF4=;
 b=vjIR1BXV7N522duSpsBpJD3dkskNR/z3/BLqPq8/+aEc8aFM0yNEPzxjuYOmktEfhg65pskoOXFBnzQWO9hj+M/NQhYHpVQTXHRnNEPPBs88fMQXgEKYEiNOYeYYOe8y3u8blcU9hNVu5hADXCEhsQmhRhQBvqCUygxL7jIEFsM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <528d06fb-db95-4cec-b0a4-5e16254a439f@amd.com>
Date: Mon, 16 Feb 2026 08:53:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree property
 for domains
To: Luca Fancellu <Luca.Fancellu@arm.com>, "Halder, Ayan Kumar"
	<ayankuma@amd.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260206090155.68466-1-harry.ramsey@arm.com>
 <20260206090155.68466-3-harry.ramsey@arm.com>
 <a5318e5e-3082-4cd4-96cb-98d8dc27ae65@amd.com>
 <585C8F54-ED56-49CF-A77C-895016182673@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <585C8F54-ED56-49CF-A77C-895016182673@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|LV9PR12MB9830:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a9af73a-0d1c-41d3-9a0c-08de6d306e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2RXNVRQQ21YR2Jucm9mSlMySVk0eUNDSm5PQjhYdGhnSUlsN0lqb1ZVckwr?=
 =?utf-8?B?Vi83NVVha2MvODEydnFlVkhUbDNNRGdGcUxmVnlwYnB3dkk4bEZmOC85VXB2?=
 =?utf-8?B?UmoxRFJUSmVZNExmLzVyUi9jbmx0WndkVWFJSlp2c29PRDB2ampZTnp5SzN1?=
 =?utf-8?B?YkVWNGhDQkF3c2NoN1JuZVJnVjNNSjhjTVJoNnduRi9BRVB5RXFDRE91YWJM?=
 =?utf-8?B?UlZUeThGZ1phNlc3c3V4dEE2UXpEMllNQVFVL3dRcy82ampFRTZncjVNOFFG?=
 =?utf-8?B?MUdZQkdJMjkrcktweW00YUVqRDNNVVJ2Z2FmaXRqelk0bThRMXE4ZHFXM1k4?=
 =?utf-8?B?VjZOdHR4eFdIRjUzd0FMcE1SdG9jNXEzTEVtaXFIWTZ6T3dWVjJERWx1aU5y?=
 =?utf-8?B?VVJUZUtWWmxsV0NEd3QvTzhqZjlWelFGbFhNY2h4ZnpWbUN3cWhVM2UzeTJl?=
 =?utf-8?B?Qy92ZlhKZzNiOFkyWGc2Y2d1SW5uV1FNNUZCMGNOb2JqdmJSUXVyWjAwa3VH?=
 =?utf-8?B?SHZPVXBVNkQzVnNOaGFvc1Nkdk1KRUd1WUpzR3cyeHpQRG9DbERHV2dkZnRz?=
 =?utf-8?B?YXU3S1p2MDdrSzNQc2dMbjF6eG9pd09MajdncnNwZUJkMVprQnpjNXFveXBl?=
 =?utf-8?B?WVM2MXpNVXNCYkFzQUN5OWhhVEE1L3pqcjJaNVJYajRONmR4U3hHUmxIK3Jv?=
 =?utf-8?B?NUhFaGZFSWVLVVdGZEhxUjVhQlNNRGJabGRSSmNTNnBLNG5qdVF4cWJXLyto?=
 =?utf-8?B?SmtWTmVLdmNPR0NmRWZ6NFV5OGFZWXBzczVRd1luVGNkaXZFOEpHb1hTOVBx?=
 =?utf-8?B?MnkzVHZWVGZ5ZkdoZjAxOFJnQlVHaXBrR0dDaC9ZVytaTy9FZmppSEk0ZHY3?=
 =?utf-8?B?Sm1RVWEvTnFYdGMzRGJIUXlPNm1iRXVycTA0c1BUQ3pDdHAyOTZnQ21RSWFZ?=
 =?utf-8?B?QlV0bVgrNDJZTHRrK3hwVEdGSHowTVA0b2lFa1ZGWW56NDBndlZjdHZuS2FR?=
 =?utf-8?B?SEEwZHZ4c3EvdlVjcjkvYVZRdUJHK3dDS0dmM1A0elZYY3FrNTZsd09xMldH?=
 =?utf-8?B?YWFQaWZ3Ukd2ak84dUh2aHhLTDFjUG1BaHlMNGEwNDRWcGR5Q1dxRndiM2tt?=
 =?utf-8?B?WjRWdElXcDQvRWJBQTVyYVgzVkE4RTNKT2MwNDhMUEZ1MFowK1JXOCs5ZDJo?=
 =?utf-8?B?SVNndmZmVTIxUmIxZjd4QzVwaGFtZVk2ZDhYb1N5alNSNE9PcWppNWh3S1dk?=
 =?utf-8?B?T1RUUFJ2YVNkejZBMmYxdmdsM2NycFRTODk2cDMrdFloaU1JMEpCQmswM2gy?=
 =?utf-8?B?YVppOGFwc0ltdnZhYi9kUTVaODJWWm1qTExXQ2V6MmFFQlhsM3BqeDZQbU5p?=
 =?utf-8?B?alJmZG9KVk1PeGQ3eC9jdWM2K1lrNm8xTEpIMFU5clNJZUIwcXRxUzd2RFFJ?=
 =?utf-8?B?VFEvSDdISDQzUjJLQVVXOTE0aWVnV0NQNkovckZkTjN1V1BQR3lEV0lqNmpp?=
 =?utf-8?B?V2ZSaXVNVENCN0JhejRNNHJEaG5uWk9SQTBRcGZnNUk5dnlJSWQ2aCtnWDNx?=
 =?utf-8?B?bEJBcXpVdy8wMUtXc0VTbnVLSkQyT3J6UzBLaXI2YXlITnJGUGhnc25ITFp4?=
 =?utf-8?B?VWNrQXdoWHVLUHJCb2REbnd6N2lrN2lLeHAzNS9VNWNQRE41QXgxTmdPSWZS?=
 =?utf-8?B?Ym5TNG5tUVV0aU1maEhycldZRVl6R0NkN05aUXJNWllSOVNxVHpiVGl6eWFP?=
 =?utf-8?B?ZmJoU0NjTzVJMXEvTzQxL1pzVE1xZ1REOFY2VEFRbE1kdGhoUEI4aWVZMncy?=
 =?utf-8?B?MHNrZ015ZS9XUWloSlF2eTBEYnJZbnkrVmdpVERnNnpvajVRblFtOGtrYUpu?=
 =?utf-8?B?eHhXTkw1WkN5NzY2MkRCT0N4TVV3SHFqbVMyeDV1N3A3L1lLL0xubTVKUnpj?=
 =?utf-8?B?ZDE4VVducXo3WXJjcTBGVUV4T0NlYmhuMmJwSXp5OCtFQnFoZmsxeW5ON3p4?=
 =?utf-8?B?WEhHZ282TGlUeVUyS2thZ01QMHJuazYzVDNDRm9RQVViNkxIMEY1SzBCQWta?=
 =?utf-8?B?OGVkSk5hNmRpSjl1ZmxOZ0pRZ3ZpRktQUnZpbzA5S1JpNEJGQy8xcnVKMnZV?=
 =?utf-8?B?V3hjYm5pSTVKcEw3OVpEbW1SbUpWRk5aVjN2YU1seGdXd3F6UDZUOENSdEtL?=
 =?utf-8?B?enRyRDVxMjF2ZHFheDhvazlUd1F6c0sxVEVRZkMzOHFOM2V4VFU4VnhPOHpv?=
 =?utf-8?B?dThPKzZ2TGk1b1ZnQ0tlZU4rbHRRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1c9dxKsvaF6KDkgEpPXN3U2JRbr7iwdJmX55rdkA9+5UzzEIQxJVDLxZ6lnsp9RlAQJLd+ddxAE4Diu1/P+9LMs245XecY1FkGShCUad4N6qpxSWTNDbXpBBcc+9czWne/KSwWyCG3eqvM2vqeUwBNqXPEmCGsgLpunwM8pfFulFTQly4X8TFhGqUSp1gUAmQ71GPzgzts28o/jbsmqUNnfgY6gArAxbRQXNry58x7u5X1CmCeWvMiMfYM2QwHVVvYW7bTpqZvmIp5UWAf8E1eldCY73no3mTF7EqD+IOUrdqjf9nmhWtOQ4ePYfhcjNsE7WoBX3kZW2eQtSCJlcomcVIeWEk6tfsUupQbgMfjSddJ3q7xAUOxuL0G828gr6xEY8PHim53wBPyBy8SqdvmohG+ZgPjZoUs/ZIlpR8Qp+HCzJ9Y2zcRMJK8O5nw89
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 07:53:10.6074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9af73a-0d1c-41d3-9a0c-08de6d306e23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9830
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:ayankuma@amd.com,m:Harry.Ramsey@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 60E1A141610
X-Rspamd-Action: no action



On 13/02/2026 10:20, Luca Fancellu wrote:
> Hi Ayan,
> 
>>
>> Further if we can set `v8r_el1_msa = mmu` by default for everyone (Armv8-A, Armv8-R) , then we can reduce further if-def.
>>
> 
> This was Michal suggestion to have mpu by default, so I would wait for his reply before proceeding further on this.
Yes, we should keep mpu as a default which matches the Arm ARM. MMU is optional
whereas MPU is not.

~Michal


