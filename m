Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMs1EODVwmllmgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDD531AABE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261252.1554364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56MK-0005q8-12; Tue, 24 Mar 2026 18:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261252.1554364; Tue, 24 Mar 2026 18:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56MJ-0005oo-QS; Tue, 24 Mar 2026 18:20:07 +0000
Received: by outflank-mailman (input) for mailman id 1261252;
 Tue, 24 Mar 2026 18:20:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w56MJ-0005hb-4T
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 18:20:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w56MI-00FIpx-GR
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 19:20:06 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5d4-2eae-0a2a0a5409dd-0a2a45019638-6
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:20:06 +0100
Received: from [52.101.52.43]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5d5-6400-0a2a45010019-3465342b1f92-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:20:06 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH4PR03MB7771.namprd03.prod.outlook.com (2603:10b6:610:237::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 18:20:03 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 18:20:03 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAsBftCxGU3IJZFYF+v/eo6ygGeTCyObytcq8yJe1L4asFu4tvR25z3+b0vrB49KZkW6JJg6zWrImsTYbvDEiXvMkXQ2hZ5Cw/DiB6pIjw7Jr/wRsbJ66/hbmtajoJzaMHNQOHwgEZHsXPoHHjSNPEOvxN2pXgvtoKdq4z6HGHZAzdHSTMMmDxNlyp1q4eQW2gDaW3AN3DySiFfp19iZGXcEiYotL+3BN6KyiQ2NHnO4kGnmsH6Pe4n2GtUSKt129sYVUEEvBCjdc6EJYtviYWQJVseY3S5REYu8jD2tO0TBVy64MkrzCo5XDMQ8xRcVRQZkOX2We5K7+T0yzqpVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENHvXBDFYPK8S39Fvdlcd7u1cuBTdaLhm3Un5HN/3RA=;
 b=NtHKR8hesoAB+FxiLKsM7ot1wLXmzuIcbkoQG6OePfkJ5sGKD29Z6lSeJy1qkp5rJKOtol7nNrvdAi87TiNO780eFVHFZiILa47oHtNtbMH6JcfSw/Xht+SAwQ6arcCnxddSyoaGWqMiv/pBAiSVbagGyi+O7gtrsH2BgYAiT5KWq/RqkTRVUr7TS1d7JDiBZ1srE2mTiyyvGiaC/emqckb4ltXld+XyTJmMYEhYOBTRzfKHMu3rbHuf4RhPr6g1e6gkwZV4rMQExbUT/Ue/JzDa/PoOtp8APfGv2OVBooPyyrtJsr4sYGFvwxCG5T7pn8oKRtBSYEJCuzEyWoyFmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENHvXBDFYPK8S39Fvdlcd7u1cuBTdaLhm3Un5HN/3RA=;
 b=aPzWhPX5/5Ar7naE08Zh5TAKZM76Oc6RlO0URCR1fAjAWD/Fr10BoGsVYVtgdCVWuJvyrSdZxbA1uNI6SPYMQz4qklk/9nr42W5w/DpGTNDF5aRxSar/+pg/xjTlBkOvfNC6+QHT/zgBOzi4uRE5R/2kLAeoSarBK80gCHudnJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 5/9] x86/traps: Remove lazy FPU support
