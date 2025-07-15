Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E19B06569
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 19:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044661.1414758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubjtL-0004ED-63; Tue, 15 Jul 2025 17:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044661.1414758; Tue, 15 Jul 2025 17:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubjtL-0004Bx-2s; Tue, 15 Jul 2025 17:56:35 +0000
Received: by outflank-mailman (input) for mailman id 1044661;
 Tue, 15 Jul 2025 17:56:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=akqQ=Z4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ubjtK-0004BV-0o
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 17:56:34 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2417::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03eb9fff-61a5-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 19:56:22 +0200 (CEST)
Received: from CH5PR02CA0008.namprd02.prod.outlook.com (2603:10b6:610:1ed::15)
 by CY8PR12MB7268.namprd12.prod.outlook.com (2603:10b6:930:54::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 15 Jul
 2025 17:56:17 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::a9) by CH5PR02CA0008.outlook.office365.com
 (2603:10b6:610:1ed::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.19 via Frontend Transport; Tue,
 15 Jul 2025 17:56:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 17:56:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 12:56:16 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 15 Jul 2025 12:56:15 -0500
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
X-Inumbo-ID: 03eb9fff-61a5-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fd+wdVT7HSA0ZOgw040OJn6CJTqW8XJXAnXGVeVE4dF5eA0zQjGddXARX+ZzF+MgoT70qdMPc2+XMkWEucwOoUWlKalbYqO8O2sGK/X6odQ1jryyv7z25CT5UTushsXkkkX6aWoGchTK9Cw6pdUrE7eYySol0BUOZvZW+ZMOM3TS/lnUKOnSb6VHDpY7gaSIVBz9Sv0FyIiJeFCau0swkgcbxlS2XJoyeOAnLcUCFfvYpqN+PeEFGelbXdEoT+iqi5IpfzTfptYWFqHvo0k2KKZrhTHfj591c2PgQxX0wlz9DJGG63DvwXfArC1PE/krd5hYOI1n8r/TfWAweBOsMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynlcTvoBo72Ia+dVwRCAs5Ag2Oo8UxAJy0vKMWa4R78=;
 b=Gy/gSJrQ/arb1ZaQKKnAj/SG0tLHt6MCZpdmhe0CAZqypC5z9Jj6IUqrhshUAR95/9/rbSePFAkHe2Wn34QBiyc39WP0fzgKrHoPnvswIc41otVxagIzjYDj7Ix2d8L1X2ehqPzUuvwoGnJwe67NRkUevmvyLEhzW0w7TkNT6hOO9dghwiAM6YurQ+SDujG5cz5twz47Sva3zmSQFTfDOWlVt/ZnVgEFoPdrCjgysi7755VDrHDMHWfkAJ6v6mQBCsV3ZTiD2RuFv9gl9LOp2aAvsKu+VIxqqPqzOZ5H2G3MDwOdGYQmG3GH+LxE9UBoaMclnpdBBrDnGmX0DovUug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynlcTvoBo72Ia+dVwRCAs5Ag2Oo8UxAJy0vKMWa4R78=;
 b=Kp1hp8loPEf3/VgIwL1PWSPvSfgegnzDXR/n3f3iYLgSLmvpOImWIhXNNRtcNI6xjMl+5HYxL51mixJFEQ6/XGSnqbhgSCNfQmz6flrJuITvGYx+wKyqf2a0LPkxvuG1sN5qvfNqZTbUHvhnmnIFagA3WzwHQziVY++8bJA2pcc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b3a40c52-700d-4f71-b14e-9543acecda18@amd.com>
Date: Tue, 15 Jul 2025 13:56:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH v2 07/14] mini-os: kexec: add support for handing
 over some memory across kexec
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250715132936.2798-1-jgross@suse.com>
 <20250715132936.2798-8-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250715132936.2798-8-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|CY8PR12MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: cae929da-3cbd-4978-c877-08ddc3c8e59d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmNRYStVL1JsMmFTZ3RwbFMwVk95TWZJQ0VxdStvbEdSUXk1S3V4TVRmN0Iz?=
 =?utf-8?B?YjFKSHJYTlhGSTZjY1hyVXZTc1k3V3pkQ2EvckpkYzBTZmUyeXd6aFJIbmZp?=
 =?utf-8?B?bkNZbHh3VXZOQjZRalN2WE4rZnpoeS8xbGJxMzlZNGFqTGhwUHZlQUZBV2J3?=
 =?utf-8?B?Q1drSHd6dkdJcEorWUpjWm5ocGl6TEZ1K1d5aVYvS2lsbW5iMTM4TlZENkJN?=
 =?utf-8?B?TVRqL1JHeVdMOENXbkczcUVPYlJZU1JwcU81bHNMN2h5WHhEb3dzaFk3T0lD?=
 =?utf-8?B?UWtVd3ZLanFlS0NrK1hQdXloUWhEODBvZjgzTENRY3Vnb2dpKy9SRFdvUG5k?=
 =?utf-8?B?MzQxdDZzTkE5dlZqakN0bWFjT3F0enVsc1dmQy9yYThQaVBrdlk3ZDUvMDk2?=
 =?utf-8?B?YVFjaWxEUS9IK2w0RFhhYnV4Uzl5K1hMUGVQSkxpUldPeStQRVpLK3V2d2p1?=
 =?utf-8?B?ZEtlek1FUE9ORUg4RnVxWVI0a2ZqbzFlNWJwdThxVkJzNndzNjgrcEZsNWl4?=
 =?utf-8?B?N1pxalRuUHJEUmxVSkJ2elFsU0VwekR1MnRybktBcFRUc1dwTWhuQTcxaGpD?=
 =?utf-8?B?eHRZemRtd0xDeVl6dG1VOWgyZ1Y0NThtZW9IZ1ZaTXFPSjFraDZ0V3NZKytj?=
 =?utf-8?B?VkZKMG5oV09WTUg0YmdRYW4xM0pYbmhjbTA3YVdWUEtaQWt5cnQ1VVRlSmU1?=
 =?utf-8?B?VnJDSnMzS3ZqYUlWc3REYkhxVXI4bzhhUDlrWkRJUDhRVXA5dmFFL1VBVEhX?=
 =?utf-8?B?NjRFVE5SN2NndVdKakZBRG0xNVlIMGM1NFh3WnZIMlo1Y29DTzJYTzFKSmRU?=
 =?utf-8?B?ck1PWm5ha1VMYVB2SHhSeDFnZE85OU9kaVNoR2NaelE2VDZyNDVkeUJZSVBI?=
 =?utf-8?B?UXMySzdibyswVXgvMmZLTU9XS2xRL1hkTGVyMFpOdGIwVUxMVHZCdUhPNHVJ?=
 =?utf-8?B?Y1dBemhuRXEyMEQxdis0SHYvTHNYalhhcWZRVTdnU3h4YU9OdFMreHpLbUJw?=
 =?utf-8?B?YUZhTzNhbi96c01OaEY0UVdVWFZjbTdrcnNBSThuVlhrREJVRTByL1Jickxm?=
 =?utf-8?B?RTlJQmIrTUpHSHcyMXVHVUtjYmk4dGpxdWhDUHBIV29mSDlhL3RkUGwvNVc3?=
 =?utf-8?B?VmNwZjhFNTZwYS93bXBmczhnT2R4NTM1UHVTd3g0Y3BCcE5ZM0JaTmpCS2Jp?=
 =?utf-8?B?NGIwZnJ1Y2JiaWFyS2FQRmYxOUl6MUFIcUZPQ3hoSjZmT1lhRTgweGYraWd3?=
 =?utf-8?B?MkUxVFh2S2Rlb3BUZTZPN09DR3FqVkJLYTFNT1VhR0hmVVV4RzlidGpjb25i?=
 =?utf-8?B?d3kyRjFqWHdJSjRRODN1SmhVNnNlOEFpSVFiL0ZXWjZ6NHBCbnMvcmZ1TU13?=
 =?utf-8?B?czE4bldUU251d0ErNzV6a2RMYWNuTURZVzZ0NWhrTEI5SVF0NFB0UDh3V3ly?=
 =?utf-8?B?aWxwb3hoM3RLMk4wV1ZxdzcxdnlRMk4wcnJXUWRPUGdNT0lTOXU4MXBUTWdW?=
 =?utf-8?B?TmhLMkRaN0EzMGpGanp6R1c5NEFsdGpxc1JEWTlMZEJsbUtwNzJFaGYyWTlU?=
 =?utf-8?B?MFlYM2JDV2JnY2ZKeHcyVjJ2bGl3WjhWZ28rRVZYbFozU2JyWlNmL3hKUXNz?=
 =?utf-8?B?L0FvZjJ6WERuUUtGempXT0hBelVYOC9kUVc5ZXVUaXJwOXUzYXo0WTRDL3Bx?=
 =?utf-8?B?U3pFNzJNRXFkbzJHdlNaZTdHRGZYUHgxcnJ1djVvM094NXdxMzNhUWlMeVc0?=
 =?utf-8?B?bE5ITDFTb2ZOL2NOUDlVS1FiNFNudDQycWpPTlNaM2twTzZ4NDByTDlmN3Fu?=
 =?utf-8?B?TmU1NlJNZytZeU5VNzJLdktnd0lkV1hud2hmb0R1aHpNdWRlUGhGazB3R1pp?=
 =?utf-8?B?QTg4ODEweHJjUmxLNWNuMGNyanFjNWlaaEdjZmVJUkNaYkRFcFZ6YkVMQUJ3?=
 =?utf-8?B?ZmFMWmplNmN2UUtlc1VHNktzMWdFVXNGZy9SVVVad3ZEbE40ZWZPMmNTNEsv?=
 =?utf-8?B?eVYzekRyQWZ2b2FHQzR4MDdLWm4yRFpOaGxzWXZrM1VkejdTVWZWVnlBK3pF?=
 =?utf-8?Q?dY2/Dd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 17:56:16.8863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cae929da-3cbd-4978-c877-08ddc3c8e59d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7268

On 2025-07-15 09:29, Juergen Gross wrote:
> Especially for support of Xenstore-stubdom live update some memory must
> be handed over to the new kernel without moving it around: as the
> 9pfs device used for storing and retrieving the state of Xenstore
> needs to be kept operational across kexec (it can't be reopened due to
> Xenstore not being available without access to the device), the ring
> pages need to be accessible via active grants by the backend all the
> time.
> 
> Add the basic support for that by reserving a pre-defined number of
> memory pages at the top of the memory. This memory area will be
> handed over to the new kernel via specifying it as a module in
> struct hvm_start_info.
> 
> The contents of the memory area are described via a generic table of
> contents in the last page of the memory.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks for the expanded comment.

Regards,
Jason

