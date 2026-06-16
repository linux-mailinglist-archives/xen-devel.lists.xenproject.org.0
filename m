Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZPwEHuuKMWqPmAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 19:42:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C939D693612
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 19:42:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="2MU/ghvy";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339550.1600768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXnF-0002oc-53; Tue, 16 Jun 2026 17:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339550.1600768; Tue, 16 Jun 2026 17:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXnF-0002mL-1j; Tue, 16 Jun 2026 17:41:45 +0000
Received: by outflank-mailman (input) for mailman id 1339550;
 Tue, 16 Jun 2026 17:41:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wZXnC-0002m3-Rl
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:41:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZXnB-00CJiw-NN
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 19:41:41 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a318aaa-bab6-0a2a0a5309dd-0a2a4504a63e-46
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:41:41 +0200
Received: from [52.101.61.53]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a318ad3-1dec-0a2a45040019-34653d3572b5-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:41:41 +0200
Received: from BL0PR05CA0015.namprd05.prod.outlook.com (2603:10b6:208:91::25)
 by DM6PR12MB4073.namprd12.prod.outlook.com (2603:10b6:5:217::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Tue, 16 Jun
 2026 17:41:36 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::56) by BL0PR05CA0015.outlook.office365.com
 (2603:10b6:208:91::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Tue,
 16 Jun 2026 17:41:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 17:41:36 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 16 Jun
 2026 12:41:36 -0500
Received: from [172.21.53.33] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 16 Jun 2026 12:41:35 -0500
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
 b=sdKLOQdnASeuLXi6mSjQodGGQ/A7+A6E2GatJZzw5GwFsPCd75YYkRkYXrWqm2xZcjmSzGDs4KE2rnuyn1Uucx+JcAozD5biv9c6FUjXZlb++CDrNYR32YUGHYCxE4IlYSTy9I6fPwy0itrGiuNGjoJRI5PzQ78CFHJL84ufMCrb82m4yV+irXN0Ww3MKqg3Off8k/t5H3Wj+Ak/JfneKBR0U/0wtbx7wzdnaAExMxQREGy7CkKDkqOVkvRSXSBirAKBdO1a9wKCoLmrg2a5dmTMLT6vuQWLp4aK0QpVBEKyva1ClZWplDPaE+d7HIVrOQqboErX6EhUwz/7vVjGFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLY9g1BeIP97DS86fNlbhLTvbM4ybUvN0RDJ0n0tO9A=;
 b=EpLrsY/ZItZ1sXO7Z6DlK1HpX2k/y6mIiAd4oJZbxnxJbbMB+BdG4kReM79XcIkGvgjTtU1YI1yRwbOaTO98bVwPwQaeSFnbeVw99IN4ZLGMTQIMN88OpZBByCFBVNLKN//wWxokkbDfmFomjWy61TsMnhRfi+Hfnl59U9kI0Y7YwfyexdiWSGoBwD2yhrkvgmKfWNV+2jZhJaFTcuBPS+0fcIAoDZz8IIpaALMguspPQcqmGXoPrHZTV0/myAt1fP9i17Ua7wP3FtKXjcZk0Mnw1ScVUhXZ2yupZsFn7MDGOVJg/rZl/Vg0U9TrKmiJ4NWEMBZCXwHuR7gy1DUc7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLY9g1BeIP97DS86fNlbhLTvbM4ybUvN0RDJ0n0tO9A=;
 b=2MU/ghvyc/SZNDWzEUyFoXkuhHox6Fb11vYPzZ0V9aiRoYiiCAKbNF6hp2oNcQPjw5XzN1IsZ7OBwAe6ANZQRmlMxtoGxLlVmFNgpnhhbZ8+5wgbrxkVJoYUF28toMrFPfYtVUIxwe4jDOfDaWLp3GKK6FU0uNjwR7Z1QKce5vE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a62aa5a3-c416-48d1-bfb1-78e6b16d9689@amd.com>
Date: Tue, 16 Jun 2026 13:41:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] non-x86: sync tidying logic at end of linking
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Alistair Francis <alistair.francis@wdc.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Timothy Pearson
	<tpearson@raptorengineering.com>
