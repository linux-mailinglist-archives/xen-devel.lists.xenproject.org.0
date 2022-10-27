Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5343460F64A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 13:36:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431020.683463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo1AU-0004Yi-L9; Thu, 27 Oct 2022 11:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431020.683463; Thu, 27 Oct 2022 11:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo1AU-0004VG-I5; Thu, 27 Oct 2022 11:35:26 +0000
Received: by outflank-mailman (input) for mailman id 431020;
 Thu, 27 Oct 2022 11:35:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cef=24=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oo1AS-0004VA-UG
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 11:35:25 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70ab94a0-55eb-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 13:35:22 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4235.namprd12.prod.outlook.com (2603:10b6:5:220::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27; Thu, 27 Oct
 2022 11:35:19 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 11:35:19 +0000
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
X-Inumbo-ID: 70ab94a0-55eb-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEZVoj2DKxs3jtMymDEUvUW3bDsMCIQbuU/pfuN+sTSREwlsYJ4pdvH25efXcoKcn4r8lThZTDCbaRTOu+mKN6M5q3uKdPzYSi3/74VVnmUrEVPAJAt8qcrj8mK1KQRoYp9exR9RqfpX1A5z0OoE6K4b40M1PbvZbmvzXa/6lmfnB1euv2+WSmA1J0g3SX9RsOLgrMf8tapJqeC2BCJtGln/GwvokiotpRPFnWRRL0uKwErgfsMaShzOFgWPcDAPnFVC4mkxHFWFoRVZoZaasKg6I+T6ffyPMUcLDbpKgkYinGAWAOdBKKXyr9X6oRtqpMjqCXmj0xKZOp9uTO6A/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVfX0Aryh8o2SWZb+BKO3OPNPiM3peaM0ZlSDjIa5NU=;
 b=DAtA8dkxsCbK5n+bI2iANAW29wu5lMEocTy3ZC0KknqVMnft49BWHX1CBMhldFwCVH7L39sQNB7dUyTjgvx5H5CO25Sv2W2Gg712BLnxTeRBHDNfZolrEZZ0Dh12W5oYiCEoj+NWalHkUiyZb4KtCCVgKI9ATRtOiPKgQvrZyHSlVkRLqyfejb+GvcN1F7+WsDKwHn3Tp8N1794J0Va7hQ9lwvDdRjP8F/pWC+br06ScOZ0vw7b8grY84bdKEaIiaAGR62D1ARPqoLNr9Qus3+6a0j1YqxUk9gjGAlX0zmLUkXhrC0KyEY1aejbXDktx9/AlxQZjgf2+OkYKZN5rDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVfX0Aryh8o2SWZb+BKO3OPNPiM3peaM0ZlSDjIa5NU=;
 b=Q4BZRE0KQWQu8gQPGmCjOuXp83hdkRB141udy2obVK5apQpcrHP+tlwH8o3j66BpBsN9hWEQTVA1QIRpLiD/t47kHHzhtcPizFG9wR/Ggl8KvQgy+Dx1Fqk1TF8dpb72pewfkn8xLuyc1eE4nmTcfjUpbkCNKYlIh4K2/SDFVMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ad1e55bd-207f-4d9d-f84f-00ef5ee604bc@amd.com>
Date: Thu, 27 Oct 2022 12:35:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [XEN v4] xen/arm: vGICv3: Emulate properly 32-bit access on
 GICR_PENDBASER
To: Andre Przywara <andre.przywara@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 stefanos@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, Henry.Wang@arm.com
References: <20221026183004.7293-1-ayankuma@amd.com>
 <20221027104231.77c5cd28@donnerap.cambridge.arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20221027104231.77c5cd28@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0409.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::18) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4235:EE_
