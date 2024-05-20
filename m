Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2068CA10A
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 19:08:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726291.1130565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s96Uh-0007lh-Ng; Mon, 20 May 2024 17:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726291.1130565; Mon, 20 May 2024 17:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s96Uh-0007iV-K4; Mon, 20 May 2024 17:08:15 +0000
Received: by outflank-mailman (input) for mailman id 726291;
 Mon, 20 May 2024 17:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l4Ei=MX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s96Ug-0007iF-1r
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 17:08:14 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 892e8f18-16cb-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 19:08:11 +0200 (CEST)
Received: from SN6PR08CA0031.namprd08.prod.outlook.com (2603:10b6:805:66::44)
 by DM3PR12MB9390.namprd12.prod.outlook.com (2603:10b6:0:42::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 17:08:06 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:805:66:cafe::43) by SN6PR08CA0031.outlook.office365.com
 (2603:10b6:805:66::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 17:08:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 17:08:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 12:08:04 -0500
Received: from [172.21.89.32] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 12:08:03 -0500
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
X-Inumbo-ID: 892e8f18-16cb-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPx+vZqd5fh6a+fn0pMfmqQlSjbXCirP6jgTFM6CAb0zwsFNWub957mVPVFyDl10G4f040e5Rtghhjjmjtm1L1KMKS/l0ZXITuoO4zO4JDRXvn9UfSCE24A28DZWH3qHNm0F0CBitMxBDE8IhV0NM9gXzcJNXMeRL7F/W5PC8baebBkiG3R+3WFKWMNWNOEkpC5IZzZtR2+m89jSq5Bvk9gNxEe0Fzzgzh4LWMsl+hkV2dLE5y4gyF1lk9arHiVrCvQpEYnX58APunEhR+PnuM/NxyxJCOUQBFbL7FtsW41Wn9Aspyo+iyMRHp9h4iGyWqQRItTDTDoeZHjXwyUuLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCxy5wlf43fGF5cch2iu/1Mi+Qa0MXpy3LB2q4FujXo=;
 b=Amejcxp+2Pd6iJnXk6vW85O+WC/yOJbIl4EIs39//dSGbXM1E/TWrWJLnFHORUY9nBSq5ehRO4Isq4whTCuzouYiQVzVaYC6+AK/0uUDxr4EJSZYwpdvpPk6XKV5T04C0pHtxDhm5HD3YFG7SeXo5bBgJ384dJdGna9a1O5noyhq1JM6+5PhtLIuafqAzsHDRuwQkCnFQ/LNytjgsfPzCjvUGNQLplTH2ktX0gdtd6nG+8DD1CFp+SteD9J4bYX9j2FU8fBFPRnXdmjNbHm5y7ru74WLWE6FqMqfOVlMm6NI1o0YPQBl2e08dQfvyTgJRT8nJBzbo8pOfFAONHukbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=solinno.co.uk smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCxy5wlf43fGF5cch2iu/1Mi+Qa0MXpy3LB2q4FujXo=;
 b=VaHAmdfGg6ftujwiri4cyVumXSLOPxGQaCFnEgvt+u5W7iOQjE9244YkDu+AaS1YOYtPmEWy+URRqxg9R6mXFpz99+oMg5vckRUbxgATk3S8oT3CGxglPhBUOudHyFTeTD8bZDcAmR1Ripl969T2aLR2l7eSPmVTVSB9jECI49k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c600e5e8-d169-417c-bc02-d33e84dca0fb@amd.com>
Date: Mon, 20 May 2024 13:08:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libs/light: Fix nic->vlan memory allocation
To: Leigh Brown <leigh@solinno.co.uk>, Xen Devel
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>
References: <20240520164400.15740-1-leigh@solinno.co.uk>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240520164400.15740-1-leigh@solinno.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|DM3PR12MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea4b879-c83a-45bb-6799-08dc78ef6a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3cwZGlpSDJEbGorVlBZeW1Gc3hTZEowQVZhV2xaL2NDT0VZZldqYVNXT3pO?=
 =?utf-8?B?SklhdnRqSm1CVDQ5MStLM1pTMTkxRjUzNGJ2cExRR1VTc0M0WnpQQWp0OENK?=
 =?utf-8?B?RkNibnZYWWFJQjNYdVpKOGxMdGFkR2JzcThoRXlHZVJ1QkRVNDUyMTNTSzdP?=
 =?utf-8?B?TkNEZmNZaXhyWVV3Zko1UG9xeW1LRXVnNEhSdUNmTWQvSDRINWV3YlNWZzla?=
 =?utf-8?B?Y3VxTkVXZFBGY2pVQm5ydVFDODV4M0xlMG1OcTY5YXBPbCt2TjdwdnR1OG1i?=
 =?utf-8?B?bENCcGpUelNPSWh5Nm5CSStDOWdCS3dtbU1sZUpaenJSZTRDMS9TYjJKTkZ5?=
 =?utf-8?B?N3BKSDc5Q3d6a044RU1kQ29uVjhLUzN4aFdMeDlpY1dKTkw3WUdEYzNJeTNq?=
 =?utf-8?B?ZXZBcFQwR0ZSOXpUM3ZTT2ZoT1NiTWpiTEpud2J6MVlqM0xpeUVsREp3a2Zw?=
 =?utf-8?B?Q1pFdVI4UTk1Rm1rd3VQMTFmeFBUSVFOajJCeDZqLzhQOFV2Q2RRbmU3c0FH?=
 =?utf-8?B?K2xDY1hUSi90TFh4eDNNeWdMNjRjSHMyeVk5b3I2MG83Wlh5YS9FczM2ZS8r?=
 =?utf-8?B?alIxeXlZS2F5c1VaMGZJV1d1ZllVVzRZcllpV0lxS2Y0R0lDRXl0NmtTRzFz?=
 =?utf-8?B?dldFejZCRHhwd0JZYzJIZVpSQnhWbFhhbU9uK0xmMjdaRktvaHo0MkVpTCt1?=
 =?utf-8?B?VjljSjg1QWtlbW9SZmpvc2pZM0tZUDhNVnBZN0FOTWc0OWZNVU4zb2I5SkJZ?=
 =?utf-8?B?NXp0b0xEcFprSC9iTmRpc0VuZUV2MzRDQjRkaUFTamxkK1pBdlJzOExXaGpW?=
 =?utf-8?B?a0NKZWNRem5hSkE1ajIyQXRKT3FZSitOU2NmalhJVVdiMzZvU2VmNVhXbkJz?=
 =?utf-8?B?YkI1UkpKSjFLNmFtQ1d3MituTDVjYjFIWUExL3diQ21sd3JaTm1YWnR3NERm?=
 =?utf-8?B?RGhTZWhVaXd2c1dSVnZDS0hCc0NpVXBvbWVwNXZQM0VsbDJETGJNK1Z6YnVQ?=
 =?utf-8?B?RG8vWktHRFZ0TkNteVhQcWNDdmorcVNxV0dianhxb1kwd1czbmlEcjZpSktQ?=
 =?utf-8?B?TnNvWGtFNU9ic0Nxa2hIc3JLSUowS0EyeGRLT0FUYW9mSUlxUndlY2lKa2E3?=
 =?utf-8?B?bWJoSm8rcjJzUk9FKytDNjQvRzdIdndpbFhITEU1VFJuOVF4ZXBzYVNvZXl5?=
 =?utf-8?B?NWlBYm0rQnB0bTR3SVd6ZW1lSjBSYXZQeUlEUEZhTm5sWlRDRGdwY3N2amRN?=
 =?utf-8?B?ODFJYU9PSU5LbGNRS3IrUFVwNCsvQUlNV3RYaWMybkphNEhrTUt2VWVCQXNE?=
 =?utf-8?B?TGFSTFVMaUtJRi9wS2RkOHlMNFdUdjhwVWdrMXBGSmR3cG91NFFvaGtKc0FL?=
 =?utf-8?B?RHRhM0tMR1cyei9WT2xNejdyYVRaalRTM3dEVXUwMTFFRzlpMEtCQzdnMVI5?=
 =?utf-8?B?ZkRlUVpyajIxZDY2YmxpejVIWFFoZWFSM01USzNGVS9rOGEzbVNFbXVycDBE?=
 =?utf-8?B?Y25YcmdML0pqWFV6Sm1uMkp3SVRwNGQyRmV2a2pBQVpyb2FpdmxMTEdRUEoz?=
 =?utf-8?B?VGhDSVJ4clN4NTE3MEFOdXdtak1aeTVrT1hsaUtzL1NOa1VUZCtEUHZaNEpr?=
 =?utf-8?B?L203bndmMnRFSzRNOC9Gcmo3amJEVDZMeVNWS21WQ2RxSFlCU0gwQVBFUG5o?=
 =?utf-8?B?QmtHaGxweXVvcWhXMzZ5VDhzVzg5VjhaMUdQbk5DdlA4Q2ZuMVVIZm10VHpH?=
 =?utf-8?B?UnZKakJvTTl0ZXBYeWszUy8xNTlBQXNjc01oazdzOUF1WDNLUmNYTXlYdGo5?=
 =?utf-8?B?MUhLLzFjZ0dRUjl3TDNiRlBVaHBqVU9HeE95aGhYTXlTZU5JMmEzRTlLaEY2?=
 =?utf-8?Q?caVsl6x8ELPEq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 17:08:05.5248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea4b879-c83a-45bb-6799-08dc78ef6a4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9390

On 2024-05-20 12:44, Leigh Brown wrote:
> After the following commit:
> 3bc14e4fa4b9 ("tools/libs/light: Add vlan field to libxl_device_nic")
> xl list -l aborts with a double free error if a domain has at least
> one vif defined:
> 
>    $ sudo xl list -l
>    free(): double free detected in tcache 2
>    Aborted
> 
> Orginally, the vlan field was called vid and was defined as an integer.
> It was appropriate to call libxl__xs_read_checked() with gc passed as
> the string data was copied to a different variable.  However, the final
> version uses a string data type and the call should have been changed
> to use NOGC instead of gc to allow that data to live past the gc
> controlled lifetime, in line with the other string fields.
> 
> This patch makes the change to pass NOGC instead of gc and moves the
> new code to be next to the other string fields (fixing a couple of
> errant tabs along the way), as recommended by Jason.
> 
> Fixes: 3bc14e4fa4b9 ("tools/libs/light: Add vlan field to libxl_device_nic")
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

