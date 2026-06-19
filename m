Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ETj7E3opNWoTnwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 13:35:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76D76A570B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 13:35:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=oFky7s+c;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1342110.1602380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waXV1-00044T-8D; Fri, 19 Jun 2026 11:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342110.1602380; Fri, 19 Jun 2026 11:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waXV1-000436-5I; Fri, 19 Jun 2026 11:35:03 +0000
Received: by outflank-mailman (input) for mailman id 1342110;
 Fri, 19 Jun 2026 11:35:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1waXUz-000430-Os
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 11:35:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waXUy-000rgM-KV
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:35:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a352955-e002-0a2a0a5209dd-0a2a450cad70-38
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 13:35:00 +0200
Received: from [52.101.201.21]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a352961-94a4-0a2a450c0019-3465c915b67f-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 13:34:59 +0200
Received: from BN0PR07CA0009.namprd07.prod.outlook.com (2603:10b6:408:141::8)
 by DS0PR12MB7780.namprd12.prod.outlook.com (2603:10b6:8:152::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 11:34:53 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:141:cafe::e) by BN0PR07CA0009.outlook.office365.com
 (2603:10b6:408:141::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Fri,
 19 Jun 2026 11:34:53 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Fri, 19 Jun 2026 11:34:53 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 19 Jun
 2026 06:34:51 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 19 Jun
 2026 06:34:51 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 19 Jun 2026 06:34:49 -0500
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
 b=gE11j1TZAp3I9frvAXc4Oo6PPcT6F8keI6SMEA5Og9D7dI5e9T/6xdSDBFKp152Ml5lG0Pn5X+Tb0SH9hu+nFvxJEeS7P2457xz7SHFlSIki6VYrTxXF14cwZhID2b6P4TOO3ZVbLlhH1YR69vPQtRy0gRllZH84BVBF/gleHzDnEtLhX4k/4SdTDc5NGBY0b03jbDT/ebxjdB0pGZLzQNPmhlffKMpN9LwaASqOWrzHr7Kui430gUeANWC7nhZ8B/jqoCs09o/tbrDkJ2U3mB1/HhzcVSptNULSDREAHfW1oJeu/zUn+JXMnyrDNwgm9Azva+IyfkqMjUgjymm+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1NfvivOeZBUAcQf+iWE0oAvyh/PnP70ZvKIn80R0m4=;
 b=jRV+63DV3+UK9tGOqMXNtBhqNxe0N4LGMcPLxs/tFWP5u+zhOeZritee/y1DgqrR8LQz0oilXXpgkGNUZVLVO4z92IgzxyS+vZpKkG8ImY15jfDzVxzyRFgrrZOe2Fr/8TWpf2GTdDwveGbV+3AH2+aNdjqkLu//TfhFaLwmvlICui/pwjJkvDSPNybXchsIy27yDqeKiG1Og2zxsrsrZXX/DSMnHKajXsFvHsDwIq4zrKYqCHBAIX4BhvY4nlawXaWZeON/RFDRnHUdByJdo3jVs24RKnQp6TYYKxuEFywU2SxYDDJzjh1FNB/TIqRKlKBvfoDYC6X7/ViFVRzrLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1NfvivOeZBUAcQf+iWE0oAvyh/PnP70ZvKIn80R0m4=;
 b=oFky7s+c3+C3oioGOs9TwlczlaApWNUjMc4sNBUkkHAdJqADUsc+rHpaO6lP/iul3x+6QlYKb34exuQVKSuZ8MlAdBrpya1Z6X9vjh69Pb47IRTdGvFqpJeJ2WDRLEjHMluYjlGjAKcVvENHrDlMgN+s97cQvH6alz/Ici53pZo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <b47b9bf3-1aa6-41b6-8c7c-48d64cca1c36@amd.com>
Date: Fri, 19 Jun 2026 13:34:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2.5] xen/arm: gic: defer host LPI allocation
 until after ITS init
