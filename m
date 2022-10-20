Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A4B605E14
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 12:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426485.675053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olT1M-0000xe-46; Thu, 20 Oct 2022 10:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426485.675053; Thu, 20 Oct 2022 10:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olT1M-0000uD-13; Thu, 20 Oct 2022 10:43:28 +0000
Received: by outflank-mailman (input) for mailman id 426485;
 Thu, 20 Oct 2022 10:43:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yb7k=2V=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1olT1K-0000u3-63
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 10:43:26 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05a5771f-5064-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 12:43:25 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY5PR12MB6324.namprd12.prod.outlook.com (2603:10b6:930:f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Thu, 20 Oct
 2022 10:43:20 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::cde6:a05b:5dc7:836]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::cde6:a05b:5dc7:836%6]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 10:43:20 +0000
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
X-Inumbo-ID: 05a5771f-5064-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAeiqK1ZQV1CC8tuLKeTN6J3PGM1qJJ0N8BaEqj/AEyhkuZRrLaYxj/wmpXD1pGJOhTZKvKuPM4ppQ1u2QtCnHbxJAfB6fJt0D0kS3y6Qjp1U6KowKK/MajtomYTWWzqPzUuSiN1TL72IIMHkMDcy4oAMe/5/73ggGrHdo1f79ak47CibQmUdVVpFw1AGdkr/RrsvsTtuzUrGMRO186emUenu/+iZoHBuduzwP2bqp/GkHokv/vcG2LafGWpfwMkCb/L1wmHDcxPeQTu0CI1CzbaWeo2/dtzqKDMqUcCZokS86m1mT/wWdjhfAuGsshZRAgWcBXqDSh8514YM4m7gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aW1O3Jih8H5+JSUwTtyWGq4DG7pH4FcInZ0wMLtbKnc=;
 b=e4LQuRhMv9L3Tc9RadKqv2VNOH3i1if2cWpVxkXBEPGaXppoNYMqR9I9YG+7rSfUDJIVNqhLfu+q3Z8JVAMz2bcN5ZusVRum8RknYAZ8OwwjpcTOT/i6KDHrXL28n9qyyZ0QLhYGzrF68tvVYd1NbOE4dgmFHDBMqgmxjWGCde4KtU4+RIl/Ur0qPilea5owV7gLl5YT/VPRRF5GTujZ0xtI1WueRNdlRLVyautB89HMu+K/Vk25SsgIMSCnmzX2hzMeeA3eySSNn03TLKzkZRegJ6/o1JmYBcWF4b+KEJXziOtpDPxEzZyvRIE0xe1e49XDNrS36kmm/TGCPSoM6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aW1O3Jih8H5+JSUwTtyWGq4DG7pH4FcInZ0wMLtbKnc=;
 b=YRdNe3fPVvJ4q30/U+8UcQ+PbljsTB2m/9bZCiWyumg/eLoYPFq0Jl/zR1BlXIku0bbRZ7O6pF+T+TJypBNktxcW5nJJWwX7snUIWnZPzOSTUGy6gBkSqmYYEAJy86mCudMwZ2iRgPcpgtr2HankmFh9RkXtz91PTRq6Aqt7OhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c6dd035e-d826-6c81-648e-73cb9292e0fd@amd.com>
