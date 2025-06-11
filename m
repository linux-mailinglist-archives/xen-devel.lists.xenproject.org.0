Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CA9AD5FFE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 22:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012156.1390699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPRxy-0003bV-Ed; Wed, 11 Jun 2025 20:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012156.1390699; Wed, 11 Jun 2025 20:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPRxy-0003Zj-BS; Wed, 11 Jun 2025 20:22:34 +0000
Received: by outflank-mailman (input) for mailman id 1012156;
 Wed, 11 Jun 2025 20:22:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTnm=Y2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uPRxw-0003Zb-HD
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 20:22:32 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20618.outbound.protection.outlook.com
 [2a01:111:f403:2407::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbe24f1b-4701-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 22:22:30 +0200 (CEST)
Received: from MW4P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::27)
 by DM4PR12MB7576.namprd12.prod.outlook.com (2603:10b6:8:10c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Wed, 11 Jun
 2025 20:22:25 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::e8) by MW4P223CA0022.outlook.office365.com
 (2603:10b6:303:80::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Wed,
 11 Jun 2025 20:22:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 20:22:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 15:22:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 15:22:22 -0500
Received: from [172.26.5.4] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 15:22:22 -0500
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
X-Inumbo-ID: cbe24f1b-4701-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsTGn6PF2vs35LhqbQvkrQHuCC60o35NmnhwFaC0nHmzeqjmz4s78AHnUwugDjyVwrHbsZQjiIkGUHHIPP8AZb3pFkOgU38eN6ujYe4bMC4iF8N7LtbLjybJjALEHsaN0rdCENljOkIg89rEVsUft/V2RUeHOyJwD3Tr+P5pWmWa+5OfXa7aNfiSL3PN0axx3QexmSU7cpyb+cBvUF+fuypaVmyRnUsdBY342ec77jEg1Q2j0RdyWxdCTlDBKE2e2gqSGKTAyl3LBb/ia6GqqWbQWbTXN+KuB5tuCMkX7kSjuLby35blARlQDj0JLsb/EMR9/uBbEGXWkUwO5+QzOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6goV5ciT4iqY09inpQbk3d2BuCrQk7keUKwVFCw0Gw=;
 b=L0MVjxfFnjblEg3mR621lq2i7W+URi2mGKxnSL1Fd3FBtWimNKagkRqtgoMju+XSM5mcVXJIJMMBZk1LWeBcWSV3X7mBCjveRsIkmjDdZvZ7XbIPdKKA+Zw/894D292B1y9ufq0B2pGXwx7j6IZ4U7f/n+BM23W9EcKcBE0Dudnddov4pN57TAhVsqdp2pvH32WrfW0XcDoY6C7zXbNU/zAybFhNhhPiW6ENs7YJh+ZdskQ4WkeMVQS77XINsMnE0P7h7m9Eq4uh70VuTUXTKo6Af0hepQMQXGush0lzLByHyAoHxMVle+6vgw7LSdIbP2q4HjVimnqrYw/ea1hqvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6goV5ciT4iqY09inpQbk3d2BuCrQk7keUKwVFCw0Gw=;
 b=hBD498d32Vur+8uIRW9U1zrAEK9veWDXOLPCsroiqcJ2ScQDcvslI3zQQXcPBUC9BtzLYxivJgHlDYks10PzAEdZSCKp1OxlFQZ4tlwA0R/Hcus1FVZcNRYTkL+hdmvaTCn3vC3jSbD5sfexcExxFGLKs1A1eyAIENsCcMAbdWY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e10959a7-4e72-4477-b8dd-b9d62e2a0ccf@amd.com>
Date: Wed, 11 Jun 2025 16:22:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] vpci: allow 32-bit BAR writes with memory decoding
 enabled
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
 <20250531125405.268984-6-stewart.hildebrand@amd.com>
 <9ec5079f-9bc1-4843-a266-d74bf0556619@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <9ec5079f-9bc1-4843-a266-d74bf0556619@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|DM4PR12MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 3232d222-0ec4-4f62-8385-08dda925acd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1ZpMGhpWGx4ajVQL01yMXVPMlFiemdhUlBDN1JycVVDMGxuSzg4YWxnU2Jl?=
 =?utf-8?B?elV0QXlqNHBzb2Q1bFB0NjRleXg3aXlGdTJzNWVpTTY1ZzJrRTZobmxUajNH?=
 =?utf-8?B?KzEzL3lBRFdUUmVUY3ZFNGU0SmhJcWM3KzJiMEFEdE1oYVZRZ2ZIUXBmYTZi?=
 =?utf-8?B?TXRtYWpsU2pHUkVhSjJIazM2TXorQTRtTkVLT3JadXg5cmtac1FhTk1wRVRJ?=
 =?utf-8?B?NW5GSUFEWHBLdXNKcVczdFA4akdHZnFNVE45VUhMZVBzbWYyZjF5YUY5dzFT?=
 =?utf-8?B?RXFnNEZrVTI1R3Z2T0hRZmpGekRJWXU4aEQyVnJxNmREaTBGZ2ZoUER4NlJ3?=
 =?utf-8?B?RHZieGpHN2haaG9QeFNLL0MraUdTYWt5dHhVSG91cjEzb3dLUnVENmRoK3lY?=
 =?utf-8?B?enNLcFN1Q3NydmpHSzZkSTNiTmxaaEUxVUdycThZRWYyNEhGeDRaeXJScEVY?=
 =?utf-8?B?azl3eE9SNlYxZ0ZRVTFFY0hBSStydXQ4Rjh3dDNNZDI4bkEwUGZ5aGhqUmRi?=
 =?utf-8?B?RVpBNGFSWmU2bHhCWm42cHF4WjBETnkvSXlDSHQwbWZMQ205cEM2RkFFQTNa?=
 =?utf-8?B?aGFWc1VoS0VHbnplYnpmS1dNTmNCL0FYVUNkWnl2RlF0RVpHdHkwaXJnVGcx?=
 =?utf-8?B?cE1oNWpBZzQxeWUySm1rMk1SRUlrSnVPdlA5YWtVaXUrbWh6YlJES0EybElT?=
 =?utf-8?B?azFjdlFieFdMaHRWeFJLNmdDWVpHSDFGdnBLZU44QXRFYzFxaEdBdkE3VU5O?=
 =?utf-8?B?dkhFeXhjbHo4WHVDKzNVVnA4dVF2cXZJa3JyUkVNZlFGaW0yejczUTdYdkNM?=
 =?utf-8?B?a08rQVFCS0paWXp1NjVLS2ZXUkc5WUxZMEp2ZlBkeHI3TVlaZVkwdndMR1NH?=
 =?utf-8?B?TjNuZFRFNzhhVFFlYUJQT0doWUZTSkIwcCs2MUV6Ti9NUit0b1Fzb3lSZkxT?=
 =?utf-8?B?anIwL1BlaWlWVWlZTUZpNWU5SkhBaVJIdWhkemxYQkJwQlNDTUxwQTl5SXIx?=
 =?utf-8?B?bkxMK1BpNDYvaklFaGlFLzFseWxWYXhjS1p2cXE1djB0QWZsQURrNmNaeVJs?=
 =?utf-8?B?MG4xOERETURRVmZONlkxV2FWQ21PQzFRc2ZJK1JtU1J0Y3FnSUFRRUFEdDZO?=
 =?utf-8?B?RExqalZ6Q0tuejAwOFVESzdTa0w5QVlOL0tlME1MZFZhTHN2K3BNTFg4eEZS?=
 =?utf-8?B?aENIZ2RwSlZIR3hPd09rR2EvMkZUUVovVHRHQVRCa0VFZmtMWXFQRlBHYytm?=
 =?utf-8?B?THhvN2xyVUdlWktCVHlHek5pb0tQbGdxR0tpU3l2MmlRSDdMRHlCSnhPMEhp?=
 =?utf-8?B?SWo3QVpTMGZkdmpoVUJJVFh1WmNXQ3NibnNoZGVPUlJxTUJzd2FnWFlHZ1hO?=
 =?utf-8?B?blorOWVVSE5DdnNOY1o0Z2I5cG44R1BWb0tBcTdBUjVLcUhUVktCVjUyajZ5?=
 =?utf-8?B?L1RENFB3Uk9IRXFJQ3pwTEhNVkF6bTF0LzNxS3JPRlJzeXI5eXF6TFFBY3Jr?=
 =?utf-8?B?d2R2S1dUYy8vSHZHczNwWWhWcnJLakdlNzhZeVpXVUJ5V3NWWGFDN2VJemtH?=
 =?utf-8?B?ZlgwaVNXTzFONVVYdUdLZFFOV2RvTnBXN204eXlQMDlnZElIcUUrRUhJV29y?=
 =?utf-8?B?UlZTSGdVYmZTZHp6cUd4cmx3dzRIRkZNQi94VWI4S0VoQTJJS1E5Z0RCVzAw?=
 =?utf-8?B?SkhwMXlGeDNlQ2MzN3JoNWErbFlORlI3QVpPZXE0SHFhQjh2bnNhSm4rdmJV?=
 =?utf-8?B?VmNrMzNaNmJQYk1DelVaTnd1TElCRWFyL0p6bXlLSVNCZjFWYjlwa0o2MStG?=
 =?utf-8?B?a2JPcndNdTBsSkw0TVU5RVE5UXVHenJZdk5Oei92OUdobHZyOTZQbWFZL3JE?=
 =?utf-8?B?UkVmcEZvN1Jiemw0ZVBobHBJcEh5c3Jnalp1dlRFL3VLWnRMdkt1TEZya2pF?=
 =?utf-8?B?WENkZmh0UGhZREV6cDNpWlI3eUFrZTFoUDBHMUtqOUVsM2hadEVaWm1aNkVT?=
 =?utf-8?B?Q2VITXRTUGpBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 20:22:23.4013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3232d222-0ec4-4f62-8385-08dda925acd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7576

On 6/5/25 06:41, Jan Beulich wrote:
> On 31.05.2025 14:54, Stewart Hildebrand wrote:
>> Currently, Xen vPCI refuses BAR writes if the BAR is mapped in p2m. If
>> firmware initializes a 32-bit BAR to a bad address, Linux may try to
>> write a new address to the BAR without disabling memory decoding. Since
>> Xen refuses such writes, the BAR (and thus PCI device) will be
>> non-functional.
> 
> Doing this for 32-bit BARs only, with not even an outline what to do about
> the same issue with 64-bit ones, seems like it won't buy us very much.

It buys us quite a lot: it means the difference between booting vs.
booting with degraded functionality or not booting at all with PVH dom0
on some platforms with certain PCI devices plugged in.

The plan for 64-bit BARs for now is to continue to refuse the write(s)
when the 64-bit BAR is mapped to avoid mapping half-updated BARs in p2m.

I'll add something to this effect to the commit message.

Also see https://gitlab.com/xen-project/xen/-/issues/197

