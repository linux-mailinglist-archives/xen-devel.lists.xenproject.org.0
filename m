Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AA0AAE7AD
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 19:21:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978747.1365636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCiSJ-0002L6-CC; Wed, 07 May 2025 17:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978747.1365636; Wed, 07 May 2025 17:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCiSJ-0002JX-7d; Wed, 07 May 2025 17:21:15 +0000
Received: by outflank-mailman (input) for mailman id 978747;
 Wed, 07 May 2025 17:21:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqG7=XX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uCiSG-0002JR-R4
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 17:21:13 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20626.outbound.protection.outlook.com
 [2a01:111:f403:2408::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8ee2a66-2b67-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 19:21:07 +0200 (CEST)
Received: from MN2PR19CA0057.namprd19.prod.outlook.com (2603:10b6:208:19b::34)
 by SN7PR12MB6791.namprd12.prod.outlook.com (2603:10b6:806:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 17:20:57 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:208:19b:cafe::53) by MN2PR19CA0057.outlook.office365.com
 (2603:10b6:208:19b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.24 via Frontend Transport; Wed,
 7 May 2025 17:20:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 17:20:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 12:20:56 -0500
Received: from [172.31.225.170] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 7 May 2025 12:20:56 -0500
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
X-Inumbo-ID: a8ee2a66-2b67-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGuF53uvTm4NRvdJ47Aw27N+L0eVsei9Pvkp7hYu699cFFR/X2di2JX7qS+5rfxuwEM8k9JGAkhTgqsfFwstqIu+om0AlV8inlOK3aN+4kdJPg3nwkvxFYVVmkvaFTTf85o3B3PmC6bmBphAiRQeJIN+yo+DGsQE8DVOg6btYur1ojzIdzbnocAqatqCNPvyoqO6OFX8oaJgIIw/Jjtw3ltJ7UyYzv3cZUROSRZ48G3++2miy9y9ywWT4dV4ShQk7zeEEOPqMmPy9PpFXzMHY8V3DcaVrR59T23szrlfg50iClUydXZ4dQrzQpBdLM+YyRNWsp9gcTEBwzF8L2/QEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7zwlzDxVFWMIVz5N7rfByd0iCOg+5LUZzc8IQnhdOE=;
 b=SjAN45j6i3Z4o5rvT6Ce8+9Sl0GSpOHmAZAFe9MZDM6aOGdjG51ti5i+sCJ8n+bBRyVmAMLkbwjqUEJ91V5o7tU8euGFnFd4rhvaLc2sgWltISXJgvW23sgmQnNABC2GnsDjaBToc02but/fFBIHoYtNSLLNkMSYx1vgA2OtgqTzRgkTB4jUHkSFXHRbgj1iM1DU7Tdv8CPwEw8rrZuFz52MtrGWmuQogiCrBDE+2+dOLSwUfI2uPNPuOxEgKnpip6TFHjTElyTlC1FrGJhK4k+mfZ5oDKWx+1mcDfeLlBd0NN9CMaH1CWQWx2merbQqthR0W6ZZ/pzrWlp2P72y5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7zwlzDxVFWMIVz5N7rfByd0iCOg+5LUZzc8IQnhdOE=;
 b=ZZlHcQ6gHp/n33JPDUi2sxPmbGr66VlbZxx0O/hCylY2HJAt5J1Bx+zd6OeBarnSuLZyJv0UDdZ+DNirxbocqkQ2j6YxhDehPXBRk1aMh9fmOnGzL5qZTJHHCyiGsnQFAdgQwnUJm8c7WXtxWNm2s4yX1WANwAOKhHf9ew9XalI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <de2aad67-6a14-45c1-b007-5494fa856f9a@amd.com>
Date: Wed, 7 May 2025 13:20:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] xen/arm: exclude xen,reg{-cacheable} from domU
 extended regions
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250505025631.207529-1-stewart.hildebrand@amd.com>
 <20250505025631.207529-6-stewart.hildebrand@amd.com>
 <alpine.DEB.2.22.394.2505051627420.3879245@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2505051627420.3879245@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|SN7PR12MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b33acc-76ff-4f14-c0cd-08dd8d8b87b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0FiQkMvcVp6ak8vRGFsMmVpazU4ZncwVlNEOUtSK00xVmYvdUtBbk1MU3dx?=
 =?utf-8?B?c0JvNlpBNVVpZXZNemk2MmZMUUFSOHpoVlFRV0pNdmtBL29NK1VZbTREeVpq?=
 =?utf-8?B?UVZUMGZjUnE5emQzRnFMUXJFUmFuVjJTWkI4Qm9CVXZxN2p5anpoZ3lPZnZ6?=
 =?utf-8?B?ZXlYTGw0bkIvSjB2NGEwVXZjcE55STVRa29UR3VqcCtTbmtGME5KRjlab1NR?=
 =?utf-8?B?eHViL00zTyt4QlZmdkptTVZTcHFlSnNubjRJQTEvM01JR2xpbUQ0YmtFYm9S?=
 =?utf-8?B?b1RYMXR1aTltdWdkTjZDWDZHRjhRMS9SbFZDZm1QNlROMk5MRHdKZ2VhNkxy?=
 =?utf-8?B?Q1EwZVRJbXlRVnRaSHJhaTNYbTMzYUNQNFBLUFhGdkJZZCswNkVEdE4zbmNC?=
 =?utf-8?B?cU1kZGQ5djVPQk9XUmdFcUhBdno3SnRpSDg5cC9nSVBURkxrSUxDb1gwSmJm?=
 =?utf-8?B?NU80ZUZvTjJ6Yk9mdE5vR2RKY09SNGxiS3gzeG5oZWdxbGZ4SjJQYk5vZDJM?=
 =?utf-8?B?VEV4Ym1iRXZxU0ZUd1pFODlPTHNDamhhRllsdGNWZEtDRi9obXB2bGMxMWZK?=
 =?utf-8?B?QmF4OTBxSkxtREhNNWJOcWE3cE1JcG9oNmJ4eE5DVUVSSUNtUlVSVWVWVms4?=
 =?utf-8?B?bG9NNkFlcWxoRGExSTNMWHV6cUZKZmZjeE0xdVFJZVR3QmNIcXpKVUJmZXYr?=
 =?utf-8?B?NEc3aVVFbEhYV0JyVERQMFJKQnd3Q2NYWlFleTcxTEZXSllpVmZJbUk1bGRS?=
 =?utf-8?B?NENrdm5PRlZFc1p2L0dUYWZFUkRYNnVrZC9UaS9MM0RKQ0RmUVhmQ0Z6cmpY?=
 =?utf-8?B?eFkvTXdzZSt4dTRKODJlKzVmTExqUWlOb2FNWDkvOGF1VGxuMXZDbnhZeTZq?=
 =?utf-8?B?UkNnZW02NHFJSFN6YTFnYjE2aU15eW85dG5YTEpPbkJYMkxyU1NHTFB2RzUw?=
 =?utf-8?B?bWNGTzcra3VRdGhBVzB3bDBlMW5SSyt5OG9PN0lrbllzeXpFbTNzaVlRYVk5?=
 =?utf-8?B?SkIyclRRNUFlR2FUOVlneEh1d1UyRkJmY3F2clQzV2xnaHgveW93Q1hZNU8y?=
 =?utf-8?B?RHVjd0FtWkZXSmlRSzJ0d2FJTW5KMklSOHdzanFZNDRub1FuRi9jalAxaXR1?=
 =?utf-8?B?cmFqb3NmNVJTOWdjbTJGc0xTRmN1NGxtRUFCL1BwVjlnMjlFUWxSQS9aQjBp?=
 =?utf-8?B?ajFESC9tM3FTb0pQNXZkK0J3UHRGRUYzVVRNb1o2VmovYmdMVXBtMFA4QWh6?=
 =?utf-8?B?QVNhUm9US3lZaEpnOHl6TkJwTnhjUVJJejMrNWlQbUdaZ2FJaG1yTzdjTVRU?=
 =?utf-8?B?OUtwamR0a1FQVUFyVndaS3pXVWFCbnhESDJZb3hWMFVrWUw0bkEvU0VWTHJp?=
 =?utf-8?B?dUhySmlML0hId3BJOVplQitXRnpDQm1Fa0Y2eXZ3WllyTnlRY3ZXTVd2WXNN?=
 =?utf-8?B?dzcwQUU5NVhDVjVVUkc5WkVMN0xLMEtLOThmTzBjZ1paZHQrNFdFQzBjZkU4?=
 =?utf-8?B?MTlnZklQTEpOYzlwNFNLVlhEanNiYkh6L0VMVExxNld5MGtTeEdUb0kyWWVj?=
 =?utf-8?B?Y01oU2RGZkNuRWZTRzdqUGZoMVNiNmMwbFJ1dml5eUg3a2tVcHdmL0E0WGV6?=
 =?utf-8?B?dUIrN2xuK2VRRjRCYnN6dkRKWE03SGEwcFR6SVNMSHgydmFZTDJmejh4aXda?=
 =?utf-8?B?aG1Jb2QyeUNrcW1KbHZtQ01sT0Z2RmpUSUZvZHVCWkZUMXBpWTV6eUozUGdq?=
 =?utf-8?B?NGdRd0RYZUNRbW9sYzQ5Q3RlQnliMXIyaWtmdW9SZWlJcGovR05JK0xYV3VG?=
 =?utf-8?B?aExneDhCWVJXbjMwNzlLaTVwWTNRS1cvL2d5U0psempHNzF4SmtiSGtKdmNk?=
 =?utf-8?B?R2N0RExQUVIzcWhuRG8ySEFhdEQ5YmdxZG5HelJ1SHJEd0swQWcxRVlQbkVH?=
 =?utf-8?B?Ri93enN3SjlZQ0pYYlRTK2NPbkYra0g0d1FQQmhQa0JMYVNLUkRzTXExeDlX?=
 =?utf-8?B?NmhQblp2Ulo0aXFUL0tGY2FVb1lwclV1L09ObjdqNkppbWMrcDllOWF5TWY5?=
 =?utf-8?Q?2Cx2RO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 17:20:57.2521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b33acc-76ff-4f14-c0cd-08dd8d8b87b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6791

On 5/5/25 19:31, Stefano Stabellini wrote:
> On Sun, 4 May 2025, Stewart Hildebrand wrote:
>> When a device is passed through to a dom0less domU, the
>> xen,reg{-cacheable} ranges may overlap with the extended regions. Remove
>> xen,reg{-cacheable} from extended regions.
> 
> There is no reg-cacheable upstream, the commit message should avoid
> mentioning it

I'll fix

>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> Not sure if we need a Fixes: tag, but if we do:
>> Fixes: 2a2447757b3c ("xen/arm: implement domU extended regions")
>>
>> I investigated an alternate approach of parsing the partial device tree
>> again to scan for xen,reg{-cacheable} properties, but it resulted in
>> quite a lot of code duplication. Adding a rangeset pointer to "struct
>> kernel_info" has a much smaller diffstat, and then we avoid the need to
>> parse the partial device tree a second time.
>>
>> I discovered this issue when booting a dom0less domU with a device
>> passed through. Partial device tree excerpt:
>>
>>     passthrough {
>>         ... <snip> ...
>>
>>         axi_uart16550_0: serial@a0001000 {
>>             clocks = <&uart_fixed_clk>;
>>             compatible = "ns16550a";
>>             interrupt-parent = <&gic>;
>>             interrupts = <0 89 4>;
>>             reg = <0x0 0xa0001000 0x0 0x1000>;
>>             reg-shift = <2>;
>>
>>             xen,reg = <0x0 0xa0001000 0x00 0x1000 0x0 0xa0001000>;
>>             xen,path = "/amba_pl@0/serial@a0000000";
>>             xen,force-assign-without-iommu;
>>         };
>>     };
>>
>> The domU was assigned an extended region overlapping with MMIO of the
>> passed through device:
>>
>> (XEN) d1: extended region 0: 0xa0000000->0x100000000
>> (XEN) d1: extended region 1: 0x200000000->0xf000000000
>>
>> The domU panicked when attempting to initialize the device:
>>
>> [    3.490068] a0001000.serial: ttyS0 at MMIO 0xa0001000 (irq = 15, base_baud = 6249375) is a 16550A
>> [    3.498843] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
>> [    3.498853] Mem abort info:
>> [    3.498855]   ESR = 0x0000000096000044
>> [    3.498859]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [    3.498864]   SET = 0, FnV = 0
>> [    3.498867]   EA = 0, S1PTW = 0
>> [    3.498870]   FSC = 0x04: level 0 translation fault
>> [    3.498874] Data abort info:
>> [    3.498876]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
>> [    3.498879]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
>> [    3.498884]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> [    3.498888] [0000000000000010] user address but active_mm is swapper
>> [    3.498894] Internal error: Oops: 0000000096000044 [#1] SMP
>> [    3.498899] Modules linked in:
>> [    3.498908] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.10-stew #1
>> [    3.498917] pstate: 400000c5 (nZcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [    3.498924] pc : mem_serial_out+0x18/0x20
>> [    3.498936] lr : serial8250_do_set_mctrl+0x6c/0xc0
>> [    3.498943] sp : ffff800081bab6d0
>> [    3.498946] x29: ffff800081bab6d0 x28: ffff8000815e0dc8 x27: ffff000001c29c60
>> [    3.498957] x26: 0000000000000000 x25: ffff00000347b900 x24: ffff000005504c00
>> [    3.498968] x23: ffff00000347b800 x22: 0000000000000000 x21: ffff800081b69d78
>> [    3.498978] x20: ffff800081b69d78 x19: 0000000000000000 x18: ffffffffffffffff
>> [    3.498989] x17: 3d20647561625f65 x16: 736162202c353120 x15: 3d20717269282030
>> [    3.498999] x14: 3030313030306178 x13: ffff800081a21ff0 x12: 00000000000007fe
>> [    3.499010] x11: 00000000000002aa x10: ffff800081a4dff0 x9 : ffff800081a21ff0
>> [    3.499020] x8 : 00000000fffff7ff x7 : ffff800081a4dff0 x6 : 0000000000000008
>> [    3.499030] x5 : 0000000000000000 x4 : ffff800080797584 x3 : 0000000000000002
>> [    3.499040] x2 : 0000000000000000 x1 : 0000000000000010 x0 : 0000000000000000
>> [    3.499050] Call trace:
>> [    3.499053]  mem_serial_out+0x18/0x20
>> [    3.499059]  serial8250_set_mctrl+0x34/0x40
>> [    3.499065]  serial_core_register_port+0x534/0x7dc
>> [    3.499075]  serial_ctrl_register_port+0x10/0x1c
>> [    3.499084]  uart_add_one_port+0x10/0x1c
>> [    3.499092]  serial8250_register_8250_port+0x308/0x4c0
>> [    3.499102]  of_platform_serial_probe+0x2c4/0x48c
>> [    3.499110]  platform_probe+0x68/0xdc
>> [    3.499120]  really_probe+0xbc/0x298
>> [    3.499128]  __driver_probe_device+0x78/0x12c
>> [    3.499135]  driver_probe_device+0xdc/0x160
>> [    3.499142]  __driver_attach+0x94/0x19c
>> [    3.499149]  bus_for_each_dev+0x74/0xd0
>> [    3.499155]  driver_attach+0x24/0x30
>> [    3.499162]  bus_add_driver+0xe4/0x208
>> [    3.499168]  driver_register+0x60/0x128
>> [    3.499176]  __platform_driver_register+0x24/0x30
>> [    3.499184]  of_platform_serial_driver_init+0x1c/0x28
>> [    3.499192]  do_one_initcall+0x6c/0x1b0
>> [    3.499199]  kernel_init_freeable+0x178/0x258
>> [    3.499209]  kernel_init+0x20/0x1d0
>> [    3.499218]  ret_from_fork+0x10/0x20
>> [    3.499228] Code: f9400800 1ac32021 8b21c001 d50332bf (39000022)
>> [    3.499233] ---[ end trace 0000000000000000 ]---
>> [    3.499237] note: swapper/0[1] exited with irqs disabled
>> [    3.499247] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>> [    3.499251] SMP: stopping secondary CPUs
>> [    3.499284] Kernel Offset: disabled
>> [    3.499286] CPU features: 0x00,00000080,00200000,0200420b
>> [    3.499292] Memory Limit: none
>> [    3.792412] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>> ---
>>  xen/arch/arm/dom0less-build.c     | 19 ++++++++++++++++++-
>>  xen/arch/arm/domain_build.c       | 13 ++++++++++++-
>>  xen/arch/arm/include/asm/kernel.h |  1 +
>>  3 files changed, 31 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index a356fc94fc4d..23178a801818 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -274,6 +274,14 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>>      int res;
>>      paddr_t mstart, size, gstart;
>>  
>> +    if ( !kinfo->xen_reg_assigned )
>> +    {
>> +        kinfo->xen_reg_assigned = rangeset_new(NULL, NULL, 0);
>> +
>> +        if ( !kinfo->xen_reg_assigned )
>> +            return -ENOMEM;
>> +    }
>> +
>>      /* xen,reg specifies where to map the MMIO region */
>>      cell = (const __be32 *)xen_reg->data;
>>      len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
>> @@ -315,6 +323,11 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>>                     mstart, gstart);
>>              return -EFAULT;
>>          }
>> +
>> +        res = rangeset_add_range(kinfo->xen_reg_assigned, PFN_DOWN(gstart),
>> +                                 PFN_DOWN(gstart + size - 1));
>> +        if ( res )
>> +            return res;
>>      }
>>  
>>      /*
>> @@ -1006,7 +1019,11 @@ static int __init construct_domU(struct domain *d,
>>  
>>      domain_vcpu_affinity(d, node);
>>  
>> -    return alloc_xenstore_params(&kinfo);
>> +    rc = alloc_xenstore_params(&kinfo);
>> +
>> +    rangeset_destroy(kinfo.xen_reg_assigned);
>> +
>> +    return rc;
>>  }
>>  
>>  void __init create_domUs(void)
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 3dcdd7a8c46f..da7c7c000f1f 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1296,6 +1296,13 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
>>      if ( res )
>>          goto out;
>>  
>> +    if ( kinfo->xen_reg_assigned )
>> +    {
>> +        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
>> +        if ( res )
>> +            goto out;
>> +    }
>> +
>>      res = rangeset_report_ranges(mem_holes, 0,
>>                                   PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
>>                                   add_ext_regions, ext_regions);
>> @@ -2329,7 +2336,11 @@ static int __init construct_dom0(struct domain *d)
>>      if ( rc < 0 )
>>          return rc;
>>  
>> -    return construct_hwdom(&kinfo, NULL);
>> +    rc = construct_hwdom(&kinfo, NULL);
>> +
>> +    rangeset_destroy(kinfo.xen_reg_assigned);
> 
> handle_passthrough_prop is never called for the hardware domain

I'll drop this call to rangeset_destroy

>> +    return rc;
>>  }
>>  
>>  int __init construct_hwdom(struct kernel_info *kinfo,
>> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
>> index bdc96f4c18eb..b3c2d50e1e3d 100644
>> --- a/xen/arch/arm/include/asm/kernel.h
>> +++ b/xen/arch/arm/include/asm/kernel.h
>> @@ -50,6 +50,7 @@ struct kernel_info {
>>  #ifdef CONFIG_STATIC_SHM
>>      struct shared_meminfo shm_mem;
>>  #endif
>> +    struct rangeset *xen_reg_assigned;
>>  
>>      /* kernel entry point */
>>      paddr_t entry;
>> -- 
>> 2.49.0
>>


