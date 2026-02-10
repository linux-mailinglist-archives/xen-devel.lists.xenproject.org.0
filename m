Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFTMJcwCi2kOPQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:05:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED11195DF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226166.1532693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpkbW-0004AM-O7; Tue, 10 Feb 2026 10:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226166.1532693; Tue, 10 Feb 2026 10:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpkbW-00047I-Kw; Tue, 10 Feb 2026 10:04:22 +0000
Received: by outflank-mailman (input) for mailman id 1226166;
 Tue, 10 Feb 2026 10:04:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBUt=AO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpkbV-00047C-NX
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 10:04:21 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd46a32b-0667-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 11:04:19 +0100 (CET)
Received: from SN7PR04CA0110.namprd04.prod.outlook.com (2603:10b6:806:122::25)
 by CH3PR12MB9077.namprd12.prod.outlook.com (2603:10b6:610:1a2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 10:04:11 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:122:cafe::a1) by SN7PR04CA0110.outlook.office365.com
 (2603:10b6:806:122::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 10:04:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 10:04:11 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 04:04:09 -0600
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
X-Inumbo-ID: dd46a32b-0667-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtulc5X808Xq4tXnJx7wUDwMVOlzRPZNxynd0abYno4hAYTtjr3ZC8UZzYZqfcZG0EPlYxeEoApdSw3OO0d7/jjJ7ZehQ1YEA43J6yeTAiURUo6vSr+dSBhyuQfjR8dG9O6SA31SapKZxpBvVDMj4lt0/6b/Xge/tePSiBOUtZWjuB/9JA+ZDXnmty3dOR+Y7NB341rkrIVg2Se/8LlAgQK5Q7PT9qO4mq7jaErU9zJaoKyr9aEi7DuOtFXSLKQuVOIYe8SunM9hb9rz8Mk9kwoAqJLve3u3RYNDW6txUzRD5Ra4LCHPU/PIEZvDJzZhWTG1nDGmjJPUoNXN+42MTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvhYazLK+71/kv/S3vQzET4ZVI5R2dafFeM/uDoiKnA=;
 b=bYBN+HGOeMvH7jEKEGwCfkTMCj/0sGdnGm5JgUU+8Lhz+PhVKyMPy18gHlLcBVtcTAbchfoYGK/D2sXxraqhiwe0qD3YLlepyi6FQBmRseqAsWIH4KsPhs9kpZAr1tflEBx4R/gJcX2i7QolQSss+JCKKY+JJ9Chc64iZTdra4+DoOi7lp8EV2n7MYhnL8ep+p4wTT3DTDUmFos+PxXUvp81tb8ZAMo1STnq+a6BrrJ1UNHs6vglUFsSd5rsy9TAdRxO+HvXuyz27ZrPBL64ATC43Pi1tZG3/78ODJjS4benVtsdSgTVrJVhlBe1tc9cY92O66L2hGRVrqWiIzp9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvhYazLK+71/kv/S3vQzET4ZVI5R2dafFeM/uDoiKnA=;
 b=bXaOL50OH2CCH5wvMp9DYanZ0IyuXkDgrMqo+BDWIZ/4zD9b5ST3k96FVcTVCGT2gjmm5Eesd7XUbokcDS2Svsq1ie7aOFkbcOw6NPZ6mb/zEjzfJpimlajGCvLECgGxq6tCGEH/lRd2f2zyflW1etV/YaSBCRROHDvcEuS0EMY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Feb 2026 11:04:03 +0100
Message-ID: <DGB737H1X57K.W7JIW1QG8RX3@amd.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 02/12] x86: Add more granularity to the vendors in
 Kconfig
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-3-alejandro.garciavallejo@amd.com>
 <aYrrrLuDXuOffsgx@Mac.lan>
