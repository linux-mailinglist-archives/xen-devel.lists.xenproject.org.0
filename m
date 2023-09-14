Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD0C79FED8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 10:47:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602139.938526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgi0X-0001xq-M7; Thu, 14 Sep 2023 08:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602139.938526; Thu, 14 Sep 2023 08:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgi0X-0001uU-J6; Thu, 14 Sep 2023 08:47:29 +0000
Received: by outflank-mailman (input) for mailman id 602139;
 Thu, 14 Sep 2023 08:47:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRER=E6=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qgi0W-0001jD-0q
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 08:47:28 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53831ccf-52db-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 10:47:25 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MW4PR12MB6705.namprd12.prod.outlook.com (2603:10b6:303:1e3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 08:47:22 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5a5a:18dd:4832:75db]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::5a5a:18dd:4832:75db%4]) with mapi id 15.20.6792.019; Thu, 14 Sep 2023
 08:47:22 +0000
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
X-Inumbo-ID: 53831ccf-52db-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eretO6qT2dExoACgk6OTRr3LTmLbk35tCZONpWv6z2yiJ4ctSLG+U++HBViIjYybTJH8zBx64e/WqfpwIWkKEIeaJ1wU8zyTrgZf0WCdiLHS45bPkmgytRv4GcZhEahD3ylj9d8v4hmiZMcpgm2IQQ9bztvEwnb2w/p9Hnr/LkPAxQorFoVFaBu2bQOQz6stz/Sl4UPJJrSrhGnOyE6F/M+GvnjI31AuWAROuXcts2C3fHje5dDdyYns+FY3+e0EUggdGTy7XVFET1PYBAnSzipRea+FsGEwr5NqeZeSxmEjP5QX/Tfv77PzyCpABrcLVu68BZEetDKz7pSOIX4eEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZHttxgqJ7+177QlRxzXNmshTUldz5laqhWBI/MK6DI=;
 b=Hpd/otCILcDvm9MyYZP+Fo9+UlWYGRzQWl0C3P59gFw2QOivZ7FAN/1qH+c+Q4y7cSAwyoA0h+v7EeRmMBnu2ghNbsiJpgv9LEbMlLqosjfKpHx7FE7U9P2Rx7WdPd9Ay96YjYXSR3INEHnK26uEp01UaaNNYKjYtEU0oAT/3HjRZ7wcZvgNNQkpLC27WQI3eGZPjkqV2KNe09IGaAxZt61woKuGloJ/+Yqo9uIiBy/EK/Qz+LwfV+gVmaYVU+YchvAyidOpEvBXtE5yN7E8/tk2c+rdurh43xuLxj0lnC/GIomUric9bAwZyAV0aenrixU7RRcou4EIr+H4YR3/KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZHttxgqJ7+177QlRxzXNmshTUldz5laqhWBI/MK6DI=;
 b=YBTA/1CilqTqeLSwzrb0MCof4NQFO7HHf84fl35Uzudn/c7O8sLQvDxm+WakUG3oRpM4NZSeKtobm8m5mB/Ob9OfKE9OBZuTRZ9rrDDUQHcibkIwkhYAJYmc+0o7X8CrqYowiXZy/7s7AnprOwtjtPSEZPRGR5oTBwPeb18Ezbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <af39704c-ed41-109d-0a6d-ed5e4ac2ef36@amd.com>
Date: Thu, 14 Sep 2023 09:47:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [XEN v1 4/4] xen/arm: traps.c: Enclose VMSA specific registers
 within CONFIG_MMU
To: Penny Zheng <penny.zheng@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, wei.chen@arm.com,
 henry.wang@arm.com
