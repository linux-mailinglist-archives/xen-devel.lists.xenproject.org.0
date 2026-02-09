Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAi0C3MJimluFQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:21:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C831112755
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:21:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225717.1532279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpU0M-0007Zo-Fs; Mon, 09 Feb 2026 16:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225717.1532279; Mon, 09 Feb 2026 16:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpU0M-0007X0-Cu; Mon, 09 Feb 2026 16:20:54 +0000
Received: by outflank-mailman (input) for mailman id 1225717;
 Mon, 09 Feb 2026 16:20:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EeIc=AN=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vpU0K-0007Wu-VL
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:20:52 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c503942-05d3-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 17:20:51 +0100 (CET)
Received: from SA9PR03CA0003.namprd03.prod.outlook.com (2603:10b6:806:20::8)
 by DS0PR12MB7654.namprd12.prod.outlook.com (2603:10b6:8:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 16:20:45 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:20:cafe::e2) by SA9PR03CA0003.outlook.office365.com
 (2603:10b6:806:20::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 16:20:45 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 16:20:45 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 9 Feb
 2026 10:20:42 -0600
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
X-Inumbo-ID: 4c503942-05d3-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEmzFPmU0J0J+7PSiQi7aW/5NPtEGaHEc7iaYoKvdBsHPsBYLKa2yJ/0KLa+cSGst9AKx717gADjjS57BZnylXSrsZsGopWxQr5ZvJyjZfT2IUHIVViL7/xrwzC451RDtWNglQYG1PR6IGmw1HKmt9g3kj5kVn9+HesBbzwXhPcFlP79BGy4Z69yIuEMIwrYWz6sQVq3zlKOFmdjUm9Zk5FdvasTynTBCCAGTw0PLRRrUe7Kxu276a2aFnbty0//Z4+IUC07qS1ydNCnTGRXjQouZB49FJLJcyS1QShWRY7xvtWV49sm8FluEi5PeXsUvtPXjnc6Zd+T+tHwIdBIbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odYkBrHhgmLyIEpIb0icSeEh36oiH3OQZicvnz2jtoA=;
 b=qGV/XmNeysoYaWn1rgWSghO+r+z384ziyifIy/Z+LDYCg/jKv2kZIEtn3ekIkKs++WOAGAn8OKn9i+NQ+S7qBj7Z21DWFx4oQI4Wr4RDQRcqlA6mFkq8z9ofjzkP9itzIBoRLIgSHc6Vb6lk3Xo7dfzG3heLZCZToOVCi2B67FEeLACowcKbkOFU7eFgamiRkLkEV6TTaRyePaVyQmGojJVK7gxxsrg84yFOgYnecoF8FlcoWUs/qiwj1l9lcmN/rxCJCYMpfuLDKlCwYIPcGSTOhGptWr8XkukmZomX7DFtSbhDKhgaQEql19NsOiMOm33MgAfUtVVcPIxKx/nf7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odYkBrHhgmLyIEpIb0icSeEh36oiH3OQZicvnz2jtoA=;
 b=X9qy7veBBJL6zWeLcq8isG310W6h/QHnCQl8rMZwZdJ34V8CLF7VQhEJEV1Q4xAhmR7JSa9VFaM3lqn15MIkylVnbKzzz4sSR3ydEMkecC0hPA5Jo1kH2zjw89jfyzofYORyH47jjavKv/48f/x/tZkmjYFGmfU8j+VZxkgewIE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Feb 2026 17:20:40 +0100
Message-ID: <DGAKH0QH3EG8.8GOWCPNH2Z79@amd.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH] x86/shadow: Delete the none.c dummy file
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.20.1
References: <20260209104104.7840-1-alejandro.garciavallejo@amd.com>
 <aYnyY2MArv4vTXsY@Mac.lan> <DGAJI3UYR98J.FU94VABOFZ5N@amd.com>
 <aYoDiDiJ4rRLxhmw@Mac.lan>