X-MS-Office365-Filtering-Correlation-Id: 847910f8-5464-4fbe-00c7-08dab80f534f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HiOmxBq33o0iQDf5dc57fJ4jSlj6fvPEERJk+O+PIIjNheRLb32uRWaWU6z/pdi4VVJy1T5cxWFkTkUNeOHiOlwJu19kXamyTJkr2wXO8LFoiVkRfX9kUW2adain5u5oljtiKyPnbloO5k4LF4m4WVJ+PFyN38oqr4DOdq7Y0BbP2RepheGUX9JJm/MwCAdrqf0ONSeBRTGj9Q0vrlgtmrmNzrfhwuWkWNO6rNXWnVlcr/4qmpDqOOlwR6briUZVpvcAy71Wkil+dmNQPuXQj8kzVbo6mA7ndcaLiIQ076+MnfsYxoUaXAigV1n78PG2Ryk7G+wdLiNmVikvufefS+x2nkNO63PQpgYzgMoP3OvgE8lwFNwvmUuDS6ExGDB+r7CHMOT6pLuGgrHYluDCs0k9fImo3kfCDAT++lMVi7vK2fWjTKX3ByaXfrkX8BC2c6xU2A1t5hyBZYX4SBRrUcfEziXaj2pwpto+ywx0dokqfmZ/l9Ufa3AcKnLeLhY98/80JwdaoDWAUhXrNG5HyTNuN0nMQ24xpmMOQ5hc1q/jjjsM+ZHR2WhNHhOZhst8yS1n4MpljNMlOivLjH2XNaHU1CYA9R/Rvmrw3wxzMS1g2lGRjIAAQ+TFbY89v0OZCUER9u4zUT4h0Cayn9poYYdVlCcn0Qs50O5dUdmVLKDTXGfrs4MYfqjROm5GoRewE/HHQ/tQfzLkigucCqfl0edFAimGNL95F3gEtgAXxdzzBsM0y6d1C8Hh8xxhWfRprVDZpHocb75uNcNE2vKFjIwSb5kAqPYYwwNgPo9QC1w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199015)(31686004)(36756003)(8936002)(66946007)(5660300002)(66476007)(31696002)(38100700002)(83380400001)(66556008)(2616005)(26005)(2906002)(478600001)(41300700001)(6916009)(6512007)(6486002)(316002)(6666004)(8676002)(4326008)(186003)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE9QL0dhR1hQODgvVjladmNzNGtYdGsydHNUYkpab0xKRVREQlN6cEdNNmR6?=
 =?utf-8?B?TzJVY2lMcldRdjlWVXhoRC9EeDRtb1Z2Z0ZWb29XVUJhVmRya0UyeUFaeTlF?=
 =?utf-8?B?Y0hkV1VCeXZxUkcvQW9vMjJFcXlPNCtjaGl4c2JPNVlZaDBzMzhqRkxjanha?=
 =?utf-8?B?Q3BwcXIyUkZWWHBKK1lMd05aSzAvcFMrdTMyMmV0WkROWWVWZDhUcGwvRFo3?=
 =?utf-8?B?bWRueGtLeHVwSWFsVk0xQ1lMN0lDaG5Cc1cxdk9lWnpmTEEza3puTS92S1pk?=
 =?utf-8?B?ZWo1SUgvalh0N3lTQnZ4NmUxVmFSN0o4NVBMaE94bERaMzBtTTdpaEtCbGtZ?=
 =?utf-8?B?SGZaN3FVcU1OK2dabit5eThRcFRLaUFQbStQMkkzTU9MaHJVVkF1RzhaMjNJ?=
 =?utf-8?B?MngzZE15SXRuMkhZTVl2RDh2TmpMbHgrV1pUenovK2NyemVXUmR2WURxZDZQ?=
 =?utf-8?B?ZkJDMDFHWUI4bW04eXdOejRqODBydUpab28xTTJrL2xWaHA5aGtnektxdVpn?=
 =?utf-8?B?SS9FQ0g4TWs1TzhYSVowcDR0c1JQWnVoN09tS3d6TStna1lkM0ZqUmljaGdp?=
 =?utf-8?B?UHpqQmZrU1JsRjBsL2xrVnFUZFdWZGJFYzF2ckhmUmxwaXRCbmJVVTRaUDVE?=
 =?utf-8?B?SE5oOHpzYVgwK1ZRMUpNOUdNYnRndjViM1pXUFNTcWhPY21GOExUS2tPNS8r?=
 =?utf-8?B?cnFBYjk3d3QyV0V1eC90MzFkZHdmUHpjMmFqcjZwaEFBK2JFNE9nWjVCZzhB?=
 =?utf-8?B?M0dEVG9NMG14TWJMaHFmU1NybWFKNkk5MHVZUTVyRXhTRFpiVGFYQ0tlM2t0?=
 =?utf-8?B?V2d6ZHpObFlQRjIybGorUnJ2Tit5WTJUTEJodExpZGd0MnpXMi80T1dZakRF?=
 =?utf-8?B?NXRuRVd5a3A2ckhGS01OMWliZXRHUlRETGNEQjg5SG11MkN2Q2ErSXVrL3Bp?=
 =?utf-8?B?U0h3NUJOV0l0UEN1Mk95MWpGT0piU1MvaS8zd3JmTTZwTEpnQU9XUzJsQkk1?=
 =?utf-8?B?UUxTaDhTaHVhRjBqVWx4eVY0RlBrVXF5MW0ySW1LUkI3UENpdExkM05HOStl?=
 =?utf-8?B?YjFNU0hnajlTNndoTUtpTS8vcDA0cGE5bFpBK0d5cTdpUW5SNVgvTjVCTEZT?=
 =?utf-8?B?UklwSklZMkJjTHR6TC93L29YemJFSUczeXkvamE1SVk2NlVxUFFmL3RqSGVo?=
 =?utf-8?B?bDNjS1VwL0YxWWE1cVg5aEF5VDRJSEI0dmp4NWpwL0MzOGw3SGZaSTF0U2t2?=
 =?utf-8?B?RW5EOUF1UTlEVGJmcExWNjd4bVQ4WFRpY1V1UTJQWnJHdVFFNzBOUGFsUnZU?=
 =?utf-8?B?Q2lvM1FoK1RuM1NnZHpWZ3poTjNtQythMzJlYnpibEpPWlh6T1hCeEdXL2Fx?=
 =?utf-8?B?ajd2ZWRCTFE3TzVSSEpnaWJJM2JGMVpYWERjUTIvcEpUQUNkd0syNHhRSVBt?=
 =?utf-8?B?dGhrZldkRHZKWEVLV3dpZUZJQi9ZRmJYdk0velBRNGhpZy9scDZoOWI1aXNK?=
 =?utf-8?B?Q1pwNVA5NTR3NG9TVFdRODZGUnpPb0F6WnVUMVB4YndjTUZQY2IwZG5yNmVI?=
 =?utf-8?B?UU5WN2R1MnlaV0NDaGZqTlZJQ1p6K1p4LzdRSjVqc3NMVDhzcVk4czhlZ1Zr?=
 =?utf-8?B?YWFqNVNhbFZidjhGRnJKbk9rV0xXa1lYcER4Wi9GVURObWJnL09vQWliY1hL?=
 =?utf-8?B?a1hHRDdjRzFGc3V1a1dHU1ViWEpuOWtTMjJQZG9Rc0lPWTkvWmVhV1Y3K01h?=
 =?utf-8?B?TEplWStBQTlKTXl0c0V4VkRFZGE5c2dqVXN3WjgzVTNHWXBiWE8rWWQzbS9K?=
 =?utf-8?B?WDhmYm1IZThValdhQXp4OTZOZGdod2gyMUVvWjBhMGJCNUJHSTZxcW92TmFH?=
 =?utf-8?B?UGdjRHVwTmdZNXlOR3RtWnBPM2pZWFMyRjU5Q2ZralhocU1Rd0srREREcVdp?=
 =?utf-8?B?bHZDMTllK3ljVm45MVJETmQwZ0RzR2lDK3ZvTE5udTlxdFpTZlBoNGsweGRn?=
 =?utf-8?B?MGplNW5yNEl5cnFTd2pYVXVNeFlSUzlremRIMmZuYllHVWJBcnErYkVNL2pw?=
 =?utf-8?B?Q0VYY0lwL1ZkLzUwVzltQkxyWXlkOGtwblpVc2VaVjU3aDFHRnVJZnBtU0M4?=
 =?utf-8?Q?caFaeO8wL8Yv+4c0IO2GRSCoE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847910f8-5464-4fbe-00c7-08dab80f534f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 11:35:19.0553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6Su7/HLOz/HywFJLLmm8ZRlysE+RlDyscTQz1CR0HGrQ+LpaQnXo7+ASvzmSMzMwQGVbzOAHBKRQEjv4AYMYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4235


