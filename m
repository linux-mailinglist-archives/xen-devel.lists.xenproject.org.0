Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 232AC5E5EE5
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 11:49:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410063.653049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obIpO-0007dG-03; Thu, 22 Sep 2022 09:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410063.653049; Thu, 22 Sep 2022 09:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obIpN-0007ar-Sj; Thu, 22 Sep 2022 09:49:05 +0000
Received: by outflank-mailman (input) for mailman id 410063;
 Thu, 22 Sep 2022 09:49:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbTr=ZZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1obIpM-0007al-UU
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 09:49:04 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9315948-3a5b-11ed-9647-05401a9f4f97;
 Thu, 22 Sep 2022 11:49:02 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 09:48:59 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5654.019; Thu, 22 Sep 2022
 09:48:58 +0000
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
X-Inumbo-ID: c9315948-3a5b-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMBIw5BDxQWPq4FucLTcjG2J66qUBVcL3b6+cyDC/LvxwF2cy053F8zWY6QncPENTruzJZzsw1QkoydR4I/CQKJd0/DjGI7vVH7qUBI/kfQR0ACWiRGiofGXHRvt9s7VcHu5YBrzU4TB7rdChedxoqCHC8OxxATZpQk0W6ubJFnJDlvwKHIjRHmGCGpqSXz/HngelGNPuEtMYR/Rj8Gyy0IjP2YHF2MwwXE9B5JkaC8kJf02KEZQLruRkJs4OrssUUb90SBqmZr7BmVZv+f+hvtLkGnoE88S/TRiFR1gHHq8B3P1jmsbQKd5OK38EkgB4frys7MPmx9QhAaasaIqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wW5M5FQbI2JEbOjFtRzhDqx08LEuavkzzBCA1+dCRPU=;
 b=i4ihtD+QlNJQDWZWR3j73T0GtFId/bTM9yI3zaCUfMwKudm+txrWK89Vmm0ufuwTS5QQw28LBtOljPQj+MJ5S5wwuzzkfEge/+86O7Zvu5yDCeMXocrO+fyfiA6BoebmRZRJatum6BoLGsLvT+sU/dRvgN3BdAKiKn7c5Z+hMCf9YqZ8WcZ4wQAA0CLezdlMxdJFaSef/vR9wo7zk9YX4zoBgsd84DztKdlZCgedx79/eUdLXQ7OlPWPhOdjsDuLMCwZ6L4ANmAhXFps9Oc2sqE4PkIjge4TY8AtNr4H5g98hVe/y9Lmbq7oHhCPxqZejDrgM9JAvclE5i6QVtjO4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wW5M5FQbI2JEbOjFtRzhDqx08LEuavkzzBCA1+dCRPU=;
 b=GGvKlv09bBbeDhMTQ4A9fqGWyzMFmNjk6f6qYBsEYvF5sOQRs//O215k+oAVuoJWCdy+emqZ4OXVRxu+sD3OXMMlsEVKL5Qqhu6dt2EI/xsKswKN06GfblJS1vS58bSbwRrlmAgfeReynv73bz1LUhZBtI9BWil1ZYDPzVRsBMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <77218c19-0aeb-a0ca-fdb9-072a498542e6@amd.com>
