Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO9UNg1Uc2kDuwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 11:57:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0C374A6F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 11:57:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212143.1523437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjEqW-0005vs-W1; Fri, 23 Jan 2026 10:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212143.1523437; Fri, 23 Jan 2026 10:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjEqW-0005tS-Sr; Fri, 23 Jan 2026 10:56:56 +0000
Received: by outflank-mailman (input) for mailman id 1212143;
 Fri, 23 Jan 2026 10:56:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=btvB=74=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vjEqV-0005tM-3g
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 10:56:55 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37aeb4bc-f84a-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 11:56:49 +0100 (CET)
Received: from BY3PR05CA0001.namprd05.prod.outlook.com (2603:10b6:a03:254::6)
 by PH0PR12MB8175.namprd12.prod.outlook.com (2603:10b6:510:291::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:56:42 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::70) by BY3PR05CA0001.outlook.office365.com
 (2603:10b6:a03:254::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Fri,
 23 Jan 2026 10:56:41 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:56:41 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 04:56:41 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 23 Jan 2026 02:56:39 -0800
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
X-Inumbo-ID: 37aeb4bc-f84a-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGNJalkrDVd9tEu9Z69eXIRSnGFBpsXmsq6vkTgd13Y97NfdDAHueItkwNevUNvN6opokBYBOmTBIqOieOMjlBotDQf/kyjL/NKFHaHTVj3bR9k0IGS0aSv7T3HgfE43Sw1W6RK5K8NZjhaVDTDkBbl27nPrBDYHOQploN7cBp/4VE4HSbud21TUIdeXqaCLrQsnU4CqwdfNVi8zwSxT98pte2V117c0t15HXSt6d4kM3HbXXt+x7V8ugX5WWeIjfu+rGl0dfwH052bDEov/n1jOz7uvyUSIB1w9Ci5XDtmIT7yjdjRmlu0t0MSSwS9rP2xqKA/lnXViHNekkwRemA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETuBIzztLz+MRAMApCAKXauvUf3SmvHpsG4X1wDA1Jc=;
 b=Y7+MSsbR1LX3ElwhKEab8QL5FsrChyvCNbRHuOWNap51uYZzP6a2Py+4DDpmfWPfrNUhyLkNtpOIP6WUCk4jiIRSIVfr51lHjHj4BiCsl87+HbbOjajrLSDOaCuIDk6Vt4rV945BQHUALfU1bsnJ2sZluRc8s6CJUm34y36mZEbQuCSpdkm7id5jaKgnV+Lo+e4IQHCy9m2XL1btE0ucSll8Flx6BUgmJFXcVuWttllAO3Jt+Apcy7odNWiGw9AhN3dHJwdmZmDsGRGCSnPThlSMNEZ1dmGmLq1pcoxozYox+uMvsSYotsDH2vycTqx3/5rJrBRaPO9KrrP+uFxIpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETuBIzztLz+MRAMApCAKXauvUf3SmvHpsG4X1wDA1Jc=;
 b=3Nnht5yYdTCy5PU+RqFrSYRwFuvMQLIGxAthUDcOc+aqoLWQS8ch0cN2Lg4gjCxUusyFpTEu51hdvVpIb6TOHNh1SPPVEK8j68fGQzJKt6HBe1MQuGyuFTVw++XhQFye5DVSMnoIq9hUsoSmjf609sy+sbm8MTOdrtMTVlLss9o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <7024dd52-b209-4daa-94a4-8b966aed4499@amd.com>
Date: Fri, 23 Jan 2026 11:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] xen: Allow lib-y targets to also be .init.o
To: Jan Beulich <jbeulich@suse.com>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
 <20260121154757.44350-2-alejandro.garciavallejo@amd.com>
 <526ef477-0730-4e22-a82f-4c598ad78e0a@suse.com>
 <b7475771-3ae3-426e-9255-d886ec0b2ba9@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <b7475771-3ae3-426e-9255-d886ec0b2ba9@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|PH0PR12MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: c5da4cec-7a1c-458f-bce5-08de5a6e1782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TU13WHFQMkEzSk9WdE9kcVdWYWtOWlAwRnNHSmNRSS9NY0hNQldDaXlFZHpC?=
 =?utf-8?B?N3F0aGpwcE9DakNpZDF4K2kzaTU0UDlxd0dkd0EwNVN5dWlsZmZtdElhM2NK?=
 =?utf-8?B?eTdTU0ZaeTVvZkRGQlp0VzlMSzY0NHc1djF4UWk3bzJnNnlrN3c4TW5HTFFW?=
 =?utf-8?B?Q2tSZVBheE92NFNLd3RSdUk0ajNFN1BNZVZFNWlBMWpGTDVRMmpTNW1XUWpy?=
 =?utf-8?B?a0QyTWYyZlR1TFMwazUrbjFRTkprblA3ay9DZHMxZVY3NFpIbHlsdnoxQ1BJ?=
 =?utf-8?B?NnlDSnAxZ1hoMDNSNkpCTkk1dnFPUGhQL0wwdzl6akVpazFuRUx5TUJHV29O?=
 =?utf-8?B?MHgxWVNraGppdTNNYlMyMU1LV3hDTWxlc3Z1d3o5R1VKVVU0TXdKM2JNZllC?=
 =?utf-8?B?RUdmb0JqLytVVzNlMCtHSldaNDNmQjBPaW1wVExYS3FWVktReUE0TUppUWdv?=
 =?utf-8?B?cksyMG9wc1pVaS9iUDY5QWVIZ3BBa1o5NmJBQzlCdkV5WVVQT1dmNEh1L2Vy?=
 =?utf-8?B?R1B4SW56aDBkbFFIdzdNZkRFVW1nN1I1SGRKM3hPdk92MGdUM2NsNW94eVp4?=
 =?utf-8?B?K1NLM04yZE93d1J6aGdrU1RGT0EvU2FnY1RsaFpWM09uYTBydXhvYzRqZmsr?=
 =?utf-8?B?VzVwOHVaMnZna0xydUd0Y2lQVEVWaGZXZjZaRDdFNFM4ZXpjRlZhRHpaNzkr?=
 =?utf-8?B?THFFa0pIWnZvT2k3azdUYStQRkw4ZWFEakVoejFnZXY4MGVOUEorTHNDaXBp?=
 =?utf-8?B?c2tIRmVBZFZ2emkwbDV6TFFHdXJrNVk2Qkg0WHp6blNTSHNMYlU3V0hpVm9w?=
 =?utf-8?B?YmwxNXdlL1p1anRtWVM2RW5QTFNFVGVNYUlIVTVoZk9iS0hKWTZsRzRXZTZP?=
 =?utf-8?B?RTVSai9NbXF1bXI5eWxueUh6U2ZPRW04ODN2NUFleHh2ZEZPZmhaY2V6L1FQ?=
 =?utf-8?B?VmZFV2JkRG8yK3Ftdnh3c25FRW1RK1ZnOHczbldIekZEYks2eEgrTUJEZmZn?=
 =?utf-8?B?ZUtUcVFRU2NMT0JUNUR2U21ZMjBqWnpBeE1yYVpZUWpKbGpmQ05WR0JhUmxO?=
 =?utf-8?B?U0U3RnVEdndXRG1RbnhvcE11OHFwejRTUHpRUmgwd3RsaWgxZFg3SVIzZFk0?=
 =?utf-8?B?T1BseS82ck1IN2c2RVhybzlPRTZBc2k1NzZUYkRibFhCdklkY2d1aEJiTTlu?=
 =?utf-8?B?d2EzcWY2ZUUxd09kOUNLQ0ZuQ0JSelhVL25MYjNMVVFzYkVkWm9tbkdYSnRy?=
 =?utf-8?B?UkhMQ3VobHU3L3NJa3pRaTcwbHlLd09uWW5yYURSZFJIMzVjU1R3YmErdHRk?=
 =?utf-8?B?TVlXUnJXNUl4M3dWQzdBRW00Nm9UdTNYaFh1VjMyTVMyYkFLcUtpMGJpY3pr?=
 =?utf-8?B?RiszVU1hYmN0SWZtWVpjdE9nOWlza2ttQ29MTnYraVBXREh2cXVra3hNVnJN?=
 =?utf-8?B?cmxpOGI2ckVRNjRlOGVHODNBS2hrZHQ3MHJ5RnduVUdDSmJRajZwSzErajZv?=
 =?utf-8?B?NDAyejVnbWNZMFhHU1Y5bEczNGVxY0Z1OEE4SHlGZ3FxYUIrQm13Snk4UmFO?=
 =?utf-8?B?R0JVejdzVlpWbitTL1R3TVJ5MDBlZVEzZE42Tm83MngwZG1XaUFrWWdlb3Y1?=
 =?utf-8?B?RkRiQXpveEdWY0FEUHRPQktnNHp4eW8yeDErMzQ5d1ZKbkU0N2R0TVpTUkFP?=
 =?utf-8?B?MitRZHZLSHYzUlJEOENSVDJsOVQrMFNIMjNjZXpPUW1aQnZhUHZNSGRXOUEv?=
 =?utf-8?B?elViOXRicE80ZU5SODNBaXF3S2gyRVBWZXpXdUxQeE83S21hUCtyemY4ajRQ?=
 =?utf-8?B?dkl0amR6ZWFyVmR1Zjd6M1laK0srT3VyK2tvNlo3ODgwWnRUS0lERHp3TFNE?=
 =?utf-8?B?SGJxSytHNExHK01NKzVyN0pqRGI4dHMydTl6aVNPalZkTmlqSjFCTzJDQmJD?=
 =?utf-8?B?d1U1dFRxTDBJeHVmWTl4TjBERkViVjFKekZCYTZGVDhQNW1obTFVbmNJb1Vy?=
 =?utf-8?B?d2FDS21KZ1ArdGR3UkdvKzAzNzIyMHhDNU42Vk1taStwZDNSMExUNnJDUy82?=
 =?utf-8?B?NDlMNE1VdFh0bURUQ0tQYmNLLzB0QnB0bmYrUjlPRUlQZUpEcXIyYUhyWGdR?=
 =?utf-8?B?eFBOakVyZjFUait2ZEFFVWk5U2pySi9QdFJsd3FtV05GZ1JaUEZvemdFckMv?=
 =?utf-8?B?anB4dGk2anNadWJDaGJHZ2ZFa05ibUw3amYxZlVoUFZaSDcxdzdHQjRzMG5I?=
 =?utf-8?B?RmFmTkxFdXlyN1JQNkh3dDZJanB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:56:41.9695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5da4cec-7a1c-458f-bce5-08de5a6e1782
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.881];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 4A0C374A6F
X-Rspamd-Action: no action



