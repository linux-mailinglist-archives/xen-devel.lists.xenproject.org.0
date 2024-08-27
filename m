Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59873961A97
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 01:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784403.1193751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sj5dV-0008Mb-NM; Tue, 27 Aug 2024 23:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784403.1193751; Tue, 27 Aug 2024 23:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sj5dV-0008J3-J1; Tue, 27 Aug 2024 23:30:05 +0000
Received: by outflank-mailman (input) for mailman id 784403;
 Tue, 27 Aug 2024 23:30:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Ve6=P2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sj5dU-00080d-0N
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 23:30:04 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2416::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47de48ee-64cc-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 01:30:01 +0200 (CEST)
Received: from SN1PR12CA0087.namprd12.prod.outlook.com (2603:10b6:802:21::22)
 by CY8PR12MB7514.namprd12.prod.outlook.com (2603:10b6:930:92::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 23:29:56 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:802:21:cafe::a0) by SN1PR12CA0087.outlook.office365.com
 (2603:10b6:802:21::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24 via Frontend
 Transport; Tue, 27 Aug 2024 23:29:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 27 Aug 2024 23:29:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 18:29:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 18:29:55 -0500
Received: from [172.20.38.216] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 27 Aug 2024 18:29:54 -0500
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
X-Inumbo-ID: 47de48ee-64cc-11ef-a0b0-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpEXVivbMrgr1xopV2w6im3nHla5p84FMX+ITUkIR/0W+dkMU0vsJVxUiTOhQCbLZOBkifYFGpJHDejr2uKfUkRThu1LLrLgnYUI/c8weHJMz1csGmWGh746auyHZkI92kvclp4otB+/i5k3W+dvJgweRt5FcEzOdhXvmyj+FQnIyF1eN+gQETNk/Q//9AF7DTNYr6Y9otpQ3QDX0wRsbB6j0+m8kIscVPbsuYUW9QhtztLdwIrmiqsuxZTI7uRtE4tysk+S3+WdTb+xyIWKurUhX66pFf58zfZLFNOHhjonnz/jR1j9vacBTmOmoMIildVOJfSPOktxrl/VLik00Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X62I4IbYL6Xjki2tP3l2iI9fd3dxz3v7Xh0Coq5tGaQ=;
 b=WJPsP6b9sd767y63DOUh9Ryr71UPTOPu4gUAXtEGMK5Rcugr9+uSYw/uQcS/n7P5qcMkvLQaRxxsA0WqtaDETW99ACJf7R53o9Fbn+m4SBeSTv8hhVWTiH9e8+AFn81DxrY1JLFUz9wRyEqpIsWcFfCli+XfRpeJdq6N5YzI88RdeXZ+4frxuwxyfvOI8XTSoYeR0Ry40AVucAZZVn2db2bKEePyG/SHGiISmeEs29wK2WgHoJTuHXePtWX7Z53MjXbSvKz9CPAfcrNJlee3+cAN2wJEhvyyOHL516bDBwWNKB+F4DTlD135LcHzjBM5g3jfOePity4+i+9FFMsH8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X62I4IbYL6Xjki2tP3l2iI9fd3dxz3v7Xh0Coq5tGaQ=;
 b=qO/7LfOQrFkN4P6jB3cb+WtesRWFunjL3q7RQqDelYaz2Ya3I18t+A2b64cXdjLy3hMY/gf9tsFNkAzWvv9Au6dfOzh3EPjk76aNoim5DmPucB9pPZBpU49888eHWX5r1uWpxpmU3omMyLkMgYcpLP12rNF82mbjKFIlnwCNOBw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8ab87d44-8a93-4468-b960-0c76c1e6a147@amd.com>
Date: Tue, 27 Aug 2024 18:20:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/3] libxl: Probe QEMU for -run-with chroot=dir and
 use it
To: Anthony PERARD <anthony.perard@vates.tech>,
	<xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>
