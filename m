Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMjnCVH6u2mzqwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:29:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B58372CBFFA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:29:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257119.1551577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRX-0005Qz-0e; Thu, 19 Mar 2026 13:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257119.1551577; Thu, 19 Mar 2026 13:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRW-0005NB-S5; Thu, 19 Mar 2026 13:29:42 +0000
Received: by outflank-mailman (input) for mailman id 1257119;
 Thu, 19 Mar 2026 13:29:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wl8P=BT=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1w3DRV-0004oN-Tb
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:29:42 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af03a94b-2397-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 14:29:41 +0100 (CET)
Received: from DS0PR03MB8272.namprd03.prod.outlook.com (2603:10b6:8:28f::23)
 by SA5PR03MB989126.namprd03.prod.outlook.com (2603:10b6:806:4d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 13:29:38 +0000
Received: from DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654]) by DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654%5]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 13:29:39 +0000
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
X-Inumbo-ID: af03a94b-2397-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kq71nsJ3bJ8FdPAKjTH28AE4JyMDBsVrDJzA6LpI7JSbigC4ODil93SyZrGuNZArr80I3pcPI5HVnJ/yW5fQxcPYLyjWNRuFBxQyhrM2C/cNJCraFuqNYo5+C1dDXAaHUlTiIvqRt6fsEDzVrbPNME74dUoKQ+VepsxKRnSX6B0h8X6KHoojH5CsJISm5JTIKgWwfYnMS1pga5rEjHtWh572aQSLX/nIBaa6m2ytGV07DzLb7pp/5wJDqoc2UGbpudgNqVmq++L5/+WnyuHi8CRxUviU5rG3U0/dw8TSwzvehhcNLgvJDYU41IctMFEshtsqP92f4lSW8G4wc9lIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0h8Bzldeo2g56z78hFQUL+I8w6zT3orimQtvdwdMlEU=;
 b=DCmNK51ykbfuvEMbsv+fCxxs2LYJn/eG5qahz2hqW+dDeVSjYOvZ9aMik1KThcYc1ZI69Bt++qhRG9VE2ctrHb9iC4W0B5/LaYQL9Ct7IWtXSDYCs9s94qs5S+YOhGJEaVKHeUE721B65iFoSRH6ITz6bh9BocdwlzF/r2UGgK6IUgLh4Hi98W4h/KGlwGWXP1scUOD7vE5SvYt6VvMJ/jxG3WSn6lQiDvRhakfDtcdyuBSImTNKSrGuzzGm1qHSeLnGbCnwjvgKGap+ozh4h+cfOMi2LRh6r9t1KQ2rLn+l7YHgEEu+pXODXxTKN36JzH6oSCfmZJKu4V/esf8Yhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0h8Bzldeo2g56z78hFQUL+I8w6zT3orimQtvdwdMlEU=;
 b=gctke2jlafU3xjKUnxFiCkMoOi7Nv9stSKcUFe6gXkqn7EkPvmQttM/8+pglwoiOwoDMshH4I7N2bp9T14hWS7cK33eaEfEOX6/ZF2v2ycEpgSeUYSUC8fjn66mhyoQ/c2+oLeQYntx2MC96pBkXXV2wAycGXP6Qi8+8Rf46Uh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v1 3/8] x86/svm: Remove lazy FPU support