Date: Thu, 20 Oct 2022 11:43:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [XEN v1] GICv3: Emulate GICD_IGRPMODR as RAZ / WI
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221019143620.45814-1-ayankuma@amd.com>
 <745ed2f6-4193-b7a3-c3a0-455ef8c24b66@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <745ed2f6-4193-b7a3-c3a0-455ef8c24b66@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0513.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::23) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY5PR12MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 0efb5c44-cb08-415e-52b0-08dab287e76f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/Zi1cHwZ4ETGA6d0p4vYKdGK4S4Peey5o54+eKFzZ1X+BTPbIEgeKzcpTBikwF0/YoyCBg3vYtWd1A1nNHiayWKhP8we6a/typZYVxFwu6KUHHNBUmrheG/c7ZP6uko7L04eD6uSSydnEG//2xG1wwblFJ+4MsmOztxgcuPGYTAlDy+slS2bCWZtay+qzxl8LYFrnuisx+jgxXbdv/n3XY9ZBlo7IOxZ1WKGkLq8VYadjazVahynu+F8xs0pYVM+HoykMNInDz/bYwRJB0tJL/DA5STcoahDdVfElRdy2NTl6Vsgw38J5kdJUu+glcZdtsBQkNGhklNVsEA9BHY8YmhFWiCl/oxncrnoRqBr7OCfZREPeOx6Dkzf6DCaHQAEDuw+s7xKq4nsU+KfG0W2p3bos5xmrNtZVEdWV0ojBqgcIB3k/6oIujeAD+zrTfP1NR+PILc8OwhIwaTw29GtuyXaXw9y4jtld4NofJsucFkhuPF2RNU7cdd6B9cXGZ7uuAWJEeXRlbWmjE2w2VEWIoV+7LyRJmfmYwZHZ/0geM5jWcuG0IavCdKoXmaD+T4l7SKResvlb2zZ1vgX8Xt14KnsVH9qYgvk4VFIsEP46GJ93jYqK2YoSvvr1ndEh143/yet+0tWNpCP3Oj8g2aHnf8wcTTLWNauh/5eTUSSYM5b5YH/uLWDGz50SZRsIgZs+3P/ujvbMDDvPoshD2XKSlaIx/1Xc+Ax1SjPIJrWIdZVNzezsBM81pCAzUXR4ZPyMgdt+FQ/EKa/rSl8NFSk01TUK1yWvwnvZyNvZwnqZbQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(451199015)(6486002)(186003)(83380400001)(5660300002)(8676002)(31696002)(2616005)(2906002)(38100700002)(41300700001)(4326008)(26005)(478600001)(8936002)(6512007)(6666004)(316002)(6506007)(53546011)(66476007)(66946007)(66556008)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djJscERhTENYR3NFb3FjR0pjOG1QY1dxTTVnOVF5MmFhRUxCUjlKSC93QmQ4?=
 =?utf-8?B?SmxwdlhEbHUwMFdzSDUyTHRUeElaQmxrc043Tkdqd04yYzB0cW84NTc5RDg1?=
 =?utf-8?B?Zklvb1M5bURkSndBT0R1empzSDlTVktlcVBOMTdBamxVNkE4d3BWTE1QaCtB?=
 =?utf-8?B?bWZ0aWd3bk8vdFNTQWVyYldOVHE1em41SDdIeTI3dHUwWnpaUG4xQW9YbWpZ?=
 =?utf-8?B?ZlNodGVWSEljUHZzTHQ3aWVPWkFGVWR0V2M1aGNRekZYcnAxZ0lxK0tKRWx5?=
 =?utf-8?B?QzVwT3E2bS9HOWlpR1pMS1JZbm5mb1JPUFZjU3dmUnkwVXQ3WjU5c2xTQTdk?=
 =?utf-8?B?NzNpa3FDYVN6cTIvQ0U2U3JBNGFWRFZ4Sy81M0VoTHdSTmt4VjA2ZXF5VzQr?=
 =?utf-8?B?RzdGOENCMWJGU1VrV0FzUlB0Z1ZmMzRDL2psVFZEWFR0anFBR0lYTkp5V2RW?=
 =?utf-8?B?V1F3dkFkOWQ4Q2E5Y0VVdkp5TWhaWE9BN1RiLzYzdXdsNGZZcWw5dHphSG1a?=
 =?utf-8?B?ODFUd2FxQThWSEpxQnFROUpNUlA0bW9SUTUwZjQzK2tncHVqbnFIYnR5aFo0?=
 =?utf-8?B?OHBHbGswMzN1ME4wUm9WT2J5MFpIemZIWlRFR3ZPdE1kNFlMdStTMlcwblg4?=
 =?utf-8?B?SVBlOTl0a3BlT1RTKzlTNU1tSHhmb3A4OEVwMVhhVVQ0RjMvamd1TTVXR2NT?=
 =?utf-8?B?UTNTWU9Ha21kdXA2OUxZSVVxMnJLb2lGYmJ2SFRUSFhnVml1Vmdzais1ZVl0?=
 =?utf-8?B?cXFoODVCRU8rRFF6OEJEQ0hGcjlkczJuMUZmdk9UL1o2aE8xeHczaXQyR0NW?=
 =?utf-8?B?M3lmaWFselBFdlZQMXVKd2RvRWRpazJNbFZHeDVIdDZkRmxycjhNa0xkemth?=
 =?utf-8?B?YU1QWGlEMDlNM0tqUWNGL1BGSFhDTlFWYzVNYmlwUEFMUUh6RG5GVlZXRzJv?=
 =?utf-8?B?RFdhZTQ4V0lyUjI4eXBMRk40SlBBOEtWRWZUYTU5bXpuZGxIS3I0QnFMN1N1?=
 =?utf-8?B?UDRTM281alF1UVEvRHFacFZkbGc0REVsU1dCZlZ4ZHliOTFsMVlHSG5JQWZw?=
 =?utf-8?B?YnJzcEFHMnB3OE9ocnV1TG9KRFd2OG1PUWFKcmlxRkF2eDdBVVR0aTUzYlYx?=
 =?utf-8?B?Q0lwSU1GTTkrTGNUNzRTNTNQcENpZTdWNjduT2FabW13Vmo0Y2xld1plSDZu?=
 =?utf-8?B?TnhQTStiOUFnaTN2SHJQeE0yamlYemFHV2FVcGdCRzBjZUVMRHJYYk1RSXJ6?=
 =?utf-8?B?VEFkOWlBNm5UMjRxS2NsMkQyK2VTUkk4bXBjYU0wTkZqTTV4M0NmUDRBOTBk?=
 =?utf-8?B?bWljSysxd2RUaVRjMXR3cWlpdEc2b2tBTW02ekQzK2NDOFl6aTNYcWlyZTEz?=
 =?utf-8?B?NG9CYWFJNnZXYVEwM1AvRTVjQmozUk9JeGs0SzA0bk4vc0ZVaTVja2ptRDB6?=
 =?utf-8?B?a1pMalVMcjhQK0RxYW9YeEZ0MEROcVpBdnZHT2NGSzNTdmF2Rm8rZWxJUjNp?=
 =?utf-8?B?eEJNdUgrWWlZN0N1TG1rWXZZQnRJK2hNV1FvK3ltQ1RDUkNKNVhDRDI3QWV1?=
 =?utf-8?B?OXhNUFZlRktVOEJrY01uWTlGZXFmSzNIRFV1UUI2NmFiaGgwZ285UVllNlFy?=
 =?utf-8?B?TURqSk03aWVNTzFwbGpoNmJiZmV1MUJOdlI4a256ZW1BV0ZhZWYzT0YrOXlB?=
 =?utf-8?B?L256bE1ZelIzTEJncmNra0hFL2gwVG44bGVRcVk0cWgyU0VqRlZKVTNSKzBN?=
 =?utf-8?B?QUZ2T29kYU82MXAway9BTjBJM0JCOHZYSDZZSzR6WitGcklxSG03Y3h6Qkkz?=
 =?utf-8?B?aHdwTXNaUHBlejF1d1loQ2g0M24rVjRaUHR2aTJVNERySFo5aEdEbEgveER4?=
 =?utf-8?B?MDhDRFV0TkJOMDNZVlZjYk9BR3ZBdmlIenVJbW9uRE9FN1JUUUJ6KzN1TWFy?=
 =?utf-8?B?ekxNTC94T2M0S2ZjMlVNclJJSU5RNEFJYVJ4S01aNStYbnBsalZkMFJPam9r?=
 =?utf-8?B?eWtTWGF2d2xVcnlhbTFuc3dDd09wTGU0TWVydlp3d0h1UWRmRnErWUxtbktq?=
 =?utf-8?B?K1J3ZmlIazBJV1RaZVN0MGJadFhxS0pUMldzWXQ2bEdZaXZmdTQ5eWYzT1o0?=
 =?utf-8?Q?93hUGkVXnYfmKonF/5N7u6uMy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0efb5c44-cb08-415e-52b0-08dab287e76f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 10:43:20.4664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QLLO6IrpTXTHyO192vx3AxZgzkr9BKyqsRTmE/kc4hjrxmrSqH/Y/nMpCj6Scmfny8QdzDzYFExTA6K3VEceA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6324


