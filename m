Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBABA7E0BF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 16:14:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940210.1340056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nEg-0003bT-D2; Mon, 07 Apr 2025 14:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940210.1340056; Mon, 07 Apr 2025 14:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1nEg-0003Zq-AA; Mon, 07 Apr 2025 14:14:02 +0000
Received: by outflank-mailman (input) for mailman id 940210;
 Mon, 07 Apr 2025 14:14:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcrT=WZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u1nEe-0003Zk-Vb
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 14:14:00 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2409::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b756ac1-13ba-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 16:13:58 +0200 (CEST)
Received: from SJ0PR03CA0108.namprd03.prod.outlook.com (2603:10b6:a03:333::23)
 by PH8PR12MB6843.namprd12.prod.outlook.com (2603:10b6:510:1ca::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 14:13:54 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::bc) by SJ0PR03CA0108.outlook.office365.com
 (2603:10b6:a03:333::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 14:13:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 14:13:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 09:13:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 09:13:52 -0500
Received: from [172.25.231.87] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 09:13:51 -0500
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
X-Inumbo-ID: 8b756ac1-13ba-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJSfdH5InwuwAlcWOsmzlSrP+RfN8+jIDGRgG9cGg8TTq+zEkIfYTK859wyzlCYKqDzrMVIVP5F+2R6YuXhKX//5MpwJdhXbWsaZsnVsvaRundhnQbtD0SOnHwOoJNV3FfLZAxCsk2+vzF/xzarKbadpXZqxafUpTN93wq2tZ9xEhgaaU0Kr/jcdEbNeyPNLD/JWQEBCwVeXUR5HkTNeBu8shoROsTagIrlc+zpYlVB9os7WJpP3z1C98FQH+YfI+30tZ5MzFuL7z60OPF42wtvZoF9namFy75PH/Zn5wCpX0dLQfd9SkhGWB4OousQqzMWnGUEPjg2AE1XZbBYaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgxKzLmQhwTDPxkc6CIC8uyY+/HBU7pHXbI3dVF7efM=;
 b=YaqxT0uvAqR8OyVQkhGwCWCJCEfzWH0BYgIZpVsyoEp38zw0c4jEkwb5+/yZh+NJNMzq7EvFULi8PKqLuG40i/59Kr1m1qVFHXFC9IlRNmecfg4zVWyscqjwahBHSiv92QEdPOfxMpZYSfjCUTh2fZ1Yb4zGblQR5diVcifhqlp1e4fIA+hxmuUdbWSVkCd0MPnWK10eSkfVGOkhfeubsePkJfJ0AZdIoPs0clPC1PhdkqByBWi3uh4SlxbGR9nyKhw/BjrqOtNcd0moJqAGJ27jqV9HG4l3mM8YKg6eUtf6eIE1ADKIr6Dgy9JAcLQSwGrszHCINqS1SlE3GfpJ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgxKzLmQhwTDPxkc6CIC8uyY+/HBU7pHXbI3dVF7efM=;
 b=3j6t6cwzfMJPVgfed4XUNdlS6AQkPsCpkx3NnVSL4AWymTO+KyMlpUX0qGvQENRHsZGjCIoWCRevWv9sdV7q52uK73ZSOkCp3OL7xEPNhdO92RoeflDLPr6NrQcrJ1y6trTBeXE3vPid6NW88e9OII9vM/bSFFRg/ZCIYYjsdvI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <99ad29b0-e57e-454e-b9b8-63b33f25ab45@amd.com>
Date: Mon, 7 Apr 2025 10:13:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: disable CPU idle and frequency drivers for PVH
 dom0
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, <Xenia.Ragiadakou@amd.com>,
	<Alejandro.GarciaVallejo@amd.com>, Juergen Gross <jgross@suse.com>, "Boris
 Ostrovsky" <boris.ostrovsky@oracle.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>
References: <20250407101842.67228-1-roger.pau@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250407101842.67228-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|PH8PR12MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: 9267ae73-b516-4847-9716-08dd75de6d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODA2VlhoL1NiRFVoRnptWWc1aHNadkVTL29SdEVPd0RDOU5nM3NRNUpmeGlp?=
 =?utf-8?B?NWxwZXRzVlhHUFI1VnovMnRWY08zMTFlc1RYZ1J5ays5bTNrZE5IV1RSc0Mz?=
 =?utf-8?B?OVhSek14VktZa3hKM0RXaFhENjZLd09NbnV2dXBGdGRUc1FGK0tjOHZ1bHFq?=
 =?utf-8?B?dTBtMmk4bzkrMTdJSk1iS1dNOFBydXJqSWtneDJYRkRWUEtabHlpb2xmNjBG?=
 =?utf-8?B?QzkwWnY4cGRDQmFBTklmUElFdG5UUGNPN3phWTNwaWR1eWhBMlJ4OW9DcHFm?=
 =?utf-8?B?R29KejZFM3EwOWtwUG5KU2NrRlU2anpkSHJpb2w1bVV4MW1EUndIUlJacnUw?=
 =?utf-8?B?OURyN2g5RHIwTnRTTmc3ZXRQK0NOQ3RzaEtQckI2ejJqNUFuMnRlT0ZUZjhB?=
 =?utf-8?B?V0dVaU8vOTZxbVJOSlNScndGU0MzTVVSOCt3VUVhU2tDY1lPcHJWU3pCVHM3?=
 =?utf-8?B?c0Z4aUl2MVp3ZkplV0dWZWhIV3FuaWNnTDJEN01TRWtvUEM4ekhHTjdIekk2?=
 =?utf-8?B?REhaQXdteDkzL0VxOFg5NTVHWDNSN0l5Ykh3Ym1ucFhwSXNhTXRYdjlwWEZR?=
 =?utf-8?B?eFBQRnVpRFBjMzhXQ0pNOXVTQkVWMVcweTM1R1VYeXhKWkVZYTJIR2UyR3NO?=
 =?utf-8?B?NHljUjdqVWtxUUp3Y2RGYXJJN0c5UGI5cko2L2ZvdWd1RjFNa3BEekhxckd6?=
 =?utf-8?B?bWo0NWlTeUZFcjNITTdRT3ZWN2hjMXpITHNzTFh6RGtReDIveUdrQmV4UXNI?=
 =?utf-8?B?azlnaDg2U0Q0NzFjZDFxNUhxbEhGQjJmbkJIRDVBZThneGk1MlFFTmRDM3Vi?=
 =?utf-8?B?VWtMVGg0SkJYb0swcXprUTVhTEJFTUtuSGZwc0dCVkMva2NGMk54Nkgzdnlt?=
 =?utf-8?B?WE1INnZQYW96bUNFNGJVeGVJcFhIenBmR0lhbDJ0YUJ1ZWt3SmpMcytUN0pI?=
 =?utf-8?B?ZzFtSmZLTlZlL0hhNFZEWTBpV1BhUDkwVjM5OEtsRERYcVJXOXo3bitWTnNn?=
 =?utf-8?B?dkpLdCtpTTVpcHgyVld4b3FtbzRpNVdBV0ZQYllHY0RETDZFbjNCUURRRGVW?=
 =?utf-8?B?aUt4UEFia1h5SUZLcTZoN3hSMHRsR1RmaCtOcUVRc0NlMm5ZcmhqMUp5Tjhs?=
 =?utf-8?B?eEw0NTZUdUkxSzcrb1VjTmhtS285eE1wYUF5VGgzTGRzc2dOVkdPNUFLdEx4?=
 =?utf-8?B?L21ocUg3SVR0Z1RYYXZ0d0ZOcFJ0ZnhMOGdwYTRUbFBoOHJNUjJzTXNtVjV6?=
 =?utf-8?B?MTBRUHIwVkdlcXV3UWVrOWo3d0YxSDFGbGUzVmQ1YVBlSVYvbWc3RE5saFRl?=
 =?utf-8?B?ODM1Vk9vcUlHdDYxUW9RLzFKSzhrTDlsL1QyWmhaZTFON0NtYkNQczJCT2xZ?=
 =?utf-8?B?UEJCVHhMTzc2L3gyYTZMS24wSm5VL2F0enJ1NTVIL0MwYkZoT1RVNzhUdXJa?=
 =?utf-8?B?cXJpRS9ybWFTVkRYM2N6QlpzRDFsRC8wNXhlWFFtYnJzS1JPQTd2SHZGSXZ2?=
 =?utf-8?B?QmdhVlowSSs5RGlLQ2VkbGp4OWhnN05pVlZackdxcENOTUYrUDRyOExkdEJI?=
 =?utf-8?B?WjcxU1JWeDVGV1dIV1JBdUJ0OU03SDI0TU9reHRWemhlRlEzbWZPcUk5TVBV?=
 =?utf-8?B?RncweFRYeFp5c1pKQzJHbjVwQUNKTitwZEw5eEQzekxJb3dOYWU2MnpSb3Z0?=
 =?utf-8?B?NXllNWxiTWx6VGE5TjRrbWF5RHk3OXVTM3I3cjlRSUMxdldmNDBuOUQ4YTJs?=
 =?utf-8?B?aGJXNWloNFdLTEtaNmk4c3k4SGVKeXZtUkZwSjJJUmxEUTRRV2F0MGVHMmFm?=
 =?utf-8?B?ZmEwL09iajdQQW1ZQ1V0djM1N2NYaW5nM3lYeFRJSTZKVHIreUcvdWNhZ0pG?=
 =?utf-8?B?bmxIR091WkpnS2JhOG1rSTVTZUZjaVZZdWFpOW8rbVFwSG5aVVVuVmVPR3hm?=
 =?utf-8?B?Qk10UmltRDE5Y2JkV2V4YTZyT0kzbERISFlrRkdkek5RL2l0Q0x2YjQxUHFu?=
 =?utf-8?B?ZTBLeHhzekJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 14:13:53.7149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9267ae73-b516-4847-9716-08dd75de6d9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6843

On 2025-04-07 06:18, Roger Pau Monne wrote:
> When running as a PVH dom0 the ACPI tables exposed to Linux are (mostly)
> the native ones, thus exposing the C and P states, that can lead to
> attachment of CPU idle and frequency drivers.  However the entity in
> control of the CPU C and P states is Xen, as dom0 doesn't have a full view
> of the system load, neither has all CPUs assigned and identity pinned.
> 
> Like it's done for classic PV guests, prevent Linux from using idle or
> frequency state drivers when running as a PVH dom0.
> 
> On an AMD EPYC 7543P system without this fix a Linux PVH dom0 will keep the
> host CPUs spinning at 100% even when dom0 is completely idle, as it's
> attempting to use the acpi_idle driver.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

