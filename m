Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA619E9F56
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 20:20:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851828.1265835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKjJ5-0003Ps-AN; Mon, 09 Dec 2024 19:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851828.1265835; Mon, 09 Dec 2024 19:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKjJ5-0003N9-7X; Mon, 09 Dec 2024 19:20:35 +0000
Received: by outflank-mailman (input) for mailman id 851828;
 Mon, 09 Dec 2024 19:20:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+J1x=TC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tKjJ3-0003N3-9R
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 19:20:33 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2413::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7c10341-b662-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 20:20:32 +0100 (CET)
Received: from SA0PR11CA0060.namprd11.prod.outlook.com (2603:10b6:806:d0::35)
 by DM6PR12MB4121.namprd12.prod.outlook.com (2603:10b6:5:220::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Mon, 9 Dec
 2024 19:20:24 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:d0:cafe::bc) by SA0PR11CA0060.outlook.office365.com
 (2603:10b6:806:d0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Mon,
 9 Dec 2024 19:20:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 19:20:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Dec
 2024 13:20:23 -0600
Received: from [172.28.102.118] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Dec 2024 13:20:23 -0600
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
X-Inumbo-ID: a7c10341-b662-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXfI8uIlTQa+GQM3m3U3XKYisRNBPUXcw1Nhp0sS8C+ZSsUdulxtierLztKgjxxwXT0qsW0rSkYU+YQw7yl3LP5uJ16SCQ4trIQqaLpZHWE6a/dJFgQbkzuZvx/EHUSEAyZJGiQ/6EfhqeAcRfMGj1xlmtUdP3L8PwZk5/KbHS/iYnI++sZsBdjRYx+7i4P6HIDSp2B587WjXzVQ3IGNy5/Xo8SgGfgq18G+DNI/Sx3hkCaipPtx6B4rpXazgDbHSuUniBh5dkI7Rtgutjshtf5tzC+67mBS4UcZLbHge8EkVB5GEfLgeER6RY3qnGnvrurfNz+yCcwv7VUanI3twQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXJDaz94dakxJ/TNQ7sC0pn1BJLya1iZ8TEfd2Rm6Yc=;
 b=tv3T1Nq2cSo9WEqmKgtyl9vogDAP2EFch4cDn6QOdqT4bAEYx8mAXJ8wdk/dIQdt9fE7diw7y77heYnJ1NCpQ7YTKVy5+3ii7VazPS6UU8PHALn5AHe7bBzZ1wIw4R9lRwLL7KQeCaid/Qn/n6mWxjBD9+b23MJXYonJGjUt9zooVFsO3U33kHs7SKHW3RIBaaRAoz7WF6VKTz21cUCvToFtYZsdaNUztU4qmd8Iojc4UZRQq6D5o+GuNOWyYdn52aOVRqz/8sFMUetXxKEu+D6EkYw7Ssj67dfMTpTmtdmA6dqFhJ1pjdtlz77XjdBJ6WzSeOsZctNXtaXx43nnZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXJDaz94dakxJ/TNQ7sC0pn1BJLya1iZ8TEfd2Rm6Yc=;
 b=Gv3NImBJzAXywCSmmb2jURgb+/wfHsTNIN4emvaBFLQP+EHyFpJOGXVZWvTzmMkDvRqmLhhXDBzqKurnYnXcoAS9ZASNF2HXSIsDa7DNald/uTwQHU7jCVoMeDjzDX8I+p87Bjo4lHiFoeI9mbx2gUsEqPuDGDPbr8QzYat/+kE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f2c8d9cb-d201-4136-98f6-4beb6654b997@amd.com>
Date: Mon, 9 Dec 2024 14:20:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG: Mention xl suspend/resume
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, <xen-devel@lists.xenproject.org>
References: <20241205195026.3523-1-jason.andryuk@amd.com>
 <638e4fe3-c346-4c03-a3db-2027986753a8@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <638e4fe3-c346-4c03-a3db-2027986753a8@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|DM6PR12MB4121:EE_
X-MS-Office365-Filtering-Correlation-Id: 028cc1e3-4688-49e3-0203-08dd188687f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWtaU3gvdW5NeUZnNC9IalZONE54VnZCZnhXSGFONjh4Z1Y2dXd0VzZHVE9i?=
 =?utf-8?B?a3VxU1kxald6U2lqNEhDQzdFQ1UrcVRFMkNmVjd1MUJ1ZGFQVVRSdzBDczV4?=
 =?utf-8?B?RWNVajYwV0JDZEtINEhxaERVbEFjN3dVQmdZMmtVZzE2S0tXT1hoZkhwWTRE?=
 =?utf-8?B?TkkvaXdQbFVuRk4zSzlTRFZGcmloUnRCNExmQlZJK0k2MTNhNlB0SHY0VVox?=
 =?utf-8?B?MWFJcjUzeE40ay9OSnBMTlppU2ltaWlHQXdSQnJKY2Y1cHdVdXQrN2ZQZ0tw?=
 =?utf-8?B?aW1KcFhwVzFrUDFyTlQ2aG1sa0VnZkVXTEhwNEdxckk5eFIxSmJIQmVJK0g4?=
 =?utf-8?B?a1pPTmR4T09YM3ZjRWNRR2FMczdyb1pGWFVvbk1TTm9wb3dCK1JxQVFqNW5Z?=
 =?utf-8?B?dWlWTXZGVG1mdURZdWN1LysvbGV3NUVOZThuR1Vwci9adERXend2eUpkWkE2?=
 =?utf-8?B?a2VRZGp6RGh6ejFKWWVpT3l5ZTlSNHJkNEVTaStrK09wNUpaK2QrTDFXSVVD?=
 =?utf-8?B?eWltbElraUV4UG1ySVZEZGMzdFBFaVRWYStaUGtXRm9VUlFDN1E2RmdzdEdF?=
 =?utf-8?B?OUdFbDZ2di82OVNwZjNKaWR6Y1VSZS9wTk81Vnc4LzcveW1wMThOYVlmNGE1?=
 =?utf-8?B?SWJYVkxiaTNYY29SOGl3MXNXa2tmRmJRSUZsUittNTFvaWV2ck83K2FzTlhK?=
 =?utf-8?B?NnJiUTkrQzR6WTZzTzBodDdTTmJSMGpvNWlsNTV5cWJORTczWWlZT3RVQnQz?=
 =?utf-8?B?Mm9URElGOW9OQmwwZXdBZENRQUhaMUFxMEhDM3dkR2dmUFRJcFJTMHBGVmFT?=
 =?utf-8?B?WThxRlFWckdzNWhMYUlTNXd6YjZoZ1VpS0NZbkhkVGRDdTl1RUY5cDVPeHZo?=
 =?utf-8?B?bkdIWndpYXMweGNXZ0RXQ3RqNHA4YWt5VlRXcUlCVlFzM3pkS2lIcU9yY2NG?=
 =?utf-8?B?L3dBV1dsdVFDQTNwemFYVnNaTG9zWTFZOFFuVzlKbVg4dStOcFhWVCs0Y0NV?=
 =?utf-8?B?dzBrRVdLMk1iSlRPVjlIdk9CbUZtOXJvTXl5Tm5wUWI2cDhXQXNFb2xsNnU2?=
 =?utf-8?B?ZjNwUHpkclZxUE5NTkpKN2lIeC8yVjFrdFl0QU9GNXFxWVBGalk4UW14TVBT?=
 =?utf-8?B?Q0hBQ1YyZ2pvdkVYZTFlaWVscGhMeFNvT3dlQ2ZIMFBxcWxoR1QzQVJrRnls?=
 =?utf-8?B?YUdnUXFTdTE4bng1SmE3UTE2b3Z3cnByNEwwZHNnc0g3b0VmRU5hZm9EUkNH?=
 =?utf-8?B?REx1Vmo3cFROamUyVGdjamQxbVpuM1RHYzNTN3dOaExwa2E0Y2RIS3BoQ21H?=
 =?utf-8?B?VnlTZGF5U1BYNUxpdXgzSVQ3QjY4RVplQk5LY3Exb25XZWdWY3lmUlpLYXdW?=
 =?utf-8?B?R2lHU2VyWmFkRWhrK1plN1haeVRnRzBSdm15M0RrMG5GeWhKejBxS1UxTHdX?=
 =?utf-8?B?UExSeVNMUUticmVCUDFhLzByREFaeDIvOUY2SGNldGdmSW5RSHB3NzhBOTdy?=
 =?utf-8?B?Q2NUbkFNeElVdzR5UHVGb05zdC9IUXd4TzZZemJnZVJqZURYTFlIZUlrTU1w?=
 =?utf-8?B?SkxCUEZxUkNpTndlbzVlaS85b2orU2M0MEdLU201UVZScWE5Snp6RXBmVHlB?=
 =?utf-8?B?Q0JnWXBXbUQvc2J6aFVUVUNzOVJ5QzVyVENoU21kbmhHTm1tQnR3c0hvMjVI?=
 =?utf-8?B?bEZPUHVabjljQUNKODdFVnk5TlpkMkJkOThWczVrSXRiQ0ZaZCtONXB5NTVS?=
 =?utf-8?B?MVpsMTVvU0s0VnBreDNna29SSnhTVlFGWDV3WU1VQVlFYzR6dHRQMUp6eWR1?=
 =?utf-8?B?WWZEMkdmOXBWSCt3eU9WajJTdTlUSGI5V2RWK091THlpeWRuRzl1WThjM2Rl?=
 =?utf-8?Q?cThee3BBcY+rv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 19:20:24.1624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 028cc1e3-4688-49e3-0203-08dd188687f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4121

On 2024-12-09 04:29, Jan Beulich wrote:
> On 05.12.2024 20:50, Jason Andryuk wrote:
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> It only works for x86, but it isn't x86-specific.  I chose to add it as
>> a generic entry instead of listing it as x86.
> 
> Which probably is fine, yet then ...
> 
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -16,6 +16,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>   ### Added
>>    - On Arm:
>>      - Experimental support for Armv8-R.
>> + - xl suspend/resume subcommands.
> 
> ... you'd want to name the limitation to x86 here anyway, I think. Unless
> there are firm plans to remove the limitation by 4.20 going out.

No, I don't think there are any plans to remove the limitation.

This seems weird since the feature depends on platform implementations 
of hypercalls and library plumbing:

  - On x86:
    - xl suspend/resume subcommands.

Whereas this seems unusual since it's not following the above format:

  - xl suspend/resume subcommands (x86 only).

I guess I'd put it under "On x86" if I had to choose.

Regards,
Jason

