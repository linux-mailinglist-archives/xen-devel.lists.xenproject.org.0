Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LxKFxAKi2kdPQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:36:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61E9119AEB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:35:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226201.1532722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpl5f-0000sD-HF; Tue, 10 Feb 2026 10:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226201.1532722; Tue, 10 Feb 2026 10:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpl5f-0000po-EW; Tue, 10 Feb 2026 10:35:31 +0000
Received: by outflank-mailman (input) for mailman id 1226201;
 Tue, 10 Feb 2026 10:35:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBUt=AO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpl5d-0000pV-SY
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 10:35:30 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 372ed5dc-066c-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 11:35:28 +0100 (CET)
Received: from SA9PR11CA0030.namprd11.prod.outlook.com (2603:10b6:806:6e::35)
 by CY5PR12MB6273.namprd12.prod.outlook.com (2603:10b6:930:22::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 10:35:23 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:806:6e:cafe::68) by SA9PR11CA0030.outlook.office365.com
 (2603:10b6:806:6e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 10:35:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 10:35:23 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 04:35:21 -0600
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
X-Inumbo-ID: 372ed5dc-066c-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAkFUKbY5idR9Drc5nT695/sOjQzbURiurzU8erGaVKmchhaDqyjkr/a3YSgNYaY9gQyhWDwS5hMPH5wqNtZpzvdyTmfCmK/mvuNnC27cipamuZiUSV1213zINB0ppCuqdU/Qn8jZl+1+iTBOB23Gp6Co9cLamjDv4YCJ7Quanrcc5gMALDysV2ihO4dCO/zsnP66opT3opgldc6MrKkM1y8BX5Uta49cmu19CIpT2Nm+QGD5PF9C2GmJhgYkDqJoVpZuxvpr+XhSc24toYwSwLUbNy4eFEaKAX/CvmaAab/T1cInQwXW12tKYqqAYUv7NuGFdIxt6rVvR1sIOgbKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNxsh5nfb/KB7K+12vjRkEyauWMl9fgwYWi2mdetMPE=;
 b=URc3ae0FsESjRUdSFXYtfY+iuuGpNMH1iINemCns8B2L3HK/0gan+5/xpirMFG5OghLy1iRTdMVPA6Skd2KaOR9v/PAu0f4AHTpCC1Cgsm8+ELhlKIkMArjNzLBDZwD/T/lap5Ruf3TJrIQvBh4oqXcOnyUelr43N4JnWODcgx3SgMNO5/GCPUWB1/0Q6qiHOZLDgxRgCsGLvXYTwulHHmEySlUQOMnY56gmkiZiaPKwC+wgQM4cXoZp87eXWueFbofFuVYlmlQNdjtxcIGgXlk6SYKgjjG5ed848oZD03XHktmMdvsaZhOUoC5rX60A6+ZTe4NRfC7DkQAA7VWNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNxsh5nfb/KB7K+12vjRkEyauWMl9fgwYWi2mdetMPE=;
 b=BU+WaBUL4s8ma95g1AiqQZYYYbv9HcUiBPUqc9YQqyyoMdAhE4f/28IPJL3mXzABKrsN3CmlKQfAG3DpYG/UgcfjFCPlOS8x2GSbd+JTdrmJdHx6eNgk22+Z4aOeo8GS5MmU2sEUhC84g2VxyDp93cRGXFaKr7cqZZCQ+uIxpVI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Feb 2026 11:35:20 +0100
Message-ID: <DGB7R5PAW92W.390IRWRSC3QE9@amd.com>
Subject: Re: [PATCH 03/12] x86: Add cpu_vendor() as a wrapper for the host's
 CPU vendor
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-4-alejandro.garciavallejo@amd.com>
 <aYrwUj1uaEgGL9hl@Mac.lan>
In-Reply-To: <aYrwUj1uaEgGL9hl@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|CY5PR12MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc95a33-a3a3-401c-f317-08de6890189e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjhrUTh1a0lZY3RlcW1KdDdtVjVZMWcyTERuQmx2TFJXYTJFNVArVFZxOEU2?=
 =?utf-8?B?M3JoeHVQcUJFQmxURitmT21rUDBvaHd4ZDYxcXRGTjBoM25PK0s5QUdob0Rl?=
 =?utf-8?B?WW5lTUxYYTdGNVVFMzJsL3VYQzJYUkdBc2phc3plaU9aU0g2Uk1nbUw1eTE1?=
 =?utf-8?B?WU53YVRzM2FnaDhNMHFkUmRqUEU3ZW52WkY4UnJHQmpNZlhGTjAyKzMvK0tW?=
 =?utf-8?B?SHQrODc1MVF2T3UrVGlhMWJhNmhKUXc3bEZkWjkvNW1JNDcwME91Y1RSVUF3?=
 =?utf-8?B?VUYwd0M2eHBLM0F6M3RoQkNyUVhFSUlmV3k3bENZSzU3ajlVUjZhMnUzRFVU?=
 =?utf-8?B?TTdXTVVyekgyL3gyNWdhc1V0S1NRWkNVOEVtMEUvSnlqR1c2bXdSa2Q4MGtk?=
 =?utf-8?B?NHZkaFh6REt6TEg1MjczZ1lJZVRNMmZURW5GZCtscG9aRm1wTjVRSnBnRHRi?=
 =?utf-8?B?Q1Rrb2lIMlFna2pVNU43MWo0anFEQStYZ3ZnTCtac09ob3VwdnlHRzVuVTcx?=
 =?utf-8?B?SERUV0xubENJVXFkYW9tUUR4aDZNRWNvMUI1S1VFWEdRdnFseVQ3Snp5RzNq?=
 =?utf-8?B?TGttNXBBUEdvQmVBUC9nN3ZQV0psTU9Rb01Pb3E1KzdHaWs1amhveS9nR1dB?=
 =?utf-8?B?c1B5VHFvbjFpYjhLSXpOdlliZjFYN2xjKzUrOUpnd043eVo4WFZHNmd6OHc5?=
 =?utf-8?B?VW43ZGZlcHZzSnZhMjFkKzd1UldUVjlwSDBNb0FPNkpGODllSExNcFMycENn?=
 =?utf-8?B?bXh3NmhEQXZRSWYwcWVkNWZUV0xvYTN0VVNBWkp3Sjh3NDk1OVI3aTF4THpx?=
 =?utf-8?B?bW5hSUVJZjFQL3pyd29kWjhFT09DcFQyT0p5UUVrS1pTZ3NvM1RBcUxLSFcx?=
 =?utf-8?B?NTZOYzVPN1VIYUNWVmY3ZFJXWEczZWk1MEE5a2lXdmtnWmJhYksveU4wZ0E1?=
 =?utf-8?B?M1hGZ2c2OWJvYlorVUF3OXBva25PNnV0MVFZeVUrdTM5RHJpbHAybkJzcGJt?=
 =?utf-8?B?VWRoUVRFOUxDNjhhemVmTVFzREJWdTM4a0pDSGgvSFBnV2J5YXVXb0N2VTlj?=
 =?utf-8?B?YjhUQ0k5WFNnV1FkcnpnVFZOUjMxeUQrVnR5MGE1WVB3L3hSWSt2L3ZhbWtP?=
 =?utf-8?B?Vk1BZ2QwMHErbnlCZDlKMERxNW1mSmJsNy8rRDUvc3lISDE2SzZEd3EvbjZ6?=
 =?utf-8?B?OGRFNmtqdEIxVHdHeWlldjZYVS9NYUx5Wng5M08ybTJWd1NvSmdpbUI4R2ht?=
 =?utf-8?B?ZWFyRUxMSTJ3L0E5VUVoN2d5MU92VVVtazcwSW8xWm4ybi9xTU9JU1JwWFgz?=
 =?utf-8?B?ZEo1b2d2NEZLMjBoSDR1YjM4TjFpVE9sRjhLbFFFUFhFc1VWS2cyNW9iTTk0?=
 =?utf-8?B?cWF5YS8xck4yd1pGSkhqQ05Wd1NkbE8vMzlmZlNIOThrNkhpK2JjQlNMS012?=
 =?utf-8?B?blc1Q1dvQVpuYTFzY21WQVBER3Y5UlV1NGRXOEdlMDdyM0h5eEJZNnZ5dk8x?=
 =?utf-8?B?dDJBRjM1VGkrRTBSWEZRS3lacFJYTWtRdG1mT2RSREMzWllhNS9zd1RaTHcz?=
 =?utf-8?B?TWNzUitWV3VNaFY1SWdNSWl5TXpONlVDVi9wOVBybjNMVnNCWDlrN0Zpb2Vh?=
 =?utf-8?B?OGc4RmFZZ0EwNWYwS08ySndFZnUrcGh5R1JodmZKSUUzRXNPS0FnMk16TE5D?=
 =?utf-8?B?dWNOczFsYmZiYjJRc1RlSWhEVnBadzZRenpEQTF0Sk1rc0ZYNXNFZzZjbW0r?=
 =?utf-8?B?dXdiYXZ0eVI0Rnh0b21aUE9xZUpQaTZHamdWMWFlcXRmSnNEdEhTMlUwUnhl?=
 =?utf-8?B?QnBLRm1vSEoxVmt0TDhnNC9lcksxeUs5LzIwRXIwU3FkOXBTbVEwL0V6WmhZ?=
 =?utf-8?B?Q0ptV3dvdStlU0lNMWs4bTBSK1ZTYThzUS93TG1WdjFqOElNU3ROaUwyRHZh?=
 =?utf-8?B?d291Yjl4VWtJODU0Nm5sV2FBdWpGMUhPdUIycGlZUWhYQnQ0UVAxTkoxcVd4?=
 =?utf-8?B?TWdxOVI5Q1BRb2kvaEtzaGw3OFQ3YUd5S0ozNmF1ei9wRWpmVThVQXJFcnIv?=
 =?utf-8?B?YTQ0TlNIMytuNE1mQWtKdDZKWGJ6eWltVU1BRGJ5MWxWdXRlMWE2cFpKKy8y?=
 =?utf-8?B?anZENlZJRDdEU21jOWhUTjVhZXpUU2Q5cmhGZUVDN1NBM2ExS1BPL2JlV2da?=
 =?utf-8?B?OXdpRm9HekhVNEJiY3BPenJ1RDZtUTNEcGVEL3dtYlkvZlY0QVlvZGVYYVNw?=
 =?utf-8?B?M0N5cHBOOTVZTHI0S2JFTkFhektnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wujdDqd9A9HhxRfyM1CGMccvXv9e+4NlF+mMfcvYQh27N5PEqTiVSR4HUlyQPWv7i2n72sV3VATf7e+YN+VzVzKSQBMm2en8fG0jp6223k1n9EZCLO0LQA0KwtpRXofUcBUHJyPl1k6qXmzPzaAnh294cCTqiB9aml2+z5YRSQVY6N97/0dXcriUUvp4WSxa97pQb4IaLrWCh36b5+ZPyefWwDwcxrzJ4vY6jWAWY8W1zN4vT/7i8XjiGiADcK73WOzV1Ac3KloBNpWoNlltmOAQN5tmePkmnsI4+FjHV+xX8fH8inyu9NOR3LHAh0VXn3pRqsmJyTZw3QhFNRDagsSh03+5fT9wMwMMGe2HBpfSSzmihxI/OeZubG5ghwnfDfbVQBOOkTM5kKFTKVGeXD1Wlnsk9jQHtLa/SMR75+DvonnL8UYWE0eD5zC8eD87
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:35:23.0231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc95a33-a3a3-401c-f317-08de6890189e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6273
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A61E9119AEB
X-Rspamd-Action: no action

On Tue Feb 10, 2026 at 9:46 AM CET, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 06, 2026 at 05:15:25PM +0100, Alejandro Vallejo wrote:
>> Introduces various optimisations that rely on constant folding, Value
>> Range Propagation (VRP), and Dead Code Elimination (DCE) to aggressively
>> eliminate code surrounding the uses of the function.
>>=20
>>   * For single-vendor+no-unknown-vendor builds returns a compile-time
>>     constant.
>
> This is kind of misleading IMO. It will possibly allow such
> optimization for Intel or AMD, but not for Hygon/Centaur/Shanghai, as
> for those CPUs you will always end up selecting either Intel or AMD as
> a requisite (so X86_ENABLED_VENDORS will never have only a single bit
> set).
>
> Not saying it's bad, but I think the comment above should be adjusted
> a bit to notice that such compile time optimizations for single vendor
> builds will only be applicable to Intel or AMD builds.

You can't build a Hygon-only hypervisor with these changes. I can rewrite t=
he
commit message to clearly state which vendors are subject to the optimisati=
on,
though I'd fully expect users to notice they just can't deselect AMD when
building for Hygon.

>
>>   * For all other cases it ANDs the result with the mask of compiled
>>     vendors, with the effect of performing DCE in switch cases, removing
>>     dead conditionals, etc.
>>=20
>> It's difficult to reason about codegen in general in a project this big,
>> but in this case the ANDed constant combines with the values typically
>> checked against, folding into a comparison against zero. Thus, it's bett=
er
>> for codegen to AND its result with the desired compared-against vendor,
>> rather than using (in)equality operators. That way the comparison is
>> always against zero.
>>=20
>>   "cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)"
>>=20
>> turns into (cpu_vendor() & X86_VENDOR_AMD) in AMD-only builds (AND +
>> cmp with zero). Whereas this...
>>=20
>>   "cpu_vendor() =3D=3D X86_VENDOR_AMD"
>>=20
>> forces cpu_vendor() to be ANDed and then compared to a non-zero value.
>>=20
>> Later patches take the opportunity and make this refactor as cpu_vendor(=
)
>> is introduced throughout the tree.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>>  xen/arch/x86/cpu/common.c             |  6 +++++-
>>  xen/arch/x86/guest/xen/xen.c          |  4 ++++
>>  xen/arch/x86/include/asm/cpufeature.h | 27 +++++++++++++++++++++++++++
>>  3 files changed, 36 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
>> index ebe2baf8b9..6f4e723172 100644
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -328,7 +328,11 @@ void __init early_cpu_init(bool verbose)
>>  	*(u32 *)&c->x86_vendor_id[4] =3D edx;
>> =20
>>  	c->x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, edx);
>> -	switch (c->x86_vendor) {
>> +	if ( c->x86_vendor !=3D cpu_vendor() )
>> +		panic("CPU vendor not compiled-in: %s",
>> +		      x86_cpuid_vendor_to_str(c->x86_vendor));
>
> I think you want to print both the current compiled in support plus
> the host vendor as part of the panic message.

The mask of supported vendors, you mean? That could be helpful.

>
>> +
>> +	switch (cpu_vendor()) {
>>  	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
>>  				  actual_cpu =3D intel_cpu_dev;    break;
>>  	case X86_VENDOR_AMD:      actual_cpu =3D amd_cpu_dev;      break;
>> diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
>> index 77a3a8742a..ec558bcbdb 100644
>> --- a/xen/arch/x86/guest/xen/xen.c
>> +++ b/xen/arch/x86/guest/xen/xen.c
>> @@ -57,6 +57,10 @@ void asmlinkage __init early_hypercall_setup(void)
>>          cpuid(0, &eax, &ebx, &ecx, &edx);
>> =20
>>          boot_cpu_data.x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, =
edx);
>> +
>> +        if ( cpu_vendor() !=3D boot_cpu_data.x86_vendor )
>> +            panic("CPU vendor not compiled-in: %s",
>> +                  x86_cpuid_vendor_to_str(boot_cpu_data.x86_vendor));
>
> Is this going to be useful?  I fear the panic here might happen even
> before the console is setup, so a user won't get any output from Xen
> at all.

It is true that early_cpu_init() is invoked immediately after serial is
set up, so any other vendor check ends up being fairly useless.

OTOH, thinking about it may stand to reason to have:

  1. A very early panic in assembly, like that of missing nx.
  2. Have this early hypercall setup nonsense present ONLY when INTEL && AM=
D
     are both enabled. It really makes no sense to probe when you have
     explilcitly compiled for a single vendor.

>
> Would it be fine to allow such mismatch in the hypercall setup, just
> for the sake of getting the console page setup so that
> early_cpu_init() can print a proper error message?
>
> Allowing the vendor mismatch here won't require any extra code, it's
> just the selection of the instruction to use to call into Xen when
> running in guest/shim mode.

It'd be fine, yes. Maybe with a comment noting we can use vm{m,}call whethe=
r
or not cpu_vendor() =3D=3D 0 because the instruction itself is supported by=
 HW.

OTOH, I could also fully drop the dynamic detection logic on AMDLIKE-only o=
r
INTELLIKE-only builds like I mentioned above.

I sort of like that second option, as it allows removing hypercall.S and
hook it to the real hypercall machinery, that at that point can have the
alternatives removed.

Cheers,
Alejandro

