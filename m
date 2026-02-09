Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIGhEQTViWmCCAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 13:37:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922D010ECD3
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 13:37:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225279.1531752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpPtA-0002qB-K5; Mon, 09 Feb 2026 11:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225279.1531752; Mon, 09 Feb 2026 11:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpPtA-0002n6-Ge; Mon, 09 Feb 2026 11:57:12 +0000
Received: by outflank-mailman (input) for mailman id 1225279;
 Mon, 09 Feb 2026 11:57:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EeIc=AN=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpPt8-0002n0-Bd
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 11:57:10 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 726cb90e-05ae-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 12:57:04 +0100 (CET)
Received: from BY5PR17CA0011.namprd17.prod.outlook.com (2603:10b6:a03:1b8::24)
 by IA0PR12MB8085.namprd12.prod.outlook.com (2603:10b6:208:400::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 11:56:58 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::47) by BY5PR17CA0011.outlook.office365.com
 (2603:10b6:a03:1b8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 11:57:01 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 11:56:58 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 05:56:54 -0600
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
X-Inumbo-ID: 726cb90e-05ae-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdCfqo8jicYVhAcwEjHmUXbjdKpqC+DNoao0nWtCi4A661MqI8q7JQUc6I5qLb7JZnJMpo4dLPJgQ+AwBBJxjcdkp7YqviBgn1/fzKPFFx7qRaiwEa4R0pjfncbt7yUdLCMbhh/4huPjm+dntxKig5A6cBpscbHV3FOEsswk05XWo7SH0mZs3fkSTgQTp4oFY/7riR8UcbBsE8mCpuGu31BigeWITwn9jEHKyZSW6NywKx0GWHUKVBdfZrUXsBAdqygs7q33jaJGvj+srx9H1stjMj+4xYN2MrWNTFf13sTYs2Te5w5ab2p97Zo0edJiYdsLiHk5LdJafraASA7KPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKz42avQEeqgp9Afgsat2XSqKjshh55Fm/ZrKyKf2m0=;
 b=MeZT9w1x9HKYBK6qYcaw/V24nlbNpWqGJhvoFkTzTbNqLOSlGWAkBUdtDOjIcVxD84yNiUVvyWfHlBP9GFSe3UCli0bY+6dW26rFYu/S+f7XcnYMqlFoDcirIlMOtHxp1RFdHvh2f18J0P7eFGrT9a3HaLX7pX87ickIbiLhjg22WXg04OsTKdWFFB1/yV9gJ6xQFQDgSeasw1XGVCuy6Z3GOaVJJS9szEd+XMusDh9FD05yHDZrFquLz+ttZ7gXzf1LfSezHClw1yiXDyjzu24hyQsdr/k/5RPGZTa8QiXRKUcrVjJj+7CH0nfFcTQmfpm2iTVzIjUG3lSj8HdNBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKz42avQEeqgp9Afgsat2XSqKjshh55Fm/ZrKyKf2m0=;
 b=s920qP1PegiP7Y8yrSJLO+lN8tUfRWTQa+ARpeXH98S2/5cV1yiG2mI73p5lc+EzecU4hjYQ80gfA8oEg/l9/W87xszYZB1j9Fl2NsmLq5ylgwmLuaKl/Irz8RT5qrmSGHir6UiMFBMY5TomNDO6LLRZZiK73eb/4Y9hlRpQ+8A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Feb 2026 12:56:52 +0100
Message-ID: <DGAEV1NFZF2A.2ATDMEFZAIZ5S@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 00/12] const-ify vendor checks
X-Mailer: aerc 0.20.1
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <608472d0-517c-4bc5-b5c1-c278c4f6620b@suse.com>
 <DGACI1R7MGDO.1SB7OMQQZ1NC3@amd.com>
 <836c1ef7-4ec3-4c4a-b527-17066327ff19@suse.com>
