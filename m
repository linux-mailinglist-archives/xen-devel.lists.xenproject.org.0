Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD25ClEOj2kgHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:43:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D4A135CFF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 12:43:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230718.1536166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrZc-0008C0-7P; Fri, 13 Feb 2026 11:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230718.1536166; Fri, 13 Feb 2026 11:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqrZc-00088k-3h; Fri, 13 Feb 2026 11:43:00 +0000
Received: by outflank-mailman (input) for mailman id 1230718;
 Fri, 13 Feb 2026 11:42:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FeGe=AR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqrZa-00084s-Oq
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 11:42:58 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22bc5ac4-08d1-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 12:42:56 +0100 (CET)
Received: from SJ0PR03CA0337.namprd03.prod.outlook.com (2603:10b6:a03:39c::12)
 by DS0PR12MB7725.namprd12.prod.outlook.com (2603:10b6:8:136::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 11:42:50 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::c9) by SJ0PR03CA0337.outlook.office365.com
 (2603:10b6:a03:39c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Fri,
 13 Feb 2026 11:42:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 11:42:50 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 05:42:47 -0600
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
X-Inumbo-ID: 22bc5ac4-08d1-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvBS7/VPGh25lEb6N7q5LZuBXMt2Z7yRlgXex9OrAr5u6TBxLKvdXx0SPq1oB8Zsfu49r1/bgHxRMoFgzMYEfDnud+oZVqTboHqwowjGKG+SSm5B7OvHxjJqxvaVbKEy3A5Z5ypmaoT8IIb9UWL0W+iCXhZb3ahNBJB4PG5i576LwVqXTCVej+udTBnxdhT9ALEnaF2L+cghb23ynDRGxfW01QnoLHkaoLvNXdC7vm+RROXA3baFLGlSBxO+ASXrfpbJDK+yyAPnjFqiRimZwE+wCHDUCnmtyAbI5cxSK3Jyaf7tVkJZ5EIXCWKWPDc4vggLTgUWosttOkaaTv10Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0y/jiaWpDpjk0pgHhZt6MHRmsRmszq2JqQEQKmVQpY=;
 b=d6r6yAroEnWsL5EPZXKZibQbfImuodgG2LTCDEPLJtZlKlczankrBlyljM8HWKP19X4PpAdV8fMoAt7dIODsZPerg2AKnvvkwi5OB1xbDXqohBaaUeHSa7husTA5RnZ2YwvnHY3CPUQdPitcJLTfcd1B2nJuS8G7PbUNYu3twG8k8C0GuXyJyneV4yRAHpyCn79N/hwyf0pw+KIGwq3mFXiVg75DQeoCjtt2hP+6QMMAUR2l6rRwSRpIASviwf3QFjUs/5UNolK096Fn67FAKFxgUaeiabiLwOfZ6i1lP907pjX2+VNObqRMjfc79J2DwG5o8ur0t2XcYh6GpsB2iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0y/jiaWpDpjk0pgHhZt6MHRmsRmszq2JqQEQKmVQpY=;
 b=c337/MvhtjYafSCTd04pyn+U3NGTC05lNgj2VtMrnQA0TT04R3wrwDAx3IACf7J1jTIkHJfEjJ4e/0ejLnQkqoOZ8USgvUetG3Tzu9JiGrAPf2wyozL2WAUBZXfJ7KD7YTq3h7aZlldic6bx/O8MTcqUUoEWm+Kwpoc+C63X7qY=
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
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 1/4] x86: Reject CPU policies with vendors other than the host's
Date: Fri, 13 Feb 2026 12:42:27 +0100
Message-ID: <20260213114232.42996-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
References: <20260213114232.42996-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|DS0PR12MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: 6afced65-a829-41f4-25b7-08de6af50436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iW7PdIT2vD0IAWOHcqS/D/vJGSvhZ2r3XnMipdKg8BBkvMCf5WV4rWKgCyre?=
 =?us-ascii?Q?pDpslIjjyETk0SUZWGUtOYZYKKc2RV6Wto/a5MDhvF5VuDa8a76fPao3BI8+?=
 =?us-ascii?Q?BnqDK1Rbc9abu6JMJkhMSU1XlYYRYz9Hh7NCumMO6Fd3yceP2OBhYch8Z0T/?=
 =?us-ascii?Q?z0G+joGjGgvxMKEeEQV3d8+CgiZS1eCNhDoE4oJqaY2YCNTrk/fIoejw2cbU?=
 =?us-ascii?Q?PUn9VZFYc2f4+OsKbZdKym5G3riS5cF9bWrZEOyCGTQcyfyl6y8/JchAA7rF?=
 =?us-ascii?Q?A/xbLmgJhdf/0bjuQfStbptMrpdETLVi0nAZ2UVTCWowrjHHabvsCsIls67M?=
 =?us-ascii?Q?DDuGfDyzVYEQTJV8GDAuBxOKUdhHL2khqiV1owEosOc43Bwj3ykbcUBHMAcl?=
 =?us-ascii?Q?lsY4H4+SZl4NcsiYSGnupPEFcNUxhZ57R6MtWquwz/93zXTAP2uZnENQWZkX?=
 =?us-ascii?Q?KK17PifsV1NWCfbnSjGkprLuNJgLsWJsBG/935KF91Tirxcf2tBkYkRjLDCx?=
 =?us-ascii?Q?jL3Nms6ae5YDbuyGjsG084V34ULalV1l/lQcW6Z6TlzJ7IU7yqV6jkKuveYz?=
 =?us-ascii?Q?faE0pMP8OC4p7my2VxsLKfQOswVOnb6JLCgoR93rQesWSBsF6e8e0wLPaKRF?=
 =?us-ascii?Q?cXt59uGDhDyyG54MGGXJdfHtWb61fxdKuqy2S0L9ZYFOZZiRJTgWMhVCsPYj?=
 =?us-ascii?Q?vW3ckSh7YVl5QwAdB47NUukiTplhUBsUChzMhFJ4rh80UzyeixIruC57LKCW?=
 =?us-ascii?Q?wkL72c97pNLrlY+IdH5CZmzQa78irmLIf55zWuqivPk0EPp2i++lKcFOW1Kf?=
 =?us-ascii?Q?LazjY+t9sHbOYDo9Q2idStxu/R2wWVDoSu2IPVdcHRj7lwv+ZsiqWknpaVZa?=
 =?us-ascii?Q?Qwxeip9kT+MRiMGEd2Kn8LMwKDWv3AyzQSBixmFZx4LE3XhvNL3vVqIKYfZH?=
 =?us-ascii?Q?w6C8R3fssoHi07sNOorRwCgLfMGUmy+V4ByIOIpBE/TkLqFMw9TnwyxnO5SG?=
 =?us-ascii?Q?9xxTDznsZtNTUP5PKgxyIMXm3k0dDO9P0OPR79FeD8BVFGTPBO2Tm/pju61P?=
 =?us-ascii?Q?Jz9rz4f39PfgffU211gQAmvWjK01PGOKWsKvxTf85PlRzzDytYf4yANhAf/8?=
 =?us-ascii?Q?uyncTwouQodAfoOjKRFm4xeX9gzlwKCbg2G9QCZEen3yWa6+7TndVbGWR/g8?=
 =?us-ascii?Q?PYDrhcnhfrnlg3ebYWFRTWfde3z8IehOsd2pRSNIUKlY6VAW/JI9ts9qaOSQ?=
 =?us-ascii?Q?yHk3xz3f5VY0kG7ozQwcstXe+oRRDzGtinpKY6/r1PpbSIsJbBkjo4g/Uhns?=
 =?us-ascii?Q?lZca9cVWviWb/Lu5YzecxrPNdfO0gMksMvTvC+b+iY3QEZWwyvH6aIJL0v4B?=
 =?us-ascii?Q?XynYJJqO9DBLP/xdWP+pMvphmcSfdMzKhgJikG0r+ZKbqbG4Ey0hYZQI00lk?=
 =?us-ascii?Q?JfysjztIevyt+62Li2NC6AL4N9Qf7523SnXDBGzPrTlr4ECewxW5w4IPX57+?=
 =?us-ascii?Q?E4ATK/27pYn9469QTrg/f1SmlBEYc/yKJhRP1WatX1IeWsmOUcn23KWSVHWs?=
 =?us-ascii?Q?+bHCIFBCFbp0D2/bhXEZjArCgrvDZTLDGFN5JXxKVt/W8usMOOltN69/yGDD?=
 =?us-ascii?Q?0A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ue+xFcUw8DXj74Btygtxi0LvCGAa/SNvDsWj8bfEA9QK+BmzMxyKuAK2TOmMA7UhJBALQQq47Ep+Be2fMaXI58iGgqmOAECEAjvYT7zBozzHrM2s+0f3OPD8kZgyBcs27+C1bEGFBGIqt6Ze6lCFohGCfa+pgymRgokPJHQpm0Q6HjgvlEegVt8wwqLDJUnq5nHwEIp+AiZHBo2Kl0O8+UZIsXsW41mg8NeLNOBeqjk5GCv7HgI5uoggFrhNNEhmpNqFvmTAn+OJEYMsPKwAw5ENJp0Ejxjrv1p3ToCvyqWrJ9rC+1UPEjtRyznovtnO05FJ2pDksQbpA9r6BKKjbEPOBDoSYXJf00Zp+6ocdYukdezEhtkjHmczBKUGqHjiRX72zNFuUs7uaamG7y9qusqNA9VkQG0zyUpCBeZmUnPu5Zee07Ok90caQsapYZhE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 11:42:50.2042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6afced65-a829-41f4-25b7-08de6af50436
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7725
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,xenproject.org,suse.com,citrix.com,vates.tech];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 74D4A135CFF
X-Rspamd-Action: no action