In-Reply-To: <aYoDiDiJ4rRLxhmw@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|DS0PR12MB7654:EE_
X-MS-Office365-Filtering-Correlation-Id: 688b8573-1564-4b72-f56d-08de67f72dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTdyS2JRaXZ5aHhGQnl2UWN0K2J3RG1DTFF1RG9XNnEwU2pwT2s3K3JCSzAw?=
 =?utf-8?B?Zi9sbDRxRmNjcUdrVTAxTG1pNmpRa0lDbkxqeVVPUmRGK2tCZlJzdE1JMjFG?=
 =?utf-8?B?c0ZpVUVLcGg0WjJPUVdRaVhLL2IzSHRURE1WWXJ0VngrNDFNSWt6YXhnQ3FK?=
 =?utf-8?B?TEtwQWRON0ZPZ3VCd2hZdDZrNFBlTmlMVW05a1VzUm9XZkhldkl5am1QZnpI?=
 =?utf-8?B?WXRML3V2ZlJsYk0wYmRrYjhBN21hTTNqRWRFdlU5L2I0b0d6bWw4U1JTeDBX?=
 =?utf-8?B?WU4vUFBlTFBsblFqblZ2VlZVVThENEJ6ZnJYaWY4aTMyYnJkOHYrSzdmc0tQ?=
 =?utf-8?B?em13bGt1T1FJWlBHV21QNUYrVWtxWElueHBWYXMvMCt1TkJZdnoxbGV5eXQ4?=
 =?utf-8?B?eVM3c1Ewei9LUXNtWnh0OHhyQzRONHlnWWJCSllEVzJYR3J2UDY3OWVOcTJi?=
 =?utf-8?B?R2J6WkNJSmtXNzFYWGRBWG9OL3YxYU9SSFV0bWtleDRGYTV1Z1Q5NmszRzYw?=
 =?utf-8?B?OWZYemV6MkRhcm82Z1gvQlFkT1F2K1BBU3lmNHhSbzM4VkliRUc5TzdYWHRH?=
 =?utf-8?B?cnJUMHBhekFTREQxeGp4ZCtnelVNUi9YbU5meElJc0tLVDlRM2pMeFRPYnB2?=
 =?utf-8?B?Ym53eUdtWCsySlFkeW8vVTNoYlJzYWdTRUJWbjY2TXZMbnZpLzZZd2pxaFJ3?=
 =?utf-8?B?Mk1RYUpQN2JHdVpPN1p6Tzd4QTNzeitRN1ZTNG80ekhkOGs1ZkNrdFoxVEhv?=
 =?utf-8?B?S2dRUWNKMkpUbmRPSU41aWxxZHduZjZhMmNNZGZnZVdjeVVvTlMrd09Zblpl?=
 =?utf-8?B?NTUxVlpVK1Zoem1zVzdZZHdBWjNnRzVNOWZiK0p2eFdyQS8xYms5SjVDdkta?=
 =?utf-8?B?TEQ5THd0M2RBaWNLWmcwamVrV0tZU1VsZE5qdUFOVzAwTlBJdEx1M2xLMWRX?=
 =?utf-8?B?b0lqdUtOL1dkdTd6bFdjcDUydkQvWmpzMlMxTG4wYWtVWWFuaWpaZFNCdWRK?=
 =?utf-8?B?WCtOSHBjTjN4Ti90c2s4Y3p1eGhFcmN2V3FoaGpuZXJmZzVTcXkrd0dpaFRO?=
 =?utf-8?B?aXZ2V0UxQjlzdHZtU000RXZ4b3hvNEsvZTgzdXBLTnZyeXN0b3BEbnB0VHhv?=
 =?utf-8?B?M0tLZHZNK0dmejQ2NG9wMXNOeTgweDJYbjVvTi9hekIweHVwbVhlZnh1b3U2?=
 =?utf-8?B?V1Ewd01uQWRvVXNJMWNZS2RiVkNzZWRZUkUvYTJ1K2paM1pYRWw1Sndmb0Ux?=
 =?utf-8?B?MVNyUGNWVjVMT0JDR2lIdjVBNUcrQ0ZFbm95NVV6Y3lsQXF3cWlnWXVuRGt6?=
 =?utf-8?B?c0t6SkUzaXNVZ1k1anA4N0pHMFdBT2dSMTVOa2xWQ0U5dzZqY0g1Q2l0WE82?=
 =?utf-8?B?b0FzREUxc0RPb0NSenFSVWhnL3B5d0h3dFNNYWRnWXNCUmd0RmVIWWtYa3Ru?=
 =?utf-8?B?RlZJNEw1SzZoWk1NVzhyL0h2Y0svU0dTMzhqY09YYndXaXRycS93QnNocCtX?=
 =?utf-8?B?MWpGRGFqWkdpeVFudmFKQ2NJZHhSb0c3WGYwYmdheStLS2dVVksrUDA4eUNt?=
 =?utf-8?B?d09PZHpRa2NDSzd0WU80TzBJdjBCYnJSQitpbDVSNjUzRWVsMFFzdXMxNm8y?=
 =?utf-8?B?dDhGWml4aUEzdE9GUmExWEdJemNKdE1KWmYrbUg0dzFabnN6TFQxN2VTWHEr?=
 =?utf-8?B?NWY5czNsaGQ0UlNSV3BqVW1qSzRMUXY2em5FWkUraFdwTGpKM2NhS1VFeHIr?=
 =?utf-8?B?RE1pWHBlNWE0dkd2NVNFUTdsWFpzK2ZPRWs3UGYxMEgxQzFqNHBoQnJnL2dE?=
 =?utf-8?B?ZTRzenRiT1luMTRwQTUwc2FuQkZiMk9oZW5mdllMS3RjL0ZOeTNua1pEVDNY?=
 =?utf-8?B?dTB5Qk1Ya1VNcWdNMEVkZkExNFErK3lxOVVxRjQwR3BmWVVvVFdRcUJvTFRQ?=
 =?utf-8?B?WXlOSWRONDZETDhZN3o5RXlsUmpCb0FWOC9CQ25OOWxUSlIzL1crb0NKRzJh?=
 =?utf-8?B?VnU0RkNINXVZeGUzbEwxTEV2bE56aUI5Z2MzQ09sMlhiNU5NTE9ONnU1blJD?=
 =?utf-8?B?aVBHMmpwM2RhVTlYcERydityaWx5RXFXa1BFSTlQVHhBUmQzeU5vUGd4R3Rl?=
 =?utf-8?B?TkpNMUVvRUxMa3VUWGJ3aHV1Q2luYkZoVnhKMzRoRUNqWmV6QUJ6U1ZIRm9l?=
 =?utf-8?B?VzVrRDFNYUNTNUxWaCsraXoyTUhiWG5mOFIxRThrYmNpNFB0OTBJM3B3QmNX?=
 =?utf-8?B?ck1EekhZdm40MkhWbWNmSVV0VDZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pYOj5QY/FMhctV1WCLN14OPzqT7Qz8RovluPIT4g9nk8a8ml6LidzKg2ZA2nqBoU2rRTPKFuthkKXYYo+393Z9pKg2aeyDgw+XisH9mYzWDUynouid2Svez6Yk9KTom0tKN5Fa1F/yAXQbMwsNRL974LHcWcvI6PT9ljIJbBQE8VKvseyOAuuzwCRzeIbMbSOwqLPgXy4nQpyvbPr3JBm4Ci8y2KrJRf1V7NfWFuBKN034PSsc4oL1nYuJb6OAngp7PV3hKN38eeZRNJnIARJYAazQOjyx/L9rLZ6napXmd+vYnmM4/DeKkwJIligdmz7p4etYu210eSmYrIw2m2BxiEu3J7m3eVnWNL7McwGIaNVHiFCYVbB8XDWTovuo11ULXHtgf+hxODVUmfbtiZX9bXftdOqNVoh3CAEf48v334nErg6hleJi+0kljbcZBX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 16:20:45.4589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 688b8573-1564-4b72-f56d-08de67f72dbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7654
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:tim@xen.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
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
X-Rspamd-Queue-Id: 8C831112755
X-Rspamd-Action: no action