Date: Thu, 19 Mar 2026 13:29:19 +0000
Message-ID: <20260319132924.1469809-4-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0494.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::13) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR03MB8272:EE_|SA5PR03MB989126:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b67ad83-e9a5-42d9-fafb-08de85bb923c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rU6h+pELixuJxembCegilYDP86FaSdKqkKnEMj0tuIW9WeNT37qoDKxyb9aftDLGxotxrDg60DyTrB7u01abBJ/8AV/dntpRyaUtYpaB5//yx//1j4R5WyPTw7vcixfyzajD84LhlOrhZ/IESXme5DrjgLlDTiDlhC/VHlV4ZMsVSJUpsXVJtkfQkRJBnoMvJV7pmfimW8+WzmvjReeNp+sQ8V6DQOxgQ5rOSQwqZ0z3j5BL6K4phbrR1qIKS5bPULrrDN7l0r3TsvCGAQvXvXhoS+xe2Yq7mgGIgc5tdwkGsHVawu3763Xb8/XUmk6JDuKLVmlt8brVVTAoDwR3zjVLlAga4aDYFZAglCLk7Rwl1ixlsHqFQfrl/k+6KAngcTn74Y0S0jWBi5eGRvb0dq94jBxYN3W3GoiDH96C2KyLpZWUElwD90CPPBK5yK8/cTeFUK1AyHOJ8Aqnea2DWmbi6lqvkib7FMLHHoZxpCnNFjBpv2jcNo0yyLJQcq5/ghobsiSXPMili7ViHKvtWN4jhOg01sjNeQ6iCRsWpZtL9p9attFDXpeEH5iDBM5O2RKRagTYupj1bwQt4v3l+jI39en84GdVYjqGMfFzkp9VWJrXJEhy2uVHHsYXl4s5M04AJ1M9m7WyZr/O6YFFFTHj51lh0fFw3pwnPVbea0SabJvEQrJRu151lTIB5e/kzoCOJDIjDNaJi6RLkCu2SrHEyMJ/UvbwxDU8NVGBbZs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB8272.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vcn+o99w+OR79yBuQ3LlTHAfbQ4EMXoPz4Dw6dROMtk6Wl9ad+5nOndqSIUM?=
 =?us-ascii?Q?nM6Sx3yHtsdLpR8RJozERDyZPhgRLf7SEam1ILRwG9jjJrJW20LQOxDy/tV9?=
 =?us-ascii?Q?7bdOZTujXBiCA/Su1tZut1IyEGiBL39FAQYiwZRCdigRa5gk1+Oq32QBNgoR?=
 =?us-ascii?Q?NDWAFt89481JRoBxkafuPMcapr9HLspmClHQBq4+QK8JxOdF1cKA6t02eD1A?=
 =?us-ascii?Q?AS6pkorLFYyXNr0AJXiwx3VcGDjCVZU1OkSFsmlr3D5QNIbU6leEMqeKtk6Y?=
 =?us-ascii?Q?PkIAMiNx/iEMoAdhLBpzQvj9MYa/zWFsRMLxNNjhEBVd+GRzeWzHoDGebIuI?=
 =?us-ascii?Q?mH7j/K7Pq4WLsA9JooQqZHPiKcc6kBHjO8S2izQfGd0khqBHYVOlmmtfMCQ6?=
 =?us-ascii?Q?pW0Aserv/3Eaj1X0XwBCZS6U/Lx9Omb81BvBzgwvQCDcikvWgrZrNm0qqmDl?=
 =?us-ascii?Q?1bqcHIX/BtoLctY3yFu8m+SZ7yqWS8CrDUdRL1hqZIAFlFzAlp3PhL44FUGv?=
 =?us-ascii?Q?X/k7LBAfW+Vy+0oLV16WHi7BPP7d1NPzlJ+B4fWuqIB0zJqQHiblfCJ1lpnv?=
 =?us-ascii?Q?Ox0qnZiwO1ai6i+Jt2xmxcBWuq02CrnyXs9ijBqIUj82BJE9FqCKFb7p0aSO?=
 =?us-ascii?Q?54Ajp9ZbCleDg4qPHbVZSty7nUCsN9jscBVoAXWeINmeoeldKEi5tXCNcKXc?=
 =?us-ascii?Q?6y6CjJQiBkABn6aokI1hfq1agGAJWe2XDDidzCmb95J6uYjs3ik0cXkSD2YO?=
 =?us-ascii?Q?snF7CUgcLMOHBPddzAJL8dg0h8/fyspOVbEYOI4CW0EgE7VuWHsFCAGJL1XI?=
 =?us-ascii?Q?VBBjI3AXJFE5nbbQgZcHM570qfK9TbzMrLkHuMZhJiweO7PwGNMx736P8++g?=
 =?us-ascii?Q?7QfNzDUUEHiFehbDNdTMq69+B9rcDO19RCSkrsBTqgaLHxCoBR4xF6e7gom6?=
 =?us-ascii?Q?D4OA5+4rjcTfyx4eFG3UP35I97CRV7K2u2be9ELR8n1YFoWi6MEiYcCv0ZJp?=
 =?us-ascii?Q?mTH1QorW1BVrdRVSaXil0aNB34cxVndbqGDgwalebebjTIrOjkoXexGd73qz?=
 =?us-ascii?Q?VBJ9Z8nWJmQjda94kMhftcSTD0/CCB5tLxPWGXRZ/UGLwvEk/autebxO9o0r?=
 =?us-ascii?Q?e7I4ULNhK0PQC8FxTJqx1mgXPa3lw8BF/in3vqENHTXpxbQmfLqtxCro1Uo0?=
 =?us-ascii?Q?SH8fOE26PfV/zuplo+Mpk97rNnmN2ErbeZHn3kIk9+5UobtYkM+ViOEeGLtY?=
 =?us-ascii?Q?juv5Tb9PHI2H13lp2b/PlTbTU6OunpOvJ8yAeutDF4DWSxG2wLL5Cj5ZlXO8?=
 =?us-ascii?Q?qN3tsFirfiQrwAoVdeOmLqcWEjv8Tf3ADp5hYRLb4rYWWCmJ4cQoIYXPEEOV?=
 =?us-ascii?Q?MrKm9Q+j7GLVpheVOj1zAHr23Qy9W91cSrurzJEyJs+dwv4UmOHRgiXnfH6y?=
 =?us-ascii?Q?HT3eU8vaddGxCQA9EPeEsCux+NUVW86D0bQjNkU+4mVgLTkW2lBX6D09SIsC?=
 =?us-ascii?Q?Si0MZdEViX5KHzoIGsKZ5kqegScH+jH2Xqd1GbdDrWmRuObKPwhdaL/6PrS+?=
 =?us-ascii?Q?srIpilKT+H13nkoRxABZWMjgTnpenq8GKfcp+iqkxvwTT6NmWMnL8AYP7K3K?=
 =?us-ascii?Q?B6Vz9l8srp8QcIP+0+lGz9pNLXteyXkdcX1dmLTUm/MjtsSP4ohunoLShrOv?=
 =?us-ascii?Q?fxdSacLadiy2CGtAKXHXyjGoM7R9TDJR5Y6Fk2wa8onjSCN8ebY29duz8jVD?=
 =?us-ascii?Q?29kRoi7oB52q1VSMLCJkEKWxcwV/TeQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b67ad83-e9a5-42d9-fafb-08de85bb923c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 13:29:39.3796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8y5GhCirtcctAS3mqdBB6P8JMeT8PQ1MdXyup/PQFItcxeTCAieHqE+yNxn6i//1oELeqxYGHeR+GhNLMToAKF+WS+GaGr6aCEOejAZi/XU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB989126
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B58372CBFFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove lazy FPU support from the SVM code since fully_eager_fpu is now
always true.