On 19/10/2022 16:49, Michal Orzel wrote:
> Hi Ayan,
Hi Michal,
>
> On 19/10/2022 16:36, Ayan Kumar Halder wrote:
>>
>> Refer GIC v3 specification (Arm IHI 0069H ID020922), IGRPMODR (similar to
>> IGROUPR) is relevant only when the guests run in secure/non-secure mode.
>> As Xen does not implement security extensions for guests, so the registers
>> are emulated as read as zero/write ignore.
>>
>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>> ---
>>
>> Observed the issue while running Zephyr on R52.
>> Also, found that KVM has similar behaviour.
>>
>>   xen/arch/arm/include/asm/gic.h | 2 ++
>>   xen/arch/arm/vgic-v3.c         | 4 ++++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
>> index 76e3fa5dc4..998dd62651 100644
>> --- a/xen/arch/arm/include/asm/gic.h
>> +++ b/xen/arch/arm/include/asm/gic.h
>> @@ -48,6 +48,8 @@
>>   #define GICD_ICFGR1     (0xC04)
>>   #define GICD_ICFGR2     (0xC08)
>>   #define GICD_ICFGRN     (0xCFC)
>> +#define GICD_IGRPMODR   (0xD00)
>> +#define GICD_IGRPMODRN  (0xD7C)
> These registers are GICv3 specific and as such should be defined
> in arch/arm/include/asm/gic_v3_defs.h.

Thanks for pointing out. I have fixed this in v2.

- Ayan

>
> ~Michal

