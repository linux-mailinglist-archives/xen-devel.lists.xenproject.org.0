Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BrzKXnljWms8QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:36:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA4312E48F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:36:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229095.1535104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXnp-00083P-Ag; Thu, 12 Feb 2026 14:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229095.1535104; Thu, 12 Feb 2026 14:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXnp-00080G-7T; Thu, 12 Feb 2026 14:36:21 +0000
Received: by outflank-mailman (input) for mailman id 1229095;
 Thu, 12 Feb 2026 14:36:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRx/=AQ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqXnn-00080A-Nl
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:36:19 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 309ad7c7-0820-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 15:36:17 +0100 (CET)
Received: from PH8P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::25)
 by CH1PR12MB9670.namprd12.prod.outlook.com (2603:10b6:610:2af::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 14:36:08 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:510:345:cafe::45) by PH8P220CA0005.outlook.office365.com
 (2603:10b6:510:345::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Thu,
 12 Feb 2026 14:36:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 14:36:07 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 08:36:06 -0600
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
X-Inumbo-ID: 309ad7c7-0820-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fgl71IUI0ZhytNqOAA5HCSpTD3i5RRi2tXPF9DKG4xVGuuE0tcnL6zL68BDkvPLdeYrwredRHiXg+NZ5tKZY25FSQEA3nDqeewkAynPbLyYfAS6LPftV5QOb2hqUVlmezJvH77jPLBYK1BKJsnPBVE5icUdTnPQqGJNKvPMjb8X+bI21iFn8KugmvP15g2oA+OXgLGdYxomYVnKmUrFchayzCCWbjtYNThiQusUew9z5XkmcEVUrXQTg9gX240JZ+JfrHSszy14J2tH4Yo8U1jLwOz64cfwLoN6EItdtOxqCcduLIojXjYC7e+m3Wcj+/+4nVDP5RJcIQWKnTRjuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOil5cli+5dIUAJBekbnUD34gjeGCHSwpdVoZDgwE6c=;
 b=Haq1I9uToA4i/g+306VG+OJ4F13RLnib9PjBTo1VeuXWYGziLjVGTiuoDF0SeZoiE2lo3kstxSNEU5O6VGSQLMf2KlejULNCTECvl72qHfxoItBBFrfnqBDRBIs2Far0805owjwtxL7EQnvmv+XAwgkOqeVc5ypwuY8Fqm7PZTxvwqf7p32MCOzsapATNoB3dJQWbW6GTXQ9JOLBD89adTv8urGDz0Ea9cZqiCIpaxVVqj83p+QcD+xKpkCpNtguWZ8L2+iQFKZYU3lFEfRz7U+UUUP+DtWGj5mLFBu/3+Mux1BZ9Ky5aYSrdfRFwgVHDt3CQJvJxLIKdKrP8SnG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOil5cli+5dIUAJBekbnUD34gjeGCHSwpdVoZDgwE6c=;
 b=lFoWtNKvAl40nYp0PuH0ZlfFqbSwsi6IYu15sbn1x4MA15lDfZF9yPNtEotVGydDhuDdHixQooNWCKVrEGcBoLA9lNJXBqqeauA5R1DYL68zZBxuNXKqGFslfMgJy1Mv5zVau0HxvSienF+43pyc+SKmtg/m+ZsMNjepB65syWQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Feb 2026 15:36:05 +0100
Message-ID: <DGD24KNB0MQ8.3NT48B5EP011P@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 03/12] x86: Add cpu_vendor() as a wrapper for the host's
 CPU vendor
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-4-alejandro.garciavallejo@amd.com>
 <b861972e-1f31-4685-b83c-27670e561332@suse.com>
