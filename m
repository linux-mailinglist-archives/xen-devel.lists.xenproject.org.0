Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BC6A57681
	for <lists+xen-devel@lfdr.de>; Sat,  8 Mar 2025 01:04:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905443.1313267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqhec-0006Ek-O0; Sat, 08 Mar 2025 00:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905443.1313267; Sat, 08 Mar 2025 00:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqhec-0006CF-Jh; Sat, 08 Mar 2025 00:02:58 +0000
Received: by outflank-mailman (input) for mailman id 905443;
 Sat, 08 Mar 2025 00:02:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIyW=V3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqhea-0006C6-7R
 for xen-devel@lists.xenproject.org; Sat, 08 Mar 2025 00:02:56 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2407::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae703b1c-fbb0-11ef-9ab7-95dc52dad729;
 Sat, 08 Mar 2025 01:02:54 +0100 (CET)
Received: from SN6PR08CA0008.namprd08.prod.outlook.com (2603:10b6:805:66::21)
 by CYXPR12MB9319.namprd12.prod.outlook.com (2603:10b6:930:e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Sat, 8 Mar
 2025 00:02:48 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:805:66:cafe::2a) by SN6PR08CA0008.outlook.office365.com
 (2603:10b6:805:66::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Sat,
 8 Mar 2025 00:02:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Sat, 8 Mar 2025 00:02:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 18:02:46 -0600
Received: from [172.20.156.222] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 7 Mar 2025 18:02:45 -0600
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
X-Inumbo-ID: ae703b1c-fbb0-11ef-9ab7-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAuPJpzDzrLwuN0HJ5jHg4VkDGt2Aj/OdoNvsfTCzfXsYeJxLBtC3g6AfLrqoTL6O1WojeLcX//jqDDY/K6g9u6mSnFde9sKR+CN5WVqWq/foFvfgNDTVMOe2EAen3gipZnG6NYihHaWyenDwCONDVz6lEjFv9QEc0/cmwnqYAC/wKjtvQ8JwkqzfUN8GL8AByYnoPJrjDO60EraWdj49yS95iIaqdyXMq8DlEb8/g7Qj5w1a+wWyk7ekV7Qu7wK3sPzXgrP7i5uPUdB+tx0kMNl+ypjFpqUrh2s1tLfRGSm+839K2E8GCZ9Wp4C66OEPMjpkAieANvEEXhxcBmgQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eX50daKY+BRsgMCRJLObWH3OKvN0RGH5d7wAZjKpA24=;
 b=Qixis5eidOysaDylDUw0yfw4aSSNcylx8d4v2wrNOMVRdSqwUXwYV4k1qu5v4mMd/Yp2nkipdoimoD+ykkaic6Btcsf3pidDORFBfZHI/FlLXOi+/I3Fud3co/GEjJbnrGGTv3142F9o7s5s+LR4dwD8FzfQE7pAShGlSUHnrC2g9zmzPmqnOnDB/feIHKfC7lifWg/nMHpkJAIvPIsaFUyaHn1WQB+7BpQoO4PkPuG1HR6j4zUisrhW/1N2LIWUeZuGdT9w+jULfqxxUzVsAoqNVRx5LWeloIJCl7Hoy8Y1ZUM+s2ilwf0O4V2sHqOsHLmR1ItSznD8/vZNa2gwLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eX50daKY+BRsgMCRJLObWH3OKvN0RGH5d7wAZjKpA24=;
 b=SUDxeRu67ucSt20j5iFD5ESLhFpTFnWRbN1UbLtgJIDr7qNagca3uejRmBccuUnPyphA39i0uHukU6YdP6kgpfA7VggMIxQVAkE5gmlgdfze6QKw/SSdRd0Ilxw6yYQ0z/w/zEqC+tXlAlWYhnVI2dY/B8ks84qx/YfhR9zusag=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Content-Type: multipart/mixed;
	boundary="------------iyDybqn8S8ILnHMucJG0OJf1"
Message-ID: <09103c2b-a7c0-44d5-8eb5-2d0fcb01c26e@amd.com>
Date: Fri, 7 Mar 2025 19:02:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/23] xen/arm: Add capabilities to dom0less
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-6-jason.andryuk@amd.com>
 <254e38d3-ebc2-4044-9d0f-9be9f652c46c@xen.org>
 <92eca43f-1dc8-4eec-a124-e715d118ab03@amd.com>
 <01df1e44-a2cb-4e93-8b9d-99aca914db68@xen.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <01df1e44-a2cb-4e93-8b9d-99aca914db68@xen.org>
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|CYXPR12MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b7899f-e334-4b4e-d6e3-08dd5dd48f0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|4053099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFZIanNWUjk0MFpjZEFQMHhqNVhhZ0pPckpqT1ZGQU5OUGtwRndNb3VWWmRW?=
 =?utf-8?B?MXZKczVHM3NDRGo1dDdDK1FUNGFMR09lQXFJMklscVJ5SDY1VitKQ0tZSldx?=
 =?utf-8?B?WVpPS0Jqd2dTKzFWVUxpL1lUb3l0djVkUjdCTWV2WUZkOEdsRWVZdGNGaFRJ?=
 =?utf-8?B?ZVViNldsSUNVZHl2bi9vN2RoWnJVZWkvbHFhelYralFHVWI5aFhNR0hOZG5u?=
 =?utf-8?B?NjFaR2pOZ0t4K1J0WE1yVzRQaWpWZWEyeFB1QTJEVE5GYUsrTkVlcWxPUXEw?=
 =?utf-8?B?SUh0bUlPTEdyZW5laE4vRzk0RS9NeG9Ka1hGcHhCTlpzMFV6U01Ca3dZUmF0?=
 =?utf-8?B?TzI0b2JGak83UUViY3VyeG1tcXJ6N2pOYmxQUktTWEw3ak5oTm96M1g2TTVt?=
 =?utf-8?B?dTA0S3ZKbk8vTkpNOGdXZFRCQVdVcXpjNjd5blZWcklsTG5heE5sV0luLzRh?=
 =?utf-8?B?V3lTdHo0OWtqWlg3bWV6dy80QUdWL2dSNGVJTEI5Yzc2dCtnV1NZWFNiaGdi?=
 =?utf-8?B?bjZOc0RWRVVWbFNWTStPWk5jWDZCbXJ4RVc5Rkp2bldXWUwvL1hBYWJDM1ZL?=
 =?utf-8?B?bTJ2NzV4cmgyS3c1ZUhVVm0vcE9nRU83R2R4UlNyQzI4NFFTOWdGcjZwY0dC?=
 =?utf-8?B?TDRKTFhHUHUrdXF1R0hodkJZVHNTYUNXcWpScWppLzZrS3YyWmcxSXdyYXB1?=
 =?utf-8?B?TXdPTmoxaXA2MzlsK0NKMEZVUTVKaG1nZThBM3BPQmlsb0hldlVCYTAvajRD?=
 =?utf-8?B?YWVFc1l0bXpNOFUvZzFndXNMNjl4V2RDcGNpVFZhaEloTDNGeXdwUVYxcmhu?=
 =?utf-8?B?QmtlY3c4NUlFZDhNUkpza1dLSFhWbnJ1UzNLSmVJOVQ3NUVtMXhXUk0xRVhK?=
 =?utf-8?B?MURyTEs4dEFCRGlmS0V5Mk5KYkt3Qmw3dFVwaE52T2ZDUGdMN0hIc2VNb0V0?=
 =?utf-8?B?WmcwN3BnMnFCdzRvenMxRElOR2EzUHlxNGl1U3c0YUhNdk1LVit6VjY3Mjd4?=
 =?utf-8?B?dTZSUnVWbmorRDNPNmdGSmoyVi83ckF6ZHcwVVdTMWI1VmM5cllRdVZQbFhy?=
 =?utf-8?B?c0M5b3BxRDZtUDMvZnVpWU92QjhPa1dIYnQ0aXpubHJJaGlHVzRidzJKYWtF?=
 =?utf-8?B?dkV4UzZTM0VQSDdhQUtYN3RKTUptWStzWTVnbE5lZGZFV2M0RlFkbGNBUm9h?=
 =?utf-8?B?Yy9Qd2l4NUw4MTdzelNmeVZkV1BMMmYrZDdSSEJ1WGJPd1MyWkxHdGRpc0Vy?=
 =?utf-8?B?S0VzRTlTck1pVjZDWTZzMm12ODl3OEhIQkdnNXcwWGx3L3BCdGZFbWU4VlRZ?=
 =?utf-8?B?QkN1TXNpOGZ1dUtWK0NwZlgrL29mVDEzMklNNVJvM3ovaFliTnJiUlRQUkU0?=
 =?utf-8?B?NHF0YjVQSUJNdXgxam1DQjlscTY0WkhQUlY3WTRxNXR0MTBDd0NLeHh2Lzdq?=
 =?utf-8?B?NWJ4N1UrYWxCMWRNNWVQN2hZTzl4a2Jmb2RPaC9xcy9NdWZvSzA2ZVA1eWRG?=
 =?utf-8?B?UzNTQ0tLS0Yybk1MemVSa0dhczZvelRwTVJsZ040SmlEKzRIUS9xLzRWOXdk?=
 =?utf-8?B?VTBSZGhmUS92LytraDlFUkVxRitpWnUwaWNxUlFoR1Y0LzFGRkhLNjcyblNh?=
 =?utf-8?B?LzRSM014NmhhYkdHNy9iWlJjWVhxVzJBQmxPTzlBKzhad0lSLzVPMk41REdH?=
 =?utf-8?B?c1NBTjd3LzcrSlFZc0xub0V1VWtiOFBSNUJhNlVCSCsyeDMvcXU4Y1hNNndZ?=
 =?utf-8?B?VkZuSVA5R0cyZVV6V3NZaWQ3K0t0S3AySFo2cklDVnZsZ01lMDEwNko2bGNp?=
 =?utf-8?B?eks4K2huZHBld2xlWFlkN1daSHdBUHF3K3JyOVdoNDEwSWNIcHRhc0RvbVgw?=
 =?utf-8?B?U0Z4K3hIdDBEV0VvT2R0Y29UVWNtaldTRE50d1VjMHdQbGw4aGRwNmRldGJu?=
 =?utf-8?B?Yk5qZFNOQkpPVXQ2QzRudU9RN2lyUEQ5UWpoeHlXaFZCODNvaEJSWEt5Z0dF?=
 =?utf-8?Q?j2dsICKUeM3tmGyoFsVwXwoolzCOms=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(4053099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2025 00:02:46.9843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b7899f-e334-4b4e-d6e3-08dd5dd48f0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9319

--------------iyDybqn8S8ILnHMucJG0OJf1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-03-07 16:21, Julien Grall wrote:
> Hi Jason,
> 
> On 07/03/2025 17:58, Jason Andryuk wrote:
>> On 2025-03-07 04:01, Julien Grall wrote:
>>> Hi,
>>>
>>> On 06/03/2025 22:03, Jason Andryuk wrote:
>>>> Add capabilities property to dom0less to allow building a
>>>> disaggregated system.
>>>>
>>>> Introduce bootfdt.h to contain these constants.
>>>>
>>>> When using the hardware or xenstore capabilities, adjust the grant and
>>>> event channel limits similar to dom0.
>>>  > > Also for the hardware domain, set directmap and iommu.  This 
>>> brings its
>>>> configuration in line with a dom0.
>>>
>>> Looking the device tree bindings, a user would be allowed to disable 
>>> "passthrough" or even "directmap". This means, we would never be able 
>>> to disable "directmap" for the hardware domain in the future with the 
>>> existing property (this is to avoid break backwards compatibility).
>>>
>>> Instead, I think we should check what the user provided and confirm 
>>> this is matching our expectation for an hardware domain.
>>  >
>>> That said, I am not entirely sure why we should force directmap for 
>>> the HW domain. We are starting from a clean slate, so I think it 
>>> would be better to have by default no directmap and imposing the 
>>> presence of an IOMMU in the system.
>>
>> Ok, it seems like directmap is not necessary.  It was helpful early on 
>> to get things booting, but I think it's no longer necessary after 
>> factoring out construct_hwdom().
>>
>> What exactly do you mean by imposing with respect to the iommu?  
>> Require one, or mirror the dom0 code and set it for the hwdom?
>>
>>      if ( iommu_enabled )
>>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> 
> I mean requires one. Without it, you would need to set directmap and I 
> don't think this should be allowed (at least for now) for the HW domain.
> 
>>
>>> Lastly, can you provide an example of what the hardware domain DT 
>>> node would looke like?
>>
>> I've attached a dump of /sys/firmware/fdt from hwdom.  (This is direct 
>> mapped).
> 
> Sorry if this was not clear, I am asking for the configuration you wrote 
> in the host DT for create the hardware domain. I am interested to know 
> which properties you set...

