Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98574B167E8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 22:58:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064467.1430071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhDrW-0007zP-BD; Wed, 30 Jul 2025 20:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064467.1430071; Wed, 30 Jul 2025 20:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhDrW-0007wF-27; Wed, 30 Jul 2025 20:57:22 +0000
Received: by outflank-mailman (input) for mailman id 1064467;
 Wed, 30 Jul 2025 20:57:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dkTI=2L=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uhDrU-0007w9-C8
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 20:57:20 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2009::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4ad718a-6d87-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 22:57:14 +0200 (CEST)
Received: from DM6PR18CA0005.namprd18.prod.outlook.com (2603:10b6:5:15b::18)
 by MW4PR12MB7261.namprd12.prod.outlook.com (2603:10b6:303:229::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Wed, 30 Jul
 2025 20:57:10 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::f6) by DM6PR18CA0005.outlook.office365.com
 (2603:10b6:5:15b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.12 via Frontend Transport; Wed,
 30 Jul 2025 20:57:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 20:57:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 15:57:06 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 15:57:06 -0500
Received: from [192.168.18.248] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Jul 2025 15:57:05 -0500
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
X-Inumbo-ID: c4ad718a-6d87-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nir7/vbvBF7A4HmhJpWyq6gZ/x3n74FaWoTfaKcTPQ3pyxdeH6nJg3TGooTynw0TCVv9PTucMff/l5/BVpAR3+oy8kKNHEUCM95zhEBaKyQvAeJr2D6NwrIj9kP6RbHimrf8h7xeJy/E3KNPSsLGfkr52B+kkkSUch0X0fYnOY/qMjPI+L40i3PjVV/QdjDFyvwgqaf/XDr4qUlhA3Z7LxBGQJa7fuHhB4MFNGRRjdodI7TuSaYelbzDRv3DQX1Sw0dfwSmPEa3SGp6EfHkjnoeCwQotmeJDmdHj56DkT3pC2d9ycT6o9EB+BGBV+ILR24dMtfz0j/uaUK6XWI5jow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Fagxn8szJOyfMYrF0pmu2Boo7Gly27SwcHqBZTXsJY=;
 b=Vhpq9P0yW2WmthHVQakdILI6OL4uTAiwtJCH6IGB3ZWb4dzIrlkHia89CYBBv7KnXsEkCG7spVOUXtv7v5fr+lWjxu5qN9yO5xPWP4eS4WzSiUzQZmwoJebpbMoN/afNHWkVLC7BEkrcKwXu9pnwVUoMYLnRAubkbDP9NLKsoh3swICrTaCVFvv3HpQFMHB/YqsAMiHu4bqv/rz138O1w+Y/kG6X6tGbUyJVhGLKBKblzk3ruN6CcniVGTQS2RY79ctPoTehlUTFGVQXiRRzBopysDPc+oJWZueEXD5WPtARbVC3DasaoT4l6CITeMxS9YJRu7BC2Fm8rdMm+e94KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Fagxn8szJOyfMYrF0pmu2Boo7Gly27SwcHqBZTXsJY=;
 b=JEs4E8UCQJa0E9kWZ5eoDnX6Jr2LILT7BAFBaEwEq1M3GaD041gqWSfgAC1bgYQ4/uNf9Q1AZlomk4qQZzUhcpXpJWCvutrW8Hl5NASztvbQ8J2ItoXA67RDQvT1kGOcMpa4diMy7zgf1MdnhXVd3OkPmK8TUMW0Ip1qWTUV66M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6a1d04cb-2efa-4df2-80ae-f93240a49a08@amd.com>
Date: Wed, 30 Jul 2025 16:57:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/17] xen/xsm: Add XSM_HW_PRIV
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-2-jason.andryuk@amd.com>
 <348b7780-d1ad-4765-9eb6-5ad66e5ce2e6@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <348b7780-d1ad-4765-9eb6-5ad66e5ce2e6@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|MW4PR12MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: 201eff10-b6c1-4d0e-c734-08ddcfaba653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXV4NVhEUHdUV1d3UTJkbW96M2JpcEhQQjVPVnMycjlDYklvK2hDSHE4Umx0?=
 =?utf-8?B?RTdacmE0czBwRFRmdUtSZ1ByZExnL0lwYzlVQ1NraTBkNXkzaEtJVFhES05G?=
 =?utf-8?B?M004b3NyNXMwYUticm5Gd00wVW00ZkxFUkJxc0Zra0VBMVVMR3RRMXl6Vm9p?=
 =?utf-8?B?SU1MWVZ1K0tQUVJQU3JCR2ZpLzNwQzc5T25lcVJRNG51RHNXOGNCajA3bEdr?=
 =?utf-8?B?OWZrV1laeE5hWWFhZUR4RHZhcmMxbDhsNlp3OGhyZ2tza1hiMjhpdFZJUHl1?=
 =?utf-8?B?TjFLZVB5VVErZFRYYlJNV2RVWTlLK0xhdXl0eE9zZGxmTjVuVzVZTitFSkRm?=
 =?utf-8?B?T05JM2ZtQ2RibUoxbWZEdTZCV21hYmRSWmRoSHphNlFTanNFallUVjZxZ2dJ?=
 =?utf-8?B?QVhMRDJud3d2TzMvMG1lSU1QQ0RVUGtqc3FTSnhGOW5FZDc3TFU2TllzcjV1?=
 =?utf-8?B?TlJLNnV3ajFwSmpXU2RXbys0Y0J4aDVNVWN0eXh0d3RkSjMrZksxSWhDZkZR?=
 =?utf-8?B?bWo0YmJwMnI5T1VUeHhrODVnSEZTc3RZekw3bitOZms3U0xYKzBVWDlHT1ZO?=
 =?utf-8?B?a3UrdjJOVkh3Yk80R0hhK0d2aE9UNkpodDRNNE1RZkdTUjIweEt5V1k3V1VR?=
 =?utf-8?B?RkxzQTBCd095R2xSdWJGWnExbEhkOTlFOFFQZnBtSmRxYWVxODgrd1hDU2VZ?=
 =?utf-8?B?cGd1ZVRGVzhnUnl6bDBGVUpUaHR2MGpQRlVXSWdlaEFCSEJlQXJrTFA5NmJO?=
 =?utf-8?B?RDFnMWZDQ3dFK1BNV245VFRQWkVqSUFmOVBlM0h6VkV1RUx6OFRmYVFHTEIz?=
 =?utf-8?B?ZThaV3FUM3JqOUJUNzhmSENuUjNzR3lzNnBVYmRUdDJiY2NHRlNkWTBNMm1U?=
 =?utf-8?B?WjI3blFEZkozVjdZWVJQdGx4bThtTU1EaGN5MnlyMVdwaC9vcFJ0dVkwMS9n?=
 =?utf-8?B?RWlVeWM3M0lJamZCVTR1S0VUZVg2S3Jndkx2WkNEVmtFdllMZWRHNUl2QVFp?=
 =?utf-8?B?cVVPWVdoL1J0WmZIUytVbUpYdmlMQURYMVNhRzIxZEFZVmZuQWdIT1pXN3VB?=
 =?utf-8?B?TDFPWi9lRDZPc25Ta04xYmN2b2NoUnJZZElONWdRWC9wc3lxWDFveCt5VUEr?=
 =?utf-8?B?UXhlNkRmTG5mYThSOGJLc0tGcTErSkdKalZMMVFTNXBGVHgxeGFXMVJQR3N3?=
 =?utf-8?B?dkV3WHNmWmc0Z1dua1U0MDYwRWRtZStmamR4bk5oVWtxc2RvSFoyUERKMGpr?=
 =?utf-8?B?ZU1HYUsydS9Ca2lpTXhsUmlacHRHaW10K29lZGFMVmVTeExWdERXKzNHTFlT?=
 =?utf-8?B?c1JLalBHU1EwNVdibWpyWUxoc28vNkFZRjNjd1ZVS1V1N2JvV1FtblRQcGN5?=
 =?utf-8?B?ZkhHbUZTOUVqWlh3MjNlU3o0Tjd0bnhKVWZCRTVzcWJiSGtqSDR5OWVYUkY4?=
 =?utf-8?B?RUlKV0xiU3BycHlEODJCUjNnTXBYS1FEZW9aanlack9IdmpkOGVGcitsUENJ?=
 =?utf-8?B?dytxTDBwM25BRGZTZis2YzNPNk5OR3JyUmgxNDhUNDNCRkluSnpLMUtOSjZH?=
 =?utf-8?B?RGR1dlprMHdYQ3g2VW9lT1I1eFlHbnExNFdyMllaT1FxSWo2Sjl3TEJOejgw?=
 =?utf-8?B?TDNTRXh3UUR0ZXdJaHdsNHpraVhwcFZ5Y3o5N2d5T3NmSU5vOFJlZDZ2eGJJ?=
 =?utf-8?B?ZDk0TDNRRHNTQnVDbWZwbXNLUWZZS1B3VUhqNm5SaFRrdGNOZmZMUWtxcVNr?=
 =?utf-8?B?d0hkQVRadXY5MWFpWDBKM3FJdTYrc2FTRHMrUG5MUGtDRU03dGNnUmxua3pj?=
 =?utf-8?B?RXAzdnJxUHNCcExUTlBwMnlBM0VFTng4VGlDQ2NZOEtVSTVla0RqS1A3MzF5?=
 =?utf-8?B?SWI0Y2FMNXo5ZGs3WGhFL3FLMlRZbTlwdFltS3RyZkxqWUxtOWxwTDU1a2tZ?=
 =?utf-8?B?ZVRzQjVuLzlGK1hGZVk1cmVHRkFTaWM1QXJUSzY1ODRkZFI5ekFPR2crOGJC?=
 =?utf-8?B?SmIwVTVkdjZBMDhZaFg1UUllcGxlQlUyNzdONThwLzFjZks4ZnI5UkZDM2pt?=
 =?utf-8?Q?6D+Fal?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 20:57:09.2389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 201eff10-b6c1-4d0e-c734-08ddcfaba653
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7261

