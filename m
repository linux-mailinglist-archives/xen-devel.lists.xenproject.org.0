Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KUYA9rzeWnT1AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:32:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C3EA0793
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 12:32:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215518.1525694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3mg-000341-9O; Wed, 28 Jan 2026 11:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215518.1525694; Wed, 28 Jan 2026 11:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl3mg-000315-6h; Wed, 28 Jan 2026 11:32:30 +0000
Received: by outflank-mailman (input) for mailman id 1215518;
 Wed, 28 Jan 2026 11:32:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pnMD=AB=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vl3mf-00030r-Ej
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 11:32:29 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03b9aebf-fc3d-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 12:32:24 +0100 (CET)
Received: from DS7PR03CA0214.namprd03.prod.outlook.com (2603:10b6:5:3ba::9) by
 PH7PR12MB5808.namprd12.prod.outlook.com (2603:10b6:510:1d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 11:32:18 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:3ba:cafe::e0) by DS7PR03CA0214.outlook.office365.com
 (2603:10b6:5:3ba::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 11:32:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 11:32:17 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 28 Jan
 2026 05:32:15 -0600
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
X-Inumbo-ID: 03b9aebf-fc3d-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IazrqRPnNhEHjQYVXtO3ZgB20uAWJKZXyoPnFmsVQ1veUgGNBU1PHn9zFURHFyATI/sZepTat9OI8YJRBSCgZI7jR7C/aMx4kRIucGWdD8Fp2tXnooxKodob7ORcsd6k6nK8lAlrEXVB25LZZNUI5F137Fzg2eLTN1/sWu7Nlu+ZSRYdJSnK+v55wEKavOVDIaVdK6SYUpe8nsKJuSqvYUyIOBzJyDPv0xy8JYTjWlwZTLnouOWqAYIgNkrAd3aJHk7ADm5HPOpyb2PXLZkXr2QyR2PSLOcUKc+HGSV7PVqGXXMBW0/lK/aaPouBACLrgevdgtZQKAeyGFekdxYQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXCltb02AeNfG5VaFE9sO7ywtk99X6xghevsjpTHKOo=;
 b=krrMHKeSDE2xqOADr47lYhFCp+6MUh2UewH0wuhbN5F3zGowBl9zycIrYMBuHWVCnBJY/QLinLOAqBs+UqhfAYHHuqHrki322PRiOmSJAfFKme0F3HXvsriIniqe0AUrLZ37TDsq3E36zzMMfrCOTQ0NV3oY6RaVY2DyB7MvyiJjyoBnbvlF+cJHmKAc0wN00udelY/brjN5GipqVEBUm73RoROOSWkKI/ccjnmascHD9gPl2KEZp76v8C/cuKEUFVDlI+sOROhdeMCGPO8lGVjrgBjfSTzURfwukGMYOcnvq0YGhV1YyBK8VRkgQVt3zBxb4O3hddH9TUcWglbY3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXCltb02AeNfG5VaFE9sO7ywtk99X6xghevsjpTHKOo=;
 b=wLbJ7mH9Bz2bR27wqtEGopBq8OUQZZ094RsiDyHNuEOcbMD8DM0QvdkduQBnGtbT7+Awbw60+4VOEvqDvb0KXEC+IOVZG/MpxCBenVelIZA1VtAk3lNpCq4kgd79kK2C2yWXpmIzIQqufcGEOPnJ1N+MlytDBCa0h5yR+GosSH8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Jan 2026 12:32:13 +0100
Message-ID: <DG06TMTPTXUR.79SR3GGH8OHW@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] CODING_STYLE: Establish a policy with regards to
 copyright notices
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20260127182403.141459-1-alejandro.garciavallejo@amd.com>
 <b42af5a5-6237-47d2-9b74-0154ef8c2020@suse.com>
 <DG03S6HP7OIO.18ACUNFC24X1Y@amd.com>
 <ace6c97f-aeeb-40c9-9c0b-d6ad45fe09d6@suse.com>
