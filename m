Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BD8702BC8
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 13:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534725.832049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyWi2-0003nz-3U; Mon, 15 May 2023 11:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534725.832049; Mon, 15 May 2023 11:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyWi2-0003kD-07; Mon, 15 May 2023 11:49:46 +0000
Received: by outflank-mailman (input) for mailman id 534725;
 Mon, 15 May 2023 11:49:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOm1=BE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pyWhz-0003k4-OU
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 11:49:43 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93692205-f316-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 13:49:41 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS0PR12MB7928.namprd12.prod.outlook.com (2603:10b6:8:14c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 11:49:36 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 11:49:35 +0000
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
X-Inumbo-ID: 93692205-f316-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NaAn4IX4e79lBj90V47STYE0t/9tHDHKXtfm05FbGkrRyCl41SCsM+VKuRnK5Xg64la3mZtB7cnAOGtUNUrXdgC0hUNv2R9mDFZhQcCZ4KolkNJttHOtroRGUTTTF4xs6MzfDLVQyB+3NpzFwYL9Z+fWVIu8SB4Ns+MXjukWUt6GHtKglV39UigABs4e6IbzaDfN42Yb/jZYxyT4mBf2DeGXN0RmZ/BVRkQOIgtEqnEEphLVUPmQvX0juWXtkPR8UKSurMqXzIJ3/LnufbHyhKpiNroKtODgE87TxzcgzXxbfVzR2ymD5UPi4cU4YqibthpUamb4WleNvrqaDK6tYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBuC+mIGtuzRqq+fDjuvUsQpxfVFb0bpcAkdk/fMXKc=;
 b=kFYtckE2N9dZFtvNriLSDIno8oBLO1BMyyWVDESB/ZULJ3ECiGARbILF+Y/TyX9PRlTF+pZeBO6nZkjHKoH8Ec+DaBNhn0UMr3N0DU2+XrNPGy9xwWOW5Svu6GvSoHYUxnKRocUFlduaOb2ZeZve0e0X5eneFgH37mxICr1F/ZIV+geS88eg1c/W2HQKbqS3VW/zEnEb/98vxm+V3SWTbEdR6o3cco+JXy3DN07lxRUMnEgCV9KuHzQfpnTjyCa6mXmyQSHdz3Em/NrQOJ/lDAkJyfa00Of3gdPrNc5Xzz5VGbYhRhTyXygpnkW1Ir1zMlTTWZjtXTyAWlJQn0ISzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBuC+mIGtuzRqq+fDjuvUsQpxfVFb0bpcAkdk/fMXKc=;
 b=byfYvAlNDSdyQY7yeCjVKrD3i0H6sDvPXLxzYsSGvXcBdzVsYx2svkmosHf8ed0fHh8WU7d6+I6wI6GXUfJXjkaaCp6mkRI73DXor3pNKVEsvS3DbaCdTAAdHJslqW3Cm1p5+PRc9JSEyGRIHfIz10Plpk3+NBhJrplZAyrzFZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <32fd56d1-80ce-d175-b13d-e17c1649b4e0@amd.com>
Date: Mon, 15 May 2023 12:49:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [XEN v6 11/12] xen/arm: p2m: Use the pa_range_info table to
 support ARM_32 and ARM_64
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-12-ayan.kumar.halder@amd.com>
 <63fa927e-72f5-1645-97c0-6986f2fdcabe@xen.org>
 <4681a4d4-68d3-01cd-912c-bca2cdc83266@amd.com>
 <175d5e01-6258-edcc-bddd-05ff9e1eb547@xen.org>
 <72fa0686-2703-6682-fe06-2fca14ff1986@amd.com>
 <701fb2b6-d552-0e3d-d108-a73863160b25@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <701fb2b6-d552-0e3d-d108-a73863160b25@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0138.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::30) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS0PR12MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b11bec-e5ca-40f4-67d9-08db553a7489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CG+e36xEkBuDiawMgfT4m7CvZzu/VVeZPAL1p6QK7ruXccGL2Y57Trd8Q0pH6CrMjUZPVCFuB80SRSQDRJ3lEiDAI/FaToeZHt9ZJl1ZJarFk+aQBEKn4nMyXawGVHsmkf14a+rAa8Mjh01yO2avk/9wPaSt+9o/RWTSqrYAZl+VF013zLQKEzPpo//twvGcV5izfViQx0yYMtIzPGRhnsWTihPGcEV4KbouIqGFAXyhL/m22mxcgy8deRL95b7LV0oSej4V4Iq2fkpFqItu+4zamXrhtUAwXxMFdlIJ40/m00X9kC1UacMNCKstzw7+I/mOGMQKktzWpuZFnqkbX6loBFVkGO6Vts9/N5qB2OOZ9J27mrdVPMZeh4TU2JsFwJLM3PFQvwvxi3SGd076vKUkEGnc23qmUaAdTROpVlEsghrZ6HZfLYm9AYwcN9x3o9eTXC6QwFdPCRNv4LwwbvhqyLRGekZsXFwcwCmd7A2QcmYJNU+eEuLh5/11/YmYOUbCG/po5dRwoIFbxzWb3cGKKJIE/mGwkaAFvNWyF+wb4t+5f+1SmstrrZic3J2w5XYDp4q81362sLGSv0Unbxvv1N6O3xRX+BMmZXZm+TAW6ku+ZXrrPv0X+Mek7ygbVYiCGHLawzIYz9BREX//XQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199021)(83380400001)(66476007)(66556008)(66946007)(316002)(2616005)(6486002)(6512007)(26005)(6506007)(53546011)(478600001)(2906002)(110136005)(6666004)(186003)(7416002)(8676002)(8936002)(31696002)(5660300002)(36756003)(4326008)(41300700001)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFR6ZzFiQWtPUkZkTm1wM2VxaFNlVkdRL01yTzdidTV4TEpjN3UxQ1ZTb1Bm?=
 =?utf-8?B?NGhjOG1WaHJ0US9GNmtMWlZneWtPdGl1clVMcjhDaHZKa0tkN2ZvRTJaRmZ6?=
 =?utf-8?B?cUFuT0ZKNFZzQTAydXByYVRkY0lSbW8wVFlqRUtZN2NUQ095aFMwNElNa0pt?=
 =?utf-8?B?Qk1UaXJscDN0alEweEpGY0dHUFVhOWZTMEJQbWk1cU1JR2RGOFRod2NEV29w?=
 =?utf-8?B?eGVLOWpnZ2M4YW9NWjVTU1pIcmZBczZBbGJiTkxPc2dXT3VQQlJ3YUZLUjgw?=
 =?utf-8?B?eGxjc25nMGZpSi9sV3hOeXlqcHlDTHZBL0ovS1piUTZ4S0lST1p5WkRCMDRn?=
 =?utf-8?B?QzN2S01jY2tOeURpdVgrb2JmMHJsaHZIZlBKKzdqTUtYNDRYclRpOHhDem5L?=
 =?utf-8?B?SjNMSllHUEJLWkpjRGhHTWFvTEZrNGR3c21HY3BGR292NWhQNk4yWGdGQVJr?=
 =?utf-8?B?UEtIK1Vtc3krT1NhVkc0VGpLREEybGNoRjNSNlcreE5pc1Fpc2dTdkJvRWp5?=
 =?utf-8?B?c2ZSQ3pET0xDbXMrQTJ1ODZIWEV5N1ZyYlBPOW5mSjhKUVRnQ3ZDdEV5L1Nw?=
 =?utf-8?B?eTlucFpyRGxqeFI1VWwzSHhob0RubUVYSVUvbjhWWGYzc2htZlN6aHJHUnNn?=
 =?utf-8?B?cEIvSXp2bS90a1kxZlUzcDIvd1c1YitwMEN6OFZBbkY0eVM4SUFROUFoSjIw?=
 =?utf-8?B?aVEwa1czeGIvVVpZWEFsUTdQeVNDVk1MMk1IaWJVTDlNMGw3MDA2SE5NVkFX?=
 =?utf-8?B?QnlSWjh2RTVZL0h1ZUtDY1h2WmVkTkRGTFdnZSsrMkZmVWZCS0tMTzBXRTht?=
 =?utf-8?B?N1Y5TmhnTjdhNWJ3K3Y4eDBweC8vMTZsOGVEL1UzTEZZQmlieG1QSEd6cGE0?=
 =?utf-8?B?cVBxcTU4NCtFU3Jqd2Z2WnhDRGI4SS8zdnp1aHIzMHZnWDBuK0dPRG93elpG?=
 =?utf-8?B?d2M5Q3lpeWg4OERsdDg1Z3lYV0pZcUFQTDVHTEIvSnJaempqbllZNHp4Z2c2?=
 =?utf-8?B?MHdsSUVxSE5aL2ZuV3lqa1o3aE1zK004d0p3dVQ5VUF3b0RiazBHYUxXL3ZM?=
 =?utf-8?B?bmlhNk1LR0NwRFZSeUVmdGdKMUFFalAwMWlyMzlvaktCSVVPbmpPWmdxVm5h?=
 =?utf-8?B?UVJYeE1ZTHBiNTIyZXJsUlNLeHZDa0FaTnJheWI4RjEwU1FNQlRUYjdiVVJm?=
 =?utf-8?B?UnJUdG5aWkl2aXpvVjFHRjl6a2dmeEF1dGl1czFQSDl4Z2o2WW9LajdwNmlQ?=
 =?utf-8?B?Sm1wZ05kdnZLVU1vRThudzFMZW9qOEV4a1ZsVFNGZlNWZWd3MC93dlQySVFV?=
 =?utf-8?B?alJFV1FBQloyWFFoSTBWeXY3L1BqU0EzT2Nld1R2RHc4NTA1UGVqWjIzTU9G?=
 =?utf-8?B?MHJwbDBkdmVveDBseWpZQmFSMDFyM1AyY0pHRXpZL3lYSXl0Unc4cVhFVERG?=
 =?utf-8?B?djQ1dkUydHd2b0psWDcvM0FVbkNlcU5EV0tlSVl0YlJFamJ1Z0tLaVA5Sk9M?=
 =?utf-8?B?bi9CUGVlcThXZGlLWjY5ZVp5SVVQSXJTaHBPYmtWcHZUc3pVdDYzbkszT0Zn?=
 =?utf-8?B?UnBFUHF3NEVBQW9zQ0llYlBTczMvWUtoU1F2N1NoYUpaL2hDK25HNTN1S1dN?=
 =?utf-8?B?b3E4WnpjSW5IY1dqWXNLNzR5VktzWWJIZTkvWnJkUWMybkg5SDRSeXFZQ0xQ?=
 =?utf-8?B?MzNWL00yMFZnSnpGWllKay9lMlVoelk1WkI0SkM1b3ZTdCs1Y0Z4RGlCb05D?=
 =?utf-8?B?eGR6VHRiNnVBdEFZaFhEcnFxM20wK21JZUQyRVliajZGT3RyOFFSSlFYUE84?=
 =?utf-8?B?b0d4aGlIRkNLSWdibG8vVlJucjJDdW1nSTU5NVo2cHdiYmh1aHRDaFU5U0Vl?=
 =?utf-8?B?RlAxTXlSVWwyZ1lFZDNIKzFzUnoydkNsTTdFK1hLZTl6MTRQOGo3S2o0bHpO?=
 =?utf-8?B?YlpJUDhZNWJYL21RSXU4bTArd29tQThQanpDTGNTVUFNbi9DRzJzMGdFK0lI?=
 =?utf-8?B?RWVTNm9UenVMc1h6cDh5b0lmbWE0NnViTk5xUWx1TDVoWFR1ZnlhcTE0NXVN?=
 =?utf-8?B?WTJ5VmdzZGpIYjFZTzFGZzZqU1ZncnJZZDdrbUxsS3BSY2NHWEwvTEV0RmVN?=
 =?utf-8?Q?xTnUUb9VhcZYnKEnzDCWsWV6+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b11bec-e5ca-40f4-67d9-08db553a7489
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 11:49:35.7821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzaSpDyHoQyEJiPgr6NLTrjHKGE5gmqxqiVwqO8m/07+4jv4eXSo79+tf9YxvpotLn7KHzMypK299YcO/kFlPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7928