References: <20240827100328.23216-1-anthony.perard@vates.tech>
 <20240827100328.23216-3-anthony.perard@vates.tech>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240827100328.23216-3-anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|CY8PR12MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b6b294-846b-4f1c-1209-08dcc6f02931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0FLa0lrZXNaa3ZHdDJ5R25FYmZZQXpSTlRBSVg0VzZtWUZXWXFISGVvWDha?=
 =?utf-8?B?eTluSDlyb1lVVnNJRmIwMEFabHNIQkVwTmdHVTdwU21wTGp6bVVaYXI0dFkx?=
 =?utf-8?B?UG1QT0oxODhVNzh0ZThHU3V6ZW9hckNWbmpMemVad0NBR2VzZFB1Uy9WcE9j?=
 =?utf-8?B?OHdDQzIrdGI4VjBVc1dEbG41N2EzdVhRVHVLY0xURVBJUjFrcEUySXowaWZL?=
 =?utf-8?B?YnVYRHQybERGM2toRXg5ZDAwWkxZTTFMdEFLWUpNb3d5eGZ4UmtuWi9CaWlV?=
 =?utf-8?B?dVQvR1E5WXhRamZ3WVY1Y2haZFd0YVVvL1FrbUJnQ1NlMTBxYkp5WWpzZm5q?=
 =?utf-8?B?T2JDNmlxWnBSSTNuelRYWG5Ibnl2ckx6TzAzc3BZWEZEWWlROWJtcW9vVitW?=
 =?utf-8?B?cWwxUXYxUWgxUU82aXVLQ2EwV2UzRTdZQVhvNEd4QlIyNXppSDRQd3MrNXN1?=
 =?utf-8?B?ajU4WitBWlRNWnRQc2pjbGRWdzZtRjNzNS8vTE5LcmZNVnZtRmtqV1dVaGM5?=
 =?utf-8?B?Rm1XaDF6V2ZrcEJpbW0xazQrdzgyYlRJZjdTOEt0QWVOVE1WL29zV1lJWFVt?=
 =?utf-8?B?THFIdmdvZFoyVXVxclczbi9xNFRndkhLdHpseUFsc2RBT0JFU3dlZ0tnZ1NJ?=
 =?utf-8?B?Y011OEJ4Q2dMbi93ZnV4Sk1SZ2tKTkhnc1dHQzUrWEluVnpNY253Z3k1YTEy?=
 =?utf-8?B?QzdwZkQzQ0k1S1orcEZZSDhodHRSUk0wRHF2bndYKytaMkp1RURLVTdlRDUr?=
 =?utf-8?B?cVpCb05CZHliOFY0TGExOWtRQVJmRy81VkRKMzZhaG00YWZoVHFKM3NvLytz?=
 =?utf-8?B?TUk2TEduaVhhQ29ldTF6bzZ6MGlHTUNvTG1uZFg1OTdFcmh4VVN3cWd0aGRw?=
 =?utf-8?B?c1NGamRJNW1aUlFoQTBQZmZyRUoyUjRZTDhYUS9PS3gwSDFkdU5lVTlqdzU4?=
 =?utf-8?B?WUliZ1N6NVRQT0RYK3RkU2JlMUorU3hMK09Sayt5SVhaOE5PeFZ5WXIzczJV?=
 =?utf-8?B?OGNwU2liQ0d0NmtyNjNnenRsbExNVkxjQXNXUUxoWUVuNlZ5UDlJeEhJNFhn?=
 =?utf-8?B?ZFZab214SVpKcHgrZW50L2Nvb1N1Q0VPaU9GN1RGbFY0VWk1SFdoZHYyUXBt?=
 =?utf-8?B?OC9TWHdob1hHRE5vMHRKQ0FnWjFITHZFUkQyTHB3VUZxL1BnRm5GSlRSQjNy?=
 =?utf-8?B?aEE1bjVLRDl3Z1hVUGI5YXJ4QmFOT3dMRnhTMWVTeExndEdkM3JNVTkrQnlq?=
 =?utf-8?B?VkFKWXZWaHBEK3EzRzdiQ1FzaWRHQnd4MnN4eTRINDB5dEV0YkFnUWtaZDMx?=
 =?utf-8?B?UUR4VDVMK1BETFRJZXhOQjB0WlRya2xZL1BMb3dTUG5pMzRIVzFEN3JUdzZ4?=
 =?utf-8?B?T1BBUlIxdjQ4emV6OHFuQUhKa2xXOXp6T0VVRkpHb0VCdlVxS2VZZEhFVlgy?=
 =?utf-8?B?ay9kZnBtd3gzNjRRQmR4dlhzc25EMy85VDBCd1BsSEZ0aGg2UUlWY0JIMmQv?=
 =?utf-8?B?RTd4d2pFUW5UaGJkUHV6VXVOcGJ5RXlOT2t1ZGcweXNaQXVQdkhNMit0Tlc1?=
 =?utf-8?B?YWI4MlFRSncweUUzY3Y0SXdoN2ZnRzZBcnBzMXlPL0J4R1JmOEhXWm94aTNC?=
 =?utf-8?B?MzRxU0tZa0ExZXBWMTc2NGhBcnZGRmV0ODBTZWRBVjdqdElydlljclhEVGFz?=
 =?utf-8?B?OHoweUhtYkpwblFXbnpZcURLdWFwdzZhdTQ5bDI3SWFneGVRNFZHbVBiZTU2?=
 =?utf-8?B?bWF1Q3YyYmxQSzFzZm9oM2dHczJ3YzByRmFZRHJRcG9QUEpRTWpEdWJnUGNy?=
 =?utf-8?B?WmhFZkRpMEdldWxkNVRITzg1NHhNKzNUM2ZHMjJwOHovMEZzMkx6VnRnQXl2?=
 =?utf-8?B?WHlxTUxNdFA5NFNzd0Z0SVFOZWZsT3l4QVgvQkNtbXl3cDk5WDhXdTl4Vk1v?=
 =?utf-8?Q?2VJ57KYmIO10X3U6rIaxSWJstGae9y6T?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 23:29:56.4362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b6b294-846b-4f1c-1209-08dcc6f02931
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7514