Date: Thu, 22 Sep 2022 10:48:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
Subject: "IOMMU modes of operation" - meeting notes
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0065.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::16) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MN2PR12MB4208:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb64222-ef54-4154-77e6-08da9c7fabf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2TBGKXXNgNxsFWh03N/jyCMGsBFE++l3EsMYthS5E4aHbSl9tK3GXf5cURzY8uv9SN3PrvrLkvO7/X890x85MKthMLd2BXUUSHmhdO2Oi/idAtyeMiQ9NnykhaxjyH3a9xZyaxQ2uZS21+KA49KJ3X+uid8UYKvv7r1yE4KaItmKY/6B2EWcqQvsKvt2BBhz9k2ZQtHijUmWSm7mc9aJEREpOTa1BX0CiZcj2S5+iezGQ18aeXn/Ro2HQ6wOH3j2EbPTTGj99rbIsK3QvkcgsvcWoAiIVapGrzGP20X7ASUi++sMfFntp9z5KmjGmVUg4VSrJalAX94qM0EqHZZS2hMDYl86ouPoWoqwiMeeRVG5BJt5vCAZE507ODLwKMVVL5AAsXKHoEebdragnB/zdLgC2LPjvwmz3n7Aj4X6Cdde6EXwWFXnbDUjUc+bbZKjjUEHdhVmDMwxaHywKBQ39Qwi3MJg4gTtIJc/PR47DsC1IFu1IMuG1QjF6M6qbmHKHf+Ay0hRKVU9YBe+9oKndx5w/EUGfTgS51XUttsn9TMefjkYaEoagGBCzl9v3AzTK+SRTJalq6XlNEj9xmv9fBwEBgIenDGbtjaPAMIV0uoTdzDf+QM/zUeWJI+N8EgunGvQdfAZMgZ+sPzNTK5qpHAN/sJjaw9zFhz8OtWI5Qq24ObyF6SbsqATFrLGVhQSgoS/Ulr61JUcDnkF9257UyehV4AQ9MZYcWUh+cAsAwzsS7WFFIlE5WhUlXloe9cxDKEHAB5BpeN+1SaQNDRd0gwf+EFtBqc+DkQSTcNFpR6qldq7gwj/Yrr5kQUROyVQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199015)(6506007)(316002)(66946007)(66476007)(41300700001)(6916009)(26005)(2616005)(6512007)(6666004)(36756003)(8676002)(66556008)(186003)(2906002)(5660300002)(38100700002)(31696002)(8936002)(31686004)(478600001)(6486002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmJqUmtYc1N4QnBlMDBBVmpHOGxXWVNsUG15VmRZeElvelRKYTdQU1JCbmRm?=
 =?utf-8?B?WGtJWlRkSllPR3o5SzF2YnY2UWZCbUtNOThCOXBkbFZRenZHdldETFNsbEVt?=
 =?utf-8?B?QWIwMVEzMllTV0hlaTB2SWdWQ3NacnAyMkhCcTVPYXFKSExxZWZuNldna1dq?=
 =?utf-8?B?V3czK201RjhUTGdnQ04vU01OYTBYYWdQVXk3L0w2L0xvZVJvMVdXK1RTeDRD?=
 =?utf-8?B?bGVzVHBWRWl6cWJjV25oNXZoMHlGZGtCRklVVmxsNGpIZVk2dG9qcGpyWmVD?=
 =?utf-8?B?VGFWcklyby9ZUXo2Q09LazRhakYreHo5bUlRSENwRnhLN1dUekV3VVZTVUZU?=
 =?utf-8?B?WHkxRHZGRmQwK2tudGtWd21aM1RiaEFMUjhvMGJMQ3UwdFFVYU9xM2Y5ZmVT?=
 =?utf-8?B?TjI1cjZSeFl4TWRMTDdMcHUzU2pzUGZKSHl1cGtZclpyd2hOMjF0ZnpIRS9V?=
 =?utf-8?B?clJHLytxSFpJU0Q3Uzk3Zkh3WkZhME9qaU9CRWIrbVNsdmxpZ0lwV3l1NGRl?=
 =?utf-8?B?ektvVENVamtEMkJyQ25lWnNwMExkQWt4NFhLL0J1UklkeEFTWmZmVGxNMVpU?=
 =?utf-8?B?SHRCZkg1YlQwY21BVEdhemhoT3JzZ3ZoWjZlT05HSkREbXBaOVlWdjBja2xE?=
 =?utf-8?B?bGJlV0RyNGRqemdPMGVEUG5Jd3dTTTRXeGI3N3M3eloraitNTHdPWW54VG9p?=
 =?utf-8?B?NVloay85enRIQXlQQlJWUmIwVzdneTBSbUJJWkJUWTAzSE1SdUxNTWVBME9G?=
 =?utf-8?B?Tlh5VWRrTWFnVDh1N1pFZGpONlpSMUdvL0VYbWd1N3dUYVF2d2ZEYmtrdU10?=
 =?utf-8?B?THg2RDE3V3p6ZDBWRWV3NlRWaC93VG1GY2I4MExpYXE3cElBUDJ6MjgvS0ZD?=
 =?utf-8?B?ZTlSc241WXB5NllheW9jbk9iaVlRMW0zUmlsU0V2MHBKVmJ4Zmo3ME5HMGs2?=
 =?utf-8?B?VjZ2T1BNLzVSbnNFNjhyb0ZUNGdkVWl2NVRieThwR1BZZE5VbEZTNUpmcVNk?=
 =?utf-8?B?SlQzSkpveGJ3UzdoMDl5alZ4NnBPODR2TTdIMmY3S2krR0dCT296UWlOelh5?=
 =?utf-8?B?TEdRYS9JS2M1YnRsNVk4VzM2SGg2Nm92R202ekFhZTFaQXdseXNWVkxBRWRX?=
 =?utf-8?B?TmxrRW5SV3E4UDRKZW96dlJjYzI0UDM3M0t6T1NzcVFRd2hEa29NbnBKMDNW?=
 =?utf-8?B?UVBvdGY5aTJhQk5na3ZUTG9KMkNlY2Nzb2lWTnRJbTRDSTRyeWRFRjdHNTVm?=
 =?utf-8?B?VnF3ZG9OMHljOU44Qm9QeDlqbHR4M1Z4MldMbWpxOUtOSE5xVVBSdStTTWsv?=
 =?utf-8?B?TDFZTmFYQ0kvTXlHSjh0a0NuSWNnTlE1WVJMdGpkQ05QNzZYSmxDOUZLVC9m?=
 =?utf-8?B?TTFId3lrVVlMczFCUEVSOHVkQytZVFFjRG96MmFTQ3gzenIrWjdCQUx3cysr?=
 =?utf-8?B?Q0VTSHA5eHFJV2FNUjNmNmV6MktLMGRtNGhxdkFZTGtyTmRlRjNaVVIrSit5?=
 =?utf-8?B?WW9iSWFlVEJMRmdtWitYV1pjUmcvL01oKzdlVDNBcVdvZ3hMNGdkUG4wV0xG?=
 =?utf-8?B?bXQ4ejNrdlpOL21HS21lUGRybXRQSlFOcDNoVElOMUdSWHEveUZrM2JIa2ha?=
 =?utf-8?B?azBaNnRpeG9LNmwrdzVtd0pKcmxtSjBTblQrWk1pSlI3VHNoZ2hKTUs4OUhk?=
 =?utf-8?B?YkxTeG52K1d3YUxkUGl4aHJVM0c0dCtWWG85QzAyS25xL29aYy9HWHp6T0dm?=
 =?utf-8?B?M2l6VTJNYWNJUkNTYUZaWnBvc1g5NFJ6RjRMS08rUE1TQ3MvUktLMVZvMUJX?=
 =?utf-8?B?L3hVQkFXZXdTLzBxQXkrM3lzZ1YwcGx4dG05MlZzUStRZmRGYzN5NzZjUExC?=
 =?utf-8?B?cnJqRldWalBZZ0hxOGRSZDhKc0xKaTVwUHVhb0F5NkRpZ0k1ZVRJQ2ZFM1RI?=
 =?utf-8?B?UmR5VFQ2eUk0WmdxUmVUdnU3cnRGQWlMUFJUT0dXeEJQbkhVOTg0OUphWG9w?=
 =?utf-8?B?elVTYkRNMUJpM1VwTlEvMURCZkx0T0szZjZPNVNiU2QrSnltQ3lLajFIOFk0?=
 =?utf-8?B?dGQzRGx6MWdHT2NjZVNHODBTaXpWTGt3a0dlbytxNnFqenVrZTFzemJENWlh?=
 =?utf-8?Q?+uQ0m0s+zTu0rXaH2uyiJaCvm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb64222-ef54-4154-77e6-08da9c7fabf5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 09:48:58.8616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DtzWtHFTSy+WTWDddgImUhhQomEoGNYdaVDY+5qAl4sGbSh19FQ5KqWSuXftp7fZ2xF21A3zM8yQFJIhOgcfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208

Hi All,

PFA the meeting notes as follows.

Kind regards,

Ayan

The way how IOMMU works is not best. Do we change it ? Means people 
using command line will be impacts.
On Inten, IOMMU does dma and interrupt translation. Can it be done 
independently. For passthrough we need dma translation. IRQ translation 
can be done different. Disagreement in community. We need to resolve the 
disagreement in command line option

Iommu=off “ in CMD means everything off

iommu_remap=off means IRQ remapping off and DMA remapping is on

Do we need to an option to do IRQ mapping and not DMA mapping.

Bertrand - Is the option applicable to both X86 and Arm applicable ?

Jan - Yes, this should impact all architecture.

Bertrand - Linux option “”iommu=off” do ?

Jan - It varies. Sometime means interrupt remapping is ON. On Arm, IRQ 
remapping differs from X86. There is no remapping register.

Rahul - In Arm, IRQ remapping is done by mapping one door bell register. 
Then everything is done by hw.

Bertrand - This applies to only MSI. Interupt remapping has no meaning 
on Arm.

Jan - In such an environment, this is an x86 specific option that irq 
remapping is on.

Bertrand - The interrupt remapping problem does not exist on Arm. So 
keep the current option and have the necessary feature for x86.

Jan - Split option have no meaning. So IRQ off and DMA off applies only 
on X86.  The split option (irc remapping) should be unavailable for Arm.
Have people using X86 for chasing it ?

XXX - iommu = off should switch off everything (DMA + IRQ). Then have 
specific option.

Jan - IRQ on and DMA off is useful. To boot with extra requirement. 
There is a confusion whether irq remapping is off or dma remapping is off.
On passthrough system you don’t need iommu (except for irq remapping). 
The address space is 1-1 mapping. Intrusive / Extrusive mode.

Jan - PV Dom0 case, this is applicable as translation is done

Roger - No need to discuss more.

Jan - We need to clear of a semantic change when “iommu=off”.
We should change variable from iommu_enable to iommu_dma_map and 
iommu_entry_map.

Roger - No need for a separate top level irq remapping.

Jan - iommu=dma_remap=off

Roger - Global option off and irq option is on.

iommu=off will make dma and irc off

Iommu=dma_remap=off, irq_remap=on  (We will introduce the split option)

Jan - iommu is a top level option with many sub options. IRQ remapping 
option will not be exposed to Arm. DMA_remap will be used in the 
everyone. “iommu=enabled” is ambiguous.

Bertrand - RISCV is similar to Arm. So this should be x86 specific iommu 
option.

Jan - The common code should explicitly specify dma remapping or irq 
remapping . The other architecture should say whether dma remapping or 
irq remapping is apllicable,

Bertrand - This change will impact Arm code,

Jan - If the severe code changes in Arm, then we will reconsider.

Jurgen - Common code should be architecture agnostic.

XXX - We could add defines in x86 code.

Jurgen/Jan - In common code, we should be very explicit. No ambiguous 
check anywhere.

Bertrand - iommu.c should be renamed to iommu_dma.c ??

Jan - We could do that, there is no bad behaviour when keeping the name. 
We will prevent irq mapping  is added in common code. However, the 
common variable should not be ambiguous.

Kind regards,

Ayan