Hi Julien

On 15/05/2023 11:43, Julien Grall wrote:
>
>
> On 15/05/2023 11:30, Ayan Kumar Halder wrote:
>>> AFAICT, this approach would be incorrect because we wouldn't take 
>>> into account any restriction from the SMMU susbystem (it may support 
>>> less than what the processor support).
>>
>> By the restriction from SMMU subsystem, I think you mean 
>> p2m_restrict_ipa_bits().
>
> Yes.
>
>>
>> As I can see, p2m_restrict_ipa_bits() gets invoked much later than 
>> setup_virt_paging().
>
> I am afraid this is not correct. If you look at setup.c, you will 
> notice that iommu_setup() is called before setup_virt_paging(). There 
> is a comment on top of the former call explaining the ordering.

Yes, you are correct.


WRT to your comment

 >> You are correct that the line is not correct for Arm32. But my point 
was more for that fact you don't update p2m_ipa_bits based on the PA 
range selected.

Do you mean that I should update "p2m_ipa_bits" in setup_virt_paging() [ 
similar to what is now being done for CONFIG_ARM_64 ] ?


This will then override "p2m_ipa_bits"value set by p2m_restrict_ipa_bits().


But still it does not make sense to update "p2m_ipa_bits" in 
setup_virt_paging() for ARM_32 as

     /* Choose suitable "pa_range" according to the resulted 
"p2m_ipa_bits". */
     for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
     {
         if ( p2m_ipa_bits == pa_range_info[i].pabits )
         {
             pa_range = i;
break;
}
     }

p2m_ipa_bits will be same as pa_range_info[i].pabits.


- Ayan

>
> Cheers,
>

