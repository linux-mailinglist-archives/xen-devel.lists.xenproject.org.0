Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DURKiDqjWnG8gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:56:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0993712EAB3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:56:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229227.1535223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqY70-00009L-3y; Thu, 12 Feb 2026 14:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229227.1535223; Thu, 12 Feb 2026 14:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqY70-00006V-0n; Thu, 12 Feb 2026 14:56:10 +0000
Received: by outflank-mailman (input) for mailman id 1229227;
 Thu, 12 Feb 2026 14:56:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRx/=AQ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqY6y-00006I-6s
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:56:08 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f433b533-0822-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 15:56:05 +0100 (CET)
Received: from PH7PR10CA0023.namprd10.prod.outlook.com (2603:10b6:510:23d::21)
 by MN2PR12MB4079.namprd12.prod.outlook.com (2603:10b6:208:1d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 14:56:01 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::28) by PH7PR10CA0023.outlook.office365.com
 (2603:10b6:510:23d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Thu,
 12 Feb 2026 14:55:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 14:56:00 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 08:55:59 -0600
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
X-Inumbo-ID: f433b533-0822-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxaBUmsUjy8eBAu5zQH4FfeaHyyBTGHkwjqWAAqOo9mbMbwnRMJCK/VIBhe+wvoqsb+zhgTeIouyiixDprgTh1gG+Fv22CH0gMYAZ0wmqvZ1kmkS1/0a0lLhaYQ3D9ma/fS/gAdOvW8+7AQfqYRX0AiMobhnWDBPIDXI276hcrdMuqAjN5PyG0bbPINPKD1fc9LhS61+RYY76zWV4CR867/qCmxRKacZyZK/jMh7MBUFibPfzixJdYYWlWvAG3KdgOwU9sixDpjSXU3bUtg1CROY7+7LwQ6oO0Idv1wbk94TFOr4hzU4Zsw+scib7418SW4vtgWGFqKWUpvqdp6Dow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upTvwB/xKG0YJKqZ73mCz/e9Bc+WguMxroxZZwUkvk4=;
 b=pSYccwNqDsxdA6LABsXfUGhBJpMDN+FlhoaXh6EhkB2ltRjXFZwhIhLpTMfSl6yoQLYFdArbcVtyP11ss0zfueELLjQKd8WpE+yoGnNBTVtjRPFSsmJtLTgTlr0Pqpga+KFiNAhftyVG52xJbWb5A4APLWcwERDo8uuyZ0ZYnllq+vsGO+vP6sGlXYG1IylifjhJKv2TjPy/RAVv3UakNzyQOxEl5jEPlDNXEowqB2vNqYdB2+wjkV94nG8o9piEmFmhvXmTfLrLtf9PPF8eO8NDUxU8yaHrwNYgf2iECcMJG5EoN2tUEU7pQ9Tpre/+sGtaUAWjFWIYG6bEXnzQOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upTvwB/xKG0YJKqZ73mCz/e9Bc+WguMxroxZZwUkvk4=;
 b=ShhRNZ9/A4ZL9T5Q+bErEbpnx/yaIS5LvtQNPqx3DBGAAIIOUu1ghmJdiSP4y09vXIgOxcxx5cwM7o8iqsoIKoC9YuONYGzAtEkFdjw4onE3UHvb7tR8husNZV/btHukpe0ULuLk0fX4fbTJb4cuBctSDw45T1SwHRPZWJZRmO0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 Feb 2026 15:55:58 +0100
Message-ID: <DGD2JSOV312K.1NZML3WGZBQ58@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 05/12] x86: Migrate spec_ctrl vendor checks to
 cpu_vendor()
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-6-alejandro.garciavallejo@amd.com>
 <109c3379-7066-4ad9-93aa-57e87deba81f@suse.com>