References: <c9109e8c-e471-4f4c-b58b-fdfe3cb044d2@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <c9109e8c-e471-4f4c-b58b-fdfe3cb044d2@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|DM6PR12MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b6d592-2cfc-49e6-1c33-08decbce83ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|82310400026|36860700016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Qx/VlEK+f8bfzSFTt+fJNTqdZT/ZzuHH9o0uSRBcT/OerZt9AdWjeeIM5IXOq0o3HsdcQCUJaB4PZ2J5ONylmnvudDRYQji3fzWraFU/t2kL3wnzBTqwavwLQu9abivKxED5sJrqtQVsuzUhU9KtriVm5RiF7Ktfiwa2YBClrl0LVOaNyT7wTk3ofyXH6gABsAwyYN4q+W5mUgtWH2EkHJc7sU7k6BfG35BTq3JmthxptG9o8+KkcWE2rNfZ27Ecnn/VAMXlTbK3oyllr90fntE8drprxMTo2yRs34DhGKaTcy+V5KvCq6sRFeO6GKX7XrtnTZJjC9eWiLzyVFdnq0Oo7BlBHrLagvpTM7tQmEaE5WBI4OgpxZAoHGN8axhfbTOIodP2rKX4lRJuJnBk3sqZtAwFRtqebgy3+VGNFFIEDQ4+qOkN0kQ3fzzHT2RkNaQh5jvuNggaU0sGXzqGv1PbR5CoBbk32ylg1vB368H8wUagnJ/U6nhGqFUhIFcRne3GTHE5If415+j9u+PCe7D1L0zsRQW+9SRg4JgUiXi0SnAQHyTmZc3f52IxYNC6Dbu3HbAeMpysvT7jIKnGmMcAK9oSNQCI1xe8D+44gjyhUKsTbfeQfRA47TfH1S38QAt+VHKfSt1P7jPAqgdTKrqoXPkLYhoIPgHWVQ3HEXJ8cIpXITX6BSLJzPMVbZ+DagE1+qcvUkTuRGhvpTosPnXHIf20R9YN2bzmf+OdEj4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(82310400026)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5k15Kkmm6MsU4ALh+0DtATb8sZ6fKse88TgUN5xtoFBqV0SzrLOlxo4ikpL2g9c9PvHuYqhqIlOlaeAt6v/qyFxgXyE+4eG2GOkH7b+zlrYKwsFrwtT7jisJ5yfjOc3khlBOeCCW/J3mVw9Pj5bmdy7VE0UwzoLjZWMzLQONVBlQcsLGWh+4FrAh/nYauXip1XaNExh0cwYxJUCF6J08NeZEMgz0z3Ba4B+5UMo4UB3jnuT9THWuG+lFtrLijki/w9+JUAQBRiy9UyuQPKc3WAioKR+dh6BnYwSHra/Gan4D0G0sSuANmgHYx0JZXBnNX5CySkWuXFKTNkgRCDNRbV1gbr401JJqzO5jrlxG7f5Y4mG715AD2I+Wl3R7VP2ITSihqDKUg7TWWC7J2y4Ww1Yj7bEF+Wz+2WMSWwU+HTu1VyoO281S47agFNbOgwed
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:41:36.5636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b6d592-2cfc-49e6-1c33-08decbce83ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4073
X-purgate-ID: tlsNG-ebf023/1781631701-2997A3FF-A51B6EE9/0/0
X-purgate-type: clean
X-purgate-size: 320
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:tpearson@raptorengineering.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,epam.com,arm.com,amd.com,wdc.com,gmail.com,raptorengineering.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C939D693612

On 2026-06-16 03:52, Jan Beulich wrote:
> Mirror what 761bb575ce97 ("x86: fix build race when generating temporary
> object files") did there to other ports: These ..*.cmd files aren't useful
> to have/keep.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

