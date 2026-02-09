Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0C6hLdD+iWluFQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:35:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2445D111F2A
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:35:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225625.1532168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTIM-0002tB-S0; Mon, 09 Feb 2026 15:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225625.1532168; Mon, 09 Feb 2026 15:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTIM-0002qv-PG; Mon, 09 Feb 2026 15:35:26 +0000
Received: by outflank-mailman (input) for mailman id 1225625;
 Mon, 09 Feb 2026 15:35:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EeIc=AN=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpTIM-0002qp-8H
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 15:35:26 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f02a1dc2-05cc-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 16:35:20 +0100 (CET)
Received: from BN9PR03CA0387.namprd03.prod.outlook.com (2603:10b6:408:f7::32)
 by PH7PR12MB7987.namprd12.prod.outlook.com (2603:10b6:510:27c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 15:35:13 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::7d) by BN9PR03CA0387.outlook.office365.com
 (2603:10b6:408:f7::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 15:34:43 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 15:35:12 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 09:35:11 -0600
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
X-Inumbo-ID: f02a1dc2-05cc-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/Q14n78t+YsiK4DcB85dSUvRYoqSQgyZ6CYQs5PdLcSe1Ia+grMp+2iaxegQXoiLuanE1H+nAf0QI6YtaJ6r8SD42mT1aM0sAPo18HgEUcUU1Rg5eZz9XCLswoQ37Ou4R3a1YT9D8aqWSobJAC77Ql7Xz+bruyWGiztrnt4reyQyM0eve6nzMQyQXvhov9UuYulAgnXsTCEFA2N0xC5siO4uPLpeUXIsq6/2bqLTQcd4E8uUdumPENr8ibKm9nzLyUUlxqyhM7FYpB9q+cxY5ikrAdpndxsjuKlDNUJuz2hG2F18lXK1Pbdc7Z1+57241u9EQAgFihbG3Vk8eQDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98474JdQkV6HVWnwOuDmjpttYAaOW/uXN/Vxd1s/O5g=;
 b=vFg91qXN+KCbXjOp/DEeLRPf+KjhzoKPB6PXefGMU61QnfwqggUZpYAElVJWorRSbzZraDhp1yxqicBpQUuo5ZENGtbBC86hUh+EB8dpdJpt1Kq2xLBaOfRV+XF0PFAjyk7O+HSZj46AVbRm7BMZBo+E7kEFBVKIporIaB0I7NhgzlVa0giERJVrWSGAKotGElF0BvN/fV8HFY8DJaaNUA+KIkvjy8lgw2pAqgUTQ9ACU1gqwopyGFD2mPA7S1dt7wreohqQOVyAmYhfKzkfCqPdE5iHdUlHNCE8z6J6E4gmfuX+5AyizaeUcBndYUvunqrx6vr9xkR6Okoxi/ssAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98474JdQkV6HVWnwOuDmjpttYAaOW/uXN/Vxd1s/O5g=;
 b=PbH/W663rUMZArcZwbt1zp2FFfUcsKikc/pYnLW7miVNqJdSnlU0hsamOoaUhSbpXbP4844Pr5UfLYeuKcjnhoR7d7n3RiUUcbFAmnYMN4DFMlNEUnkjCWWn8Z/H3i5kRITe7e71uiSvs+46ENL9BIFP1XGu5kCJaR2MKOZtSvY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Feb 2026 16:35:04 +0100
Message-ID: <DGAJI3UYR98J.FU94VABOFZ5N@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH] x86/shadow: Delete the none.c dummy file
X-Mailer: aerc 0.20.1
References: <20260209104104.7840-1-alejandro.garciavallejo@amd.com>
 <aYnyY2MArv4vTXsY@Mac.lan>
