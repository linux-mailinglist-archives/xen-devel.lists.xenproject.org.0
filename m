Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mG6XFtWhsmkOOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:21:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C564B270CCB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252073.1548852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0e6r-0006Tl-8n; Thu, 12 Mar 2026 11:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252073.1548852; Thu, 12 Mar 2026 11:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0e6r-0006Qm-5A; Thu, 12 Mar 2026 11:21:45 +0000
Received: by outflank-mailman (input) for mailman id 1252073;
 Thu, 12 Mar 2026 11:21:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=17Qz=BM=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0e6q-0006Qg-Co
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:21:44 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a515461b-1e05-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 12:21:42 +0100 (CET)
Received: from BLAPR03CA0175.namprd03.prod.outlook.com (2603:10b6:208:32f::14)
 by SA0PR12MB7089.namprd12.prod.outlook.com (2603:10b6:806:2d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 11:21:38 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::ca) by BLAPR03CA0175.outlook.office365.com
 (2603:10b6:208:32f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 11:21:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 11:21:37 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Mar
 2026 06:21:34 -0500
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
X-Inumbo-ID: a515461b-1e05-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cANjpbbNdAhIVgUFtD5ujr0TpLAuRDbpvVAhhSTKnH/vz3jat4v9YfGklkNGr9XM5NxPgbySyoL2icEo8NyNVhEH8aJzx5YcUBq9pzuLxvnVi0pV3HGstUyiZxMmk0HPZWOw5qLRwvG1XtYgxdbVxivBZjLpp+YSAtR9A6iwZ4gZk3KrGEj5c5TdojqmKxa08YVGj3lhVUXjTrduE2JMatu/Ejvj20945uYlISU1kgSsq9zqVf64OkdMWwnwP4QLptafW4CLrDmMX9TmI5akeL14lvmIjdZ3YZ7uJJ/I6/bZwkExqm+EB3LfNvFU+nuwQkE9dLeLybCp2lHQtYQq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fl9WOa5+CGWuMt/NgIMPauuuEm/Py0qSEHzrocRSpSk=;
 b=KIpdDqN2Jk8F1oVzD1azMWtbIiC0gWtf1lymkhKxTku+i+hn4iUbfYYAUp/wYOMXRG685lJ31iGZWRs6sz7/vFwTlFSd5Ds+t5qFE8B8SVIGQPOVWvGZgWtHKkNogEmc2aM7o8uZ/TCFuGJLb3K6+XHErnt4G4Nqdp5dJogNoYq5TXVGWP7fN056FQoBEnBHHEj+is/+N4w4VYVajCR8meRlyLuz8txCnv3mDSbW2Um1mpA+I3iK5x0kb8TVCqpSTYDP3kKxwbyRr01lksYW/R6B1OcrI90Hkik8WDyBAM7rBaNp0h7zO8iep6+JgJiYfMew4yKJPzoYLHnJHfwPrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fl9WOa5+CGWuMt/NgIMPauuuEm/Py0qSEHzrocRSpSk=;
 b=gmE0VExvzmbivTJ8YJABUdF5dGjM6HeMx7nTkJgys/+gbdmyVwW1Ya/xC23rvVf9im+wY2otqfJfAr5YJTea+8Gx6iN75sNbR9yUO3hqzkqZPBoMY0YMzTy1Ygu3MK1ijHZJNp5yoRzhOmE+6NOfJ+FJC1Z0kNjmuABTxvNYcww=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jason
 Andryuk" <jason.andryuk@amd.com>
Subject: [PATCH v5 0/5] x86: Drop cross-vendor support
Date: Thu, 12 Mar 2026 12:21:09 +0100
Message-ID: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|SA0PR12MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 05fc8d67-1952-4044-98e9-08de80298698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	74wxoyiOkc7d5+3CxLMAOtMVRMa5WfbSuQ++oAfEaaeG5fFXSZB1TPjFvvC9K2FICyaq/houCI84jMhQuJG/Q2OI6JsztBMAxjx8esMqAn/r3Eq0YWFOeBe4X8mVjAmIHBx/sDR6cLkpk5UeXTnKkyAlh9NueUItpEpvHsEhUkFpmrpK3zyZYUNzoMKxwh+hzEb5j3vffaCozTUftnsgZEyGHKBeJG8SbWjMcPnJBZ27dp+gnbYFPt0ecKefvNdRwYTXg8nE9G9Xuxxm7OB5gnr40tigK5XrUqc1vZrD+qxu6OT4x2DsoXiqOo+4vi9SxDrBeP+x3qtMXZ0F/X3+n4Q6TE5RsllgIC41zMoPXnB9CrZevdqIFhKsNVBLjpCOpvEH+6FWGJP5dQbiTsvAChF8zTCGwdmAgbInlML+y7mooa4gcoBor8Wl8A9llCxHr/ctqfj+oedGw1hPmRnvS2bxLaeMwE0GQb2V0rlefDZZUGZ9iyAswP4SWGrjxhOvyIBnWQtnMF7x4EmtcyfEmcpqVrkMfs6s+kRBC9nzrLKbidSyLDj/6SjJ+gs6DFckloTjyvpd3wByLQDdrZ2P4FPAhrZgngjSb9qhYiiLgCa27JH2QV030jAXHE/hpS13at9/EXgVaO1KPkhrn5Ei9MNFqq7UDEliyGnJuhebXBOAsWtjOHs1LiR6p9pFTxsROXAgx3D5gXr7GuL9UDVgitHfpna6ohZbBgFbBA/n1JhkxmVA0Fnwpu0+4LfxfI2dT+4cFg/IQuqEKO3KXpjsyunyMpPIfOl4N/Rs0XFmQ7Q=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c+LdKe8jgbOrr1ayz52g3eumnNRkyCEgXaj4hPzUBoXQjzoSsWT4bpar7bcwdZf0q6brh8TaeOaZnWdDcS5CS7zW+/iweFc0s6o1hj/Fc9Qq9PBUie0eSAg96uSGw8+KWkBaZKlqfc0DLihMzQHRnr/mX7IN8+l4Q78NF9+kLkXAsi/t5FoHP70ASQq1spBU+Bx8wXVSwVCzlu2NMKyFe2/RxHIXz+Hn9sFStpAXf5Ne90nh8GGHygf+IEGiHVazuSqUQz1iCVOHcARjO7b0YxBaIdbuU/ythbcjAO1Ij2upfR15Q+bgmM8bjL7hCR4bYpu01DcsfJ55/pWycOpBjq9LoyMZCkJdNtxj4ZLAIZp7QvtXrIy1cP7c/yN/eDyFAdM8yTKNWP/N+iZs6cUQMRZ2HTb2hnHsQWLnuW9OW8I6mFVYkKmzkHhr1ODA7qit
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 11:21:37.2888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fc8d67-1952-4044-98e9-08de80298698
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7089
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:jason.andryuk@amd.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,xenproject.org,suse.com,citrix.com,vates.tech];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C564B270CCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Patches 2, 4 and 5 missing acks.