In-Reply-To: <109c3379-7066-4ad9-93aa-57e87deba81f@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|MN2PR12MB4079:EE_
X-MS-Office365-Filtering-Correlation-Id: 66037592-3c73-4911-98c2-08de6a46d61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1NyeE9IRDkxZ3lwVUl6c1c1Q3BIR3NIVTgvYy9hUW5nQXBMNTE2dlRuM1VV?=
 =?utf-8?B?Rmx0N3hrL3JlNmd2cVBDSkNaTzZ5ejJIQmw4ZTgwcEs4ZjBGb2hPTEd3d3Vy?=
 =?utf-8?B?US9ka2ovVzk1WWtLbjVST1FXSkhZOUhTRmE5SFFKL0MxclhhRFpVZzdTSlM4?=
 =?utf-8?B?NVM5ZlhtbkE2dlplRUtSZytwaHlQOUJjUDIrcDI5QUZpSUliNGRvYXptaHhx?=
 =?utf-8?B?Zk9NZWFYK2tPelN2UzNZdEM0QmQ5WHBoUWZOaUhqVUJSdEpJWWNuNkhmQ01n?=
 =?utf-8?B?YUhCU2lXRGc3MzB1OGhKZHczOEpLYXdndy9DN0hPMUFJeURTQ25TaHJhSDhK?=
 =?utf-8?B?Q29xc0FRc0VIbHVCVGt0NnFtSXJXa3VlRHR4OEFDTndKVmM0cUl2WHduMWN1?=
 =?utf-8?B?TXpyU1V5S2JVamlDd2FiREZhVHFtTFFTeXZ3eEYrSEd3ZW53TVg3VmhZRWFz?=
 =?utf-8?B?dFhRWDFWOFNscHE3MmdFeTlBWkVPbFpEUHQ5N2FYRTZ2U0w0eWhOVkkyenU1?=
 =?utf-8?B?dFV4alRDRmtpaFNNUkZhYlptTG1YUDlrdEJ4dDltYXVONFlwQnErZDhjZlA1?=
 =?utf-8?B?bTFjYjl1NVBZTnpJQjAxbFhCb202Q2RXZUhpYmlsbmtjT3UyYVlHQWZiRW1Y?=
 =?utf-8?B?TCtGZnVaWW9QM0JxTmxtbnJPdFdJTXFpKzJ2K2ovOXdsdXdkU3QwbjNSVzJ5?=
 =?utf-8?B?OWk1a0tXdzNhcW1ra3dHRllRZm9rcnp0UEpiSkt6Sk9qR2lKeWMzeEl5YlFK?=
 =?utf-8?B?UUlpZnVjQmpVdUxZWCtRUkpXanNxT1Urc3hTb1RUTmRqcWNJdTJIdE5TdGZq?=
 =?utf-8?B?bDBBRGxnVnNNSVFkL0pzWlhXZHBocWUzOGhrcmt4d0tiVW9NTkplQ1AwVHJL?=
 =?utf-8?B?RnNaY1RUcVlRRHRxSU9PZTEyei8wYTRwekR0aStoOVRkNW1YTVlmRyt1MzJW?=
 =?utf-8?B?NTZJaE5QNUxwSys3NUU2Y1Z1UWxnNHlySGNST3BKaElZYzBHeUthZEZLMlpw?=
 =?utf-8?B?NitZbC9xVWJ5emtSUkl0TnNpQzdxMmZIV3pQeTcwWDRobTJ2R0QzdTE3TU81?=
 =?utf-8?B?WDNFR3NCYklaK05GY0pZWnJ5Skc4VmFTejc5K0NmRUxLc3VxOVA5SUZlU2do?=
 =?utf-8?B?T3dyYk9pWm1tVXM0akE2czZsZFpPYW8xMkZVMkRQWU5uNjZnQ2JYWEQ5bkMy?=
 =?utf-8?B?WjlUYm5pWnRnMzJhRHJNUkw3NkFFdDhrdnZFSmhpUHlGYlFuS3VnakJVUll2?=
 =?utf-8?B?YUl0UEhpeXovcGdlU1pRdGFFbEorWU1SSG1EZFU5dFFiTVJsb0t5bTE2ckVQ?=
 =?utf-8?B?eEFaL3J0NWdFT2hqWkJ1dTEzZVVpbU9ybTFKLzZMdVJROEkwV3pLVFlxazcz?=
 =?utf-8?B?a0hnSVVhTXlrWDVxcW5hZ0FFOU5qVmNaalZYaEk0dHplOU9oTXVLeDh1VzZZ?=
 =?utf-8?B?bW9Wb2M0YTdQc1VpQWhXWEdLaWZvNjVkRDNOdEpYUnQyZVkrZldROTBCM0x6?=
 =?utf-8?B?OTY4aUkwcEY0bXMraTVNc1ZBMEpHS0lGSmZINkVKSEJGbVJzb3JxV3RXUEpm?=
 =?utf-8?B?SWl6U3pOcUsrenIyK2IxQ0owMkwyOENTVkl5b3pWNmdsUlFuQURtTmE5enZ2?=
 =?utf-8?B?Q2x0aHhFdTAvajZJSGJjQXVaazJQYmdhb3NDY1E3dmo1cVRyWGtlcGZaU0Z0?=
 =?utf-8?B?N3RMOUVsZnJCMXl2U1dqcmlheHhSdGlRNTBXWmttVFRSSU9UZmhXUDdWNlhV?=
 =?utf-8?B?d1lyNjR1a1RHSkw2a3V2QldQZEtMeE1MZjlVQ2V4Sk8ranVyemphb3Vjc2Rn?=
 =?utf-8?B?TXplY3lZK1REQVJCaVJPc3p4eGRwRE1EVVhYZUtSNmR6cUF3SHpLaTZ2M1hl?=
 =?utf-8?B?THBGbUVtSFpDYXNUemNBVlUxZ1QrK0Q0c0YxaENHbEhmbDZZMzBrcElQNGpC?=
 =?utf-8?B?R09QaXRUcGMvL21uQ3NBeWZJdjczT0VTR0NVYyswZW1FaG5HbGowa3JEa09F?=
 =?utf-8?B?Wm8wYmlySzY0SDJRcmo5RG1iR0djbFV1T0dqRmh0MUtZSVNoclJSOXJCcUVh?=
 =?utf-8?B?K1lJOGZlcEZ6c0hTWjB5WWdQbmdxeUl2WVdPaDZZYXhkSEdmYjFCdEJuS2Qv?=
 =?utf-8?B?bnZOT042OHQ5eWlBMk5qQWt5cTNHMjdpVkk5ZUdrN1E4aXNLN0NFczlzWG0w?=
 =?utf-8?B?eEErNjRFZTMxY3RET1VlZHlnZEFZd3NJQUdaSEdhcUFmNEFPMjRmRGRNazVn?=
 =?utf-8?B?aGc5SVY3c3RkcVQ4WGpQMU5VNEtnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rDiotymAFtt/W5dC/iqt+paUAHGjcz/j4Bg5UTnAsXcNZPgeKrvWUjL1g3D09UeeUuOErWo96VT0vf/9aBe9roS2t2/w7Ub/+TZmZPYu3JQYe+OH1XHzEd8/KA3xcaAdWrC/ko6iz6KW0zwfAvi/LZQxsduMNTeJYKLF9axoRb+q6Lx1JrCrepvyccQKKy7nsCE5d+IADn9BdXF+jeRLkkjSA/F9/hMGkmyq5EoAPjf0hyaQT1DN6rX8FgNgJ3/ndy5/R+2ufaH6LSF785Pgmdq8N9kWw4uyTwaGPoo4OQf+5WZelcED5y7Z6rhVQ7Q/ud3UerOUod4QeZBzU2+yL86Dpcg6VsSjkWnE1WnPx4n0M/H7eB8XECZwkye3dU2kVxSC+36+RrEWS+131Mfz+EVhcy2AF8gARIyZT0JTbxy7DqTnj3aYutG5TjZY78qE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:56:00.5006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66037592-3c73-4911-98c2-08de6a46d61c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
