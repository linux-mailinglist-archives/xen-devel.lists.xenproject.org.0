Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16D6CB149B
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 23:26:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182267.1505167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT6AS-0002k6-6O; Tue, 09 Dec 2025 22:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182267.1505167; Tue, 09 Dec 2025 22:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT6AS-0002hQ-2n; Tue, 09 Dec 2025 22:26:48 +0000
Received: by outflank-mailman (input) for mailman id 1182267;
 Tue, 09 Dec 2025 22:26:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snnK=6P=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vT6AQ-0001tn-L4
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 22:26:46 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24114655-d54e-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 23:26:44 +0100 (CET)
Received: from BN9PR03CA0337.namprd03.prod.outlook.com (2603:10b6:408:f6::12)
 by DS5PPF1ADAD2878.namprd12.prod.outlook.com (2603:10b6:f:fc00::646)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 9 Dec
 2025 22:26:40 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:408:f6:cafe::b0) by BN9PR03CA0337.outlook.office365.com
 (2603:10b6:408:f6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 22:26:40 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 22:26:40 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 16:26:40 -0600
Received: from [172.29.90.244] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 9 Dec 2025 14:26:40 -0800
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
X-Inumbo-ID: 24114655-d54e-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acwrelenQp7b9nWbg82yUa5Z9QIL5ei82zTnxGJxotP2uyYaU9H6plprFOx/+XvreTp7Rkus3cWWfGYseCrh0vSxKU20vndEHmgWHSOrZLlqNhK3b2pUSXXPxG4Qccl/FqOcgsrOX18fCTnl5VE9vgaiNbDguhxq3XJqRmlCJhmB3W+DMxZEdhtxXi+gzY8KXDzydV6bOJTevUlc0cSjBXq3b9oRKWiKhACeQ/0On4gBBtqP9LmWz3FuTLGjZwAPzyDtww6e34ZbJ/L2HnqCie4LNi7GvKeg9j/fxGakfMdhqrxpVCrUOnHHd3sO7t2QSVmU0Envi+tQk+VLjr0HGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lm9KFYVpR+EURylQxp6M8OkqsOcs4Ssl2qznxaDHtDU=;
 b=mU0TE/ydXYyY4MeYTCCJlCI9UMbPTy43hyfkxqrusiIiW+an3eHCEpYez9mod5P+EeOrBSQwN5UOEgxvzokBZdLZw2BHgp4GVOR70t/OWptZhVvkAm+/h5oJ+pFrYm/zuxefmuzqHJbW3fyn/SdB8x9o0AXsi3/nq82p/VADMySpklpMl/8+wW9aWzRnaYJOknH0vb+lowyTZW3qXWRyUWMLPmsmdYuWfuy4IpnjL8b6T8c4z5R3ekuyrvJPdG77Q5rFg0VVibAn5j+m8g8ED5+qdPewn6INek8wrG8cFpq1uCJWqvjykM9ofR2EJlcjsBqAnaF867w+/KLLAP0roA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lm9KFYVpR+EURylQxp6M8OkqsOcs4Ssl2qznxaDHtDU=;
 b=nLo/eYcB+xKoRr05KqRRF0ZYjNz+Zf340Fo2oBYhH/3llwHXTxNPhTMKsODikEyujTpZ7q3U9njanLfAJJ6/3xt0eE4q6BtlYF6lAUsFMzClTiS1Fx+2aMkusyDdK2wdGyrBr6lXcn1aNWPdGWOlD+IVszsK/vFSvrfe99vK/5c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <0168574e-1b3a-4a3b-8284-7745b06d3ee3@amd.com>
Date: Tue, 9 Dec 2025 17:26:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] x86: rename ARAT feature flag
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f0ac75c8-5d65-43ef-aeeb-78d34f1da470@suse.com>
 <480b4638-31bf-472a-8c99-70d912bccd0f@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <480b4638-31bf-472a-8c99-70d912bccd0f@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|DS5PPF1ADAD2878:EE_
