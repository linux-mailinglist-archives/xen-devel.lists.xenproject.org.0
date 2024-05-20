Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1A18CA1F3
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 20:24:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726319.1130594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s97g3-0002sU-HC; Mon, 20 May 2024 18:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726319.1130594; Mon, 20 May 2024 18:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s97g3-0002pm-Dd; Mon, 20 May 2024 18:24:03 +0000
Received: by outflank-mailman (input) for mailman id 726319;
 Mon, 20 May 2024 18:24:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l4Ei=MX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1s97g2-0002pg-5F
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 18:24:02 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 200fb62f-16d6-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 20:23:59 +0200 (CEST)
Received: from BN1PR10CA0018.namprd10.prod.outlook.com (2603:10b6:408:e0::23)
 by MN0PR12MB6002.namprd12.prod.outlook.com (2603:10b6:208:37e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 18:23:56 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:e0:cafe::c0) by BN1PR10CA0018.outlook.office365.com
 (2603:10b6:408:e0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 18:23:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 18:23:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 13:23:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 13:23:55 -0500
Received: from [172.21.89.32] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 13:23:54 -0500
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
X-Inumbo-ID: 200fb62f-16d6-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOS6Br0hJH6xewZ16FFHrA1Sg7hvksSKWcWGf43XIM1s/tUxepTNB7qfAEn5f7RnPB6tu6KSnWFAzSLMw6G/w9glGEN5H4UI47UfQouZ73yXszAMhJ/69h/taOPAlnaKdRjs2Ppz0b7flpkkxUHPF1V85bOVakHgbp9ZIVb8da03ywYqRWaIlH/ozTNumJo8xh8WcSIeVttH3pix2WIeunUN+IQlFPW/Zu2z1V0S62XPulmpe+Zv0ZuMPc6NmSBs5t6BeDUb9oL/S0RkDB/3CEBwkb2W8e978kCytr7GczmZD2S02EwMhL8H1vLjljXsWilP+YGW3SqEID3+TVMncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTrotKv/YbafHCsyE2adcCRyYL0l3sH9ww95U5n1sEQ=;
 b=kgpEsC5MxNU9gui0wLsH8R7WD9le3KIfGEcnXpgQaI+Wsyr2r/4cIPP21Vm1M9xHF/JPM3fqR/2BI7dNnIDLDhRkLglwkHHrwkZTW/K8w+XyV3ISEDs7fcGhUIdL8NF1hce1rgnaXD/DlVh0DX32vbxBfuuYt3tH3000T3i7auUNlZz4ngkJwusVGkVpn2RtjfP7Z0YSoKpJgYPdGsO4qvMw1URadaRxGxC6x8NGW9DKKcsdkcftdfhqFq3tP9LmO2oz+0cwj4p9Z5yGkVtTHy1CaW6fm2/yPYH31o+UR9lWrG7TXbbaMDPf9DSN3AMzDVu29VFjKVpOtMngdADLng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTrotKv/YbafHCsyE2adcCRyYL0l3sH9ww95U5n1sEQ=;
 b=suoJPD1bEoObGXce+L/0C6jW5KKX6c48eBhugSh2fxMqqYgkQlaK/NyudZj8ni5u/NhdVPo807aDGpxFEKBFlJxj2zbPCyUyaxa/uwuhQzGHqWd+odADMRhoMfY88QObaQ6pTYxPOt+pqjjl4mgs1xzrobrdYoH71xNVy+Q3YVM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <46e1d5f3-20e5-47ea-a1cd-10d120211f0d@amd.com>
Date: Mon, 20 May 2024 14:23:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] tools/init-dom0less: Avoid hardcoding
 GUEST_MAGIC_BASE
To: Henry Wang <xin.wang2@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, Alec Kwapis
	<alec.kwapis@medtronic.com>