X-Rspamd-Queue-Id: 0993712EAB3
X-Rspamd-Action: no action

On Thu Feb 12, 2026 at 11:49 AM CET, Jan Beulich wrote:
> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>> @@ -738,11 +738,10 @@ static bool __init retpoline_calculations(void)
>>      unsigned int ucode_rev =3D this_cpu(cpu_sig).rev;
>>      bool safe =3D false;
>> =20
>> -    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
>> +    if ( cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
>>          return true;
>> =20
>> -    if ( boot_cpu_data.vendor !=3D X86_VENDOR_INTEL ||
>> -         boot_cpu_data.family !=3D 6 )
>> +    if ( !(cpu_vendor() & X86_VENDOR_INTEL) || boot_cpu_data.family !=
=3D 6 )
>>          return false;
>
> At the example of this (applies throughout this patch): With the panic() =
in
> patch 03 the transformation looks correct. Without that panic(), or witho=
ut
> being explicitly aware of it, this gives the impression of explicitly doi=
ng
> an unsafe thing:

These patches wouldn't be functional changes without the X86_ENABLED_VENDOR=
S
mask at cpu_vendor() or the single-vendor optimisation. I could split it th=
at
way. Introduce the cpu_vendor() macro early. Transform the entire tree, and=
 then
apply the optimisations.

> being explicitly aware of it, this gives the impression of explicitly doi=
ng
> an unsafe thing:

Without the panic, it'd indeed be (intentionally) doing an unsafe thing.
Removing the panic can't be safe, it's not just a matter of features missin=
g.
It'd imply printing a banner saying the current configuration is unsupporte=
d.

> Even though by way of boot_cpu_data.vendor we know what
> vendor's CPU we're on, we're acting as if we didn't know.

Not with the panic in place, which is partially why I put it there.

> I'm really
> uncertain whether such changes are worth it with the mere goal of reducin=
g
> code size.

It is unreachable code, and in a safety context every line of unreachable c=
ode
must be either removed or justified. And justifications cost time, effort a=
nd
are difficult to maintain.

> Even beyond the concern raised, this feels like it might be
> increasing the risk of introducing subtle bugs.

I would've agreed with you with x86_vendor_is(), which is why for v1 I took=
 a
step back to make cpu_vendor(). That macro was complex. Too complex and it =
took
many trial and errors to fine tune it. cpu_vendor() is comparatively trivia=
l and
relies on the compiler doing the heavy lifting. In the single-vendor case i=
t's
a constant and it's hopefully uncontroversially fine to remove unreachable =
code
then.

In the multivendor case, the complexity amounts to a mask of available vend=
ors.

I don't think there's an inherent danger in removing unreachable code, so l=
ong
as we can prove at boot time the reachability preconditions can't be met.

>
> I wonder what Andrew and Roger think in this regard.

+1

Cheers,
Alejandro

