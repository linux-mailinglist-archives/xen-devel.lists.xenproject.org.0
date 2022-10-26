Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD2960E419
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 17:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430638.682568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onhyz-0005vP-9X; Wed, 26 Oct 2022 15:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430638.682568; Wed, 26 Oct 2022 15:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onhyz-0005sY-6X; Wed, 26 Oct 2022 15:06:17 +0000
Received: by outflank-mailman (input) for mailman id 430638;
 Wed, 26 Oct 2022 15:06:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ANQJ=23=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1onhyx-0005sC-8T
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 15:06:15 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba063b3a-553f-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 17:06:12 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SN7PR12MB7953.namprd12.prod.outlook.com (2603:10b6:806:345::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Wed, 26 Oct
 2022 15:06:08 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 15:06:08 +0000
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
X-Inumbo-ID: ba063b3a-553f-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogv9j53CPeu/CFyAS5Z/bkNJLedOO7twqF5jJM2by3s/WESuB31IwZA3YcQXvAdsk9N7nFPmcrp2Y18g8UZM8SwMu1RB9t7RxV4uFMoYYEpDdpa7eWkyDHa1ACdC57a0xinodBlzJ5IeXz0bCJ302keZUY6SYTDb6lzk/EMimhokrqDHpmqsLAfON5/4khcLqTO+OTBD9VCA+TMebSNnbWuPhK99Isv0MLc8S8AJEb5idvgJTy4SEae8Vfo7HAZ6xl/Su2DmOEpTdJ4cl6sBwqxZxX9ljv0yzrsD3cG5v3y7Ot6miEdY6TcSkRcMYARxC4IHS88vJa9qC0GSkaK4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKyDAe5syXKZErZKNtg70nsvt235EbivVhwOYDfV6F4=;
 b=FNy6bG2KVGix4a2/NrPR7+WzQiWYzAOTAr1qiJpJIwy6T84DNVj+AeXuy2t4KVamgyL4iuDmjAj/GEe1PFGgIw04IiNoL8CCJDOic3jwY0vwQY7JFyrG2N6vuJsi/p8hKTfrftnouTlQbPuvepmgIeJt4UUaxbE3JX6x85AtfpW9izFfA+uHMex5WrHFfBImjEJ913wFqcbZIOETNPj6ZAMnmg8WxLBSoBiSUm3vR5QbNrUeHUad3duvgeoRG/P2411HQREqtlKmHNsch9ItwGTPQFTjrfat+farr5sCCfUq2gVv5wODNsc/3QeHdFZYetljjYVCPyhUuZLIt7ECjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKyDAe5syXKZErZKNtg70nsvt235EbivVhwOYDfV6F4=;
 b=ibFccaemKCzVRC8UVyYPRTVMeVp0VewLdmb113VcmSx4Msl4G8UrNbjG2tvoLj+V144pnntxewMucGocFKUMkrQKRkdqMebUf/iicj9c0Y1quvNE3yDC4rxuSokKrObInrL4ObvePEK0r/c37TCcvlzmoz8xrhG7OYTuPcAuKEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2accac91-d822-c493-4045-8657aed26fb1@amd.com>
Date: Wed, 26 Oct 2022 16:06:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [XEN v3] xen/arm: vGICv3: Emulate properly 32-bit access on
 GICR_PENDBASER
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andre.przywara@arm.com, Henry.Wang@arm.com
References: <20221026133540.52191-1-ayankuma@amd.com>
 <95d0a8ca-9ff0-162a-02ae-8cbdc30af8b9@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <95d0a8ca-9ff0-162a-02ae-8cbdc30af8b9@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0064.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::15) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SN7PR12MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: f4193537-49cf-4cbd-549a-08dab7639c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IwMGYECAmbcJhEwKU2oLIcwA5cQuKk7t2Yh38ahQRiGcvNoG0NhOkmUBcXySyUr/cafC2ie1AFRe8+B1KiJmvEtjOEZwotMgoPmqDj0lqIfde+s43Q8IJvNbgA7KWAinO5+RpJ3pLs5KXg0SMQCsMeuPHzFjfs7xOf6ik4fZcAEuG/xnVPiEajRjHQ8qbgklpZTcDU4ehoYCaACivbV0Y5/AY5uvmPDqXIkFYLqZ+ScgZQOF5qMSm4DBfmjR6CFT/CC3yZ/nipl1MRaLo6hHT/oHZ8m+lFSg2cae6is5ExHzSMO6Oewk97+XIXgjn04Lt5wB/Mh2BcLQT+Gvy94i8SgBY8ljyvhNpx3tdBbM35uktCBN+/+XzGqAlcyHrTwwLNkZiJ53wNFd6RusCExudN6seyMYhzUoDstGUsyEQ0ZDfTdqgJZv69VcmVVXi0IsUWVCSI98n7YMJNMJ3a6z7AthtKgYeMtXPsvnfMa0viJteoW8XumoyKtMsh+xKR6wsyyu8H9P+lv9o8iq+yIbZrdVh89Tuo5NGMkAEIOECoYBvtqOwess+Jt6CYyFCchKOsDutiutTmk1WvsWuB21fL8thEzuoO1vCP/+Fpct9DEy9n/mJVH0jP8UT7fvtfVktTMZ85Yqeq3XrK6AwZoXghcRfgzYtBbR1ZUdjZCGhMfl9MuLkMexO6Tb9ZGw53r1rGDTu//GdRLum2Xnt8GhONSBJoYf2fONhO4pQI9OmHx13zcqTvwVIY7uH2hkU3XvbYSkWAPMVEPKf7Rv5jxooibTLpMTCCPcFkMT3AqqfEY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199015)(31686004)(478600001)(38100700002)(83380400001)(6486002)(66556008)(53546011)(6666004)(8676002)(66476007)(36756003)(4326008)(186003)(31696002)(6506007)(8936002)(26005)(66946007)(41300700001)(316002)(2906002)(6512007)(2616005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEhsdHBFOE1xSEpMU1ExYlp6S3hmdmxNUGlycGFjaWVMdjlZREFYNk42Y2Jx?=
 =?utf-8?B?TVJXT0xDcDRXaEtKRUh5L0VJZFdPWFJkTUFRNDFoV1ROdjFrcFVLbThzNTBF?=
 =?utf-8?B?UXBmMEVVVGxBNGhwRkJ3MkY2SHI0U25TeVJ5SVF4ZmVKbVhaRDRTd0VrbEwv?=
 =?utf-8?B?Vk4wcUFUS3F0NDNlSTZTRDRxWHF4SjRTclVCalRCNFNRZCtKeXpHc0dqdHMv?=
 =?utf-8?B?WWNsQlV6U2x0aCtTcFJFZGlCK2d1Y3hiNHVUdXFYRk5mUGNsRmtOTXI3cVdM?=
 =?utf-8?B?MFRQOEY3aWtKRTdhek53ck4vMm0yNVBIVmVvRlB5SDBxalVpQklUMUVtbUVK?=
 =?utf-8?B?djVOSThrTW5UU3VGVWFlZG5tWjdNdExtOGgxNk1tem5EemVzS2YvQ2VVdzZY?=
 =?utf-8?B?NWdzdzNaRC8ydFBuUStUYUlJeC9GZmlKV1BBZksyWWhMZm9yY29Mb09leVlL?=
 =?utf-8?B?WnoyOStuT0tyNWRIN2tmQmNwVlEwREJMWUN0UnFjT0EvbzZQWFhvbUNsdWFU?=
 =?utf-8?B?NHEweTc4OW9yQ3VtR3F0WC9NcC84cXh5cHRDZThJVzFRRkpYcFJENFA0YmUr?=
 =?utf-8?B?Q2xiUnk5Z1IwTjlVMDdtbDg0QzNoZnJuSWxxdk1FNE5EMDlvTmdDbmxMTnE3?=
 =?utf-8?B?Z3gvdFlLMS9WeEttWVV3K3hGSWZnUVplUnNsUFY4T21EOHZQcFZqOWtSNWt3?=
 =?utf-8?B?NVpMREw4dzU3c2k0Myt1SGp1OW5rUmdGVWhpWExXVDVPYUlnMHBBVW0xREpk?=
 =?utf-8?B?S1lJWkM2OHg2dGQrM3Q5WERKSThEWXZJZS8xYUpSdlZtaFpuNmZXOVFtRlR3?=
 =?utf-8?B?ZEltY2ZwdHhEY09YN1RkQ09QTHBlWmU4a2FYZGN1QnBSaVFJWk9OUUdBUU8z?=
 =?utf-8?B?TWRaUmwrMW1ueE9wVmszZk4vUWZyendJcWNQT3pKSVhsUmVGZE1LZjNlUWJq?=
 =?utf-8?B?VTdYMmVXZ25Rd1lOMVo4WmZmckthVHVndjBaNG5YM1RZb1czR0JnbjFtWSt4?=
 =?utf-8?B?dFB6andEN2FSNGQzUEpCQUxNL1Z0Q2VPZUJncFowY2hIY0M2Y0tqblpSTW9M?=
 =?utf-8?B?Mzc3U2JiMDQxOFU0QkRIQ0ozTFVWRlRFc0Uxck5tOWFadTNoQ0cxcVAvdGRV?=
 =?utf-8?B?cWxrNkxrRmhVL1Zjc2twaXlYMmM5RDZ4QlRmY1ZWT0FFQ3JZMm9zanAxSkFa?=
 =?utf-8?B?bi90OU5JekU5Slg2V2hYOStZeXI1V290OTIyVlQxZ1I3Tk12YnoxdFlTTklZ?=
 =?utf-8?B?OGE4TGg3UUt6aitNdjBKZGVVQmdKQURNSVM3aWtIeHNMWG1lWjAyM1BxaExC?=
 =?utf-8?B?eHFuWW9OUTkvWCt6akJlWXZzNHduNk1PbFlMTVdGbHp0MjE0NCthT3JaeUIv?=
 =?utf-8?B?TFlyelUrZnhYZWFTS0F5eUdUbVZNY2tONityRHlkTEVnRndpYmFFeVA3c0NZ?=
 =?utf-8?B?S21QMEpQbGhPRjdCRzY5cmNuL0IyL2s4TTV0K3BJekltVWdSbDdxaEVaQTEv?=
 =?utf-8?B?RzVmZGc2UkVXZnFabGpOdVNjZGJBN1RzTFo5dmJMTFBOWlhPMkYxMGlYNmIy?=
 =?utf-8?B?cDNCTlFZOWl0K1pNREE5bVhvRXlvWDljdWg5VUdzQ0hMeG1HUFphWTErR2ND?=
 =?utf-8?B?c25wcHNDZjZkMHkyVlVjVDdHUHIrbXNURW5IMFViY1p4a2prRzIrRE1lSVQz?=
 =?utf-8?B?RURqRjk0eExCb0pBZUowSk4yK0hlaGdYMW1VVUlWYmNZbG5EZWZvQjc5QkVC?=
 =?utf-8?B?Mi9yVFA3Mk1iVEp0bDJaNTNkalI4WXdRWEIvNzVoSTg1T1dPdlhkcElUR1Ro?=
 =?utf-8?B?Tng2Wmh5Q2lxbG1vTEJKVVNjZk5xaGRybzBIVitTY2twbmNGSkxHdUY1WDZw?=
 =?utf-8?B?UGpkZFZPaGplYXFDYTVUTlVtM3BxYmdDWFc3dWgybUJLZVl0QkJPei9BQVRa?=
 =?utf-8?B?T3d5aDRvR0VGRHl3bGRkNk1YejVaT0RvdjJ5Tyt1RG00ZjhnUDgvR1U1dmF4?=
 =?utf-8?B?LzVUOFpQNTNyMC9Yakl0V0ZBaFdmazEzd01qNVhGSXNCc1MyL25mNy92SU1h?=
 =?utf-8?B?UlNudXZoNzd6SjZZREJOamZqeHc2amt2UmxCTCtLemwzTFZSSitLaEorNzhk?=
 =?utf-8?Q?zkRK5htv3KCNMyct+P20xIWLI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4193537-49cf-4cbd-549a-08dab7639c59
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 15:06:08.1435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzdsFYN4Z1kb86ReOEesfE9AlxHrtQlCGpkspDRyyUNOPfshlnpd9ClnW/l5IZs0hP3pCdwCcOqjzJPC4SrCMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7953


