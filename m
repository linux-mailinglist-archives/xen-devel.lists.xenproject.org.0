Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM2NBBpec2l3vAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 12:40:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FF875351
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 12:40:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212201.1523476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjFWA-0004JN-Oi; Fri, 23 Jan 2026 11:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212201.1523476; Fri, 23 Jan 2026 11:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjFWA-0004Gu-Lp; Fri, 23 Jan 2026 11:39:58 +0000
Received: by outflank-mailman (input) for mailman id 1212201;
 Fri, 23 Jan 2026 11:39:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hx8e=74=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vjFWA-0004GE-6T
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 11:39:58 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d57d908-f850-11f0-b15e-2bf370ae4941;
 Fri, 23 Jan 2026 12:39:56 +0100 (CET)
Received: from BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::8)
 by DM6PR12MB4372.namprd12.prod.outlook.com (2603:10b6:5:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 11:39:52 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::67) by BY1P220CA0018.outlook.office365.com
 (2603:10b6:a03:5c3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.12 via Frontend Transport; Fri,
 23 Jan 2026 11:40:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 11:39:52 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 05:39:50 -0600
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
X-Inumbo-ID: 3d57d908-f850-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sY7uaAt99DzK/Ie4XMp8vmCqaX7xdadvsir5Zzj1++fOEahbMW5jyAtDm8o3X5zfJvr2LH+MVDTygrYMP/+tX5iriZO/CINhbXVEug/uGrJ2b+UsHUqkTXZup07AAKntRRmwvQ+xOD/F2lZjSkcjFpjHYphZkVVHZiB+RjlL0bFkaUzFOacDukiLrIbuzQYtPBWFgZFnmJBAIrhr6P3kvxeWpuI0ELgY42aLYonUDR4u6Loz1ak1tSdlrc2BclVydeM5zJpZRciIA4rmMH75p6CaSo3hMdRA68QhUgiR+k11+Zi7HCOvc4DGJokwFCuq+HhgA0jsjHva14sAqnuG3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6jO046wvO/xOzULy9DTNDhxFdPpFVtoUf5/0Ft5rh0=;
 b=LTsEA3dAujXQENYNGUpqpZYiFa6AvpKp3c6fVh9MkBhLMdHIiKUmEStJH3EWxzodAr92l+GDxTDmV4MFxJtcu2iLxfuP+XEHiNekt307kevvv2vPPyxsN47yNfd/SN/c7Ewc7yzKnQ1rj0ns/IscnFt71pAxGoQNFcrkd2ry9A1YKeNXq4gUATuka9/NAjPu76JPwp0k6Qcu5TZZiziIB2DRKLmRjPPQG8WKc64Xru+ISlbvL/dKhvJo7DalY+8idPl3f9Ke/6JkVinl/WNFM70LexKQGhPFXfOmDnVmNoiyEz2RdnP2DFB92l9V3TlUJwCajOkzU69lqTzBYQobrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6jO046wvO/xOzULy9DTNDhxFdPpFVtoUf5/0Ft5rh0=;
 b=s1q99dvsEl9FibxuoTePjgOdwmWdBQ/8wuyGDCgkM9tJuyI0zejObfXQK8vbOEvGvqBMjZlNQu8Z+ioBnchU214ghbH+9bA107JrecGHEzBdfVho+L2tEM3L/kwZR+io5Eom3nzCfqGFqneF83ZfM3d0HU+HqWWybePs+4OfWlU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Jan 2026 12:39:49 +0100
Message-ID: <DFVXUPXYSEX5.3KQXARYRRCKZP@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: Re: [PATCH 0/4] x86: Drop cross-vendor support
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <3421e525-fb04-4306-9320-4fa359c2ee28@citrix.com>
 <DFVAXLGSFPWC.3UXT3BXSBVFRZ@amd.com>
 <6d41d205-7318-45e4-a487-5e35e398d96a@citrix.com>
In-Reply-To: <6d41d205-7318-45e4-a487-5e35e398d96a@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|DM6PR12MB4372:EE_
X-MS-Office365-Filtering-Correlation-Id: e373d8ee-b2f6-4036-bd6b-08de5a741f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFBUcGk3aWhVVTlvY3ZHQXFhQysvTE8ydE13bnpXL1BXczhVNGVBNjR2ZnpV?=
 =?utf-8?B?aHZNQW4wQWFJT3VOUzV4Ryt1dFZxL1dOZDdmQUtEaklxZTUyR3hFN3pDQktr?=
 =?utf-8?B?WUV2TDNIWGRPKzZqZ3ZUbUdqbk1PdDkzNlRKNjUvYjAwRXBTUE84cFJKNTJU?=
 =?utf-8?B?cWc5V0R5dm9SVXlsdHRQWmdTdGltSzJsNGpFWmllY1ZOTFE3Q3N1UmNYNjRY?=
 =?utf-8?B?aG1pakk4d2E4YXp1dFI2dzFQSGlOdHAweXl5ek5pcThmOEFFSUtJd0dWMnRQ?=
 =?utf-8?B?SnVEMFZEM3FTZ1pvSEFIRXpDWEFyOGgyUnpKRGd4aDJ1dkdwUUVMMEQ3K1g4?=
 =?utf-8?B?Uk80KzRJU1Q5TDBYekZzL0tuazdIUEZRZVUremJKd3podnlvTXNsTk5id3Fa?=
 =?utf-8?B?UWx4eW1lMFcxVytDc1hNb0Vad3kzSjVlb3hJSVE2L3YvMlc5WmF1ejN5Q2cx?=
 =?utf-8?B?bjZhYkZzTjBLeUthekxkcld3MXp1djdDMHh6TjREWkRpZmw2dDl5QnBzc3JD?=
 =?utf-8?B?ZER5OXB2bUhjRVdQRkNESHpGRFlZb2x2NUJnSG1RTDN2T2FlZ1Njb2UrcTVW?=
 =?utf-8?B?d0VFYjRWWTNUTDdCZms4SXJnS1hqOFUrU2Z4WHZ4UDlwVVJYN3RCZUJBUktX?=
 =?utf-8?B?L2ZTakc5RWdFemJIZmpTM2diOVM3UlVkZDhDdHN3eHMvVVFGelFNU292UC9z?=
 =?utf-8?B?MXBOUzdkaURXMnBsNWpKQnpQaFNuS3NCaEVSZFM5UW5xeEtYKzdMMVlycmRs?=
 =?utf-8?B?cTlSY3VlNDVDWTRMMlo0a3U3YmR5WS83QWIzNTBjSVdsTXdrNngyRXpjc3pa?=
 =?utf-8?B?M2hXVGVKVVJKcGNpMXlZaldIUjhwRUMrNzh2U3NXUUQ5bW1qNlJXcU9HZXp6?=
 =?utf-8?B?VlhTV2JtTExBQ0FLTDF3b3hydFprY2FmR3pwWmowVmlwRUhNWi9oZ2xaY0gx?=
 =?utf-8?B?VVd0RURha1hoZExnVSs4NXE3ekY3WUJlQjJhOWZkT2RGdkRaL2hteVAwOXFh?=
 =?utf-8?B?U3NySENmaDBKenZPWGU2b1NScksyV2U5TFQ5WHhiWXR6NTBHMTJXZFNtdmdv?=
 =?utf-8?B?VXQveXFGQzMxTU54V0E1WlpkanNEZHMvaTRMZHNBQkgySG9wWktlZTFmdnpH?=
 =?utf-8?B?NUhnVzJWcExJQ1g5Sm8ydzM3UVRsOHZ5dkE1aFE4V1dLMzh5eDR4WmhJU1ll?=
 =?utf-8?B?NHNhMzExdUZOd1pCbEdQUG1mTklnQUJ5aWlRR2k5ZVJNZmV0OU1DeWZ5VEho?=
 =?utf-8?B?aTl0a3NsY2RNbWlBckkrZkgrdHVwUEpyTzY1VmNyZWsyTDk2OExVVzZvVEc5?=
 =?utf-8?B?YThTaXA0V2R3YTBpb1g2SnBWbXQyWk1yUnNGR0Q1Z0lXMmhUSFBLcUwybUg0?=
 =?utf-8?B?SWVlTG5oT0J5cmpWNmkzL2o4S3pndjBuWGVmTUFHWmtBMGo3TUdYRmdlUXE3?=
 =?utf-8?B?UldiZFllRnhvb3kvT1JNV2NiR01jdDN5T1lVNER2SkVFWEE4dEpUQlhZVmRH?=
 =?utf-8?B?V0l5UVhMcHV4ZzZnd0Z0WExGSmxTN1k0SWdhVFljWVVlanpaTEtUcWtZVkZw?=
 =?utf-8?B?WW5PSHBwQkJBT0FJRFRlS0FaT2NNSUxBNWpENWllY2dxRzlpM2hHTlNvTHFK?=
 =?utf-8?B?SzkraXV2a2VGeFJUeUM0NHRvNEwyWkJXTTJxU0M2QVMvYXRjc09hdkZyVGM0?=
 =?utf-8?B?WVV2NUs0MmxDVnhRY3Y0TytEOExPUHpHRktiM2tTekFpK040akY5U0dXcCty?=
 =?utf-8?B?OHlqSHpoRFc5djZMZ2FQMjVaREZUazV1aHpjMFUwTFBneEp4ZmNwWFdGbmhN?=
 =?utf-8?B?cjQ2cUFJSlJRS0dKQU8zVTYxb1BxbmxOOVFnWmJDVTc4bWlsU21uamJETGpv?=
 =?utf-8?B?Tm4xZ1ZoT3M5TjZkS3FXdmNUTGF2QVFEL1dCbXFEK1U0MlRxeWlyYTRwNWgv?=
 =?utf-8?B?cXNyWC9jaERQNVBTQjhtbFN6blVDTE95N3VORDV1SkJTa3o0ZWVrTUJYQTdL?=
 =?utf-8?B?K0V1YXMrMm8waUQ4TDg0akJiWDRTa3BsV0VDK1BkYXNQQ3JDcTF2RkxoY3F1?=
 =?utf-8?B?SG5wTmw1RDhtMG0wK3c3cUNMekczK3FTQ0V2RlcwL09CSDBJUVhqTlRPMDF2?=
 =?utf-8?B?Vm1Xc29HZHY0T3BTMU9FbVJCcldFWjJwMGlMUmFwOVJEY1BMcjJSK1hDRUdP?=
 =?utf-8?B?Q1pNcnlmRkIzQlFWU1dyRFkwM2dHc0U1Q1VLbEQ2S1FNRkF0WGFxUTFBcTNx?=
 =?utf-8?B?TGplcXl0aTFmVlhTN21WOG9vUUFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 11:39:52.2636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e373d8ee-b2f6-4036-bd6b-08de5a741f79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4372
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,suse.com,citrix.com,amd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.963];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 70FF875351
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 7:19 PM CET, Andrew Cooper wrote:
> On 22/01/2026 5:42 pm, Alejandro Vallejo wrote:
>> On Thu Jan 22, 2026 at 6:10 PM CET, Andrew Cooper wrote:
>>> On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
>>>> Open question unrelated to the series: Does it make sense to condition=
alise the
>>>> MSR handlers for non intercepted MSRs on HVM_FEP?
>>> I'm not quite sure what you're asking here.
>>>
>>> ~Andrew
>> The handlers for LSTAR and the like are dead code with !CONFIG_HVM_FEP a=
s far
>> as I can tell. The question I'm asking is whether there is another code =
path
>> that might invoke MSR handlers for non-intercepted MSRs. I can't see it,=
 but
>> I'm not sure.
>>
>> If there isn't I'm considering (conditionally) getting rid of them.
>
> Introspection can (and HVMI does) hook them.=C2=A0 Changes to LSTAR durin=
g
> runtime is usually an exploit in progress.
>
> Nested virt also makes it far more complicated to reason about
> "intercepted or not", given that there are multiple opinions merged
> together.
>
> ~Andrew

nSVM definitely would trigger those, ta.

Conditionally removing nSVM is in our roadmap, and VMI is already gated on
ALTP2M. I'll put this on the pile somewhere.

Cheers,
Alejandro

