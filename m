Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMPjGTzieWm50gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 11:17:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A580B9F58C
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 11:17:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215331.1525534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl2bZ-0001fG-4s; Wed, 28 Jan 2026 10:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215331.1525534; Wed, 28 Jan 2026 10:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl2bZ-0001cu-25; Wed, 28 Jan 2026 10:16:57 +0000
Received: by outflank-mailman (input) for mailman id 1215331;
 Wed, 28 Jan 2026 10:16:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pnMD=AB=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vl2bW-0001co-Qx
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 10:16:55 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 744406e4-fc32-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 11:16:48 +0100 (CET)
Received: from SJ0PR05CA0176.namprd05.prod.outlook.com (2603:10b6:a03:339::31)
 by MN0PR12MB6199.namprd12.prod.outlook.com (2603:10b6:208:3c4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 10:16:43 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::3e) by SJ0PR05CA0176.outlook.office365.com
 (2603:10b6:a03:339::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 10:16:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 10:16:42 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 28 Jan
 2026 04:16:41 -0600
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
X-Inumbo-ID: 744406e4-fc32-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siTh32O+ymmgLHmFfh2sPeasv744KN/WV0OLFnhh/gNJYB8oNvfQJIVbc5R9nAWrtUaf9JOryh+be+3R28DVHY843nZlO/by1xcXWgHtCeTZw9Fbcg2CU8k0fITWCTzIXoxJwyN5tTgdyxQfFO2LEwYhxN6HRAaZLwIOhWZdY9XbcM2APcMsG9yrU1muwp1NBXEI9xtktKZLzv4wqCx4UKRWIh7Kv0G3ZeI9sSAcWahlAkQNnkuiogATarmPX8/B4GGliRlAh/e3txXYYMFYtUrQUBBRbjM2hRf64LpNXPySVXjelrCVYOCmQAZwDk3/Oty3rtMdJ+o8MFaUi4bpWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gzkbZR8TehbvHCJBfTvg+HQ3r9bLRvvateAZHS9M/4=;
 b=T6qut/if1BKg7GJvRi3jgJgckDuJnCLA7noj7BgLB1OcDEk3864X6y0Pu3LdzV6++XIca+IFUtLULqFXRaO9Dawwtt2KQ/h0LYMnDyhQXT5axylUhuLmAorw8ZdiMLBjfwx+83dGlx5APMYrSjBrnONeCTcVU5Iyrib99SBKZuS3dZOAqtd5gR/lWuQmGfBqpCrPjvvq224yTaGsjkjE7NS/43XAvdvi9EBvlCBrBtBEcuFs1LjgV2V7zQ+ozFD4ACrGxNUNT5I17eBmfE9I2mI3YTvBxgD+xRjxyNPh6Z5sQrCcI0vW0O9tuCgJb4bKdndk4MC6prNMiYJg0b6LqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gzkbZR8TehbvHCJBfTvg+HQ3r9bLRvvateAZHS9M/4=;
 b=P+h8d8gshpEAhu6W+1m90e46VVvpEQj+xgWaOJdhK1B3jlJPIUg0yZTBNBzCIbSXr4D23mjARuyIxwfUEC3RwgrcrtytAx0IpdnRe8tHtjHPQ1qOii0yfk+nXl10As7NFcAjgrnov5TcsbGqwPR4BMa92s4J1g9xjuDS1zu8OI0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Jan 2026 11:16:39 +0100
Message-ID: <DG057RNBOT01.25ODFMNGWAZMO@amd.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH] CODING_STYLE: Establish a policy with regards to
 copyright notices
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.20.1
References: <20260127182403.141459-1-alejandro.garciavallejo@amd.com>
 <aXnEdQxyevj-wMuv@Mac.lan> <DG03YWKDDNUC.1622RXX7ZJUW8@amd.com>
 <aXnZsg9mRD_atvt2@Mac.lan>