On 27/10/2022 10:44, Andre Przywara wrote:
> On Wed, 26 Oct 2022 19:30:04 +0100
> Ayan Kumar Halder <ayankuma@amd.com> wrote:
>
> Hi,

Hi Andre,

Thanks for the feedback. Just one clarification.

>
>> If a guest is running in 32 bit mode and it tries to access
>> "GICR_PENDBASER + 4" mmio reg, it will be trapped to Xen. vreg_reg64_extract()
>> will return the value stored "v->arch.vgic.rdist_pendbase + 4".
>> This will be stored in a 64bit cpu register.
>> So now we have the top 32 bits of GICR_PENDBASER (a 64 bit MMIO register) stored
>> in the lower 32 bits of the 64bit cpu register.
>>
>> This 64bit cpu register is then modified bitwise with a mask (ie
>> GICR_PENDBASER_PTZ, it clears the 62nd bit). But the PTZ (which is bit 30 in the
>> 64 bit cpu register) is not cleared as expected by the specification.
>>
>> The correct thing to do here is to store the value of
>> "v->arch.vgic.rdist_pendbase" in a temporary 64 bit variable. This variable is
>> then modified bitwise with GICR_PENDBASER_PTZ mask. It is then passed to
>> vreg_reg64_extract() which will extract 32 bits from the given offset.
>>
>> Also, we have removed spin_lock_irqsave()/spin_unlock_irqrestore() to protect
>> v->arch.vgic.rdist_pendbase. The reason being v->arch.vgic.rdist_pendbase is
>> now being read/written in an atomic manner (using read_atomic()/write_atomic()).
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
>> ---
>>
>> Changes from:-
>>
>> v1 - 1. Extracted this fix from "[RFC PATCH v1 05/12] Arm: GICv3: Emulate
>> GICR_PENDBASER and GICR_PROPBASER on AArch32" into a separate patch with an
>> appropriate commit message.
>>
>> v2 - 1. Removed spin_lock_irqsave(). Used read_atomic() to read
>> v->arch.vgic.rdist_pendbase in an atomic context.
>> 2. Rectified the commit message to state that the cpu register is 64 bit.
>> (because currently, GICv3 is supported on Arm64 only). Reworded to make it
>> clear.
>>
>> v3 - 1. Added read_atomic()/write_atomic() for access to v->arch.vgic.rdist_pendbase
>> in __vgic_v3_rdistr_rd_mmio_write().
>>
>>   xen/arch/arm/vgic-v3.c | 19 ++++++-------------
>>   1 file changed, 6 insertions(+), 13 deletions(-)
>>
>> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
>> index 0c23f6df9d..1adbdc0e54 100644
>> --- a/xen/arch/arm/vgic-v3.c
>> +++ b/xen/arch/arm/vgic-v3.c
>> @@ -249,16 +249,15 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
>>   
>>       case VREG64(GICR_PENDBASER):
>>       {
>> -        unsigned long flags;
>> +        uint64_t val;
>>   
>>           if ( !v->domain->arch.vgic.has_its )
>>               goto read_as_zero_64;
>>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>>   
>> -        spin_lock_irqsave(&v->arch.vgic.lock, flags);
>> -        *r = vreg_reg64_extract(v->arch.vgic.rdist_pendbase, info);
>> -        *r &= ~GICR_PENDBASER_PTZ;       /* WO, reads as 0 */
>> -        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
>> +        val = read_atomic(&v->arch.vgic.rdist_pendbase);
>> +        val &= ~GICR_PENDBASER_PTZ;      /* WO, reads as 0 */
>> +        *r = vreg_reg64_extract(val, info);
> That part looks fine now.
>
>>           return 1;
>>       }
>>   
>> @@ -566,25 +565,19 @@ static int __vgic_v3_rdistr_rd_mmio_write(struct vcpu *v, mmio_info_t *info,
>>   
>>       case VREG64(GICR_PENDBASER):
>>       {
>> -        unsigned long flags;
>> -
>>           if ( !v->domain->arch.vgic.has_its )
>>               goto write_ignore_64;
>>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>>   
>> -        spin_lock_irqsave(&v->arch.vgic.lock, flags);
>> -
> I don't think you can drop the lock here easily. If it would be just for
> the LPIs enabled check, that'd be fine, because you can never turn LPIs off
> again (but that would deserve an explicit comment then).

/* LPIs once enabled (ie via vgic_vcpu_enable_lpis()) are never disabled 
by Xen */

Let me know if this comment makes sense.

>
> But down below you do a read-modify-write operation of rdist_pendbase, and
> need to make sure no one else is attempting that at the same time.

AFAIU, Xen is non preemptable. So there cannot be a context switch 
between read-modify-write.

But I think you have a valid point.

If two callers are trying to read-modify-write on rdist_pendbase at the 
same time, it is possible that caller2 reads a stale value of 
rdist_pendbase (just before caller1 writes). So caller2 might program 
rdist_pendbase in such a way that caller1's update is gone.

I will fix this in v5.

- Ayan

>
> Cheers,
> Andre
>
>>           /* Writing PENDBASER with LPIs enabled is UNPREDICTABLE. */
>>           if ( !(v->arch.vgic.flags & VGIC_V3_LPIS_ENABLED) )
>>           {
>> -            reg = v->arch.vgic.rdist_pendbase;
>> +            reg = read_atomic(&v->arch.vgic.rdist_pendbase);
>>               vreg_reg64_update(&reg, r, info);
>>               reg = sanitize_pendbaser(reg);
>> -            v->arch.vgic.rdist_pendbase = reg;
>> +            write_atomic(&v->arch.vgic.rdist_pendbase, reg);
>>           }
>>   
>> -        spin_unlock_irqrestore(&v->arch.vgic.lock, false);
>> -
>>           return 1;
>>       }
>>   

