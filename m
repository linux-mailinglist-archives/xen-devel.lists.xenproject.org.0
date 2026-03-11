Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F3kJMiAsWmjCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:48:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00390265B0F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:48:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251170.1548408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KX9-00089h-Ib; Wed, 11 Mar 2026 14:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251170.1548408; Wed, 11 Mar 2026 14:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KX9-00087G-Fo; Wed, 11 Mar 2026 14:27:35 +0000
Received: by outflank-mailman (input) for mailman id 1251170;
 Wed, 11 Mar 2026 14:27:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tK7a=BL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0KX7-00087A-P6
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 14:27:33 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fa6765c-1d56-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 15:27:31 +0100 (CET)
Received: from SN7PR18CA0028.namprd18.prod.outlook.com (2603:10b6:806:f3::11)
 by IA4PR12MB9787.namprd12.prod.outlook.com (2603:10b6:208:54d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 14:27:25 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:f3:cafe::bd) by SN7PR18CA0028.outlook.office365.com
 (2603:10b6:806:f3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 14:27:20 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 14:27:24 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 09:27:22 -0500
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
X-Inumbo-ID: 6fa6765c-1d56-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asou78lM4f7GfT9vCJ7pDT2IZmTwaOZ4288Qw/HrI40fgr8i9emYWTFv5N7acciymhCozWwjpSkTJbwPc/qsOGs8EpbRRvCyANvYwX7Lgqh240H1wmROKZvSyU9Ha6q6P8Ez4K3kIGBOjE1gUYDqxfeEeeHu6ROlivEOiHF7YYkqLUdJoEXbEafjC7/9p3xOihtz2LkvG0+sRG36R5mejwblu8T4/+fSwmkj6AluQ+w5l6Z5eB8TopmaUDtm/AbzSPVWPy5Ouq5KJfNmygJn4J+XSqBBD2AYuETfNYaT+u92gpwHw/tKaWhYIQJYFRfgJHgsiEqYqpTM2yk0IkZzEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rX85h1Hwc8oqInc2hnINB1xhgtpkPVwSbXpHMzhPg3I=;
 b=DIzvZYmMJMx+6RqGSLoQmmUoEfJ8soVUC4iceCS9iaN5m1umdYqmBnMmQOqa2kw3MEMdxD7wUQlyrczKsQGbGnKSSaOqHPUxQd5WkT3swOxDkbvSw0Gm0qb+JbXAF/OKrnLzLQCQ8KUYq9OyyXyJ+XzlNobUmbBQVxw19W66yMLTjBNwYYhHcV4Yh69MDnOEvUtp3CBBuThFLEgnWf2kSIBBNU0Fo6oXvPit7fSutLyDrSy9DHjCQmF6ID1nRLYnnykiyXI6NTJNN5T0hTn7aeNYifJqGCublJWYp4eBX04vffZZhmEHt2X8218+poQ9d75JCUPCJLEaIe6s9w/FxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX85h1Hwc8oqInc2hnINB1xhgtpkPVwSbXpHMzhPg3I=;
 b=Na4zcyltr74ruaBij/ZOEKdLYs8XcmC36iR/hhaJbjY6U7vZBBQL7vcZh481dzLyc3D/ZYjpkNG2qXzqAhc82Ow6RAeHqGH8tlMTtQUFroUdKVzLeHPR2Ys+NOAwlhYkY8xLkbS7NZv7PIMj3Ix9pQ/o7M/ehEfo4C9Tg1KJw04=
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
Subject: [PATCH v4 0/4] x86: Drop cross-vendor support
Date: Wed, 11 Mar 2026 15:27:03 +0100
Message-ID: <20260311142711.16754-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|IA4PR12MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: 21fd5987-e9e2-4883-b2d4-08de7f7a50b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VaBGWPmJUjXglkNEQXMs6H5QRDFb/PbrWizRY+8V+omFt7A4Rd2puJ4uYFbGRkaTOxvB0H1+ICVjrOZptKSIE+hXCMxE1eJYTy/2u/Z8GQMyVsGlLseIvT+hU/sBfA/sRM9evXONP5i8SuAHKIZWC4yw0hZdZCb9RpWeD5EA81f1USyKCPlrEBSpNpootC17OOdBDWrG7pyi0J6LOGX0uVyhAo58ZobKC7JyWyAf0DUBSwhN/I3aqZ2BQgjgQxK5xQtvCy9oQFKwmzkAKitNdjL2zbPQINcHS9rir6RVnO2NoIBMJdvEmr95OT9u4ABuNN6W7v3VpsLFeVryyvC9aJTDQjrNMwz//jYuuuT65dHuNIT42obEd1Exdz3mQaHHGqWo61Kmhq2w5qtbWUqWHRz+z6gERzSifqj5J0OL57whcBXHhLUtjPUl6nxI30sWYDayAerMuVkWGHiOcx8XnjkPE2en/u9fNMmM9RTR/hhoC6O47H+ardr64nUwi0cXOsbhcEN93OsMdOAR1hq+HscoLuWIMEB4eVXU/h0MZwkQqRoaZFjCQKspxb13FaSuiFdK32MVJXMZaw9Q9vI6KOY8PapFJGT07A8Ilnav4tSSY/wCyE2GCOJZ801rd/nVgN+XKVOPCU/vmaQySBGySe24VfZB/dMIdGtOe9rK3MDZtrJtdM2/2LpAtzSVi2J8gW6sRO1FSSJlu2r5oJ0p3WEOYJdKt0Ckdt6aKBlt7EXQs8Y2fD7Qn1D5fXLNhR4Ln0y7mG07la66uJbLYHRkOK8Xn3a7Q0Srb5QrqeLnALY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6lLTd0OS17ue2O07i1G9Ty+wncOXkJJ6KhR6V3G49vtEs2TYFRsNWxSdUlEakNK5VZvZvNU/9V1Zy8/SIGK7n35RDGx38uTftnY4WiDkm2tpgT0H5Uzyc2XU1jKLkfP5kQ1KMJV22LhXrkRC3VQMfaGhXkkgDKcxt0BySpSdvVCvxOHI61cQTKiy1kHYSLfpsQOqwAA/j4wBpFdykg5zVcGWMHIinxeYkofT6LEKbbSZjc7oOkcd+yKxz8DLkTjmukZvjDIrlnsTmFaZ5YdPAvkfeXb4qxL8So5ywUGn24rJoYZhFptMRM5Vq+HDKG2VFwJjKAOZSzXjilYPxs/kF/sWTs3X9Z6BGFYqV4cH07yPKNPrATctmOX4DMiPL3sDxT4f9RISkcs5aa+Em7FfYks9MxsKymo9tuC+l20koKA/nF0r9tmc6Wmo1kYjedBp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 14:27:24.9314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21fd5987-e9e2-4883-b2d4-08de7f7a50b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9787
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,changelog.md:url,gitlab.com:url];
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
X-Rspamd-Queue-Id: 00390265B0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Only patches 1 and 2 missing acks.

