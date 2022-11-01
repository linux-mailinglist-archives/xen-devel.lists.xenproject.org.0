Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C07614921
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 12:33:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433447.686411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oppVr-00009J-RJ; Tue, 01 Nov 2022 11:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433447.686411; Tue, 01 Nov 2022 11:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oppVr-00005y-OR; Tue, 01 Nov 2022 11:32:59 +0000
Received: by outflank-mailman (input) for mailman id 433447;
 Tue, 01 Nov 2022 11:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5zcP=3B=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oppVq-00005o-4o
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 11:32:58 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee3937a8-59d8-11ed-91b5-6bf2151ebd3b;
 Tue, 01 Nov 2022 12:32:56 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA1PR12MB7565.namprd12.prod.outlook.com (2603:10b6:208:42f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 1 Nov
 2022 11:32:53 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 11:32:53 +0000
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
X-Inumbo-ID: ee3937a8-59d8-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5WopR3lK93Xynmteh9HeA0LibmW7LQKLoQ4ImnsgT8GIyUqda/2KLdczITAKWAtEvcFi8YFHE3XK/imYUsBvvT3RgBYKPFMf+NRWDZF46MilBYyFdj0kW1jRnCN+xXrNy5D3Yqar31yl7sftrLqXsV51pdbv2RklqsgQndsBGIuP7+sVhqxCwpa1nJjMbWAQWlQGBmSkEWNkw0rlvpfBxsjzRAGV6RgkTglL58iGk2aiP4P52MqlGvwI7nkV8WnCl9tHlQE/SyUQmCQPlwzKCh0Di6ESt4sWhVvsk8m5Y5SCcRkjC560Lsu8tMhVbCC9UH70ZaDS2/vonME4GTpNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MS9+q/e9ffF8uufoLoRlMZ9DGfA/Ym7sA/HZ6k8qIx4=;
 b=n16RQZEgMHIsnwXwycS7EJ+zoPZ74SfFeD9WEKMnaaXHHF+3GyZUO42N9aFgezajl1YmUCmGcN8zycKsnY4+M4bT0aqXc5Gj3Wi+cBJt8U37zngiexRzv2i2zI5hViPTIzssXx6iUBQTeGmwqYKS4niCOuFL2qzY5JGSNzvIqnX9eW0U2imxjgUtfYfjXKCfxDwc0V6DqP2Y0/3cJNRRgVJIGnjaM9vqz28Tt5/KAy4NtBgAWJQgreuTkTBpSF9vTBDG1ewbKTDvv4hPz/Tnp1QlUZKEy/nsWSvW3sm7jTL8C+yOJVwN/obwOa9DKX2f/HLIo6FXdwnxObyEjkAu6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MS9+q/e9ffF8uufoLoRlMZ9DGfA/Ym7sA/HZ6k8qIx4=;
 b=V3e+a0qvMhVRLiBvY0/FLvTdkZ90lsF8DXgAOeEtOCaCUlsWh7w/GeqrxBzN3YNGiJDXoLvsnT23+lpGLmcU4I39Qa4J4rS55OL1GUiz6qzxUSiQNhvBNy3xiSGDfkWLNO1FqkPwmgZuSF4YPNwcThEk8Fr+eGOH+O6gaTN8G/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e65cab06-2c52-4bd9-3434-d9ecf702b927@amd.com>
Date: Tue, 1 Nov 2022 11:32:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 02/12] xen/Arm: GICv3: Move the macros to compute the
 affnity level to arm64/arm32
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-3-ayankuma@amd.com>
 <4271ac3e-04bf-7bbb-2db9-3216ac19e778@amd.com>
 <c5ab6164-6441-85bf-fdcf-576af7472fd6@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <c5ab6164-6441-85bf-fdcf-576af7472fd6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::26) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA1PR12MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c51606c-b442-4453-b2ed-08dabbfcd055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wy+8qL3HvbI1oWmudEoyT3PnuR1y9mlAr+BQQwwpYh/l8aEU3wB6OTk/twdt0hh6D9fQWl0xZ8zvqDF+EdwmL4TNDmCcau0NZjW1N6Lttf26TxXvzkzdDcCfa2KRsyV4Fwp4re2EDIuO4R9V1PF0Es5BW4gTVLP29UtkryEdB9yTzICrzWpJDzBcW95p3x13sFhKU2cGNnzO+W4wxsTeXMsm62vhDqHFjrMsj1MQLrtgNfz/bUniZhT9PsgLe1jFyn29I5iicnbMfssSoj+oCG1QHrpLbvlFCCsif6LycOq5AT7HNdVud6IJjDas8s2YiRtf6Icz96PHseYb01nMIuQ8CHmjeNyVHJuxzK8odASYY7I6wtV53o1V1gj6qjFNHN4j05qcJuIHDXuNEZS0AEVCH7BPRNA8MJsFSlqrDUYfh42izfrCXHFLPtvrJSWlzWi3W7Y2KEeRrjh5Mrb0YzEURgW8PSbAKSr+o7pVEOUdOZSW7VOY0QHlFiE3RLOs4u1bRRy+7S8Rghdu5jSi7URLwf1PjoiaB2TZfH47KlyKxaLZeMw7qecO53HVnh9zI+P/cQk7+/T5LnQDVvwZbstXnJc0UfuE7eALJBblOcLbCATyYBrehzs8HDQnTMBwCxTWy2un1HoL/qPuunnZrWjDKqClXea3MAZCpIU9gCsoaC7zShw2pEx/oULNbS85/+8zjz5mTM19riY1pfMB3+DiKKVmaOS2ck0MBJslKaorC0YzY7d88eV5ZWUVMTUAbBEexzDCM/DGCU1/CahUA1f4Dde9WM3MQ4RO+XkmnK/XqNltMGa9lFx8qdussV8a+EU//LHI3Itl7CSvr700smGICW+ZOA0LSeUUrWe9mlr0+v24X5lsh3mbw4HtGMVA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199015)(2906002)(31696002)(38100700002)(36756003)(31686004)(8676002)(83380400001)(26005)(5660300002)(8936002)(2616005)(478600001)(186003)(6666004)(6506007)(6512007)(66556008)(966005)(4326008)(41300700001)(66476007)(45080400002)(316002)(66946007)(6486002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXZjSWNLUkk4L0o1ZDZySDBXY0hGQnJWMHZUSG8zYWloRW5sbkQvV0pVdmsw?=
 =?utf-8?B?RzV2MUl3MmlGL2dBOTlyOXBEeXpsNmRTdzJQeEdoSFNMTGMzUEJRdXZMc3lR?=
 =?utf-8?B?bnZ5M1VnUnFMSlJ2TGF3NUlZZUFvVmJ4STBpV1ZyRmM2MG5LVElsSkUxRGNB?=
 =?utf-8?B?NDNjbnpoQlRKNU9XQytSSWdYQ25uVEdyZ0ZhcGVOa3JXODJOOGp5VDBzUlA2?=
 =?utf-8?B?RjFHZG5ueWVpbis0VzRqYjcvSDB6N1Z4NElLbnF0RkF3OEJIdE8yZFBKaEE5?=
 =?utf-8?B?TzlyV0RDV3lxZEtsaU9NZTRmUjNacG5MWUpUbDF4VG9aZ2pnQUVGbDNmQkhJ?=
 =?utf-8?B?RmlVWGxOc25VendKMzdIaC9xbStNdWxFc1J6eHA3b2Z6Tm0vVktlQUtLa0k0?=
 =?utf-8?B?RWVWVzk2YWdUZmJCTXduZlpyRFZwdTdPeUVBOU0vQVdGYUtMMloyOVFuNmlW?=
 =?utf-8?B?S3FITk1JcGJySWhQZEpObEduMXozUEFOcHRTc3owcGllN09memRLdmIyZGNJ?=
 =?utf-8?B?VW1LdUZzWnFIajJtMVJ1ZXVPeHQrSEY5T1VFZDF1U0w1cHRieXFBYW1URnl5?=
 =?utf-8?B?b1RnSGpiZ2lnTERyRnI5WFo2WjNZeG5zRDRGQi9wMElqeG5VSi9BRXk3ZXg4?=
 =?utf-8?B?TmR3VXlxbjdybXVydVptL2pNRGFyWUxHMjNBMS9vVjZtYml0REM2cEFFUWFu?=
 =?utf-8?B?L0NUakFIbDQ5d3BrVUJ2VmxXWlhQbEhpd3lCVjBreDh4aXUwLzNJMWJaenZq?=
 =?utf-8?B?Um5VQjBON050YmFTbjYweUtVdVF4OC9DM1VveUJ6b3VVeE5JSjhUR2VFU2Zu?=
 =?utf-8?B?WFVrUUZHQnR5OUJKWEg1RUZVY0Z5MklJSEEyM2tJY1pycUl0cHFLRFJ0aU05?=
 =?utf-8?B?SU9za1BOVXYxem9hTWszTVRKb3k3eGtEUnBkdmJXQzYzY3M3b2hLUjN5WDFF?=
 =?utf-8?B?czJHcXFvUnB6TElLMXpndUxma3BNUy9nZVQ0RXBuUjZoY3FVL3QxSVpyblVW?=
 =?utf-8?B?dXZsMGI4dHBBQzVIZkc0eFVVYTV1NWNlaTBIbFhFb01VQUVCTjNEWlFMRFpq?=
 =?utf-8?B?Nkw5SzNPZmxzNG1TaFNOVnI2OUN5bWtwbmFaQmNhejQrM3lobVVPWnhRajBL?=
 =?utf-8?B?T0wwamcwM2JmellPU3BSYjdycE5kMU01bHJIcTRsYUc0K0JGU05WbUlSL0Zl?=
 =?utf-8?B?SEo4Q2w2Tkp2Y2U1NXB0SWgxakRuNnB0Si9NWmRkVDAxODhpWDVzeTNSQ2dC?=
 =?utf-8?B?dEZldUR5UVk0N201WGVkQU1DSFdFWWpZOFVlZkdDT1BSRXVNTGdoWXJjWjdW?=
 =?utf-8?B?U3BlQnlpdkY4ckh2TzVqYWtlTHYwTmtIZnNFditwbnNnRHZqT1FYRDYvRVo5?=
 =?utf-8?B?VnoyTXppUExCakh6MlVRYjBzQllnbE5yYndWV3gzajdLUDJ4SUI5NmVyTzRx?=
 =?utf-8?B?cEFaSk45MjZyYjFEY3d2SkZEbGh1RW9XSXJSUC9hUVhVL21LczNRNlVlNWU0?=
 =?utf-8?B?Z0FUQUh1QzliYWltMlZ3cmFVVHA5eW1GcDJZRi94TzFRVkhDQWpzRkJsYjh2?=
 =?utf-8?B?UWRJUzRhUnU5RDBOMEFaWU1rbUdkc1MxVk8rbmxpR1VWZVNVQmpnZGU4TlpL?=
 =?utf-8?B?QUtEWEZrbzZWNFpEMFVpU3g1bVhLNjNZSGg1cjVFNVNDZFQydHlHRVo4N0Nz?=
 =?utf-8?B?VEFrMVhTdXBESmhYbDNxdk83N1JtUGxNdXRrSGpqRnJudXN5RjZUZjJiZm5G?=
 =?utf-8?B?bC96bjZQSlVpRjFveDExekpWRlZaa1RaZWpIVkV3ZHZZaG5OOUU1Z1dJZzFX?=
 =?utf-8?B?WGhHQVdJbCs0MXFFVHJoRmU4dFNVdGJEWmNzdWUzRWF6TENrOERSbzVSbE1G?=
 =?utf-8?B?RGs3TUhKQ2F0VFVQNHM5ZXllR2pRb1ZiT1dNY094Z21nOTNYYmlCNkd5c0Q3?=
 =?utf-8?B?WnZYOXFLNGlvNnJjU2JiczBEMTFIUDJDcXlaQjZTUjd3NGZaakxoQ2FUQ2M2?=
 =?utf-8?B?NlNZUmRkclE1OWJmUkRFU1I3UTE0Z0Z0V3VhV1grQTYyQlQzeU1sSCtzLys3?=
 =?utf-8?B?R1grQ1lEZndvNmN6TUVaWjJyOGQrcFNQQXZJWHFnV1hRME5DY25QZURGaTFs?=
 =?utf-8?Q?tOklQh3bfOF4MKuWq8lEV9OBm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c51606c-b442-4453-b2ed-08dabbfcd055
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 11:32:53.0276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vKRiigGhhcVJLKmhWejkD7A92521RWXvRCkE7UUrfYtF7pMhyEukFo4z4+vjtGluZ3gtNPZGUXEeMCfIK4yWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7565