In-Reply-To: <836c1ef7-4ec3-4c4a-b527-17066327ff19@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|IA0PR12MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e06539-bed9-4e17-9cf6-08de67d253ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDdPdzQwYXhMemhkQ0dYeUdTNm41Vm93RGdMNUt1a2dHZVV2TnVuZGo3WER4?=
 =?utf-8?B?VHVVc3dnRTRrczRtRUhQSlpxNUN5OWhHekdwTWIwc0Y1eFplcDUyeDYvUUQr?=
 =?utf-8?B?Mmc0TlYvZTd1V3pYTEppVStZT2J5dDVySzlreW5Mbk4vVEx5Rm43aWpZenFv?=
 =?utf-8?B?Sm1kVUpIZTkxNGhHZjRra252ODB1VWlOM1Q5RlY2eFVSUGVFRzFrOVFKaG5h?=
 =?utf-8?B?bHNDOSs2dUhXQVJ0V1RKeUFnVnAyMGpLRWNPQlZ1RkpMVllxRlV5RG5GV3J5?=
 =?utf-8?B?M3BwN1p6S3BHTEZxRlVHVFFXUko3N1VTNnYyS0s4ZlZTVjNVMzZPV3F5bXRv?=
 =?utf-8?B?a1BUTmtaVjYzdFpBMWhicGRCVzFHWkdqSXJmckJOKzRvQ2pzekxqV215d2x2?=
 =?utf-8?B?aGVIeUFjdEhhUFZuekkzaGtVeGhSZitTTW1XK2xobUZwWDlLQzhEcXJmL1V1?=
 =?utf-8?B?SFQraVZ2RGVhbUtrYUhOQnc1WVJPMVBRVUVLajdDbStZclhUL1NmRXlJUlBq?=
 =?utf-8?B?WXY2OE9zWk5tQzNnMFZUdTVBTzRGZityZnpVb1dINjJlSTVEdUxYUTBMd3BP?=
 =?utf-8?B?WXZaVjE2bGp6N0VkbGF5ZTJ0ZHRJV0RUT1ZnQlNUdzV6cXRVNFdkSTFBeXFR?=
 =?utf-8?B?bTROejF0RFNSR2dDeFExRXpNcGFFM29DUG14dHJFUGFQZm1Oc3Z1RDZoWXR4?=
 =?utf-8?B?Mkx3SWRZeDFXcW9FT3ZWK2dMb0dyRS9BTlhQaCtSOXVvdnJYMFMvZkF1UW1s?=
 =?utf-8?B?TCtBcmtvQ0xyY2ZURjFvVnlFRFA3MXhyZlQ5dVpmWTB5SzdhSEZxSm5yaXI0?=
 =?utf-8?B?QnJ3Yk1CclExbWdGQXVyS2lKdUkxVXFOZ1RvR1lwRmZHcEJuUkQzQmpBRG5s?=
 =?utf-8?B?WGhHN3FlcDk3cU1XbFkyR1U1b001WC9TZ3FXQU8wNlZqMlRmT0g5VzhBMURT?=
 =?utf-8?B?T2kvWFlHTlgyNlRqd1VyOW4xS3ZWYXQ4bHRWZ0NNOXNUZFovK25xTDNhVXo0?=
 =?utf-8?B?aWRtZjU3UTV3WlNoUUFJK0FaLzZCNDFKcVNTdkJSODlqKzhYd05tOEFJNG03?=
 =?utf-8?B?WjhzQ2N4bUFOaXZLOFN3YkVFWGs0a09QUkFBTjcyVWN0a3BUVFdXS0NNSGNX?=
 =?utf-8?B?alIwY1lGUHd2bGdaaTlCVzZhWGlSMkxFMUlCTG51eWdaTEJJYjZ3RmFxN01H?=
 =?utf-8?B?VUtHR2lEbHBNNUt5Vnk0b1UrSlZhMGpZYjdCb2ZtZGNjUWk0Rkh2ckl4c3hm?=
 =?utf-8?B?cHRreGhheG1hVmxhTTFNRUtOVEF1M2M3eEVjdGQ1SlgxZU56WTA1a2FQKzJq?=
 =?utf-8?B?cHhOUmExLzZUcExWZDhiV2J5aVhTdW9QVERmTzVKVmpNU2ZWakVUOEdJcFhP?=
 =?utf-8?B?a3lINEVXODhTRTRHQS9rWUlVcjJCUjZMeGtFRDV1R3FPMDFEdnFjZzhUSFNy?=
 =?utf-8?B?alRnL0tJUng1VERYTG1BUXF4N2JBVGNjak9xbkpkZFJpYWlhdXk5a2x5Zm44?=
 =?utf-8?B?VmFVTEFaTEZPY2dZUS90SDUrNVZPVTh2b25wb0ViMHRpTUhxRThPcHNHaU0w?=
 =?utf-8?B?aGZtbTE1MXVtNzFXVExWYTZKRVBnbEVwNCtUVFRWWmF6d0NBZ1d6WWNiV0VI?=
 =?utf-8?B?RFdtMTRWV1N3TkVDaTRTeXRpWHVFa0owOGpHdGpka0NRL3lKbGQ0Z1lZMjNZ?=
 =?utf-8?B?T1dhdUxQVFBUbUZYNUNrM0ZDQ0NFcEhPVnBoNFE5SzBoOFhWcEsxYU5qbFFh?=
 =?utf-8?B?QXFSeG1MNVZwclBob2RHL3F1L040bi9Md1dyWXg2RTJiNnpjVDRPa2FlNjB0?=
 =?utf-8?B?eFR6c0JvdGJRTWNNcGJQOFpBNXpSbldkdWtyM2V0N0RhcHh1NWg2U1haWFY0?=
 =?utf-8?B?RWwxdWd2LzRJTDlqODE4ZnRQbjB4Z1BFTndhbVFEcEZwR0UrbEwyM3ArRFBB?=
 =?utf-8?B?cytoamE4L1pZcWNHRE5wbmt1ZWY3RjJ6aUl1dURhazluUURxSmFLY1VaS0I5?=
 =?utf-8?B?cmttSVBmU2RjRzRoV0hOZVlPR1lvWWRTc0dXYVh4TEZiYVZvL0d5Vy96VGJy?=
 =?utf-8?B?TzZvQnV5UVVYYm5EMnB5dWNqRlZsVUFTUTRrbVNNWEx0VTNGMkFsWDJJaUtM?=
 =?utf-8?B?NzF2WGVRZ1ovdWJCWXN4MWVLMjdpRGpyOHNuRmFvODNnd0tNdVFzU3A3NUlx?=
 =?utf-8?B?RDBUYUFSS1BKOTNBbVFCTDZjd2lueTVRZGVpWkVHZW1ZdTc1eUp3WWVPeEY3?=
 =?utf-8?B?aXFqQU1zWG1rblYwNVA2SGlWeXdBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	geAKpG2khK4y8t7d4qI6PLJ5YBbsvT5Cv/KyTBev5SV9/5LmWsBCYka5t3vtYVmiQ51lfkYfyA71bf5a5T2k+7bLmGau27XoAMZeI4/YF2SHLI7sFU43iwX+L61LvVomQm6kiRhb5XIc9Tm1/NQkTrTPHG4P74HUBJadE0TlXyX2v917N9mtB2XW4HlfmncuRCiTAju3eaKhcYUuyKy7fKl/RL/ncXBTpGjQwhlKMAFnthdBaKtGBRAMD6B2GSrDwuaq8kmaweklQpY0PeCVCkvRU2XjUFV5oEVCPkQUhXZ2NbZnIGGbgbNQIR0QKqerp4ANMIVhcUKC1foS9KRZADkt9hHm/iInMBjDQN9gSTn1FUfW/+eg+o4k3oRvA6hZevBT7zKylxFntYHiVuMmWzlbYeBaOs9opOqvgx7ImwGY6YoxmG5F1WzeV6N1wDmK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 11:56:58.0797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e06539-bed9-4e17-9cf6-08de67d253ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 922D010ECD3
