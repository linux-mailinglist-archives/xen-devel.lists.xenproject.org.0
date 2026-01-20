Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG3hFCi0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1914821C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208811.1520948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viAYU-0008Di-FB; Tue, 20 Jan 2026 12:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208811.1520948; Tue, 20 Jan 2026 12:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viAYU-0008C4-CI; Tue, 20 Jan 2026 12:09:54 +0000
Received: by outflank-mailman (input) for mailman id 1208811;
 Tue, 20 Jan 2026 12:09:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viAYT-0008Bt-DR
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 12:09:53 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb7fd377-f5f8-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 13:09:50 +0100 (CET)
Received: from MW4PR03CA0088.namprd03.prod.outlook.com (2603:10b6:303:b6::33)
 by DM6PR12MB4139.namprd12.prod.outlook.com (2603:10b6:5:214::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 12:09:46 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:b6:cafe::8) by MW4PR03CA0088.outlook.office365.com
 (2603:10b6:303:b6::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.8 via Frontend Transport; Tue,
 20 Jan 2026 12:09:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Tue, 20 Jan 2026 12:09:45 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 06:09:42 -0600
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
X-Inumbo-ID: eb7fd377-f5f8-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMTXDhT5tGr2RQ2HfTC2nKgxz7XvSPp8tYWSG1QVniyy/5ZdFY0xNuE4Qc52SLjW40yqnRzT+wsYNCQTmWr5S+J0NjPIZ60rGl6lYMJigs/TfwcVYccUjSu2rbALqKbL2zCcsSUpKNf3+jvfug4GU8GKBcCI1aF+tyz/tbHCQ7fDTSNnkHt0fGqC14M1dw4pK5iGmJPAlfNtb3MqjKqrf0e8MOFQOPHAhVBmFnboZsldnJdZoCdxFLDx5w61NeIQ6fveDtSe8UeGyzOsD2W6Xe0glrOlKDUDVS5ZAXMWIEpbb/qGf/BnaQXAOloXvzGcAC/uTTnQNDE1h+ryEnCGbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sS2HGwOpJ9ILdUn0TXiUmZMJgrnPhsnR1OONZcpWWOs=;
 b=EJ273e24Ln80nGLK0ophS19qLm6CrQ3FRnXlgsYo11cqb1ASpm9wx5Zgn2dYJljuLqUUrjNnezHyy+uHn7n3eOKuED64TgRKY3g94SC/4A0cB4Pi8SbrobDsyFEvU6lDIlLA08ZJx7IAvV0HQJGggbkuc8lS9SKtO3pj5NLjlrI2wv0cfPlxAhmrt6vaqxYite2bLka+KGpEh8L2SorqdKgB6/hR6QI1ILejvI7dPl7/n5EOZmJn4Hi1pX4JyHudTp0xQDrImZiYUz2LREfm3oLMKRuS74WHqLDu2x9XTtjh9SxBW+Zs7ZYm+SU6ihGCsu3UpLp5y0c6AebWzMmlpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bugseng.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sS2HGwOpJ9ILdUn0TXiUmZMJgrnPhsnR1OONZcpWWOs=;
 b=Lkhj9sjdwDXLBlE5swzTThPyLMD0VsBOiGR4EJYeMMUiJcc4XDHiZwa9k/nbPGPbQ+FIsrCVOKbrYMp9NRm3toH2ozPrLRaCDZgWv7G1MIaPJnn8ZrWiYFOpRsVjWzA6U8lzGlkZ4pTX/Yy4wXudjEjiyMDiGNezDk4mgo+YRx8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jan 2026 13:09:40 +0100
Message-ID: <DFTELY2QHKPN.P7317UWE8QZR@amd.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v4 4/5] docs/misra: Remove earlycpio.c from the Eclair
 exclusion list.
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
X-Mailer: aerc 0.20.1
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <20260120093852.2380-5-alejandro.garciavallejo@amd.com>
 <1d374226e3f91ab3bbc05c3354c8f8fe@bugseng.com>
 <DFTDPKJN6EHE.3LH3Z9WEO0AGW@amd.com>
 <bd95ae24c9b9767467938dcd42a93a6d@bugseng.com>
 <DFTE7R78R78U.2T09MMJU7F0CF@amd.com>
