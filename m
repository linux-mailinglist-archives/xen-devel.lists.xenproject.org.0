Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A1895D02F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 16:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782392.1191880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shVTH-0007ky-03; Fri, 23 Aug 2024 14:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782392.1191880; Fri, 23 Aug 2024 14:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shVTG-0007ib-Su; Fri, 23 Aug 2024 14:40:58 +0000
Received: by outflank-mailman (input) for mailman id 782392;
 Fri, 23 Aug 2024 14:40:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xt9W=PW=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1shVTF-0007iV-6j
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 14:40:57 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:2417::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b329c3e1-615d-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 16:40:54 +0200 (CEST)
Received: from BN9PR03CA0416.namprd03.prod.outlook.com (2603:10b6:408:111::31)
 by DS0PR12MB8477.namprd12.prod.outlook.com (2603:10b6:8:15b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 14:40:50 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:111:cafe::ee) by BN9PR03CA0416.outlook.office365.com
 (2603:10b6:408:111::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16 via Frontend
 Transport; Fri, 23 Aug 2024 14:40:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Fri, 23 Aug 2024 14:40:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 09:40:49 -0500
Received: from [172.22.205.25] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 23 Aug 2024 09:40:49 -0500
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
X-Inumbo-ID: b329c3e1-615d-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bxg6uinkXE41OQXLyElJufHxwMcWq84co5Dlk8GnDtEc48OxW45OOL5qYepQUCZ0rqT0k11Z6Z0u1kqzScRr08R2SkajhiZ+ZxUey9BppDHIX5752+7BP6g/nSwcGQbc/nk6BNSuRGF18VVLmE+Ef4OGgOeFRLCvVtXQlQvU7NtcOj2Ts6iG9PftNuTaQbVtcvdvUCDbUsSAAlvjWQy7px5VFgaq8JigV7lv1ID3iKJtlzOq2V276GQgpFIWMl2gv415Sve2301abgvlB98zdp6X4tEX0f5TWoe+1Rt9RPfYMQ1sIuRo5L4vpm7lJh1wSUa6Hrd6TcyneOsrK3+CDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bzw4QZPEdg8C27i8Oyu3omeaQNrlZDb2Q1elQN1jYSs=;
 b=EWrkjn0GsPv0D2gqIDqhN8P16pourBbxCUiPAVCOD4xqob5IvNi4KzKWlQZVvdVSA1HIP7Q469WbB64r4ky2Ui8axmbVoDjE5x9fG6LvOND+gxkKj/VmYpI4RP1/1xuaTv+nFzXFW5+3PqEH1IsdRwITGeXBkv4H8kXv2kxYuzkPuIADSmDz3IQXbAFFq9gHpAdEHXxYSlYm0kbFPiNXAkZsG4B4Aho1lo96XwyQC72ihCLg+1Gq4NySDtEB8+Xj/S/BcmmSfMM6IIJWylEjjUjonvqKo37YB/7PUGuD+YkU6XL2tTxNab77+zAlXENykR1/auBhWlz5HXUzAzPk5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bzw4QZPEdg8C27i8Oyu3omeaQNrlZDb2Q1elQN1jYSs=;
 b=O70uAKPZHajJ4n/HCKtgKILl7Al27Yr+X9Hw2Ch4jWzpgBTnJvPcHUcxU0A2gYFfxrKHQsfbjF6JEXZZblrZRA8IUyM1ii+dO/eb4igcRdWUNCzZiRHqc9wd53ZIFIJqKxPqqBYc+fLkEZCjSh+2e8k5rRh3f5XnnVCQWnEMcIY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c836fee8-ed53-4546-b2c6-4a0c9264f0ea@amd.com>
Date: Fri, 23 Aug 2024 10:40:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/boot: Preserve the value clobbered by the
 load-base calculation
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240823131029.1025984-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240823131029.1025984-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|DS0PR12MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: ee06cad4-efaf-4584-eaf8-08dcc3819563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEkydnJ6aFdienN6WWVrYTEwdE1oQ0oycFFsKzlFMFFuQXduTXZJV0NjNktW?=
 =?utf-8?B?UnlJYWd5dzUwVURKUXEzazRxTUpNYnkwSmZJY3ZLbkpCK2xmbVdTeXdxZTRp?=
 =?utf-8?B?bFZuV2w0UjZRVWNjTnlXT0RDcURSdlNpei9TUVZ1cDdQVmZ5cVJKQWlaaW1U?=
 =?utf-8?B?dlk0VHVUK2RWcnJIc242bzRYVnFkQ1NuNUs4V3dJSGJhc0dxRDFVU3c3LzRm?=
 =?utf-8?B?NTg2Qi9HUHRabk5sWEhnSlNxdWNtYjc2bThCdTVjMThsangxcjBVc0pmak14?=
 =?utf-8?B?RWwwQ3F3RjRtblJqNjhHaFVVZzFJZ3VrZkhPelRwR3d0YTZjejZRNGZTaTBZ?=
 =?utf-8?B?eElhTmZSVGxCMHNCWk9xTlAzSDZ5U1NKZ2hyT3ArRzVBaFUxYVNMTWJZVXAv?=
 =?utf-8?B?blpZQlQ4Q1lPazN5em9aN3dwYktkc1llMm1tVDk2SU8yb2R1T3VUZ045MXF6?=
 =?utf-8?B?a3VESHNJaTVrUnB6OEFXeDI3bVVoSm9jd3JGVTZjM2JwQUoyWm13blA4MzJD?=
 =?utf-8?B?ZktoMCt1cWg1UFNMRUtUcHBPbXJvNFRtNU5hbTI3Y0poTFh1MGx1Q1lrRVI0?=
 =?utf-8?B?eTQwTURQakxJZTJMNTFBUjhnSG1oMXlIU0crQzVKYmJJM2VYRGs4emFIYk0v?=
 =?utf-8?B?RXp2aU5uSGE0azZZNkRiaWp4ZFEvSGR1SlEvSm8xRC9uMWtNY1hFVXcvWnpW?=
 =?utf-8?B?Q24zODU5aUI5anhKSkx3RlVwLytkOFppS2EvSUtRa1NwT0NTRTVHeGlBSTJ0?=
 =?utf-8?B?WmpLTGR1MWo0RjE2NnVmT2J1bUI1U3pQMWpSOThKQU1od29CTDN4bWxjamZI?=
 =?utf-8?B?Z2JIZEYzdzZFWWhqaUM3UHkwdU0xdS9Cd0Jjd2JtM01MYVNZUW5nM21UYXBI?=
 =?utf-8?B?K3JHelk1QzVjVk8vTWhLQklEK2JRKy9OYVgyZGtvQzF6UGNZREFZLzA5V0Iz?=
 =?utf-8?B?MnNFclJzb3JDOU1TNHkzZTNuRXFVOURXTHlyQ2xObk5Pc0htTjFlSHgrTHU5?=
 =?utf-8?B?TGtJV0VaVTJLa016WlROOVNDTFBDUGxpejI2M2x2dG5rRkl2b2tiN3FobnVm?=
 =?utf-8?B?NFRuTlVEWFA3RHo5anU2aG5yaU9lR3ByRXBrZkZZU0xCc2FYMWdzUmdESUsr?=
 =?utf-8?B?cHFxeWUxcXVFamNVd2J3cmFxOUFsTVFhbzZ2ZEk2K05mNW1pcE93dlFrWFBH?=
 =?utf-8?B?NnRCekxJWDhPQW80MFlZT0V3b0l4OWFjczJJcDFhM0E5S0p1TlJPQjBsM1ZZ?=
 =?utf-8?B?aW9KdVNxWGFmTDFxUE1pdzh2S1hjZFl0eWNRZThTNDVhR0pSaE5aZ2NUemhJ?=
 =?utf-8?B?Si9sQkpKY1hndi84RmV6aWFNTFBCbmdqUDNIdzhhS2xzNlNXYkloTmRCTSsz?=
 =?utf-8?B?NE8zQzAyMk0wM2w0MURwZEdwT1FMTExYZDB2b0VUQS9xSEw4YWxxc1NEZW1t?=
 =?utf-8?B?UkU2aGJtRTNDWG9rWDlqRW1kb3FUZTJXYTJteVRKc1JzNnR4cXpGVGcwejFC?=
 =?utf-8?B?YjJaN2dKa0M5M0gwWnFwOUE3T3VuVS9xWEl0ZmtLaWtHSFJEam5pYmNXVG5O?=
 =?utf-8?B?S0I4b3VKVmxMWXRNU29DZlh6QU5XM3F6SGl2ODZlV21kem8rVGk3MEdDc0x5?=
 =?utf-8?B?OVk1NGE5cXUrSjZ0WGhxeFFHcmo2aWNpN3lCS3F5Qks3WlBRS0dHZU45aUtw?=
 =?utf-8?B?eTJDT3JteWZaK1lJTktQdktRa0laSHdVNjdoRGtKZnlkOE0zUlYwQnBmTjAv?=
 =?utf-8?B?WVZQV2g3bVJEbHhHVk82dUFYbHJucS9Xek9qUE8xUEVUZzFpbnFZVkIreUVC?=
 =?utf-8?B?bHZUaXQ2THRnY0N1UXhacm9SSEZHdUZ5SnFodWhrdXUvQnRHcDhmdWdLNHRF?=
 =?utf-8?B?WEkrOHBKQkRaeUZyeHpnL1V6cGRsL2ZlUFhsQ0MvS1pzRkZDekxMRkVkT3Bh?=
 =?utf-8?Q?kZS2HSlronDCWe63go6TfuTojqUY4KDm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 14:40:50.3693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee06cad4-efaf-4584-eaf8-08dcc3819563
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8477

On 2024-08-23 09:10, Andrew Cooper wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> Right now, Xen clobbers the value at 0xffc when performing it's load-base
> calculation.  We've got plenty of free registers at this point, so the value
> can be preserved easily.
> 
> This fixes a real bug booting under Coreboot+SeaBIOS, where 0xffc happens to
> be the cbmem pointer (e.g. Coreboot's dmesg ring, among other things).
> 
> However, there's also a better choice of memory location to use than 0xffc, as
> all our supported boot protocols have a pointer to an info structure in %ebx.
> 
> Update the documentation to match.
> 
> Fixes: 1695e53851e5 ("x86/boot: Fix the boot time relocation calculations")
> Fixes: d96bb172e8c9 ("x86/entry: Early PVH boot code")
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