X-Rspamd-Action: no action

On Mon Feb 9, 2026 at 11:15 AM CET, Jan Beulich wrote:
> On 09.02.2026 11:05, Alejandro Vallejo wrote:
>> On Mon Feb 9, 2026 at 10:21 AM CET, Jan Beulich wrote:
>>> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>>>> High level description
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>
>>>> When compared to the RFC this makes a different approach The series in=
troduces
>>>> cpu_vendor() which maps to a constant in the single vendor case and to
>>>> (boot_cpu_data.vendor & X86_ENABLED_VENDORS), where X86_ENABLED_VENDOR=
S is a
>>>> mask of the compile-time chosen vendors. This enables the compiler to =
detect
>>>> dead-code at the uses and remove all unreachable branches, including i=
n
>>>> switches.
>>>>
>>>> When compared to the x86_vendor_is() macro introduced in the RFC, this=
 is
>>>> simpler. It achieves MOST of what the older macro did without touching=
 the
>>>> switches, with a few caveats:
>>>>
>>>>   1. Compiled-out vendors cause a panic, they don't fallback onto the =
unknown
>>>>      vendor case. In retrospect, this is a much saner thing to do.
>>>
>>> I'm unconvinced here. Especially our Centaur and Shanghai support is at=
 best
>>> rudimentary. Treating those worse when configured-out than when configu=
red-in
>>> feels questionable.
>>=20
>> Isn't that the point of configuring out?
>
> That's what I'm unsure about.

