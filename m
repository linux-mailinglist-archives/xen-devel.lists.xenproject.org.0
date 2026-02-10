Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFAEHXFKi2mWTwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:10:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD5811C4DF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 16:10:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226479.1532992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vppNk-0004YO-1s; Tue, 10 Feb 2026 15:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226479.1532992; Tue, 10 Feb 2026 15:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vppNj-0004W6-Ux; Tue, 10 Feb 2026 15:10:27 +0000
Received: by outflank-mailman (input) for mailman id 1226479;
 Tue, 10 Feb 2026 15:10:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBUt=AO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vppNi-0004Vw-Vp
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 15:10:27 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f6e0ca1-0692-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 16:10:24 +0100 (CET)
Received: from BL1PR13CA0292.namprd13.prod.outlook.com (2603:10b6:208:2bc::27)
 by LV2PR12MB999095.namprd12.prod.outlook.com (2603:10b6:408:353::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 15:10:20 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2bc:cafe::2d) by BL1PR13CA0292.outlook.office365.com
 (2603:10b6:208:2bc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.6 via Frontend Transport; Tue,
 10 Feb 2026 15:10:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 15:10:19 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 09:10:18 -0600
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
X-Inumbo-ID: 9f6e0ca1-0692-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgOgGCHjAjL/ADprDYcQ+DgDWKYMjJ1j6VkuWUE/IvP9F13vlarRs3RuSWp7E1Zhs0kDa4RhAABI6j0Adn7JaqEmRUElfGNH92ecUre0qMz9LQxgGIOZ2EsJin5VF7GTScxYN6ow2/fhkDqZNWEgrXuwzyHWvj+u8KWKmH1UfUVHBMNru0CrZwCczf8paX8yxFIkGdn3umbD9wTSXCsjtPupL7Quc0vTO4skPaouHJ3evJ5TWpx4ZSMezSPUEExKVnk7E7erxZ13ydhoef6Eke0A1pQhD7htTmhzkgJwuIOoJhdEIHidG15d+UV/rJV4NVLFtOr5WoKyLfxriHV/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIngIZTcnXGIxQjeT4SDwU/7/bqa+59yxS7k6+duN9A=;
 b=uXBWNk1wVTqKbwwzV/nXkQwDx+aa8af0SMY6X+sj5i8dXRwWSP+m1vqqQDR8IKwoFbpOS5HMxtm3HYBId7iPpKIEdppzB7BsVImcPFGcwS+H1nJmgoXZ8YHArWUrkXlVaqUPbw84TbREzdxerMGzd+rpBWrGLHCd0OTEm82JWK1DSD0uTPPW7jR/u8z/dR4iz0RPod4VbXaDE8RUk3+BZs7hCKPo831gROe7YeSb7PKU95raW3QU4Mqt/W6sOUeRYPaB/tzgRyiuhetaLiyHxJV7FItz+ni6GT+2Bty5IQVi1y4b67f35IZqLTX5MbKxBZ9gOui9oSvBKXlcYi7yXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIngIZTcnXGIxQjeT4SDwU/7/bqa+59yxS7k6+duN9A=;
 b=jMO0SupZvuyEPxEl2w/y5bG8D3lcz/HqmYBBpgoNvzWO32mj51feSbftOyWvSyzUivq5Rf+e7fDQYEl+cwysPoEeD20/P7k0vx4iCoLumj2v6G8YGXdMOM5OvkMnshQcY+Mr3994OV0FEnE/qOtRIE/yX0lOavRJ4iIPxH8v3S4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/domctl: Conditionalise x86 domctl using DCE rather than ifdef
Date: Tue, 10 Feb 2026 16:10:06 +0100
Message-ID: <20260210151008.217830-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|LV2PR12MB999095:EE_
X-MS-Office365-Filtering-Correlation-Id: 2844fdea-5524-4c44-112d-08de68b68169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XGrnzxTa70FYbzyn7a1Fn4THfam5403BPsWvYJ7DM4SByzGDhaCMpHHWeyw0?=
 =?us-ascii?Q?2G4OGsf7JiFaqKmRTELZEZp4Rpodm1bBY7a34OyqwGazf3a8VrIRSZiCmrnb?=
 =?us-ascii?Q?riBSbQOrz8kTUdo/NUg444X9xefBZa3xRh/wBhGSLGq+44PP9FFBufgRJxuJ?=
 =?us-ascii?Q?0HYcFEGpSEityOckgsBWomRlBoYfVyef7/UJhOkBqUgh7qLcm9lloYJKPRC6?=
 =?us-ascii?Q?gC4JRAMAIrgFJGPoW30+H0lC82S5K4VlamjhnWe39UUAZ9X/w69olTsalG9I?=
 =?us-ascii?Q?UYFBHqcep+KNAL5QdupCovmCj8r+gRs8hobPhSTiTFX5ds7FbUCg+x0XzjqH?=
 =?us-ascii?Q?VGMnNYaGBBHCZIQJ17rqqfSVmCWBh1bTvtxSZ6yHSTG2zgVejfNUteHmqLg4?=
 =?us-ascii?Q?IPonWS2Lla5tY91I1y400EkTAMbPjvxCvN6UAB/EE/o+aDRid1mwH3/Tl3MM?=
 =?us-ascii?Q?FRwcDf7MT72mMwniKm17mxbRvIlosqV8LraZzdhYikJw+aDK5dgv/Rkk2CtX?=
 =?us-ascii?Q?Qs0GYT1BV4IftETJa8BxyastiYseTDzsJLMslzhgEEtV7FXRJYVUcZxv27Xg?=
 =?us-ascii?Q?/BZvGMtguNjRBRwZkk/ny58v3dFsPSvm0GIwXZwQhhLf6JHeaqV06YhYzB65?=
 =?us-ascii?Q?phBL8nS1xMcptXo2f18q9wVWsU92YzLJ2itXYa2mB4HdXC88JRsG2809ILJw?=
 =?us-ascii?Q?H2nxVhIZQiGnZMr4LPiFfw1OarOdjMwaFXFvha8yXtZySQhOV4FkXhNkAvKl?=
 =?us-ascii?Q?2xVowElSAs3GlThEPUhd7CCucopNPm3a+rHg77YT8DS/3/5f7LtZVweeecu/?=
 =?us-ascii?Q?ed54lWmfwJuzSj/Ntuo2wHbTg5To8kBGyRCaHan9Zt7TQ4r5OxODfj5Qbu6c?=
 =?us-ascii?Q?lydTQVkR5p2XtvbZnKaH2KmjNGo0Gwo+mY6cCcsaDdxHq0ioZLjMB0FEcsNM?=
 =?us-ascii?Q?DalRbQfeLccdzmT9BhSVwuxFFvtVw6QuVadeJjhbGZ7gXW4wVwwr9Rsilj2A?=
 =?us-ascii?Q?Ze2Vbezb/J+FJX6X2SttCs8K0iIkUIIwnlLBk4WG1bcOzsHNLErd1b9RBC1d?=
 =?us-ascii?Q?/pt3YBQnKjmijGUKZnXz74x2QLAlPpKoJCnU23P/TzoLl2qqZCj40diHsoYa?=
 =?us-ascii?Q?m6CS34+eHS63bajFFTM42MnvYi5hIqO/8mA4A536zb1RJjzW3Ff7SoWr360N?=
 =?us-ascii?Q?GC997YKf930O2yzV+/FGGHvjINaN+KHWya03rKmN7OTYaq0x7Oz20U+b6bA0?=
 =?us-ascii?Q?JbacxTUOr0YvlYkfq6o6YAj5z04YCNzySmMMXO36ZmloM91C7aTGjnhoxSS8?=
 =?us-ascii?Q?eSkCneJe9ngJTO42tiYAqIhhChHnQclYyvdjQVw+2sFTg47497IsUvln+nNf?=
 =?us-ascii?Q?O7fV78SBxvuFtgAzncU+IAASiAiwvmKF8WwL1GBZ6TUlI/hM2/laf5J/bcn5?=
 =?us-ascii?Q?INDRem3CJIKl0YoSGBYluXBxTZqYjbSBaLmassVbFPt3F9RMTaox5Sg+myah?=
 =?us-ascii?Q?1NWVnpdFbqVj/rsfIUOiLdh7CgHyPsT6feivVH3Job9jdwIwtYX20Tr18m76?=
 =?us-ascii?Q?pWxSJvWHzVfAo/4g6scIQu9EGMb0xkfczINZojNr5B3SYLx08jNAKsIRdga1?=
 =?us-ascii?Q?090f+yBJFfctFLzz/IHeI7NXEO6plkNyapwH2EHrBeJXhOVQAeuYxU9W8c8b?=
 =?us-ascii?Q?RegSkQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/nw2Jtud92ktsubnm4Au+o1Ffb7L6G+JWn2DBqDskVeohglOCjtEywjHFKq13ZoOEwv5h+ja0kU43uMd27uD6a71j13Z/tX/DMDmRN+2e9fr8nFzJzIJL+wfYiS79nXpcPL0CGDNWiMX0wLoavxCGGdGXhdAXgcznbPhxfnn2tvLkF5PxyCHZeQbqUTPdQs+wc2ILZ4wYgjX+XGzZIzOQDUQcNlu3SKW35K6fDbn/4gTNADq9Ku/OLa8avez8YR63BxENvWMI5okaPtA9qHrSMQXW+ABOt8gBFxBDm1RrUK6yPB3gEzYl/sdA/oWT43WklZX0XWKakHetn+/D3jjHRMTLq064JjvR1DAaLOsonRfRuyhzXuPAcAuTJXikzCTJ9p+yygDYE3YqJaMBVCWDAcVTuHRHps92Lhxt7C0MnWLAqZJT/T5NwbDFefLWnoW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:10:19.7194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2844fdea-5524-4c44-112d-08de68b68169
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DAD5811C4DF
X-Rspamd-Action: no action

Make them uniformly return EOPNOTSUPP when their dependent features
are absent. Otherwise the compiler loses context and they might return
ENOSYS instead.

debug_op, mem_sharing_op and psr_alloc change behaviour and return
EOPNOTSUPP when compiled out, rather than ENOSYS.

While at it, remove the public headers from mem_sharing.h (forward
declarations are fine) and add a missing xen/sched.h include (for
complete struct domain definition).

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/domctl.c                  | 27 +++++++++++++++-----------
 xen/arch/x86/include/asm/mem_sharing.h | 11 +++++++----
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index d9521808dc..7066a18735 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -220,15 +220,15 @@ long arch_do_domctl(
     {
 
     case XEN_DOMCTL_shadow_op:
-#ifdef CONFIG_PAGING
+        ret = -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_PAGING) )
+            break;
+
         ret = paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
         if ( ret == -ERESTART )
             return hypercall_create_continuation(
                        __HYPERVISOR_paging_domctl_cont, "h", u_domctl);
         copyback = true;
-#else
-        ret = -EOPNOTSUPP;
-#endif
         break;
 
     case XEN_DOMCTL_ioport_permission:
@@ -842,11 +842,14 @@ long arch_do_domctl(
         }
         break;
 
-#ifdef CONFIG_HVM
     case XEN_DOMCTL_debug_op:
     {
         struct vcpu *v;
 
+        ret = -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_HVM) )
+            break;
+
         ret = -EINVAL;
         if ( (domctl->u.debug_op.vcpu >= d->max_vcpus) ||
              ((v = d->vcpu[domctl->u.debug_op.vcpu]) == NULL) )