In-Reply-To: <DFTE7R78R78U.2T09MMJU7F0CF@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|DM6PR12MB4139:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b60ebb9-0823-456c-7546-08de581ccce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODRYMFEvUzlWa3U3cDBHdml3bFVkaWlGaXhqSXdJN0NwQmVlSFMyN2pOY3hy?=
 =?utf-8?B?UkVhODA1dEVWN1VnZWRNc0J5RnU4SWMxUUJuUXpLeVJSczhraUUrek5CYnNz?=
 =?utf-8?B?TlB4Ymk1UVV0YlF1VnJ6dENlenRPbnpWVXNYWjMvTWt3OU1NR3FOVk9mSlRt?=
 =?utf-8?B?Ly9EdmJTSGFRTDBPS3lNS0JpV1J0YmYvL0JFUHg5S1E3K0J4U2ZFK1lRNmpS?=
 =?utf-8?B?VFFLeVp0N1RoU1lubEZZclpIWUdrMUYzK2VYVGRDdTVGVE9ka293RUxWcVpJ?=
 =?utf-8?B?b0NtdndCTVNESUhWQ3owVlZ2cHFEYzNSMGlhQTJiWnRIVXNaaXl1WlN1U3R5?=
 =?utf-8?B?R3RNSkFxcHF1SkRGZnZ2dG5mYWxON01JUE1xSXZhWjdQMmtsUENaWU11V0xM?=
 =?utf-8?B?TVFMRlVNdlp6RURxRFhRRWJLOXZMRHAvME5RUExqSk5Qd0tGeFN2bzNKQ2pJ?=
 =?utf-8?B?Q1JCZDZmcVVNTWJrbDdxNUhWQWF4ajhPRjFwRUVuaXNiaStva2JHa0JkRXFT?=
 =?utf-8?B?ckwyb21iWGkrRnRsVFl4ckQrejBubytwcnVGZGF3OGZLMTJrVzhiVzdZUlkv?=
 =?utf-8?B?TTQrWkRDS044UmdGc1oyOVRERldIZGFOSzRiajhjd0IyekFZNHpxaFFSakpj?=
 =?utf-8?B?djVZVzN5TmJNZitobHA5UTJMVHRyVHU2V2Q2ZDBCK3NHTVljc1NBQldjYTg4?=
 =?utf-8?B?WDQvYWZvT3VVK01hVHRpa2p6TE9SdVRzUHVYaUdWSXV5RFprVkpUSEFpVVo1?=
 =?utf-8?B?TjAwVFZRVFBYalNmYWtuWll4UGFSSHoxQ25vd0g2eW5WZlRvOU5ZTU5yUm9Q?=
 =?utf-8?B?NHBiU0pvRDN0UDNSNlpzYzVDdDYzRTRqeGF6ZmdqTnlmQzI1WmxWUDdPRk80?=
 =?utf-8?B?cjc5dGw4SlJVOFliWWRmeWJIalhFYmFqd3FRV2RTRTB3SG0xVjNoMlF1YVJn?=
 =?utf-8?B?QXRqS0VmZEJKODhLaDE0SDBBbDFtMFdFaldyMUZpczhkeVI3Q0F2UzhXc2FK?=
 =?utf-8?B?OVpxV3FQN1d4NHpJY0I2dXJsRVdJRXBvMnBDak9ZL2pueWg2SjkwckRCcGtE?=
 =?utf-8?B?eXBlWGtIUWovRUNCaTJpd0FEMFkzUS9JMVppMDFUS3ZGbmZyMkx6emRTbjM5?=
 =?utf-8?B?WGRQU0JwWWFBem0yRGVnTkE4VHBjYzlscDMvcDVXN0lkMCsvZTNiWnJDN01a?=
 =?utf-8?B?SWRMcXZhaklNd25oUGJWWUd6NkZqblF2Z3EvcDdvZGlGMkFVYkxIbThRVTMv?=
 =?utf-8?B?aWtRMTBPODlnUitWNWFNY21nTVRHWm53cDBtTW53S280cVpXb08xL01PalQx?=
 =?utf-8?B?SmlxalNKNGJKKzQ0T1A2cnVET2hTQlZxQlg1cm5UTllYbklyVnJyaUUxc1p3?=
 =?utf-8?B?YjBhV2VQM1ozbkxJK3hpTTR4cmgyZ1JoVlR4Y0JLaUVSbHlCODdkaGNJazRT?=
 =?utf-8?B?d1NlTFYrRml0L1Z5UWVhRTBsODdhaTQzOGF3Y1VKSko4SUx5RTJhNDlLMkF6?=
 =?utf-8?B?WUNnMVo4Vm53UmpHOVQrVXdQV3JLQlNBRm9xTnlRS2drSGhwMW9CT1FadUFl?=
 =?utf-8?B?dzJUK3FMZmZCNExyczgyNXA2SHg0VXZoOEJPY1h5TTFxME1JV0JXSFUrZkhV?=
 =?utf-8?B?Vjc0Y2R1MEkvRE41WWhRRXBVaUxqVjVKZW80aTJ5OEpubTBza2Z3dHdMbGR2?=
 =?utf-8?B?VEFQRXk1U2RSRkZPa3lpeUsxbUxwZTh5ekRZOVcxbWM5REE4eXhXS25OenF6?=
 =?utf-8?B?WVI2czJoekpFdjIwakF5cENCMkxGWmhDczMzK0pXMHVMVUcxYWI0UlJFOHI2?=
 =?utf-8?B?bFYxRXpBYksrSFJVZXdPQXR4V01IV2JLN1VHZW80RVBnVWRsOUpJcjFhbmsx?=
 =?utf-8?B?aG1xd1hFczFMVEdoWTBTakRxQWhZV0xSZkZabG1EUG45RzZRL1VTdmljYTBM?=
 =?utf-8?B?OTdyeDlOK0VpandJeEMrWDQ0YllpbUVaamJOa25iYkFCRUdUMEk3TUd2bFFv?=
 =?utf-8?B?eGhMQzFmUDkxZVJBNUIrdTI5SGpheHA4V1NQUVArSjJ0ZXRYd0x6cUt4Mk51?=
 =?utf-8?B?QUtJT2h3cU9xZGxtUnJ3dEV6bGp2TTN1Wm5qYmJ3NndjbU1SRloyMnB1UXRr?=
 =?utf-8?Q?50WKp8ZhCYVD2Wb27kRai4jY5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 12:09:45.1977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b60ebb9-0823-456c-7546-08de581ccce0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4139
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:url,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel-bounces@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CB1914821C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 12:51 PM CET, Alejandro Vallejo wrote:
> On Tue Jan 20, 2026 at 12:41 PM CET, Nicola Vetrini wrote:
>> On 2026-01-20 12:27, Alejandro Vallejo wrote:
>>> On Tue Jan 20, 2026 at 12:21 PM CET, Nicola Vetrini wrote:
>>>> On 2026-01-20 10:38, Alejandro Vallejo wrote:
>>>>> It's clean.
>>>>>=20
>>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>>> ---
>>>>>  docs/misra/exclude-list.json | 4 ----
>>>>>  1 file changed, 4 deletions(-)
>>>>>=20
>>>>=20
>>>> Hi. Do you have a link to a pipeline?
>>>=20
>>> In the cover letter. I only run it on allcode.
>>>=20
>>
>> I see. I can spot these additional violations from earlycpio.c. It does=
=20
>> not result in a failure, but only because x86_64-allcode has also other=
=20
>> non-clean guidelines and is thus allowed to fail. Ideally in some=20
>> copious free time I'd send a patch to create a subset of clean=20
>> guidelines for the *-allcode analysis that is failing, so that the=20
>> "allow_fail: true" can be removed.
>>
>> https://eclair-analysis-logs.xenproject.org/fs/space/verdesse0/XEN.ecdf/=
xen-project/people/agvallejo/xen/ECLAIR_normal/ucode-disable_v4/X86_64/1277=
1570090/PROJECT.ecd;/by_main_file/xen/lib/earlycpio.c.html
>
> The web interface doesn't allow to search?! Sigh... thanks for the pointe=
r.

It's your usual mess of miscasting, enum-as-int, etc.

Would you rather keep the exclusion and deal with it later or let it pile u=
p?
I just don't have the time to go into it myself.

Cheers,
Alejandro

