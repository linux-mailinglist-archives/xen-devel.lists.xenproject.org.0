Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8CFBBE265
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 15:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138161.1473912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5l33-0000FY-8n; Mon, 06 Oct 2025 13:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138161.1473912; Mon, 06 Oct 2025 13:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5l33-0000D8-5s; Mon, 06 Oct 2025 13:14:41 +0000
Received: by outflank-mailman (input) for mailman id 1138161;
 Mon, 06 Oct 2025 13:14:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rD3D=4P=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1v5l31-0000Cv-Ey
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 13:14:39 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65f121fd-a2b6-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 15:14:33 +0200 (CEST)
Received: from CH0PR03CA0065.namprd03.prod.outlook.com (2603:10b6:610:cc::10)
 by SN7PR12MB8170.namprd12.prod.outlook.com (2603:10b6:806:32c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 13:14:23 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::8d) by CH0PR03CA0065.outlook.office365.com
 (2603:10b6:610:cc::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 13:14:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 13:14:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 6 Oct
 2025 06:14:22 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 6 Oct
 2025 08:14:22 -0500
Received: from [172.21.123.104] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 6 Oct 2025 06:14:21 -0700
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
X-Inumbo-ID: 65f121fd-a2b6-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lctfbT/THmEeTNg5ZIvTYlSXNAVk8oloS/aljWLbSFS/f+MAj1CkzIal5ZheG6TWMul4QwRnfTDzmWe1VxtpCemfB25ENCQQ0OAohTU4wx2EuL+q/CDdRBNCOxRXTdMZlEWMKJBZEohPdgVsPGhTZRaDQVYewCg4V28taleVP4ImMW8XP7h6ysWvieROWGvK40HT9OWpzZE/uk7tgodOBpbaqqWWG2a9wGzi+JIaKVqyUvresY7WaAKlG/5m3j8NcByZVIrIgv/q61OZ4vQ9mASl3XUcVP1bpKHl/rt702Ov01cfKvJ8R0Dsmwh9HBGtHdsfsQldd/uJw0naHXSe6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fc2ewYII0WBcwFTXVGQReO2lXcHYiCZTyY+eCgE1hBk=;
 b=Sapnxk8wf9e0TGI90qrpQ+sVFNVZbAbkB0Y56dgpSumURG0n0gMZUEAfmwTgHMK/rLwhsOZwL2HtJ+IX5rn43nYx1m9aOdgGlFqhyfuLBjsE3f8kLczgUfieRDd1p1Zm6xDQjFMzXfFov5mYJCFI2g4cUhLfJB7/zIavGvGPaUootyOB3zyVzPTOkpOJZq+pgoV5rEagF2BgehQG+Sm3zhLkQK/64Jjp0l27AiMp1i9kQs9GEXGiiNP8LnFvcwIjh9oxZOCaHjmY6p1mawi8J6lM+7Q0la6VYbZVB5X+pfSXTEYifect01f2L0X4YyMd2hF6SWQ/tb8Ps+UklBBHPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc2ewYII0WBcwFTXVGQReO2lXcHYiCZTyY+eCgE1hBk=;
 b=Z3G+wlGDj9iS7nm+TDvhTZGbaWU/xVbJa9YphgwIS1kyAzIZG73ZTU0Zdj7rKhXBKTkJPZGs48411WHU6tzq4YmNgU6tyPXEyWPNxMs0s8/e/1zEfbNGtnnUtHw1RAfzNFIyTNx8G8RE8+Hj6/l6FolC1xfv5T0fOe/z7GK61pM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d4091083-2f2f-463c-a1df-4fde890fac3b@amd.com>
Date: Mon, 6 Oct 2025 09:14:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] vpci/msix: improve handling of bogus MSI-X
 capabilities
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	"Oleksii Kurochko" <oleksii.kurochko@gmail.com>
References: <20250929084149.70560-1-roger.pau@citrix.com>
 <2d1737a7-58e3-48e3-ac16-1bda3947c929@amd.com> <aON72Sq6ZJ6y95DI@Mac.lan>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aON72Sq6ZJ6y95DI@Mac.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|SN7PR12MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: a61f66cd-02c1-4458-0e55-08de04da4466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|30052699003|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUlsYkkrd05hNGZ5VzFPSU10Y3FuV0JOc0Z2V3Z3V2lxSlM4d1JKcy9KNHE4?=
 =?utf-8?B?WjJiZDNEY09yNEk1VDczS0YwL3ZGSXdIeVNHV2FKeDJKN0VPUVljZGpuY3Qy?=
 =?utf-8?B?V0tqL3ZEYjlZYmFXalpOeVlJVXA1TTVFaU9YWDFVUm4rTHZieEV0TEJRTE1R?=
 =?utf-8?B?b0dWVkdudE5HRGgxa1ByRldQSnRzUmp1aUZocFhVc0dxNUhYbDZFaENlTlln?=
 =?utf-8?B?UVZlRlJKbS9EeExhakVBNFl2TTB2Y2paQU9VclRhUHRjc3NQekhmRldLQURN?=
 =?utf-8?B?Y3FGV1FnTVZZd1I3MFRpTDVFclJLUWtRTDdlbHhZTFdjSmY3SW1JVDU5RFRx?=
 =?utf-8?B?cit0OXliWG92V3NKd0ZrUVAxazFGditYdmFXTmxndzdvdEJEN2QxUzFFUnMz?=
 =?utf-8?B?ZUFMNVBqZUR0TnkxbTRac2pnWjhvNXk0WFlBZ2V1TUN2aHZjckhPQ0I3Qmdw?=
 =?utf-8?B?TmZENUtYbWJHelVsSzRjcEt1Qmc1Y0VUdVZ2SmsreG81MFB1dk5Lc0t1VDcw?=
 =?utf-8?B?STlBeWFadzlXTFJsRnFURUlzS0tyNFdHRWlJNzdZRTJlOVFxUWZKYjNERkk4?=
 =?utf-8?B?eFgwSlBtNkZtanVWNFNDY1F6b0dnWm5VTU9rQ3VLTWpBQlZDem01RU5qVVR5?=
 =?utf-8?B?RkYxM0NuR04vL0M3a2NiK1hCeTkxWlVNb1F3ZXIxck05bnQxTkFXQzcwajhn?=
 =?utf-8?B?M2s2a1FjTmFOQ0l2WUNwdFFKVlV4UDdIZUYxTFMxSXREQ2M3YXY5WTVUQk9Q?=
 =?utf-8?B?Zm9EK2VKYkpCQkVYRHhGdzdXWExiWUR4NnVHM1hBSTNHK003TER0SGJSZmx6?=
 =?utf-8?B?RE5oU2xnM2tpS3gwVTA3cWFTWThoclZvV1laeDV0M0ZDWEg0a0hEWWNvNjk1?=
 =?utf-8?B?a3BpMFgyeThYQi9yZWswVWh0Yks4QlNXc0taOWN4Uk95Q2FCK21CWHgvMDU0?=
 =?utf-8?B?andNUjZNK2I4ZnlYaGtXSHNRckhzSVk4OFFyNlBEWWpXaENXMkxaWnJqemFo?=
 =?utf-8?B?ajVNbmYveHh6NGcwYUc5THJXUlk0ZGhsQUFJRDBCZUcrM05tUllUZmVyUGN1?=
 =?utf-8?B?dExjMExzRVV5RHJyUmd6STU0QVlkcGFNNlJkREMxejFNNWdmUVZFTWFjN2Rp?=
 =?utf-8?B?UlF5S3VzYXlDaGV6WXF1S2k5dVNnTkR1djM4TitONGFhdHAxQ2NHcnFsS3Vw?=
 =?utf-8?B?OEpVSFlncVdwY2xVRVZxQndhVzVnS1A3bGpMdWl3ekZndThTZTdGZlhMTVk0?=
 =?utf-8?B?Y1JPSW1OM1QwZWsyY2ZjRkphMDhNOWd3aytjYjBTV09abDJ1V2hpSzBNNGw4?=
 =?utf-8?B?VDROOXppblMzbWg2ZVVNaUxXd0pWWWFhYWVrdnZoRm85SHhZSW1CajBZL3pR?=
 =?utf-8?B?OU1ZS2J6VktCWS9vQ3BvbUlzb1M1SkxmMGs1S2o3NFR4REp0ZW5RRFUxQ2pX?=
 =?utf-8?B?Z1QrbkhMUU1NMzBGOXlaZzEyazdlSVNLdHdGWWVHZ1k2aTVCNWFtZUxIREZM?=
 =?utf-8?B?Unk2RDRZZ1BJbFZUT3o1LzhtTmVWRlIwaW5lamV6c09sUzkvbDcwNmhJa0Fq?=
 =?utf-8?B?MjBYM1N5MzFDYTQvY2tqeHpoZC9CT1BKWHJJK3BxMGw3b3lQd25oazg4T0NR?=
 =?utf-8?B?VjVEKzJIaWxyRndiZHJxZUtBSGJaVHBMODM1MTBTbVBxUjRKT1Aza2dvYndt?=
 =?utf-8?B?UnNXWmN1Ym0yQmh1Um53RWphRlNuWjJYUHhMWFF3azlYeVZVbkZtNWE3bEcz?=
 =?utf-8?B?RWpweVMvdFZhcC9SUDlHK29OZzlFcDE3Z0lvTjJMOC9aWERjbHVDdXdpR3pj?=
 =?utf-8?B?KzhRZTM3MjhKOC9YS1BnWUg5MnE5NnhENTNUcmoxQTYrREIzZ3cydlhSb3ZZ?=
 =?utf-8?B?bThCbVRETE9mRjhIcU1MMTdKbDhPbU9HU1FCbDVYdjRIY084bytkWitQbVQ5?=
 =?utf-8?B?NHF6NEtIVEhEZ0VMTGxObnB5Vk5lUUE3c2tVT01FVlAreGlFNVZ5NXBSRTIv?=
 =?utf-8?B?TWlxMVpLamFnTlJURU5SdDZlQVVTSjlYQzZJQTJJR1FEcmszcGJZM2NxUzZN?=
 =?utf-8?B?R0llVUxSN0JiOFNxMFBlUU9BS2N1aUxoeWU1Mkp5R0Q4OHlKT0ZpcVhCalI0?=
 =?utf-8?Q?uE7E=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(30052699003)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 13:14:22.9574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a61f66cd-02c1-4458-0e55-08de04da4466
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8170

