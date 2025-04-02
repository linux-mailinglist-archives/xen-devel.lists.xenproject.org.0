Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE5DA797E2
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 23:55:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936114.1337428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u063b-0005DJ-Ch; Wed, 02 Apr 2025 21:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936114.1337428; Wed, 02 Apr 2025 21:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u063b-0005AB-9d; Wed, 02 Apr 2025 21:55:35 +0000
Received: by outflank-mailman (input) for mailman id 936114;
 Wed, 02 Apr 2025 21:55:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MBi7=WU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u063Z-0005A5-Oa
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 21:55:33 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20606.outbound.protection.outlook.com
 [2a01:111:f403:2415::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3145214a-100d-11f0-9eaa-5ba50f476ded;
 Wed, 02 Apr 2025 23:55:31 +0200 (CEST)
Received: from SJ0PR05CA0145.namprd05.prod.outlook.com (2603:10b6:a03:33d::30)
 by MW4PR12MB7213.namprd12.prod.outlook.com (2603:10b6:303:22a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 21:55:21 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:33d:cafe::4f) by SJ0PR05CA0145.outlook.office365.com
 (2603:10b6:a03:33d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.8 via Frontend Transport; Wed, 2
 Apr 2025 21:55:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 21:55:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 16:55:20 -0500
Received: from [172.29.45.113] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Apr 2025 16:55:20 -0500
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
X-Inumbo-ID: 3145214a-100d-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfmSzq3/d+MjOcBYgOSYnjcAY0KRQXM0HeOtSIvjmLESSF2siXBfci2zc0z6/VTi6+61FpJ5B+LDeKZ64uk2nWRpo3/9tLBUI+fkUs7BRlERLlzfmvDRlOfEDv7yrOZTYx6xPnfkslBYGJKpvLrYLL2rmQHi3HlONoMaP/Klh+Pbi/aCnbIS6eO57M3pElT2Rib0EUXg0i/Q5v2fW1HzrMt8YzkBenuJb6n0TwS3j/fYYdxv32j5JicNp6aX6d74WSeN6DVVjjLDV2DhnRMONysVzxYH3rI7f4old4imNXTYIIO+Vo1qMNLMNOwJ6uwCvq7IFGsWNYsDnIxcuykLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8ctBpHNFFMT1QP7LGDbdwdOg3Jv+XMTGHOUx2dBDSA=;
 b=kLJNOQR4mqB/0sf7//cHGQmd1UkS4KWBGit1/32wvBaz4Bp3ZXD5HPI64Lgf/VX0+bKeQiDk8Jfi52VgpygIybemqci2Jlk2u0Cm8rpHGHT0+asHH7Q8Rh/4d28dE9AG5ZBSBauOw38VQ0eUIYcijcXnWCJJPLvF71Xgkl/LYMEodS4I5gCWWOym5VCIAYnfEe1qM/agq6H2Mk8td0zLL4Jy2xIOw9p5e4WvQRL5tNOHoDkVzgF8bfXBsmFL0Dyj+/reDBC3Xzulz1h4Ll8/9hFqT08NGgvQPUkTqjJMaC2tPVwxSK5YmD3y0ZUuaj6xJYe2XSCbLYlcDglgKjnW2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8ctBpHNFFMT1QP7LGDbdwdOg3Jv+XMTGHOUx2dBDSA=;
 b=ON5vF9i6qhLk7e2dRe4sdzNAlpoHGfd4RhsZucq+MzbJqX2+eKG/+iBcCARzvCifmHrt6wXLOFxSY9g1YhHWlY3gOsDnSvE8l72mPpTMlDDiBR2YVsrNTZ7R3rZEDW8Tjkk8h/1WhyGXlJsJrI0a5Swh2yIh0elk+S9RcANNdTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <eedcac2c-3f19-4417-9da8-a648f36bec3e@amd.com>
Date: Wed, 2 Apr 2025 17:55:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: re-order .init.data contributions
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <b0266c19-d0e5-4de7-b2fb-a50e2766168c@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <b0266c19-d0e5-4de7-b2fb-a50e2766168c@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|MW4PR12MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f88e95-fa74-4890-2fa2-08dd723110b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3ZuaFowcnl0QVlrMDJQdWVMV1NWWWtEUEN2THVDeDJIc3ZPMjU1SnNhSnUy?=
 =?utf-8?B?N1pUYnFvaXNDUlk2ZEJETXBldzF5VDJEdzhpVFJYcjV2LzA0VGNybFhic3A1?=
 =?utf-8?B?MHRMb2lJOGNWRDFxUm1mZTBVSUFweWtPQkpXSk1WWFB6bHp5eHlsNUNzKzRC?=
 =?utf-8?B?d2hUaWQxY01seFZ4MTNQOHQydFlscmlRMXJVODNJMDRYeXplWGtTRW5lMkZK?=
 =?utf-8?B?emZQVFQ0U0g4STc2QXpyaE52TUJCN3pVcjk5WGZ2RmZCd0JKZUdmUjN4dHdD?=
 =?utf-8?B?RGJBWUZuUkhNRXdhZzdRbkR4eCtmWUxpVkpCRnpWcmUrV3lwcWhiNjBjZXYy?=
 =?utf-8?B?ZHBxd3Z1eTZMQ1gwMmp1MEJ2WndncmlhZ2U3T1dEeXJKVEZ0T0s5U1BHNGdF?=
 =?utf-8?B?QXIxL1N5RnJyNGVKTkZZMWdIVU5rZTVMdzVXSExEdDkzOVFHM2FOR2NTcmtp?=
 =?utf-8?B?WWFNMXpFVnZZREtVaUViUWtHc1hIajdFYVpCZnpRamk2YVIrK0kwc1o5N2lU?=
 =?utf-8?B?cGFsMVdvWkNIVGo5SFFzRStWV1JuN2pQQ1Uyc2FuaEIybStSYUowRCtnNytL?=
 =?utf-8?B?OVpVWWo3OVBDRFpLcXBaYXFCMGttc1U4M3VGZHUyUnJaaTE4bldMQlZCMkJ4?=
 =?utf-8?B?alVUT0U2dVJqVmVVQnFQd3NGS0d5N2QzaTF5VklhR0ZndTNyNmlkclQzTWpS?=
 =?utf-8?B?TkNXMUl4RE5DNm5YSytwb010bWMxeXpsTlloU2FYRXMvNUlPbFlpMUo2VnFq?=
 =?utf-8?B?MC9iZW1sMmx0UDJqVWRMWjV3Umo0Q2xhWnhDTUNESXg4WlhWTG9Gc0tiY3J0?=
 =?utf-8?B?a2pUa0RJcHRGakhvM0VjMXZpU05XWlcwNVpGcW9aQkdPdlJHSzRORXNZVVZx?=
 =?utf-8?B?ODhwdllUQURJcDhHdkRINGRTUjdnNXg2aHh4TXJGZE0vUENIT0NNOU9TYTFy?=
 =?utf-8?B?Rmx3b2FUTUV5OHBDK05TOTRDbm55enFNZlF3WmlFRHJQckdsYU5JTzNUaWFp?=
 =?utf-8?B?a2k4YnlvNFNweTM0bHhOL0NOQXZDRWpXOWhlQVZBNC9IQ3RHTCtnTUN5K09F?=
 =?utf-8?B?QU1xOGEvWDJwOXVnYlNPaCswbG9NK0ErNlBYdWwydDAvZStPdThONERvUTlQ?=
 =?utf-8?B?MFo4bE83L21vMm9iZjlsYnAxbDJmVlhQTmdhRWNZSjZVMjRzMFJvK0x6OUZz?=
 =?utf-8?B?dHBENmJCUGJxVW1ON3pwR0VkVDdreFRnSjhiYVdWb3AwZlYzZ0RURDNrbXVZ?=
 =?utf-8?B?QjkzYjJ4TzlpRFVncC9XUk1ZMmV0WkNhR3p6S2k2SmQzZFg4YTU2VGthckU1?=
 =?utf-8?B?aEMrMm9CeEY4MHdDZ2VyTUxFOEFqRVhIVlpadTh6ZVZCcFVQMUFGSktLQXFo?=
 =?utf-8?B?K1lIUk5ENVoyb21oL3ZJL21INEJxaFlKV29TOGF5MXJEUS80MWlFN3U0azRo?=
 =?utf-8?B?RFJBSVVWeUd1ODExd2ZGU3ZDd1lSSDFmcE1MZ3lnWnI3YUoybDlRT00ySGUr?=
 =?utf-8?B?K1loWWk0LzhHNXhaSzFYclpoNDhLLzgwZXdKcTBEZ0N5RDg1eWFRdlJQVHFV?=
 =?utf-8?B?VFljN2JsdjFVYlNYQ1NzVm4rY1lIaFJzRW9kcW4xbmR0VktJbjJtQm5oVVVZ?=
 =?utf-8?B?WVhxVkk2YnlvSVlXeHpQYmJ3NUJ4RXFtbnpGSGY2azE0Yk41QndKYkdwZWJG?=
 =?utf-8?B?YUxab3BkQkF1QzVRQWxnQ2xKcStSdVZCWEhlbHhxWGdVK1BETDRuNjF2Tjls?=
 =?utf-8?B?Zjg3V3ZLWGJ5cjVFcHFkZXczSVRZaUhTd2t1UVZaelZrdmU1QnUxL3FQY0E5?=
 =?utf-8?B?WmhzWGpxbU1WaXpxOElYN2VHMFdCYmJzaDhjem1OWkI2amlEY0hRY2sySUFk?=
 =?utf-8?B?SWVpeGhUV2VhRXZHK0ovZFpsWENyeStPRC9odXhwZ1dWTnd4WlRpVVBWeHlx?=
 =?utf-8?B?cC9Pa0Vic1ZCdUZ0VlhwVVpXNTJ4QUxZekdVVWtUaWdUazQ5dU9zeVhBc3lj?=
 =?utf-8?B?MTBOekp0bldzV0F1azRtQk9BME04THdWanpvcDF3WlYwYWZ2OTh2bzlpOTRa?=
 =?utf-8?Q?f4bCFM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 21:55:21.4764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f88e95-fa74-4890-2fa2-08dd723110b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7213

On 2025-04-01 01:56, Jan Beulich wrote:
> Putting a few bytes ahead of page tables isn't very efficient; there's
> a gap almost worth a full page. To avoid re-ordering of items in the
> source file, simply put the few small items in sub-section 1, for them
> to end up after the page tables, followed (in the final binary) by non-
> page-aligned items from other CUs.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Seems a little fragile, but I don't have a better suggestion.

Regards,
Jason

