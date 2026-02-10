Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHs8LxhWi2lFUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:00:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC0C11CE18
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 17:00:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226578.1533091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpq9s-000888-Ug; Tue, 10 Feb 2026 16:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226578.1533091; Tue, 10 Feb 2026 16:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpq9s-00085H-Rs; Tue, 10 Feb 2026 16:00:12 +0000
Received: by outflank-mailman (input) for mailman id 1226578;
 Tue, 10 Feb 2026 16:00:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DECD=AO=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vpq9r-000859-KI
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 16:00:11 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92bc6e5d-0699-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 17:00:09 +0100 (CET)
Received: from PH8PR20CA0020.namprd20.prod.outlook.com (2603:10b6:510:23c::21)
 by MW4PR12MB8610.namprd12.prod.outlook.com (2603:10b6:303:1ef::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 16:00:03 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::2e) by PH8PR20CA0020.outlook.office365.com
 (2603:10b6:510:23c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 16:00:00 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 16:00:01 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 10:00:00 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 10:00:00 -0600
Received: from [172.26.13.86] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 10 Feb 2026 09:59:59 -0600
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
X-Inumbo-ID: 92bc6e5d-0699-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWG9mH2IsRfa058gI5k+1qn2t8ZUPxGyisKt2lr+Ays4BYP1PwOJEs7/oJWwGiAewfkBtmnZeMwkwJY0SPTbmNwz17NkYPJpy6R6+teX+OW370jeuVClE7Gay2ye1U5ILqIvoeJwll/ICI2omkXIYEp6IfOcvJrP/6YErbn0yXNMf8AVN9jGNIrkjuZXHNa5AylDrdNcE1DJTGP5NTMSBNcfEExH2wzDpv79PB98w4bSGGYGg7ic2CnuMKQxXnZm/OwviA2blFxjs7MLu3ZP8DM8hNHvUh+aT6sUt5mkoEO6obi6Jq3sZGWoBgqMLQT+zPlrWIptMZ3CA26T4GYyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56GrrR10PcykWbVX708bvTGCH0yk3C6/IRZ+B6YShKA=;
 b=siXuZcYAtrflCzR5lhu4LfVl/tmYZfx0ZC1Nqjc5bHlxU0S0hAY3ZaXqbh+sFhIyDy20R/05jEd9Wx8i34z8L5IN8vh4WQKpa2u1D+QWzy7YGgp4gqt/rNs8n7PLrHuixTQ+8yKZXVsjZlDwUrIOPZLv0k/fwB568bSVuKQcmBwdJR1krCAgSP2RrMoc+Z5nb7kbcX1WAPBIXZBz1wCq+OVvfkWi97pW8LRDLen8VA28f/NvTRVZqggFxhtLD/00SBIK2nUsJoLZ3QHRqZv0VIiEKcG/3Cg7Sf000x3v7wf+eCRgl20ffqVcT1gHaTQC5nGhcjSxWdTg8l7r0fYHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56GrrR10PcykWbVX708bvTGCH0yk3C6/IRZ+B6YShKA=;
 b=fHLlVQnzPfhlfDASvVGUwva9QOsgvky0aB6qCJIARfDBJapP3tSfAotzfIXXNlN4heGUqnxVT6jFdKHr9qNWU6f0UrvbYv2yj+75ImQe1eQg6UurwXR6PnGYb7dk+1kQA3K4bZZwEhJtXkFCe3Vs2zfHU7AWYaEcdo9lB+cHAjk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <1a25aad8-a4cc-45f2-bfa2-f96d7caccfc1@amd.com>
Date: Tue, 10 Feb 2026 10:59:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] x86/PCI: avoid re-evaluation of extended config
 space accessibility
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
 <ff4b58f6-cf9d-48c5-9440-3288e20a51d7@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ff4b58f6-cf9d-48c5-9440-3288e20a51d7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|MW4PR12MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f68536-9156-4d77-cbf1-08de68bd729e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Snp5SmJMbmtwN0ZzUjd6bFVSMWprbWlCcmxXUW00bUc2amhsa01DdDFPOVZl?=
 =?utf-8?B?SStSaGhrV2pFUE9MWDFETVl4Y3Y2MDJ2YTFobVJ0QTlRa01jRmpnMDFRWnBs?=
 =?utf-8?B?SW5CYzFYVmY0VGhydFErcnlpVW8zcm9wZlNicmNEb0lwUk9hbnFzOVpoRG9o?=
 =?utf-8?B?YmdxS2ZLTS9lQ09xdjl3NUtVK2pyZ2hWdXdsTEc5OUsxTGtzK09Kbm9hL2NF?=
 =?utf-8?B?eEhhallOVEI2VDBhUElzREhrNlBISkNYMDI2cHZBc2FaVlo3cUo0VmNGU2Jo?=
 =?utf-8?B?MitZa2Q0Ymt1MGRGa2M1TGw4T0I4K0hOOFZ2dm1hTkhjYUtSRGQ4MkJYcjdt?=
 =?utf-8?B?RVc3ZWZuRnlQd2dKZjRnTGoveGdFeWdvQkhHa0pwWVc0WnU3MFdXNkRFeWxR?=
 =?utf-8?B?YVNDQno4OXQvTkdWWnNTeUJaa1NDZ1pKdVIwaURKTWs4RjZ2TGtpWmFYUVhH?=
 =?utf-8?B?SnNqT08xVnRlcDJyL3M1ZVdNTmxEdVR0bGdvdVQ3K3ZlQ1pNUzgwQ3dBYkRm?=
 =?utf-8?B?V3VNL0VFOVl3SkJrUTduMGZJU1JOcEhvYWdPcW51cXdBVG1ZeGJVcmVqZmpZ?=
 =?utf-8?B?RXgzT2puVW80ckF2VHhqWjI0THI2aWpOUkVvQUhuZmphM0tyN1ZaQm5NKzRY?=
 =?utf-8?B?S0k0emVyYWVvQ2xOdTRYeU5Ic3hncjMxSTFwUVF2bGlLU3NOZjRBZzU5MHJp?=
 =?utf-8?B?ODZuL3BYQTlIeUpocmY5QkYrYk5ydUdyVlA0aEcxVnB3clgzaDlqNkFuZnZ0?=
 =?utf-8?B?WDlrRHVESUcxSWwzK3dqRUUzemxuRHJqSGVTdkcvODRWQ3BLb1pXdVJOczdO?=
 =?utf-8?B?Q0Jhempsdi8waHhzYi9oaThlZXJ3aXQ5WExKd0xMcnN5Nm44cVljem9KYkd0?=
 =?utf-8?B?S1ZhSmhWa2s3VmdvODFzU2tGSGpuVDhaNmJTS2NDSGlPcW5mM1FpMTFZZ3RE?=
 =?utf-8?B?by9LK1NDbkFnR0p4akhUUDhCRGcwcU9ZWWtxOXgrWFhMSnZrb2JUcStaeTE0?=
 =?utf-8?B?aGg5RWEwSWsydzd6aGlwQkh1cEdwV04xeDNwRUxJamR0QkNKQit3VEhLVUdh?=
 =?utf-8?B?R3dwS3VrRGpjb0ZjRi94TDE2ZmFncmxzc1JHSDFtT08rQlBBUEJmdS9zdlZI?=
 =?utf-8?B?MEdtWU5SVEJwTTFqbkJSVzZaUzJ3dzdYQXJNL3VYQ2FBbTRTelBKMytlbTBp?=
 =?utf-8?B?Um1hYSswdHZvQ2cxUkJjOFF2aGRnVlNNdEo2N3RjV2p6b2Z6K0FLODhnTEhz?=
 =?utf-8?B?bVB1ZHFZRjdYMUlOcW9mUzNHSTkyRkJtN00yWGtXbHh4di9ibHc3MDA0K0N4?=
 =?utf-8?B?R0RuUVpRdzluTlp4eHJYci9yOFhBdzdWb01Bd2Uzbno4TUlwZDJsTDgvV0FW?=
 =?utf-8?B?YVZHc2ZNcnJvRGs0aUNuTkUxK3YzcDBNdmdXWk90MXdqbUt2M3dHYW9xa2dR?=
 =?utf-8?B?enFicnFuY2tXZXk0eVF0TWw2alZjaGQzWXFqb1NibHlrZ0VDNi93QjV0a2lr?=
 =?utf-8?B?Z05sVlpBM3Ftb2dDM0Q3dlQreUxaNUtmazQrSVhMckVYbWVDaGZEZ2tZK2hw?=
 =?utf-8?B?SnN4UUdiOTBPUWY5bVVPOEV4T3kyc3NGbW8vdW53SnB3NkNHdlFSWHVzVldY?=
 =?utf-8?B?c1RsUyttdVZoUy8xSnZjaHRXbnNLMTBYd1k3V3JOQ3Bpck1vMDdrVlNmQlU3?=
 =?utf-8?B?bUdYZi96L0V2MGYrSDVVR1J4NUNjdUVxSDJoRWZVbWt3RVdINXpvUFJVZENs?=
 =?utf-8?B?ZjZFQVRObURxNGNTQWVmaUlGV05RTVRwQ1pFY1AxTndRR0RMSzBCT1JPUndz?=
 =?utf-8?B?NHZmVlNpK1RyU25LT3VsT3hOSXRFVXpRU2JJNnlXKzhrMjNWUk9EQm1GVWNJ?=
 =?utf-8?B?bWIyRnFtUXNGTFozUHY3b1BmNDRNaU5kSUZhLzE5a0h2WGMyazN4SGJzczVF?=
 =?utf-8?B?Q2dJMjk4YkdSRW9EZVVLVEFCSnYwSUZGMExQd1dZS256UXpkeVF4b1ZXQlBG?=
 =?utf-8?B?cFc1Y1VycjFwaWF1N29qOWZWWS9TVTQvWmtuNm81RnpzNndBei9yeVcyZUw2?=
 =?utf-8?B?endwQnNzWHYxK0dUMU1IWVc4QnBWMmo1MTlsL3I3aDdMMmFtcG5WZ1lSRENx?=
 =?utf-8?B?NEpGSlNxMnVtWlhFU28vM2o1VFZTMWFPM3Z1L3JVUGFKYS81OU5uQ1hOMXA4?=
 =?utf-8?B?UHFlV05nVUJLYXBXRkNXc0Z1enUzWWowV2NzQm5ta0JuSlJEMnQxSWlDQy80?=
 =?utf-8?B?cUxMZndOQmJrTGlLUjdrYkpvVER3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/pSxsImWprmM0lx58VfjAVggJW2ULKugY8W/2W4KAg3Vq8EqTWojs8AjQjCrNYiaoWLMvEYX8fVJxMubcZmZyMU22dNZZtHkJ7yMcjj2qlfdJChyy19AWqGN2c0uonbt02I3EztzY9WvEerwuMwawufHoJA/VwBRJgM47g9VEBun5bIB9hrAFgptYOtL86qPkdI7Aw4gKsIGS7DmjXgUaOntL+hX+6k8D85n35rQg3kehNigr5Shnr+7aZU/FdqQrC5Bcqo73ZuiDktoZnCCK1R+luWdM7iSSHrDOxpJd60TzhaM0kYEk0svpZ8e8P0W41UZS/91nkrsq1si2dGpruw9gjUL2GQXpz9xA477uTH2ond2u7slfjgNjJNTLSFqywPTmQpT7Mo0bkR599NrhdpfnfDWjVsxurL8WTY/iX68CiKW/KyHliEy7yZ4157T
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:00:01.3430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f68536-9156-4d77-cbf1-08de68bd729e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8610
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 2BC0C11CE18
X-Rspamd-Action: no action

On 2/10/26 05:52, Jan Beulich wrote:
> When, during boot, we have already correctly determined availability of
> the MMCFG access method for a given bus range, there's then no need to
> invoke pci_check_extcfg() again for every of the devices. This in
> particular avoids ->ext_cfg to transiently indicate the wrong state.
> 
> Switch to using Xen style on lines being touched and immediately adjacent
> ones.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

