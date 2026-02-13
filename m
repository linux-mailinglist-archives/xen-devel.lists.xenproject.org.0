Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAM7MWekj2nASAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 23:23:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9FA139C7C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 23:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231941.1536860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr1Z5-00038X-0G; Fri, 13 Feb 2026 22:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231941.1536860; Fri, 13 Feb 2026 22:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr1Z4-00036R-TX; Fri, 13 Feb 2026 22:23:06 +0000
Received: by outflank-mailman (input) for mailman id 1231941;
 Fri, 13 Feb 2026 22:23:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CvVf=AR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1vr1Z3-00036L-Cm
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 22:23:05 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d521e89-092a-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 23:22:59 +0100 (CET)
Received: from CH0PR03CA0317.namprd03.prod.outlook.com (2603:10b6:610:118::12)
 by PH7PR12MB7020.namprd12.prod.outlook.com (2603:10b6:510:1ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 22:22:50 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::6a) by CH0PR03CA0317.outlook.office365.com
 (2603:10b6:610:118::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.14 via Frontend Transport; Fri,
 13 Feb 2026 22:22:30 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 22:22:49 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 16:22:48 -0600
Received: from [10.135.199.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 13 Feb 2026 16:22:45 -0600
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
X-Inumbo-ID: 8d521e89-092a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VeUN6827exHayBjS5s1VZlVEyc/5kOQLC4XT52aw3sjtlie8jVgU43zcJhp/5jZPbQ7LAwcATlvOQ5CbwDXv7RHmMgW1MnsjcOkbYP9/43Sh+CBc97z7b3jrQFg5V0aPXMse/CgjPZbE168EE1P6VuUFjOCW+3w0YTjO81jVL0YjhANWWLMs1lO533MXwzSeZYndpI5WvlOz54zLR9rkLs2PxvaNaVJJ9NBwjl1jC8uE0bYBjhZTpzmv6pXy7yWea9nx6+wqUQGn7J7FeYg60NGyHesGXWipMzL670TG+jrFL8+rptxpvfAsEPYtzLGRllwprvRiRT42qywix3FHVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A41s0md40ekXWZaCz2dvuo/qHIJ1H6YJz8Gldl36pHg=;
 b=r1oFI6hJ3gfwLHaQRzLUFDSK7iZVkw3zyNnHGIyQC73tFW5tCtDPIx+3V2keYSWMAGIB6Tf++9rZY6CnXihb0+07kCo6gW346knK4DhY6eXwwWRT4EZyi3GSYaTYQpzNOyEo6vLkeQ+JDgCF7MeMBgBtc1Og/YJgpvbQubRW15c8lAtgvo7gpfREsqkhhqY8cgw1X12nzHSUDWXH2JlTlZHlt4OcRhkIuxCyq1Eu5ZOepZpCaf4STrEAdKBezqHcmOtxGvi5q3crq/hWiBUJML1b2cNtGJMwbwkmsAfW8RrB5Xlmar8VvbCZ23zbowzBfOfbVF3+teME9JqSmZfrPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A41s0md40ekXWZaCz2dvuo/qHIJ1H6YJz8Gldl36pHg=;
 b=c6BqbcyIUb5xX5prgUIXaRs8uYaYUTS+uWbHTAXCBJJ8PqSIATQUZIlMuEVZX427Rd7cM0B6vjbgUlrw39zzdyKoN/3SZBar5DLLkCOsC2z/vBn8pqFIArfykyRKk8l0d5SZstLybQ8umwWA+Dq8bahyLedywWZ4V0BRh1JKgMM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <948645cb-d08e-4ef1-b2df-8d9786fbc1b3@amd.com>
Date: Fri, 13 Feb 2026 22:22:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm/mpu: implement setup_virt_paging for MPU system
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Penny Zheng <Penny.Zheng@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei
 Chen <Wei.Chen@arm.com>, Hari Limaye <Hari.Limaye@arm.com>
References: <20260206090155.68466-1-harry.ramsey@arm.com>
 <20260206090155.68466-2-harry.ramsey@arm.com>
 <49fd6b8c-5a6e-4914-a3e4-80ede233ac93@amd.com>
 <044B5E7A-7DF4-46B0-B235-B4DE7FBE7E10@arm.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <044B5E7A-7DF4-46B0-B235-B4DE7FBE7E10@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|PH7PR12MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f605e1-93d8-4547-bccc-08de6b4e6c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1N2eGRTK1ZVV2FSbWZoQkdiSnkvWGxSWWRHcUd4RzVmbTlwSWVxWVo5Uk9K?=
 =?utf-8?B?Z0MzVFdvNTFSMm83MnJ0N2M0UUI1Vk5nOTdscjhiMTNVZnNoMXBmVEE5MDRH?=
 =?utf-8?B?TklFNmo3RldOSTMwNHhURzhIYk5FZkxwQUo4NjhJRDRqMDdKYUNleDUwZkFp?=
 =?utf-8?B?dmZ6U2xsOGlsTk5Yc1RuTTNqNDJWYzFTck9BSENtQ0ZyRDIzVVVnQnlhRDhF?=
 =?utf-8?B?VFNlTXl0RStkaWxaK2Z3QnVTTUtNZENzY0RoUENCY2VhVGRwN0dJTTBqZlBD?=
 =?utf-8?B?QlB2YlpWc1l2bmZzUlhFbGpaWXZoY2sreUxOQTYrSVcybVFSSWZuUnBibVdR?=
 =?utf-8?B?S1BaWnR1WmdnQVl6QlBUNnhoN2tHYmEwaWRCU0U2VVZxYmIxZWxmWWVaQXhp?=
 =?utf-8?B?MENnd0w5UDd1eGdCQ25ldFkxM1YzbDZhWWRmU1B3aWFENjlrbXh3S0czMXJ4?=
 =?utf-8?B?RjdEekI2SVFxVCtXQnFWV0paeWJ2SjFseVJjVFBYUFBVdVJWdFRUQWVqQ2tE?=
 =?utf-8?B?dWNmL0xidXFhOUdNeUV5K05LWDNzaUo1Y2NpWmNmaSsrdzErQ0t4aSt5S2tB?=
 =?utf-8?B?RGhmNjU1SlVUVUFzbDNWQml1WUFvUEFPM21GZU5scXE1cklKY0JVWnFwbTE0?=
 =?utf-8?B?RHl3N01sL0t2M1o2TWc3QVZPMmxTdk5pblF2YjZ4enprTGZlNGdkaVF5aG5q?=
 =?utf-8?B?bzYwVFBXSHEyc1NLZjU3ZWJsV1dVZExNenFXRGNWdmo2dE01YzRtYmJjMTdj?=
 =?utf-8?B?K3EzK3IwNmh0TnNLKzRRcHRpUkNHcGJVVCs2citWZ2UyOFg2SWFvYnNRdHRq?=
 =?utf-8?B?MlVWU3RpNWFDZWNQdXhPUm9TTUhLRTR4b0VlZXdVQ2xmcG0yR1ViK0xwRnUx?=
 =?utf-8?B?RGdXSTNQZDJSNGdUU21lVWdSUEl2am55eXBIUndIL0xRUWdnRFRBZVZQWmNL?=
 =?utf-8?B?bTk3eGZHVkwxQm50aUFoSzFsc1hzb2xPdm0rQjcxSU5rWGNUU1pPMTRyblRY?=
 =?utf-8?B?WCtCM2hVS3VOaUtoRzIwUEJ3Nk11a1FYUEh3clFWZWNITXJEc3p4dGQ1bGNW?=
 =?utf-8?B?ekNtSDdSWUd5M3c5Z0F0UHZsWXVpY3RPdldra3JlRkdraWxsMTFFOUNYYjdR?=
 =?utf-8?B?bCtsdjNsZXRiQ29qdVQxakgya1ZENVVNY2lmWVJ4NU8wNTVKM0htQzVxS0c1?=
 =?utf-8?B?YXprTnNPMno3a0l4dVM5UWNvOWhrV0I2QWw0c0xZYWc5c3hXbUhmc2ZjNGhY?=
 =?utf-8?B?dUpBVStFL1JUSGdFZlN0UVpNWjdoY1g0N1pQOTh4bklUZGJ1K01uVnpoYUdT?=
 =?utf-8?B?RVNFOU04cDBCWlFvdmlwbVFPVTlGUXVBSXpHTWloTWpRQWpDS09YYTBlNzJ4?=
 =?utf-8?B?Q0xPelpLbEFIbnBqOUR6cjg2UXZscnB1dnRpeEZYZ056TFZpbzF5cjRBa0lt?=
 =?utf-8?B?bmt6bGVJRVk0ZzN4QXVob2ttVEdTS2RqR2FlMStzUktIYk9DSDdnMjB5WmZJ?=
 =?utf-8?B?elhhMmh5c3dYMCtlcDZsQWFoVHhPeloxdWF4YTY3Nmk1MmxabmZzVWJXaFhY?=
 =?utf-8?B?RDc1a1YzcFFIWGtZYXBHVUlhYSsyOEQ2MGF1OW9Cb2lPVDBHaHZGN3BXUWhG?=
 =?utf-8?B?K3BMNmp2SlVVWHVBWCs4RCtwamQ0ci94Y3JGREFhVWx5dFRnbXYyWGhXblFV?=
 =?utf-8?B?WDMyRHlVL042RnRSOG9sbEpMTDIvRDhXaFNKNWdkWk4ydFVqbTV6KzRzT0g1?=
 =?utf-8?B?dlo3RGROWEJEK25aVXJRNVVpVkc2RU5WeUlBbjQ1T2NhNzNKYUtQTGUyTCtJ?=
 =?utf-8?B?Z2tPSUIwZEcwczVST1VMTlhBQkRhMjZSaTUyZmNvaG8wK3RNbFVBcjlBd1gx?=
 =?utf-8?B?V09nT3lZYUFXR1RxNE52ekVPejR5K3Vja3V5K0pId0NObEVCRGZLSmhPYXdp?=
 =?utf-8?B?WVUxSGNXb1RKSjFwZXVyVjNKVDZhVlI5bWZMT1AvZFBoU0dJa1FkMHg5VUY5?=
 =?utf-8?B?ZDNMTi93dDR6OGo4NGpSakhxMXk1Sm53VTBGenN3eEVrSzRRcUpWUVZWSXF1?=
 =?utf-8?B?b2NpN1FVT00vMHg1VkZRa2c4ajQ2cStiVHFnRERJOFdyZWdVb0I4MTBjRy9J?=
 =?utf-8?B?eGpTeEV0ZVFWY3pJUm9GcGROQ3B3b0t6NUdBRjQxTmlTQkFwdENaQXZGOHZE?=
 =?utf-8?B?Tkw1dmhxSnBlN3JNb291cmpiSmR4c0pZK2k4MGZUTDI1SjBXRUxNUndRWHhS?=
 =?utf-8?B?TGN4MmJwNlpnNDRIaU1FeTQzUThRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZMeyqIvp+FUI8R5YM4zae48J1b9+sT+dz6MeeR+CiWRvO3StKa1Q90YwvkszPxZL5ift2v3RRH5NtFNXx5C6vWCCsnJhxBk9j1rFak6mzfx/wyRltpuMK7ESJZr0Apr0CLlcOzD2Pu0UPFTOdP4rrSHIlQ10MhMl6dd/4Xx5Hd4o6q5EwyY9bOnapw8TS0pcIK4FFwChdxz3ZPrf3bSkJOJjkNTyqdAmZqg4/IeimKqhM3hEwUs5qVNQAVA4OILthV8rRP4XaBe3EfCq+G1cMsnu6QOlBH3J2KNlg3nlNpgf1Jh0FQigC5npusaS/gV48vW6uEQYvTbewVjsgMDzp7dUNXEbuQ+6ibUPqXIbzk42GTuO4ZYS+NLbciZOl6YPJPyPglnbIixkU0uE7c4dEQE5m8zkwUVDg60dxPmaDqQN6Kii6cFjtYfkkeNM8vLx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 22:22:49.9449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f605e1-93d8-4547-bccc-08de6b4e6c31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7020
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
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:Harry.Ramsey@arm.com,m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:Wei.Chen@arm.com,m:Hari.Limaye@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,vstcr_el2.sa:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 0B9FA139C7C
X-Rspamd-Action: no action


On 13/02/2026 09:19, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>>>     void __init setup_virt_paging(void)
>>>   {
>>> -    BUG_ON("unimplemented");
>>> +    uint64_t vtcr_el2 = READ_SYSREG(VTCR_EL2),
>> I think this register is redefined for R82 . See
>>
>> https://developer.arm.com/documentation/102670/0301/AArch64-registers/AArch64-register-descriptions/AArch64-Generic-System-control-register-description/VTCR-EL2--Virtualization-Translation-Control-Register?lang=en . So
>>
>>>   vstcr_el2 = READ_SYSREG(VSTCR_EL2);
>>> +
>>> +    /* PA size */
>>> +    const unsigned int pa_range_info[] = {32, 36, 40, 42, 44, 48, 52, 0,
>>> +                                          /* Invalid */};
>>> +
>>> +    /*
>>> +     * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
>>> +     * with IPA bits == PA bits, compare against "pabits".
>>> +     */
>>> +    if ( pa_range_info[system_cpuinfo.mm64.pa_range] < p2m_ipa_bits )
>>> +        p2m_ipa_bits = pa_range_info[system_cpuinfo.mm64.pa_range];
>>> +
>>> +    /*
>>> +     * Clear VTCR_EL2.NSA bit to configure non-secure stage 2 translation output
>>> +     * address space to access the Secure PA space as Armv8r only implements
>>> +     * secure state.
>>> +     */
>>> +    vtcr_el2 &= ~VTCR_NSA;
>> But the TRM says this
>>
>> This bit behaves as 1 for all purposes other than reading back the value of the bit when the value of AArch64-VSTCR_EL2.SA is 1.
>>
>> So shouldn't we keep it as 1.
>>
> The way I’m reading the armv8-r aarch64 reference manual [1] is that if we set
> VSTCR_EL2.SA to 0, we need to clear also this one.
>
>
>>> +
>>> +    /*
>>> +     * The MSA and MSA_frac fields in the ID_AA64MMFR0_EL1 register identify the
>>> +     * memory system configurations supported. In Armv8-R AArch64, the
>>> +     * only permitted value for ID_AA64MMFR0_EL1.MSA is 0b1111.
>>> +     */
>>> +    if ( system_cpuinfo.mm64.msa != MM64_MSA_PMSA_SUPPORT )
>>> +        goto fault;
>>> +
>>> +    /* Permitted values for ID_AA64MMFR0_EL1.MSA_frac are 0b0001 and 0b0010. */
>>> +    if ( system_cpuinfo.mm64.msa_frac == MM64_MSA_FRAC_NONE_SUPPORT )
>>> +        goto fault;
>>> +
>>> +    /*
>>> +     * cpuinfo sanitization makes sure we support 16bits VMID only if all cores
>>> +     * are supporting it.
>>> +     */
>>> +    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
>>> +        max_vmid = MAX_VMID_16_BIT;
>>> +
>>> +    /* Set the VS bit only if 16 bit VMID is supported. */
>>> +    if ( max_vmid == MAX_VMID_16_BIT )
>>> +        vtcr_el2 |= VTCR_VS;
>> this field does not exist.
> yes this exists in armv8-r aarch64 [1]
>
>>> +/* Not used on MPU system */
>>>   static inline void p2m_clear_root_pages(struct p2m_domain *p2m) {}
>>>     static inline void p2m_tlb_flush_sync(struct p2m_domain *p2m) {}
>>> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
>>> index 010ce8c9eb..ed1b6dd40f 100644
>>> --- a/xen/arch/arm/include/asm/p2m.h
>>> +++ b/xen/arch/arm/include/asm/p2m.h
>>> @@ -48,8 +48,13 @@ struct p2m_domain {
>>>       /* Current VMID in use */
>>>       uint16_t vmid;
>>>   +#ifdef CONFIG_MMU
>>>       /* Current Translation Table Base Register for the p2m */
>>>       uint64_t vttbr;
>>> +#else
>>> +    /* Current Virtualization System Control Register for the p2m */
>>> +    register_t vsctlr;
>> This exist only for Arm64 MPU. Should we enclose this in ARM_64  ?
> I can see it exists in armv8-r aarch32 [2].

In that case,

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Sorry for the false alarm.

- Ayan


