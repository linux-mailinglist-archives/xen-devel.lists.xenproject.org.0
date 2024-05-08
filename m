Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDDA8BF3D0
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 02:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718543.1121050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4VSX-0004JO-8S; Wed, 08 May 2024 00:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718543.1121050; Wed, 08 May 2024 00:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4VSX-0004H8-5I; Wed, 08 May 2024 00:47:01 +0000
Received: by outflank-mailman (input) for mailman id 718543;
 Wed, 08 May 2024 00:47:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/w98=ML=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s4VSW-0004H2-5x
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 00:47:00 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78d7785f-0cd4-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 02:46:58 +0200 (CEST)
Received: from MW4PR03CA0094.namprd03.prod.outlook.com (2603:10b6:303:b7::9)
 by IA0PR12MB8088.namprd12.prod.outlook.com (2603:10b6:208:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 00:46:53 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:b7:cafe::76) by MW4PR03CA0094.outlook.office365.com
 (2603:10b6:303:b7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.40 via Frontend
 Transport; Wed, 8 May 2024 00:46:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.0 via Frontend Transport; Wed, 8 May 2024 00:46:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 19:46:47 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 19:46:47 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 7 May 2024 19:46:45 -0500
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
X-Inumbo-ID: 78d7785f-0cd4-11ef-909c-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjkNqSJJI481/Vok0Ma6867BI7KDpI5RdwXpY5No07C98ZKE0DHjVgWFewDY5xt1IitNBhNWLdBMmZ6TokZz2YEGYERLdCmzl5coW9ElctjwFty7f9jhHu0RQEgvRCUeOBEdugg2kUfSUTiTyhyRblI9VchQmtopf5tnb48x8brGrK6x9Yl/LOnYkmbgAZaStA8+2d2S32a4GR9hyZjXhrXarRsUiAQICmOiQcjkfVdgc3ZyZz+JTSZnXVr3sIau7Un583kMWidHTWtSg77spu5qVnWNjBVJ9+SXvi35wRgSNKyZDU076WjHW0bmRkNP7ysuhaco2fKrFejDd5B1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPxKK61GnhaYA1csjyQ7sWqoh+eoqf9tfHNpwuWk7jE=;
 b=Ze3YYwm3ruLNSDCTnryPlTxjCKIRFTpTuuQmoSqoK/OYKeAfi2OzkBNbsxxIXJ1BddOnHPHNgRstK79T/BswoSzl3Epx/tXJmixYeJlGzQjVB5Sgk7SjRAVvfzEjwsm75t8qyl6vofirKvfP8pfwmtAle5ta7HWWOwzdEjooEqfE9F8qGHFVQdcwr7bNI+y0spfbT2lP4bpiaR8l7jHelBwIO+sKXdSTSVJglBmapN+U9pGbo/M867qb654KJK5Le0KAu1/eaKFfXyUvgJtqzNtntZ2zX3G+YJhK0QFuh6U0fO0ex4JQdBFJmfYnoY/M3d7mVo0RpGHUO/yITyacSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPxKK61GnhaYA1csjyQ7sWqoh+eoqf9tfHNpwuWk7jE=;
 b=YTrtFdexO53RhjwGXjbGfm7jWvRbUCgSS1Icfjfhr+CCTa6trseq5BrkZ8bR6AYG1Xhc2mWgOfw22b09GUFAsETxjhDnrrs1X+VNsjL89wYDZXxLIHYC1mxkhNHUSzDBxNARKCos9Ed+uoML7dpntk5Ypktof1YHwQknvf9ae4A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ad3af234-3b4b-48fe-9628-f205d8c07eb5@amd.com>
Date: Wed, 8 May 2024 08:46:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/15] tools/libs/light: Increase nr_spi to 160
To: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>
CC: <xen-devel@lists.xenproject.org>, Vikram Garhwal <fnu.vikram@xilinx.com>,
	Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-6-xin.wang2@amd.com>
 <334eb040-234f-4492-9006-9faadfe28c59@perard>
 <71fc7673-e968-487d-8478-1c7aabef708b@amd.com>
 <bca3098b-4f0b-48e1-8e21-51c66c63e4f3@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <bca3098b-4f0b-48e1-8e21-51c66c63e4f3@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|IA0PR12MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bee10df-ce70-43fd-3de4-08dc6ef8595f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHNCOTA1bGsyM29MUzI2T2haMDk1aXZFRDVSajhScFBDeUtXQlArSm5OMlh5?=
 =?utf-8?B?blptcFA2amM0b3Z0TENZOUF3MFI0Y2J3WUd0czdhd29CeVdseWs3U2tPdTJo?=
 =?utf-8?B?RWgrZGo5YlhBWDdYNkJzL0NrUkVuM1RCTHNwcjk2ZW1neXFiQWNGV2N3Q0p0?=
 =?utf-8?B?VHBPakFCdHpLTVhvcnFjVEtxU093ekltaThGQUZ5NlhzWjdZSjA0bkpsTGkr?=
 =?utf-8?B?cDhLaDRHa3lRMmpSWHJrVWNUY24vaHNOVGtMQVhRLzlQeHRBR3VYU25MTGFI?=
 =?utf-8?B?N2JPSmExOVVFVmJpYy96cEoreGRnQlo4ZTM4RGw4d1pBWEIzSXVTRW9ieWdo?=
 =?utf-8?B?MFZGaVA3bFNncWtDTlpRQTlBSC9ROGR4aVlpWUJCMk5zWjJzQ3lPRDNBZVZ0?=
 =?utf-8?B?VEk4cnZvK0Q0NWdsOHoybjF3M09pL2JoVzBlVEZ0ZnYxUEV0djExRTRvajVa?=
 =?utf-8?B?N2hXMkEvRDhWQzVyQ3FCZ1orQmZtckVBWUlNYTk4c3FZUjg4WDR3WUxKNE5V?=
 =?utf-8?B?NmpUeTFXYWJ2eDlXRVhMZk9wdVZHd0dBcU5JTXdFTGlHMXJsa05vZnMzd0Vx?=
 =?utf-8?B?Z3VERGFRenRJVzl1SzNPNmszc3M3N3B0OEFoL05vbVJILzd4Z2YyMld3Qnhy?=
 =?utf-8?B?ZFR4SU03ajN4QWtlOWlMN0ZJaUN0dVArZ0RuZDF0UzBSU1hBbjlDSFpDSjVY?=
 =?utf-8?B?VDE2VEY1MWVTLzJzRW5aSlF2Wk5YUmxDVUFGSEFEUUo0T3lNSkVaajREdkxD?=
 =?utf-8?B?Z3ZiK3dtT2gvWjBSM3BjQXdpN29CdVFDcURKS0hjYXJoVWVPT1lLUDlSeTFo?=
 =?utf-8?B?bnFZWEFpTzN0Kzd3ZEMrTlFkTjBDcDU5MWp3QkR3WXVQSUlNN3YvNUxFVFhu?=
 =?utf-8?B?eVFGSXB4bU53K0lESUpQWm1zM3o4TVc5T05ORXh2ZTRFTjMvMDZyZHBGa3JJ?=
 =?utf-8?B?b3NnT05MS2RoUVkyQVBUTzhGby9NTzk1RmpaMkNMbzJrR3FYQWVDOVhGdnRB?=
 =?utf-8?B?Z3dOVHVoZzlva1pReVVyUjJuNHA2VXZScmVHMzk1aktZbXM1SkdzTEpPL3pH?=
 =?utf-8?B?Mnp2b3ZnMGhlNW9sMC9LaWpoZjhHUi9UOHAxZXIwQ0p0VDg1S3dzR1NrakxJ?=
 =?utf-8?B?aWs3NzN2dHZHaVZHenkvaTJsdWZBVU1mb2EwUDN1b2h6c2xjN1BmNnpTRlFo?=
 =?utf-8?B?YlVQcUNtWVZCSFFtTXluV3I5VWlvVlRwWXFRakdQRy9hbmhENFczWks5QkxZ?=
 =?utf-8?B?ZWNsRVUvb3oxSnRZbHh4U3dqNTVxRjlxYmtnVTZUbE5tUnFOaCs4UFg4djRN?=
 =?utf-8?B?Z20yVHpNb0VrTGx4RGp6dUgvQ3RLcEQ2MG1TVnJqZDMzNzV4N0tjOCs5cFZt?=
 =?utf-8?B?c29yZnZlL1V5d0U2d2F1UmpTRXlWdDN5V0JnYk05SVRUK1NtbHlzdTJpOUVy?=
 =?utf-8?B?ZkhYMjB1M1VNdEtqNW1LM1pBRXA5cnN6dFRTZk5UK0VtVWlEOFdtWlY3eW92?=
 =?utf-8?B?d0J4c21lWmZOaGFYVDFRdG9WSTlVN21xMXdkVWRxVFY0eHNDTXFxRGNSVmJk?=
 =?utf-8?B?aVMxVWpxNmtZQ2doSEh6SGRwdm1PMGdyem5tYllzdkh3VGc5dFdJWitNd3Mw?=
 =?utf-8?B?UFZmU2lyQzFaVTkzbzh3MTJJUlFzQVlWanRxR1pXcDZrWlZ1TXJYQ295cnlT?=
 =?utf-8?B?NElVQUJCbTBqRjh2L01Uc1RHd0E0Q0d0aG5OS0JaTUoxUE1sc2tZMmhpa2wv?=
 =?utf-8?B?QkdPeis4cHpIN25mTHUwOU11VDNWRFl5emMyL2E0eW5YL1J6elVwWlhuY3k3?=
 =?utf-8?B?dDU5MElBQTRWb09INGlPRHVwSVFFVzRMbGdMdVRQcldiWVp3elgzRmhueUpD?=
 =?utf-8?Q?iNAW+MTkPu5Ek?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 00:46:50.8720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bee10df-ce70-43fd-3de4-08dc6ef8595f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8088

