Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3467BAD23C1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 18:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010371.1388467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOfHm-0004Bz-T0; Mon, 09 Jun 2025 16:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010371.1388467; Mon, 09 Jun 2025 16:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOfHm-00049N-Mj; Mon, 09 Jun 2025 16:23:46 +0000
Received: by outflank-mailman (input) for mailman id 1010371;
 Mon, 09 Jun 2025 16:23:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/lO=YY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uOfHk-00049F-QJ
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 16:23:44 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2412::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b8ec54a-454e-11f0-a305-13f23c93f187;
 Mon, 09 Jun 2025 18:23:42 +0200 (CEST)
Received: from PH7PR13CA0009.namprd13.prod.outlook.com (2603:10b6:510:174::12)
 by CY8PR12MB8194.namprd12.prod.outlook.com (2603:10b6:930:76::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 16:23:38 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:174:cafe::8c) by PH7PR13CA0009.outlook.office365.com
 (2603:10b6:510:174::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.16 via Frontend Transport; Mon,
 9 Jun 2025 16:23:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 16:23:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 11:23:35 -0500
Received: from [172.26.5.4] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Jun 2025 11:23:35 -0500
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
X-Inumbo-ID: 1b8ec54a-454e-11f0-a305-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7Yj1Ckf3egST2uuWOLq8CZSPY1f/ZtFMafy+Pb7CZgyWRrUIQzMDTCmiwOe2Er9W/tzLftl++LoZzIOsEr3gD1VRurHgbiHv/E+PEJPikipGHXHGMJYqGnJpzvvcwh21KL9G0P/yGOz+608j8A9FJgp0X5tbmQUqeZzfA+DEqVfNJQQwHdpYpeEnBK0kn9c2SLujQCxtYvuZ8xJ69h8Y/6BB46bbRxqdrUupu9CMwjjqhaK81snySWm92oQh7Pld/Aql5v1wmeIE7NGRALUfuOiIhht6dqJadC8rJmplAfUoMyVt+bxe46/5VsQLNfVJ8ePqIGG2FaDgfk3Bns32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcKmRqFt8oLg8mBdcRRYugFNOQ/9rjX9V8ESvpHMtFg=;
 b=MJetPmUt3TyrnCWujF3vELywx1pFfweu8rU9qUTBnVdgCVqwuzdjPnKe8OTdC5ox//VyVEb34we+MUjrT9SyU1hvifq0wiGhLSp9oHgmav02DgruyhMAKBRAcx7BS8KngcQqLmHQpQhgxKvc3Gg+dMh5iAAV0dTRNHdqeKMEKQh39jo/ytLNzrJKXzLoB/xkga6oWKVc/WsGOdvv84uOm5L96Y2c8eSSsAkncxI2B3n4e09SxqHkF1QJN8snENiIGK2UWHoxa2pdTigSQcSv815O43RDvkMyZIweAz9h3GqN3c15Ockp+9ZCFr8S7wEEFlKqRowg1/GJ4Pc+oTLtYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcKmRqFt8oLg8mBdcRRYugFNOQ/9rjX9V8ESvpHMtFg=;
 b=1Ofv15DFw80694oJmoRvdgun+JXyADLw++108bMhXuWYFXwdLGc2gXzJHXnVy+y1wrarakgdF657lKDykD2kfoYS08Cpun/wcLS4VvdU5HIXPE8jpGnKFeX104qDF9Lm39rvzQjBPw+6549CUNU4Ud0zxgCsQsNrJeIwkdaFKy4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c6d5a6ec-a4f9-4e51-8157-7a24f4ae6c23@amd.com>
Date: Mon, 9 Jun 2025 12:23:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] tools/arm: exclude iomem from domU extended
 regions
