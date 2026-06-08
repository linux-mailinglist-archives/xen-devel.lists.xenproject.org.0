Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nlyoDVA8J2ohtwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 00:04:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8772965ADCC
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 00:03:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=wlX12h8e;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332116.1594760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWi4V-0008FB-Gv; Mon, 08 Jun 2026 22:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332116.1594760; Mon, 08 Jun 2026 22:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWi4V-0008CP-EC; Mon, 08 Jun 2026 22:03:51 +0000
Received: by outflank-mailman (input) for mailman id 1332116;
 Mon, 08 Jun 2026 22:03:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wWi4U-0008BA-Cd
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 22:03:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWi4T-005Q3l-Pa
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 00:03:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a273c45-e002-0a2a0a5209dd-0a2a4507b014-0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 00:03:49 +0200
Received: from [52.101.57.2]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a273c43-229c-0a2a45070019-3465390230de-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 00:03:49 +0200
Received: from MN0P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::27)
 by MW6PR12MB8760.namprd12.prod.outlook.com (2603:10b6:303:23a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 22:03:44 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:52b:cafe::3f) by MN0P223CA0007.outlook.office365.com
 (2603:10b6:208:52b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 22:03:44 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 22:03:44 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 8 Jun
 2026 17:03:42 -0500
Received: from [172.17.22.200] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 8 Jun 2026 17:03:41 -0500
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
 b=gn2lIollSbWT+NybHgh1rVoEKxS7nx+bmOTbqmtSHyRH9nhS+ukmMM//ZhxP4EOqnKNu/HOkex0jCFtbP7L/AuJhjimw3f50gRBPOHsziQRSRFvVNfGtAbPluhu5296lVY15ZLZKNyVaCyV/MPG0OjrQMs++pI6Ih6w41ppTVCEnF2BuGx/NgWIFGZfQCzrGZssViGWw6QBr1TWaC4ukWXKF6SJNU1svTlR2sDKY0UNPan5c1rs3fAKqcII6pfm/2neDyzBwd8BuWqc0ANkabjf6ST4f/r3+z89Vj+bC6I7BIlTz+20PvJHY+OnI+bxzkJ0E23Snr2E//qDh6l48jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQeQ9TLTMTCKT6Tbp1P8AwU+VqXXdKy2zq/iIDiEt10=;
 b=Fc8oIwOxOUJ4kaoCm3W+wHDGTlTcMn8HB9VT1CRUk/ewyH7B6jQcwOWXZdtNlq/+N7cA0RYzt0PUVZNe+Xt+BKDPbGR0dMmz47i3QwrRoTaTkInyJiztaoI9rNxClpnbGxC6ssaUTorp5VPHmGJL8HTrNU8MsE14CJnaR87LHlAfWS4bIhZYdw3q+eXcm9tfn4Lq7yZ0WXVXYgGmJwxvVIdh1a80ZgwowTOvclgCf+TgSyrFqxCv0JP8+/1smkx4dUOz9ulJbIVMSVEIhR1k8iyhEOQHGdT6Hx2OPSSfLVIKPn6PliwMz8NE33VC3mRb7WZLsg0VEBwgTgvriXDMsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQeQ9TLTMTCKT6Tbp1P8AwU+VqXXdKy2zq/iIDiEt10=;
 b=wlX12h8eF4sh9yauxfSofDIWAJoOoNf1qhM1Ye0TFQL9wjIvZImzNtpVof66Jn8pcYrfgcdBF7qx6fMQ/wAmPFRA7nec/6xUMAA59m2MNVNoUWRUMVzrtQt8Aj2b9I2sc4kojrtUu5g8rNraOkxN+ULFYZFOsSt0zwbTYJ/fShc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <50e8aa69-fbd8-43b3-9783-6b87851f4384@amd.com>
Date: Mon, 8 Jun 2026 18:03:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] argo: few log fixes
To: Christopher Clark <christopher.w.clark@gmail.com>, <dmukhin@ford.com>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>,
	<anthony.perard@vates.tech>, <jbeulich@suse.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <roger.pau@citrix.com>, <sstabellini@kernel.org>,
	Daniel Smith <dpsmith@apertussolutions.com>