In-Reply-To: <aXnZsg9mRD_atvt2@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|MN0PR12MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: 2632b302-1eab-48a4-3507-08de5e565580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlhZZjJjS2dwTzJaOEVnb1FKc2s2TTliMEVMOXJMeDJCcEFVSFNEYjN3YWFG?=
 =?utf-8?B?NjJQME1uN1Y0Y0huY0dlczlNcm1La0N5Ni96NUN0VUZHR2ZJclBSNkhDWjI5?=
 =?utf-8?B?R25NNnlsMUh5bFVJY1lvamtwTjkvY09EWHpYcW9LWHo4eDhTeDRoS050UHBt?=
 =?utf-8?B?N3lLbmRZWHl2RmQvSHZUNDBzSzE0OVlkZGJmbExQWW5ucG1reG9hRG8rVXBC?=
 =?utf-8?B?N0dTdjFaRzdHRTlVdlhTaDNhc1RGZUNDVktyRXhzYmFLRmlKeGxnNlpDUmdS?=
 =?utf-8?B?eldtdlZEVytNQkhVWEQ2STl5MDFpOFFFeGZhSDJMZ3pqTkRDNFhkdG9BZmZq?=
 =?utf-8?B?aUltTWJIUFNZK1NUZFB4R3htQitIemF2eXdrSTRFSk93dXNvRnJualRQdDND?=
 =?utf-8?B?eDNiZ2pjMkxOMHBGZ2xDRFNZTzY4SFNxT0dUdTBvWW5OdmNPb09EYTN5aDNo?=
 =?utf-8?B?MzdNVENEalJjUTZLcGxEdkpHYzZvQWJIbitjY3FwWFRyWk5jbUJqdnZxS3VQ?=
 =?utf-8?B?cGJ3Mkdlb0MzOTd3OU1mNWMrQVVjK0pRbzFzajgvT2RQUEg3R1lwcXArRi9S?=
 =?utf-8?B?SjVraWxpelplSXpJNzhQT2UrTDlMTmtQRk55V1U2SnphL0xncnFHbGdXWUdR?=
 =?utf-8?B?Wmh4NXNLbDIrUGIyR0l0Y3pYTGJ3emgvMzVGSGQ3U01zNDNxVktEZnNxQk9n?=
 =?utf-8?B?TytyS3Y4Q0l6K2UwekFrQU1rczhXMXRzZytBa1lOTUVYSjVqUWp1Y0JWQXJy?=
 =?utf-8?B?Q3E4bkx5MDM5UStYUzFHTjhkL1NIazhQbWZrMlhlZUt1T1J6VkFNRjEyN0Qw?=
 =?utf-8?B?RkNoQ0Z6SkFSdUdYRjJNbCtjNlorUjFaRkhpRzVsWThmTVZKNUFYK2tIWHYv?=
 =?utf-8?B?NmZxV0cwNXJSMGo5dHhGbVp3eGhyd2ttQy9qY3BVa1BkbitELzhsTXZDQnRK?=
 =?utf-8?B?SW1makVkVEhFZkZwTUdOUi9OQXd2aGNlQ2VkMlFIU3JyeFZibGh4RXBiYlQ4?=
 =?utf-8?B?eUlzcHBQUkdlQWtFTm9tYzZVWWxMWk1HYXl4RVlrVlI5Wkp5UC9nYWtIbGRt?=
 =?utf-8?B?WWVmUncvTE1pZENFa2RnS052R0o3TXdkdnFuZTZub2RvWDIyUFZ1U2QzT1dR?=
 =?utf-8?B?M001ZlNVclFwSFIxaUxKOTA1UVd1SVE4TFAwODhoMTNHSHUxRUlpRGhLRFZ0?=
 =?utf-8?B?RFdrNTVDb1RTTDZCREtkcW5VbzJvVGJBdUI0VVB4eC9TY2pQbEFnWERiV01T?=
 =?utf-8?B?VCs1S0xiWm1GY1JCWDZyT0xrV1RieHIrQXE5SFhqZGNCZm9IZ1lQT0YzdGRR?=
 =?utf-8?B?MHVrekgrNWo1ZE54RE9aSVlQby9oTjJheFR0c0pjZXVKR1FJRkFkQmVhYUJO?=
 =?utf-8?B?NnJMQzUxcXhMRkJsS1dlRU42bzFydVo3ODdaTmtKWFR6K2tsZ2d2OWNCZllU?=
 =?utf-8?B?Ky8zcjR1ZkVtN21OZk5IaGFDKzFxSHFZdHJnMWtiaTdpVGw5bzgyWUlUc2Nz?=
 =?utf-8?B?TEk0TVY4TnlrTHVIaGlPR0xTWmtrWnU3YTNpOStvRHV0RjBIMmVWS1VLYW9t?=
 =?utf-8?B?VEJibDFFTHMzV0hYWmMreEczQlVFNDZZRjlHZEhCUVRDejhlb1MrY0dXUzRF?=
 =?utf-8?B?Ly9OcVdsMDZTQ1BGMFQ4bEY5REpDdVZ1QzRQc0g5U0I2TU92eHp4M0gxd0tv?=
 =?utf-8?B?NDgvdTJqZDhBSUdYbGRvVmpiOUhQNXJ1S1dYZlprTmpHWHp1TEwxMmE0YWZs?=
 =?utf-8?B?d21IUTJqdUhIamxWL0QzdEZKQ1h4TVhlbk5WeXNRdDhYSzRBQnJOY3llVk1w?=
 =?utf-8?B?Y2VSdGtoTzFKUEVPSjRKRFhZWXZhWDhVM2pFU05UdWdBd3FralZOaUMraktY?=
 =?utf-8?B?T2pzdXMwN3FPVi9RVEpsM3BDQjc5bDBlL2UrOXBWbExyUHkxTUxqbWErTlE2?=
 =?utf-8?B?WW1jdWw2ZmpWZUcrbkJHd2pZcUVZdUtwREFVbHJKRVdJOURKczZyb0hkS1RN?=
 =?utf-8?B?S2Jqams5RkY3a3hLVmgva1JLZUkrVlFBNUhQNW5KYnMvMXhQM2xiZmtVN0pn?=
 =?utf-8?B?Sk1FcHRDVVI2UldZOXdwUmZBemlWKytGeHNManEvbWd2aDBIZ1A4QitzN3hq?=
 =?utf-8?B?ZjBSL2pqOStMdkM1SUNaTFpYU0RPZm03L1UrK3poQXRBTE1acmtZNkQwTmhN?=
 =?utf-8?Q?pDeCCt8aiVUTKZs42F74TOc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 10:16:42.7077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2632b302-1eab-48a4-3507-08de5e565580
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6199
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
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,llvm.org:url];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A580B9F58C
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 10:41 AM CET, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jan 28, 2026 at 10:18:03AM +0100, Alejandro Vallejo wrote:
>> Hi,
>>=20
>> On Wed Jan 28, 2026 at 9:10 AM CET, Roger Pau Monn=C3=A9 wrote:
>> > On Tue, Jan 27, 2026 at 07:24:01PM +0100, Alejandro Vallejo wrote:
>> >> This patch modifies CODING_STYLE to severely discourage use of copyri=
ght
>> >> notices when their presence is not legally mandatory.
>> >>=20
>> >> Copyright notices are redundant on commit, misleading from the time t=
he file
>> >> receives contributions from anyone not represented by such notice, an=
d actively
>> >> harmful for attribution by the time the original code is long gone. T=
hey are
>> >> plain wrong when added on code motion.... the list goes on.
>> >>=20
>> >> All attribution worth keeping is version-controlled through Signed-of=
f-by,
>> >> Co-authored and the like, DCO and the cumulative contents of git hist=
ory.
>> >> License banners have already been superseded by the contents of licen=
ses/ and
>> >> SPDX tags.
>> >>=20
>> >> Other FOSS projects have already moved away from explicit copyright n=
otices
>> >> where possible, and severely discourage their use when not.
>> >>=20
>> >> Apache and LLVM take active issue with copyrighted contributions and =
Chromium
>> >> takes issues with copyrighted contributions not attributed to the pro=
ject. Some
>> >> Linux subsystem maintainers already frown upon copyright notices too,=
 even if