Patch 2 now does a minimal diff change, while 4 and 5 perform the meat of what
v4/patch2 used to do.

I had patches 4 and 5 appended to the end in the hopes of having 1-3 committed
sooner.

v1: https://lore.kernel.org/xen-devel/20260122164943.20691-1-alejandro.garciavallejo@amd.com/
v2: https://lore.kernel.org/xen-devel/20260205170923.38425-1-alejandro.garciavallejo@amd.com/
v3: https://lore.kernel.org/xen-devel/20260213114232.42996-1-alejandro.garciavallejo@amd.com/
v4: https://lore.kernel.org/xen-devel/20260311142711.16754-1-alejandro.garciavallejo@amd.com/

Cheers,
Alejandro

Alejandro Vallejo (5):
  x86: Reject CPU policies with vendors other than the host's
  x86/hvm: Disable cross-vendor handling in #UD handler
  x86/hvm: Remove cross-vendor checks from MSR handlers.
  x86/svm: Drop emulation of Intel's SYSENTER MSR behaviour
  x86/hvm: Un-indent the HVM_FEP block in the #UD handler

 CHANGELOG.md                             |  5 ++
 tools/tests/cpu-policy/test-cpu-policy.c | 27 +++++++++++
 xen/arch/x86/hvm/hvm.c                   | 62 +++++++++---------------
 xen/arch/x86/hvm/svm/svm.c               | 45 ++++++++---------
 xen/arch/x86/hvm/svm/vmcb.c              |  3 ++
 xen/arch/x86/hvm/vmx/vmx.c               |  3 +-
 xen/arch/x86/include/asm/hvm/svm-types.h | 10 ----
 xen/arch/x86/lib/cpu-policy/policy.c     |  5 +-
 xen/arch/x86/msr.c                       |  8 ++-
 9 files changed, 86 insertions(+), 82 deletions(-)


base-commit: a3a1e61ce9a00c5a0c8003bad8f1285360399cf4
-- 
2.43.0