On 01/11/2022 08:58, Michal Orzel wrote:
>
> On 31/10/2022 18:53, Michal Orzel wrote:
>>
>> Hi Ayan,
Hi Michal,
>>
>> On 31/10/2022 16:13, Ayan Kumar Halder wrote:
>>>
>>> Refer https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.1-rc1%2Fsource%2Farch%2Farm64%2F&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C0b2a0d1537104c2391d008dabb68eabb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638028356554609284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=RhhL0XWxLJsO7vsP0DoP1QMvUMwGV%2F4FPJwAyvStj4k%3D&amp;reserved=0 \
>> You should not split the link as it is becoming unusable in that form.
>>
>>> include/asm/cputype.h#L14 , for the macros specific for arm64.
>>>
>>> Refer https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv6.1-rc1%2Fsource%2Farch%2Farm%2Finclude%2F&amp;data=05%7C01%7Cmichal.orzel%40amd.com%7C0b2a0d1537104c2391d008dabb68eabb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638028356554609284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=gLsNWm5%2BSyy51rn%2BA6H8PrWg8Yv%2BERicyyDjshOd3hc%3D&amp;reserved=0 \
>> Same here.
>>
>>> asm/cputype.h#L54  , for the macros specific for arm32.
>>>
>>> MPIDR_LEVEL_SHIFT() differs between 64 and 32 bit.
>>> For 64 bit :-
>>>
>>>   aff_lev3          aff_lev2 aff_lev1 aff_lev0
>>> |________|________|________|________|________|
>>> 40       32       24       16       8        0
>>>
>>> For 32 bit :-
>>>
>>>   aff_lev3 aff_lev2 aff_lev1 aff_lev0
>>> |________|________|________|________|
>>> 32       24       16       8        0
>>>
>> Where did you get this info from?
>> FWICS by looking at ARM ARM DDI 0487I.a D17-6118,
>> "Aff3 is not supported in AArch32 state."
> We're talking about arm32 and not AArch32. My bad.
> Nevertheless, looking at ARM ARM DDI 0406C.d B4-1644,
> MPIDR for Armv7A/R also does not have aff3.