To: Julien Grall <julien@xen.org>, Mykola Kvach <mykola_kvach@epam.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Mykola Kvach <xakep.amatop@gmail.com>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>
References: <112419d3ea48ca328849c8f6647909d3eb667b40.1779922874.git.mykola_kvach@epam.com>
 <341edd8de63dcd84ccc6e7b6c03e9e8fc7105184.1781847061.git.mykola_kvach@epam.com>
 <7a0a1867-8316-4e20-971e-fab99c9f4a32@amd.com>
 <e43afc29-cfbb-4978-9324-e8d540040bfa@amd.com>
 <1877ea55-0c8d-4593-a310-259b4c5aef3c@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1877ea55-0c8d-4593-a310-259b4c5aef3c@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|DS0PR12MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: 52532e6d-d99e-40a7-79e1-08decdf6c823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|7416014|18002099003|11063799006|22082099003|56012099006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	TEfyYW2QF95su3M0Y5p9UU/UKia7ebYy5s1lsY5RxHPebFqhnC00l9HV/l0aS5qGPbZ9WB3aa/m3dFxwk1NOSQeBx+gX/6cPC33G1EHSlZt3a5LjspMo9Wo5sXl2NVUe+HdVEt+qBwa7PDTQOmqebOGs41aGJUdBOnmCKSIQ8yZaGdZlGVH+1Hd5ndpJlBmRhBTn0L1ykhdFixQg6uOVZG9gglM38ELkBy67AFCQworWje/EW3WOhoNGFvj4n1AtRKgREfMRcL6rp8uAHXgXb9uqFA5VxIkItyH6iUHj991MrJt64JZAxzEQNAUoMAk2/XjI1G+nFi64lHATXrg609v5qQH0t9fvqMrpqR8CahQlvN7paOiUWYTZ6UzA8Qc3uTLqeeWFd9o3Dg0p2fT1xk9do+IooiIspneTQtu1znAR0RbVuCbNAe4YtRLv2MDAATNt+bhI3s8QC/VK1LTjIgH7UbxvcZI3v7kwFhfBf09lH9hkwQOlxllMOLTADZQ8siO3EMJcavkbustij5obuXPqnKjt3NqXbk9nrzhG5M60BDGqVd96Bv6VLhftv4LO2sgjedue/qWqj+5KxBIOhVfwH3YkGPedDfKWX6N1BI1FWw36gqdfpJZChjQWQSFQZ5T8nEWhR9kpECspz99MtpK/mGzaLVLdPXIRuBUQIHKmh49HFUfoY90z3GmGqCYbOkkGzWpey9DqFHQV7rrKzw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(7416014)(18002099003)(11063799006)(22082099003)(56012099006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RQNRqV8f0ACjUhYhs4ojAzVkx8lf1eEHQCtdu8IeksK8+scXZwnqXn+8cU3Rnnw0eELqIn9B2199yaqjiD/R83CJy2BjglkMolisqKx966nmq75REqrUOkzItd1hr+mHre0BspqKXDh9UMSePNQJ3quISpKe+4FkQ9JM056Z91eb5VKvslicSdyIBJvDN62ysK5r9wytF50Hx7x9YsIw/5jmlh8V3Tzib8b1S8qVHQtasjouQXlVpqXbNYSEMhq8DhoVg9o4pZzHH3xO8q51rQFGQipfc8Q2m4QqKQw4DiBodbimPVFTLVs0ZiDPIpe4HCdwwN514axWhKpBuB+KkrCrfulbtoGZF1RTXnGXGsxsrXzepbTGCji9q8ut0CAVys5bRovb/ybRDHJK/N5Z7CrJcrc86zoznZobuPEFQbqoPziDoLjjD5d4A5AlFc3F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 11:34:53.6187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52532e6d-d99e-40a7-79e1-08decdf6c823
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7780
X-purgate-ID: tlsNG-d25034/1781868899-041A5ABF-FD82E595/0/0
X-purgate-type: clean
X-purgate-size: 852
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
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,epam.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:mykola_kvach@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:luca.fancellu@arm.com,m:xakep.amatop@gmail.com,m:oleksandr_tyshchenko@epam.com,m:oleksiikurochko@gmail.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:dkim,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A76D76A570B



On 19-Jun-26 13:23, Julien Grall wrote:
> Hi Michal,
> 
> On 19/06/2026 10:48, Orzel, Michal wrote:
>> @Oleksii, can we ask for a release ack here?
> 
> Can you explain the pros/cons of introducing this patch quite late?
The advantage is that it fixes the broken LPIs on affected hardware.
The disadvantage is the reordering risk but I don't think there is any issue.

> 
> One of the risk here is that we are now initializing the LPIs *after* 
> the ITSes. I understand this is because we want to know the workaround. 
> However, I vaguely recall that there was a dependency in the 
> configuration. So are we confident the new ordering will not bring other 
> issues? Ideally this should have been explained in the commit message.
gic-v3-its.c never references host LPI state, so ITS init has no dependency on LPIs.

~Michal