No functional change intended.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c         | 67 +-------------------
 xen/arch/x86/hvm/svm/svm.c               | 81 +-----------------------
 xen/arch/x86/hvm/svm/vmcb.c              |  4 +-
 xen/arch/x86/include/asm/hvm/svm-types.h |  6 --
 4 files changed, 4 insertions(+), 154 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a63ec613465f..ef6fa5d23b67 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -165,58 +165,6 @@ int cf_check nsvm_vcpu_reset(struct vcpu *v)
     return 0;
 }
 
-static uint64_t nestedsvm_fpu_vmentry(uint64_t n1cr0,
-    struct vmcb_struct *vvmcb,
-    struct vmcb_struct *n1vmcb, struct vmcb_struct *n2vmcb)
-{
-    uint64_t vcr0;
-
-    vcr0 = vvmcb->_cr0;
-    if ( !(n1cr0 & X86_CR0_TS) && (n1vmcb->_cr0 & X86_CR0_TS) )
-    {
-        /*
-         * svm_fpu_leave() run while l1 guest was running.
-         * Sync FPU state with l2 guest.
-         */
-        vcr0 |= X86_CR0_TS;
-        n2vmcb->_exception_intercepts |= (1U << X86_EXC_NM);
-    }
-    else if ( !(vcr0 & X86_CR0_TS) && (n2vmcb->_cr0 & X86_CR0_TS) )
-    {
-        /*
-         * svm_fpu_enter() run while l1 guest was running.
-         * Sync FPU state with l2 guest.
-         */
-        vcr0 &= ~X86_CR0_TS;
-        n2vmcb->_exception_intercepts &= ~(1U << X86_EXC_NM);
-    }
-
-    return vcr0;
-}
-
-static void nestedsvm_fpu_vmexit(struct vmcb_struct *n1vmcb,
-    struct vmcb_struct *n2vmcb, uint64_t n1cr0, uint64_t guest_cr0)
-{
-    if ( !(guest_cr0 & X86_CR0_TS) && (n2vmcb->_cr0 & X86_CR0_TS) )
-    {
-        /*
-         * svm_fpu_leave() run while l2 guest was running.
-         * Sync FPU state with l1 guest.
-         */
-        n1vmcb->_cr0 |= X86_CR0_TS;
-        n1vmcb->_exception_intercepts |= (1U << X86_EXC_NM);
-    }
-    else if ( !(n1cr0 & X86_CR0_TS) && (n1vmcb->_cr0 & X86_CR0_TS) )
-    {
-        /*
-         * svm_fpu_enter() run while l2 guest was running.
-         * Sync FPU state with l1 guest.
-         */
-        n1vmcb->_cr0 &= ~X86_CR0_TS;
-        n1vmcb->_exception_intercepts &= ~(1U << X86_EXC_NM);
-    }
-}
-
 static int nsvm_vcpu_hostsave(struct vcpu *v, unsigned int inst_len)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
