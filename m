Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B738B987CB2
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 03:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805959.1217220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su056-0001C0-EJ; Fri, 27 Sep 2024 01:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805959.1217220; Fri, 27 Sep 2024 01:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su056-00019k-BY; Fri, 27 Sep 2024 01:47:40 +0000
Received: by outflank-mailman (input) for mailman id 805959;
 Fri, 27 Sep 2024 01:47:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KsRj=QZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1su055-00019e-7G
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 01:47:39 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 788841f9-7c72-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 03:47:37 +0200 (CEST)
Received: from BY5PR13CA0017.namprd13.prod.outlook.com (2603:10b6:a03:180::30)
 by SJ2PR12MB8926.namprd12.prod.outlook.com (2603:10b6:a03:53b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 01:47:32 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::60) by BY5PR13CA0017.outlook.office365.com
 (2603:10b6:a03:180::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.15 via Frontend
 Transport; Fri, 27 Sep 2024 01:47:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 01:47:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Sep
 2024 20:46:59 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Sep
 2024 20:46:54 -0500
Received: from [172.18.112.153] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 26 Sep 2024 20:46:53 -0500
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
X-Inumbo-ID: 788841f9-7c72-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iU/Q8VKD1br1d7wdQqO7Q1oiqZkLjyHWU1L/1zEuuTlRZdTp0KugtnoPArp4hsn/0+aRAeQDSDpxKVVt9BFLbFdTUGe71QJLgYxQLNOrlo1+6R7QnnUeVM6HFoFhtYmLZE9s5UMKeunNb0xCulilXc4TVB2k27VwwGqN1fdGRpSVdjZi70d+M1IEDnm3CgBvthc2ImerUKgK8gfTXDBHCGMxgklTAzTj4w7XLyZiZLUC6OMm5Qpj5Yu58050kv7jCjA2T9Tgw3OXYmohBw2EDlVbWceuuSc4Fm3eaQ535DVc7z7dBAzaRh0TUQZzUvrlew+W5C7MunHu6yvJ9KkJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=re69GDicJsTVYB8i/wCJt4K1EhDG8JMiCWJegOKlVFw=;
 b=e0I7xmXpkCvtXlSgmCZRuhWczbLgbGxYA57K8ZT5AGmki41awPLwcS96BbdcRd0aWtnUExpsG8/ycRtsDo5rKeFimLqu1iQguhX2nRwgR1woKeHAcaoYzLjOi1+1aYo4kTYK68oMbSMaHTFO9P+E5MZH9GMt75m53W+tDRWIB0oknCNBwvDKZEmosuyfkD59fw9T5a3lszRlsYn1sjoniblHvcC216eAZHNOKqGC7JeXCIAH+fPi6veNIAK64gC6VYTPaEWLm59Aqfcut+3ZnjGk1VRW+NLnrvS/lw2HFkCOAM83tEOdmdVDbGqiQm2TJ7dg2GSI4L3NXbyN034WtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=re69GDicJsTVYB8i/wCJt4K1EhDG8JMiCWJegOKlVFw=;
 b=wFMNGr4t/66QbS97MsVBK1VfE1XCPkolbspCDIuqnobu3xjeC1rDSllKfuHRNZkoOpDK5Qom8ZResleX9ri8p1eYfZSk1H5cVHKxC2OyaNjvEXehq2toMhE6E/FRkixv8w6uQM9tJyUu3fiptqVCv+I7WSglspi4lL9YQ3wZVmE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <572b339b-7dab-4db0-8ee8-d805f8211aa3@amd.com>
Date: Thu, 26 Sep 2024 21:46:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86/xen: Avoid relocatable quantities in Xen ELF
 notes
To: Ard Biesheuvel <ardb+git@google.com>, <linux-kernel@vger.kernel.org>
CC: Ard Biesheuvel <ardb@kernel.org>, Juergen Gross <jgross@suse.com>, "Boris
 Ostrovsky" <boris.ostrovsky@oracle.com>, <x86@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20240926104113.80146-7-ardb+git@google.com>
 <20240926104113.80146-11-ardb+git@google.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240926104113.80146-11-ardb+git@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|SJ2PR12MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: d0af9c1e-4caf-4712-54c6-08dcde965a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1lrZzc1YllEV2txOWhkYzFneTZqeXVrOW94NHZwMzY2WmY5SWJ3dU14Tzc2?=
 =?utf-8?B?VUlWbm4zdG5CRkRBeXViRmZJTzUwbnVNVVJwNFBRWXhLQTU5WXdFajBETHlh?=
 =?utf-8?B?d3hPOVErL0tESjJtTDZoV2JJSUF3cm56QjhPWE1TVVpXanZwLzhza3lxL1hJ?=
 =?utf-8?B?VjVIbmNONUVGTXVuSEFrUmJtT1haNEx2bkg2cGJZbkFkdWhBRmxlM2NxL29P?=
 =?utf-8?B?dVhhaVNaUjJXSUN5eHpUUFBPSlFETnl2b3QwL2RGMEtaUElnRmNUUmhQMlEy?=
 =?utf-8?B?dWtYcktIR1Z2VVpwaTU2aVRzS1VIS2VTK1JUb1ZyN2FtMlE5Ums4bDAzS2pj?=
 =?utf-8?B?VjJyeUdVeThQb0NRc092NGdOZ3IzSzNxc2RMUHhTNU1GQWxSZE4zZ0dRb2JZ?=
 =?utf-8?B?SFQrOWtXZEFYVm9ISTVQNXhycERwZHhzdlZ5TXFqOW5idSthb2h5OTFOV2pz?=
 =?utf-8?B?VFFWM3R4T3UwUVZIQjlQdXp2ajF5UlVlb1N2QVlRVyswd0VJMUxKVmxucmZr?=
 =?utf-8?B?K1lNSThmVmlXdmd4akpNUkhYUzZZMWRKckQwN3k4eWd5S1FISHY0dE1TaktP?=
 =?utf-8?B?Y1hmSEV2VWY2cDlIanlKNVRud2daSlRqUGUyZHh5cjVOM1J6aS82Z201eWVD?=
 =?utf-8?B?ZWZKU0VxOFlLYmlGN0k2MW9zYUZKNS81NEJyaGFPY1FmSFBtaVdSTTNxT2Ns?=
 =?utf-8?B?YzdyMVhIM05CenhwU1lZN2hBRi9PRCtkYmVDTmtxUVpjZzVEY1NyU3pSV0hP?=
 =?utf-8?B?aWNWUFhsZFNXazQwbk5RMTRzMnVpYnFtTlRmTWJGdWs3ejlPWVZGOEdQSWNJ?=
 =?utf-8?B?TWxRQmlsVEdYR2p5V3pycDlkMDBZd3ZOMTAwZEl6alJGcC9GNlRid3cydVhK?=
 =?utf-8?B?dGV5QXNJY0h6Ni9OVGhLWGN2NFVDbGtYYmRvZXZjQ1pvWnUzWHhuSjZaMWdQ?=
 =?utf-8?B?bExNREpKc2VsU0NKZk8rQ3o5QzUwUTV6N3RLcm1lVEhnWCtQNkhxS0J4TXZF?=
 =?utf-8?B?cDkxdE42R3hqZ1hkazBqbFp4czh0WDN3WmVHcTc2bWJIZUZNUGNXdUNUN2hr?=
 =?utf-8?B?Tkp4SHFHWllBMk9EWjFHaXREUkp1eVBHbTRMV0ZHN3c3OXprK1gycFZ0Ui9L?=
 =?utf-8?B?V2VBZmxTU1MrbXRkdzl6QTBCR0p6UXNqVVhvQVdZV2IvUzRMTSs0Q3lzMk1o?=
 =?utf-8?B?amtsSmsvK20vcEdJVFVwUW01Ym95N3JnV2g5YVhZZFpiUk5Rbk9DV28wQ2U5?=
 =?utf-8?B?SkMyWWVIYnl5T3B6RVFERjVEenVTME11OTI2S0hXUzlNVElMRk5Fa3daeVlJ?=
 =?utf-8?B?aTBrWEpReElBMWkrVERnbWFZbGhNVVdSUmx2K3c0Q1VIalMyOC80ZXkzczVW?=
 =?utf-8?B?R1JoZFJWMnRQazI4OXJQSFYveTZDd1BFNTBuRERxYk9wRkdPbUk3R3YxVkor?=
 =?utf-8?B?S1hIWno0cC9TV3JmdGkycC9scG1PVEtqanBJRmJHT203MjFnSGRILzdod3ZQ?=
 =?utf-8?B?SWVQOTlQZ0xENXREK0N3VEt3WXBMTnFWMVdUazl5eDFXMXl3QnR1Z0xEaXBW?=
 =?utf-8?B?dERIUkFqOURMbUZxeXBWb1lCc01ML0RUU1JZRmIwWTJCYTZmalNSVG9JQVM1?=
 =?utf-8?B?Nk1VL3Z5VjYwMWhYaTY1cmJtOVZXSDhxeVdzMDlCWXBxdDJ0UjdBb2ZXaVlS?=
 =?utf-8?B?cjJMay9xaDRpNmsxVDIrVXpUeXp1U1Q5VXczL1ZaWGM1cWRKTnhEMHVWRkRK?=
 =?utf-8?B?VjJOL1M4SGYzUUxsRlFKdUVnRk1ZdWtCMGZRNGJYZWtVcG9NNTg2azR5aFlQ?=
 =?utf-8?Q?cs9PRo2JToG5zA07eHDX0uWfd8hXuh8/k7GY8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 01:47:01.2294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0af9c1e-4caf-4712-54c6-08dcde965a1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8926

On 2024-09-26 06:41, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Xen puts virtual and physical addresses into ELF notes that are treated
> by the linker as relocatable by default. Doing so is not only pointless,
> given that the ELF notes are only intended for consumption by Xen before
> the kernel boots. It is also a KASLR leak, given that the kernel's ELF
> notes are exposed via the world readable /sys/kernel/notes.
> 
> So emit these constants in a way that prevents the linker from marking
> them as relocatable. This involves place-relative relocations (which
> subtract their own virtual address from the symbol value) and linker
> provided absolute symbols that add the address of the place to the
> desired value.
> 
> While at it, switch to a 32-bit field for XEN_ELFNOTE_PHYS32_ENTRY,
> which better matches the intent as well as the Xen documentation and
> source code.

QEMU parses this according to the ELF bitness.  It looks like this reads 
8 bytes on 64bit, and 4 on 32.  So I think this change would break its 
parsing.

(I don't use QEMU PVH and I'm not that familiar with its implementation.)

Regards,
Jason

