Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFADAAEECB
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 00:47:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978860.1365697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCnXo-0002P9-94; Wed, 07 May 2025 22:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978860.1365697; Wed, 07 May 2025 22:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCnXo-0002Lz-61; Wed, 07 May 2025 22:47:16 +0000
Received: by outflank-mailman (input) for mailman id 978860;
 Wed, 07 May 2025 22:47:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sPgg=XX=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1uCnXm-00027q-JU
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 22:47:14 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2416::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 369ed8ad-2b95-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 00:47:12 +0200 (CEST)
Received: from MW4PR04CA0281.namprd04.prod.outlook.com (2603:10b6:303:89::16)
 by MW6PR12MB9018.namprd12.prod.outlook.com (2603:10b6:303:241::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 22:47:00 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:303:89:cafe::79) by MW4PR04CA0281.outlook.office365.com
 (2603:10b6:303:89::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Wed,
 7 May 2025 22:47:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 22:46:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 17:46:58 -0500
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Wed, 7 May 2025 17:46:58 -0500
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
X-Inumbo-ID: 369ed8ad-2b95-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+lxbHcTN0tQnvxPin5mebs7QJV73W7GqjyqL28/QZfoQHXbT/xaSIw8MHs9cVV1KuYEi+X1PvYHOtO4BS0bNBnHDw5LCegXNhg4iUoH0DQalbhU3K7mPwQNvx1bBrZWp252lF08EbkW9/eLVibcWTnhgWxQLs2Rcn+huUafcrIr4z7f1JLX1DiBa5og5e2MtNzwlCPUf/tXjvwDnXAlfEaV7/xs0lfJ5O06tA4NwjwT8j7nc+kqmbXnjxXsSF8E/3Xko5RuYlCpwA6yC1LKjSLY9Ppc8fCMnp0XqWZk5yplO4UZqoswg4k8U2lbTyDoQ2c8UssnIlEp8AqGG5Q1MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mFAi4zYRUkBuhbz9pnZdU9K7CsFcZrta7WY6BXIQCE=;
 b=H3cZ8XRucGENSuyxpXXPUuD0Ghk8SJP72ocvOLcf/IGvGpmPExjEmNLOqnG31p9iw0fkTmnWcHf2r5wtWkhSnWiJsE3e+Mzo+Rv6TPSvat2AW1DapnF89ysgcptiIeHRd3Oz/ygbFSO3AFrA8Ug/dXDBlMv6yvofzqVmjHsQQWsIoqhuLAU9t5bk51ROTI5Rh4qdoTPlzC3caggmeMJWPTLILKx1qWjjMx9G5T7Y54uRqQ+MYkvAvYzLE+F7D/k1NCSrp0d09pVVUmEPkpgCmoytM4ZPNjnsDNkDZ4SXIVYGNMf8/m9caHJM/5sD7xVhCf+tHuTW5dhOzx+JC92gxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mFAi4zYRUkBuhbz9pnZdU9K7CsFcZrta7WY6BXIQCE=;
 b=Ep0PGq2zTclxeRcF41CsCGmjgeqkccPQNVh/GZBd8zqdjtY3HwoZC0AsH60pgGPvx4ZPWu34cmUlkOov5CeV4VL6KRp4m0mDP20Gc2FwR6Ss24e/p1Y5Ot0FEYtPVnT5Tx3NnwzTIV8HopycU/LDUmaRosl+jVG9q9TMQwaHEjU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Victor Lira
	<victorm.lira@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Federico Serafini
	<federico.serafini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v1 1/2] x86: x86_emulate: address violation of MISRA C Rule 13.2