On 26/10/2022 14:41, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 26/10/2022 14:35, Ayan Kumar Halder wrote:
>> If a guest is running in 32 bit mode and it tries to access
>> "GICR_PENDBASER + 4" mmio reg, it will be trapped to Xen. 
>> vreg_reg64_extract()
>> will return the value stored "v->arch.vgic.rdist_pendbase + 4".
>> This will be stored in a 64bit cpu register.
> >
>> So now we have the top 32 bits of GICR_PENDBASER (a 64 bit MMIO 
>> register) stored
>> in the lower 32 bits of the 64bit cpu register.
>>
>> This 64bit cpu register is then modified bitwise with a mask (ie
>> GICR_PENDBASER_PTZ, it clears the 62nd bit). But the PTZ (which is 
>> bit 30 in the
>> 64 bit cpu register) is not cleared as expected by the specification.
>>
>> The correct thing to do here is to store the value of
>> "v->arch.vgic.rdist_pendbase" in a temporary 64 bit variable. This 
>> variable is
>> then modified bitwise with GICR_PENDBASER_PTZ mask. It is then passed to
>> vreg_reg64_extract() which will extract 32 bits from the given offset.
>>
>> Fixes: fe7fa1332dabd9ce4 ("ARM: vGICv3: handle virtual LPI pending 
>> and property tables")
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>
> Given the changes you made below, the reviewed-by tags below should 
> not have been retained.
Sorry, I will take care of this henceforth.
>
>> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
>> ---
>>
>> Changes from:-
>>
>> v1 - 1. Extracted this fix from "[RFC PATCH v1 05/12] Arm: GICv3: 
>> Emulate
>> GICR_PENDBASER and GICR_PROPBASER on AArch32" into a separate patch 
>> with an
>> appropriate commit message.
>>
>> v2 - 1. Removed spin_lock_irqsave(). Used read_atomic() to read
>> v->arch.vgic.rdist_pendbase in an atomic context.
>
> Please in the commit message why the lock is removed. But...
ok
>
>> 2. Rectified the commit message to state that the cpu register is 64 
>> bit.
>> (because currently, GICv3 is supported on Arm64 only). Reworded to 
>> make it
>> clear.
>>
>>   xen/arch/arm/vgic-v3.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
>> index 0c23f6df9d..958af1532e 100644
>> --- a/xen/arch/arm/vgic-v3.c
>> +++ b/xen/arch/arm/vgic-v3.c
>> @@ -249,16 +249,16 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct 
>> vcpu *v, mmio_info_t *info,
>>         case VREG64(GICR_PENDBASER):
>>       {
>> -        unsigned long flags;
>> +        uint64_t val;
>>             if ( !v->domain->arch.vgic.has_its )
>>               goto read_as_zero_64;
>>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>>   -        spin_lock_irqsave(&v->arch.vgic.lock, flags);
>> -        *r = vreg_reg64_extract(v->arch.vgic.rdist_pendbase, info);
>> -        *r &= ~GICR_PENDBASER_PTZ;       /* WO, reads as 0 */
>> -        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
>> +        val = read_atomic(&v->arch.vgic.rdist_pendbase);
>
> ... you also need to ensure that the writers are atomically setting 
> rdist_pendbase. Please correct if I am wrong, but the callers are not 
> using write_atomic(). So how does that work?

I think read_atomic()/write_atomic() may not be the correct approach for 
the following reasons :-

1. __vgic_v3_rdistr_rd_mmio_read is a static function. So 'val' has a 
global lifetime. Thus, all the following three lines need to be 
protected from concurrent access.

         val = read_atomic(&v->arch.vgic.rdist_pendbase);
         val &= ~GICR_PENDBASER_PTZ;      /* WO, reads as 0 */

         /* If a context switch happens here, then the 'val' below may 
potentially be incorrect. */

         *r = vreg_reg64_extract(val, info);

2. The same holds true for 'reg' as well in __vgic_v3_rdistr_rd_mmio_write()

             reg = v->arch.vgic.rdist_pendbase;
             blah, blah
             v->arch.vgic.rdist_pendbase = reg;

Thus, I am thinking of going back to 
spin_lock_irqsave()/spin_unlock_irqrestore(). Unless, you have some 
other opinions.

- Ayan

>
> Cheers,
>

