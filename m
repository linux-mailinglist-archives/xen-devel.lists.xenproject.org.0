Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /NVcE+3gQ2qwkwoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 17:29:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A790B6E5F0B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 17:29:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=vRx3mSzZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1349138.1607018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weaOm-0008Th-Se; Tue, 30 Jun 2026 15:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349138.1607018; Tue, 30 Jun 2026 15:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weaOm-0008RC-PJ; Tue, 30 Jun 2026 15:29:20 +0000
Received: by outflank-mailman (input) for mailman id 1349138;
 Tue, 30 Jun 2026 15:29:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1weaOl-0008R6-AZ
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:29:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weaOk-006PUg-Nd
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 17:29:18 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a43e0c1-e002-0a2a0a5209dd-0a2a4505ae66-10
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 17:29:17 +0200
Received: from [52.101.57.70]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a43e0cc-3cb2-0a2a45050019-34653946e099-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 17:29:17 +0200
Received: from DS7P220CA0117.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25f::16) by
 DS0PR12MB6462.namprd12.prod.outlook.com (2603:10b6:8:c6::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.19; Tue, 30 Jun 2026 15:29:12 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:8:25f:cafe::51) by DS7P220CA0117.outlook.office365.com
 (2603:10b6:8:25f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 15:29:11 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 15:29:10 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 10:29:10 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 30 Jun 2026 10:29:08 -0500
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
 b=AMqTgz5yhbtFqd44Hg6srrYbphhZfYad6B6vUVo5lkHUCTiGtBPmIcj58zqG4u1nsOetQtH85e4z9rxja71lvNQDQjsddTQTK/TWi9vVRJ6QuN3xTiusZQFLVwmtMM6M4qf3lc+sCCcIBLg287XtP9/jFmZPYKy3QYspspMwVOzcUqi91sjkXHKckEw2AMpn7vPSkoG5NzE5O/h0N78lqCr1RSdJbuxsv7GxgrIMqq6HAfIKw3XVDQEEvMUHQ9JkHQu0ozpOv64He98xjRlziKrNW+clO86y8qjx51LAMRamoOPOkKdeqzWOS4gI+h2ebYJp5vh5d99rCtWIZE7HWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qf5hWo1jxtKxy/QAJbMzqY7B+GgOm42sp/yu7jP5BGc=;
 b=QztgejCmFIQCstWIV/bhN6xRhQ3I341NS0TlPeLh3WTUUnDvb8mYIWvn+lyigNe85X4znqNozt0ku8bs/HCxPFY3bA9AB0hxaxq5RpSWsCcSK4HQDEiq4mLUFVNzd9VxSzJHEO2TMg8V3iKEySU2j5u2RBkTuCAzgbSJz5eULdUi6gdyT45R7FDlr5UJdRbKTA3Mle6P2IYxMhT2EGA5C/IAUWMwuqHYFwKC70wr/QCX7tMqLGf4rbuf13RguwZcGh/F0G/948ev8JIv/GUaJTHia7rzaN1l7iacgCPj/dMR0UWQwY8/oSCh85McHOhQZcC1G+CPAFUoGMpbnFyZdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qf5hWo1jxtKxy/QAJbMzqY7B+GgOm42sp/yu7jP5BGc=;
 b=vRx3mSzZyDh/jEs6w73knGN9lxTQWZ7coK1U731zvnIfnik+ymXQ9xnUcGMd4l4hqU9jcJlsnbYlU86b0xPHBigkA0VTH+xQCl8Yf8gq9dQgmdQxlfAgRQ7WdceIzE/iThxQZVQSo/EDL4X+LKiwI5FjbXyQaj+hrq7GNzIyelo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <3ca224c8-8a68-49ec-99be-27b9f2147084@amd.com>
Date: Tue, 30 Jun 2026 17:29:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2] xen/mm: Remove INVALID_{MFN,GFN}_INITIALIZER
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <20260630083441.726684-1-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260630083441.726684-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|DS0PR12MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: d4df9d3f-f312-4e5f-ba48-08ded6bc558c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|36860700016|82310400026|22082099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	S1FTS17ghSRvzc1jFd2xi3ihJ3EC8OcPr6+E3feCpGlmcGwIBMaLdb87v6av6ZEHGbly7oFFGhhokL+s9nTRZ0FOWTwFoW8Wc0C44WWHgLP4dZyFI7hO25f+IRrbK0T9KUCAyCtnICB0CI9VckGrLbvlqxmEjaaoaOZ5l1t8iSH+RBHr3fAjR0zGVEM9JmSDL3lIY+4Uk4ihPRknIDDyQqnb+04jSJ9abSS97N+rP2MYyh6ODTWjQB3n6prnLtHVcJYWUMxw8QC0yMfFkfppvWxoXaE31MsCqc2nK5PAM2vrJuEu77B4C9LwBmjunjE+1oSCspvmeDvIhCJ+TubNMyizw/PEGTUGGrAL/M3aFkb7S2DtzspG+XdqTRAmSiyaeQXGLL8B5OE7YLFEtCJIIoXs4gBx9NvRkD1nIgdk3Hh35S9BqWPiC+xq1WJwV9CYz2YlyYmNsOU51fSJMMwmKrFBr3yVrUuC8vA5s7BJWGJLdNAl9OlHjXhSa9I20+96KamtwlvO60vn29tvYY++dSFUWyT5STNC/B/KGVlncjQd9n7JxOUFhneSK36vkWL4N0/KZNqa/A3W9btvJjd8gr+5lORBv9/5iysB4Sl59TANPRtIFPy1zr0T8nsPkf7fp/F7flADGnqzH9/dWrCujmbj3L/fru6YDEZtsTxbuq/kt622u/2o6KWIiApXmt2m
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(36860700016)(82310400026)(22082099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eYaS7N8G0JHYmjRI5LSJUkbRQ2kRCjz6H1Xo62CtmUboMpmIUuUohH7G5SuY+MyuXsaqB7+ltODaHamzC+kixKfdioWRBOwmuhBGwjdOMTbZbuMWAFNa/3qcaynMvEmGiCN2NYPNralfts2td/SYqrDLor2hEE6a+PgGgNcd6VuAdxIhwp4pYGh59CQkOjqGDMZfFwX46VCVfb5HUEY93Ez8Cdc06+Dw6YJE6fcjKObyiHkbEbjA4Ro6jTCkPApL7ocYNqYX5DHUk3j0YG/FdZWBtzYASvAQIYqZTZ7Vwd1tvFM87bQAZpZnkFPkykuZvKXnzHD+HYFf9M0vcSxerg9qrAu+JYegNtZtvRUaOFFH8nq3k66mVvIbHVoNgcx7Ukb1I7P0X+QL7YvJDST5XyLQdVBKjQKx/YGKfTnSEAZ49JpdQBCsxO9DoEWjGWwc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 15:29:10.9904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4df9d3f-f312-4e5f-ba48-08ded6bc558c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6462
X-purgate-ID: tlsNG-c201ff/1782833357-16D162B8-60116138/0/0
X-purgate-type: clean
X-purgate-size: 771
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vates.tech,suse.com,xen.org,citrix.com,kernel.org,epam.com,arm.com,gmail.com];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A790B6E5F0B



On 30-Jun-26 10:34, Andrew Cooper wrote:
> These existed to work around a bug in older GCC when using struct-casting for
> variable initialisation.  However, our baseline toolchain is new enough to not
> suffer this bug.
> 
> Removing these resolves two MISRA Rule 9.2 violations which exist in release
> builds of Xen only, where "= { ... }" is disallowed for simple scalar
> initialisation.
> 
> The BUILD_BUG_ON() in xenmem_add_to_physmap() cannot stay as it is, because
> INVALID_GFN is not an Integer Constant Expression.  Replace it BUILD_ERROR()
> which is the nearest available alternative.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


