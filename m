Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2A88C20FC
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 11:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719633.1122471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5MdM-00042b-Ha; Fri, 10 May 2024 09:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719633.1122471; Fri, 10 May 2024 09:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5MdM-00040Q-EY; Fri, 10 May 2024 09:33:44 +0000
Received: by outflank-mailman (input) for mailman id 719633;
 Fri, 10 May 2024 09:33:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rhO=MN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s5MdK-0003RX-HQ
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 09:33:42 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:240a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62c9e70e-0eb0-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 11:33:41 +0200 (CEST)
Received: from CH2PR07CA0042.namprd07.prod.outlook.com (2603:10b6:610:5b::16)
 by CH3PR12MB7740.namprd12.prod.outlook.com (2603:10b6:610:145::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Fri, 10 May
 2024 09:33:37 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::35) by CH2PR07CA0042.outlook.office365.com
 (2603:10b6:610:5b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34 via Frontend
 Transport; Fri, 10 May 2024 09:33:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 10 May 2024 09:33:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 04:33:37 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 May 2024 04:33:36 -0500
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
X-Inumbo-ID: 62c9e70e-0eb0-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iISezZRuFnH9yMgST7aFWYfhQIl/9DX36HZLNO5CWHDf5KThLMyt04hiYJsG5HOfV2/z3eGzMtC7dSZwddw/9HHz8AvZ5ss+jgzXHeEHFHmF7uWRH+/U3ypA0Jt39C973mm6c5vqbkj95WmQwhg3hsX7FV34gPJx2xNgFSi4pYnrFACVIuiXCzQFzvcbustUoW46J9NdMfmTtX2toOs4Uu25hM3GbzUPoC4DWXQ7+DVZBva1O+NmBZBl3Xv05UcuOgZ8fFWRdd+kW00OlxPcEU6wSvYfFwtqr2mmBjhVJsF1e/wF9125IuxN8nF0FF42t+kDHRDqQ+V/XYZGRf6tqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKYMYY4d6k3hmrRfYGm44xNye4xJQrwmgggn56WTo2I=;
 b=ELha2lsBz/O58JLtNpXKraN/rUDulA4y787kvKfX9m1sTg4cc8G8u1GRT0hCU5OrH9UshdLC7EomJYpwqYTFYhxHMWMqsFfZ/U2gDXRvkyuRhm8mIjictquTgvQUK+q2lO0h608QSe8MwqM5ZqYWxfLLsB57Mc1yMg4mH1sUn9/AGw77rAykgZIckiDeb0z6EYaQ97IHqmi3JOa/gzBKydDBuOLhFCpYRtVUFBQkNY1MSZPsrcDtu0i8Ei1NpNQxiqFzVxUzs/WePmr3my8T1bDpWMaK4XBmqsQ2u8u/NGIiRoQuAsNya/skVZtP1MXNrdRkTkrOnpJrbsXoqmoVAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKYMYY4d6k3hmrRfYGm44xNye4xJQrwmgggn56WTo2I=;
 b=wsGcHW9ePn7awRXKIzi9evm9wTOscJzsjJCXLCy9MfUTFrc1josZV7/ZjQ12hsMwqXaZV8YKKERdpV1A4L+ugZdivabAqeHymbgPdiWc6TU1lAtM+2CKaNQg38W3gnjmeeOQfoKH18WmgGbQosny6hcXFT6clH4vmSIV+bT12xg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ff63a9e3-2816-4312-8e95-7892ecffedd6@amd.com>
Date: Fri, 10 May 2024 11:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] xen/docs: Describe static shared memory when host
 address is not provided
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-8-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240423082532.776623-8-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|CH3PR12MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 522f5f2f-e954-41ee-1a08-08dc70d44552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVAwd25YQkJiWENEdEJxNXJzUEpJMktjaEd6OStvaEVoTWV2TGlzL3lxUVc3?=
 =?utf-8?B?bUlZL0YvdHp3cWxJZHJyRjVNWXhvdkZGSWh0Z0MrNHl1VWdpVXFWMEJPL2dG?=
 =?utf-8?B?cUc2aTQ0dmF4cHAzVk5HMWdBVWwybnZuUDVFRDh3VjJqME92blF3dHo3OWFt?=
 =?utf-8?B?azBUK3JLajN5bStjN2pZZXVtODVUYStkY2NqWjBMMFlDY2JNVzNTNjc0bU8x?=
 =?utf-8?B?N3FaWHJENXhxVlFrcVByZVl0Y2xrNEFSaUwrYWJuN2YwODhLOSt2K05CWkw3?=
 =?utf-8?B?U3NyT2xwUXNHOHJvaVQ0bXhZTDZqY2I0N3E1NCtFdEZHOGgrT1ZDNG9IdXpy?=
 =?utf-8?B?WDlFeVkxTEl2VlBPY3J2eE5Nd29GeDFVbWllRFhwR0drM1NUTUhCNXluS05X?=
 =?utf-8?B?cnJ6M05BbmJZOWxyTHN4MHRwNmVCZWRWQlJQcHJmbTYrNkZGRFZkVXErT1pJ?=
 =?utf-8?B?MHAwSlVtTlBYRERMTndKMFcyVnJENXlsMVMzQXZQREdaRGlFZitjU2taWGdn?=
 =?utf-8?B?V3BOaEJUM3FJVUlvR0ZaYWE2MFBIZnNjVUN0YzdTbmdYVE1jajJvVzFUY2o4?=
 =?utf-8?B?R2hzVXRuTEtvOTk1VjVHRXgwMWNCT0VpRVJPeXEyRGgrSWhKL2VoTm9EMHVV?=
 =?utf-8?B?RUxqQjRnaWhtOWdNUkpCcEtrdytuVlIreVZheWxwQnJ5SkMyQ0NiS3NJK2hi?=
 =?utf-8?B?VlZ2SVRpdlRjZXNiWGZlSnVtSWI2b3A0T3N6TCtJN3kzNkpOb0g1YzVlMHZT?=
 =?utf-8?B?YXVpR2xHcWJ3TWdPQjFBK0JZTHM4RHg4VFhpKzh5d01NVitMeS9iNEx4cjVt?=
 =?utf-8?B?cmRYaG5id2dVNS81c2pHNEhTbkJDZk12c3ljWW14U3R0ZXQrQlBPT1ZkM2NE?=
 =?utf-8?B?Qnl2QlRDZ0tma09BT2c3NTVtSkNYdzlhczdraVdZdnpHSUZuYUFtK0tPOElN?=
 =?utf-8?B?djNmTWhIdGxha2RiQWxCRTJNVnBHOFZqZ3N2ak1jbkFFTGd0dEo3dENVbENY?=
 =?utf-8?B?cFFvUjN0WTc5VWVzVWIwa2pnRmp1eDZVSTFoTWw4Y1plTjkrQ1RKQ1FudDFX?=
 =?utf-8?B?Qys3SnprZHI1Mm9vNlB4WjFjcUFlUVpqV1pTNEZhWlpGNElKR2E5ZFFDSEx3?=
 =?utf-8?B?MW9oVVZXREh5Y2pKQ0o1TDM5Ly8vT3BQdmQxclpMUFhkODl3RTYrellWNzdN?=
 =?utf-8?B?c2wvNS9WajNuQUR6Vm1JdDRCeWJSV2lJcTRzM3Q1ZFNTUnYxNFI2aWttdEZZ?=
 =?utf-8?B?UEdWakJyTzZJUkV3Q01OcG5nNmNyNUt1Yzlad2hzcC81a1cxSHhQaEx6enpu?=
 =?utf-8?B?bko2dmx0TlF4YU8yc3V5R1MwcGJMSXl2UXlJQ000dUIyTW5DZnJieitEbktQ?=
 =?utf-8?B?cmRDSXAyeGZ0MjRWZVJ4MTMyL2JzT1czc1MxWlZrcGZSWmo5V2JucE9SL3cr?=
 =?utf-8?B?TjBvN2ZocDRmNzY3eGQ2ekFUV2F1eGJVbjFuQXNsZ3p5aUZCSXdQUjMzR25Z?=
 =?utf-8?B?ejZOTGFJMU1YcDBEVUpjbC9FWW5sS3h5eUtNNExSR01Mdk9wVk1sLzZ6RDF4?=
 =?utf-8?B?aWRVZ1Vkck1veHU3VEFJeWRsV3dLSFJncS9ORFJYclRDU2FpeUozelFEYlhX?=
 =?utf-8?B?MDdCc3B1VEpaMDEvQ01vVDhsNGNTZG5ZcDVQclhzVzFETFRjSXBqeVp4bXFG?=
 =?utf-8?B?QVhQaWFrOUJJTmJLemZvbFlrdmNQTk5Eakh4eXRyQTVKVVRSYnI0Q1pEY0Mx?=
 =?utf-8?B?b0I5TGlUbElmNHZ1Vm5PekhOckVPVENPc3pIVU9DWTc0N0ZGWm5tTGlkVVRW?=
 =?utf-8?B?YXJSY09oRXZtV1VnQ2xkRzZWOHpIWEhKWW9OUjFqelNUVDZybE83aXFxM2JW?=
 =?utf-8?Q?5iz2x0V5W2Dmc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 09:33:37.7528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 522f5f2f-e954-41ee-1a08-08dc70d44552
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7740

Hi Luca,

On 23/04/2024 10:25, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> This commit describe the new scenario where host address is not provided
> in "xen,shared-mem" property and a new example is added to the page to
> explain in details.
> 
> Take the occasion to fix some typos in the page.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