@@ -246,7 +194,6 @@ static int nsvm_vcpu_hostsave(struct vcpu *v, unsigned int inst_len)
 static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-    struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct vmcb_struct *n1vmcb, *n2vmcb;
     int rc;
 
@@ -281,8 +228,6 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
         gdprintk(XENLOG_ERR, "hvm_set_cr4 failed, rc: %u\n", rc);
 
     /* CR0 */
-    nestedsvm_fpu_vmexit(n1vmcb, n2vmcb,
-        svm->ns_cr0, v->arch.hvm.guest_cr[0]);
     v->arch.hvm.guest_cr[0] = n1vmcb->_cr0 | X86_CR0_PE;
     n1vmcb->rflags &= ~X86_EFLAGS_VM;
     rc = hvm_set_cr0(n1vmcb->_cr0 | X86_CR0_PE, true);
@@ -290,7 +235,6 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
         hvm_inject_hw_exception(X86_EXC_GP, 0);
     if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_cr0 failed, rc: %u\n", rc);
-    svm->ns_cr0 = v->arch.hvm.guest_cr[0];
 
     /* CR2 */
     v->arch.hvm.guest_cr[2] = n1vmcb->_cr2;
@@ -418,7 +362,6 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     struct vmcb_struct *ns_vmcb, *n1vmcb, *n2vmcb;
     vmcbcleanbits_t clean = {};
     int rc;
-    uint64_t cr0;
 
     ns_vmcb = nv->nv_vvmcx;
     n1vmcb = nv->nv_n1vmcx;
@@ -452,7 +395,6 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
      *   safed here.
      * The overhead comes from (ordered from highest to lowest):
      * - svm_ctxt_switch_to (CPU context switching)
