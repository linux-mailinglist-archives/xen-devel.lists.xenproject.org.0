Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E6FB44E43
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 08:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111322.1460061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQHy-0001FG-OQ; Fri, 05 Sep 2025 06:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111322.1460061; Fri, 05 Sep 2025 06:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQHy-0001Cr-LR; Fri, 05 Sep 2025 06:51:14 +0000
Received: by outflank-mailman (input) for mailman id 1111322;
 Fri, 05 Sep 2025 06:51:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ql+j=3Q=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uuQHx-0001Cl-Su
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 06:51:13 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20614.outbound.protection.outlook.com
 [2a01:111:f403:2408::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b58ea329-8a24-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 08:51:11 +0200 (CEST)
Received: from CH2PR17CA0008.namprd17.prod.outlook.com (2603:10b6:610:53::18)
 by IA0PR12MB9047.namprd12.prod.outlook.com (2603:10b6:208:402::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 06:51:06 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com (2603:10b6:610:53::4)
 by CH2PR17CA0008.outlook.office365.com (2603:10b6:610:53::18) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.19
 via Frontend Transport; Fri, 5 Sep 2025 06:51:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 06:51:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Sep
 2025 01:51:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 4 Sep
 2025 23:51:05 -0700
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 5 Sep 2025 01:51:04 -0500
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
X-Inumbo-ID: b58ea329-8a24-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqvYLna2QzK1Qx9X6Y/R28oj33gZeu2AdSnDLKMTvvWtvpPSKTjvNvSufc+QLVZXnmmAXzc8Hr6cwtt/8dsYuB+iu2c1lJRfkddOUqNDSDPcl9PhZxJrUaQlaOIKobsJ1bPkWpNWhTLWfV/9E1MoHsP2DCBwO6Zi5dJSQGBdougeXqxZHlBsibuY6Cx+B6X0w0YsP7SH/m228PXnCwacDF3O8bz1Ask8WEMDLXE6FBr2jl1JJmlnNI0FsTk7XPGcrw9UwohmHmeYwbaMbi7VX5MqmB7470+AvirK6Spo4MbgM4mQ/BK0y3xoTSQWYXn15Afbd/dAIpTa1mHEOu210Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gw8OpFmjYlLvB4ag+NUsAeV5I9duKpiiR0K6V3keekU=;
 b=rWUGBcJT7lYu8u8h1/SwsMY47/LfmHaETXkrak5Jd2px7oEDYYHH8LEfajJe3SBfVLiKXMBBM/zO7GqoCTBOUZR5aEygACwK2qdF777DzVo67BA5ezEb9/ssKSjNr9Klay+fPHUAuxXSxSuzXb+fme7nogKY0qXdNhQXHQIIpBlqzyxx4UzyEctyamPDGwUYZjaNRbiEtwGIxRwCCde3rIHk0fgGcHIvxPSIFv2bp3KCowz6n/yKhKfM3+4EfbpbeGJ5k2I1Xrd0wPkYGgMVzV/i5XT0SsxX0ncUcUMuLmcw2t3CWnKMzL4KxGPSWSSV8g+lzf/IwNtWzFhKavvx3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gw8OpFmjYlLvB4ag+NUsAeV5I9duKpiiR0K6V3keekU=;
 b=KYOJpxQuBlE7NWqxwqNrAnMLCIDbJR4eOi/5qKuGzusXFvU7tIrcOqz/k8Zb97cfonGxNAzQUf4jIaP9owPOky/SukcZRFZIcWfpRhVnIWrX7gXALCE/mvN4R2VUQ74BRposbg5qIkk6Ce8wrhkV1B92I8G44dUAT2rv5p5j3jo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a304c261-8aba-464b-97dc-62695a0b4288@amd.com>
Date: Fri, 5 Sep 2025 08:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Differentiating "For experts only" and "Not security supported"
 in Kconfig
To: Demi Marie Obenour <demiobenour@gmail.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>
References: <88efc685-507b-433f-a6d7-9c96987a0567@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <88efc685-507b-433f-a6d7-9c96987a0567@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|IA0PR12MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: e22bccf0-7fbe-4c27-c454-08ddec48966c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWtSeE1vSWFpRWx4QUZxMk5INGZ3Q09uVENDTlVXeXNwTERtejNSNW94UmNU?=
 =?utf-8?B?alE2aVBOQlBQYnE3bDdrZzBZRjI5WTFPL0RlMEdBNTVIV1BpeGNGaXFTQldJ?=
 =?utf-8?B?R1JCZVlMWEg5SisrblE5aXBLNDBic0RVMzVsdC9Ycnh4MUpBNHZyQlFyNGM5?=
 =?utf-8?B?cTI1UVBTOUhkdnJEa0YzTWNJNkpua1BmY21kZzNZY25MMkxoUXIyNXhpRzZ4?=
 =?utf-8?B?elpaOTYzdXJVclFXd2JpL1FqS29sMG1ZU3Jxek9LaUVaczZhSVd2T1IwZEpL?=
 =?utf-8?B?b1RBckVsRkZ5MEVkTFBhWi9MZG91eldheW5QUlpYdWlVc0orN2dCdWMzN253?=
 =?utf-8?B?ZnRDVzVaMGdtNkJzOGg2Y3dFUndsbHkyb3J5Uzc3b0ZwSHQ1TmhoallDaXEx?=
 =?utf-8?B?VUlsQXVTa0xUa0FWNXZwUVNIaVNrd0JXcWszUEY1SVlCdTlxeDNzM1ZwcTB3?=
 =?utf-8?B?eDFtT1U0VzNOVkoxSDJITnp4cUUzZHN4R0NBUmpDM3N2L3NJLysyR0JhNjFO?=
 =?utf-8?B?Y1JKMEJER0wvU2tBaVJBUFh5dkpMcWNhTU1CQWVvSERHUEJGT0IzRGtVYjg1?=
 =?utf-8?B?L3k0SDJSSmxSa2w3bXNOUEE4Nzc2dGxBZ0NhNVU2WXFJN0JXdDZzVVU5QStK?=
 =?utf-8?B?eFd6M2ZPdnhjL1JjeGNCRjJuME5EWmhCYlJST2RRVzg3d2ZlL0pHUms0bDR2?=
 =?utf-8?B?VDVZMHNuS3Q0WExZaFV4K1VwZmpaakxLNE0vYjdURGlPUVBGZWpwQUVGaFhh?=
 =?utf-8?B?TUhZclpRUnZPSUpJd1ROUzJRNkVCVERBVEhvMlNZQWZObnMxN3lPc3hiMmFT?=
 =?utf-8?B?ejJHOEpJZlM1R2pIdkFGRzlpZjE5ejZNUnNiUG1VeVMxMEc3MHQzNDlEUjZ5?=
 =?utf-8?B?UkJhQjc1M1pwZXZmWEh3akk3cFZPNFU5ZnFBbTNscjRVRm5RL2FvWXFBWjl4?=
 =?utf-8?B?OUpCOSthRFJ6YXM4VkNrZ1FHaVVXM0RrZGEzdFNVcld5Zlk1WStJUHF2NmM3?=
 =?utf-8?B?QXp3NHZ5MEErKzAxT2ZtWHFFekh2V1VxdndObHdNMEJBMzA3UmZVR1N1aWxo?=
 =?utf-8?B?dGRhY0l5Q3hsZ0JBYUNLMW5wMTRWcUFOeEtkT2NROWp2MkZYNzNvT1lzWUs5?=
 =?utf-8?B?eS9ESnFKWC9MWjNyZFpXYmgxQk02YlJHeFJYNlFXUUw5WS9XaitqUHNkZ2xC?=
 =?utf-8?B?SG9RYWp0WEw5enQzenFyWThGb255QitNdmNGR1g0YUJZVlUzNjNCdFZhQ2VQ?=
 =?utf-8?B?LzVrSStKV0ZLUFE1M2FoSU1yTFhBRVUzdVFUUERDTEpGdEZEOWhUNlJieXJD?=
 =?utf-8?B?R05aMHYrRVE0SmNkNy9yNmhNck41c2k1QWRiVkpvK2ZhQXh6VHJOTWprdjZt?=
 =?utf-8?B?eDlVU0ZJbk8zK2JYdWhtb2JBdTNGZFJUa2plYy9DSlc2OWRZd252OXYyRDJP?=
 =?utf-8?B?aDRJdHRzajdYYWlrUUt0NVluZ1prZndsWE02UjlBKzQ2c3EvckMrbG9CaWpG?=
 =?utf-8?B?VEZTMHg4c3Z5K2dlSi90THJNQkJ0OUV6SUE3cHE1eDJiek1ZcHUxVmhhdnVU?=
 =?utf-8?B?c3l4ZmpJOUwrVXNrdzg2MGt3VE01cGg1bnVpZnZiL2REV3cxNEtQcXVUeDBI?=
 =?utf-8?B?d0M3NHlOQVRsQlRDeEcxTFU0S1JNQU9WNXZxNUNZTWpYQVBCZENGYmo1Qi9i?=
 =?utf-8?B?M3BCUDhHTC9nK0FubjZBa1ZRaHRYdDBxQktaZU9vSkYrK2M2bjU4OUsxcldx?=
 =?utf-8?B?eHNLb1RBNnVKQjMyRmJ2RmdoWW50TG1PeGtyUlpZNUtocjVuN25QWHpHSU5v?=
 =?utf-8?B?b0I3eGRFMHBtK3p2QVhGUTBDZ3RwMG5UckRpWjZUeTdqaUZlVStpMGVnUGgz?=
 =?utf-8?B?R29rNDV1RTJsU1AyaERvZ0NOYUtoZ1dNQnRiMFdpTTQ4SCtQWm1LL2hjUmZ4?=
 =?utf-8?B?S0E0d1NFY1JqOGVHelBGczQ2bUc2cmgvbFBGQ29tSlJTQ2lHZ25UaXJLRE43?=
 =?utf-8?B?dEVCdHZidlhTSUxLTjhjamNkVEtVMU5HQWZnTXF1aFRDV2docS9GVzY1R3M1?=
 =?utf-8?Q?ePdOF/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 06:51:06.1447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e22bccf0-7fbe-4c27-c454-08ddec48966c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9047



On 05/09/2025 05:47, Demi Marie Obenour wrote:
> Right now, both EXPERT and UNSUPPORTED options are
> not security supported.  However, this seems to be
> causing problems for safety-certified use-cases.
> 
> Specifically, disabling AMD or Intel support is certainly
> something that should fall under EXPERT IMO, as it is a
> great way to produce a Xen binary that will not boot on
> a large fraction of hardware.  However, I see no fundamental
> reason it should not be security supported.  Not security
> supporting it means that those producing safety-certified
> builds of Xen (which, presumably, are some of the most
> security-critical there are!) are having to use
> security-unsupported configurations.
> 
> This definitely does not seem right to me.  Safety
> certification and security support should go hand in hand,
> not conflict with each other!  Is there a plan to address this?
What makes you say that? Functional safety and security, although often
intertwined differ in focus areas and objectives. Functional safety aims
at reducing the risk of unintended hazards caused by malfunction of system
components, whereas security is about reducing the risk of intentional threats.
There are different standards for safety and security. Current AMD safety work
focuses on ISO26262 and IEC61508 but there are security standards like ISO/SAE
21434.

~Michal


