Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPrsJyy0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3C748232
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208787.1520928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viAGX-0005fa-MC; Tue, 20 Jan 2026 11:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208787.1520928; Tue, 20 Jan 2026 11:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viAGX-0005dx-IJ; Tue, 20 Jan 2026 11:51:21 +0000
Received: by outflank-mailman (input) for mailman id 1208787;
 Tue, 20 Jan 2026 11:51:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viAGW-0005do-BR
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 11:51:20 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5481d4c3-f5f6-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 12:51:18 +0100 (CET)
Received: from DM6PR06CA0087.namprd06.prod.outlook.com (2603:10b6:5:336::20)
 by CYXPR12MB9442.namprd12.prod.outlook.com (2603:10b6:930:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:51:13 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:5:336:cafe::c7) by DM6PR06CA0087.outlook.office365.com
 (2603:10b6:5:336::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.8 via Frontend Transport; Tue,
 20 Jan 2026 11:51:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 11:51:12 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 05:51:10 -0600
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
X-Inumbo-ID: 5481d4c3-f5f6-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHZ+ABOjfhYpDhFNrWvsOOydcXbg0uuRh/yQIS9TSSTTphak2Df3AHZ1LSnn0IrgpwLqdw8jOIkb5mPMDm9r71VVopUQCOQmPXB8L8nmdUSvWEia+/X5vyG+Scg3d6WS6ij8dz1L8d1o8GzS6rJRB5HBfPEc3noByCqIdVHE04njZ8RFs7/w6UnSCKBFpxwJ2ezQy1+tz6MDZcD3J1Dj68utxLge6IAU9UW/dKPd/3nj0AyBw4gPGk12ZNkQ2pCGDZ0UJlkZLk7QrgLzDgs2fKRoV6BdQ6b16o3U6oxkJLoEMPf/3nXoAh2WcUmcUkygtLvQxK+6Ze7KBt5Nw/mCng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKg3ttnejLm8XATwE57As9cNTXJjxx38A5bqUNnm7Ck=;
 b=AHE5g/qrtXjNKzC+OwhAfzwB+NP47y5BpMMp+uN2D8WftEJT3HqNanoBep2nBO0BjYbxjg0CfohnctfKfm08God42aOZBSBMbcjLJ/ABK+Nr5LRbMcfXEUWAKzM58A035N85eGiKnV4AKLPclLsJgqG0jYzc/wJfkfAQHGp8RdQjHWAXfO7PW6EjBHY6Vs7ZZXmmdYu6om8d7C7MDiLftitvdXn8zlSAmM/pLfevq3uzo+weU4S98fQ/iOC7XyrMTlhq3i46jB/9WWRZwZNI8XbzGulBnm5UbgVGGFUj7tten9AxAWRv6efXHGDdcZJTTPxpo9kJvHcx05x/JZ4kMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bugseng.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKg3ttnejLm8XATwE57As9cNTXJjxx38A5bqUNnm7Ck=;
 b=TPs1bq4bUi316mKkyafy09HGdvCnJxSNBZ8ilAt2my/dVc+gH/2M8cSRfUH2hq8K96jnzBX5NWzB6oQo1lIbUlZjcEqYi9ZEo7pRqzuBYCmL//ft9dwsnb9rZq2XyZkOlBi6lN8snuVMsVAfw56hZzmKZaDzSj2sT1fAhZL018k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jan 2026 12:51:08 +0100
Message-ID: <DFTE7R78R78U.2T09MMJU7F0CF@amd.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 4/5] docs/misra: Remove earlycpio.c from the Eclair
 exclusion list.
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
X-Mailer: aerc 0.20.1
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <20260120093852.2380-5-alejandro.garciavallejo@amd.com>
 <1d374226e3f91ab3bbc05c3354c8f8fe@bugseng.com>
 <DFTDPKJN6EHE.3LH3Z9WEO0AGW@amd.com>
 <bd95ae24c9b9767467938dcd42a93a6d@bugseng.com>