In-Reply-To: <aYnyY2MArv4vTXsY@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|PH7PR12MB7987:EE_
X-MS-Office365-Filtering-Correlation-Id: cbadc5fe-5907-46c3-ff53-08de67f0d0c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S255aWh2S1F5cDdKa1E3Y25USXJpVHlGN1AxT25xMHdnQ2J6ckQ1R1R0ckda?=
 =?utf-8?B?SVlPQmV5RVl0YkV2cXM2SUs2aTZVNFRmRGxEMkgwOEVxcnEvbURzTDBudlJQ?=
 =?utf-8?B?Nk9BTk5ram5RZDZOUmhMbTBpRG5yNkFJVDJCazd6bmhkNWV3cjRCUU1MQ3F4?=
 =?utf-8?B?VEYwenlvTzZKRnVHUjZabWMrNFNxc2RLaUpjQWwrVEhWdjkrYndzMzhuL0ln?=
 =?utf-8?B?M241MHVmS1R6TW5hWHI3U21QMVRQQ0wrMFd1cExwMXpHNmdDcVJWTDB3d1Zv?=
 =?utf-8?B?T21zOThoVEFmRDBEWWpSeGh6N0hKZWdvaWNaQmsrWmhROVlDdG1EaEswV3dh?=
 =?utf-8?B?b2xHUDNnQ29KWEV1bVh6TUsxZHlFTzYwOEhvczFhQ3F4UmJpRUZrY2lEK2hO?=
 =?utf-8?B?ZmJrUnhzRFNuakZDc1hBOEp5ajEyaW85aERlaGkrRjV3NmJweS9CUzBab0Yv?=
 =?utf-8?B?KzVYMWovaVczMmtjOXZ2dzFKZXc5bmpsdGhITDMyMzVCK25vWjlWMzBKaURT?=
 =?utf-8?B?WGVYUzdYN2ZsZkVFeWNGVG56WCtvaDVZNU9PTFY0czFJOTIwazkxRi9pbnBz?=
 =?utf-8?B?Y09yR2ZjcjA1YkdjWW5kVmNxcjgyWGZLd1JnNlpRQkcyS2dzQWgzSzFaanJh?=
 =?utf-8?B?dE5HeExjR0xyNmZPZFdNTSs4b2Y4K3Q5akRlby9PaEo0bjU2UTZ2U3M0dGRS?=
 =?utf-8?B?aWdRM2xLclBqOG44dWxadGE3UStQZjhMejl2enF4ZVNUSFVHMXdBeDhRUFoz?=
 =?utf-8?B?UUxxRmh5dXljcFFTTWxRQUtrcUFocFJvQmhsbHYvSWFqRjlIbjkrdmZQM1Rs?=
 =?utf-8?B?YUlZMjU5SVdBMlQxQzBFNGpkeUw3aFBjWVg5S2UwWkRxRlNPM2diR1dTRk9F?=
 =?utf-8?B?YXJ6bmJiZm1lelM2ZG05blpTaDJLWjY1QTRxZ1BKR3BJYTdGUlk0UmI4Zy82?=
 =?utf-8?B?UmJqYTA2M2hKcVFYN2tLd1FGbkJZRitCd2dLZUpXaGZJTWFZOVRMTDRkb0I5?=
 =?utf-8?B?dUVnbnN3T0dPUjFHL2Ira2xyalYvVE1sWll4amc2amtBeEpyRTFjVlkwcEJl?=
 =?utf-8?B?QkZGR0c2dFppVlRXcnVld2oyR2hpcWZac1pQb1BGbkhqUytHTHlDQkROVGVW?=
 =?utf-8?B?QXduYmxiQUhMRWxTZllMZHByR0xHa2owdmsvQkk2VEk4enpydnlnNHB0d2Fp?=
 =?utf-8?B?T0MrL3E3dFZMZjIrbjFvc2ljM1QzU1lUbzBWaWV4NEQzQ2pMc2V4QzhZTGs4?=
 =?utf-8?B?L0hRMkdPZTVMZWQvMmZMdlRhTFBhYS9IbDU5LzgxMEdZRVNOdTc2emtNYUFB?=
 =?utf-8?B?cHlEOWVMSDJRaHVhVFUvT0JDNnBWeUJhRjdtTGZSdEVFYVk0N0xLM2h0YVhP?=
 =?utf-8?B?RVFKOHhuZVl1NDZ5SjdXZHlWdDV4NTZiUHRSQjgvV3NMZXVIeHJqckorZ3BV?=
 =?utf-8?B?VkRxQVNzNVpRdC9sSm5INU1tblBiQi9melRZeHF2UmYwbHhic3FiQk1BMG1N?=
 =?utf-8?B?S0RHWFFKWVRGalBtWFJieS9GeE5vaUVoWWFtSWU2ZXlkZm5oa0RDNTdMUllt?=
 =?utf-8?B?TlVjS1MycXBDaTkyb0R2NzExLzFHaDdIMnY5ZmRVUUVlbUJ0WGp2NFR3S082?=
 =?utf-8?B?enJtQ0dtVnRKcnFMVlR2RjZ4QktKQU8zbklyOHNoZzQ0ZFFLRG5XM3dWRWVq?=
 =?utf-8?B?UURTK09ZNjJmZkNzaDNBaE5laDM5Wmk0SEhaeTBYZGg5c04wSVUvTkpQTTlF?=
 =?utf-8?B?OUxxbjJmeFdsUWV4VXp2OG02bEdWZTFlWlZnSTV6dEpwNWQydkV0bVZDazBm?=
 =?utf-8?B?aGRKV3FIQzBzVDZhRllvcDBIV1N2TFVMbFUvUEZyY1VWMGVnS2VTVnlIQ003?=
 =?utf-8?B?a3A2RGVRUVJBQ2p5Z2RkaWx1Wlc0NGxwNkVXY0VVV2RFZmZlbWp6dFM0OWRx?=
 =?utf-8?B?UThudGc4cEdnUlJhR2U3SVgzNzBNd3VDSUQzbHRHRWhKQnRKQ2xzd09QakYx?=
 =?utf-8?B?bWx2QXJveFQzSVUvMXFXeUVLZkFJVnpNcU02V1V2NXcwaTFRQis0ci9kSENa?=
 =?utf-8?B?eWhkY05wUVFnWG5Dc2txdTJrNmJxKzUzeWZnaUJMM21aVlgyTUtqdmJ6cU5m?=
 =?utf-8?B?S29ramxxK3ZSZ05oNWNxbmRDRXZWQ3FvbWdkeTBOQzNGVE40Rm0wakZobmZF?=
 =?utf-8?B?K0JOTGFFLzV2NDMweWVnc2gwZFZZTUNhWlRFUmdsSTYwRVJvaHpNUEIwdm5P?=
 =?utf-8?Q?gnQuyCtDrdznvRwWrRExy2ULGFRaO1xdEZrGEsE89M=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2c3msWI7kbslzs8l2VTZfvv++dKmxL2WsykYg0YleI3P5IyZnJpf5IaYToB8i/R8yHB7m8knaW6e+4CySPfdcqtZ2ppsAkfbtPms8ZBxSZKn+zm7+Go7vPacrc0B9Wt2eJe6RaM9YQ5BIP0t5STUZ+V3pu01y58HrDLG6eVggOrP91/CO32K3BxvcCALP6ZLm3PlNOvNSQmwBNiQTTkq7+Gd2XUVVC+Faw0cTLy49kW2L9KqnwKHAd7aNCIaoybl5t48GfG+pQ/At8In8eCXroSLxxXFAsrNDHkfqMEzs/gl+zmXR4UwkYeKqrw6OVwCuHCHlEXPvOsArtyWnefs/2DtLTamBGUE7r0J902m25xUf0SbF+WHSHDvSnZfn34fHg2Ocum5pWSzb5S3offxzxPBDlAhPznK/aFOEMRtpJ1nr9NgyvTPd4Jc3wkwvZfo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:35:12.5196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbadc5fe-5907-46c3-ff53-08de67f0d0c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7987
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:tim@xen.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
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
X-Rspamd-Queue-Id: 2445D111F2A
X-Rspamd-Action: no action

