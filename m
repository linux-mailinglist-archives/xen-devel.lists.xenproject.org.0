Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3433BBC2FF5
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 01:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139247.1474709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6HRI-0003yY-Ey; Tue, 07 Oct 2025 23:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139247.1474709; Tue, 07 Oct 2025 23:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6HRI-0003wN-C3; Tue, 07 Oct 2025 23:49:52 +0000
Received: by outflank-mailman (input) for mailman id 1139247;
 Tue, 07 Oct 2025 23:49:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JAy5=4Q=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v6HRG-0003wG-Lq
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 23:49:50 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d441f42-a3d8-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 01:49:45 +0200 (CEST)
Received: from BL1PR13CA0153.namprd13.prod.outlook.com (2603:10b6:208:2bd::8)
 by IA1PR12MB7736.namprd12.prod.outlook.com (2603:10b6:208:420::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 23:49:40 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::28) by BL1PR13CA0153.outlook.office365.com
 (2603:10b6:208:2bd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Tue, 7
 Oct 2025 23:49:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 23:49:39 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 16:49:39 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 16:49:39 -0700
Received: from [172.28.217.164] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 7 Oct 2025 16:49:38 -0700
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
X-Inumbo-ID: 4d441f42-a3d8-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIlhuCIR1mko6ZBYbhp26yC4C9/9PXiwOaOs7S5pqHQaJ1b7EIWYp8VT1dfdPzp4X/CQ1sW2riv77zAmgScKGsL9ZDo1DCBO2FXntd2fSM/CsKGIZVquWfnKi8iApbhsyUiScsqPA8HOEESGBJs7I21HNc0bzIho83GPM9UleDe/gEvt2tqEBZmJHq1hXny385Rtv3EasW6B+PBA6Daow0vPOW2Tab5X6A8STriJn5pgvjp3qXGNBGzEagDJ2JiSnhQuswj4QV3Jx8F0f7XjjYwzvmk7BnLY0xVw4v+Ujc8Ga5PYbngefRFrswdhBBTDHG5m0UEWBMQ0Fll5k5LpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9r1TmJ7JSW+PlCx3E+d0bVlybTUlJOq1XznLTOTB6s=;
 b=vX2YoFSmMdSNHPe6viCIScPddcnowtDCioaRtwcE3gWTCsCsjtvExnaXO95Z9jPVweuw3j9msmYsxX6H+Trk+h9OMDcq4OlnT4s7ivKBJS2IF6+Xuhf5GgwiTSKnLyf6fJMm2x8Gin2aLenRbhlij9WDQsPnV5DMW1v1IEGPQXTQMc3rk2AfnexVA4NLJ9ETRebbFa13zKnPLu+IcRwVhiUyJV7yy2yQEHr7wFg9eGsKpMueDoTEGY63VllqUZPjloipovYMSkVRx52z+aKxxLMOqL6+eILlnhZ8xclePliLBuZb3tCJeop4YzqqKJ/Q4cYIn43abR9yXNJu5/U2SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9r1TmJ7JSW+PlCx3E+d0bVlybTUlJOq1XznLTOTB6s=;
 b=ZEkzsP1zdAD3cMPAOUmOYNOjzL6LGfGgGzbFg31/BI/AFO5JY8YirsI/TiEfz3zPZTsTPe6kQy2M4NwTP/kFxYN/+i3JBg3Mzx+AkHC3NZbWhUISruNc6fC7bDfmhXyS5Q93mcC2rxYhwc9t4KqocUtwVgm61TBiVY6KireAc28=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <33fe8bf6-e0b6-4508-a7d5-3f7ac9135e33@amd.com>
Date: Tue, 7 Oct 2025 19:49:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add myself as an AMD SVM & IOMMU reviewer
To: Anthony PERARD <anthony@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251002234311.10926-1-jason.andryuk@amd.com>
 <aN-EuzQ2AZ1oMN0K@Mac.lan> <aN-VdWG3VUoDhSF5@l14>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <aN-VdWG3VUoDhSF5@l14>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|IA1PR12MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a1c690-6dd5-4d98-d4cc-08de05fc2e42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Risxanp0SEx1QTJzanpzTGplajUzdExJV3YxVU9ZSXJXYlRPQ01kRUJBeGhX?=
 =?utf-8?B?aU5XY0NvRWltRzd5NGp2RjduZFozcklvSHFhemMvS1NtSEtjS2dONVBMSHV0?=
 =?utf-8?B?ZlJDQm5PVUlFS0pVSU45ejBIMHBScWVHQ0VmSzJwb1YwL21XL242K1hjYSt1?=
 =?utf-8?B?dWN0MmxhUnVXQXhaaDkzekgrK3BhVGYvQzBjTlphVWhRTjVJajJyODA3OEht?=
 =?utf-8?B?bzNBVVRiV0xySm5aK3RLZWdrR1pVMGUraFZqMEJ4cW9vTUMrUnppWFpHZmFM?=
 =?utf-8?B?bG9FVDNSaTQ3U0JuWnNnSUFhODQ1U0FCa3p1T1poeTdwc2ZlOWx3bkdBTXlF?=
 =?utf-8?B?SHk2K0ZObkcvVldvUmh1azB5c3pjRmtvTzdoTlFOMW43K2k4Lzd5VGlnaW9M?=
 =?utf-8?B?UzdnZ2xIcWorSkU0TlBPbUZiU291TGxFUUVvWWVHYk1zM00wZ1Q3Z0xCNElS?=
 =?utf-8?B?S1dweHVPMlNtZDJKMEdMYkVPcmdGdXlWTDl5bFozL3ozaFpJVUcrME9DbmFU?=
 =?utf-8?B?RENrZDdzL25XSWtUdFFMVjBLMXJDWStqMEpEVjEvcmVaZURIbXFLZzhlbDdh?=
 =?utf-8?B?K3h0R3FRbFdUYU11d2JOdGNNSkVGNHJLRnQybnA2b2N3M1dCWlQrc0EzM2Q5?=
 =?utf-8?B?eklwRklWTEpuZklsYy9qZDJKaU9WRVR5NTgzRGdOY0F6T3dIOHlQSGs1Z3B6?=
 =?utf-8?B?R21nMlM3ZUlJNHJ4L2FYYksybFYvQlBpaGtQNDRIVlRmalc2QWtnSThxSmlm?=
 =?utf-8?B?aytJc2txSEJiS0xPaWtob3l6QXRzYWFqN21wQzQ0RTB5VFQxWE1GckFRYlZa?=
 =?utf-8?B?QkYzQ0MyUUczdU12SFgrV0hTbjZjajdjSlNUVFZFRUtkSE1Ua2dBMkpCbk45?=
 =?utf-8?B?ZUhVL2dFTGUram5zK09CanJLaHNtenU3VkJjZUtyMVZORTVsM3R3Q1pyTk56?=
 =?utf-8?B?YktDcGl5UGgyWUFQSHE3djZCY0RSRUZFZGJxT1JGWTh4Y1ZjYlBHazZQenNB?=
 =?utf-8?B?OTlOc1QyTkIvc2x6Wk5HcnVFTHFtWVk5bUN6VU9rODZHcmE0NERNa214QkND?=
 =?utf-8?B?enh3R2hoYWZmRkNIRzBmUjFlWDBXUENmRDdsRTkwMmhRY3lDSmJiTUJHL0lQ?=
 =?utf-8?B?dWpvK0pnOGNzU2MxRFdQQWsxVCtraytJSTIvMEFkRm9xalJZeFFUSkN1YnFv?=
 =?utf-8?B?ODVhM2FIM3V1UDJFM1oyN1lIS0JHR3BDckx6SlMvRi9xWDcvMVd2dFcwQ2lk?=
 =?utf-8?B?eUxpbS9xWXdYSW1TUzJSVFY5OW5wUXliSDY3UjVoeW03SVJQQ1lNUWhuNVNz?=
 =?utf-8?B?OEJrS2p1akZwZEdhZllqOGl2cE4zWGoyU1ZJTmMrTlR4K3RHU2JlQUhFMm15?=
 =?utf-8?B?bTlBbDlDTFllUGhweXF4dWRkS01aU2Z5akh0Uy92MGxLZnB2cU9BUkpnMjJT?=
 =?utf-8?B?UVNDYTZDQVFobjNIdlo2ZlllUGF2MWdoMVlibzdGNTlaUmJVVi9BT21XMlNG?=
 =?utf-8?B?YjFNZnZFY3J3K1NvM1Y5UEVTRlB1dTdJM0dJOUNyNXhyM0dNZWx1bi9sd3lB?=
 =?utf-8?B?QnB4L3lyWGFQckovWHAvWEVTUmI5NmI2dDNxSFp0RXN3MzY1WkI5dkd2QkU2?=
 =?utf-8?B?TEt4QzJIRTVHMXZNTUlYcDlHNmx6UDBkcTdkWURwM3dHdEpqcGsrUDNKeXF0?=
 =?utf-8?B?RnV2OFVTdHRYcHZWbzZ4OWJpNXBrd0d1VC9WVklPRWFYd2RzRE9uVkxIS1J5?=
 =?utf-8?B?OTlacW9CTExUOUo2dkdWRDhtMlo4ZXUwLzFWY2tWYVRuVnJaYWN6L2x6OEFl?=
 =?utf-8?B?OTNoTFF4aDI4Y29mK3VpeWUvalNNSHF3WElvM1lVTkdLZlZXVEU5RU5jaUJy?=
 =?utf-8?B?ZFVBWVh0ak1ZV2w2UUt2VzBJanZ2OXdkZG9FWHhhRjhocWF4R1dWdWgzYkVY?=
 =?utf-8?B?bThLY0FMYWtTZVBPbjhQRDBFWDZoeWxuSGxHMVIxRjBEUm1oeFIxaUNZNXg3?=
 =?utf-8?B?bGZwdERyeW1CNjR2UHdZcjJZZzZwQTcrRkgrNXZOYWRyU01QbW9GaVJMek1y?=
 =?utf-8?B?Q3hjRzYrL00yY3pkMTBKeGk3Zzd6L3IvREcvK2xQdWQyZ1NWc21XOGh6UkI2?=
 =?utf-8?Q?YTXU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 23:49:39.8772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a1c690-6dd5-4d98-d4cc-08de05fc2e42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7736

On 2025-10-03 05:20, Anthony PERARD wrote:
> On Fri, Oct 03, 2025 at 10:09:31AM +0200, Roger Pau Monné wrote:
>> On Thu, Oct 02, 2025 at 07:42:38PM -0400, Jason Andryuk wrote:
>>> @@ -601,7 +618,8 @@ M:	Roger Pau Monné <roger.pau@citrix.com>
>>>   S:	Supported
>>>   L:	xen-devel@lists.xenproject.org
>>>   F:	xen/arch/x86/
>>> -F:	xen/drivers/passthrough/amd/
>>> +X:	xen/arch/x86/hvm/svm/
>>> +X:	xen/arch/x86/cpu/vpmu_amd.c
>>
>> Would it be possible to not exclude the SVM related code here, and
>> avoid having to duplicate the x86 maintainers on the AMD entries?
>>
>> Or the parsing of the file doesn't deal with multiple entries possibly
>> covering the same files?
> 
> ./get_maintainer.pl can deal with a file been covered by multiple
> entries, there's multiple example of that already, (e.g. many subsection
> are also covered by TOOLSTACK).
> 
> The exclusion is likely unnecessary, and ./get_maintainer.pl will just
> get the information (email, ...) from every sections that a file match.
> But the duplication is necessary due to the "The meaning of nesting"
> described in the MAINTAINERS file.

Roger, are you okay with this approach?

I considered adding myself to the top level X86 entry but it covers so 
much.  I mainly care about one cpu vendor ;) and I'm not interested in 
PV or shadow.  So I went with adding myself to the specific subset.

Regards,
Jason