I've attached the u-boot fdt commands which generate the DT.  Hopefully 
that works for you.

>>
>>>> --- a/xen/arch/arm/dom0less-build.c
>>>> +++ b/xen/arch/arm/dom0less-build.c
>>>> @@ -12,6 +12,7 @@
>>>>   #include <xen/sizes.h>
>>>>   #include <xen/vmap.h>
>>>> +#include <public/bootfdt.h>
>>>>   #include <public/io/xs_wire.h>
>>>>   #include <asm/arm64/sve.h>
>>>> @@ -994,6 +995,34 @@ void __init create_domUs(void)
>>>>           if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>>>>               panic("No more domain IDs available\n");
>>>> +        if ( dt_property_read_u32(node, "capabilities", &val) )
>>>> +        {
>>>> +            if ( val & ~DOMAIN_CAPS_MASK )
>>>> +                panic("Invalid capabilities (%"PRIx32")\n", val);
>>>> +
>>>> +            if ( val & DOMAIN_CAPS_CONTROL )
>>>> +                flags |= CDF_privileged;
>>>> +
>>>> +            if ( val & DOMAIN_CAPS_HARDWARE )
>>>> +            {
>>>> +                if ( hardware_domain )
>>>> +                    panic("Only 1 hardware domain can be specified! 
>>>> (%pd)\n",
>>>> +                           hardware_domain);
>>>> +
>>>> +                d_cfg.max_grant_frames = gnttab_dom0_frames();
>>>> +                d_cfg.max_evtchn_port = -1;
>>>
>>> What about d_cfg.arch.nr_spis? Are we expecting the user to pass 
>>> "nr_spis"?
>>
>> Further down, when nr_spis isn't specified in the DT, it defaults to:
>>      d_cfg.arch.nr_spis = gic_number_lines() - 32;
> 
> Thanks. One further question, what if the user pass "nr_spis" for the HW 
> domain. Wouldn't this result to more issue further down the line?

I'm not familiar with ARM, so I'll to whatever is best.  I did put the 
capabilities first, thinking it would set defaults, and then later 
options could override them.

>>
>> Dom0 does:
>>      /*
>>       * Xen vGIC supports a maximum of 992 interrupt lines.
>>       * 32 are substracted to cover local IRQs.
>>       */
>>      dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 
>> 992) - 32;
>>      if ( gic_number_lines() > 992 )
>>          printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded. 
>> \n");
>>
>> So I think it's fine as-is?  I could add the min() and warning if you 
>> think it's necessary.
> 
> Regardless this discussion, I wonder why we didn't add the min(...) here 
> like for dom0 because we are using the same vGIC emulation. So the max 
> SPIs supported is the same...
> 
> What I am trying to understand is whether it is ok to allow the user to 
> select "nr_spis", "vpl011" & co if they are either not honored (like for 
> vpl011) or could introduce further issue (like for nr_spis as the HW 
> domain is supposed to have the same configuration as dom0).
> 
> I also don't think it is a good idea to silently ignore what the user 
> requested. So far, on Arm, we mainly decided to reject/panic early if 
> the setup is not correct.

Again, I'll do whatever is best.

Regards,
Jason
--------------iyDybqn8S8ILnHMucJG0OJf1
Content-Type: text/plain; charset="UTF-8"; name="boot.source"
Content-Disposition: attachment; filename="boot.source"
Content-Transfer-Encoding: base64

dGZ0cGIgMHg0MDQwMDAwMCBJbWFnZQp0ZnRwYiAweDQyMDAwMDAwIGRvbTAtcm9vdGZzLmNw
aW8uZ3oKdGZ0cGIgMHg0NUMwMDAwMCBJbWFnZQp0ZnRwYiAweDQ3ODAwMDAwIGluaXRyZAp0
ZnRwYiAweDQ3QTAwMDAwIEltYWdlCnRmdHBiIDB4NDk2MDAwMDAgZG9tVS1yb290ZnMuY3Bp
by5negp0ZnRwYiAweDREMjAwMDAwIHhlbgp0ZnRwYiAweDRENDAwMDAwIHZpcnQtZ2ljdjMu
ZHRiCmZkdCBhZGRyIDB4NEQ0MDAwMDAKZmR0IHJlc2l6ZSAxMDI0CmZkdCBzZXQgL2Nob3Nl
biBcI2FkZHJlc3MtY2VsbHMgPDB4Mj4KZmR0IHNldCAvY2hvc2VuIFwjc2l6ZS1jZWxscyA8
MHgyPgpmZHQgc2V0IC9jaG9zZW4geGVuLHhlbi1ib290YXJncyAiY29uc29sZT1kdHVhcnQg
ZHR1YXJ0PXNlcmlhbDAgICBib290c2NydWI9MCB2d2ZpPW5hdGl2ZSBzY2hlZD1udWxsIgpm
ZHQgbWtub2QgL2Nob3NlbiBkb21VMApmZHQgc2V0IC9jaG9zZW4vZG9tVTAgY29tcGF0aWJs
ZSAieGVuLGRvbWFpbiIKZmR0IHNldCAvY2hvc2VuL2RvbVUwIFwjYWRkcmVzcy1jZWxscyA8
MHgyPgpmZHQgc2V0IC9jaG9zZW4vZG9tVTAgXCNzaXplLWNlbGxzIDwweDI+CmZkdCBzZXQg
L2Nob3Nlbi9kb21VMCBtZW1vcnkgPDB4MCAweEFGMDAwID4KZmR0IHNldCAvY2hvc2VuL2Rv
bVUwIGNwdXMgPDE+CmZkdCBzZXQgL2Nob3Nlbi9kb21VMCB2cGwwMTEKZmR0IHNldCAvY2hv
c2VuL2RvbVUwIGNhcGFiaWxpdGllcyA8Nj4KZmR0IHNldCAvY2hvc2VuL2RvbVUwIHBhc3N0
aHJvdWdoICIiCmZkdCBta25vZCAvY2hvc2VuL2RvbVUwIG1vZHVsZUA0MDQwMDAwMApmZHQg
c2V0IC9jaG9zZW4vZG9tVTAvbW9kdWxlQDQwNDAwMDAwIGNvbXBhdGlibGUgICJtdWx0aWJv
b3Qsa2VybmVsIiAibXVsdGlib290LG1vZHVsZSIKZmR0IHNldCAvY2hvc2VuL2RvbVUwL21v
ZHVsZUA0MDQwMDAwMCByZWcgPDB4MCAweDQwNDAwMDAwIDB4MCAweDFBODAwMDAgPgpmZHQg
c2V0IC9jaG9zZW4vZG9tVTAvbW9kdWxlQDQwNDAwMDAwIGJvb3RhcmdzICJjb25zb2xlPWh2
YzAgY29uc29sZT10dHlBTUEwIGVhcmx5Y29uPXhlbiBlYXJseXByaW50az14ZW4gY2xrX2ln
bm9yZV91bnVzZWQiCmZkdCBta25vZCAvY2hvc2VuL2RvbVUwIG1vZHVsZUA0MjAwMDAwMApm
ZHQgc2V0IC9jaG9zZW4vZG9tVTAvbW9kdWxlQDQyMDAwMDAwIGNvbXBhdGlibGUgICJtdWx0
aWJvb3QscmFtZGlzayIgIm11bHRpYm9vdCxtb2R1bGUiCmZkdCBzZXQgL2Nob3Nlbi9kb21V
MC9tb2R1bGVANDIwMDAwMDAgcmVnIDwweDAgMHg0MjAwMDAwMCAweDAgMHgzQjJFRkI2ID4K
ZmR0IG1rbm9kIC9jaG9zZW4gZG9tVTEKZmR0IHNldCAvY2hvc2VuL2RvbVUxIGNvbXBhdGli
bGUgInhlbixkb21haW4iCmZkdCBzZXQgL2Nob3Nlbi9kb21VMSBcI2FkZHJlc3MtY2VsbHMg
PDB4Mj4KZmR0IHNldCAvY2hvc2VuL2RvbVUxIFwjc2l6ZS1jZWxscyA8MHgyPgpmZHQgc2V0
IC9jaG9zZW4vZG9tVTEgbWVtb3J5IDwweDAgMHg2NDAwMCA+CmZkdCBzZXQgL2Nob3Nlbi9k
b21VMSBjcHVzIDwyPgpmZHQgc2V0IC9jaG9zZW4vZG9tVTEgdnBsMDExCmZkdCBzZXQgL2No
b3Nlbi9kb21VMSB4ZW4sZW5oYW5jZWQgImVuYWJsZWQiCmZkdCBzZXQgL2Nob3Nlbi9kb21V
MSBjYXBhYmlsaXRpZXMgPDA+CmZkdCBta25vZCAvY2hvc2VuL2RvbVUxIG1vZHVsZUA0NUMw
MDAwMApmZHQgc2V0IC9jaG9zZW4vZG9tVTEvbW9kdWxlQDQ1QzAwMDAwIGNvbXBhdGlibGUg
ICJtdWx0aWJvb3Qsa2VybmVsIiAibXVsdGlib290LG1vZHVsZSIKZmR0IHNldCAvY2hvc2Vu
L2RvbVUxL21vZHVsZUA0NUMwMDAwMCByZWcgPDB4MCAweDQ1QzAwMDAwIDB4MCAweDFBODAw
MDAgPgpmZHQgc2V0IC9jaG9zZW4vZG9tVTEvbW9kdWxlQDQ1QzAwMDAwIGJvb3RhcmdzICJj
b25zb2xlPXR0eUFNQTAiCmZkdCBta25vZCAvY2hvc2VuL2RvbVUxIG1vZHVsZUA0NzgwMDAw
MApmZHQgc2V0IC9jaG9zZW4vZG9tVTEvbW9kdWxlQDQ3ODAwMDAwIGNvbXBhdGlibGUgICJt
dWx0aWJvb3QscmFtZGlzayIgIm11bHRpYm9vdCxtb2R1bGUiCmZkdCBzZXQgL2Nob3Nlbi9k
b21VMS9tb2R1bGVANDc4MDAwMDAgcmVnIDwweDAgMHg0NzgwMDAwMCAweDAgMHgxNTEyMDUg
PgpmZHQgbWtub2QgL2Nob3NlbiBkb21VMgpmZHQgc2V0IC9jaG9zZW4vZG9tVTIgY29tcGF0
aWJsZSAieGVuLGRvbWFpbiIKZmR0IHNldCAvY2hvc2VuL2RvbVUyIFwjYWRkcmVzcy1jZWxs
cyA8MHgyPgpmZHQgc2V0IC9jaG9zZW4vZG9tVTIgXCNzaXplLWNlbGxzIDwweDI+CmZkdCBz
ZXQgL2Nob3Nlbi9kb21VMiBtZW1vcnkgPDB4MCAweEFGMDAwID4KZmR0IHNldCAvY2hvc2Vu
L2RvbVUyIGNwdXMgPDE+CmZkdCBzZXQgL2Nob3Nlbi9kb21VMiB2cGwwMTEKZmR0IHNldCAv
Y2hvc2VuL2RvbVUyIHhlbixlbmhhbmNlZCAiZW5hYmxlZCIKZmR0IHNldCAvY2hvc2VuL2Rv
bVUyIGNhcGFiaWxpdGllcyA8MT4KZmR0IG1rbm9kIC9jaG9zZW4vZG9tVTIgbW9kdWxlQDQ3
QTAwMDAwCmZkdCBzZXQgL2Nob3Nlbi9kb21VMi9tb2R1bGVANDdBMDAwMDAgY29tcGF0aWJs
ZSAgIm11bHRpYm9vdCxrZXJuZWwiICJtdWx0aWJvb3QsbW9kdWxlIgpmZHQgc2V0IC9jaG9z
ZW4vZG9tVTIvbW9kdWxlQDQ3QTAwMDAwIHJlZyA8MHgwIDB4NDdBMDAwMDAgMHgwIDB4MUE4
MDAwMCA+CmZkdCBzZXQgL2Nob3Nlbi9kb21VMi9tb2R1bGVANDdBMDAwMDAgYm9vdGFyZ3Mg
ImNvbnNvbGU9dHR5QU1BMCIKZmR0IG1rbm9kIC9jaG9zZW4vZG9tVTIgbW9kdWxlQDQ5NjAw
MDAwCmZkdCBzZXQgL2Nob3Nlbi9kb21VMi9tb2R1bGVANDk2MDAwMDAgY29tcGF0aWJsZSAg
Im11bHRpYm9vdCxyYW1kaXNrIiAibXVsdGlib290LG1vZHVsZSIKZmR0IHNldCAvY2hvc2Vu
L2RvbVUyL21vZHVsZUA0OTYwMDAwMCByZWcgPDB4MCAweDQ5NjAwMDAwIDB4MCAweDNCMkYx
ODIgPgpzZXRlbnYgZmR0X2hpZ2ggMHhmZmZmZmZmZmZmZmZmZmZmCmJvb3RpIDB4NEQyMDAw
MDAgLSAweDRENDAwMDAwCg==

--------------iyDybqn8S8ILnHMucJG0OJf1--

