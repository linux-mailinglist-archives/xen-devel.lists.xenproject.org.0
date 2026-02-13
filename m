Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKDgCelZj2lxQgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 18:05:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E1A1387B3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 18:05:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231507.1536675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqwb4-0004nk-2Z; Fri, 13 Feb 2026 17:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231507.1536675; Fri, 13 Feb 2026 17:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqwb3-0004lh-VN; Fri, 13 Feb 2026 17:04:49 +0000
Received: by outflank-mailman (input) for mailman id 1231507;
 Fri, 13 Feb 2026 17:04:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FeGe=AR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqwb3-0004lb-5X
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 17:04:49 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18db772d-08fe-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 18:04:47 +0100 (CET)
Received: from DS7PR03CA0039.namprd03.prod.outlook.com (2603:10b6:5:3b5::14)
 by MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 17:04:39 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::f0) by DS7PR03CA0039.outlook.office365.com
 (2603:10b6:5:3b5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.14 via Frontend Transport; Fri,
 13 Feb 2026 17:04:22 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 17:04:38 +0000
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 11:04:36 -0600
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
X-Inumbo-ID: 18db772d-08fe-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xI43GM9jkVmStgDXZtpnxmt7uZFPZfcPbVPP/M/bZH3Blo3QJqNhlqlt5SCv8JVQCfY0QBTsxN9kAjHMCQos94HHpNCridKo46J1PXrIuEk2ub34PGvYjn1fn+BYj2dG7R+FWpTUP9yzo7qHjjwf2TRehQlzmTFN8pzmLKGCgFjsdv/7zH95v1rGaPNfbjFKvjLL3vWWgnfs6wE8u3mJqxuy6q8yK7lUUVFPCs7EVexodgwR5SumBDeMc6ukZ3+btx3EaThvoW1ResKWJSsPbjMQSms5YJ9mStesYq5d9TNA4KsAjN6oyycE7mHgTrm2ycLNMnCSuJhiOk/Cwgk9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcFBDzqpXf0gs/Pg3HM2umZi4ZWLrusXEn7FQPrAlDU=;
 b=H63k7sG2pF8v/Sl2Lu/gqkgfCHbpPlkhakKMKeh5OZVFD47Nc1CT5lFT1tvejB3mI4aaSi7c7POjZpc2uFslqtdQ767rLHz0Zw5g5oFXzCO7tAXtsTKRxov+LCA73Q6m/N4IwSGwoDjq280YgnRXSGNvtLrMppYeBw7/7IhiRucLgRIf8TR29xzDqM+bPQ+yptULIJKgNHaf+yX+rF7hkGL+0HVg7SedQG0j5FVsEr9xYk0kqXi1WCGjX6e9IIiUrpNE9ckGgXq1zJw/nBUul0gnjXG1dWWn/Ekn9JgAaLKczZi+nDBSXcALkWujp9ADootHCqhRPElQFbpve35OZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcFBDzqpXf0gs/Pg3HM2umZi4ZWLrusXEn7FQPrAlDU=;
 b=S5eAuVe+mbF+MbHiyiuHDeyz6nnv8AlmfYbP6cjBfCB3bd0zSrNcxW85xJwbE+8/UvVJHRDJU4EKmaRAbWqp5aKzcF9QTgKpGFLSzcYQ2Cca3HgnaMF4PLVfy3CI5AH1O2l6JfZ+ZhK33OWfkJ65LDWgTxcR+epl/vhN5KwXPmU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Feb 2026 18:04:33 +0100
Message-ID: <DGDZWSLET8UI.3AMV83AW7Z3I0@amd.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86: Make hvm_enabled a constant unless both PV and
 HVM are both compiled
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.20.1
References: <20260213133732.132326-1-alejandro.garciavallejo@amd.com>
 <20260213133732.132326-2-alejandro.garciavallejo@amd.com>
 <aY80qJVIZOjjqBOS@Mac.lan>
In-Reply-To: <aY80qJVIZOjjqBOS@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb08.amd.com
 (10.181.42.217)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: ce729df3-934d-48e8-992c-08de6b21f916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODhLWGUrUS9na3hYYXFIaXYrVkZyK2ZleDkvVWZpMDZxMkU3QkNPUFJ5TGRt?=
 =?utf-8?B?SGxIN1VzcWg3L0s3b0FmMlVWVnZQRHcwT2FOeFNBWm5QbzJOQUljbkgzWkVa?=
 =?utf-8?B?Ymc2N0VLWlFIdVJDMGlmN2NNcjJnbjhXQWp2MDEzZ0JudS9WOXl4R3FHMWs4?=
 =?utf-8?B?OHZVaDRadXh3WnBTbVVkUjJKcWQ5L0hhU1pCWmFzR2svbWZCa3k2M2NuSVdi?=
 =?utf-8?B?T2wyWnhGbmM2VnQ5Qkc5UURtb1ZPWHBObXhYdFZ5T2ZUZ0ZQS2ZCVVhmZHBh?=
 =?utf-8?B?Tlcyb0lRbmE4Z3hGOERydjFoQTYvaVJaekJRWWFwVjA1d29Ka2RiTmFxQnlI?=
 =?utf-8?B?WVZHOVM3S3JDZkdTMS9qWlhacG9IQ2ZTR1A0TEtHNlY0bEVOek1OUDg2ejZF?=
 =?utf-8?B?bXBGZ1RNTTBKYml0dzBKR2RFWjJvVEhWMzdkUEpzaWQvaW0wbW1KVjdYQ2tF?=
 =?utf-8?B?Q2pVc1FvRU03YUJseGhrR2IvSnFKTyttNlFxT2thRENNbGtXVC9zczYzYmxp?=
 =?utf-8?B?UUE5L0VUWDhrUUQrY09GNWV3djZCOXdneit5TmdzUERZTmVGYWVjRTBvMm1K?=
 =?utf-8?B?RWljY0FFaTB2bjR4bG42c1RTc2YwdHRwdFFzbVM5M05LRXlUTVg2QlhRME9j?=
 =?utf-8?B?clJjbDdqZ1R6UUdsbThlV2lxTlk4OHBjc04xVVF3OVFCM0o0OUhNa01tZUdM?=
 =?utf-8?B?T1VhelVjbVJ3NGgvT2FPU2dlUDNraGZGcHRobVhOb1JuUWJnOHJTd0o1QkNS?=
 =?utf-8?B?QWZ5RWNvcERjM3RIbjBVTFRZcWdLMWJWRjRIS1NmQWJ1cFZlbTVNVEREdmVL?=
 =?utf-8?B?b0Rmamc2UXhpQXN1ME1LNXBYNzlBV05sL1pIT1crT3dPczNuZkE5c1JTMm5N?=
 =?utf-8?B?Q0dWNVdVYWxHU2pnQ1Z0S3VycCs0Zmd6WXpSdm5KMlhaeFIyL1ZNSy84cVUw?=
 =?utf-8?B?elRzMlUyOUtuWU4zbzFFbEZWMldITnRHVDdFeTdzdmRNL0JIVHViR1RwZTFE?=
 =?utf-8?B?YW1KVm5WM2JxYU9NRDV5RVZuckREaTBDQW1Vam1uaW9BcXlrRXBuWEtPUG8r?=
 =?utf-8?B?T1ZIOXlzNWJNajdWL1p6TWtNcDIxRmlwdU1la2FLVndPWk0wVzhIU3cyNDJa?=
 =?utf-8?B?NkRvaUIwdVBMRDNiQ3lHeFVLOXJhS0dvMFMwdjAvNTU5MmUrZmJhZkhjM0w0?=
 =?utf-8?B?VUJvcmN2c1NUdDN5TForK29KdkJVM0RDeFBkc0FqTzg1YlFYMGp4ZXlqTzNa?=
 =?utf-8?B?OEpNaDI1NXRodURnUUlWbE9UN2czSHExL0YxUlB2eFZyZ0IydmdJYzlQajIv?=
 =?utf-8?B?aHR6QXRKTU1keUZHZXRWbDdBbjZHb3VJWUczSVVmMGY0ZXVUOVRCYjF4TmFH?=
 =?utf-8?B?d1pwODdPOTB5MUo3bDlYeGNWQmxCbXlmN1JzczByWm5QQnk0SG5KRXdnUG5P?=
 =?utf-8?B?cWRRQi85Yml4TWxOMWg3by9yTGFXaTZQejhDVGg1ZjhvYjBnT0NOR3BjZUZV?=
 =?utf-8?B?U0J5OGNGc0xGTEZBVFZ0TUFFUmlrUlNKTzlLZXkrcmlSMVhRdDRUYXRWYlJh?=
 =?utf-8?B?TzBjTW5TblhHWjRoNWdpTGkvRTcvNndTREhBRlNLM1BybmpxWDBtZzhiL21i?=
 =?utf-8?B?ZTVCYTNSeExXV1Bhd05ZdjFaVUJNQ294cFR5VVdMZ0REcGQxalBhSmw3MWxI?=
 =?utf-8?B?Zjd3ditkWGJHSGZBbjVQVmdSaHNtb0N5Ukd2VTF6QSttYUZuZEhtWUZIcmp6?=
 =?utf-8?B?bXVFd0dVelpPcGVFZTlDcnJLVkQ4ZVIrbjY4ZzFTZEFCMmN1Vzd4Z01OdTM4?=
 =?utf-8?B?QWYzQVhrKzQ3Zy93b0lSZjVicXYrK2lsWVdmWDU2VUxWR0hNbGg0Y0JvNW1B?=
 =?utf-8?B?Y3dmN0FESzFweTF1WVIvaEQybUhMQVNKUldQRjFKcjhucjZBc0x5YmhZOCtW?=
 =?utf-8?B?ZDA3NVBHT29hNW54NWw4UGFadDZXc1dYNWF3VXdNRTNPTVFsQ3lYUDJNbmNt?=
 =?utf-8?B?OCtqMDVDejlUTk03dGF6eFhoMFM1M3F5RlZBS1hVMHNCUnVJWk15bU1SZkZ1?=
 =?utf-8?B?cC94dFh6MnN0anRsZjhMV1NOWkhqNURBcFpJb05KR0kxdHc0aE9wT1JmSHVq?=
 =?utf-8?B?N2VYc01hNldHUUx4ejk4NWdUbGVteEtLdzRCT3U2bzl0QUZzcC9URWprTjA3?=
 =?utf-8?B?VjlYckkwT1VnTnlaVUpLLzF4Y1VuYktyT1FvcWQyQkwvdVNPQVZ5WUZoNWFy?=
 =?utf-8?B?WmNiU05IL2FMNC9zSkQ3WDZ5WERBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+lEfZspk+fVZdo1ksPV3HQgupTww6uUQqOtYTK8R9SzFR7EJlbyCVsNiQvF2vxgA55g8yIkbe6GOINAbw7wGmUalJe6qKO857LStgdte9E1uOoXwUSm3Uxrk9Yxba3j4hCJj87veBZSadn1rl0c+oWSTOwkKu15uQtndETgJw5z2wqd7R5k2TZnz8I2Asfh73wyNCA5BbnknrDGIu4ED/O8W+9dApDy+gkf6YNbppj0NhJag/EwMm67qZxF39tS+v1RghU0Q9HyQIv/fR2/pVPs8ksn2/Y4//1Tyc1GH6qdi5WLx6YKYQ7PGvk9eUbXzSyRoED3soF/IMX7hH+a0CsX0MMkzOHiku6CFP4N5LDHMFcJXm0Fc2R+DX66Ac+zBx4pATO/qwj80woFJpImoRCzQhfTJzjmFE3Y54ZMjY2y6PAZ9dOXG8KV3MgpQbi8b
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 17:04:38.9503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce729df3-934d-48e8-992c-08de6b21f916
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 79E1A1387B3
X-Rspamd-Action: no action

On Fri Feb 13, 2026 at 3:26 PM CET, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 13, 2026 at 02:37:29PM +0100, Alejandro Vallejo wrote:
>> PV-shim already has hvm_enabled optimised to false, but there's no
>> reason HVM-only builds can't benefit from the same optimisation as long
>> as we add a boot-time panic in case HVM support is missed. Many branches
>> go away, some in the potentially hot switch_cr3_cr4.
>>=20
>> HVM-only:
>>   add/remove: 0/1 grow/shrink: 1/9 up/down: 1/-162 (-161)
>>   Function                                     old     new   delta
>>   arch_do_physinfo                              79      80      +1
>>   hvm_enabled                                    1       -      -1
>>   symbols_offsets                            30732   30728      -4
>>   symbols_names                             108029  108022      -7
>>   symbols_sorted_offsets                     60656   60648      -8
>>   flush_area_local                             571     562      -9
>>   switch_cr3_cr4                               311     300     -11
>>   init_xen_cap_info                             62      43     -19
>>   arch_sanitise_domain_config                  885     863     -22
>>   init_guest_cpu_policies                     1270    1247     -23
>>   hvm_domain_initialise                       1127    1069     -58
>>   Total: Before=3D3797004, After=3D3796843, chg -0.00%
>>=20
>> With hvm_enabled const-ified, it's fine to take hvm_flush_guest_tlbs()
>> outside the CONFIG_HVM ifdef and remove the stub. They compile to the
>> same code after DCE.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>>  xen/arch/x86/hvm/hvm.c             |  9 +++++++++
>>  xen/arch/x86/include/asm/hvm/hvm.h | 30 +++++++++++++++---------------
>>  2 files changed, 24 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> index 4d37a93c57..da56944e74 100644
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -72,7 +72,9 @@
>> =20
>>  #include <compat/hvm/hvm_op.h>
>> =20
>> +#ifdef CONFIG_PV
>>  bool __read_mostly hvm_enabled;
>
> __ro_after_init?

Yeah, seems to have been missing originally

>
>> +#endif /* CONFIG_PV */
>> =20
>>  #ifdef DBG_LEVEL_0
>>  unsigned int opt_hvm_debug_level __read_mostly;
>> @@ -173,9 +175,16 @@ static int __init cf_check hvm_enable(void)
>>          svm_fill_funcs();
>> =20
>>      if ( fns =3D=3D NULL )
>> +    {
>> +        if ( !IS_ENABLED(CONFIG_PV) )
>> +            panic("HVM support not detected and PV compiled-out\n");
>> +
>>          return 0;
>> +    }
>> =20
>> +#ifdef CONFIG_PV
>
> CONFIG_HVM I think?

No. CONFIG_HVM always holds here, what we want to remove is hvm_enabled bei=
ng
present when CONFIG_PV is _also_ present.

>
>>      hvm_enabled =3D 1;
>
> =3D true;

True enough.

>
>> +#endif /* CONFIG_PV */
>> =20
>>      printk("HVM: %s enabled\n", fns->name);
>>      if ( !hap_supported(&hvm_funcs) )
>> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/a=
sm/hvm/hvm.h
>> index 7d9774df59..dc609bf4cb 100644
>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>> @@ -261,7 +261,11 @@ struct hvm_function_table {
>>  };
>> =20
>>  extern struct hvm_function_table hvm_funcs;
>> +#if defined(CONFIG_PV) && defined(CONFIG_HVM)
>>  extern bool hvm_enabled;
>> +#else
>> +#define hvm_enabled IS_ENABLED(CONFIG_HVM)
>> +#endif
>>  extern int8_t hvm_port80_allowed;
>> =20
>>  extern const struct hvm_function_table *start_svm(void);
>> @@ -399,6 +403,17 @@ static inline bool using_svm(void)
>>  #define hvm_is_in_uc_mode(d) \
>>      (using_vmx() && (d)->arch.hvm.vmx.in_uc_mode)
>> =20
>> +/*
>> + * Called to ensure than all guest-specific mappings in a tagged TLB ar=
e
>> + * flushed; does *not* flush Xen's TLB entries, and on processors witho=
ut a
>> + * tagged TLB it will be a noop.
>> + */
>> +static inline void hvm_flush_guest_tlbs(void)
>> +{
>> +    if ( hvm_enabled )
>> +        hvm_asid_flush_core();
>> +}
>> +
>>  #ifdef CONFIG_HVM
>> =20
>>  #define hvm_get_guest_tsc(v) hvm_get_guest_tsc_fixed(v, 0)
>> @@ -498,17 +513,6 @@ static inline void hvm_set_tsc_offset(struct vcpu *=
v, uint64_t offset)
>>      alternative_vcall(hvm_funcs.set_tsc_offset, v, offset);
>>  }
>> =20
>> -/*
>> - * Called to ensure than all guest-specific mappings in a tagged TLB ar=
e=20
>> - * flushed; does *not* flush Xen's TLB entries, and on processors witho=
ut a=20
>> - * tagged TLB it will be a noop.
>> - */
>> -static inline void hvm_flush_guest_tlbs(void)
>> -{
>> -    if ( hvm_enabled )
>> -        hvm_asid_flush_core();
>> -}
>
> Is there any specific reason you only pick hvm_flush_guest_tlbs().

I didn't try to remove more. That one was the only one with hvm_enabled in =
the
static inline so it seems easy to pick apart.

I just tried compiling and I require very few additions to make the build
compile without stubs. I'll send another version with the adjustments neede=
d.

Cheers,
Alejandro