On Mon Feb 9, 2026 at 4:55 PM CET, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 09, 2026 at 04:35:04PM +0100, Alejandro Vallejo wrote:
>> On Mon Feb 9, 2026 at 3:42 PM CET, Roger Pau Monn=C3=A9 wrote:
>> > On Mon, Feb 09, 2026 at 11:41:02AM +0100, Alejandro Vallejo wrote:
>> >> It only has 2 callers, both of which can be conditionally removed.
>> >>=20
>> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> >> ---
>> >> I'd be ok conditionalising the else branch on...
>> >>=20
>> >>     IS_ENABLED(CONFIG_SHADOW_PAGING )|| IS_ENABLED(CONFIG_LOG_DIRTY)
>> >>=20
>> >> logdirty patch: https://lore.kernel.org/xen-devel/20260209103118.5885=
-1-alejandro.garciavallejo@amd.com
>> >>=20
>> >> ... to avoid the danger of stale pointers, with required changes else=
where so
>> >> none.c is only compiled out in that case.
>> >>=20
>> >> I'm not sure how much it matters seeing how they are all unreachable.
>> >> ---
>> >>  xen/arch/x86/mm/Makefile        |  2 +-
>> >>  xen/arch/x86/mm/paging.c        |  4 +-
>> >>  xen/arch/x86/mm/shadow/Makefile |  4 --
>> >>  xen/arch/x86/mm/shadow/none.c   | 77 -------------------------------=
--
>> >>  4 files changed, 3 insertions(+), 84 deletions(-)
>> >>  delete mode 100644 xen/arch/x86/mm/shadow/none.c
>> >>=20
>> >> diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
>> >> index 960f6e8409..066c4caff3 100644
>> >> --- a/xen/arch/x86/mm/Makefile
>> >> +++ b/xen/arch/x86/mm/Makefile
>> >> @@ -1,4 +1,4 @@
>> >> -obj-y +=3D shadow/
>> >> +obj-$(CONFIG_SHADOW_PAGING) +=3D shadow/
>> >>  obj-$(CONFIG_HVM) +=3D hap/
>> >> =20
>> >>  obj-$(CONFIG_ALTP2M) +=3D altp2m.o
>> >> diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
>> >> index 2396f81ad5..5f70254cec 100644
>> >> --- a/xen/arch/x86/mm/paging.c
>> >> +++ b/xen/arch/x86/mm/paging.c
>> >> @@ -634,7 +634,7 @@ int paging_domain_init(struct domain *d)
>> >>       */
>> >>      if ( hap_enabled(d) )
>> >>          hap_domain_init(d);
>> >> -    else
>> >> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>> >>          rc =3D shadow_domain_init(d);
>> >
>> > If you want to go this route you will need to set rc =3D -EOPNOTSUPP;
>> > prior to the `if ... else if` on the HVM case.
>>=20
>> Maybe this instead
>>=20
>>     else
>>         rc =3D IS_ENABLED(PV) ? shadow_domain_init(d) : -EOPNOTSUPP;
>
> But even for the PV case we cannot call shadow_domain_init() if shadow
> is compiled out?  I think you want:
>
>     if ( hap_enabled(d) )
>         hap_domain_init(d);
>     else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>         rc =3D shadow_domain_init(d);
>     else
>         rc =3D is_hvm_domain(d) ? -EOPNOTSUPP : 0;
>