I was illustrating how the bits are represented in software

Refer 
https://elixir.bootlin.com/linux/latest/source/drivers/irqchip/irq-gic-v3.c#L625

I was trying to depict how "u64 
<https://elixir.bootlin.com/linux/latest/C/ident/u64> aff 
<https://elixir.bootlin.com/linux/latest/C/ident/aff>" bit 
representation differs between arm32 and arm64.

- Ayan

>
>>
>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>> ---
>>>
>>> Changes from :-
>>> v1 - 1. Rearranged the macro defines so that the common code (between arm32
>>> and arm64) is placed in "arm/include/asm/processor.h".
>>>
>>>   xen/arch/arm/include/asm/arm32/processor.h | 5 +++++
>>>   xen/arch/arm/include/asm/arm64/processor.h | 8 ++++++++
>>>   xen/arch/arm/include/asm/processor.h       | 6 ------
>>>   3 files changed, 13 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm32/processor.h b/xen/arch/arm/include/asm/arm32/processor.h
>>> index 4e679f3273..82aa7f8d9d 100644
>>> --- a/xen/arch/arm/include/asm/arm32/processor.h
>>> +++ b/xen/arch/arm/include/asm/arm32/processor.h
>>> @@ -56,6 +56,11 @@ struct cpu_user_regs
>>>       uint32_t pad1; /* Doubleword-align the user half of the frame */
>>>   };
>>>
>>> +/*
>>> + * Macros to extract affinity level. Picked from kernel
>>> + */
>> No need for a multiline comment here and everywhere else.
>>
>>> +#define MPIDR_LEVEL_SHIFT(level) (MPIDR_LEVEL_BITS * (level))
>>> +
>>>   #endif
>>>
>>>   #endif /* __ASM_ARM_ARM32_PROCESSOR_H */
>>> diff --git a/xen/arch/arm/include/asm/arm64/processor.h b/xen/arch/arm/include/asm/arm64/processor.h
>>> index c749f80ad9..295483a9dd 100644
>>> --- a/xen/arch/arm/include/asm/arm64/processor.h
>>> +++ b/xen/arch/arm/include/asm/arm64/processor.h
>>> @@ -84,6 +84,14 @@ struct cpu_user_regs
>>>       uint64_t sp_el1, elr_el1;
>>>   };
>>>
>>> +/*
>>> + * Macros to extract affinity level. picked from kernel
>>> + */
>>> +#define MPIDR_LEVEL_BITS_SHIFT  3
>>> +
>>> +#define MPIDR_LEVEL_SHIFT(level) \
>>> +         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>>> +
>> You should move these macros below __DECL_REG as they do not require having it defined.
>>
>>>   #undef __DECL_REG
>>>
>>>   #endif /* __ASSEMBLY__ */
>>> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
>>> index 1dd81d7d52..ecfb62bbbe 100644
>>> --- a/xen/arch/arm/include/asm/processor.h
>>> +++ b/xen/arch/arm/include/asm/processor.h
>>> @@ -122,13 +122,7 @@
>>>   /*
>>>    * Macros to extract affinity level. picked from kernel
>>>    */
>>> -
>>> -#define MPIDR_LEVEL_BITS_SHIFT  3
>>>   #define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
>>> -
>>> -#define MPIDR_LEVEL_SHIFT(level) \
>>> -         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>>> -
>>>   #define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>>>            (((mpidr) >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
>>>
>>> --
>>> 2.17.1
>>>
>>>
>> ~Michal
>>