In-Reply-To: <b861972e-1f31-4685-b83c-27670e561332@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|CH1PR12MB9670:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c0c829b-3a6d-4927-0187-08de6a440f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlNiNm93b0g2QkpNZmMwaUwxVDBXOFBDdFdBeDJHUG85dXlZZmh1RGJuTzJW?=
 =?utf-8?B?NVJvWjdDbEVBWXFySHpwaTIvYVVNU1N0SjlDNTdBa1MyM0hJOUxpUUF6Qmg5?=
 =?utf-8?B?OUIvUGlDdmZ6eHFEWFJTTnE0eCtXUUxNYURWbHd4SlBvOUJOSCt0MVBjb0dJ?=
 =?utf-8?B?R0UxbzRNS1RjejVmbUFsbURjUXpXcWVMNkxPZ2h0RjVKamk1WnQ4M2hwNXQ1?=
 =?utf-8?B?bjMxY0ZiVlpCUVpueCsxOVFyVTVZdzJZYTQvcE1XMmI0UlhZUHBKY1RZV0d5?=
 =?utf-8?B?ajBTaHJhaCt3REcyNzJPSG1kWEMyRjd1dDhXaVFmZkdCUXpwUzJXS1poSzEz?=
 =?utf-8?B?U0lUMnZUSmRidlV5azI2ekYvaXZjaWttM05NaDNjT0lHZzRHV1prVzNWSUFO?=
 =?utf-8?B?NDJGdjAwR0Mza0FCWExTYk9hM1BhUkxFV0FtM1dkYmdUT2UrRi9xVjFDbkJT?=
 =?utf-8?B?SEw2TVJ0Z0xjd0RETE9FdCtWUUgvTUtxd0d1djg4b1Y1NWlTUStRVG04ZXRm?=
 =?utf-8?B?NUQrTlV0cWRxdGFtdUd0NXRTZVNoQ2VobTBObFNsVjRadmVQOU9ZdFFSRGQy?=
 =?utf-8?B?SklYMnAwV0JvcWVtcklZWnlZV1E5VWJTem4zYXZMeWZLTlZpWk14T0pneWhR?=
 =?utf-8?B?cEZoWUxkQSt1eExNWTZNTXBRM2MrVDhmZmNtRlk0NW0xaGxZOG1qUXpCRlZ0?=
 =?utf-8?B?cmYwTnAvMjNTOGtFU1hDQ2IyaW9JMWpqL1pNWHFOQzlZQWN0WXZJb2xDa2lt?=
 =?utf-8?B?K1NSaktOc3B1OElCTzZsQTZPYlJUTE45WDc4aDNvNDBSbEN5UkdQQkR1NjZl?=
 =?utf-8?B?eDZ2czVDcm1MWjFyaXlBN3hhZTB1c1FBL1gxQmEyd1hETm05V1FXR2NBcXg4?=
 =?utf-8?B?TEhwcTd2RlJaL2FLOWxTc3NBNU9YRlU2WXB1TFVNRkJzbHVkRGpmNEhqT1Q1?=
 =?utf-8?B?bU1wV0Z6bkFXd1F0djE3RnQyNEtXaGpNYkRScXJJTkpKVHZ6cUlidDhwdU9W?=
 =?utf-8?B?c0ZNT1NtaHJ0QVhFWUY1S2tVK0s4OHNTOFY4T3Y4Q1F6dG1GRUZrWHUyWWhD?=
 =?utf-8?B?bm9WaDBMRHIvRmtiejJkWkxoejF0cFVxcUdVRDBlZmY1YVVaaU9wZU5zQ3hm?=
 =?utf-8?B?TUtkYVpvNFVQM3Rha3BkMzZGd3Q0amE3UDd4YmQ3cUNibU54V1pBcTJuMnBI?=
 =?utf-8?B?TjQxSk1QTkxPUVFVemVsZGs3RCtCalpIVVJuM0JYMHdBdi9JcGlJZElRejNH?=
 =?utf-8?B?TFZEc0l4K0tHYW1DQXREemRsRGo2M0lONXJiTkVhQzdBV2lNSmVXdjgySGF1?=
 =?utf-8?B?S1hGWjY4eExEMERPUC9ycjZoQWhBWnZJblUreTNTTEM5YnFpNUFwSHhKRVV6?=
 =?utf-8?B?ZjA2WCt2YWNnRVA3ZlZyME8vVlFuZW4wZDAvV3htdTZTV0lQcmhUaHRQUVN0?=
 =?utf-8?B?MGdOSXpxWGI0b1lyUHprYUY0WDNlMWU0ckxVUlNHRnV1UnRrNEcxd0VIUjhr?=
 =?utf-8?B?Z3JpN0tXaVo3QkpWd0FPa3NmVVYwd2xJK0x3MW4yUFVnc3g5YzF0M2tSN00r?=
 =?utf-8?B?cEpHbkVacXVvRTRTWW82Rk16SHNzL0VhZmRFUDhueENIVjVLK2tvSThVWFBl?=
 =?utf-8?B?OWtlL2U1NDNmT1dNSzJ6N0RuL2pGQVdzSzFGbFg3VFliSjlMTlZKR1c3ZjhW?=
 =?utf-8?B?MUVuTHdrck5NZWpyK25pbTNtZmg0Y21ZYUI4bHlvbzB0cDVObTRoRHljaHQ1?=
 =?utf-8?B?ZDVQQlB5VEV2Wjd4NHlneGF0elpTeEp0UFBaTTZGMW84aElXSjIwN1dBWnk4?=
 =?utf-8?B?R3N4SVNyQTV6bmY5cG5vSSttSVlzMVo2bXVpSTJtQ29RcEM4SnAzeWV4TFFx?=
 =?utf-8?B?dlR1Uzg5TVV2cWlvR0FNL3VPczFOM2tVMm9SeFF1ZXFYdGhRY2htUTM0UUpP?=
 =?utf-8?B?OEFQTyt4STZwVXFOaDRZckxYMGRLcjh2SFdPcDZmS09nT29aL2NpT0Z2Y2Nq?=
 =?utf-8?B?K0JidENDNW52WXlVT3o5dGhnajNZT0F4bjQvcUptNUEwak1RRE5BZ1RMbWdY?=
 =?utf-8?B?cTYybmtYNElmamg0OXhndzg2enVXcjVyVitIK0NNTWFzLzAwWWtWQ2cvRkJr?=
 =?utf-8?B?cHc1RUVMUE9WSVg3WktDeG45dzhKYmNlcTV5bkZGTG9Jem9qUjNlQ3M5QXRQ?=
 =?utf-8?B?NUZtMVJBMDk4a2Ura0JQRjlIWStlVHpuWjdCd3V2czNnVlFTaHBGZGlDL3RR?=
 =?utf-8?B?WFdycFhmTFlnK0ZVd1lHcTNicmRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4vS9YXpMm3w7trPJOaVqDgu4c4qOBI7JMRSNhsTsqMwSHJ7RogBAJ5IavUGxBjmtu6lcixdgfjY6yVAntKzAVCR27ioqN3mlNCluJpwWXRJUECqAj6NkgkJgNnL7TEN3QcDNZjpU/PNFdDGx1xn8EXaChNs7HS6+lW2PYUpqxc2Sf7omPs4wenA2mrRu2d8/aP5i+sHMwiMsWnVu7aTM0vcGK1VdZO1jyjnDz2QRJucZXlhCZgDY7RR5BOFeCsGj58354riJoiJBCXDMHH5dZbG5aeN37H6YCSfeteh/CU3M8QN94WjLfebCsBlzUlgwZKESxjM6DN9tAhNWN/1zi3JE33g7YAy6f0twv+oLbOgjRGSme7IOIvezut+nthrdn8+DgQgZfmDFVHOz5HCKoCIdTcd2gA4RUZzDYPDocffL9kSoADKQfhS/V+VRFM+5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:36:07.9140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0c829b-3a6d-4927-0187-08de6a440f4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9670
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1AA4312E48F
X-Rspamd-Action: no action