On 2025-07-30 05:28, Jan Beulich wrote:
> On 16.07.2025 23:14, Jason Andryuk wrote:
>> Xen includes disctinct concepts of a control domain (privileged) and a
>> hardware domain, but there is only a single XSM_PRIV check.  For dom0
>> this is not an issue as they are one and the same.
>>
>> With hyperlaunch and its build capabilities, a non-privileged hwdom and a
>> privileged control domain should be possible.  Today the hwdom fails the
>> XSM_PRIV checks for hardware-related hooks which it should be allowed
>> access to.
>>
>> Introduce XSM_HW_PRIV, and use it to mark many of the physdev_op and
>> platform_op.  The hwdom is allowed access for XSM_HW_PRIV.
>>
>> Make XSM_HW_PRIV a new privilege level that is exclusive to the hardware
>> domain
>>
>> A traditional dom0 will be both privileged and hardware domain, so it
>> continues to have all accesses.
>>
>> Why not XSM:Flask?  XSM:Flask is fine grain, and this aims to allow
>> coarse grain.  domUs are still domUs.  If capabilities are meant to be a
>> first class citizen, they should be usable by the default XSM policy.
> 
> Despite this added paragraph, my prior concern remains of this adding
> finer granularity than what may be desirable in a coarse-grained world.
> 
>> @@ -275,7 +279,7 @@ static XSM_INLINE int cf_check xsm_console_io(
>>       if ( cmd == CONSOLEIO_write )
>>           return xsm_default_action(XSM_HOOK, d, NULL);
>>   #endif
>> -    return xsm_default_action(XSM_PRIV, d, NULL);
>> +    return xsm_default_action(XSM_HW_PRIV, d, NULL);
>>   }
> 
> This change I'm uncertain about: Why would the control domain not be
> permitted to interact with the console? It may, in the end, be more
> important for it to have access than for hwdom.
> 
> And yes, there is the ->is_console check earlier on. But for the
> consideration here its presence ought to not matter. Or else the
> change itself is meaningless (e.g. if we assumed that both would have
> the flag set).

Linux uses the console hypercalls for xen_initial_domain(), which is 
hwdom.  This change was useful to get that working.  Looking again, 
is_console is not set on x86.

So setting is_console and leaving this as XSM_PRIV sounds reasonable to me.

Thanks for taking a look.

Regards,
Jason