X-MS-Office365-Filtering-Correlation-Id: 5734c652-5c2c-4348-c00b-08de37720668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjRsaE4zaXk5SUtQbkp0ZVZBaTFDWlZKZlZiZmdQaGZoNFN1YlZKbG5PWVFZ?=
 =?utf-8?B?SkJ3WjJveFZ5NXcxaE1XZFBpVXlOYWQ4eXk1blEzQVBwU1QzdDNjT1U3QWE1?=
 =?utf-8?B?ZzFkSG0rR05WS1drcDF0Ukw1amVCd0dMRjBRSDUxQU5Qay9TQUlETkdpQmIx?=
 =?utf-8?B?L2RpNFJLd3lpS2h3dHZsWXpFSVNPVWQ2czA2TlZkL2tIbzdTTDhNM25CUHRn?=
 =?utf-8?B?Mmp0NWxRZnR4blVmSlZ6a0N5aVYzK2srQS9RdjNxSExqSkJEZnpBbFN4LzMv?=
 =?utf-8?B?ZG11NHl2ZHcwKy9vWGRqMDNmWVl4bDJwcUlhajVmODJxM0NmQzJ6TWkxUDBC?=
 =?utf-8?B?VVZxR2V5TXlqTG1WSlVCT0ZzaXBHZjBaRXFZOHY2YWUxQlZVTXpGK2ZHdFpM?=
 =?utf-8?B?YjhIRXNTSGkzVUZoTjUvTHkxYTVUWWtGTkF6UFlNek9YNUd3ZEZIZ2dza0Mx?=
 =?utf-8?B?dWRkYThDN3lkVmhnSng5UWwrUmdveGd5Ym5lTkkrNDR5M0xGc1NNbUNiejhG?=
 =?utf-8?B?ZW1rS2dvODR3SWhiaTZtRDN2Umx6MWdibUdxbzJZVjBuekRXQ0lHeFZMVGNY?=
 =?utf-8?B?MjZXVFFoL0hybmhETzBVeHpQSy9uTkJtekFuanVMRVJ2RXJoMVB5VE1hYUNC?=
 =?utf-8?B?dkRFbk9oVXpTdmkzWE9td01sM2NYVWQ0ZUxvdXBYTEtJdUNZRnVXMzE4a3hM?=
 =?utf-8?B?bVVoaXk5YXNjc1J1OHJNUjRyKzVFN21oMmU4VlVZTUxkY1JyOEo4SWVYeVJH?=
 =?utf-8?B?MlNwdkczVk1vMWFXMk1sMTM0L3hxYVhkRnUvTjEwQVFDVDhibDNUQkF6dGlN?=
 =?utf-8?B?NXNSY2xVWGErUEw2dVNMa3c2MWVCQkhreUtmSjVNSGMzYXk3dGwxcFBJa0VM?=
 =?utf-8?B?cWkvdWhOUzdlMkV5aHZuMU5lZnJPV3BXQmY1cDBZdFczaDl3R042eStvNHpE?=
 =?utf-8?B?YXI3SW9mbDU1YnJweXpNRStDTmxjTU1HWlVHVGJRbjdDNEFIbnBUZUo1aHpW?=
 =?utf-8?B?Q0lHZk9FeksyRStxVmxma1Jlby94dU5wdzQvMHpkMUV6ZGl4TTY1bzNOa2dB?=
 =?utf-8?B?aUlSWUNWbVVqMFM4TE9TSURxQS9zdy9LcVhXUUJNSGtMcGNrek91Ulp4bUtx?=
 =?utf-8?B?Rm1NRjJkYkpkeGxxVDM4K2x3R1ZYekhUblA2cWR4VlFpVmZJTDgyUkMxQmov?=
 =?utf-8?B?RjVrK0dxZ25vZ25Eb0lqa2xVUlQ1UGdLL2lnZU1QUHdOOEdHQ2x0S0oraFZM?=
 =?utf-8?B?dHhYL3Ezb1JBbEhjYmRRUmp6Z2tBTVJxRzJsVXNZc0NvVTkyN2VPYWxLUmF1?=
 =?utf-8?B?K21GM3JSelBHdU5NTXp2TmFBSWg5ekZZUHJySXpvdVRyNDFPS1YvTENBbHd1?=
 =?utf-8?B?RnoxcitIVHZFZ0JmVkdLS3hxYmNFSGwvOVBsaTZwZG5RQjJvRnVVaUhIYnlF?=
 =?utf-8?B?NXlkM2h3bHc4MEVlMnlKVUt0ZHo5dTVrUExrV2J4L2wydVpPU1Y3WTJzc3Vw?=
 =?utf-8?B?M2dwS0dSem1xVUpyNXcvWXJFN2N5ZUd5UjdLekJuek1MbVRZRGp2dFJVclda?=
 =?utf-8?B?T08zMXk0Sk8xaWlaeVU5SCtLRkRYVTF5N2Rnenhxd0pyTDVvSmJ3N2Z3U2lw?=
 =?utf-8?B?WDNZQlViRllnODRFVXdTREpmbUhtMlZ6cDdOUUxoYmJKYThCU0hVZG5yQ0hV?=
 =?utf-8?B?WGFuYU5scXVGWG84WTlxUnh1cjhmRHpWWURuZWRRSVU1ZE9ZZzJJWUlkRDlE?=
 =?utf-8?B?aE9GR2NVVzI1Vm1wUTgvOVRKaFUyOGt5d3pyLzdHM1VQeENDWTFxOTBXTlZw?=
 =?utf-8?B?ZFRHSHR5SjFuRmh2UXdRL01RMFVVRHdPWk9NQkdLS2ZKRGJzNmFGZHVwa0ZU?=
 =?utf-8?B?NEpFOW9UUk1KZTVTbHhJRnZjcW03bmQraURQeFN3MktGNVRnRUJURGp6VVRq?=
 =?utf-8?B?cW41cjAxUkpkQ0F0OUpmZE9sNU1DSm9QYXpqQldGNVl2V1pyNStMbFVWZElq?=
 =?utf-8?B?YmtjMDI2ODRlS2JvV3EzbjdaWWZRRUtRM1RrZ1ZQYVl6S01hd3ppSFl5WC9s?=
 =?utf-8?B?RFZVaFJxdkcxREJOQlRLelBEcGUvcEhxODBlcXVab1hyQlRqaXBlOEJRRHpE?=
 =?utf-8?Q?guB8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 22:26:40.6061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5734c652-5c2c-4348-c00b-08de37720668
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF1ADAD2878

On 2025-11-24 07:24, Jan Beulich wrote:
> Add a XEN infix, to properly distinguish it from the CPUID feature flag
> (leaf 6 EAX bit 2).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