On Mon Feb 9, 2026 at 3:42 PM CET, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 09, 2026 at 11:41:02AM +0100, Alejandro Vallejo wrote:
>> It only has 2 callers, both of which can be conditionally removed.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>> I'd be ok conditionalising the else branch on...
>>=20
>>     IS_ENABLED(CONFIG_SHADOW_PAGING )|| IS_ENABLED(CONFIG_LOG_DIRTY)
>>=20
>> logdirty patch: https://lore.kernel.org/xen-devel/20260209103118.5885-1-=
alejandro.garciavallejo@amd.com
>>=20
>> ... to avoid the danger of stale pointers, with required changes elsewhe=
re so
>> none.c is only compiled out in that case.
>>=20
>> I'm not sure how much it matters seeing how they are all unreachable.
>> ---
>>  xen/arch/x86/mm/Makefile        |  2 +-
>>  xen/arch/x86/mm/paging.c        |  4 +-
>>  xen/arch/x86/mm/shadow/Makefile |  4 --
>>  xen/arch/x86/mm/shadow/none.c   | 77 ---------------------------------
>>  4 files changed, 3 insertions(+), 84 deletions(-)
>>  delete mode 100644 xen/arch/x86/mm/shadow/none.c
>>=20
>> diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
>> index 960f6e8409..066c4caff3 100644
>> --- a/xen/arch/x86/mm/Makefile
>> +++ b/xen/arch/x86/mm/Makefile
>> @@ -1,4 +1,4 @@
>> -obj-y +=3D shadow/
>> +obj-$(CONFIG_SHADOW_PAGING) +=3D shadow/
>>  obj-$(CONFIG_HVM) +=3D hap/
>> =20
>>  obj-$(CONFIG_ALTP2M) +=3D altp2m.o
>> diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
>> index 2396f81ad5..5f70254cec 100644
>> --- a/xen/arch/x86/mm/paging.c
>> +++ b/xen/arch/x86/mm/paging.c
>> @@ -634,7 +634,7 @@ int paging_domain_init(struct domain *d)
>>       */
>>      if ( hap_enabled(d) )
>>          hap_domain_init(d);
>> -    else
>> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>>          rc =3D shadow_domain_init(d);
>
> If you want to go this route you will need to set rc =3D -EOPNOTSUPP;
> prior to the `if ... else if` on the HVM case.

Maybe this instead

    else
        rc =3D IS_ENABLED(PV) ? shadow_domain_init(d) : -EOPNOTSUPP;

And gate none.c on PV && !SHADOW_PAGING, which seems to be the only use.

It's a lot easier to see the safety on the HVM-only case, particularly with=
...

> is compiled out, and the toolstack has not specified the HAP flag at
> domain creation you will end up with a domain that doesn't have the
> paging operations initialized as paging_domain_init() would return 0
> with neither HAP nor shadow having been setup.  That's likely to
> trigger NULL pointer dereferences inside of Xen.
>
> Also, seeing the code in arch_sanitise_domain_config() we possibly
> want to return an error at that point if toolstack attempts to create
> an HVM guest without HAP enabled, and shadow is build time disabled.
> I've sent a patch to that end.

... this patch you meantion. Thanks.

I'm guessing it's still a hot potato in for non-shadow PV, which strongly h=
ints
at our being better off leaving it in that case. On HVM-only configurations=
 it
seems rather silly.

Cheers,
Alejandro

