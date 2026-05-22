Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFcKIh5MEGq5VwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 14:29:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002F05B3F2B
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 14:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316731.1586082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQP00-0006Bq-8P; Fri, 22 May 2026 12:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316731.1586082; Fri, 22 May 2026 12:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQP00-0006AK-5B; Fri, 22 May 2026 12:29:08 +0000
Received: by outflank-mailman (input) for mailman id 1316731;
 Fri, 22 May 2026 12:29:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1wQOzz-0006AE-39
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 12:29:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQOzy-007N1a-F3
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 14:29:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6a104c10-2eae-0a2a0a5409dd-0a2a4508c0d0-12
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 14:29:05 +0200
Received: from [52.101.56.54]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6a104c10-63b5-0a2a45080019-346538363ac3-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 14:29:05 +0200
Received: from DS7PR03CA0030.namprd03.prod.outlook.com (2603:10b6:5:3b8::35)
 by BL4PR12MB9534.namprd12.prod.outlook.com (2603:10b6:208:58f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:28:57 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::2d) by DS7PR03CA0030.outlook.office365.com
 (2603:10b6:5:3b8::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:28:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Fri, 22 May 2026 12:28:56 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 22 May
 2026 07:28:54 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMEtkGGWsLJxiNLJeTb3eVRizjx3E/Nr9QCyo++lUdE5Q4pRexkYQwIhmQgSlimK6HPMK5DsMveky3gf69xCpENwMQ85Ahg4W6bHIifBlyYRdYx1qQchbBchVzyPO4Ev509gfgkzQvfNVYRlU73b3wNtPLQepghA2Xd5HhU+9+PYnPmlJvPUoqj5cXOepjlPGv4oz5H79Ux+ke2uVOaaylOFyDayU26Zoc3cFWF/tXwPGlyEZElfwfHHXUAIyVfN1Uys4g/mWt9Q+YtT9Pc71RMmmuKlbf9WHE2IrXwIibbPG6hCe4/Hc0bJp1ltgsiGSD/DNKo+z3wq8wgOw4hBeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnaBrwGog3lFa5TNst9Rllq9+tDmquNFjIq9VfkVVWQ=;
 b=OCAups28PHguj7d+I4aRpf6BzThPOs9wDz3EUbEfFy58OYO8n8G4Av4Q9ZMxROfdkwNYreEXkjODzY/BCYU2wMftBKGJ5TLGikYUcrVf+PrLJfGB6DHdMI/uWI/bGp8Cd3XBy87dCgYmuykQ9QEaFEua1agMdMXrwn+0hNgRVmC6KU/U/Ubp2eisoE5HjL8fR0XRrA7IPm/Kenql/urCbghxcQcfxU03V6mEad6vDt7vFeKHdi9TthyoztaAmWyPUr8OeUbtppvPbdcIMYBkT/oFMd6AVMRW3fqNdxD7aVi3yPj3pXfA99GvO/dEcNkQQUYVAAH6/8QTIvSjXEu/Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnaBrwGog3lFa5TNst9Rllq9+tDmquNFjIq9VfkVVWQ=;
 b=EByPvf2kajVnrqky/TtMuHDftPo4KoD7wEXBOur3s8XRRWAV6z8s5+xh1sSVuXmXDAs4JWZ4Q4WUzCK9lNtEIRKikhsbYcRva3pG4giyIYKGs/PewLVDokyiRLgmkmj4/riEjhQuyEIYtcAdRB+YoqVOqbTVgZVBAV2KmNynoMo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 22 May 2026 14:28:53 +0200
Message-ID: <DIP7F4H1ZJZT.2DAPDIJKK2H17@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [for-4.22 PATCH] xen/gnttab: Fix TOCTOU race in
 gnttab_set_version()
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.21.0
References: <20260522105709.25073-1-alejandro.garciavallejo@amd.com>
 <8c394056-36a8-426c-8c09-ec7594202b4a@suse.com>
In-Reply-To: <8c394056-36a8-426c-8c09-ec7594202b4a@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|BL4PR12MB9534:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a0cd10-850a-4fcb-309c-08deb7fdb1c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|36860700016|376014|1800799024|82310400026|18002099003|56012099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	5z5FZN9rr8KgwIJL0+IDBSPIYlOjeTLipSO9ygdp3SIiaG7kMQ23z5RtdW24HHkA2PGCV3Et+RKqOhEIHrz9/YKPiqLHIkI+G7PS5rLDfixtyxqL5qZrIVF+Yi/sye7jAJ0JnB6g3TCFVKnwKi9bypP/343c/bLn9O8o2WbQmMIAQdXTpr7hd2RKaJeemGXPQ1btAhaeDeY13P8Simyg8YfVjmR3ZxQzP4XSDs0i6icO0sTl49Ad1IWZ/VmMhsf5MPsGC6TcpWxDOenq2nPOznakra1gbg6MA971mz134Re26fSEdpet+G5SHOK7NZMNZIpBrYLbt7S5OOMTqLpdHQ4m1SHsUlDYqx9Q0LTEPnEuBasyDVE77T5u1SN/GuyW6eqs1V61JOydcYrRiC5LqyKYySrjGsaLyVv3LceO20kv5VcR+qWF6yrHhexW0SuFJrYIF6jHeAz6Tb60dvF1RYU8wu5YNnVymWhoYrUegOFLExhvaLJjKYfKeh1P7hTUc+P3vERPHkWoBBdQQuFbEzNZQ+5/Y22sAP/rinfUeuWmZgagAcStYCGR4EapIvevwiALpHk/nj+w5js4JCkwkM5wa+45crAgJaVJnxiotzMsa7onPbrsCVhq2ri8texn7NwMM5wLqvft3pYI2tTkH0TGktk5UoQVbA5xtGBVjRCHFSwi2ffbF5shI0itFtENplNZk87K9NrESQWTo1xC3sUQ3n+cwf4cNI/vINRfDyY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jxU6RNBZivGJsDevPONmiiD1kXAoCm6BOtiytN53KboZNz2Qe6lahpD8SnnHZCMNYm0+Hn4kf3mFsT9kz2ZNqGRpIycgNAM41BLhRQcaBVouCWRJgr38e27y+PK7MUyZf2xrOgsdzc7/NLPNYqVtYbabqhTAB4porahJqmbm0bsvzs2W9bPFPoVwNPxKr3gWKYcJ6dgl1vJHZghQbIqAy6vH4HrMwb3vF1pAjcxxnnMM/GDGY18gz+4+FoiSbB0XAwa0vhEaL++vgxgj/udvI/pef1nXux0MoFKj3PPQ77rXPst+TAV/9uB3gmA7Amtn7rgBZlu5wvyYC0fk31nRtpveql9pN6j4fovhP4uO82ZYyiuZdkQS8RrhWDRVbkv8ZGdirpOl5KWA6jzTc5rIQEyrXYd3wJJ/JQ98Xx9ROfkmFV3G6/GSbzT/xz8MJtvc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:28:56.9428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a0cd10-850a-4fcb-309c-08deb7fdb1c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9534
X-purgate-ID: tlsNG-c1860d/1779452945-B5B6CDB1-B834A637/0/0
X-purgate-type: clean
X-purgate-size: 1173
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Oleksandr_Tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:alejandro.garciavallejo@amd.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,xen.org,gmail.com,kernel.org,epam.com,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,epam.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 002F05B3F2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri May 22, 2026 at 1:31 PM CEST, Jan Beulich wrote:
> On 22.05.2026 12:57, Alejandro Vallejo wrote:
>> Move first read of gt->gt_version inside the critical region of the
>> rwlock, otherwise concurrent gnttab operations (silly as they would be)
>> may get mutually confused as to the actual current version.
>>=20
>> Fixes: c1488502c949("grant-tables: do not fail attempts to...")
>> Reported-by: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks

>
>> There are a number of lockless reads of gt_version (e.g: right after unl=
ock),
>> but they aren't very worrying because they are effectively snapshots of =
the
>> instantaneous version. I'd feel better if they were all atomic_read(), b=
ut all
>> Xen ports guarantee atomic access on aligned 4 octet fields, so I couldn=
't be
>> bothered to go chase them.
>
> Sooner or later we will want to deal with all (latent) problems of this k=
ind.

Quite. Concurrency is hard enough without making assumptions about the
underlying ISAs :/

Cheers,
Alejandro

