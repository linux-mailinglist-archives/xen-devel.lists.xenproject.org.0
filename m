Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULlPAeb6c2mf0gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 23:49:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E66E7B3F9
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 23:49:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212610.1523647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjPxR-0006GU-Hs; Fri, 23 Jan 2026 22:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212610.1523647; Fri, 23 Jan 2026 22:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjPxR-0006Ew-FD; Fri, 23 Jan 2026 22:48:49 +0000
Received: by outflank-mailman (input) for mailman id 1212610;
 Fri, 23 Jan 2026 22:48:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zLor=74=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vjPxQ-0006E4-5H
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 22:48:48 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac4d684c-f8ad-11f0-b15f-2bf370ae4941;
 Fri, 23 Jan 2026 23:48:46 +0100 (CET)
Received: from SN7PR04CA0008.namprd04.prod.outlook.com (2603:10b6:806:f2::13)
 by MW4PR12MB7119.namprd12.prod.outlook.com (2603:10b6:303:220::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 22:48:41 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:f2:cafe::ca) by SN7PR04CA0008.outlook.office365.com
 (2603:10b6:806:f2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 22:48:16 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 22:48:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 23 Jan
 2026 16:48:40 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Jan
 2026 16:48:39 -0600
Received: from [172.26.188.28] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 23 Jan 2026 14:48:39 -0800
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
X-Inumbo-ID: ac4d684c-f8ad-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLZnwzI5/vS3iVjxpSS+CztygGl7aohWFoffmnxpUjetvL68TquAPiz+p+sDabZwSUcZrpaFstp8/9HCZiL3QD0DjVtYXPvXb7i7bFkih30nCnehFaVG00eoI2dw559VrG5qWyJyzEXL/hxPplkVemxC5WoTjOXCk1RuqGLciNGL8Vi3FW1YIllA7/YGdpv8f8itCT9LuSMF1hphq4B2cUdEhC3FA4q5pDpNnEMBepDf3JyURoIyG+6Il2TK9Tw+Oa0x0+I10AhEk15uwxDffxO6VZ8703mXGmX5QeN+7IXYrWStpVPWbyPZ/UO3LtKvBmtRywJnBH1Lbe1Ss5tJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8G9XEEUnGfL50viJ1aN/Y+zx4YjlpJ49njkZ496xes=;
 b=Engh9nCKaeavcxO+/TdGenmQBZiz8iL5CtZgzUJwHGO92oLv5t61jpv+AeVYrbmngm7H7G9LA5XprvTu33f2X1MckPhlaLkiOP1zCYL5JJKKnmUfIHJo3lzj7bwh+8jTaXkj50NOFsChSydlJ1OdeB3kSaSYCCsjQPuh2BL5tTgvzqAb8iNcRgRRSvTXhW+Mx6MliIsHOFEw5qMzzztyR5CWUKZ/IQinrYMohi3rPddkIjBlmIOX4bsDwmwBHc8NYacGN4jkI0nrPpkdkwA8Gb8m6Pgj+vXd65iiuL9VeNwtH/mTzZLIy0im4JPv6hhCskTlWVspKkHYdXBz6h9OWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8G9XEEUnGfL50viJ1aN/Y+zx4YjlpJ49njkZ496xes=;
 b=h/bvATl80uuo1sv0+ZQ2MBnUuzYwXD0LMDuxwmMRlp0NAuidLvvrVGJJYFiqoDEbmUcLEbAWtMrtQczdsLU+Fh9iPLoCKBcTpUPrrHYIFaRnRldLKYJneGMR7HyGxsVq/CqYwUcg/lH7j5w5S/YwwYeqyhq5ThGBGS83IIK3M8Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <601a1280-6d06-4b12-a89f-9d205a36f4e4@amd.com>
Date: Fri, 23 Jan 2026 17:48:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] cpufreq: eliminate cpufreq_drv_data[]
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ac56e199-7c03-4e97-8238-91d23b0391e2@suse.com>
 <d242f611-b91e-4cfa-b4d6-bebf11b282df@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <d242f611-b91e-4cfa-b4d6-bebf11b282df@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|MW4PR12MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d80831-d984-4e2d-7876-08de5ad18dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmpoaVo5YUFBVEVMSDRsTEROd1Z5OEhtbFRSUHRHWTdYODFzbHVHcnhUenFx?=
 =?utf-8?B?Vkhkby9jZjRONzEra24rRzBjMFBtT1REQktyeEtvTDhLUUJLWUFob0gvT3lE?=
 =?utf-8?B?OVJDaTByYWp1WEF1dEQxNG5XTFhDU3hEdm05U2xBbjlVL0YzamE1UjNYMXEv?=
 =?utf-8?B?WlFGanB1ekt4enFsdjcvZVpkTFE2K3kzZlA0bCtoUjkwY0JHTzMyUDFpSmta?=
 =?utf-8?B?Y0xYRy9IbE9VMXNyZEQycFBDVUtmYTIxRFNXUlROTlNBdjlTbDc2elE5bmNv?=
 =?utf-8?B?THN4cEUzR1FBVXlBZ1NqcUUxeUxRdkZEMzJwSG9ITmpwVnN3Rm5lT0ZMOXl5?=
 =?utf-8?B?K1hhek9ibmoxZ2JRdC9adTQwU2V6UEdWMzZ4NGZReGZSdGlmVXpVLy90UDlW?=
 =?utf-8?B?bWwrdURweHNhYmpldHJMeExBSDN1SFY2S2dsdEF0ZUhFUGN0NGRiYlI3cUc3?=
 =?utf-8?B?ck0yVyttRTJVMWFTUHZLRUkySWgwakp4S1h0OFRxQVZ5em42QnJLVkJNVnMr?=
 =?utf-8?B?UzVuTmY1QStkSXRScGxMd2kyVzlXbUx3blBpeGI2dFU2OHQ3SjlyNlZYNmVK?=
 =?utf-8?B?YllYQ1lmN2dBNDVCdGdqcEFWWGdkTWpYTXdVajluS3BkRytFRzFNNnkrc0Ro?=
 =?utf-8?B?emd2blo2eFdpYWFCWklsWkpMUXIrVmtJK2U5Z1dKY3ZndDV1K3R5QlFQU0xq?=
 =?utf-8?B?eDJBeFd1eUpheXU5NDA0OUZYVXRmbDFaQkpxaEhLYnhBSC9nazBmSzRoT3pr?=
 =?utf-8?B?c3dNR0RJZDRuZHp5M0U2WEg2QXFFVU8vK0IzeWxXa1hscjViOXppM0FRNG5B?=
 =?utf-8?B?TnpIbGx4RjAwV29PTUoxUk9VeDNqaXp5dUIyc2ZTcG5WOGFEcGtZMHpSNFJl?=
 =?utf-8?B?aEtBL0VDbWlsTHFYajlDS05kR09Mb1kxZEh3RTVuVWZFSTlJQ3F6NTIwWmVl?=
 =?utf-8?B?Vk1jbUJpK29mUHozbzFGZTQrL2hEVC8vaFJ2VkdhYjRqeHAramJ6NnI3cS8r?=
 =?utf-8?B?cFN1dGwyVUlHajhIdjBUUDdVOGFVeTlSVkxWbmN5bmpGcWlwb2pBemZXa3Qw?=
 =?utf-8?B?NlErRXVSN1QzUEs0eDVRSUU5TC9KZVo4YXRyZGl6dTRwWVBBTEd4RTI2bGNF?=
 =?utf-8?B?MkNQanQ0RklqcHBMNTRvdWFGTWhESzI3NHFvYmZXQTJ1NFVmRDhKT25pV2Rt?=
 =?utf-8?B?Z1Y3TC9xZVNqUndnUHBoeDZiSHJWSU9GRHBkcUVxZmZCc0ZUVEdtd0c4TUl3?=
 =?utf-8?B?dFQ5U3g5MFBUT0VmalpYMjducURTZlkzNkswNkszSldWc2pOZ0I3OW9RdVhq?=
 =?utf-8?B?NVNjV2hxRGF5d2FHTTg5bFVTZUlvTG9LS2lTUVI1OEtKYko0N1ZYek8wZjVN?=
 =?utf-8?B?VWE2VHlEMnRGc1JEVUhWYi9HZXprK28zYVM4UUpGZkNwc0FuOTNqNzZwUng2?=
 =?utf-8?B?SzEwamFFb1JMYlVWSEhVbG1sTnR1MXNFQlM4R29GSlhObkFsMngvTzlqd3VJ?=
 =?utf-8?B?ak96YlhuLzRhMnNCeXhtT0V2b1dLZzJCQUtvZXRZN0R4Q08zeS9JZU1zaTNI?=
 =?utf-8?B?aExmVmw4Y2NNYTdSZERMYnBINTJTcmUwRlhuMTNQdkRoa09YN2lIVFZKTFhk?=
 =?utf-8?B?dEtIc0tzRytKOEJoUm9oUVJRZ05tTXFMRTJUT0FVZ1o0NXBEaGlIaGkwT3Vx?=
 =?utf-8?B?bkFaYVAzYTBPbXRLN2JtWlpiMlh0aDFWNHlCYTZXZGMranJnelpPRlBPL2Fr?=
 =?utf-8?B?Vkhrb3pndCtZdUFNMDN3Rmx3STc0ZkdtdFZERU9FMjNYZXBRd1VpdnBDL3FY?=
 =?utf-8?B?UXZBbUpab1JaNmtDV0Z3amNhVzY1WWRVazh5VlljTFlkUExKR2NHZzdiclJn?=
 =?utf-8?B?bVl4NTNQczlBMXp1WENqVGR5YnNONFBYa25tRDZNbGI2QmNZdzZlZGkwazB5?=
 =?utf-8?B?ZXZ6TGN6d1UzSGczMVhUek5rV3VVemxEN2VOcEswK2crRFl5eWtzbjd4NDVo?=
 =?utf-8?B?ZmNmbThiVlNvY2U0L3UvaVBQRmhveE9MYWhmRDU4a1E5b1pJRWsydEtPOU8y?=
 =?utf-8?B?WFg5TzJnMU4raTNtRVZwQ0wwSkE5blNmeVVpTG5PbDB4YmVYRldYNnRXb0xH?=
 =?utf-8?B?YVgzdGVBUHNkWXRja1FPUTNjbnRLQXlyYm1mYzA5WWNiWTZlUW03WnhqOWp5?=
 =?utf-8?B?dTZhK0dSbzN2bHRLL1MzZ1NraTlmS0VuZXNISnZWeWZkUi9TclMwcWlMb3RN?=
 =?utf-8?B?TXhSdGQ0azVwL0xBNHY0SlQ1ZnJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 22:48:40.4257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d80831-d984-4e2d-7876-08de5ad18dae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7119
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.706];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 3E66E7B3F9
X-Rspamd-Action: no action

On 2026-01-22 04:42, Jan Beulich wrote:
> Possibly many slots of it may be unused (all of them when the HWP or CPPC
> drivers are in use), as it's always strictly associated with the CPU
> recorded in a policy (irrespective of that CPU intermediately being taken
> offline). It is shared by all CPUs sharing a policy. We could therefore
> put the respective pointers in struct cpufreq_policy, but even that level
> of indirection is pointless. Embed the driver data structure directly in
> the policy one.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