In-Reply-To: <bd95ae24c9b9767467938dcd42a93a6d@bugseng.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|CYXPR12MB9442:EE_
X-MS-Office365-Filtering-Correlation-Id: f1343eba-760c-4d58-8bff-08de581a35e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFBnRnJWQkE1bENSTHZzUU84d1VwY1BlN3FNb1dOSXZYbnBuSWszekZLM2ly?=
 =?utf-8?B?MkNLSnRaYzRoQSt4aVpQZ3ZwT1hFNFRvSW1qRXpxNzNOd2YxeTlTYkZPaEhp?=
 =?utf-8?B?RkpiNy80c0x4QWZaRjdpNFd0S0cwNms4ZFdzd2dxYTJpWi9qMUluRDNTaTJw?=
 =?utf-8?B?UXlzSC95ZURkN0hjTkV6L3RaVnJkbmpIM2V5YzZzYUJLL2hxWWsrUDZGK29H?=
 =?utf-8?B?Z21hamh1MkxLeTJ4WUFybysyeDhlUk1qUDZCdjFCdWdPYnFpT2hxQTd5VEhG?=
 =?utf-8?B?VWNrdkxvQ2Z1cDZ0SC96WmJnTFZuWWNteDU4KzkreUhwK29XOGk2NEVhd0dV?=
 =?utf-8?B?enRGYmhiTStjelBqZXdZV2tEVVJzUTVxdGxiZm44ckd3SG95aXlzOG5lVUdK?=
 =?utf-8?B?WlBTc2JoSXEvR1krL1JOVE9aT2JMbWYrd2V3clFXWWZYelk1bkJQaW5TMUU0?=
 =?utf-8?B?eGFnaXlFMjlsZnJOVWxXcWdUNW5ZUW9wbEEvTnpUY09IQjcwZ2EwZ2RZQnh4?=
 =?utf-8?B?UWRpNGpRNmRaTlMzK0hGWVBuVXlpVkdGNTRwN0V4Q0RKdkRKN05vZVkvRllX?=
 =?utf-8?B?Zlp2RU1iV2UrV1cxZWFhZ3Jma3crUFJBSGN3bzFYcHB6VElucEpWYW05RDRp?=
 =?utf-8?B?Wk45UkZOaXZEWGVvdHAreFNveW9UVW5VUmh5SVZ6djhiSlk3cHoxUFZFdldF?=
 =?utf-8?B?NkZ4YWZVcnV6Y25VNTV1ZTRYSzBXSytwRk4xWHhBYk9OSnlhS0dEdmt1QzdZ?=
 =?utf-8?B?d3BDdnhyaktZdDNFSGVQN0R5cXRoZVNZYmtueFdMUEV2ZmRvY1pjVXhrblNs?=
 =?utf-8?B?VUtIVTBWdTF6bVVXZUlBU1F5MWlxOVhtV2FLY242RUt3aDMyL0MzOXk2VU11?=
 =?utf-8?B?ZHVyaUJtbUVFWXRLWDZuZXo4MUozdFhialVPYVBpMlkrUGtMZG40QVdMenhI?=
 =?utf-8?B?bUFNRFJrZ3R1VGVnejNRakFRM2gzY2xFU1pOOXJEYW0yUjZZQXRLaVdidzhU?=
 =?utf-8?B?TSsyRUJaeE5rNEttakdscnRWRUdzZWRWTXZJMjRrOWhIQjRXY2wxZ2FBNVR0?=
 =?utf-8?B?OUhmQmN0N0lBa21rNlpVREF6QTgrUzA1YU8wd2tsc0Vkc2pCN1V6UzhMc1hZ?=
 =?utf-8?B?cllFWTBQcUh0REtKWi9OTThlT0NoOWNKQUo3NFVLR3FKdjVCVXdnVkRjRnpi?=
 =?utf-8?B?VFZGT0czbStLaDhkOTJmRWZBWEtGb2FudWs0Vzg1cnhrRlphWTg3eEZNa1Zt?=
 =?utf-8?B?WmMxYmliU2UvOGJORFBLQnFCREFyREliWGJ2RGY0dFFmTEVXUlZGekFQMnN6?=
 =?utf-8?B?ckxrYkwxdjJZSkIwRWFTdWFGdzlqY2R3c2p4K2hIczhZV1VqN3RmWE9hS1lK?=
 =?utf-8?B?WkxPWENMaC8wdW1NNnUxTUVvRFpKeGh6K25nTmExUkVpSWZqdWkxbVEzZVdy?=
 =?utf-8?B?QUJudEMvYWxrWXJUd2xGRWdOT1JOSnNRT0VHSWxoMUdKdlpzTXB2ZXF5b1V3?=
 =?utf-8?B?T2RKblRXOFBNVm9YbXFaSTZNZUgwYlFlWHdLVzB1amQ5L25mbkJBOHdqLzFL?=
 =?utf-8?B?TDdYOSs0VGR6eUFFTVdNY3kwMjc1cVJYcm9FRWhXMjVJd3VuKzg5dHBiUU8x?=
 =?utf-8?B?eFQ0R01ESUZ2NHZnalRlV1hNUHhtQ0ZUNS8rbVpzakZyd3ZzT3AzY3VQTkZV?=
 =?utf-8?B?UXI2dk4wSUNUVkx1eTQvMWNwU2VHb01FM2hFbHlxbWIzUVRjbVdvcHgvdVlX?=
 =?utf-8?B?YUNERVdEclpIY2tTSzZkcWhDS2kvczBhcmE4bDZDQ0piZ0FyNWxQdUtLQ1Zl?=
 =?utf-8?B?S293c2hCbU03ZE9xTEdmZXZZbHhtV3VUZXBYTkNWY0JJR2ZFbUVrYnJBRWlp?=
 =?utf-8?B?ditFdkFtbS9HUEhsSWxpcDFncTlsMWtpY0xHZDlhc2Q2OW55cXpMVFBYUjNC?=
 =?utf-8?B?OXBoZDRXQ3dEQWdtdGVLK0FoWCtwbXE1Ny9EVENMajZldGc3eFNKblQrVzY4?=
 =?utf-8?B?Z3N3V0RFaVVqQkZGOUtUSlJvMUJhSUhrNnFrMzRER3QvbWd6M2E4ekxzRHFw?=
 =?utf-8?B?UG5Od2g0eEwxZzExQlVJUDlMUGFieFVuTE8rTXR6Q2E1cVlIc3RrcGs4WmxU?=
 =?utf-8?B?UnhQVSthOGJIaUk1bXM5aDdCaXBGQzd4L3ErREt0TlBwWXJkaWlOOTA2OGRh?=
 =?utf-8?Q?BJ6CusHvVSiRJ+5oynp96RU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:51:12.9292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1343eba-760c-4d58-8bff-08de581a35e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9442
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,xenproject.org:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5A3C748232
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 12:41 PM CET, Nicola Vetrini wrote:
> On 2026-01-20 12:27, Alejandro Vallejo wrote:
>> On Tue Jan 20, 2026 at 12:21 PM CET, Nicola Vetrini wrote:
>>> On 2026-01-20 10:38, Alejandro Vallejo wrote:
>>>> It's clean.
>>>>=20
>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>> ---
>>>>  docs/misra/exclude-list.json | 4 ----
>>>>  1 file changed, 4 deletions(-)
>>>>=20
>>>=20
>>> Hi. Do you have a link to a pipeline?
>>=20
>> In the cover letter. I only run it on allcode.
>>=20
>
> I see. I can spot these additional violations from earlycpio.c. It does=
=20
> not result in a failure, but only because x86_64-allcode has also other=
=20
> non-clean guidelines and is thus allowed to fail. Ideally in some=20
> copious free time I'd send a patch to create a subset of clean=20
> guidelines for the *-allcode analysis that is failing, so that the=20
> "allow_fail: true" can be removed.
>
> https://eclair-analysis-logs.xenproject.org/fs/space/verdesse0/XEN.ecdf/x=
en-project/people/agvallejo/xen/ECLAIR_normal/ucode-disable_v4/X86_64/12771=
570090/PROJECT.ecd;/by_main_file/xen/lib/earlycpio.c.html

The web interface doesn't allow to search?! Sigh... thanks for the pointer.

I'll have a look.

Cheers,
Alejandro