References: <20230911135942.791206-1-ayan.kumar.halder@amd.com>
 <20230911135942.791206-5-ayan.kumar.halder@amd.com>
 <a958921e-500e-fd26-741d-1a1b686fdfcb@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <a958921e-500e-fd26-741d-1a1b686fdfcb@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0473.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::29) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MW4PR12MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d76b9a-d358-4ec6-c516-08dbb4ff35ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TGcQ2HcVlm3xHNUFShFg9cf7Q9dew/2vIbfoDHtwwLCVTez60xYaVPat4vhpU+UvLWlYbIAibMl/je1fLZfnId2t1hwv4i6Z18Ip1roGILRKMu+iCkh1LeCy/3MfGY/EbSEH1sv16kcKPjYDVR0Uq5EjzTsl+gRuwtabsJpVTQ9L+3WvRES8jSODsL6HTE2IUTUae4t44b0MegxHajYHF6YKOFwTvYLgbwxO4FgNnfGKzuXelFC4S7AcgvcRTe59CgWJBFyoMubuD8KMupZke+t7KTBkpo1MQIzyyhmjSHpvXQc13tZik3hLnk0949zGj0Q1lLzDxK+PgNbssH4pkaC7K7lcKNSIpu/l6OQjdw3E/Cl6AUH7/U1HxAGb2wALx/A56xBe8YDS6KqMvaGIri1we114O1cmv0BeUbuhexpOdBs6it6+Fzj3gL8OqPvQ7t4UTAOJG9oeoZSDxSHVKZYSTDoMRY+kKMYQ8mu3FyMJu3LH8iviDP6D2BBeuR33I1wpTtFKrMb1g3fSx136VUb5lXiMtaRmgQFCJmxED/ScdKKvM7zO0HScpSIhszymzAjGLCoZ2Zp2508qi05yP8EZIrnEFxt9tXhZNaPejHoPdp13fiiqo8o/VTNQGS7BgGWhZ5sdDiT1PSmjV10Czg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(346002)(366004)(376002)(186009)(451199024)(1800799009)(31686004)(6486002)(53546011)(6506007)(6666004)(38100700002)(36756003)(31696002)(2616005)(478600001)(4326008)(2906002)(83380400001)(6512007)(5660300002)(8936002)(66946007)(110136005)(8676002)(316002)(41300700001)(66476007)(26005)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk5vQ2p3YzRMTFJ0S083WFRTdGpGd3NvUWNxdnNxWUMvN1ZVdzQweENzUGY2?=
 =?utf-8?B?dW9lU1dmc1RGck9aMWNHenhKTjZGNUdZT2dFcHRIeW5kM0JnelhabG1VSXdE?=
 =?utf-8?B?S0l5SmlDSjFBOURXTndzUHUxSlZSTVg5YndDdW84N3VidEQ2R0x5MDM4cUZu?=
 =?utf-8?B?SDIyek1URy9SYzFsQUt3NFBTSzZiV0lFdThLZDJSUU5haXhEVlk2SkwwR1JO?=
 =?utf-8?B?SkFOcURBa21YNFRGa0RDSEFJK1ZFRlhZTnFGZEVmcE9JeUh5WDh3VTBzbFNn?=
 =?utf-8?B?QjNabzVSVDBhQUc0d01SMng5ZzVKV2JCTmlQUjZXRHZCaUVRaTNYcmNTRHFK?=
 =?utf-8?B?UmpkbkRXdUxHQXdTRUNtYTd4a3kxa2xBclZCaDZmSVY1UmxBcFB6V2JxVjFp?=
 =?utf-8?B?MFYwOUxaT2RuS2dzdDNQb25zWnR2b1dZRzJQbWM5eDV2NTZFS0FjTlJMeloy?=
 =?utf-8?B?WjVHMjFla2s3TGtXcm91VzBOcWthVDVhQTJXZ0Jyd0NCbjNzdmh5ZGxpQVFY?=
 =?utf-8?B?QXdmM3RKRjJ0Q0RBSzExTm9oSHk3c2ErbmI5dmdVOTRNS1YwWHhFbUY1SlNl?=
 =?utf-8?B?ZlBkRlh2Vm1ZTzRXTURNNUhvaEJEV2pLK0dLc3RHTDdPU1A2QlVFUEpPQ0RC?=
 =?utf-8?B?ZHJVN01wZDdnWU0rbTJQNER4dDdGN3FZRUFhVG8wOVlKSG5jOG55RHVEWGYy?=
 =?utf-8?B?MENPM2hOcWthRXl3dFZtdmF5SGhxSkZkUTBVdVZOdWYxYU9sc0VhVCtVbnBT?=
 =?utf-8?B?N21nYXlDbTNlMnVZT2dheWlDc2pkOXNuN2Z3OE1XUEs4Sm80QlNLd0lxZlp4?=
 =?utf-8?B?UGp4eGZ3UFhDRVBDVXU2bUFOYitIRGxlVGlqOXA5a3YweWFlMXMzY2JobXYw?=
 =?utf-8?B?ZWNGZW95UEFNbC9xbVhQZUlCOUdwcDhEb3M4WThzTHhnVjJ6MUdWbWFQZGZT?=
 =?utf-8?B?cWRjTWhjZnVETnIySld2a29Vc0Vvc1BvNXFEMmVPZnp5M3h6a0djQnR2Tk9x?=
 =?utf-8?B?bkNiY3MwWlZxeTN6ZFRKVjFlMlNnU3p4M296aVpIOUdwVXViWC9mdmpONVpI?=
 =?utf-8?B?V1I5N2hXYkJuWG93YXpTMUFRbEJSeHlaQU9lakVYREljamFoYW0wTVhUS1Bx?=
 =?utf-8?B?SUpYOHBmSzdTZ2hDdWVXZ3cyRWU2Wkt6M1ZDeEF5QmNpN0xnek1YbHBmSzdJ?=
 =?utf-8?B?YkdiaUZhc1ZUbzhmUHlqQzRIZHJZU2dZa0RkYWZWSkZKenZDLzY4eGJVd2lo?=
 =?utf-8?B?L1BFaXVEb05Ud29RRHpUamEvVjdHU3V0ZEtSaVBsTnFtS2hWQlFqM2lvRyts?=
 =?utf-8?B?SmxCNzkyUXdGeTVoVjJRZ0x4NEZvLzZmVWljNWhxQXZhRXlJd3JKdkw1Z0Yr?=
 =?utf-8?B?RnhIRjdFc2QyRitxd3ZYNUhRUGxnMnp0cnBENHRUcGFqNjVsVU91dEJ3QWhD?=
 =?utf-8?B?K0dIOEVkYTJRODU5TnE3Ry93SGZQUVFKMStPaStTUVd2VEdQckdhYVZhSFlo?=
 =?utf-8?B?cmwyYUVpWk92QVV3UWt2MUI3N2xLYWNJKzVPdmMxR2FYTnY1NVJiQk9MY3pN?=
 =?utf-8?B?cGFSNHV4MjZwU1MzVkVNbU9ScDMxVzdwR3lSRnc4ZS9laEFkb0tGSk9LbS9Q?=
 =?utf-8?B?QldjQWxpeHd5L3ozTDlYS0o4aXN1OGRnalU3NmpSYWRabUM5a2RLUHlxeTJj?=
 =?utf-8?B?U0tuT0hsNzFUYmhkamdjTDJUVDVOaE9MdmUzMWlVQm5MY3lMM3ZtQ3JPRmhZ?=
 =?utf-8?B?eWxrUnFOK25nbnJMcDI0My9FZVFFeXE4VXBtd254UmE1cDJabmU5Z2dPUC9i?=
 =?utf-8?B?ZDg3amo5aXBmZlNaZG1qM1VQR0RYWFBsc2RmR2Jyb2RpMzNNS0NRdkUzUGdT?=
 =?utf-8?B?MHlISXVGL1Jva3JKT0Rpa3VFeW1KU1VPUXlCVG93akdmUHdwazVsMHpvOWpl?=
 =?utf-8?B?OXkyNlI1UTFXUGFPMVQvTVBzbWpCQmxKMEUzd0VneUZMeUhmME9QcEgrY0wv?=
 =?utf-8?B?N0lRUUowYmxrSFUvMmVVQkhFVW4vdXVPdkhYOWN5KzNrS1ZRemJCNDRBRTdF?=
 =?utf-8?B?WTdXVnh0eDJhbEJVbmhmZVhWM2l5UW9CNFpmK1VQMytpYTVPeHh2cU82aHBT?=
 =?utf-8?Q?4zKgltcFxlxmNVr2DoKYot9CV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d76b9a-d358-4ec6-c516-08dbb4ff35ff
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 08:47:22.1465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwrzDG9dfGoU0yZRS0BRfXhAQQYmjWvNf18iBOtdrsPLmYYTzEPN6ohHDLfarAAvESieY6iaGsjbh0rtfyxxZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6705