@@ -860,7 +863,6 @@ long arch_do_domctl(
         ret = hvm_debug_op(v, domctl->u.debug_op.op);
         break;
     }
-#endif
 
     case XEN_DOMCTL_gdbsx_guestmemio:
     case XEN_DOMCTL_gdbsx_pausevcpu:
@@ -1033,11 +1035,13 @@ long arch_do_domctl(
         break;
     }
 
-#ifdef CONFIG_MEM_SHARING
     case XEN_DOMCTL_mem_sharing_op:
+        ret = -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_MEM_SHARING) )
+            break;
+
         ret = mem_sharing_domctl(d, &domctl->u.mem_sharing_op);
         break;
-#endif
 
 #if P2M_AUDIT
     case XEN_DOMCTL_audit_p2m:
@@ -1240,9 +1244,12 @@ long arch_do_domctl(
         break;
 
     case XEN_DOMCTL_psr_alloc:
+        ret = -EOPNOTSUPP;
+        if ( IS_ENABLED(CONFIG_X86_PSR) )
+            break;
+
         switch ( domctl->u.psr_alloc.cmd )
         {
-#ifdef CONFIG_X86_PSR
         case XEN_DOMCTL_PSR_SET_L3_CBM:
             ret = psr_set_val(d, domctl->u.psr_alloc.target,
                               domctl->u.psr_alloc.data,
@@ -1305,8 +1312,6 @@ long arch_do_domctl(
 
 #undef domctl_psr_get_val
 
-#endif /* CONFIG_X86_PSR */
-
         default:
             ret = -EOPNOTSUPP;
             break;
diff --git a/xen/arch/x86/include/asm/mem_sharing.h b/xen/arch/x86/include/asm/mem_sharing.h
index 040962f690..7ee783fde8 100644
--- a/xen/arch/x86/include/asm/mem_sharing.h
+++ b/xen/arch/x86/include/asm/mem_sharing.h
@@ -9,8 +9,13 @@
 #ifndef __MEM_SHARING_H__
 #define __MEM_SHARING_H__
 
-#include <public/domctl.h>
-#include <public/memory.h>
+#include <xen/sched.h>
+
+struct xen_domctl_mem_sharing_op;
+struct xen_mem_sharing_op;
+
+int mem_sharing_domctl(struct domain *d,
+                       struct xen_domctl_mem_sharing_op *mec);
 
 #ifdef CONFIG_MEM_SHARING
 
@@ -92,8 +97,6 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
 int mem_sharing_notify_enomem(struct domain *d, unsigned long gfn,
                               bool allow_sleep);
 int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg);
-int mem_sharing_domctl(struct domain *d,
-                       struct xen_domctl_mem_sharing_op *mec);
 
 /*
  * Scans the p2m and relinquishes any shared pages, destroying

base-commit: 2fa468919c39aac189623b6c580ce4ff8592d799
-- 
2.43.0