References: <20240517032156.1490515-1-xin.wang2@amd.com>
 <20240517032156.1490515-4-xin.wang2@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20240517032156.1490515-4-xin.wang2@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|MN0PR12MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: f61064fd-8e72-4b9b-e1af-08dc78fa0279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eE00UmpiMUpkaHkwVUJsTG1jcGhGMUhoUER2cVAydUs2R1pHZWdaNkdhd1Zv?=
 =?utf-8?B?NS8xaW12VW16T1QwKzVwbGVzVS90SHhpTm9jaVMzOTBnaXd6dE5aMEp4TzBJ?=
 =?utf-8?B?MUpmMGZkcTg4aXF5VEVyMFpDaGI5eVg2L01HeGJkRExyTDVFbld0RnV1N0Z2?=
 =?utf-8?B?clRpeENtVkRzdmNPQ2xiRlVXMGg4M3pLdkVGanV4bTJ1NWt0aUlydzdRbW5D?=
 =?utf-8?B?czdvQVE5YkVWOVlCaW92ZkhJYmlGZFp0YlU5V1YwVmMxK3RXQmUwS3hLM080?=
 =?utf-8?B?OXpBaE40SE9GREowbVJxVG1QNHBVMzE0dWtQdXFydFNmclcxMmpqMHM1WGE1?=
 =?utf-8?B?aExXcUR4ZWp3dEpibldHaTJTME93WVIvS2hKY3I4QVgrZFVHeHdET2kzL2dt?=
 =?utf-8?B?NXNKVlgvaUdNdDdCeTBIbXFhVERvSVMxSFZCMWZHNWl4WkZxNWFKQ2V2a1o1?=
 =?utf-8?B?bC9XMU1CellXRS9yWm9sWmN0a3ZvbjBaWDBBT2JoeTQ0R05tNHgxU045RlRr?=
 =?utf-8?B?aU1nYVExODJYbmNVZ3ZYQnVIZ0N5VDN1ckRrTkRYc2tqMS9YN09FTFBLMHdE?=
 =?utf-8?B?YzdKMW82OExlRXJlQ21FdGVWVTYrQ0VvSzRKcTRBS1hyQlFKNUFHSjVJMGZL?=
 =?utf-8?B?UjNQaEFDQldJYmZSMkl2RW05bU1aUk9lSDF6V0pYaTI0eG13eTZIRWQ4S2ZY?=
 =?utf-8?B?UXZIZkhHY3VuR2Yya0ZPNENuQnRvZFpWYTRUY21DU0JwMUdON2RNdlNnNFNI?=
 =?utf-8?B?WWhObkc1UllQZGNkQWxDWnN2czd6bUNVU2RSTjR5b0VrUFBMRnplTU94dEVN?=
 =?utf-8?B?TFQ1NnZXd0dMRi9Cazg4clZ5S1ZBb3JCS2xrUDFsN05wWUpwZlp5TW5WSzRv?=
 =?utf-8?B?UjZuUGVwdm5IM0psc0YvTm90cWxRRjZ6WGhVMzZoY0U2NlByeG9DWHNDWW9I?=
 =?utf-8?B?S210YkpGdFdZRnRNbDJjVzRoRnJZc3Fmd1EzMWNxLy9xZ0VIUWowMFB4cjBH?=
 =?utf-8?B?K0dPVFNsZXI5VzVzY0hDNzdyZVZjcjgrcHZNbjV2d0VRQzNMNjlZTnd3TlFj?=
 =?utf-8?B?RUhGalM5WW5vT1JoQjhhQW1ueURnVDNoZVpmSHU4UWNNSUk4ZTQrcG9GcUFx?=
 =?utf-8?B?Q1VzNnJxYyt0eHh0aTJiaDVhK1JKN0lNVnJUU3pqQmtrMGg5bnVkRDFvMG1Q?=
 =?utf-8?B?VkMwankrRTZ0QVNXSlVyWGUxWkNicWwyaFNrSEl6UUNXWUF0ZGdMT3hqRVQ5?=
 =?utf-8?B?bWpNaWRHcUJZM0E0RU9MRlp1SzZ2R2Y0d0JDK3phdCtuR3YzZGhZNjluNUZR?=
 =?utf-8?B?aGdWQkc5Ykt0QllmOGJ1U0hFNnMwcDA3Y01oNnJlWW40MzJzTVRWakFnRC94?=
 =?utf-8?B?M3lNTlA2ZjRtVEZmNmJGbkFqY2liTHRhbXhRM2FROVQ3WnE3R1UvcGZGS3h3?=
 =?utf-8?B?UkVUckpQbzVxT0J0UFQrK1poUlE2clREaXV1L0ZIK1NLN1hBT0hlUDlOQUtL?=
 =?utf-8?B?WlJZcVRvMDlUTW5QZEFRZzZUMTZUQ0FzeFh5M3ZtbDRKNmxrOVljWmQ3UzRt?=
 =?utf-8?B?UHRsbElJamZ4S3ZSVGY0WXJlVUM3bHBnZzdjZjJmQlY1QjgrUnlHT016Ynp0?=
 =?utf-8?B?MzFqclY5TS9CN3hQSmtEL1hXeDFHc0F5MHVCMjZwR2Z2YTFSSktwcC9FS29F?=
 =?utf-8?B?UnlraFFydit4VmIwSExXbGhrUjNWV3UrMjFDbE8rbmwvSytFNjJmSlU1UHBh?=
 =?utf-8?B?VnhnZ2x3ckhZcHcwcnVXZW1GYnhFOVpqd3YweFhFUHY0QUNlSkxyc0YrVmx6?=
 =?utf-8?B?aEMzb1RWcmNsMVZIb0NvNUFHWXNsaGVWTnd0RTlvRDZ0M1FwR2JyZHdCU2lm?=
 =?utf-8?Q?6aCsgilwSWEfi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 18:23:55.7998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f61064fd-8e72-4b9b-e1af-08dc78fa0279
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6002

On 2024-05-16 23:21, Henry Wang wrote:
> Currently the GUEST_MAGIC_BASE in the init-dom0less application is
> hardcoded, which will lead to failures for 1:1 direct-mapped Dom0less
> DomUs.
> 
> Since the guest magic region allocation from init-dom0less is for
> XenStore, and the XenStore page is now allocated from the hypervisor,
> instead of hardcoding the guest magic pages region, use
> xc_hvm_param_get() to get the XenStore page PFN. Rename alloc_xs_page()
> to get_xs_page() to reflect the changes.
> 
> With this change, some existing code is not needed anymore, including:
> (1) The definition of the XenStore page offset.
> (2) Call to xc_domain_setmaxmem() and xc_clear_domain_page() as we
>      don't need to set the max mem and clear the page anymore.
> (3) Foreign mapping of the XenStore page, setting of XenStore interface
>      status and HVM_PARAM_STORE_PFN from init-dom0less, as they are set
>      by the hypervisor.
> 
> Take the opportunity to do some coding style improvements when possible.
> 
> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