In-Reply-To: <ace6c97f-aeeb-40c9-9c0b-d6ad45fe09d6@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|PH7PR12MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: a1df70dd-06de-41f6-3cf1-08de5e60e49d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEoxTXVxUVJQYTIxSnplM1NBM3BmazhrQ01YYURxNGNINE5BTjRHeWV1dm5T?=
 =?utf-8?B?a001T0Njc0IwZGVyRXJ1bHh6b2JHbytKVnp5ZGpVNlU3L2lZVGtaZ3IyNHY3?=
 =?utf-8?B?TG9tMjIrekRPTkJXMS9vTWpuclZTdEJQNUswamJZa1Y4eXU5V3dNM1JwNm1H?=
 =?utf-8?B?amdtQUVRY1BOU3U1SUJqL3JDWk02MmpyVnBTY05sWVY4YTBldE10SS9uMW5K?=
 =?utf-8?B?Z3NHOS9Ec2VpdmJuTmtiNzRJZTFVN09Vd2lYSU9ma2tneVpQNGlnQ294QWww?=
 =?utf-8?B?Wkdvc2pnRjJRR1ZMZlozNktISERXdzdPLzBVc29ScGV0dElKeklIcGxnWmNz?=
 =?utf-8?B?MVErTDVnWEJPdmdIcHZjUXBhVnZnNnlKbWlhOXc2RUJjRDJHTng3K0cxdjZG?=
 =?utf-8?B?V2FveTVWdEdhMUxNWFJablFaM01DblB6ODd4bkxBdUNNTTd5aVNmMmh0d3Fz?=
 =?utf-8?B?T3BkUE1nWlhQaTBnMklVcmMzK25haDNlYzRGVDA3a0UzaWdMWHdTUHBiV3F5?=
 =?utf-8?B?WW5aK1BjY1lwNGlqNGdrcU1lLzJYVW1FaWlxclVmRlU3RXJTcHVKVTBIWjJy?=
 =?utf-8?B?MUdhb1dzSFdtVmxjK2hRRUFjaUZZcWpidGJ1YmNxSjlVZHFXb3NzemoyRGkz?=
 =?utf-8?B?Y2pSWHg1ZVFjQXRJdXZNcmZjdnp1TWFGSTJ6ajVvZjRUQTZHR2trelZrMVVR?=
 =?utf-8?B?eWx6RGd4VlRNMEFhL3crSVlBTHZUYXNHT1dNcU5PenczelA3d1pIM3pFYTJD?=
 =?utf-8?B?VW54VExQL0VEM0hBRWtteDdJYTJsL2xNM2RFZ2dFSXZ5eWsrVTFTTm1WSWFs?=
 =?utf-8?B?cjRMVWlpRnNaUkhIRGd5VnFsSlhPOHR6a2c5aU9UK2t6RWtPTmdZSTVKemJF?=
 =?utf-8?B?aXFGY2ovS2xhOE1iRHlLTHk1N3ZYUXRVSlhTT1JTVWJRWW0wZGFCdnlDWUV6?=
 =?utf-8?B?eXZjSEduUENKUjc3eTMwOGRyRDF3RytIdE5CcjE0SzMzT0hqUzA3aGFFTE1j?=
 =?utf-8?B?Z1NibHJEWDlwTzBTREJMV3EzbUJleDd1d0hpbXNPV1JmM3RWUVBZeDIxRy9N?=
 =?utf-8?B?NVRzRE84VTl4NHV3cm1XN1ZKdGlkTWRrSHZDay9Vdk5zc3R1U0FteVd2cjFx?=
 =?utf-8?B?VFY4eXFWUnZJOXBLQ2RQdWFvNzBnYTRtZEtkaGF2UTRrYklERW9QR01ud1RO?=
 =?utf-8?B?NGo5YjRyMUtCSmN6RCsvY2k0R3dqTWpWenYwbTMxZlBKRDFocEJIdzhGai9l?=
 =?utf-8?B?cXRrSS9Rbk80NG1tNGJJdmhoblhIM2pEQjlweExvdHVjZG9renpabGM5Zlk1?=
 =?utf-8?B?QUdXc3N2MWV6Z3YwaUt3ZUhnYTRGMVZUOGV1dDFrellpbWlsdktjbmF2SU9X?=
 =?utf-8?B?RGNwL3ZndmFvb3pqOWlDV1liYmx6VHlUaTVyYVBDSVhIa0ZEOURMdmdrdEpl?=
 =?utf-8?B?c0xZdmt6UHdBMlQ4MmN6RG5JY05ZV0lKVmZKTlhXM2pjZDJOUVRBL082VTJ4?=
 =?utf-8?B?YjZISXRUdzQ2ME9CNlU1WDFDc2ZsK0R1K1hnNjhMbENMSitDZi9SZVUwTTJj?=
 =?utf-8?B?SW15SWhuZ3drOFZzaStxRlJxU3lpbmdGaEs0Rm5OTnlWZ2VVSTJCVjkyOEtj?=
 =?utf-8?B?SFpUMHFGa1l6THQyY2pwQnR2WjhiOWgwTmdnNVpWa21YZ0lBanZkZGc2Y3BL?=
 =?utf-8?B?cC9yY0RKSFRybUorMnJXRFRGbUEyeWJ0K095RDgyZmpVbVB0Y0RXZi9lMTNi?=
 =?utf-8?B?ZGJxWG9hd0E4dURwVWF6eUJncjZoeGcreVp2Q3FSeEFyak1wd210SHh3c3Zx?=
 =?utf-8?B?T0x0eGVyNDlHQkp1ZHFlM0p4cnh1YXBhRERPRnlXUU5vTGJIaHRsVnRZeHAz?=
 =?utf-8?B?Q1gzblBtVC9uRWlidE1ERWFyUksvdWl3UzhFbFZNdlA1MitxQU96REZpMEpC?=
 =?utf-8?B?Qis2VGhEdUZkd2hUVmlGYk9keGxvbisyTUw2S3hWOElsYTRRWFNWWGFYNHVT?=
 =?utf-8?B?aDRaWkhWY2MzZWNtclNKOThMUEZHSWZkMTgxNWtyODdZamF1ZzBjdGxsRnJD?=
 =?utf-8?B?VlZOVDRBL05PNktmVFkzcGdwdlNVWVE0UE5jcEFRV0ZtblEvUGlEdGtYYThw?=
 =?utf-8?B?d2E3ZTkzY0x0dHlJUzc0M1RZbFYya3JhUTV5VUREZDcxUzlWM1hjb21jRlV0?=
 =?utf-8?B?LzZIQ21FK01ITEpxRGd6ZVBDZ1gyQUJrT0JZb1Q4VGUyR3BOSFRscGtWTEVE?=
 =?utf-8?B?YVRId2tBLzFBYzlrTXRuTUkwNmxRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:32:17.8042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1df70dd-06de-41f6-3cf1-08de5e60e49d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5808
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 63C3EA0793
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 11:45 AM CET, Jan Beulich wrote:
> On 28.01.2026 10:09, Alejandro Vallejo wrote:
>> The refinement also applies to the second bullet point, so I can add it =
as a
>> separate paragraph stating existing notices are to never be modified and=
 only