none.c would need to stay in PV for what I proposed. For what you proposed =
PV
would return 0, but all the hooks would be gone. And I really don't know if
they would be triggered or not.

>> And gate none.c on PV && !SHADOW_PAGING, which seems to be the only use.
>>=20
>> It's a lot easier to see the safety on the HVM-only case, particularly w=
ith...
>>=20
>> > is compiled out, and the toolstack has not specified the HAP flag at
>> > domain creation you will end up with a domain that doesn't have the
>> > paging operations initialized as paging_domain_init() would return 0
>> > with neither HAP nor shadow having been setup.  That's likely to
>> > trigger NULL pointer dereferences inside of Xen.
>> >
>> > Also, seeing the code in arch_sanitise_domain_config() we possibly
>> > want to return an error at that point if toolstack attempts to create
>> > an HVM guest without HAP enabled, and shadow is build time disabled.
>> > I've sent a patch to that end.
>>=20
>> ... this patch you meantion. Thanks.
>>=20
>> I'm guessing it's still a hot potato in for non-shadow PV, which strongl=
y hints
>> at our being better off leaving it in that case. On HVM-only configurati=
ons it
>> seems rather silly.
>
> I'm not sure I follow exactly what you mean.

I'm not sure _I_ follow exactly what I mean. Part of the confusion is the
overloaded use of "shadow" to mean "shadow paging" and "fault-and-track"
of logdirty behaviour.

> Some rants below which
> might or might not be along the lines of what you suggest.

Thanks.

>
> PV needs shadow for migration.

shadow in the sense of shadow paging? So PV-only + !SHADOW means migrations=
 are
impossible? Why can't Xen operate on the PV pagetables rather than using sh=
adow?

> HVM can use shadow or HAP, and our default is HAP.

For regular use or migrations?

> For HVM only builds it could be possible to not
> recommend enabling shadow.  Even for deployments where only dom0 is
> using PV mode, it does still make sense to possible recommend not
> enabling shadow for attack surface reduction.

What do you mean by "enabling shadow"? compiling it in? Running HVM without=
 HAP?

Cheers,
Alejandro

