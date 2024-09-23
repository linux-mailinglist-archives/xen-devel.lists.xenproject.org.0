Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBB497EA11
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 12:45:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801889.1211939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgYZ-0000Cm-Gs; Mon, 23 Sep 2024 10:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801889.1211939; Mon, 23 Sep 2024 10:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgYZ-00009o-E4; Mon, 23 Sep 2024 10:44:39 +0000
Received: by outflank-mailman (input) for mailman id 801889;
 Mon, 23 Sep 2024 10:44:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WbMn=QV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ssgYY-00009g-GW
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 10:44:38 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20606.outbound.protection.outlook.com
 [2a01:111:f403:2415::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d316cb5e-7998-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 12:44:36 +0200 (CEST)
Received: from MN2PR20CA0001.namprd20.prod.outlook.com (2603:10b6:208:e8::14)
 by SJ2PR12MB8956.namprd12.prod.outlook.com (2603:10b6:a03:53a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 10:44:33 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:208:e8:cafe::1b) by MN2PR20CA0001.outlook.office365.com
 (2603:10b6:208:e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Mon, 23 Sep 2024 10:44:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 23 Sep 2024 10:44:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Sep
 2024 05:44:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Sep
 2024 05:44:31 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 23 Sep 2024 05:44:30 -0500
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
X-Inumbo-ID: d316cb5e-7998-11ef-a0b9-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JClQsORBoPyVoyjymuG1f1ivl1eoByoNYNIjdkaOGz1zYEwEVxFemp6UbYi0IpEK5fgv3MXiu8dSEOvdfWN3B2VgfnfvL0+7UbYB7BmK1Scb0/WCZOKUm2wr6c2/8AmMc1RyFS6OHOI8qkoAkZeohKjoFUEfGyjZrRi9LpGJOGa1F0KSPMy2R6cMr92gByZPVEL5w90nOaCif7mmTCKZhxKRAQnUG2BqpNqXlLTaXF6XkpccBQESrHN8ofcABOWTt9RwMIRme/gXuFTyvRzAPmFBJhO4AjXerOSb9vNb+mV0ATwxLlWWiw+cCUG8hNeK1i7Vh1Yc7nTzatWdZ2ZojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=actwuHEvnZspDQ/Z1PnYpS5hk51dpyRAjzyCpaZwyPU=;
 b=PuKYu85lUYc2HbWS7BJoaUxxh93CMvCdr3O1K0Z9adPWUpAS2FZtgVJHEk1GUSwH5L0fA4Scy1uCqHjWRl/xtjdC3sMt1I7sJIjdwsXffDhajrUNK4euficR8ERmkBPzSeoWtEJuricRelBcZGoE94sypQlq7c6btkkMtBFTFxNNfq5PnswXngn/JfcHJQS65CS1BGvp/9Fs6zjVp4lkd/eZrTZYGC8vbZsxQS8GWH+l4jCGcuPkqCg6QO38FGNfK3iv9IYJxPpvnuHMP5HyQZuxsquThYIkWLK15b2pMcaDK02w1dW5KMlN7pbgOvLMrhREEvWmeKx9x3O0MD4HRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=actwuHEvnZspDQ/Z1PnYpS5hk51dpyRAjzyCpaZwyPU=;
 b=QiJncn4wd2/Yf0FWiuN0D01esKqSvwouIfdJZpx8iuqFEwWj6W6Bvfwikxy3LswTuioCTB0tgoAYIYfKIjMAFneODAbKzQrdKKPP1fK5LBYxvjjhJ57JD+HWcXCqq8ToBFF6NIURyBXAfzJHKWMU0KrCGCzmQyCxj8lRHuIl8PQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <590a7788-02ad-4876-bc3a-ec58d860c420@amd.com>
Date: Mon, 23 Sep 2024 12:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-overlay: Remove ASSERT_UNREACHABLE from
 add_nodes()
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <20240919104238.232704-1-michal.orzel@amd.com>
 <20240919104238.232704-4-michal.orzel@amd.com>
 <96c741b6-1938-4fdf-baf6-31c85ef0f323@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <96c741b6-1938-4fdf-baf6-31c85ef0f323@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|SJ2PR12MB8956:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a739d40-c2b0-4e80-c71d-08dcdbbcb55b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SG5NQmdRQy9ZZGVYbkNMQmpDVHM0QnZjMTRmTlFuRUJuYkt6dXEyeWVSaTgy?=
 =?utf-8?B?dktybE41Umg2SGlYR0UxYWtSZ01Jd3ByQzhmc2kyTHkvNHlZZHVWMDhwZXZt?=
 =?utf-8?B?L2ZUZmdxMk1FT0hZTTV2dGhleDJZcVR6U2pCTUI1R0QzZlhTMXlQdFJrOEkz?=
 =?utf-8?B?bER4YVZDOHBYS0FnSHBQQXlKUXJxQUtzNkpiN216UTV3emFnZm13a2xNcWF3?=
 =?utf-8?B?MjNnOGtidTgrZUc4bDlNZThHamMvRlQ0Z3dVSHluMzJNQTlYdlpVcnp3Q2N3?=
 =?utf-8?B?MndNYi83b3ZVeU92UEIwc2xvS3JrTExaN0ZoUU5QYWZYR3NaLzUwVGQ1anVS?=
 =?utf-8?B?ZlRaeGxkbEF3K1Vjd0hRaXA2bnV1R3dqa2NHMDdsZWpnM21MTGVnMG1IUk8w?=
 =?utf-8?B?VU5pVEZRL29ueW91c3RaUzV2bHQvUWdWbG5qSDlta3dJbysrRGdOTEh5L3lW?=
 =?utf-8?B?UHpRdGlGUk5nVXZMUHVGZ0dmZjBWQXE2Mk5WTGxkaWY4MW5JYnlLL24rd0dm?=
 =?utf-8?B?c09WSUhOT2QvcmtXaEh3SzVkZDdKMkZhdHZIdEw2NUh5a3Znd0YvckVCOE1l?=
 =?utf-8?B?OUtnSkdsUGphTnkwV3dQM0tpY0ltMkkxOTZ4Wk9GNlFYUXRYa2lacUlLcGdY?=
 =?utf-8?B?ZnlhTnp3dEJoUEg4ZzNxaXhzR1o2WXZhdkNrMUlKaUFGT0I4M254dXI1WDU5?=
 =?utf-8?B?MHFVT0NYZC9ia0o4MGtLVGxtQlB2RndTZ1AxK0xKTm1rakxHak04dXVhMkZC?=
 =?utf-8?B?YXZIT3ByZlFVQkZpc0xtVnVHZEc1NjVmOHJ1MjBheHhkQ21LY1Q4dWJZM2dy?=
 =?utf-8?B?MmdWM3RqbFdzL1dmV0N1OHA5dWFwQWpzQm5uYjFDQ2Y4VmM5SUVYOU82OWJ6?=
 =?utf-8?B?Q0prQkQ1cjY0RkdkVUV2M1VURTNYV2FQYU5COENxVGdFRnZQRUVtTGxOK05q?=
 =?utf-8?B?WWZScEZTV0xPUXM4WVArdDMrd1dtdlBsSnJDblV4RVREbXg0Y3dEcEswTFBS?=
 =?utf-8?B?NTdpOEV6VzZHbUxGWWQ5MmxjT0htbXdhV1ZuWUN0am9pOTFySW83UjdvdWp6?=
 =?utf-8?B?S0JmRnNlUTVkNFRadk11SDVFamlSc3kxQkp1OGRVQlU2M1hzakZlT1lRSjdk?=
 =?utf-8?B?MlhNRFBHekYxbDBZK0JLckoreStXTnZvMzVnckloRjFHMDlteEtHaEdJVDRC?=
 =?utf-8?B?b0grZ2NwNXBvMXJkemNtVFFTcHJOKzZ0NmdxZ281Q3Z2Y3dkWnYreDlCT05K?=
 =?utf-8?B?TGxNNTZSdkppQ0ZPSVhOSXZSZW8xTy9uam5XdDFtUUhnbFM2T0VzMXl6NDRF?=
 =?utf-8?B?cjBQZDZ5ajdTQ0dJZ29OZXBobmtKamVrTEtFVEdWc3gyZUxKZzRlcDBXVUt0?=
 =?utf-8?B?cllmYjZlbmwxYmRkaitvellTY3c1YXFlQVhpeCt2UW1rNDJkRlhpNDQxSU83?=
 =?utf-8?B?b3g4a2duKzFIcWxRVExvUDZjWWZjNkd5a2VFQUpDMllpWGtkSmxQOVViMXhw?=
 =?utf-8?B?MmlFZGpRYlJlbzhqOUZLd1MrZHYxclU2NEpkMk9za0pHdFVkMmFEM0gvVzZW?=
 =?utf-8?B?VjZ0eEp4MVpIcHRWZVZ5a3V0VzJLZzN2bCtIZ3JON2x5YWtUbGx4LzRaTzlW?=
 =?utf-8?B?N2k2YWhsOXdTb1VjbW5yaGRrRmErbjc0cXRMdTVSYTFMdjBPbDlFRVJURDBX?=
 =?utf-8?B?ZUhTYW9HV1B5b2dOWlZ3c25YR2VBUWxDekV0UVRtT2NYK2wxT0E4b0I4c2NH?=
 =?utf-8?B?MStTQW5tUHNVR2RJbkEwemk5blovV3h5RWROanNieWJaNFpnUDlBWGpOL2Ro?=
 =?utf-8?B?OHN6UDdmNjJvMnA1alY1cURma2VRaWJrYTBLV0ZxbFhoMDgreWFXVlo2VkIx?=
 =?utf-8?Q?bMqqT9Qr3Sr2p?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 10:44:32.2011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a739d40-c2b0-4e80-c71d-08dcdbbcb55b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8956

Hi Julien,

On 20/09/2024 10:35, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 19/09/2024 12:42, Michal Orzel wrote:
>> The assumption stated in the comment that the code will never get there
>> is incorrect. It's enough for the target-path to be incorrect (i.e. user
>> error), which will lead to an incorrect overall node path and we will end
>> up in this "unreachable" place causing a failure in debug builds.
> 
> Looking at the caller, nodes_full_path contain path that was computed
> from the overlay. So I would have assumed the path would be part of the
> new DT. What did I miss?
nodes_full_path contains paths to nodes by combining the name of the node with the target-path string.
It's generated in overlay_get_nodes_info(). It's a simple <target-path> + '/' + <node-path> + '\0'. It does
not have any dt logic as for paths. On the other hand libfdt contains advanced logic and can tweak the node
path if needed. So for example if the target-path is "////" and node path is "foo@0", libfdt full path will be "/foo@0"
(notice how it got rid of excessive slashes) but our nodes_full_path[foo] will be "////foo@0". The only place which can
spot this difference is our check in add_nodes().

~Michal