On Thu Feb 12, 2026 at 11:52 AM CET, Jan Beulich wrote:
> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>> Introduces various optimisations that rely on constant folding, Value
>> Range Propagation (VRP), and Dead Code Elimination (DCE) to aggressively
>> eliminate code surrounding the uses of the function.
>>=20
>>   * For single-vendor+no-unknown-vendor builds returns a compile-time
>>     constant.
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
>
> Coming back to this: How does the value compared against being zero or
> non-zero matter here? As long as cpu_vendor() yields a compile-time
> constant, the compiler should be able to leverage that for DCE? And

Yes, for true single-vendor cases it doesn't matter. It matters on multiven=
dor
cases where some vendors are off and cpu_vendor() is not a constant.

> even if it's not a compile time constant, bits masked off in principle
> allow the compiler to leverage that, too. It may of course be that
> even up-to-date compilers fall short of doing so.

There might be some of that, but there's also a non-avoidable codegen hurdl=
e
unless you can tell the compiler your variable is a power of 2 or 0 in
multivendor cases.

cpu_vendor() =3D=3D X86_VENDOR_AMD, which expands to
(boot_cpu_data.vendor & X86_ENABLED_VENDORS) =3D=3D X86_VENDOR_AMD, which e=
xpands to
(boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_INTEL) =3D=3D X86_VEND=
OR_AMD

which produces a lot worse codegen, because now the compiler must AND the
variable with the AMD|INTEL mask, and then compare to the AMD mask, whereas
having & instead of =3D=3D means the compiler can simply do a comparison wi=
th zero
and call it a day (due to the masks being folded together).

I tried creating unreachable paths in cpu_vendor() to assist the VRP pass
in noticing the variable invariant, but it just doesn't. It doesn't seem to
be sufficiently aggressive in range tracking. Bummer, because VRP is a very
unobstrusive technique for DCE that could be great if we could reliably tea=
ch it
invariants we know are held by certain variables as part of their accessors=
..

Cheers,
Alejandro