To: Anthony PERARD <anthony@xenproject.org>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <20250513195452.699600-1-stewart.hildebrand@amd.com>
 <20250513195452.699600-3-stewart.hildebrand@amd.com> <aDRTRgmGNCrP4zh0@l14>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aDRTRgmGNCrP4zh0@l14>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|CY8PR12MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: 503832f6-62b6-4ea9-7a29-08dda771fc79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmlhKzZOS3FTRXZLUlNuV2MyTk5RbzJLeFFQSXlnbk1GZFpuUVBhZ3JhTlg4?=
 =?utf-8?B?OFMySC9ETmNIb2RFSFRmNHpHdlBrUlY4WW5RblIzenMxb2xyQTg1Z0dzSm9C?=
 =?utf-8?B?MFNGdzBBWDlZVHpvWVlhZEtKM2pxbFc5OFRTcXREN0RXOWtRK21mL2xiZFVa?=
 =?utf-8?B?LytnenYxbkZnUWU5Vjd3cFlITVh5NnhSVHFnMnl1WjFyM28rWlBoSXZJbEta?=
 =?utf-8?B?V1ZRQ3Z5SVBUbE5WNFJxRFc1UjM4R3g0VHFmYXkzWkxtbEhPWVhKNjJiR0Vq?=
 =?utf-8?B?Vy9oVmJXMGhKQVZOYnlGcElDKzBLb2Z4eS85R2x1YmpDaDBXVjRVYlZHditI?=
 =?utf-8?B?NnhYMmt0MUhZcksrVDZ3WWxFMEFNaXFveW1wcGJYZ01YRFlVMEFwZFpIaERI?=
 =?utf-8?B?UUc0bVgyeFROWksvcytkWFNkZ3ZDMVlWSUZOVUFnRWk4UW9ZdHBnRkMvc1lZ?=
 =?utf-8?B?dkRDZW9va2NKQWRzVGZGbVBBNmwzNmJwZUU4ditDcEVHRmJHSUlwSDhYL25q?=
 =?utf-8?B?YWx2b3p2ekNUZzIzeCtnWDhLNXE3SSsvV3F6M0FPTW9QTExQRmJybjhuVzlQ?=
 =?utf-8?B?b29PU2kvckxNTGhrUXBTZW5lTG5yVndMVWhaN3g4N2liZ0pCN1pmeGM5ZDhW?=
 =?utf-8?B?TWcxUFB4TXpzVm1OQk5QUFhtZEZEVGJ5R0d0TEVUUTdLSkkxb1dRVXQ3dUg0?=
 =?utf-8?B?Y0RSMUVRSlZHWWNoNXhpTThSTVhhSk1IWDAyUURNM0hwSXdTWEFZdnBRN1ov?=
 =?utf-8?B?L1pVVU9BZS9nODdnekcvRVp2aFhoUW5kQ3pSK0FGMGN4NXFhUHd0bHplZGdK?=
 =?utf-8?B?eGplOWIvK3BHV2cvaTZuc1dsTW1xNUpZaU14blc2V2NPbzZKOTNhbGQ0ZXh6?=
 =?utf-8?B?L2txbHZNZW1ROUpjMk8vQkY2eFA0TkNBVzBTZUhBS2JleGdLSXVNZ3Y4Z09h?=
 =?utf-8?B?b2E2czQrNlhtOGNtMTF4L1pSSGtZY3p2c21UNUdvNDJEd002emUvZHJZL04x?=
 =?utf-8?B?d2lTZ2xYY2cwY29RSFR6SXIxL1Y2akF6YkN1MjdncWxDbXhzdzczanY0Y0gy?=
 =?utf-8?B?QUprbGhUYVNXTlZrS3F0dWRGbnJZVFQ1TjUxdEprbTQrK1BNdllFYjJCRFc0?=
 =?utf-8?B?bHB0cDZTVVZBSndTSDloMEN5V29RbVpCa25yZ3N5WlBZdDUrVWtiWkkvRlBv?=
 =?utf-8?B?RWQ0TVE0TUxvRysxblVjRXdSdGxiSjM2enc1WlFHc2RSNFFJL3JMeG5qaDVR?=
 =?utf-8?B?WjJ4Z1NjdEt3TndLQXhUcHJwUWxQcndZbjNDbHdkL0J3NllwTWQzN3hJSncx?=
 =?utf-8?B?Ky9UbmZwYWlscWNkZm9oTUpYTllmQ3I0Q3VtMWVuV1FETjZPTGZBK0N1MjJQ?=
 =?utf-8?B?cUFnL1JYeEJFanBha3I5c0gzcVpEaHhUa0RuVE8reEdyQ0t2K0REU3FybmlP?=
 =?utf-8?B?a3NuN0Q4a2oyN2ZSN2Z2cC9QcjVTY2s2SklkM0NLUzEyV0ZHZjEyNXA2TFZJ?=
 =?utf-8?B?Ylk2UjFtNFdtMG1jaUFoVlQ5ZUdJdU0xd2R2Sk5kZkdPZ1pOZlVGd1gyRG0x?=
 =?utf-8?B?UHlCOHNKSDErOTFvUGQyWUpZTmJoR2hFOXExT3E0T1RZUmNPNkxOMnl5cDhK?=
 =?utf-8?B?QXowZ0owQ25HVnBVaXZXbmxnU3ZIRldKQXdRTEpSTkUyK2xsSjBWQTBiV01j?=
 =?utf-8?B?VlRlQndPZTRGZ1FjaHVPbkpuek4rWk1KdmdPcGxRNmR2Y2xFa0JiZjVnMXhF?=
 =?utf-8?B?UHB5WHBJN0UyNDAzdTZ2Wi84eC9yV2pQeUFDUHNJblV4dnROaElyR1NqQnND?=
 =?utf-8?B?cmJiVmtHR2NMRlp3L25mdkxmVS92NUYweDFHWDlqalFvQm0zRXZoeWloZXJZ?=
 =?utf-8?B?bGNoV0Rybjl6eTdWdGllQnBRNVFQbEJoRndlRVYyc2t2ZWlUd3grWHY2L2N4?=
 =?utf-8?B?ajQ0TzlnUFh4a1lvTFAyMTB0dzJrY0Rja09ZTTA2NUllRFh5Sy82aDRaeG1a?=
 =?utf-8?B?SVlPUGJPbFp5amNVSXZhd1NkVDlpNE9TclFlRkdmN0RWVWJOcVRwRWc1U093?=
 =?utf-8?Q?Ck87ze?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:23:36.4400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 503832f6-62b6-4ea9-7a29-08dda771fc79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8194