On 14/09/2023 06:48, Penny Zheng wrote:
> Hi, Ayan
Hi Penny,
>
> On 2023/9/11 21:59, Ayan Kumar Halder wrote:
>> The VMSA specific registers (ie TCR, TTBR0, TTBR1, VTTBR, etc) are 
>> valid when
>> MMU is used, thus we can enclose them with CONFIG_MMU.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   xen/arch/arm/traps.c | 17 +++++++++++++++--
>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index 46c9a4031b..83522fcc5a 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -698,8 +698,10 @@ static void __do_trap_serror(struct 
>> cpu_user_regs *regs, bool guest)
>>   struct reg_ctxt {
>>       /* Guest-side state */
>>       register_t sctlr_el1;
>> +#ifdef CONFIG_MMU
>>       register_t tcr_el1;
>>       uint64_t ttbr0_el1, ttbr1_el1;
>> +#endif
>>   #ifdef CONFIG_ARM_32
>>       uint32_t dfsr, ifsr;
>>       uint32_t dfar, ifar;
>> @@ -801,9 +803,11 @@ static void show_registers_32(const struct 
>> cpu_user_regs *regs,
>>       if ( guest_mode_on )
>>       {
>>           printk("     SCTLR: %"PRIregister"\n", ctxt->sctlr_el1);
>> +#ifdef CONFIG_MMU
>>           printk("       TCR: %"PRIregister"\n", ctxt->tcr_el1);
>>           printk("     TTBR0: %016"PRIx64"\n", ctxt->ttbr0_el1);
>>           printk("     TTBR1: %016"PRIx64"\n", ctxt->ttbr1_el1);
>> +#endif
>
> FWIS, on v8R-AArch64, with MPU on EL2, we could still support VMSA on 
> EL1, so registers like TTBR0_EL1/TCR_EL1 are valid.
> See ARM DDI 0600B.a Table G1-2 Alphabetical index of modified AArch64 
> System registers (continued) for detailed info.

Actually, you are correct. And, we should not be using CONFIG_MMU to 
enclose VMSA EL1 registers. I am ok to drop this patch.

However, refer G1.3.7  "ID_AA64MMFR0_EL1, AArch64 Memory Model Feature 
Register 0"

When MSA_frac, bits [55:52] == 0b0001, then there is no support for 
VMSAv8-64. IIUC, VMSA EL1 registers will not be present.

If this is correct, then we might need to have AARCH64_V8R specific 
config as ID_AA64MMFR0_EL1 can be interpreted for this configuration only.

Appreciate your comments.

- Ayan

>
>>           printk("      IFAR: %08"PRIx32", IFSR: %08"PRIx32"\n"
>>                  "      DFAR: %08"PRIx32", DFSR: %08"PRIx32"\n",
>>   #ifdef CONFIG_ARM_64
>> @@ -873,9 +877,11 @@ static void show_registers_64(const struct 
>> cpu_user_regs *regs,
>>           printk("   FAR_EL1: %016"PRIx64"\n", ctxt->far);
>>           printk("\n");
>>           printk(" SCTLR_EL1: %"PRIregister"\n", ctxt->sctlr_el1);
>> +#ifdef CONFIG_MMU
>>           printk("   TCR_EL1: %"PRIregister"\n", ctxt->tcr_el1);
>>           printk(" TTBR0_EL1: %016"PRIx64"\n", ctxt->ttbr0_el1);
>>           printk(" TTBR1_EL1: %016"PRIx64"\n", ctxt->ttbr1_el1);
>> +#endif
>>           printk("\n");
>>       }
>>   }
>> @@ -907,13 +913,15 @@ static void _show_registers(const struct 
>> cpu_user_regs *regs,
>>           show_registers_32(regs, ctxt, guest_mode_on, v);
>>   #endif
>>       }
>> +#ifdef CONFIG_MMU
>>       printk("  VTCR_EL2: %"PRIregister"\n", READ_SYSREG(VTCR_EL2));
>>       printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
>> +    printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
>>       printk("\n");
>> +#endif
>>         printk(" SCTLR_EL2: %"PRIregister"\n", READ_SYSREG(SCTLR_EL2));
>>       printk("   HCR_EL2: %"PRIregister"\n", READ_SYSREG(HCR_EL2));
>> -    printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
>>       printk("\n");
>>       printk("   ESR_EL2: %"PRIregister"\n", regs->hsr);
>>       printk(" HPFAR_EL2: %"PRIregister"\n", READ_SYSREG(HPFAR_EL2));
>> @@ -931,9 +939,13 @@ void show_registers(const struct cpu_user_regs 
>> *regs)
>>   {
>>       struct reg_ctxt ctxt;
>>       ctxt.sctlr_el1 = READ_SYSREG(SCTLR_EL1);
>> +#ifdef CONFIG_MMU
>>       ctxt.tcr_el1 = READ_SYSREG(TCR_EL1);
>>       ctxt.ttbr0_el1 = READ_SYSREG64(TTBR0_EL1);
>>       ctxt.ttbr1_el1 = READ_SYSREG64(TTBR1_EL1);
>> +    ctxt.vttbr_el2 = READ_SYSREG64(VTTBR_EL2);
>> +#endif
>> +
>>   #ifdef CONFIG_ARM_32
>>       ctxt.dfar = READ_CP32(DFAR);
>>       ctxt.ifar = READ_CP32(IFAR);
>> @@ -945,7 +957,6 @@ void show_registers(const struct cpu_user_regs 
>> *regs)
>>       if ( guest_mode(regs) && is_32bit_domain(current->domain) )
>>           ctxt.ifsr32_el2 = READ_SYSREG(IFSR32_EL2);
>>   #endif
>> -    ctxt.vttbr_el2 = READ_SYSREG64(VTTBR_EL2);
>>         _show_registers(regs, &ctxt, guest_mode(regs), current);
>>   }
>> @@ -954,9 +965,11 @@ void vcpu_show_registers(const struct vcpu *v)
>>   {
>>       struct reg_ctxt ctxt;
>>       ctxt.sctlr_el1 = v->arch.sctlr;
>> +#ifdef CONFIG_MMU
>>       ctxt.tcr_el1 = v->arch.ttbcr;
>>       ctxt.ttbr0_el1 = v->arch.ttbr0;
>>       ctxt.ttbr1_el1 = v->arch.ttbr1;
>> +#endif
>>   #ifdef CONFIG_ARM_32
>>       ctxt.dfar = v->arch.dfar;
>>       ctxt.ifar = v->arch.ifar;