Hi Julien,

On 5/7/2024 10:35 PM, Julien Grall wrote:
> Hi,
>
> On 06/05/2024 06:17, Henry Wang wrote:
>> On 5/1/2024 9:58 PM, Anthony PERARD wrote:
>>> On Wed, Apr 24, 2024 at 11:34:39AM +0800, Henry Wang wrote:
>>>> Increase number of spi to 160 i.e. gic_number_lines() for Xilinx 
>>>> ZynqMP - 32.
>>>> This was done to allocate and assign IRQs to a running domain.
>>>>
>>>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>>>> ---
>>>>   tools/libs/light/libxl_arm.c | 3 ++-
>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/tools/libs/light/libxl_arm.c 
>>>> b/tools/libs/light/libxl_arm.c
>>>> index dd5c9f4917..50dbd0f2a9 100644
>>>> --- a/tools/libs/light/libxl_arm.c
>>>> +++ b/tools/libs/light/libxl_arm.c
>>>> @@ -181,7 +181,8 @@ int libxl__arch_domain_prepare_config(libxl__gc 
>>>> *gc,
>>>>       LOG(DEBUG, "Configure the domain");
>>>> -    config->arch.nr_spis = nr_spis;
>>>> +    /* gic_number_lines() is 192 for Xilinx ZynqMP. min nr_spis = 
>>>> 192 - 32. */
>>>> +    config->arch.nr_spis = MAX(nr_spis, 160);
>>> Is there a way that that Xen or libxl could find out what the minimum
>>> number of SPI needs to be?
>>
>> I am afraid currently there is none.
>>
>>> Are we going to have to increase that minimum
>>> number every time a new platform comes along?
>>>
>>> It doesn't appear that libxl is using that `nr_spis` value and it is
>>> probably just given to Xen. So my guess is that Xen could simply take
>>> care of the minimum value, gic_number_lines() seems to be a Xen
>>> function.
>>
>> Xen will take care of the value of nr_spis for dom0 in create_dom0()
>> dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 
>> 32;
>> and also for dom0less domUs in create_domUs().
>>
>> However, it looks like Xen will not take care of the mininum value 
>> for libxl guests, the value from config->arch.nr_spis in guest config 
>> file will be directly passed to the domain_vgic_init() function from 
>> arch_domain_create().
>>
>> I agree with you that we shouldn't just bump the number everytime 
>> when we have a new platform. Therefore, would it be a good idea to 
>> move the logic in this patch to arch_sanitise_domain_config()?
>
> Xen domains are supposed to be platform agnostics and therefore the 
> numbers of SPIs should not be based on the HW.
>
> Furthermore, with your proposal we would end up to allocate data 
> structure for N SPIs when a domain may never needs any SPIs (such as 
> if passthrough is not in-use). This is more likely for domain created 
> by the toolstack than from Xen directly.

Agreed on both comments.

> Instead, we should introduce a new XL configuration to let the user 
> decide the number of SPIs. I would suggest to name "nr_spis" to match 
> the DT bindings.

Sure, I will introduce a new xl config for this to replace this patch. 
Thank you for the suggestion.

Kind regards,
Henry

>
> Cheers,
>