>> >> it hasn't reached the point of being a mandated requirement yet.
>> >>=20
>> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> >> ---
>> >> The actual changes are almost verbatim from the LLVM guideline, but i=
t's not
>> >> exact. Wording can be adjusted as needed. I care about the core of th=
e proposal.
>> >> Saying "please, drop the notice" on contributions where it's clearly =
not a
>> >> legal requirement, or have the contributor state that it is a legal r=
equirement
>> >> and why. For fairness sake for all contributors to the project.
>> >>=20
>> >> I'd prefer taking the Apache approach for new contributions, but I wa=
nt
>> >> some discussions to happen first.
>> >>=20
>> >> Thoughts?
>> >>=20
>> >> Relevant examples:
>> >>=20
>> >>   - LLVM: They banned copyright notices, unless part of a vendored
>> >>     components.
>> >>     - Links:
>> >>       - https://llvm.org/docs/DeveloperPolicy.html#embedded-copyright=
-or-contributed-by-statements
>> >>     - Relevant quote:
>> >>         The LLVM project does not accept contributions that include
>> >>         in-source copyright notices except where such notices are
>> >>         part of a larger external project being added as a vendored
>> >>         dependency.
>> >>=20
>> >>   - Apache: They banned optional copyright notices and relegated
>> >>             mandatory notices to a NOTICES file that also contains an
>> >>             Apache copyright notice. See links.
>> >>     - Links:
>> >>        - https://www.apache.org/legal/src-headers.html
>> >>        - https://infra.apache.org/licensing-howto.html#mod-notice
>> >>     - Relevant quote:
>> >>         If the source file is submitted with a copyright notice inclu=
ded
>> >>         in it, the copyright owner (or owner's agent) must either:
>> >>           * remove such notices, or
>> >>           * move them to the NOTICE file associated with each applica=
ble
>> >>             project release, or
>> >>           * provide written permission for the ASF to make such remov=
al
>> >>             or relocation of the notices.
>> >>=20
>> >>   - btrfs: They are highly discouraged.
>> >>     - Links:
>> >>       - https://lore.kernel.org/20220909101521.GS32411@twin.jikos.cz/
>> >>       - https://lwn.net/ml/linux-fsdevel/20221026074145.2be5ca09@gand=
alf.local.home/
>> >>       - https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/inde=
x.php/Developer's_FAQ.html#Copyright_notices_in_files.2C_SPDX
>> >>       - https://lwn.net/Articles/912355/
>> >>     - Relevant quote:
>> >>       Let's say it's OK for substantial amount of code. What if someb=
ody
>> >>       moves existing code that he did not write to a new file and add=
s
>> >>       a copyright notice? We got stuck there, both sides have differe=
nt
>> >>       answer. I see it at minimum as unfair to the original code auth=
ors
>> >>       if not completely wrong because it could appear as "stealing"
>> >>       ownership.
>> >>=20
>> >> There's more cases of other projects taking similar stances.
>> >> ---
>> >>  CODING_STYLE | 18 ++++++++++++++++++
>> >>  1 file changed, 18 insertions(+)
>> >>=20
>> >> diff --git a/CODING_STYLE b/CODING_STYLE
>> >> index aae5a47ac2..97f80245ed 100644
>> >> --- a/CODING_STYLE
>> >> +++ b/CODING_STYLE
>> >> @@ -24,6 +24,24 @@ license, e.g.:
>> >> =20
>> >>  See LICENSES/ for a list of licenses and SPDX tags currently used.
>> >> =20
>> >> +Copyright notices
>> >> +-----------------
>> >> +
>> >> +Copyright for the code in the Xen Project is held by the respective
>> >> +contributors. Because you (or your company) retain ownership of the =
code you
>> >> +contribute, you know it may only be used under the terms of the open=
 source
>> >> +license you contributed it under: the license for your contributions=
 cannot be
>> >> +changed in the future without your approval.
>> >
>> > The usage of such direct language here, by using you to refer to the
>> > reader / contributor, set a different tone from the rest of the
>> > document.  Maybe something like:
>> >
>> > "Copyright for the code in the Xen Project is held by the respective
>> > contributors.  The author of the code is the owner of it as stated in
>> > the DCO.  The project cannot retroactively change the copyright of
>> > contributions, unless explicitly accepted by all authors of the
>> > code."
>>=20
>> Ack for the tone. The particulars of the wording might need tweaking eve=
n in
>> this version to constraint the scope of "contribution", "the code", and =
so on.
>
> Yeah, it probably needs even more integration to make sure the terms
> used match the rest of the document.  I didn't take much care into
> that, as I was writing this in the email reply and didn't have much
> context.
>
>> -----------------
>>=20
>> I have the same question for you I asked Jan elsewhere.
>>=20
>> There's 1 question in 2 forms I'd like to have an answer to from a core
>> maintainers.
>>=20
>> Would you be willing to ack a change along these lines?
>>   1. to a Copyright Notice policy within CODING_STYLE.
>
> I'm fine with that.
>
>>   2. to the relegation of existing notices to a NOTICES file in the styl=
e of
>>      Apache. Apache in particular mandates the file not be touched unles=
s
>>      absolutely required for legal reasons.
>
> Hm, that might be more complicated.  I am however not a lawyer, don't
> expect the rants below to have any kind of legal base.

Neither am I, for the public record.

>
> What about the public headers in xen/include/public?  I don't think we
> can just remove the copyright notices from those files and place them
> in a top level NOTICES file.  Then OSes would copy the headers
> without the NOTICES file and end up effectively dropping the original
> copyright notices.
>
> Also, what about people importing files from Xen into different
> projects (apart from the public headers)?  If we remove the copyright
> notices the imported files won't have them either, and people is not
> simply going to pickup the top level Xen NOTICES and import it into
> their project?
>
> How does Apache deal with people importing their code into separate
> projects, do they mandate the NOTICES file to also be included as part
> of any code import?

They do. It's part of the Apache license. See point 4.d:

	https://www.apache.org/licenses/LICENSE-2.0

This would require some sort of ammendment to xen/COPYING.

OTOH, to avoid being a PITA to Linux and others by changing how we do thing=
s
it'd be sensible to keep the existing headers on everything under xen/inclu=
de/
public/ for being-a-good-citizen reasons.

Anyone actively copying an internal file (say, msi.c) would thus be forced =
to
also copy NOTICES, but that's a heck of a lot rarer and not much to ask.

Cheers,
Alejandro