On 10/6/25 04:20, Roger Pau Monné wrote:
> On Fri, Oct 03, 2025 at 11:29:40PM -0400, Stewart Hildebrand wrote:
>> On 9/29/25 04:41, Roger Pau Monne wrote:
>>> I've had the luck to come across a PCI card that exposes a MSI-X capability
>>> where the BIR of the vector and PBA tables points at a BAR that has 0 size.
>>>
>>> This doesn't play nice with the code in vpci_make_msix_hole(), as it would
>>> still use the address of such empty BAR (0) and attempt to crave a hole in
>>
>> s/crave/carve/
>>
>>> the p2m.  This leads to errors like the one below being reported by Xen:
>>>
>>> d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area
>>>
>>> And the device left unable to enable memory decoding due to the failure
>>> reported by vpci_make_msix_hole().
>>>
>>> Introduce checking in init_msix() to ensure the BARs containing the MSI-X
>>> tables are usable.  This requires checking that the BIR points to a
>>> non-empty BAR, and the offset and size of the MSI-X tables can fit in the
>>> target BAR.
>>>
>>> This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
>>> EPYC 9965 processors.  The broken device is:
>>>
>>> 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)
>>>
>>> There are multiple of those integrated controllers in the system, all
>>> broken in the same way.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> Cc: Jan Beulich <jbeulich@suse.com>
>>> Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>
>>> While not strictly a bugfix, I consider this a worthy improvement so that
>>> PVH dom0 has a chance to boot on hardware that exposes such broken MSI-X
>>> capabilities.  Hence I think this change should be considered for inclusion
>>> into 4.21.  There a risk of regressing on hardware that was already working
>>> with PVH, but given enough testing that should be minimal.
>>> ---
>>>  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
>>>  1 file changed, 45 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
>>> index 54a5070733aa..8458955d5bbb 100644
>>> --- a/xen/drivers/vpci/msix.c
>>> +++ b/xen/drivers/vpci/msix.c
>>> @@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pdev)
>>>      if ( !msix )
>>>          return -ENOMEM;
>>>  
>>> +    msix->tables[VPCI_MSIX_TABLE] =
>>> +        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
>>> +    msix->tables[VPCI_MSIX_PBA] =
>>> +        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
>>> +
>>> +    /* Check that the provided BAR is valid. */
>>> +    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
>>> +    {
>>> +        const char *name = (i == VPCI_MSIX_TABLE) ? "vector" : "PBA";
>>> +        const struct vpci_bar *bars = pdev->vpci->header.bars;
>>> +        unsigned int bir = msix->tables[i] & PCI_MSIX_BIRMASK;
>>> +        unsigned int type;
>>> +        unsigned int offset = msix->tables[i] & ~PCI_MSIX_BIRMASK;
>>> +        unsigned int size =
>>> +            (i == VPCI_MSIX_TABLE) ? max_entries * PCI_MSIX_ENTRY_SIZE
>>> +                                   : ROUNDUP(DIV_ROUND_UP(max_entries, 8), 8);
>>> +
>>> +        if ( bir >= ARRAY_SIZE(pdev->vpci->header.bars) )
>>
>> This assumes a type 0 header. For type 1 headers, bir values 2 and up are
>> also reserved.
> 
> Right, but those BARs will be set as VPCI_BAR_EMPTY for type 1 headers.
> The check here is to avoid doing an out of bounds array access, the
> check for validity of the pointed BAR is done below.

OK, makes sense.

>>
>>> +        {
>>> +            printk(XENLOG_ERR "%pp: MSI-X %s table with out of range BIR %u\n",
>>> +                   &pdev->sbdf, name, bir);
>>
>> Nit: placing the cleanup label at the end of the function and using 'rc' would
>> make it more amenable to future uses.
> 
> The issue with that is that we then end up with a structure like:
> 
>     return vpci_make_msix_hole();
> 
>  error:
>     xfree();
>     return rc;
> 
> Which I don't like much because of the double usage of return (it's a
> taste issue TBH).
> 
> My motivation for using a goto is that they are conceptually the same
> error path, but we provide different log messages to aid in debugging
> the issue.  Otherwise all checks will be done in a single condition.
> 
> Let me know how strong you feel about the usage of a label here vs one
> at the tail of the function.

Not very strongly, hence the Nit: prefix.

>>
>>> + invalid:
>>> +            xfree(msix);
>>> +            return -ENODEV;
>>> +
>>
>> Extraneous newline.
> 
> Thanks, Roger.

Overall the patch looks good to me. With the commit message typo fixed, and the
newline removed:

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Lastly, I don't have a strong opinion on Alejandro's suggested prefix, so my R-b
stands with or without that.