Date: Wed, 7 May 2025 15:46:39 -0700
Message-ID: <77f9c4cabe607ce4024013c604bc790fb629d322.1746657135.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|MW6PR12MB9018:EE_
X-MS-Office365-Filtering-Correlation-Id: 75777940-4063-49b3-cf23-08dd8db913df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elozb1hJYkY1Z1Y3Nm5RMWJiZk4wNHIyR1dzak9PZlA0V3FJa3ZkQitRT2p3?=
 =?utf-8?B?bzd0VzdPOE1yRVRoeEo4Vm1TNE9aYUs1NWhTSUVSV01JQ2lDR2xHSDJabTg1?=
 =?utf-8?B?SlFOcjZSRDVsVkJxdFhXNHJlZjRSczk0WU1lekhVaVBsNFpOY2wzZjBVNHJy?=
 =?utf-8?B?MG5DN0wxQWJRQXMwaEszc3EwZDdKK3RUSFZqZHBrak9jcHgzaTNwcWN2d3Nj?=
 =?utf-8?B?L3lvUHBPSGw4NXVtMXhxTDk2L1A5S2psYXNjajRVc3R5YVNYOVdzckxzN0JX?=
 =?utf-8?B?TnBmT3dSZ3loeUEvS3Mya3B6MCsyUG8vZ2cveU9jRlRoU3VJcmtFc1hvL1hi?=
 =?utf-8?B?Q1JpbzBpZnhncGpvbWt0Vk1xaFVEMmlZTk45ZjJsMXBlZ0N2Z0d1RXhrZVBP?=
 =?utf-8?B?K3J6VmhVU1h1dzFJVWVUcXRPRi9ObkM1eWhLUXdSZXV5RmNkMDcrYUxmVjBI?=
 =?utf-8?B?dUlhcFkyUjQxQjVUT3RaQmFUOTJQOG13ekhRM3V5TFFlRXRjenY5dCtoQ2Vs?=
 =?utf-8?B?L3YxVUJFQ3BiSnZvRTlaUFh2dmo4alJyMXlGQUszVzF4b3dDQTl2VjFpcktW?=
 =?utf-8?B?MXFCSmx6aytCT241dk5nRVBPZytCaUoxRFVRLzNhMmdLTjVHRFNwdFJPUm41?=
 =?utf-8?B?bVJnczlXV1kzeTZsNVdsSkkxN0o1bjFEdldXSUlmTnQ5TjJpbUlxbkVTTVRz?=
 =?utf-8?B?SkpLYlZnU1JaMnFXTVZCSWFKQ2F6OGRiQ2t1T29mK3ZWM0pzTXVoTzhNZTI1?=
 =?utf-8?B?S1M5WG9ZdjU1RW16RmJ3QkFES08vSG1OL1ZTcldRWUlURlZFOGNveXMrdDZP?=
 =?utf-8?B?QXJtek4vTE1KWXk1Z3VsUlI0T3dDR2VMU25HeW1WeXJMMXJuT2dPRTFFTDVE?=
 =?utf-8?B?eFV0YWhjRlpFR3Y4Zlkxa1RMdlplakxqaFRzZHBya1VNWG1mSlAyUDlIV1F2?=
 =?utf-8?B?QVpJYTJjN2ZhTjlhM2lPcy9Md3ZPRGd2SzJBYlVHVmR4d21FRDdGb1JiaEJy?=
 =?utf-8?B?TXJyZDdpZk1xQzBpNVhmRVhNTTFrZDg0Y0NVMzhsR2ZmTlhFVjI1UkNzME56?=
 =?utf-8?B?R1ZkREtZOTZJMVFMSXhGbjRxODZSTDc0OUcwbG4yaXZDY3hYbmRpOEdnbE5y?=
 =?utf-8?B?cEQyWnE5QjFMMWhqeFk1czBNdWYxZFlKRFRTZU1ORW9CY1N1MU4rK0U0L0lF?=
 =?utf-8?B?RXN0WnJLb3hZZ2Y4b1ZUbnN3a2l6R2ZDeFh4RDZXaFlNWnZmWW9IamJlL3J6?=
 =?utf-8?B?OUZHZjRWamFtMVRvZnZhSkdQTnB0anROUkREYjI5NkZ0aUlxaVl4UWZ3SUxa?=
 =?utf-8?B?V2pmbHhZUzdqa2Y2d3FFa1NXYnhyQ2VVS0lqUWlyamVJbWNocTZZd1Zvb042?=
 =?utf-8?B?MTZtT3o1eDdEY2h2UVNkOE5ObkI1ZitPOEJwQTVzTTU2SU1yM0RLUDgvS255?=
 =?utf-8?B?OTc3VXF4b2F5ZmxlOU9YUmtpV3RENUF1ZFZtdDNiYW5jd2QwZWtSVUVBNGw5?=
 =?utf-8?B?b3AxNXZzeW5pMk04VmNKcHRJa2JmU2JTaDJlbU9VSXZDNlk2Y3ZaaGFJZXVV?=
 =?utf-8?B?cTZwKzN2eFNTKzJGTEt2Mkljb2xvekJ4bXc4UkRiUjYvL0s0ZG5Qc3NaQkV3?=
 =?utf-8?B?NVMvSzA4V3hrdncwUDBMZk4zSlRMc0NrTWtVaGdsYk9udXFxM2IvVG1vQnZH?=
 =?utf-8?B?SkEwYXpvbVg4cnc3RisyNDhCUXFNOVJjYkxXeUgxcHpzUzZ5K2phYlBhVE9X?=
 =?utf-8?B?RFRpK252T2pFd3drM3cvMmV3ak5nb2hrWWdoWkM4Y3lOVC93UmR2QTRTYm1i?=
 =?utf-8?B?b01lR0k0U01pL2JmbzBRZVFnM1F3a0JBOXl1V1UrOXpEb3BDNnlhZGx1ZUxS?=
 =?utf-8?B?QU1KSDZPb2pvQlNXblZsWnl5b2pjSUc4M2JTRkg5V3BZNTIrZEJvRzI1RElO?=
 =?utf-8?B?Z1JqQnBNY3BtQ0Z6QXozTWZmSG82SnBFSnVldG0zRVhCcERPWXdoZHNmUnRn?=
 =?utf-8?B?L0M0WnlNa0RTUGw4Ty9LS3FMUmRpSXZ6Vy93bzgrUFhDdC8xTGdLNjZKRUND?=
 =?utf-8?Q?jZEuZI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 22:46:59.6926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75777940-4063-49b3-cf23-08dd8db913df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9018

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

