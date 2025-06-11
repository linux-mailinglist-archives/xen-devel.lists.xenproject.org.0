Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DC1AD603F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 22:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012169.1390709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPSGl-0006Ss-T9; Wed, 11 Jun 2025 20:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012169.1390709; Wed, 11 Jun 2025 20:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPSGl-0006Ql-Ps; Wed, 11 Jun 2025 20:41:59 +0000
Received: by outflank-mailman (input) for mailman id 1012169;
 Wed, 11 Jun 2025 20:41:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTmX=Y2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uPSGk-0006Pm-Na
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 20:41:58 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2413::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8457f5c4-4704-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 22:41:57 +0200 (CEST)
Received: from MN2PR10CA0003.namprd10.prod.outlook.com (2603:10b6:208:120::16)
 by MN0PR12MB6055.namprd12.prod.outlook.com (2603:10b6:208:3cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 20:41:51 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:208:120:cafe::a7) by MN2PR10CA0003.outlook.office365.com
 (2603:10b6:208:120::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.32 via Frontend Transport; Wed,
 11 Jun 2025 20:41:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 20:41:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 15:41:49 -0500
Received: from [172.27.195.250] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 15:41:49 -0500
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
X-Inumbo-ID: 8457f5c4-4704-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgEDVXdkh4EuvdcXFy2dY2FlYFRf/eMi0QoAbLr6Yjj6JJszGdCh0rPGqTVDFtHuO2Kp8f0fbjkWfGeXcxZKuC7xTJWZvaY+Lxw6jDQWtoecuGK4FxrHtxgmqyPj9LO8/xaDa8S+FNuB8EYByF0KO3+FhJpS1pnIsZ12TgYfWcTDpl9DceB8CJnFmAEQOljb2vP746tOJbqPfCiaafs2cFR9ebMttqPZhmkIBGv9vP4tx/+skNgA1UijuC0Z7VHaom3OA7+91kBsdUeyictCfNz6hN5AZxKpw3D5M4NN7n28cQdmYCFWkXP9X65hJTUH1w5qPVFOw/TkH9UPDCZlgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSoUs/q3sJbHxSpapxW5i35H3PX490J21YMC+giLGeM=;
 b=lu8ro5mwzhQGJ5gCOJ3/vjgJvJuHAx2iAsBaXjjzw25hzEundopz1v913YebmXJWmgJIPlSlm2lmbcOgrWb45Pkw2yg6g1piRmMGRYOlvskEeZQoyIQ7C61US2MazwyjKllInLuTpCqxpYRoMbh/lB6qGuU+93J3F0kjMW2i16NEh+FqTJWgCyPzoHZy615McTysYz44Ykge3GAknB3xH3RSn8HZA3biqqtgOqbIkVNOKEdIs01I8PjUa6rb/vkod3Uqysuj7t+KJU0+QvAq3z4GnlPQ67R7syuIsiewST2Tzvh76Nm8obFuNalw8PKHvTHOVTI8C7Gs/QFuPkwjBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSoUs/q3sJbHxSpapxW5i35H3PX490J21YMC+giLGeM=;
 b=s/MqmB3Fm275Izq7fPyKRZFn/AGpjmsXk5+AgAclr2YuqKDtSOEcENEmr4rXjh0qeDL1Mpu9SIpXAk9WfGwErJIJ+CXiCuRAQ8q7aVy7PHj0HGar2rSUDus3RRdZY6PUwV4E8qipzgQ0MxOGkagRu3MBWLpFldKxHgXnfZlcB4E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4d6a72fc-5e7d-4817-8b52-b6b24fca9d25@amd.com>
Date: Wed, 11 Jun 2025 04:02:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/18] xen/cpufreq: refactor cmdline "cpufreq=xxx"
To: Penny Zheng <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Jan Beulich <jbeulich@suse.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-6-Penny.Zheng@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250527084833.338427-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|MN0PR12MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a0d3b8-48e2-47b7-2ac7-08dda928644e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHpjWVVVSTBHT3FBTWJCalpUSGd3aXlnMlErbGYxR2JJSDZDQWIrczlKOVgx?=
 =?utf-8?B?YmY4cmNxbGNiVGVqK2N1SFdRMDhOV0VveS9FaDBHaExDQXlZUU5yaHdDUDdL?=
 =?utf-8?B?ZmVhWWRrcCt4d3grQ042dUgzbjExaUxDcXdwMlZQZjR1MHVVYW0yOUR5MjhI?=
 =?utf-8?B?WjI0WmZLRkd1V29uUkNYWjRwVEo2Sk5kR2UvaVdRejZ4d3k4UE03YmUzTXN5?=
 =?utf-8?B?RDdZK3ZqMGJpMnhyQ0lrZUNYVXovbUdGVG9sYTF3eGdHQzJGME5LaUpSNjJW?=
 =?utf-8?B?eEV6ajRxMnRjRlpSbUhNU09WeENySXg5eFRkQkhSUm1VOWcwSGV0OHZqb3hu?=
 =?utf-8?B?YjkxMEpHeGVBWmFlV1IrbFlhZ0ZVNjhFK2Zvay9BcXBYeTJZSFRCbGVxUjRU?=
 =?utf-8?B?c1NOUG1xU240UFBrVXVYRERRYkdGeTNJR0RxR1BQK2xHWUUxN0lBMmxNZzgw?=
 =?utf-8?B?L1dhMnhPZVJPU3V4S0I4d2hJeGlJeEJueWwwems0YW1RM0lpbnJSNTFWQjhH?=
 =?utf-8?B?S0JML250c3FFZkhYZk1YNXl4OUY2THdIcE1Rdkc4TWR4N01HejUra2dqWlhO?=
 =?utf-8?B?WkorNS9BaUJteFVkMHNXK0NxclV4TEc0NG5zYWtpOXVET2RURUN5YnZoV2kx?=
 =?utf-8?B?KytzOC9UK2FjNjdVNXZMSWUyMGYxci9GTmZuNHFxRWNqRnN2YWdad29rdTFO?=
 =?utf-8?B?QkVicTcrYlZOOXIxdmhVZHZ3VWpNMnMwTG5yZ3Y1d3F3U2VGREJycU9IWjJ4?=
 =?utf-8?B?dng2Qyt6R0NlUVJZTUhMVllzY2NLQTI3WkNOVk9FNnU4SElIejNsQVF4ZmFC?=
 =?utf-8?B?Z1Q2aFZEMmdQQVhPQ2FxRVNSa2lMMGgzVCs0d1BuZ2pBVDJ4amxuQm5JNFhj?=
 =?utf-8?B?aWdieVMzWFhjdSttQzNzOENjRUt3MFMxYkk3cVhxMVRZZHpSTGFXSXBPUjFl?=
 =?utf-8?B?T3dwL3V5T05rUm1qZkNUaWoxYTBEY0I3RGs4Sm9iTEE4czE1bCtUMWUremlv?=
 =?utf-8?B?UkNEeUdSY2Z2YTdoZU5nZXJDVGd0c3hwalppWDZ5QitsWjgvSzF2NWd2TktY?=
 =?utf-8?B?UzEyRlU0bHdyZzhMZC90VWdJcWVJSE81eGRDdlRSdjhWMndsc3Byd2RHREp1?=
 =?utf-8?B?dmRmWXBJVG9WMzZxZXg1ekc2bVRRbktEWTZDUWZLYVY4M2M4MU0vWXVOZHIw?=
 =?utf-8?B?QTdaNlVoVDJ4QVkxNzNzR0RiUmt4a2RUeWRUQ0NxYlhHdldHZlZDdG5YbTdJ?=
 =?utf-8?B?OFlUYW10WDdjVHdldmFJMjJmVWIyRmVnK2RLRHB2TGpaUXIreFVPRU1tU2hB?=
 =?utf-8?B?ck9vR3ZYaHhVU1N6WG9NTnptRjNjZTF1SVhMVERWcnRSU01WYWpRanJiaUk4?=
 =?utf-8?B?RHZ1QVVKWjFZUm8wY0VSZUZuVEZEemJXT1JJTldkWDVJZnJLSmlXajJuZjJT?=
 =?utf-8?B?UnIxNXJzSFFlSG1KR0lmeVNrZVZESzlsbDVab3hwRlpRYzQ4MkR5Vm1zUU1D?=
 =?utf-8?B?TXU2cm1BVVZJbU5hdElTSmNmY0FiZUZCUE5VZ1A1OE8wVVVka011VGZKeVNa?=
 =?utf-8?B?Si9Hc0l0U3pKOHNLbFltZE5hNFZGY3BDTG5VZDRVRnZ2QWhjN2NZUGVPanFT?=
 =?utf-8?B?MStkUU1sNU9pU0R3Ny9IVUtKcmRYc0hjREUzL0NVWGhiNXFzWXFtQWhpVkFa?=
 =?utf-8?B?ak5JSkpUSXozWEF6cEFzeUhEa1NkRVhDL0VlRFFkLzRoTnBzdjBaVktRQkk2?=
 =?utf-8?B?THdQYzErSVdsNTZmRmd6MjNsdFdoS1JGdXEwdHhVR3FVQVJGWWM0NUg4RG0y?=
 =?utf-8?B?eWlxc3hBS3l5MXBWTnFGdmxHMkF0ZnR2SzlUYm9SSVBJN0p4K3VTaEsvbDZi?=
 =?utf-8?B?bzVTSklSem5zWWxIYlBlbDdUeXM3T3gzRmptMmdwMjB5blNPQzVyT3R4dGgy?=
 =?utf-8?B?WHpjcG1nb1pCTTdEZXZUb0JldnZmdUZuM2xXOGtRdFVYQ3BFb1IvSjVhbXQv?=
 =?utf-8?B?MEszQ0VzZEh1UXNZQ2xLWThjQUd0dDREbUF3Vnh6Q1IvNlIycWl6YlJEY0la?=
 =?utf-8?Q?xoQqh3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 20:41:50.2516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a0d3b8-48e2-47b7-2ac7-08dda928644e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6055