Thanks for taking a look!

On 5/26/25 07:40, Anthony PERARD wrote:
> On Tue, May 13, 2025 at 03:54:50PM -0400, Stewart Hildebrand wrote:
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index 75c811053c7c..8ae16a1726fc 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -1542,20 +1556,90 @@ static int finalize_hypervisor_node(libxl__gc *gc, struct xc_dom_image *dom)
>>      if (info.gpaddr_bits > 64)
>>          return ERROR_INVAL;
>>  
>> +    qsort(b_info->iomem, b_info->num_iomem, sizeof(libxl_iomem_range),
>> +          compare_iomem);
>> +
>>      /*
>>       * Try to allocate separate 2MB-aligned extended regions from the first
>>       * and second RAM banks taking into the account the maximum supported
>>       * guest physical address space size and the amount of memory assigned
>>       * to the guest.
>>       */
>> -    for (i = 0; i < GUEST_RAM_BANKS; i++) {
>> -        region_base[i] = bankbase[i] +
>> +    for (i = 0; i < GUEST_RAM_BANKS && nr_regions < MAX_NR_EXT_REGIONS; i++) {
>> +        struct {
>> +            uint64_t start;
>> +            uint64_t end; /* inclusive */
>> +        } unallocated;
>> +        uint64_t size = 0;
>> +
>> +        unallocated.start = bankbase[i] +
>>              ALIGN_UP_TO_2MB((uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT);
>>  
>> -        bankend[i] = ~0ULL >> (64 - info.gpaddr_bits);
>> -        bankend[i] = min(bankend[i], bankbase[i] + banksize[i] - 1);
>> -        if (bankend[i] > region_base[i])
>> -            region_size[i] = bankend[i] - region_base[i] + 1;
>> +        unallocated.end = ~0ULL >> (64 - info.gpaddr_bits);
>> +        unallocated.end = min(unallocated.end, bankbase[i] + banksize[i] - 1);
>> +
>> +        if (unallocated.end > unallocated.start)
>> +            size = unallocated.end - unallocated.start + 1;
>> +
>> +        if (size < EXT_REGION_MIN_SIZE)
>> +            continue;
>> +
>> +        /* Exclude iomem */
>> +        for (j = 0; j < b_info->num_iomem && nr_regions < MAX_NR_EXT_REGIONS;
>> +             j++) {
>> +            struct {
>> +                uint64_t start;
>> +                uint64_t end; /* inclusive */
>> +            } iomem;
>> +
>> +            iomem.start = b_info->iomem[j].gfn << XC_PAGE_SHIFT;
>> +            iomem.end = ((b_info->iomem[j].gfn + b_info->iomem[j].number)
>> +                         << XC_PAGE_SHIFT) - 1;
>> +
>> +            if (iomem.end >= unallocated.start
>> +                && iomem.start <= unallocated.end) {
>> +
>> +                if (iomem.start <= unallocated.start) {
>> +                    unallocated.start = iomem.end + 1;
>> +
>> +                    if (iomem.end >= unallocated.end)
>> +                        /* Complete overlap, discard unallocated region */
>> +                        break;
>> +
>> +                    /* Beginning overlap */
>> +                    continue;
> 
> Instead of a `continue` and a comment that I don't understand what it is
> supposed to mean, you could just do if-else:
> 
> if (iomem.start <= unallocated.start) {
>     // code before this continue
> } else { // we have: iomem.start > unallocated.start
>     // the block of code bellow.
> }

Yep, that makes sense, will do.

>> +                }
>> +
>> +                if (iomem.start > unallocated.start) {
>> +                    assert(unallocated.end > unallocated.start);
> 
> I think this assert should be removed.

OK

> Instead, you could check that this property hold true every time there's
> a modification to `unallocated.start` in this function.
> 
> Maybe one way to make the algo easier to read, and to check that this
> property is still true, is to rewrite:
> 
>     unallocated.start = iomem.end + 1;
>     if (iomem.end >= unallocated.end)
>         // discard `unallocated`
>         break;
> 
> with
> 
>     unallocated.start = iomem.end + 1;
>     if (unallocated.start > unallocated.end)
>         // obvious: all allocated already
>         break;
> 
> Because checking for:
>     iomem.end >= unallocated.end
> is the same as checking for:
>     iomem.end + 1 > unallocated.end
>     unallocated.start > unallocated.end

Ah, yes, this makes more sense. Will do, thanks.

>> +                    size = iomem.start - unallocated.start;
> 
> Isn't `size` the size of the unallocated region? Why is it recalculated
> with `iomem`? I think it would be better to create a new variable.

You're right, "size" is being used here for something different. I'll
create a new variable to better distinguish.

>> +
>> +                    if (size >= EXT_REGION_MIN_SIZE) {
>> +                        region_base[nr_regions] = unallocated.start;
>> +                        region_size[nr_regions] = size;
>> +                        nr_regions++;
>> +                    }
>> @@ -1565,16 +1649,12 @@ static int finalize_hypervisor_node(libxl__gc *gc, struct xc_dom_image *dom)
>>      set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
>>                GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>>  
>> -    for (i = 0; i < GUEST_RAM_BANKS; i++) {
>> -        if (region_size[i] < EXT_REGION_MIN_SIZE)
>> -            continue;
>> -
>> +    for (i = 0; i < nr_regions; i++) {
>>          LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"",
>> -            nr_regions, region_base[i], region_base[i] + region_size[i]);
>> +            i, region_base[i], region_base[i] + region_size[i]);
> 
> Shouldn't we print "base + size - 1" for the end address?

OK