I'm really missing what you're trying to make, sorry. How, if at all, is it
helpful for a hypervisor with a compiled out vendor to be bootable on a mac=
hine
of that vendor?

>
>> Besides the philosophical matter of whether or not a compiled-out vendor
>> should be allowed to run there's the more practical matter of what to do
>> with the x86_vendor field of boot_cpu_data. Because at that point our ta=
ke
>> that cross-vendor support is forbidden is a lot weaker. If I can run an
>> AMD-hypervisor on an Intel host, what then? What policies would be allow=
ed? If I
>> wipe x86_vendor then policies with some unknown vendor would be fine. Sh=
ould the
>> leaves match too? If I do not wipe the field, should I do black magic to=
 ensure
>> the behaviour is different depending on whether the vendor is compiled i=
n or
>> not? What if I want to migrate a VM currently running in this hypothetic=
al
>> hypervisor? The rules becomes seriously complex.
>>=20
>> It's just a lot cleaner to take the stance that compiled out vendors can=
't run.
>> Then everything else is crystal clear and we avoid a universe's worth of=
 corner
>> cases. I expect upstream Xen to support all cases (I'm skeptical about t=
he
>> utility of the unknown vendor path, but oh well), but many downstreams m=
ight
>> benefit from killing off support for vendors they really will never touc=
h.
>
> To them, will panic()ing (or not) make a difference?

One would hope not because the're compiling them out for a reason.
But for upstream, not panicking brings a sea of corner cases. The ones I
mentioned above is not the whole list.

Turning the question around. Who benefits from not panicking?

>
>>>>   2. equalities and inequalities have been replaced by equivalent (cpu=
_vendor() & ...)
>>>>      forms. This isn't stylistic preference. This form allows the comp=
iler
>>>>      to merge the compared-against constant with X86_ENABLED_VENDORS, =
yielding
>>>>      much better codegen throughout the tree.
>>>>
>>>> The effect of (2) triples the delta in the full build below.
>>>>
>>>> Some differences might be attributable to the change from policy vendo=
r checks
>>>> to boot_cpu_data. In the case of the emulator it caused a 400 bytes in=
crease
>>>> due to the way it checks using LOTS of macro invocations, so I left th=
at one
>>>> piece using the policy vendor except for the single vendor case.
>>>
>>> For the emulator I'd like to point out this question that I raised in t=
he
>>> AVX10 series:
>>=20
>> There's no optimisation shortage for the emulator. For that patch I just
>> ensure I didn't make a tricky situation worse. It is much better in the =
single-vendor case.
>>=20
>>> "Since it'll be reducing code size, we may want to further convert
>>>  host_and_vcpu_must_have() to just vcpu_must_have() where appropriate
>>>  (should be [almost?] everywhere)."
>>>
>>> Sadly there was no feedback an that (or really on almost all of that wo=
rk) at
>>> all so far.
>>=20
>> It sounds fairly orthogonal to this, unless I'm missing the point.
>
> It's largely orthogonal, except that if we had gone that route already, y=
our
> codegen diff might look somewhat different.
>
>> In principle that would be fine. the vCPU features whose emulation requi=
res
>> special instructions are most definitely a subset of those of the host a=
nyway.
>>=20
>> I agree many cases could be simplified as you describe.
>>=20
>> I do see a worrying danger of XSA should the max policy ever exceed the
>> capabilities of the host on a feature required for emulating some instru=
ction
>> for that very feature. Then the guest could abuse the emulator to trigge=
r #UD
>> inside the hypervisor's emulation path.
>
> Well, that max-policy related question is why I've raised the point, rath=
er
> than making (more) patches right away.

All jmp_rel() macros have amd_like() inside, and other checks are open-code=
d
in many places. The problem is that offsets into the policy pointer (which
is stored in a register) end up being global accesses to an offset from a
non-register-cached 64bit address. And that adds up. having an amd_like boo=
lean
in the ctxt would've helped, but I went for the least intrusive solution.

I'm not sure how what you brought up would've helped for this particular co=
degen
matter.

Cheers,
Alejandro

