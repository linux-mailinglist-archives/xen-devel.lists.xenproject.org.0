Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CD5IfomjmlrAAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 20:16:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D80671309EF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 20:16:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229831.1535595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqc9g-0002xI-IC; Thu, 12 Feb 2026 19:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229831.1535595; Thu, 12 Feb 2026 19:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqc9g-0002uK-F3; Thu, 12 Feb 2026 19:15:12 +0000
Received: by outflank-mailman (input) for mailman id 1229831;
 Thu, 12 Feb 2026 19:15:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWH9=AQ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vqc9f-0002u7-KS
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 19:15:11 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24c1c0b0-0847-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 20:15:09 +0100 (CET)
Received: from PH7PR17CA0065.namprd17.prod.outlook.com (2603:10b6:510:325::9)
 by SA5PPF06C91DA0C.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8c4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 19:15:04 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:510:325:cafe::6e) by PH7PR17CA0065.outlook.office365.com
 (2603:10b6:510:325::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 19:15:00 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 19:15:03 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 13:15:01 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 13:15:00 -0600
Received: from [172.24.25.217] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 12 Feb 2026 13:14:59 -0600
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
X-Inumbo-ID: 24c1c0b0-0847-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGpiEpHKSLjnyWaJ04yTdoy/XI8c0+Qk+4RxsJywTCY8+8cvzJDZCK5EdJZTaBEnKyG3vwcSKjaODEl2uD2x7fnw+QFOzWSgrvPnbZueTjIlujIvS9Ttfqlded53XFkJDJfvlAqeKUUMLalA8LP4eraDOvSX9R82b8ocapgYdZ8Ayp0T5EnINNYsqxtHo0FCMDW4Sw2irwCc0o/kldrtSqYxNlnJgplBNp+t5pwVTyZX2KeFKJiDUi0yJ/Jfdg9BT6OwcyAaa3mqpTzd8OpAh7t93HDcy4Nh/I+Ci/bGz4yhi/hfMCGaImu7J6qEM2VEOZLkjz0e4YlU2qmHA3ps4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIhwiN1mnZsoMOWzjxzVrKuppr/KaGrY9g/xEiB4DRA=;
 b=RXUXNcHPUFZIX7Ol0VdFEelcIWlhLQa3lGXg2DOTwQ31lFHuMVLz/CGl9sD3GG2qDX+OAEDC6iiUO89WeYE/Wr7V2K9OytNAf4akjJCKl/MASSoZ5XxlK/0T9T2wBcKM7KyQCU7XAnIgsyspiADvKYt6JhHSk0FV/lm4+8mHkiLNlaUHvpz3LX3r+WRzAQyf5f0lk3mREGMz5q6tDW953DU7t5SXO77LYHN44uc2YAP550ppWIj7AP+Do14PlAOfvBqrf3KIC1PKJghSGm7i8ASa+WeLfTV2CIEngx4oyDZCQwhSiFWlJ/E68Q6BBZYlEjPOVbVt9yb1teFyxJv3xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIhwiN1mnZsoMOWzjxzVrKuppr/KaGrY9g/xEiB4DRA=;
 b=Tii4BKKscgvEPUledu654XL5i75fQRM6PzlBzXZXZEbyxDe5l7yCoOhC6bwrXP9esvxrcAdwA8V7vgcZ1VkHeDx1d9TFC6pswcSuQgR/omoQJ/z60R4Si2+fPIeRhwWX0OQesrbr4p9HApPGpyjG3n5ag9h1PRb+lE3m7WXcx14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <37fd63a2-786c-497e-9bf9-de9ea9708509@amd.com>
Date: Thu, 12 Feb 2026 14:14:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Put wait.c behind CONFIG_WAIT
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20260211170118.109946-1-jason.andryuk@amd.com>
 <73bf621d-0795-4fbe-b926-71be3525b4c7@citrix.com>
 <cb5da09b-66c2-4dee-8cc1-f67f596a3c18@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <cb5da09b-66c2-4dee-8cc1-f67f596a3c18@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|SA5PPF06C91DA0C:EE_
X-MS-Office365-Filtering-Correlation-Id: 6577d237-81fc-455b-e434-08de6a6b0693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUJ5dnBMRGQ1anlFUC9vMW0raEx2WmFYMXh3SzlJc21zNFZpQURQR0RubWc5?=
 =?utf-8?B?MG1pWGtuVUxuZHpuelFOODN1cElPbjlXaEpJdmpFUkxSM1dwNklraFR4ejNF?=
 =?utf-8?B?ejFiRVp1MlhkaVU5elBFYUllR1hVRWl3emlSL0hXQ1dGVDNERmI4cXVZWEpz?=
 =?utf-8?B?ODlCTlEvdXBOb1E4WDY1cVNmWVFJeXNLUU0waW9EWjFoemp4UjliU1l0dnBE?=
 =?utf-8?B?WG9OTXhLT0ZIN1Yvc0w1dHR5R0JCRGZpdGs4TWZXZitIbkFaTjF0aTRUcC9z?=
 =?utf-8?B?aVdnQ2dMR0hpTEtJb242ZERkMXBOWEpCVFlmSmpHbGlUYUduQStGTFVNbzRV?=
 =?utf-8?B?SWFudjUyaExKbEo5aFZWRXZlbStEamk0QkVKTVdWcU43dnZ4RnVLRU92NzAy?=
 =?utf-8?B?VmJCUmhjTGlmMlJORHlqYmtzLzFGbDNTaDdXaVNYWHFvM2JiaVdpZ3YrZzB2?=
 =?utf-8?B?S0I0R1hzdnJLVFZMbHJ6bUY3bmdJeTZZZzFocFZod0ZVTnhiVzh3UHJ6NWNU?=
 =?utf-8?B?YWJIZXdibUx5b3NUeTZaNGlNYXJUczV1OUNLSXdsT1h1UDVNWjlJZmh5WGxO?=
 =?utf-8?B?cFVkZU9OUkUxZlNEM0JDVU5XVm5FdithcStsc1NCN0U3Y3RrOHRsZ2xaeWY2?=
 =?utf-8?B?TzJMQ3ZTRXZiZlUvalV4a2Y3QkM5WEJsUWhKRkhRSHRFYXorVHZyRExYSzVo?=
 =?utf-8?B?bFA4LytONjgxYXZnTHVsSEYrRE5EU3dad01BeDJEOGh1eGxibERhQ0FGR3JH?=
 =?utf-8?B?VlE2cTl2R2NHR3lBQU1BRGVTTldxeXRPSlZEL1NLeEh0dGYxMUl3MnJJYWZG?=
 =?utf-8?B?OVFpaUZ4TjdOSE16ZlZZYi9VMUJZMjJGOVpnUWlMa0hXUTJjNjQ2djgvMkRV?=
 =?utf-8?B?bU5pdHk5OW1uK2RJSjNubDJ1RkpLT2R4N3U0UlRkblp1MnM3dVZCdzZRL1dG?=
 =?utf-8?B?L0R2aUIvcWYvYW5oeGVpZFhnOCs3MjRTQXpGdGlqVTM4ZHdscVZnMWpGZ2d4?=
 =?utf-8?B?d2JrbEtvVVZsZmRwaTNyWXRLNklxQ3U3S0NoRXQ1dEU1NHdDMm96elBRbVNB?=
 =?utf-8?B?MlNCL2l2bkNObmtxcVVpbkpoZk9ubHpLMTVXU2JOKzNVR0tCRDFhZy9rdFJs?=
 =?utf-8?B?VDhrUWRvczZWYURndnZnaHNjdEttNC95bUVrS1Myd1A4Ryt0QnhoMzVVL3FR?=
 =?utf-8?B?bWttV0ZndGFlYlo5Q0lnSkNzejl6NVVQamxWVFFSOGk5UW9tcmhUeGo1QW9R?=
 =?utf-8?B?c0hhbklDaUpaTTVhVHQ0NzlLNWp3RnVnZGVHSmN1UE4xTEcvRGxPZ25PcHA5?=
 =?utf-8?B?YXJGYThzckpFZG9BeWxEcTJkTTFuODJRVmYyK2F3dHgyS2JkQU5FUFJpeGNS?=
 =?utf-8?B?K0JqZVZIYnN2Ri9kVTVseGhOMmkvd2lTRit3OXZsRldCSWxJNUc5WlhyVTZ0?=
 =?utf-8?B?cW9saFRRTEpiWTZUTHVxWTJWRmFFV0Mxd0pUdVJqUUVWSDNqNXpLRVM4MEM4?=
 =?utf-8?B?UUJ3NVk5SnlLOVRpMFJCVHBJWHJKUUd2aGl4U1p4RDFXSnpqZHZHZXhnSGVN?=
 =?utf-8?B?Rm5VZTJ5NDQ0bWcyeE42UXBhL1JWTjJVdi84OFR6Mld2SDV0V3g5dlVqdlpn?=
 =?utf-8?B?elZ3eEE4MnhNRHdRM0VLbHZqZXVyMXROSDd3LzNZS2hkTGRnUFBLbXFubXhm?=
 =?utf-8?B?NVdWdURqQ0l3cEx4dWRPM0YwbmhHOERDNzM1R093RXVxTHBhdjltMlllWWxi?=
 =?utf-8?B?dTYvUjVoRVcyUW5FdWxuYlFHQXI4Nm0yOEtIcExZY3ZUczBTdExSOUZFVnNS?=
 =?utf-8?B?RkxuMnRUQlZrQ3FUVHE4MU9QVG9xYlZTek1oWm1aNU1ZM1RUNHFrcW16ME1B?=
 =?utf-8?B?M0I3ZVZtc3MzMjFlR29zYXZ0aDBJcXo4M2cyQnBrNzl2NmduZGJZSjhMRDk4?=
 =?utf-8?B?ZnNsOHFIcy9kRTAzeWJXVVRsZXVnUHNrbUNuN1JhSjFJUFNwY2Q0OE5NMU92?=
 =?utf-8?B?M3laU3RxMkVRT29TVXdHK2F0cXZDTnpDTERpSmRYVjY4WHFJbjdNRmU5dUll?=
 =?utf-8?B?V1hLM3NFVGJRQnNQWnhkUStQSUVXbmdGd1BhbEVFTGMxZ3BiYlhja3M0bWpD?=
 =?utf-8?B?cWZESXgvSlJJSFRjcThqb0dRVFJkMFVqWStBQnB6bzRiN2x0WDhIanNrZ0pJ?=
 =?utf-8?B?UHlHSnRFZm8vOXVEbGxGMnRQUnhqYWF0VGlCcnFkS05tLzcyV3AybEJWVllO?=
 =?utf-8?B?VGxacUVPUW8xY0JTemtDbnJvcnh3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O1LjFUPaCAYCL2OMX6uParAVAke29eF973w6lEC4t33i9ICyreO613jYlxmJ6xC/3pESNYFMC36VzzL1XrgAfSObHh3Ca2IYf75j6AUopXZduIEqhk8eANp54GTWG4dcFzDUzo95jzv4AWCTNiO9GkmMdNEp1nYWDM3f/PO5Kl2W6tc8Q+nfH6TS1m0Ge6wubpHYUFANFipkAh16/lu3mjy9YobEk8K75coJndPDD4dWfCVLlidT1MaBqbKDJAee4q8kk/7llci3mvemg/L4edOu2eWc6VzWfLNhYUOG5282OvCFNFIy1p+yicfrK8kV7aiA6k5e2HKe3szVYvUhstgO1AfKKZcVSMhXfOq7uuFXaLhA8v97b4M5GJCBFPVq8VIKq4KWStyNYE1P6xt9KHDD9bRQl6GbE2cMdP5iN6oegd8nziGc9YtJJVdVJVrk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 19:15:03.6724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6577d237-81fc-455b-e434-08de6a6b0693
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF06C91DA0C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: D80671309EF
X-Rspamd-Action: no action

On 2026-02-12 02:38, Jan Beulich wrote:
> On 11.02.2026 18:30, Andrew Cooper wrote:
>> On 11/02/2026 5:01 pm, Jason Andryuk wrote:
>>> wait.c is only used by vm_event.c.  Make CONFIG_VM_EVENT select
>>> CONFIG_WAIT, and use CONFIG_WAIT to control building it.
>>>
>>> Provide stubs of functions called from common code.  entry.S needs an
>>> ifdef to hide the symbol from the assembly.
>>>
>>> Also conditionalize .waitqueue_vcpu in struct vcpu to save space.
>>>
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> I'd really rather see the API/ABI changes required to purge wait.c
>> entirely, but I guess this will do in the short term.
>>
>> Two things want further thought.
>>
>> First, because ARM uses per-vCPU stacks not per-pCPU stacks, it doesn't
>> need this infrastructure in the first place, but it looks like it's
>> still compiled in and half wired up.  I suppose you don't notice because
>> you compile out VM_EVENT on ARM too?
> 
> But if we want it compiled out altogether on Arm, ...
> 
>> Second CONFIG_WAIT isn't great name because there are many things it
>> could be.  I'd be tempted to just reuse CONFIG_VM_EVENT and go without
>> CONFIG_WAIT.  I do not want to see any new users of wait.c, and it will
>> disappear at some point.
> 
> ... don't we need a separate kconfig control, for it to be selected only
> on x86 (or for it to be dependent on x86, and then imply-ed)? Imo
> CONFIG_WAITQUEUE would be okay, as long as it won't have a prompt. We'd
> then simply want to prevent further select-s / imply-s to appear.

ARM VM_EVENT=y won't link without wait.o.  Undefined references to:
wake_up_nr
prepare_to_wait
finish_wait
destroy_waitqueue_head
init_waitqueue_head

So I think that points to re-using my original patch, but with either 
CONFIG_WAITQUEUE or CONFIG_VM_EVENT.  Since CONFIG_VM_EVENT is the only 
user, and we don't want further uses, I would use that.  But I am open 
to either.

Regards,
Jason