On 2024-08-27 06:03, Anthony PERARD wrote:
> QEMU 9.0 have removed "-chroot" command line option, which have been
> deprecated since QEMU 8.1 in favor of "-run-with chroot=dir".
> 
> Look into the result of the QMP command "query-command-line-options"
> to find out if "-run-with chroot=dir" is available. Then use it in
> place of "-chroot".
> 
> Resolves: xen-project/xen#187
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

though one suggestion below.

> ---
>   tools/libs/light/libxl_dm.c       | 78 +++++++++++++++++++++++++------
>   tools/libs/light/libxl_internal.h |  5 ++
>   2 files changed, 69 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index 46babfed0b..298fbb84fe 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -1183,11 +1183,12 @@ static int libxl__pre_open_qmp_socket(libxl__gc *gc, libxl_domid domid,
>   }
>   
>   static int libxl__build_device_model_args_new(libxl__gc *gc,
> -                                        const char *dm, int guest_domid,
> -                                        const libxl_domain_config *guest_config,
> -                                        char ***args, char ***envs,
> -                                        const libxl__domain_build_state *state,
> -                                        int *dm_state_fd)
> +    const char *dm, int guest_domid,
> +    const libxl_domain_config *guest_config,
> +    char ***args, char ***envs,
> +    const libxl__domain_build_state *state,
> +    const libxl__qemu_available_cmd_line *qemu_cmdline,

cmd_line/cmdline makes me think of command line strings. 
qemu_opts/qemu_cli_opts is a little more generic, to me at least.  But 
not a big deal if you want to keep it as is.

Thanks,
Jason

> +    int *dm_state_fd)
>   {
>       const libxl_domain_create_info *c_info = &guest_config->c_info;
>       const libxl_domain_build_info *b_info = &guest_config->b_info;