-     * - svm_fpu_enter, svm_fpu_leave (lazy FPU switching)
      * - emulated CLGI (clears VINTR intercept)
      * - host clears VINTR intercept
      * Test results show that the overhead is high enough that the
@@ -551,10 +493,8 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         gdprintk(XENLOG_ERR, "hvm_set_cr4 failed, rc: %u\n", rc);
 
     /* CR0 */
-    svm->ns_cr0 = v->arch.hvm.guest_cr[0];
-    cr0 = nestedsvm_fpu_vmentry(svm->ns_cr0, ns_vmcb, n1vmcb, n2vmcb);
     v->arch.hvm.guest_cr[0] = ns_vmcb->_cr0;
-    rc = hvm_set_cr0(cr0, true);
+    rc = hvm_set_cr0(ns_vmcb->_cr0, true);
     if ( rc == X86EMUL_EXCEPTION )
         hvm_inject_hw_exception(X86_EXC_GP, 0);
     if ( rc != X86EMUL_OKAY )
@@ -1305,11 +1245,6 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
     case VMEXIT_INTR:
     case VMEXIT_NMI:
         return NESTEDHVM_VMEXIT_HOST;
-    case VMEXIT_EXCEPTION_NM:
-        /* Host must handle lazy fpu context switching first.
-         * Then inject the VMEXIT if L1 guest intercepts this.
-         */
-        return NESTEDHVM_VMEXIT_HOST;
 
     case VMEXIT_NPF:
         if ( nestedhvm_paging_mode_hap(v) )
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 243c41fb13a8..2546705d245c 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -104,38 +104,6 @@ static void cf_check svm_cpu_down(void)
     write_efer(read_efer() & ~EFER_SVME);
 }
 
