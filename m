Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wUbvLrrGUGrK4wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 12:17:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E44739923
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 12:17:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Ou6WcXFm;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359047.1612835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi8IB-0003IX-6x; Fri, 10 Jul 2026 10:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359047.1612835; Fri, 10 Jul 2026 10:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi8IB-0003G4-2P; Fri, 10 Jul 2026 10:17:11 +0000
Received: by outflank-mailman (input) for mailman id 1359047;
 Fri, 10 Jul 2026 10:17:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wi8I9-0003Fy-Lm
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 10:17:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi8I3-006cNu-UV
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 12:17:03 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a50c699-2eae-0a2a0a5409dd-0a2a450a8fde-20
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 12:17:03 +0200
Received: from [40.93.198.13]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a50c69d-ec7d-0a2a450a0019-285dc60deda8-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 12:17:03 +0200
Received: from BLAP220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::26)
 by LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 10 Jul
 2026 10:16:56 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::ad) by BLAP220CA0021.outlook.office365.com
 (2603:10b6:208:32c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Fri,
 10 Jul 2026 10:16:56 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 10:16:56 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 05:16:56 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 05:16:55 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqsdMZouQEFR2CnnUn0zybEauDC8aJ+qDLxegskjjfAUK7Hzb0P7w5JdDOJvng4pxcaaZmxVeMZJXH3R8f+x7E59nEZMz/hClCCGHvcgQ7myNtf9H8J8wbnJFlzS0ib39eD2wJ3y45PzH47lHQpTR+f0iYc451P5096gf+xZc8TgEeYBNhPE0yptorrlNfRitmAMN94K/++McmLzRc1w2ZWyjXet9RJ9DEwG1Cd35kW+WAjzzxW37WdTrkZIqBsIx2rHiAPnKSpGFR4pdKJ8x2/5J0rdTG+RVndrkS1KHaMMfM/ZrAlKnQ+PwNS/oq2sdFctfMkfXq6yjdhSMz76ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5MMTMbJ0iwQ2EOt8UL4fpowkjMVp8yA6Aw9G4SlyuY=;
 b=wbPrxuhIH/qT02WbXuRXeJOmReCyml6Ubx4c9t7EmJfHCHLNhJ6J3S+Cl72ykgPmOt2/9Lwz8OahMCS33Rzo8bF0qR39R2rOqYQPCN4JIaRXl8Jt7udzZkDDQ2g7SO/4q1Wek2ZfaSspI90b9eLKf1aBtafauJYE7MZPB6MAedMwZ7l14U0Ek1VWycfLjVzbJPj5EZQSuqpFPK+rzWvbGmu7d+7qOxikO1DKHIbaytb0uW8sGbv6vm5wk1Anz17lIA7VMNJoIb8j/wgm9s1WSxia2w1nUSD6xbFYJ80DtPz2Fv8UN+/ZCGDycRAwMTvgHHtFHWs4hO2+JkI9hoaVpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5MMTMbJ0iwQ2EOt8UL4fpowkjMVp8yA6Aw9G4SlyuY=;
 b=Ou6WcXFm4T+YgQclZLlvCdh+tGNuqhdlTliMxgIDe4yc3bBYYGoZ0uP2WNdmxK4lBGXdjnbpFy+/khaTNFFsqr/IDKoCH/GYL6Sg6jVWFHThsFtw8xX18jBfx2EwbnOAWeQd6L+PTn6FmWQKkMkkzZL1tvTmBhnukrzNQI841ks=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <64a5b0c9-7cd1-4017-91b6-fabe6321da9f@amd.com>
Date: Fri, 10 Jul 2026 12:16:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG: add Arm and RISC-V entries for 4.22
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Community Manager <community.manager@xenproject.org>, "committers @
 xenproject . org" <committers@xenproject.org>
References: <3111d0f6481046f6303e6d564ebafd381d763815.1783676659.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <3111d0f6481046f6303e6d564ebafd381d763815.1783676659.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|LV5PR12MB9828:EE_
X-MS-Office365-Filtering-Correlation-Id: af9bfdb7-becc-48a9-8308-08dede6c5f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|13003099007|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	+Oy6PouPvPOc7NdYHT+nQmhgMGNohxgxZ/zr1tUxHh/AWXuV+WPaOl7m89P2HlaDBEfkNFytgglxv3emr+0rewcjuoBtx63P5C8AYL1mSU9c+UF/+tn5NKbVGuk2lPIBcmSzEdJ+x5sBprV2jGq4PqIG321+9+qr9GDgLFvV330+0Uq6+I9AFuMN3oNt5vtR3T+sW0xbyrtmRZ7eA4ga+m+PoEqqIFFBqeyA4eyoA/BXJ/s7s+QhnQXn3a+iF7ULtNLwNVeV+b3FFCwcfz8GCca1rPcmTLafIFTpYFb6kxhIBCTNenORj4zUOLYhF2s9i96yzdJ9AcWXpJE/RCawnpfEl/txmN5uNJqXlbE+DIa2dVMvMcXmM3d/xdBpNYAcH4oXwJtREULt3Pinlu4Jz+JNJfrIjTFtTwqTAFKtH8iujGVLevKdWvhPzpQiIhV2MykFfeDGey3x2Reo66TQe+DjoOvNizhDTjw293vvPWSXGH9Es23J3nsygqlQHPSoEDZeQucdxgBb+dyzZedORkwkJUeOzA58RJZGICJmG/Pmslx6+ilAgs8fd/7OpNd4IKdEuNGqNjrO0oItajb/kWx1jls0Wpyf0UXVOyiV/SKFWb7UpCpIOyfOVjkeSXYsPGW9zchBPAKXbrPKKsgwyA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(13003099007)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GovptRg5AY/bezt3KzTq1i2ejILGJoxVLk1AkA3pRDBV3mMyx6F9pGtQfbEZMyERQZTp+LAIZOTVzLuevHE9b576GrNcLy9QisShZ4Mw9SOBxPPQy8KrDuT02Umd+KLqyf1X95bjUR5XYBBDF4Bvp5nw8gnP3ZK0yG1axiYK3ygVJEO+DMOoFdnaK/p9vOj9J0CQAzf8uTuh+IPXTL+gzO1JLgGRA/BR/yKP9NfipYnWGw8SKZACr3Cu3o2Q7XDkUyoejdWSH3zoT7F5OBq/bdOfTJObjWw7pPQvlMamJW76MNdBxfebBcsvv7DJoAXYEenquUM3xagB1WOqpt/THF2m5ByXWRPbLu0MY4vr3MFBk5us5QNXxlafGN6OqR5cnwI4d3dKLP2///9jXHeKedNeUTCXkL40ArbYdPkqg+HLHzFAUwA2gwksAiZe3erk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 10:16:56.7342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af9bfdb7-becc-48a9-8308-08dede6c5f2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9828
X-purgate-ID: tlsNG-4011c0/1783678623-AF174248-9DD7F360/10/73395122804
X-purgate-type: spam
X-purgate-size: 1155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:community.manager@xenproject.org,m:committers@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[keepachangelog.com:url,amd.com:from_mime,amd.com:dkim,amd.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,changelog.md:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04E44739923



On 10-Jul-26 11:45, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  CHANGELOG.md | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 356be88351a9..c6f1fcf5aeec 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -46,6 +46,15 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - On Arm:
>     - Support for guest suspend and resume to/from RAM via vPSCI.
>       Applies only to non-hardware domain guests.
> +   - Armv8-r MPU support.
It reads as if we completed the support which we didn't. We are just progressing
towards that. Maybe something like "Continued Armv8-R MPU enablement".

> +   - Drop ThumbEE support.
> +   - FF-A v1.2 Support.
s/Support/support/ to match above.

~Michal

> +
> + - On RISC-V:
> +   - SSTC extension support for Xen (not for guest yet)
> +   - Add support of CONFIG_DOMAIN_BUILD_HELPERS which allows to load Linux
> +     kernel, initrd and allocation related things for domain when device-tree
> +     is used.
>  
>  ### Removed
>   - On x86:


