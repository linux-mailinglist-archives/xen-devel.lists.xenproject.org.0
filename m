Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kqHNFNdZJ2o7vAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 02:09:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CF165B47E
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 02:09:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=bq7qLDPG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332154.1594800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWk1s-0003MX-GS; Tue, 09 Jun 2026 00:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332154.1594800; Tue, 09 Jun 2026 00:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWk1s-0003KP-DK; Tue, 09 Jun 2026 00:09:16 +0000
Received: by outflank-mailman (input) for mailman id 1332154;
 Tue, 09 Jun 2026 00:09:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wWk1q-0003KJ-Fy
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 00:09:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWk1o-00A1LP-Ew
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 02:09:12 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a2759a5-2eae-0a2a0a5409dd-0a2a4501af50-4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 02:09:11 +0200
Received: from [52.101.46.71]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a2759a5-c1f2-0a2a45010019-34652e471a38-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 02:09:11 +0200
Received: from MN2PR15CA0056.namprd15.prod.outlook.com (2603:10b6:208:237::25)
 by MN0PR12MB6272.namprd12.prod.outlook.com (2603:10b6:208:3c0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 00:09:06 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::4a) by MN2PR15CA0056.outlook.office365.com
 (2603:10b6:208:237::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.14 via Frontend Transport; Tue, 9
 Jun 2026 00:09:06 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 00:09:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 8 Jun
 2026 19:09:05 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 8 Jun 2026 19:09:03 -0500
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
 b=OdPvtfzdZMaWLaUvGZNioSP1fvtCLy6Y5udXgU1nSVgsTet4sHaz5+NkrXR5H4XjT30xE641KsqE02KerHKCJAU8BkN3Y7QT9CWKTFVm3p336IvCyGhCk6fBM2q0PT1dGfQEt3ncAP1NIKKXTPuUvG2QmEr6BweiHZ5IO1Vxh4dkMIg0+9rYTjP6wPXX33t1AqYcrrhGtJtBQCRb+rD6+S0Rc6sINYhvzVkjVVUR128BF99cpHflANk/nTuvdyCbMrGDJdXCFAN4bbcF7HBVtyHx4CDhPSlT8t9AEbmqZh6wfy6LubWR2udJV0xvxZNne8b2uZj2Zin1gp8uqPucoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPbgNWRKj+FQsWIjXJBl1E6b6LJ3lrfQK5YEhG6LK0Y=;
 b=KWq68tIIV4Zcq/URTR42mMy96q7XZj8bpP72e8UUed9Y/KyZr+yUBWa7Qv4W6inb8zzgyaMIsMKzuElKfY0DmZy6NTl4cbIrwKIg/PmeO89YMRChNqg3v/2s9rCkkBM8PZEWc8dCQ/7cm3pQD9tlF3TCvX93rwTGGVKjKrbKfn+V9uz7a+iU7vdBqxxaSWoiff9tRrK2WRxmXfv/4UUnzoC5gVONQipnEZgtBFCsmODmWVhnDzqP0HiOjYhWdbZZ07Na5XdjUp8lUdnvV8mOumgNIX0l1nc0WdWFCt8MEaaXPLxwTNH9/hBEo4hL39+zwBTjSxqtLTBMCWja6zMA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPbgNWRKj+FQsWIjXJBl1E6b6LJ3lrfQK5YEhG6LK0Y=;
 b=bq7qLDPGMuW0puLAAbdDs6zZzkKAN0aRCGPxHnS121z/OysVy+3GKyXnOlgsGwY1hYkB+FXPTis3OBef0FW7itkpmdTI2avDrKkLJe3A9Phbx6l7OqLkaaOtKM4RlyG3xRfYVfFEiZxa4K5PGe6I644NJYFQcIjd7erF2rgKr5Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH v3 0/2] xen/x86: Change stub page freeing to fix smt=0
Date: Mon, 8 Jun 2026 20:06:36 -0400
Message-ID: <20260609000638.121027-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|MN0PR12MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a7dd4da-2388-49af-7af0-08dec5bb5233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	7HwP+Fo5jUhWZyP6W4oNGsNhuVSQ2/1lNZs5hQ6yLYLcKunGtfyIrmRhq6vxcAtZ3pjuH/1VnM3GkVxn1z82z1vDgxRfysQElIXOdZ718foOG8vrW1AUdOvJLXcOOwXz50J68eIbF7xoZKLkaxJkePuq4HPQdj6RXkhoredzicw9KfCZuyXtAk1H2CPseHh96t09Jnuc78nCuRaFPUGqhb01KBCQixZKfHDEDfy1eBCnMDIqkwkaVm2yIDJt3/9F93DrxXxHlmOzP5KUyWQemGykTYvIgfW8XcObZvSVI6oN84KxSq3IcKYCzxt4988Yg4mIf4Cr5jMSYekK58ZYo2XWNmS2iTeEWXqU2ODbaSHAnimIpUUR0BEBfQcj7aRZmao31rcjFynXHngJSjmg0CSFQdn2YcTbvzCAgSqVQLB60Wmuz+fH3obQb7B5QNB2R3A4HOrmwRfSz6slpokKn+37l6iUVzG/cs986Wt9PTz2ZmxXgiPPvfrNW9v9Dl1cFEsr3QFdJhbPRLMbS3qKY7CXxDrmCC60WlEq07s2uyOvxohV4GwhyARE2Yw07afxDAFSya0O9m60COJ6OSt+HkEFqIrr22liUVtxxbzSA6Zz2enL8DHgS9Ffm1n8qYX72kYQdMv7YhYh1z2mgMQZHz9mfYGZIhoaM/usMITFQswzHQov9iR/0uSD53onB8fW+DcS53N1rtFw1cBmJ48zZg8HGig9XYMqe1z7QG0K0yQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qWIgOLEySgj2VrSlI1rgKiLSyo8HBprrnuvaC0QRyxr84UpxznmyWkzPbDWQnrp5x0TcKSnHD4Q9cdKuHKbjOQJF0mp3n8bvdrA2jM9nDu3oTAq7+B8lJCEFXpAVpJ2B9HSNeeAt33Wf7ISEIL01ojDymHg0FZclpg3W6CYCUPvOqqZJsEvr6Wtax3lqhFAVo9myIOAqpn2V0eE3ELLwKjVIDNEDp/H36+ReVuCuqMZPmdqn6aRNCRGylP1Ns+I/6cRp295AqktwLRzxIrajEwUVaisESc6LD8MMivrlTex2pbfr+pOuH4/OLmy89ntkGp4xEbsa6ZswGJCd/NWwFH78hjTqoEVn9wg8waVBxS2HyGj03zuD37Y1Hb7IigW2zc8lmYCq0lht3l8QZ7p16tHmcZNv/qgQXgiN0idWoZVDJEOO8KbX+ODM/FkA53Ta
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:09:06.1490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7dd4da-2388-49af-7af0-08dec5bb5233
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6272
X-purgate-ID: tlsNG-d62444/1780963751-AF35AFF4-F6D96279/0/0
X-purgate-type: clean
X-purgate-size: 692
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92CF165B47E

This is a third approach to fixing the stub page handling that is
broken with !CONFIG_PV and smt=0.

There is a CPU-indexed stubs array and a NUMA node-indexed node_stubs
for allocating the stub buffers.

From v2, this patch
  xen/x86: Remove unneeded stub_page setting
is dropped as stub_page is removed as part of patch 2.

Jason Andryuk (2):
  xen/x86: Return virtual address from alloc_stub_page()
  xen/x86: Change stub page allocation/free

 xen/arch/x86/include/asm/stubs.h |   2 +-
 xen/arch/x86/setup.c             |   3 +-
 xen/arch/x86/smpboot.c           | 114 +++++++++++++++++++++----------
 3 files changed, 79 insertions(+), 40 deletions(-)

-- 
2.54.0