In-Reply-To: <aYrrrLuDXuOffsgx@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|CH3PR12MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ddeb9b5-1f8a-4db0-91ea-08de688bbd20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rkc5d2p5amlFdVFDeFRwZEhlRVBWdjR3dllMVVp4VkxuL2ZlSVRuQ0pKV2pC?=
 =?utf-8?B?QThONVpMMVpVbjE0aiswbjk2d3ByTzRRTUF3ZjVyLzlHRW9qSGdaVmtMOC83?=
 =?utf-8?B?SHo4R0NuVkQxcEp4MWx4bHZicmtwNmNDcENHYm94c3ZFRkw3Y1hCNDErRGhk?=
 =?utf-8?B?RXVRN3VPdDN5dTZGN3RSc3VvUEFNM3BPTHZjc1J1WGl0ZWs2N1Q5OC90SU51?=
 =?utf-8?B?eTdNV2p1VENVOXhuUHdjZ2pkdFRwN21QN1hhc29LV1BqdHNZUEVlMEFmMjUz?=
 =?utf-8?B?WEJWaThUQ3ZFVDhhRW1xaU9EVGdmL1JkbUJobE1rQ1pCTjVObXdMWGFWNjRl?=
 =?utf-8?B?d1RLZUdpdHV4bVNmU29HandqVGI4S2VxYlVEOE96b1VoTVNXRmxRN2ZWb3hU?=
 =?utf-8?B?MndKbE9DNGEzdy9XZWZTbzlrMFZPWStWRis4K0V0UE1rK0R6Q1ZjaTRIS1Nr?=
 =?utf-8?B?TmhZTWpaZStrU3VlSzdBaU9CRXJidkQySm5jNWdjRlo3a2hlbCtic0RVM1lT?=
 =?utf-8?B?bU01Zyt5Y0phWlR0UFVUdGRRNDJpZWZUMlZROEphaFJaeGkwREtnRlhiNXlr?=
 =?utf-8?B?Z1BIWkpWWmFDMnlvd3NVN2J6VVFkYmkxeGdqdXFseVBsaG81bkpNMlZIdmx6?=
 =?utf-8?B?ZlNiQW80c2Zqam9sb3E3d2ZOcmhlNnd0RTcyOGphVHhrZXpzVmZEOU1kd1hK?=
 =?utf-8?B?NUlmZkp0V2dqZTJVTnBIU1hXVnNibnBnOEd1dGpHZUVHN25aWVQxVjZ5SUJw?=
 =?utf-8?B?azA2YnJXcmhKTHU3ZXJBZm5IK2drMnVRRkNPKzFwUUZodWl6VENsUVF1K2JN?=
 =?utf-8?B?WGVKQVFOajdVVU1iRDVEdmc0NzNpVUFXN2piNFNOUXZWNFlzM0VOekEvMDgv?=
 =?utf-8?B?NEYrNjJLdGVIdGJkckVUamZhblhaOEtyaEJNYTRQRi9nSXg0bEs1U3RVK1Bq?=
 =?utf-8?B?RzkzSFJ5SlNzS1NmMWRhZlN6dHFUSytkK1VRSVVpNjdiT01DQXdvU25KOFdi?=
 =?utf-8?B?UGw5eTRkMS9tUWkzS3BPbzkwQ3FvV0ZxdkJEWlFibTBHTXRMdWFtenlURGh2?=
 =?utf-8?B?KzFCZWlqa2dVbkxkRnE2cm5wd2FQTmhqd2ZVUG1nRk5jb2U4S2N5RFNxcFp5?=
 =?utf-8?B?WFdyS2pXcHJhTitSdGp0ZmRxRm1KemdXTThRU0xLVEkyOUR4bjRYREVhZXB6?=
 =?utf-8?B?NTcyQzI1cE02ZHg4UXVmdGxsYitkbThsU3ZCRERXR2lJbk02NkpoVjBPOFNo?=
 =?utf-8?B?elhXMUJKL3NYWkErZTUwSWRNS0pjZ004QnBJcGVnb3FabEJyWFZacG1CdVdW?=
 =?utf-8?B?L3VQSG9IOHB2TGhuQ000RU5WdnpSUTJ2TUhCSTNZUlVUbDYybUtRcXhLUE5t?=
 =?utf-8?B?UHJNK0FGTW8yMk8wZThUYzk1bjBMU2pKc3NET1BZVjEvZUovSFV5WTYrci9j?=
 =?utf-8?B?ZW9SSW04Zm16RXA2b2RGMW80UzRnYzZPcnZ3elVvb0x5eUx5TjluL2xRV3Vo?=
 =?utf-8?B?TlJhR2FwdllGMGdZajVBM2dCM3QvM3Z1Z1ZnME1rakxteXJEUFJ0OTFlWUFT?=
 =?utf-8?B?UDh0WDcwZGhVaUpsMjBOUXNkeWNubE9CM3FCczdleEJrUzFxZldMYXZkVFRi?=
 =?utf-8?B?N1doYnFOOE1Pc21jSXB6SG9mYlUrQlo5QVFVOGdCdndYdjRFYXBqd2lGdXgz?=
 =?utf-8?B?azlMTmk3enlTZ2diVXNicENGNjJRSG0vOTAxS25qOFZPdEE5Y2drNENTQllB?=
 =?utf-8?B?M2N1V2VZMjg3UTAzWm9KVEVSdkM2dVJrMDd0c0dFSlozUEJ3T0xjZTExYkFL?=
 =?utf-8?B?RFUzaE0wV3NiSUVQMWt4ZlR2QXE0cFRoKy9Qd3UwdFkvem8vLzZML3dIVysz?=
 =?utf-8?B?OC9JWDZ0TjNzVDVoL2FCTUlHV2ptZlZweHJsUXBONzM5RklQYjdtZnNWeDdS?=
 =?utf-8?B?b0JiTXcyaDNYOXhiTGh1VjFYaWJ0ZlpVcE1MU3VaOEtNSHBBWGV2RGZON1NN?=
 =?utf-8?B?M1NhdXUvcFlGQ0dYaFVuQ2ZhNGRyYkJzUHE2REhxQjd0OTdpZzNsTklnMFE2?=
 =?utf-8?B?cFh2YXQ4aEZITWlLOExwVk1vKzFFMnNQNGNtdUg5TzRhM045U0sxS09Ob01G?=
 =?utf-8?B?aUlnL3JKcXo4bkRsVDhIa0NrQ2wvVXlveTNtZ2l1a2wyaDdvUElxWkNuTDFP?=
 =?utf-8?B?R3FUN0RhTzZ1UHVpaDNIVkFjNVZpLzNjeHFMS2QzeVBIYUN4UGhaUVFvSTdn?=
 =?utf-8?B?RWJ4RTN6WGJMemhXSDdLYmY0NkRBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2/98/WrDAG4bZCv3YHuQrWlL4InmEPEGjI+9TwG/4nlUcGGERcxo53Q6Hcu3v3bfyDQ/ljFTSHJ9AGMxC72axnOvkNYUf+WF0J8gr4Ek+pXMwbseC+pUr2shPJDB9xoGVXEuVsPOrqeDsnK3ilr5Lt9B5xQ0t9i/3tZpc247ZiDw4D/rEy659glD0pdchzcvWoM0zFp3dsyKwvISjqi2gL2Dx35TTOPDB30y2FJOGngxUgrHLb1kItnttPnrirNIy/CzhFQ8jfDtotSwAD6l2Nu9m0BH4o2G9av5b1Kr0Z2PJsVks4oqVBLOCyzIcqjN2oWqg8/+IYjSdkzzm1DF4euLTLhRfWMzG9CjJipoEeVTMvN8/eTSxStGcNfBx+TzzGXSf0oZMTexNFLV5olyrUhbNXsZXuEzjJerYAPXdDdkCPmk32gcbbjY9am9HrN3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:04:11.5347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ddeb9b5-1f8a-4db0-91ea-08de688bbd20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9077
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E6ED11195DF
X-Rspamd-Action: no action