While in principle it's possible to have a vendor virtualising another,
this is fairly tricky in practice and comes with the world's supply of
security issues.

Reject any CPU policy with vendors not matching the host's.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v3:
  * Check vendor_e{b,c,d}x rather than x86_vendor.
  * Added unit tests for pass/fail cases.
    * They cover a success and a failure on a comparison of an unknown
      vendor.
---
 CHANGELOG.md                             |  5 +++++
 tools/tests/cpu-policy/test-cpu-policy.c | 27 ++++++++++++++++++++++++
 xen/lib/x86/policy.c                     |  5 ++++-
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 18f3d10f20..426c0bce67 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -22,6 +22,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Xenoprofile support.  Oprofile themselves removed support for Xen in 2014
      prior to the version 1.0 release, and there has been no development since
      before then in Xen.
+   - Domains can no longer run on a CPU vendor if they were initially launched
+     on a different CPU vendor. This affects live migrations and save/restore
+     workflows accross mixed-vendor hosts. Cross-vendor emulation has always
+     been unreliable, but since 2017 with the advent of speculation security it
+     became unsustainably so.
 
  - Removed xenpm tool on non-x86 platforms as it doesn't actually provide
    anything useful outside of x86.
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 301df2c002..88a9a26e8f 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -586,6 +586,19 @@ static void test_is_compatible_success(void)
                 .platform_info.cpuid_faulting = true,
             },
         },