References: <20260604214926.1735194-1-dmukhin@ford.com>
 <CACMJ4GZW26MGYr9RbCw=tO9rvrpL1u-PAHG9BaFvyg6RnDDfAQ@mail.gmail.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <CACMJ4GZW26MGYr9RbCw=tO9rvrpL1u-PAHG9BaFvyg6RnDDfAQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|MW6PR12MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 14366a21-d2a8-4b50-c36f-08dec5a9ced7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	gIj+0bLeTx0GTGjqXVpJ/vyCcD/NlisKhNulwbOhgvsZz0zrX2Np+c5fPDq9Ptgxixcsx4HdlHzy+Jhm/kVUCjMJrdQYG+lRn1aKS5skAJNLZjNxBT70B4DuxGjvRe+/W0UM5xiBt4pV8TgR7Q1/LoGedZCw3odw0YvbxBHBisQLXV7SDBztQ9JdWQbDodtCRvdCrBlNInxCgt2YhmuUOWF/fFCozcDXdUh6Ye1q9jgSB1FSQ19HF4c2mcWOVztkM0vTYl49Hf/qpmw/X8Tnn8BwJkrZ+nFANVj0iSL2yrLDe+Zv0ZEKBx7HuRzAJUPggSIHqckb2c1VkHvSHdaFiYt7fw31qAKl3MT4rVJKQCt/mpWhm2arj8Qf351RWyMOZ7eqe05eLB9EcVyzjwaCt0Xw3UJallUTaeyyFXxOO0P1oUs5oRr6SyuJI7aK13FC3QNCmJfdb1Q2ZT5sGSzcgvmo0e+CjdNz8/G6uWVSMjvTfOZ4p+T7nvOqQBe0VzfA9vUUkLKRP4unM/tRKZ4IfJ/CUO9OfnzyQ6MoHqB9Lg9gdWmbkS8FbwJJtIVO3TsA+WxRlQpzdHUXU5/dupq+eiE7aKBRs1drK1XbQM1gIpr7ecEG5/tJus/i1SJaS02s9YOKGHM1muIz1oZSJAC1t3J9pR5wYaLeY87Yqtm3bVLUlRYN5xm6dBMPkQBOboL0utRnezqtHd2YBJO9G/IFAlodO+bscnsPUcI+wisLa/4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VR/u4G4sUAL6HIjBuwnT6cBPOjWnZ99Hk3hDwpWvbUkiypdyrH5VUEP/9iz0b4bPzKToXb9qKhnJSIsqhH3fHirBgpX8s2LBa09R1wMoPGm+LDhb6BPHLnLvOXySPJNm3Pjq8Wux9w9WIk5C1nif4AKVUmDa5c7wsKPfdaSujKHBIPl9Nbx2SWXnnnGtn9aPZbMsVlwPPhiFDgpcqr1+6h3TQTGsth7PV5URSekhveEgWnprGqKrlobMDeLzTBLUJzirUrHrnVF90y7QmhYP7UQCCXmPjGkCyTbDWE5KDKYe0znlBA0uboy9AqP9s3YcnDXDi9p519SEtDEtWClqDQzc8oBwVgHmuDEYk/vHmvkofv4LrwX2LwGHgwiyZ4lMWzdK9eQYIChJyL3kWWE4hor9VhFsRCg0kexTcMrl+Jz1vwQh6wQERs5Jk/NLcfyK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 22:03:44.2659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14366a21-d2a8-4b50-c36f-08dec5a9ced7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8760
X-purgate-ID: tlsNG-ef75cf/1780956229-21F6EC48-4305FD6A/0/0
X-purgate-type: clean
X-purgate-size: 670
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:christopher.w.clark@gmail.com,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ford.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,ford.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8772965ADCC

On 2026-06-08 17:49, Christopher Clark wrote:
> On Thu, Jun 4, 2026 at 10:49 PM <dmukhin@ford.com> wrote:
>>
>> This series corrects Argo module tracing.
> 
> This series has been committed to staging.
> 
> The maintainers were not CC'd on the series, and did not provide an ack.
> 
> Patch 1 is rejected as an inappropriate change.
> 
> Therefore it needs reverting.
> 
>> Patch 1 lowers the verbosity of a spammy log message.
> 
> Please see the review comment provided by Daniel on the v3 version.

FWIW, this comment to v3 was only posted today after v6 was commited. 
It was not an unaddressed comment at the time of commit.

Regards,
Jason