v1: https://lore.kernel.org/xen-devel/20260122164943.20691-1-alejandro.garciavallejo@amd.com/
v2: https://lore.kernel.org/xen-devel/20260205170923.38425-1-alejandro.garciavallejo@amd.com/
v3: https://lore.kernel.org/xen-devel/20260213114232.42996-1-alejandro.garciavallejo@amd.com/
pipeline (green):  https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/2378378894

Cheers,
Alejandro

Alejandro Vallejo (4):
  x86: Reject CPU policies with vendors other than the host's
  x86/hvm: Disable cross-vendor handling in #UD handler
  x86/hvm: Remove cross-vendor checks from MSR handlers.
  x86/svm: Drop emulation of Intel's SYSENTER behaviour on AMD systems

 CHANGELOG.md                             |  5 ++
 tools/tests/cpu-policy/test-cpu-policy.c | 27 +++++++++
 xen/arch/x86/hvm/hvm.c                   | 73 +++++++++---------------
 xen/arch/x86/hvm/svm/svm.c               | 45 +++++++--------
 xen/arch/x86/hvm/svm/vmcb.c              |  3 +
 xen/arch/x86/hvm/vmx/vmx.c               |  3 +-
 xen/arch/x86/include/asm/hvm/svm-types.h | 10 ----
 xen/arch/x86/lib/cpu-policy/policy.c     |  5 +-
 xen/arch/x86/msr.c                       |  8 +--
 9 files changed, 91 insertions(+), 88 deletions(-)


base-commit: bfb33fa6d4eb4110cd7dd47ec71d2e550739e126
-- 
2.43.0