On 22/01/2026 11:01, Jan Beulich wrote:
> On 22.01.2026 10:49, Jan Beulich wrote:
>> On 21.01.2026 16:47, Alejandro Vallejo wrote:
>>> There's some assumptions as to which targets may be init-only. But
>>> there's little reason to preclude libraries from being init-only.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> I can't tell (yet) what it is, but as per CI something's clearly wrong with this
>> change. Both xilinx-smoke-dom0less-arm64-* and qemu-smoke-dom0*-debug* fail with
>> it in place. qemu-smoke-dom0-arm64-gcc (no "debug") was fine, suggesting it may
>> be an early assertion triggering.
> 
> Or an early UBSAN failure. I think ...
I did a test and it looks like the problem is division by zero in
generic_muldiv64. At this point, time is not yet initialized on Arm, so cpu_khz
is 0 in ticks_to_ns.

(XEN) [000000005019d0ee] UBSAN: Undefined behaviour in lib/muldiv64.c:23:21
(XEN) [00000000501cfc11] division by zero
(XEN) [0000000050211d11] Xen WARN at common/ubsan/ubsan.c:176
(XEN) [000000005023b3ec] ----[ Xen-4.22-unstable  arm64  debug=y ubsan=y  Not
tainted ]----
(XEN) [0000000050afc964] Xen call trace:
(XEN) [0000000050b0e4ec]    [<00000a000032ab44>]
ubsan.c#ubsan_epilogue+0x14/0xec (PC)
(XEN) [0000000050b2f1c1]    [<00000a000032b35c>]
__ubsan_handle_divrem_overflow+0x114/0x1e4 (LR)
(XEN) [0000000050b577dd]    [<00000a000032b35c>]
__ubsan_handle_divrem_overflow+0x114/0x1e4
(XEN) [0000000050b790fb]    [<00000a00003eb9d0>] generic_muldiv64+0x7c/0xbc
(XEN) [0000000050b94539]    [<00000a00003bfb9c>] ticks_to_ns+0x24/0x2c
(XEN) [0000000050bad89d]    [<00000a00003bfc04>] get_s_time+0x34/0x54
(XEN) [0000000050bc731b]    [<00000a000032dec8>]
console.c#printk_start_of_line+0x2bc/0x374
(XEN) [0000000050be7987]    [<00000a000032ef3c>]
console.c#vprintk_common+0x454/0x484
(XEN) [0000000050c06033]    [<00000a000032ef94>] vprintk+0x28/0x30
(XEN) [0000000050c1e4df]    [<00000a000032eff8>] printk+0x5c/0x64
(XEN) [0000000050c3904b]    [<00000a00005548f8>] end_boot_allocator+0x31c/0x548
(XEN) [0000000050c55a86]    [<00000a0000585c58>] start_xen+0x150/0xe68
(XEN) [0000000050c70232]    [<00000a00002001a4>] head.o#primary_switched+0x4/0x24
(XEN) [0000000050c8d2bf]

~Michal

> 
>>> --- a/xen/Rules.mk
>>> +++ b/xen/Rules.mk
>>> @@ -130,9 +130,9 @@ endif
>>>  
>>>  targets += $(targets-for-builtin)
>>>  
>>> -$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
>>> +$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y) $(lib-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
>>>  
>>> -non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
>>> +non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y) $(lib-y))
> 
> ... this is the problem: You're _adding_ library files here which weren't there
> before. Why $(lib-y) isn't here I don't really known, but as per the CI results
> there must be a reason for this.
> 
> Jan