+        {
+            .name = "Host CPU vendor == Guest CPU vendor (both unknown)",
+            .host = {
+                .basic.vendor_ebx = X86_VENDOR_AMD_EBX + 1,
+                .basic.vendor_ecx = X86_VENDOR_AMD_ECX,
+                .basic.vendor_edx = X86_VENDOR_AMD_EDX,
+            },
+            .guest = {
+                .basic.vendor_ebx = X86_VENDOR_AMD_EBX + 1,
+                .basic.vendor_ecx = X86_VENDOR_AMD_ECX,
+                .basic.vendor_edx = X86_VENDOR_AMD_EDX,
+            },
+        },
     };
     struct cpu_policy_errors no_errors = INIT_CPU_POLICY_ERRORS;
 
@@ -629,6 +642,20 @@ static void test_is_compatible_failure(void)
             },
             .e = { -1, -1, 0xce },
         },
+        {
+            .name = "Host CPU vendor != Guest CPU vendor (both unknown)",
+            .host = {
+                .basic.vendor_ebx = X86_VENDOR_AMD_EBX + 1,
+                .basic.vendor_ecx = X86_VENDOR_AMD_ECX,
+                .basic.vendor_edx = X86_VENDOR_AMD_EDX,
+            },
+            .guest = {
+                .basic.vendor_ebx = X86_VENDOR_AMD_EBX + 2,
+                .basic.vendor_ecx = X86_VENDOR_AMD_ECX,
+                .basic.vendor_edx = X86_VENDOR_AMD_EDX,
+            },
+            .e = { 0, -1, -1 },
+        },
     };
 
     printf("Testing policy compatibility failure:\n");
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index f033d22785..f991b1f3a9 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -15,7 +15,10 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
 #define FAIL_MSR(m) \
     do { e.msr = (m); goto out; } while ( 0 )
 
-    if ( guest->basic.max_leaf > host->basic.max_leaf )
+    if ( (guest->basic.vendor_ebx != host->basic.vendor_ebx) ||
+         (guest->basic.vendor_ecx != host->basic.vendor_ecx) ||
+         (guest->basic.vendor_edx != host->basic.vendor_edx) ||
+         (guest->basic.max_leaf   >  host->basic.max_leaf) )
         FAIL_CPUID(0, NA);
 
     if ( guest->feat.max_subleaf > host->feat.max_subleaf )
-- 
2.43.0


