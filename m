Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90CFCFCDB8
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 10:29:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196601.1514375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdPqZ-00013q-7T; Wed, 07 Jan 2026 09:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196601.1514375; Wed, 07 Jan 2026 09:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdPqZ-00010j-3m; Wed, 07 Jan 2026 09:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1196601;
 Wed, 07 Jan 2026 09:28:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K00X=7M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vdPqX-00010d-V1
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 09:28:53 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 473aa49e-ebab-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 10:28:52 +0100 (CET)
Received: from CH5P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::13)
 by PH8PR12MB7160.namprd12.prod.outlook.com (2603:10b6:510:228::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:28:47 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::70) by CH5P223CA0017.outlook.office365.com
 (2603:10b6:610:1f3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 09:28:45 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 09:28:46 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 03:28:46 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 03:28:46 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 7 Jan 2026 03:28:44 -0600
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
X-Inumbo-ID: 473aa49e-ebab-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPWXYHpYGShufnPfGbuxYGQHOoK8VRQvaU8CEIC0BwLAgSyuNqH72oTKwkpa158M/BMe3U047fnBRSn0+RY8BnQh+jYUmNOfbh/V+gvJNyzectBp9undCaO8s+EfrZSNc4bAM+tYZxBSIl+rN1YasHyBQ152xr6OCXToUvFzlJGlWGxGLX2s1WGeQ4nj6FmGu7AA/QW4NqNBl55Xkzy7W/pjBDcFmpZzProRBpfjD744Qwg3di6uKuSvphpabs6Fpwq52ZMqlrqld8LTBrROsmaxuXj+inc5Unnkm65BGN8OHAASfLN8/E5ArIhbW9Xe7AdLkcxjk3ktWyn3acAwyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UoDb6Q8KguDMR7LN1tfDEbuUdx8ct0CfkvN6WWC19FU=;
 b=FMo2FkrMpZVXFGt3h666nKnpbx2Lsrxqv8/glRoZ9k1EROhcA2d3VcS/s7kZdYsSPVDmAuskzhocLMMXqxNBnKTWF0hc01vWPmR53m+13u+MHYwH/4DGkh8ULCyzesACkW7+uHRYm+CTpo/V3wfffrd2Lxni6C6XkRi9wVpj0cH6Eve1pGIPueWxFhUjgHjTzgvOMeSSB6pSXUOoBT9AHTNUpWhaEu9zDhQE28ecQDqh2fwFmJdXVKcE5ZzdH6HIWqJBXzw8mLo5hssXsv8pDWNjExTJzNMVFoe2A5OP03mbebSgDi4TztLteuJHqQuw+vmaUreQDi6jMe3C87GRNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoDb6Q8KguDMR7LN1tfDEbuUdx8ct0CfkvN6WWC19FU=;
 b=iaFcnTcBw2RX4JBJBbL0KJWF5pL3I3qHqGVP59gULyxbXKKMRMYv3BpVVPY7PvxxIHVbhSUlJQ2oJnuqx1NT96SNauNjFT4etIrDdDL43ZiBFcwKvhUbWuZphy3gc0tPy0WyqbxcyDJcH89/KRltZo05cvBeRnVzJw84DQRbfdU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <5e8ecd71-38c6-4844-919d-d2e97c088038@amd.com>
Date: Wed, 7 Jan 2026 10:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] xen: Split muldiv64() out of lib.h
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <20251230135050.188191-1-andrew.cooper3@citrix.com>
 <20251230135050.188191-5-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20251230135050.188191-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|PH8PR12MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d6b14c-19e5-43ae-74f2-08de4dcf2899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REx0WUx3bnAxVWtzeWxvRUxxTEd2QzRocFQvS0s0UnlFSjBLWWhTeFIxZGVZ?=
 =?utf-8?B?NzNwd3JjaDJudTh2eS80TTM5ZlNWZ3IrRU15V3FOcTRSc28xdk55bWpvTnp4?=
 =?utf-8?B?U3BlUC9vT0w3NTBMR0dMdUhhblh5VWdhUVg0SnhmSjBkQVNOa25yNmNYNitF?=
 =?utf-8?B?Sm9IQVBCb3VxTEV2L2g4TkFNREwvMUxBcUZrSSsxRjVZN0lHeHBsd1IyeTh4?=
 =?utf-8?B?WU1LYWxrWjYwNGFicGJFODc2b1FTRXNjM1pDOW1ZWDh4RTB2aGJobkwvTHhl?=
 =?utf-8?B?OE45bi9uNDROampPQ1NqOXpuSGNIZDFJNWJqUXpZT1FRbFQ2SElhVHpWd3Fi?=
 =?utf-8?B?Tmp2VzJlcHZNZ20rT1BveFJYUEYzZ0t1ZEVjaUNRUGNpckt3b1A0N21qcnlE?=
 =?utf-8?B?MjROQUhvWVRvdTQzQnpaUUloc1BpWXJ2ZkxmUFFRUFJYVkMrbzYrWExzNExF?=
 =?utf-8?B?azFPbVU1VXc4MW05aklMb0ZVd3dINHNyWURqb25YVkJJYnpieFRuekRwRzQ5?=
 =?utf-8?B?Y2p3dmxiTEZXUzV0YUZ3WVQwbEpObDQ5TlFrbllPQXdjK2x6SHRWVXgyRkNu?=
 =?utf-8?B?LzlDckxic1l6OGFFc010KytGNGVtQ3JEc1JxbTRhek1qUjQ1cmttK2FOUzNp?=
 =?utf-8?B?VGhnSDRnbWNOMk9OcDlpdVVDcitMa3NsZXVJQVdWMjZPMmwvaWMwN2dDOC9H?=
 =?utf-8?B?Ri80NnR1cTRnK290UHVZUk9ySDRxcU0yN2tKcHZ3ZndFVWdQdkFZWGxCVWor?=
 =?utf-8?B?NzlxdDBoVm5iSUZFK1Y1V2RWUHpZaThKNk9ISDdBMU9vRmh1QjhrVlNiQ1hN?=
 =?utf-8?B?YzBOWHdwVjdXeXErMlo5c0FyemdrNlNaaUs2bGk0blE1R3hGZFRaQkdGN0Jx?=
 =?utf-8?B?NmtzNlZWbVJvQzRzczNMU1hMaGNiK3dJRVQrYUJJb3BDMGlPMmlzL0RLeFJo?=
 =?utf-8?B?MjZSbG00Ri9aMmhsUUFmZmU4UEozb0UrdFZHWjlIL1V1MStqeUFUWGg3TUt1?=
 =?utf-8?B?NzR6Q2FVTjRnR2huMGwzckROVmpGZjJGUVk3cCtia2xyMk9kN0kyUXVxU21i?=
 =?utf-8?B?NjgrNXZRcXF5WlZzS3FUbkRCcGJwQTNoR2E4ZDhLeUU0Z0taQ0xBNXdqNXBx?=
 =?utf-8?B?WDBMd3FuNUROeXZTaGpCcFJ5WVBmcDhJdERVbXdTU2lEOWpZdTJ1Mm9pbW16?=
 =?utf-8?B?bTBvNTF0NnBUTzFEQlVoU0Q5UlhpYnBVSWJEbzBhZlprZkF2UEFIQzFPMDF0?=
 =?utf-8?B?SmpjSXU5bW5JN0FCVzkwdFZzekdaN1JidVEwQks1VEdsWEQrMTVDODYzMnVO?=
 =?utf-8?B?WFFVYXNVU09oVmoxZklRZUpGY3hQejFyaUtCTEZ3NUltNXMvQ0c4dnNORUt4?=
 =?utf-8?B?T0o4TlNONHRsVWlaTE5OVDF2TitNeFhkZWxiZWlrajhTbEZGNTZaZXNVR1pk?=
 =?utf-8?B?MzJYRHhkVHJqdlE0b054MXh3SzVuWFdVS0hRSWlvK3d0TXlTM0dyeVBXTUxz?=
 =?utf-8?B?K2hmZEh2ellJRWd3VmJFNnNnWk9uMi9YbXE2aEhvRUJVL2hCaVIzZGxQTDZX?=
 =?utf-8?B?SW10MSs2RFcxNTllN2FKNi9GT2cwKzhqVUF6Yy9zWFhxWHZPTGMzRnkyMXBi?=
 =?utf-8?B?ZFM2TkNrdUxrR21kMG5GMFZqZUFQVWorRjAzeXZMMkJLTmVLUkx1V3FsZ1pL?=
 =?utf-8?B?SDZpZURIamdabXRwVVAxaWUzaEFDbTgzdWZwRTN1Si9tSU1IMHJ2NTc3NDRk?=
 =?utf-8?B?cEE2Y0V1TEluNE90WkxmS2IrMFAyLzlvVVRmMlgzbUhkVlFhRXlPaEZxcFh2?=
 =?utf-8?B?SE5qWlg4NmpINTVPaUpUY2xhdzYyRVNWR0RIZWpUT1hoMVM0NGtHbG1QZmlE?=
 =?utf-8?B?WU1Oc2FjVnRDRSsxYWw5UkRDdE56K21TNURlSUhvSUtpZm52MUtLWDJ5ZHV0?=
 =?utf-8?B?cUMrTk5EbUI0aUJhY2lrMjJiMjJkL1RZYkFkUkc4d2wvcnJ2bXdoWjNBbXV0?=
 =?utf-8?B?aHJad2hFTEE4aVZqZVk0YXhsNEFTMGhzejkveHhreExyMGlLOFppNkpjaE5h?=
 =?utf-8?B?eG9LWHA4RGQyY2dyZGFRb0d1Nzh2TzVDa3IzRWpnVVVURVN1MTR0ekdYMlp2?=
 =?utf-8?Q?d5Co=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:28:46.7351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d6b14c-19e5-43ae-74f2-08de4dcf2899
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7160



On 30/12/2025 14:50, Andrew Cooper wrote:
> muldiv64() has 7 users across all architectures, and is limited to time
> handling functions.  Therefore, move it's declaration out of lib.h into a
> dedicated header.
> 
> Rename the library function to generic_muldiv64(), as x86 is going to provide
> an arch_muldiv64() in a subsequent change.
> 
> Explain what the function does, including the limitations; x86's version will
> suffer a divide error rather than truncate the result to 64 bits.
> 
> Annotate it with attr_const, not that this allows the optimiser to improve any
> of Xen's current users.  Add one selftest to check the internal precision,
> putting it in bitops.c for want of any better place to locate it.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
For Arm:
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


