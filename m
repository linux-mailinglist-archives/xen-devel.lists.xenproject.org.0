Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47429AE8456
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 15:20:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024862.1400644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQ2y-0001cj-5R; Wed, 25 Jun 2025 13:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024862.1400644; Wed, 25 Jun 2025 13:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUQ2y-0001bA-0v; Wed, 25 Jun 2025 13:20:16 +0000
Received: by outflank-mailman (input) for mailman id 1024862;
 Wed, 25 Jun 2025 13:20:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZrh=ZI=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uUQ2w-0000NT-Mh
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 13:20:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2413::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f3bd679-51c7-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 15:20:12 +0200 (CEST)
Received: from BY3PR10CA0012.namprd10.prod.outlook.com (2603:10b6:a03:255::17)
 by SJ0PR12MB6685.namprd12.prod.outlook.com (2603:10b6:a03:478::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 13:20:09 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::32) by BY3PR10CA0012.outlook.office365.com
 (2603:10b6:a03:255::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Wed,
 25 Jun 2025 13:20:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 13:20:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 08:20:04 -0500
Received: from [172.28.201.131] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 25 Jun 2025 08:20:04 -0500
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
X-Inumbo-ID: 1f3bd679-51c7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pk1F/BNOFqnGTOXcapgActkrZIN9/dAZpPEfKyPAN3ldHxxQGenq3++Jp6oCPm/XFD+O2wYAUreASAQ9bnf2//1f8ZeTpDNQcBiiEgx79P9Akjl4Qwcpgnt5+wOiXCEjjVSBFc+HpAHC3LokGJcCxj90BfbFTZyh2PW2Agy+7gm93OnCSjfgAZnXQyRaeE+n5BCM8l6bhl5d1X6tHDT6qPDhT9DwBRen8b6RpbS8fnp3Dbg5/lGZka/ZT7M9LHRGiNPx7ECGcgr4lf9YHcNmf74Uv80rbU8HWZ1VQ0eICofbgWaFnpkgAau8113cYu7UOkvxRpkRiWB7CeMIGbt0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkKLTSX9uvKnQiiYiqOyGwN0Slh8IS2Jkz/rFIx2Z+U=;
 b=BkYsVCqzpPjUlw4NTuW1JSRokdvxESZKDQBJzJ1aceE3qtudYA5vhWZG+Q5mfJdSNw2ntC+tT3jduSYmQEX1O6d6B/y+BPDAqsgSwr+yckkuc8IchS/ZSECFpC4pzcqDIgQlPArFcpKdkZPqnWeNeRsjtZeUTH1921WkG+mioaOAtTd9lfxqp6//L3VUkNVVPS0iXs5YRkW9wombml/Y/HP08r+9Lkt3nYjRJWpsVkQTUxV/Na5BoKYqxbyWJROHXg7jFc0/y2AiOo64nXRfrhRTO6SXrxWTJF3eF4SC0NryluqAncB8eQrcqelVuMCLOg3H06lVUXo7FCQsWD7AsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkKLTSX9uvKnQiiYiqOyGwN0Slh8IS2Jkz/rFIx2Z+U=;
 b=oupqZv09ceEg9CexO+Z8cOBqX6K/MEB+jb6QkuNbz/RwBaIRa4HnPzjSahSONYr74G/eZ8rKjlESP6OSs/D1P0MP3HSaqpeczWIbG7Pv6lv4GnPu7X5iE3vksxJMWlkd+9UcWswx41pjxSCWIJQoxwbVOOS9pQG4c4EDCTyt+e8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ceb9d0cd-ab11-4e6e-85a5-0a24607ac8f2@amd.com>
Date: Wed, 25 Jun 2025 09:20:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxenguest: fix build in stubdom environment
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <20250625103306.4599-1-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250625103306.4599-1-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|SJ0PR12MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: bdfc53eb-e84b-422e-f9ed-08ddb3eb01e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmRlZU5lTVBEMXBrMDg2Q2s4WHVSYTYyNGJ3encrWDdPdVpQT1FPL2xFdWVo?=
 =?utf-8?B?VkFVKzFaTkJPNUc0anpRWTFSQ0szejVYWEF5eTVLVnA5UU5Xby9kTE1Ock1S?=
 =?utf-8?B?TUsxa1l1b2xsWnZxZnh6bExBU2VXZ0g5ZHJiMWNsdnp0bm9rNjdWUUczaXpQ?=
 =?utf-8?B?MW54VHhncUhmSzlLdHB3L1ova0RYMXI2ZEdxaDFSbkNGenBJZ09YTzdxUTRH?=
 =?utf-8?B?OThRaHRKS3dCLzhQc3N1d2NKN050dG40Q0dXNC9IUkZDNjljWUExdEpQMS9j?=
 =?utf-8?B?NytrWnBibGNqSXVsN0o1OGNQVkYranVGZ3dtU3VLYm91b0lYNU1zL1dYeUhr?=
 =?utf-8?B?RDNnd0Q1Zk8rVFpERi91NzBMWW5GWE9jVTQxQ0hiYURTOG5Hdm9iQXExRTNy?=
 =?utf-8?B?S3F4VWs5YTdraDRMLzl0VXg0V0R1YTFDZUNwcnRCZ2d3V0pISzZNMXplWnFK?=
 =?utf-8?B?L0JCNVQycTZXT09CdllzTUkvazZpMHVEWksvSExCRTJFZE01MlJaVUE0YVBW?=
 =?utf-8?B?WTIwM1R0d1JjU1doWnExNmpUR01sd3BRNTZJMWw0Z0MyeE5iMlNMdFB3OTB4?=
 =?utf-8?B?KzB1T0tKQmw1MEI3MzgrWGRmWTU3OTZoTnhIR0JUMXN2Y014SW02ZzQvREY3?=
 =?utf-8?B?Mms0R0p5cjlWeEc5UmY5ZklsNFNXUkw5S252U3owazFjSE02dDNjZnBoTlZj?=
 =?utf-8?B?YmloeVNIOTRrejNsTDd5TFNGYWgvdnRtSS9UQW5BVXdlUVQ1WXEyUE9laXM5?=
 =?utf-8?B?OXhJd1VMaTcyM0tVa0NkNE9KbHlzWGtvWXJQdERBa0ZoYnpPWndyUnJtVzZ5?=
 =?utf-8?B?dDR0Nm5Femt3UmMrNlpTY09TS20xck5WZTRCUzN1N0RiY3FRRWZ0WExPdHJy?=
 =?utf-8?B?dlFycldYcEt0SHN1WHNXMlJnalZWY2Q4SXd6czFoYksyTXJDMDkrQUc3LzJZ?=
 =?utf-8?B?eWdCM2JTOHEzcThSY0xZY1NqVE8rYXZQZjZRaWx1eXlrY2R6cDBYcUg4SG5B?=
 =?utf-8?B?cmhqVmdySEZoYjkwa2pXRUZLU0tQZW4yS2dIVzU2ZlR0N09CNlhjc3NRQzBW?=
 =?utf-8?B?bWZWMjA1TXJTdE1VM1o4anNpV3ZZbFVWUFpUb1ZxdHlTMmZvSzBvdUlicGNS?=
 =?utf-8?B?TEFoV3N4WXBpSG9udWxYckdYNjRua0hjLzBQSE55aDFUaVdqcHV6bDlrMkNw?=
 =?utf-8?B?NjFnWEZoQVhORWVGVmJKajFwSXVCUVlueU1BT0VOTnFoVTJNUlE4QVVSeHZu?=
 =?utf-8?B?K2czV3YydUFuRGNEamJ2UnIwN0M5TVpUS3RMQXIzUjhuODg5MDcwWklCVjhk?=
 =?utf-8?B?V0lkTUNJeWRkQjVpelQrbXdHUGtXTUt6UzM1WkFSVnZiSG1IZXRvanU1WXlQ?=
 =?utf-8?B?b21YRndHaHlHODVYMDFpZFllL2lxT2JXa0tLR0FKVzJRQWVGYkhsRUFhUHJY?=
 =?utf-8?B?bnhBdDYzT2Z6c0UybnFUK2dCbnRxazc2NDRBTmg4OXluSzRNRUZxVUl6dXhv?=
 =?utf-8?B?NVNqV0p2Q0pnZGhabFAzWFM5TVMrL3NLYmdEYmswWDFReG14YndIbEVhSDRv?=
 =?utf-8?B?UFRoY2lRWmFmVnY5L2xUQTdKMC9mTWFpVi9CbTU3WVZ1OFhTQjhqMUlkNWh0?=
 =?utf-8?B?WkdQNEdPd2Rma2Z0ajNPcUlyR2JJZC9JbE83ejMrS2pFN0JOS2ROOXJlMVV4?=
 =?utf-8?B?TmJ1YzZWN25QTzUrN2R0bzJoK1pTc3VjZkRLdUFmdDV0NithSXVNZzJBTlJJ?=
 =?utf-8?B?ZzJLN2x0clZjYUJHUWRVdTBQVGdSYnZhakRhQld4M3VITjlTa2Zpc3BCUmNY?=
 =?utf-8?B?TWNIVHlYelg5cEpUbEpMV2tpYjRUTHRLcVNyL2Mrd3ZPUXY3SDFJZVlmOVVw?=
 =?utf-8?B?Z1d4SlU0MW85Yk9tWEdUaHlMTTI4VmdIdmVmWWZxUFdjeVpybU1RTlpmV0I4?=
 =?utf-8?B?bWljSlYvL1RGWmNNS0FYbk82R3hrZGJ1eXBIczdDYi9Kc2F5N1RJZ2hsbGUx?=
 =?utf-8?B?MUlXeEdDY21nYlh0OFVzWk83RWhCT1V1R3lRMENJVW02OVJIL2xPOGpiWHRn?=
 =?utf-8?Q?2BnkUy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 13:20:08.6186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdfc53eb-e84b-422e-f9ed-08ddb3eb01e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6685

On 2025-06-25 06:33, Juergen Gross wrote:
> With introduction of the new byteswap infrastructure the build of
> libxenguest for stubdoms was broken. Fix that again.
> 
> Fixes: 60dcff871e34 ("xen/decompressors: Remove use of *_to_cpup() helpers")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