>> removed with the express consent of the current holder(s).
>
> That's interesting, as it may be getting increasingly difficult in practi=
ce.
> Often you can't get hold of the holder(s), to the degree that - as we're =
all
> growing older - at some point they may not be there at all anymore. Yet i=
f
> not having such notices is going to be a goal of the project, retaining s=
ome
> indefinitely can't be the intention either.

Sorry, I missed this part. Many things are unavoidable non-intentions, I'm
afraid. A file might have a notice indefinitely, but that doesn't mean the =
project
_must_ keep that file indefinitely.

I'd definitely prefer to drop them all. Alas, I don't feel confident enough=
 you
(nor anyone) can legally commit such changes without the holders' approval.
Unless we were to base the rationale on "the notice is already in git histo=
ry"
or some such. At that point it becomes mandatory to ship the full git tree =
as
part of a release, which is incompatible with tarball releases. This might
affect downstreams more than upstream, but it's a consideration nonetheless=
.

It is true that having some already in, with new ones severely restricted
creates asymmetry with prior contributions, but I argue this asymmetry alre=
ady
exists with banners present for some original contributors, when folks (e.g=
:
you) have been heavily modifying those files for well over 10y and not adde=
d
their name. And if everyone were to add their name we'd have to scroll hund=
reds
of lines on each file before seeing the first #include.

TL;DR: Yes, some banners are bound to stay unless files were fully rewritte=
n, if
       anything because their current holder(s) can refuse to have them rem=
oved
       or not be available at all.

Cheers,
Alejandro