Date: Tue, 24 Mar 2026 18:19:33 +0000
Message-ID: <20260324181937.2465574-6-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
References: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0032.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::6) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH4PR03MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 2135e678-27e3-43d6-9137-08de89d1f7c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3IL4VuXg8wEiicp5EaCgVBrIY/3DBIsjpw7d+WQy3YKRy41BRGeavaO36dHPWpt862ensZUNzanG9vef51iUuoNU/Cvde+7rSCC3nOztFu7y4c4e4JvtXvlF/maYrHBS7BDOBZCtaCc6+rnm2FMMu/urhjELn2Ijha/3jGLt+4mFZOU9yKIW9b/zTQjF+p2PyOMVJRmrd48HFpGD4NNZTINgzoEqJbCAMRqPTHA/sZR+BeGo41iePmy7hdqYcfs1p8K+rut0lfSV6ZkImycnzR03gVmdYRTMyNOpUcl3Vko7AHgCZTteq7y8bHhbE0I6+yfQ+VCGJ2Tjswv/vcXw0VdAf3opY57r/1zC19ihJFHMQR3rJSLfS34YHLa9xpa96feeUTPbZ40wRNhECppO6cgE1WN2ylj68q3iTtuP6HYEDz7aDAzN1TqA5OWvsR4BcQawHtHe4h4TvK6TzhoQYZ+TrNld7YSfpqiewuT7kSzbI79H/9tHFtIPO5lBlErE/WRlHI3Vb2A+70RN41qm+2ZY+BPyPx19elZXhyt9mhP2lltduo+irwhUq1B9rP1m+v1ji+8eCIp3Kcqa2oHIeSxUf0zndKeDFwZfk2Ff7tGcmccsLKEnVuiNwlLOxwf7NLbuTAqESO/g+DIfN1r2sM4u5NQx5M4fRNHnEKCYE1/rZdrps5oYEl29tu7mZuv2iicE7vHQIIis3XjY/p/yfOlfQ3kKEqiAUn9Orr+LfdY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XE8R+WfqR2KA/XD4I2aII+6ZPi8cE6wTxdrcsuIXXf0zDNkFNGzikx1KbNxj?=
 =?us-ascii?Q?Of5sd9XPcA5qP0Ya0fbjey6WTMYAjJr9px57rKZE5qTybwQQ3kRcz1elr2o4?=
 =?us-ascii?Q?bH4aor6fH/mPkJGRJP3kJHZxXpKFydW7Ifc49AOKnNBIKYlZJRg5ZUmkob6l?=
 =?us-ascii?Q?lgTvx0zKuFJRP+BzAbsbXnTB46C3NSLjIP5QwSywI6LKh90p+Kx8omb0Ncuk?=
 =?us-ascii?Q?f/TFJM0S8JxpRE1MaXGUMc46WHvZuWJV2IKSFGSdQD4Tq/aw9/VKkKYMn6cg?=
 =?us-ascii?Q?qBZ6t8GQJHRYGR9Jcau+4m4dO2A+EGqLSkN4yypJCaIQ/DAuIVIGkLZ6eK46?=
 =?us-ascii?Q?EBNkKCX7EOsNjkr1n1aeZCIENk5600YzKnkc2za6rECykzslZKf4D8a/FBIV?=
 =?us-ascii?Q?g0XHyvvI1IIoIOpYyvnOanzj4Qjx+aBTVU/bGv8v9i+6z2bS/O6cGZ0kaHjY?=
 =?us-ascii?Q?zqCxfZaM3YQIfVQ9BUkvqqAp2XI/CmI11cUChoOsxBiGP0UgKWcbbIGug3So?=
 =?us-ascii?Q?Td//Fa5Y+iHtx2saUFI6Ow9+ni7vReCGccJVpHevT5IQt/vELGUZRa+/ry4G?=
 =?us-ascii?Q?yClXrK+u2f/J/eclGiDZnyullGfiISGUk+h3lzFPwvH5jd72b7R2cb8kephB?=
 =?us-ascii?Q?fETNdjH/rfXzlj5JZt7FQhgbFpScfXNdH7zR9eHSGHr8OX9W00QbzQbmtIEA?=
 =?us-ascii?Q?NpUghGw1/urQR2BySUBdG69DgPsGDPsK1rV7oQtSsYLbcBEqjDGUWDO8iJr0?=
 =?us-ascii?Q?rdjo8TvFw1430tSk205I9WVvFvIVTRUkQZQEDowy7U/3czxyLnSvYIjR9NrF?=
 =?us-ascii?Q?HrTsSa94GR+UDowtpJmyPJwZ6gDzLCjXR451v1Q/jcXbMHT9vX1lTnavncJ4?=
 =?us-ascii?Q?B2VC4ZPvXaj5vIg80luFEkDH/9LVOWLi4sRxkPVT/CmpdWrunj+Wl//CsBOA?=
 =?us-ascii?Q?h6tsHHoPyG/y83J6Bid4KjvlrUfEkidRuAqTErNpbKoTZDUA6XB/n2SUA6GL?=
 =?us-ascii?Q?tPlniS0EzcyurPY7SYWgSR/o7bxt+adE+ayT/8DHuhp8C+21dKeNpwhcxe6e?=
 =?us-ascii?Q?gex9XiEj0S1LlmaTo+7InE0XADm3UCSOjcfvy5TQVeaAibddsiGevumJrOcH?=
 =?us-ascii?Q?lNNfwbXVvADVTLrQxSUHncvdreE/SufUPm7LJsiU08BIEefAapacIid0VL9q?=
 =?us-ascii?Q?jZwHVvz3Moron/xPZpq7qpxprBlhWCy7g53y9o4ipn6qgHJrfNDT2iRST+6e?=
 =?us-ascii?Q?kxdOAOQnpEHVCwnVXxQuD1zopPGEZJGj+zEl03DAjV/R4gSDmcRSa5n1BFyk?=
 =?us-ascii?Q?nVYczOugdiD+F54ix57HoC6dTA8HSmK0l2bkPS5R5V1AwCLSDNPA85Tv8Ys5?=
 =?us-ascii?Q?n7d4/zfH8uROVBrZIQBmL2dhCsCur7d7HAWKinGb+w5MOtrNBeGZHs7gNdj6?=
 =?us-ascii?Q?4d0a0ltSwmFhk6tr+Tdhe5atn1LKNqeL5nyZUNn9PZ+NK0cnwpQdKsfbQC1w?=
 =?us-ascii?Q?x12BG7DdinkoJs5Jc+HoZTLbuPqWqcN9s1xTSPgHCNWl6XiOhKhaYJI58qma?=
 =?us-ascii?Q?LFiiwDTVoIgWswVV5UwxFv8DZAQLyGBlrScReuHm8NlRfkyH9Z+Dc0G88W+k?=
 =?us-ascii?Q?H0U64qBhMlwXlZoY+yKDz+Sa4QE332hP0DZd4s6LzLaxGwkimlS6UUMc4hS0?=
 =?us-ascii?Q?oslclTil+4iy+b80CL4Yrmj2B87tqSVSmqxUkUJFsfdCmX5Uv2NGPLfGnqo7?=
 =?us-ascii?Q?JwjKnsw58cWR7jputWAiNBlvPmsysHs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2135e678-27e3-43d6-9137-08de89d1f7c4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:20:03.2706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UyYFVj9JmAhjM8tcteavuiZrGNhjgz9RABQpt3GL0kpa8LNBqhznM9YnGqRvZkrUy4+4ozWeJ5U+4aBAg//VaMcCFrb7VawMn3j5d2BBmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7771