On Tue Feb 10, 2026 at 9:26 AM CET, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 06, 2026 at 05:15:24PM +0100, Alejandro Vallejo wrote:
>> This enables very aggressive DCE passes on single-vendor builds in later
>> patches, as it will allow most vendor checks to become statically chosen
>> branches. A lot of statics go away and a lot more inlining will be allow=
ed.
>>=20
>> A prerequisite for such optimisation is to expand Kconfig to have the
>> full set of vendors. Adds Hygon, Centaur, Shanghai and the unknown-vendo=
r
>> path. Have Hygon select AMD, and Centaur|Shanghai select Intel.
>>=20
>> Not a functional change.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>> rfc -> v1:
>>   * s/depends on/select/
>>   * s/UNKNOWN_CPU/UNKNOWN_CPU_VENDOR/
>>   * Removed "if unsure, say Y"
>> ---
>>  xen/arch/x86/Kconfig.cpu  | 43 +++++++++++++++++++++++++++++++++++++++
>>  xen/arch/x86/cpu/Makefile |  6 +++---
>>  2 files changed, 46 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
>> index 5fb18db1aa..f895cfe97a 100644
>> --- a/xen/arch/x86/Kconfig.cpu
>> +++ b/xen/arch/x86/Kconfig.cpu
>> @@ -19,4 +19,47 @@ config INTEL
>>  	  May be turned off in builds targetting other vendors.  Otherwise,
>>  	  must be enabled for Xen to work suitably on Intel platforms.
>> =20
>> +config HYGON
>> +	bool "Support Hygon CPUs"
>> +	select AMD
>> +	default y
>> +	help
>> +	  Detection, tunings and quirks for Hygon platforms.
>> +
>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>> +	  must be enabled for Xen to work suitably on Hygon platforms.
>> +
>> +
>> +config CENTAUR
>> +	bool "Support Centaur CPUs"
>> +	select INTEL
>> +	default y
>> +	help
>> +	  Detection, tunings and quirks for Centaur platforms.
>> +
>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>> +	  must be enabled for Xen to work suitably on Centaur platforms.
>> +
>> +config SHANGHAI
>> +	bool "Support Shanghai CPUs"
>> +	select INTEL
>> +	default y
>> +	help
>> +	  Detection, tunings and quirks for Shanghai platforms.
>> +
>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>> +	  must be enabled for Xen to work suitably on Shanghai platforms.
>> +
>> +config UNKNOWN_CPU_VENDOR
>> +	bool "Support unknown CPU vendors"
>> +	default y
>> +	help
>> +	  This option prevents a panic on boot when the host CPU vendor isn't
>> +	  supported by going into a legacy compatibility mode and not applying
>> +	  any relevant tunings or quirks.
>> +
>> +	  Not selecting this options while selecting multiple vendors doesn't =
have
>> +	  any major effect on code size, but selecting a single vendor with th=
is
>> +	  option cleared produces a much smaller build.
>> +
>>  endmenu
>> diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
>> index 7cfe28b7ec..84b060aa41 100644
>> --- a/xen/arch/x86/cpu/Makefile
>> +++ b/xen/arch/x86/cpu/Makefile
>> @@ -3,13 +3,13 @@ obj-y +=3D microcode/
>>  obj-y +=3D mtrr/
>> =20
>>  obj-y +=3D amd.o
>> -obj-y +=3D centaur.o
>> +obj-$(CONFIG_CENTAUR) +=3D centaur.o
>
> Maybe I'm missing some context here, but I think this would break the
> build?
>
> cpu/centaur.c exports centaur_cpu_dev which is referenced from
> cpu/common.c, and I don't see you making that reference in
> cpu/common.c conditional to CONFIG_CENTAUR being defined?
>
> I think the same applies to Hygon and Shanghai.
>
> Thanks, Roger.

Hmm. Yes, these hunks go on the following patch for bisectability. They wor=
k due
to the AND operation at the switch condition.

Cheers,
Alejandro