Hi Penny,

On 2025-05-27 04:48, Penny Zheng wrote:
> A helper function handle_cpufreq_cmdline() is introduced to tidy different
> handling pathes.
> We also add a new helper cpufreq_opts_contain() to ignore and warn user
> redundant setting, like "cpufreq=hwp;hwp;xen"
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

> @@ -114,20 +161,14 @@ static int __init cf_check setup_cpufreq_option(const char *str)
>   
>           if ( choice > 0 || !cmdline_strcmp(str, "xen") )
>           {
> -            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
> -            cpufreq_controller = FREQCTL_xen;
> -            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_xen;
> -            ret = 0;
> +            ret = handle_cpufreq_cmdline(CPUFREQ_xen);

Do we need to check ret and error out?  (and below)

Thanks,
Jason

>               if ( arg[0] && arg[1] )
>                   ret = cpufreq_cmdline_parse(arg + 1, end);
>           }
>           else if ( IS_ENABLED(CONFIG_INTEL) && choice < 0 &&
>                     !cmdline_strcmp(str, "hwp") )
>           {
> -            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
> -            cpufreq_controller = FREQCTL_xen;
> -            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_hwp;
> -            ret = 0;
> +            ret = handle_cpufreq_cmdline(CPUFREQ_hwp);
>               if ( arg[0] && arg[1] )
>                   ret = hwp_cmdline_parse(arg + 1, end);
>           }