-static void svm_fpu_enter(struct vcpu *v)
-{
-    struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
-
-    vcpu_restore_fpu_lazy(v);
-    vmcb_set_exception_intercepts(
-        n1vmcb,
-        vmcb_get_exception_intercepts(n1vmcb) & ~(1U << X86_EXC_NM));
-}
-
-static void cf_check svm_fpu_leave(struct vcpu *v)
-{
-    struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
-
-    ASSERT(!v->fpu_dirtied);
-    ASSERT(read_cr0() & X86_CR0_TS);
-
-    /*
-     * If the guest does not have TS enabled then we must cause and handle an
-     * exception on first use of the FPU. If the guest *does* have TS enabled
-     * then this is not necessary: no FPU activity can occur until the guest
-     * clears CR0.TS, and we will initialise the FPU when that happens.
-     */
-    if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-    {
-        vmcb_set_exception_intercepts(
-            n1vmcb,
-            vmcb_get_exception_intercepts(n1vmcb) | (1U << X86_EXC_NM));
-        vmcb_set_cr0(n1vmcb, vmcb_get_cr0(n1vmcb) | X86_CR0_TS);
-    }
-}
-
 static void cf_check svm_update_guest_cr(
     struct vcpu *v, unsigned int cr, unsigned int flags)
 {
@@ -145,20 +113,6 @@ static void cf_check svm_update_guest_cr(
     switch ( cr )
     {
     case 0:
-    {
-        unsigned long hw_cr0_mask = 0;
-
-        if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-        {
-            if ( v != current )
-            {
-                if ( !v->arch.fully_eager_fpu )
-                    hw_cr0_mask |= X86_CR0_TS;
-            }
-            else if ( vmcb_get_cr0(vmcb) & X86_CR0_TS )
-                svm_fpu_enter(v);
-        }
-
         if ( paging_mode_hap(v->domain) )
         {
             uint32_t intercepts = vmcb_get_cr_intercepts(vmcb);
@@ -169,12 +123,12 @@ static void cf_check svm_update_guest_cr(
                vmcb_set_cr_intercepts(vmcb, intercepts | CR_INTERCEPT_CR3_WRITE);
         }
 
-        value = v->arch.hvm.guest_cr[0] | hw_cr0_mask;
+        value = v->arch.hvm.guest_cr[0];
         if ( paging_mode_shadow(v->domain) )
             value |= X86_CR0_PG | X86_CR0_WP;
         vmcb_set_cr0(vmcb, value);
         break;
-    }
+
     case 2:
         vmcb_set_cr2(vmcb, v->arch.hvm.guest_cr[2]);
         break;
@@ -909,9 +863,6 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
     if ( unlikely((read_efer() & EFER_SVME) == 0) )
         return;
 
-    if ( !v->arch.fully_eager_fpu )
-        svm_fpu_leave(v);
-
     svm_save_dr(v);
     svm_tsc_ratio_save(v);
 
@@ -1678,28 +1629,6 @@ static void svm_do_nested_pgfault(struct vcpu *v,
     domain_crash(v->domain);
 }
 
-static void cf_check svm_fpu_dirty_intercept(void)
-{
-    struct vcpu *v = current;
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
-    struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
-
-    svm_fpu_enter(v);
-
-    if ( vmcb != n1vmcb )
-    {
-       /* Check if l1 guest must make FPU ready for the l2 guest */
-       if ( v->arch.hvm.guest_cr[0] & X86_CR0_TS )
-           hvm_inject_hw_exception(X86_EXC_NM, X86_EVENT_NO_EC);
-       else
-           vmcb_set_cr0(n1vmcb, vmcb_get_cr0(n1vmcb) & ~X86_CR0_TS);
-       return;
-    }
-
-    if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-        vmcb_set_cr0(vmcb, vmcb_get_cr0(vmcb) & ~X86_CR0_TS);
-}
-
 static void svm_vmexit_do_cr_access(
     struct vmcb_struct *vmcb, struct cpu_user_regs *regs)
 {
@@ -2459,7 +2388,6 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .update_guest_cr      = svm_update_guest_cr,
     .update_guest_efer    = svm_update_guest_efer,
     .cpuid_policy_changed = svm_cpuid_policy_changed,
-    .fpu_leave            = svm_fpu_leave,
     .set_guest_pat        = svm_set_guest_pat,
     .get_guest_pat        = svm_get_guest_pat,
     .set_tsc_offset       = svm_set_tsc_offset,
@@ -2469,7 +2397,6 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .get_pending_event    = svm_get_pending_event,
     .invlpg               = svm_invlpg,
     .wbinvd_intercept     = svm_wbinvd_intercept,
-    .fpu_dirty_intercept  = svm_fpu_dirty_intercept,
     .msr_read_intercept   = svm_msr_read_intercept,
     .msr_write_intercept  = svm_msr_write_intercept,
 #ifdef CONFIG_VM_EVENT
@@ -2783,10 +2710,6 @@ void asmlinkage svm_vmexit_handler(void)
         }
         break;
 
-    case VMEXIT_EXCEPTION_NM:
-        svm_fpu_dirty_intercept();
-        break;
-
     case VMEXIT_EXCEPTION_PF:
     {
         unsigned long va = vmcb->ei.exc.cr2;
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index e583ef8548c7..5ed7123d9a69 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -138,9 +138,7 @@ static int construct_vmcb(struct vcpu *v)
 
     paging_update_paging_modes(v);
 
-    vmcb->_exception_intercepts =
-        HVM_TRAP_MASK |
-        (v->arch.fully_eager_fpu ? 0 : (1U << X86_EXC_NM));
+    vmcb->_exception_intercepts = HVM_TRAP_MASK;
 
     if ( paging_mode_hap(v->domain) )
     {
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index 051b235d8f69..3ede62cade80 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -65,12 +65,6 @@ struct nestedsvm {
     /* Shadow io permission map */
     unsigned long *ns_iomap;
 
-     /*
-      * Cached guest_cr[0] of l1 guest while l2 guest runs.  Needed to handle
-      * FPU context switching.
-      */
-    uint64_t ns_cr0;
-
     /*
      * Cache guest cr3/host cr3 the guest sets up for the l2 guest.
      * Used by Shadow-on-Shadow and Nested-on-Nested.
-- 
2.53.0