Rule 13.2 states: "The value of an expression and its persistent
side effects shall be the same under all permitted evaluation orders".

The full expansion of macro "commit_far_branch" contains an assignment to
variable "rc", which is also assigned to the result of the GNU statement
expression which "commit_far_branch" expands to.

To avoid any dependence on the order of evaluation, the latter assignment
is moved inside the macro.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 8e14ebb35b..7108fe7b30 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -337,7 +337,7 @@ do {                                                                    \
     validate_far_branch(cs, newip);                                     \
     _regs.r(ip) = (newip);                                              \
     singlestep = _regs.eflags & X86_EFLAGS_TF;                          \
-    ops->write_segment(x86_seg_cs, cs, ctxt);                           \
+    rc = ops->write_segment(x86_seg_cs, cs, ctxt);                      \
 })

 int x86emul_get_fpu(
@@ -2382,7 +2382,7 @@ x86_emulate(
              (rc = read_ulong(x86_seg_ss, sp_post_inc(op_bytes + src.val),
                               &src.val, op_bytes, ctxt, ops)) ||
              (rc = load_seg(x86_seg_cs, src.val, 1, &cs, ctxt, ops)) ||
-             (rc = commit_far_branch(&cs, dst.val)) )
+             commit_far_branch(&cs, dst.val) )
             goto done;
         break;

@@ -2438,7 +2438,7 @@ x86_emulate(
         _regs.eflags &= mask;
         _regs.eflags |= (eflags & ~mask) | X86_EFLAGS_MBS;
         if ( (rc = load_seg(x86_seg_cs, sel, 1, &cs, ctxt, ops)) ||
-             (rc = commit_far_branch(&cs, (uint32_t)eip)) )
+             commit_far_branch(&cs, (uint32_t)eip) )
             goto done;
         break;
     }
@@ -2557,7 +2557,7 @@ x86_emulate(
         ASSERT(!mode_64bit());
     far_jmp:
         if ( (rc = load_seg(x86_seg_cs, imm2, 0, &cs, ctxt, ops)) ||
-             (rc = commit_far_branch(&cs, imm1)) )
+             commit_far_branch(&cs, imm1) )
             goto done;
         break;

--
2.47.0

