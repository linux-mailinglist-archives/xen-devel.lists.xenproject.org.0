Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPKgL6ocjmmG/gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 19:32:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBD813046E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 19:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229782.1535585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqbTr-0005uh-DD; Thu, 12 Feb 2026 18:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229782.1535585; Thu, 12 Feb 2026 18:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqbTr-0005sJ-92; Thu, 12 Feb 2026 18:31:59 +0000
Received: by outflank-mailman (input) for mailman id 1229782;
 Thu, 12 Feb 2026 18:31:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWH9=AQ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vqbTq-0005sD-3D
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 18:31:58 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bce093c-0841-11f1-b163-2bf370ae4941;
 Thu, 12 Feb 2026 19:31:57 +0100 (CET)
Received: from SA0PR11CA0130.namprd11.prod.outlook.com (2603:10b6:806:131::15)
 by CYYPR12MB8889.namprd12.prod.outlook.com (2603:10b6:930:cb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:31:53 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::b3) by SA0PR11CA0130.outlook.office365.com
 (2603:10b6:806:131::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 18:31:36 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 18:31:52 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 12:31:52 -0600
Received: from [172.24.25.217] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 12 Feb 2026 12:31:52 -0600
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
X-Inumbo-ID: 1bce093c-0841-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWKp09CU7p2XeKtec7PCYXDjFWv6rFUnLlCt2PyAsrayDYe/TmUbVcMV4awy8q8xM6wKzsPaN+88yZB2Er4+NO8Q9vy+gYxZc6qzTQvLB1hvQ3Dt8eP0mJgYKIbnd2sGypyp1Ym+4ApJ4FB8IJpyk8LrroQieVmX3SnWZfYa+kcwoNxrdpT6ObrQiWULd1SWGcEAABvr69PppsUWUahFzPxrwz93mgPb3jPkPRMGs0PYC8jvhm22psbSLRYa8lLof/Q50IcbQAz+Vl0moruNL51kEeZBvA613wp11E+T3VNRMKP99R4iiBJh2i/ho0GdYzPKxXrQ/V5bhr9/tTURFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ob+SzU+ZehTFeRGocRStEOWhaF8HhSP5SeE5DPDUFD8=;
 b=YKZ1su4nhezxatyoWp4DINigOUY5wj177zNo4SKIK/rMZX+6SHlP1zDsX/xQVMuPW9N8+FcRtLk3sKxkThrVnEBWK8rpdNoHsTU+LGA95q3yvsduLJLmMiNArrA+z3me+ITjlb9l97u78tY714LFtIajMcAS1awmdELap8Ov23HByRTK/YuOWF549frAy/Wo9JygUa3E9SayTRLC+ZZiaaDLhEHwH5NJKYAUv0ROvX3bWd0chOXsqte6qcdD2VgqiPv9r3pU738ldgd4lJbkmGhXGwFa7HgdeRmG/+9j1kEyOZTbEAQaStYIL2XlEWAidomCeCqR5wKIf3pJPj5kLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ob+SzU+ZehTFeRGocRStEOWhaF8HhSP5SeE5DPDUFD8=;
 b=CIaS/gnw34393Q2npPTRf012SEaGeWNhGM8Vxpq0VR2LvGxOzzllyQOwY7EF8bJVhCMm9TDqyX41X80wFG+hvbrlxXMlCR4OYlVA+LTy4YpdHc1F0gwhKBurUszWWJLR5K4CQSgyjp3b7iOpX+8Fn0YhlHm/B6i0F59D24viL5U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <5c2e5675-9577-4c5f-8ab8-9607dcf59e24@amd.com>
Date: Thu, 12 Feb 2026 13:31:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xenstored: fix live update
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20260212095427.143177-1-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260212095427.143177-1-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|CYYPR12MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 89b903d6-0158-4a0e-a9a0-08de6a64fe3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VG92U3NEWllsVUsvQTk5VE55WEJzTi9wcGRyMHFMRldremlVeDBkd0dDdmF5?=
 =?utf-8?B?dkJtdzZQdHdraGJSb08rL3FFa1NGaHFGampqcmNtMmpwazcvTnhRUCtWM1Zm?=
 =?utf-8?B?aFZxT0k2OW8vNzhVZWtUcDEvYUFFaEFadlFTQ1BmLytoS2twZTEwZWF5Yksz?=
 =?utf-8?B?QnVxZ1VrVkxrOElPZy94RXRyTEsxNjAzTm81NVFucEJvZkRVZ2VCbHB4VXRL?=
 =?utf-8?B?TG5sZThXbXdxV0E0Zmw4MUdtU1dJYk1waENSZUxHa2UxTERqUlNmOTZyL3di?=
 =?utf-8?B?TEhuTVR3T2FHdFc0VGlvZVlGdS9VUldhTVJHdjJmamF4WitFMFVLM2J5ZDEx?=
 =?utf-8?B?UDJTVU55NXJ6dWZhT29HMi84MnhCYUh4L3pmNXFtd05rMEFOTi9vTWtxM0Ev?=
 =?utf-8?B?S21kM2xJSVFSU0VDeDJRSFVVSmJVcy9zRVRvK2dzMjBDRktISEZyNTJsS1g5?=
 =?utf-8?B?WVltQ0daSzJoSmlRSmlReEJSUk43bGhITkl3TXFwWjBKRU1DR1FFSURtSHAx?=
 =?utf-8?B?MG5UY0M2TmtpMmJ6SkNiaVlreGRPcnk4TXp5KzM1VzBYZy9ldGFhMXUzTE1L?=
 =?utf-8?B?MXFXNzNWdGovbytWYWExUEFxQ1REN29JOHJTT20vSUpFeEkvbVMyekdJaEl6?=
 =?utf-8?B?U0lNWXcrTGRqRUs0Z2IvYnhhdDlJNmZacDByUnp1SUZWcjVJVVMydlFOZTQ3?=
 =?utf-8?B?bVNlMExBWGg5cTBYS2JoV3FNMER3cmhCYXFDamo3NFp6clVvNFMyMWJkWThI?=
 =?utf-8?B?Vlo2K3dBbERjOERtR2JKZmMxdGgzaStqTEVqTXh5VGVPOU1VZ3duTU84SEo1?=
 =?utf-8?B?NkVNcVExcVBOcnp5OGdkakdGOE52ZTFrRWlpZFZ6K3h2VEhMcCszMDBxRDEr?=
 =?utf-8?B?ZkFZU2J5cWxjam1BNys3WkZFZVF6VnZRU2NsWHh0K08rSWpTMjFaV0w2QXU2?=
 =?utf-8?B?czFSZnNRTC9rdDZKUnpyRU0rNkc1K1RFdXhoSkdEbDhIcEdrOXU0am4rRTNV?=
 =?utf-8?B?VWc4THUwRHZyU1VzRGx0bnQ5TmFrL05kRytxMloxaGxEeDQ4eXF5QWg3QUQ3?=
 =?utf-8?B?aFlENDRlQlBTT3VjN0JXT2dhaGFobWYyNnV5UkFFTXlmYktaQlZ5bm1XeFdU?=
 =?utf-8?B?VzR1NjRpUTRicGM3bThaWDRMZkZ3WmtVSCtueWlITW5uOW1mMGJGcUZNSDlE?=
 =?utf-8?B?ZlRwSXUrOEsxTlJGRDlTMEhVU0dSbWpLQ1gyd1c4TFZtQ0ZQMmNZVlBjTTht?=
 =?utf-8?B?d2ViWStuQlQ5WG9KN3lnekRxcFFSRWdpL3Mwcysyb012Z1ZXR2M0SE9ZS3lB?=
 =?utf-8?B?eG5GQ0FPVUwvM2VxVDJ2aHdjcjF6bDJqaWdBcU4xb1BlYVNhcGxrWjVKc3lS?=
 =?utf-8?B?WVk1Rlhmb2pWOTBzWWxyTmQzUC9jTzgwQXJSRG1tL2ZuM3NDN3BCNUlMR1Zk?=
 =?utf-8?B?RzF3UWtxeVdEMnBRV1NreHBvNU5CK2NoNkJjeCtFcFNCLzdnRmEyK2w5dXpS?=
 =?utf-8?B?UDhrajBiS0JCK3pDT1JWVm1BQ0sxTkNzbHFjZXZ2ZVZ5MWVIN3JBZDljMjlP?=
 =?utf-8?B?a1FDcFViaEdkak5mWWFybkk2Z09KSWpjUlJ3UGZFY2xhek5pZ09oaUljbjlm?=
 =?utf-8?B?QkMzZDZOSXY3U2pZQi81d0ZYR1FBaE82Q2ppTzMzYlpmSmxZc29aSms2N25R?=
 =?utf-8?B?bW5aWUFGOHNWVGFGV2UyK3FuSjRWZUdNTFNYOU5aOGVPOUtjQi8xWHorcE81?=
 =?utf-8?B?ZmJmSElHNjlvNGRtS0prR1orN0s2bHpJcURCSVE3cDEwVW1JSDRBZWI4RXNI?=
 =?utf-8?B?TDlTcjJjV0RTQmVsM0JKRXFZTWFUNlBlSElSQzNLYU0wV00zSDJ2M0ZxcGYv?=
 =?utf-8?B?clRiTHk5ckdUYWo4R0FLVnJib0RnZUdRQ2JUeWVDM1ZQbGEybDgvWGxmL0Fp?=
 =?utf-8?B?UnM2ZE44anZPM01aZ0xXMHNjdk5CNkNUR0ZyRXZ3c2FCckpMT1BZT3JhVkZt?=
 =?utf-8?B?RVp3NXJ3LzlMRzg4T0hpdHREb0hLNVdBeDlTR1NsNVc2WWNjdHgyUWZ0L1N1?=
 =?utf-8?B?QVQvUGRFam8yVjVrVXE2MUpSL2EzaGdCL1lNaFJnbVdJTnBXTEJwVDhwTHFt?=
 =?utf-8?B?eU5xS2QyeDB3SHU1TW50WEErQTd1eUsvTmpBTlAzaFdqckRFMkdOMHdxS1FG?=
 =?utf-8?B?QXQyTW1zcFlVLzh4elV1dmxrSktrQis5aXp4NFMzaUxQQjd2SGNUTnNaTVND?=
 =?utf-8?B?QzVEM2g5UHNBQ3QxQ3lMbkhEYU9BPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dl5l8VWK1c8XWrDJYkZ5C5knU/PPCtEgOeMcQcPTDH+CICygLrrdBq7bRNyw//UmrCL12SsYWQg0w+9N1j6feZPnYUMl6NkSPvvrEKZWGf1XkKOd/eP6yYcR+EEBAGutpH2bnZ3nDWSKY6B/axsaZYfORyuCt5YRAoWjiYOAaBT7i35RTtbdI5CsDHyzhpF2poUEVeeD7aA/Iw+UxEu0FwWpe7NvLzPOIiGlz0EdnvCuW4LHnU7gCT6knR54cJE+VESX6q/Qi28btC/FK3bNHQn8N5YaL4V5k7EFQco7y8aqNy6iLm/nQaWB87E3iYsLS4Cuwr9hSzXqsNVaFHEW2Toa5W56m5mcCyqmCoHi3Wh1yCCUYE7qGxStMbliOjiBgNHWR6dgDkqMtQjly5yDhSiPaVthxZoHjGGMKBCUP0Wyydni9VdnbV5Rxs6Ck7wb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:31:52.7610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b903d6-0158-4a0e-a9a0-08de6a64fe3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8889
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 2CBD813046E
X-Rspamd-Action: no action

On 2026-02-12 04:54, Juergen Gross wrote:
> Commit e5b0a940557 ("tools/xenstored: Auto-introduce domains") broke
> xenstored live update, as init_domains() will be skipped when live
> update is detected to have happened. This will leave priv_domid and
> store_domid set as invalid.
> 
> Fix that by calling init_domains() in live update case, too. In case
> of live update skip introducing any found domains, as this will be done
> when reading the live update state.
> 
> Fixes: e5b0a940557 ("tools/xenstored: Auto-introduce domains")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