X-purgate-ID: tlsNG-d62444/1774376406-8EEE2DF3-935198DF/0/0
X-purgate-type: clean
X-purgate-size: 3505
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CDDD531AABE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Wei Liu <wei.liu2@citrix.com>

Remove lazy FPU support from the #NM exception handler used by PV
guests since fully_eager_fpu is now always true.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
In v2:
* Tweaked the commit message
* Crash the guest rather than host if the guest register is in an
  unexpected state.
* Reword a comment
* Allow tail-call optimization

 xen/arch/x86/i387.c               | 24 ------------------------
 xen/arch/x86/include/asm/i387.h   |  1 -
 xen/arch/x86/pv/misc-hypercalls.c |  3 +--
 xen/arch/x86/traps.c              | 20 +++++++++++++-------
 4 files changed, 14 insertions(+), 34 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 954ba3b1799b..7da731865f73 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -234,30 +234,6 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
         stts();
 }
 
-/* 
- * Restore FPU state when #NM is triggered.
- */
-void vcpu_restore_fpu_lazy(struct vcpu *v)
-{
-    ASSERT(!is_idle_vcpu(v));
-
-    /* Avoid recursion. */
-    clts();
-
-    if ( v->fpu_dirtied )
-        return;
-
-    ASSERT(!v->arch.fully_eager_fpu);
-
-    if ( cpu_has_xsave )
-        fpu_xrstor(v, XSTATE_LAZY);
-    else
-        fpu_fxrstor(v);
-
-    v->fpu_initialised = 1;
-    v->fpu_dirtied = 1;
-}
-
 /* 
  * On each context switch, save the necessary FPU info of VCPU being switch 
  * out. It dispatches saving operation based on CPU's capability.
diff --git a/xen/arch/x86/include/asm/i387.h b/xen/arch/x86/include/asm/i387.h
index 652d7ad2deb6..da0c7e945f95 100644
--- a/xen/arch/x86/include/asm/i387.h
+++ b/xen/arch/x86/include/asm/i387.h
@@ -28,7 +28,6 @@ struct ix87_env {
 };
 
 void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts);
-void vcpu_restore_fpu_lazy(struct vcpu *v);
 void vcpu_save_fpu(struct vcpu *v);
 void save_fpu_enable(void);
 int vcpu_init_fpu(struct vcpu *v);
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index 7e915d86b724..34a0717540a9 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -42,8 +42,7 @@ long do_fpu_taskswitch(int set)
     else
     {
         v->arch.pv.ctrlreg[0] &= ~X86_CR0_TS;
-        if ( v->fpu_dirtied )
-            clts();
+        clts();
     }
 
     return 0;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index b6b119769722..0565c576ecd6 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2045,15 +2045,21 @@ void asmlinkage do_device_not_available(struct cpu_user_regs *regs)
     }
 
 #ifdef CONFIG_PV
-    vcpu_restore_fpu_lazy(curr);
-
-    if ( curr->arch.pv.ctrlreg[0] & X86_CR0_TS )
+    if ( !(curr->arch.pv.ctrlreg[0] & X86_CR0_TS) )
     {
-        pv_inject_hw_exception(X86_EXC_NM, X86_EVENT_NO_EC);
-        curr->arch.pv.ctrlreg[0] &= ~X86_CR0_TS;
+        ASSERT_UNREACHABLE();
+        domain_crash(curr->domain);
+        return;
     }
-    else
-        TRACE_TIME(TRC_PV_MATH_STATE_RESTORE);
+
+    /*
+     * For better or worse, Xen's ABI with PV guests always clears TS on an #NM
+     * exception. Classic-xen Linux depends on this.
+     */
+    clts();
+    curr->arch.pv.ctrlreg[0] &= ~X86_CR0_TS;
+
+    pv_inject_hw_exception(X86_EXC_NM, X86_EVENT_NO_EC);
 #else
     ASSERT_UNREACHABLE();
 #endif
-- 
2.53.0


