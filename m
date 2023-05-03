Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 686F66F552A
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 11:48:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529069.823050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu95T-00028x-D4; Wed, 03 May 2023 09:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529069.823050; Wed, 03 May 2023 09:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu95T-00026U-9n; Wed, 03 May 2023 09:47:51 +0000
Received: by outflank-mailman (input) for mailman id 529069;
 Wed, 03 May 2023 09:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu95S-00026M-D7
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 09:47:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fb96d3f-e997-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 11:47:48 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB7980.eurprd04.prod.outlook.com (2603:10a6:10:1f0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 09:47:19 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 09:47:19 +0000
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
X-Inumbo-ID: 8fb96d3f-e997-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nk+Zig6DRm5g/T5AVqh2RtQ8dg9/LyGuF5laszhFvbe1uMMb5mlaJqSHr/WU8pGJ77yS035Hb28sjnc0Q2/prmEKrTMc+E3jDls9fReKBToVOyjN2oQc39Ce4xUNIddkAIj//pvqlsVbw7+o0BLYazQ9W5FG4Uped0cK2setlLk4lKUIXO6ESrbjqLf4qTEvJK4c56u4jM6IirY+Rf1ij7AIa1NxPFGmNGU1CNUhYdXZHT+FJ8SCyaMBQftiNLZ62BqYly2jY0xyImSK594kXeuFzglZo1ht1jxs/xwZZy8F7NwveNFpIQGeUhyU3C9uyjzwCu/K0RcEcr05RsGTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxFwwb3BZGcHC7xshgmJ4kLtF4OIl105qptm5zCcXSA=;
 b=EvRaJti7qqk2J+WJxPzZjlQXlhvK+HeaG+lI9+Y1K2xn44lZ+ndYG+jU9OA1o7O4nYp8BnqyGRI0b/77JT9ULtMpDhBSc5Gl4oue4WOlqcUq4b7XFhPYrax4/MqNbTqJlXUyK0YXNUNTonIfOU3S7fBz+AAOigxySRmQUQ8Q0K+7MG8NzpGYF/GybQSBo/0HW+GMzI9ZG7vFbp0DCIIYMcz1FSdIKDyH2yM5sB3R+qb5b085IxctWm0F7pHMliTgh4hVVVo3yiS0vQZqyMzvDKUupRUF3lecc4tmPZVgmG1MYcGhvuYHt33dZvAVApbZogfwoQvbVeQDgQgpZ0DOuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxFwwb3BZGcHC7xshgmJ4kLtF4OIl105qptm5zCcXSA=;
 b=4Tpn1AY+3Nx41MSek8MHxr+5itCcZ7tF23iHge2xklIIplLYV1eQ3k9heNhYzehSRfLs65OHGiVAlOid4d2m5YEjNh4B1lIyU266kJAlqfQFLM3hUPC+Acw60PDJ7fMpPBKeTbMtbmWfj/U3AyGWv2rocydVdNdFxktx5IhsscRSgGEpYOSI3NlDs2OT/RqAyMZAOwT4RIyi0WEux0WateV//cylzMA7PLRCilCaudcJq3SQt4R5tpbAIW49RoRyBBPV0yYIy2FP7KcMk3zw4JR2hgXAyKSuUM2kHEI42cMCXlKi7t6qt+4e7SyYcJB/iLCbB/R/mX9lKOqUMkDY/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9274fbb1-c1be-9570-ecfc-8f0ac9a1f42b@suse.com>
Date: Wed, 3 May 2023 11:47:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v2 6/6] x86/HVM: limit cache writeback overhead
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
In-Reply-To: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DBBPR04MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: fc04887b-0423-4823-8252-08db4bbb632d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/yNMJBKt644QL+6Shjl0FzLE8bJGk7zcFnsk+9lyD1eO8QyJKn9AsTHj6yhQpGMXOxwDhJsft+Vh0WttnFSst+ZeZozBie4UMoJifjPQlhYiJFINjVYF3VjY//lam9Z/JrB6cgIKM/iJPG5ivecenOkgyqp5L5/ZcJgz1PQX/CzEOAPBy33JS9WhXK9F7SJc8EmG8CBAwkyddrczQta6AzNDp7oGo9TpfLLNb4lzmFy1t0qIp6eXckyE7CVGid4CfRUxG3Fhbtrhc+juoiiLOsb65JKxa1vzSOjyMW1/oa8xTY6t+qky4J/JOAmysgDBaRVJuwWkreYBnoM3D0hUM7JifTLkyo79OS4BuJcjpTvEFDFnlQhF4rTPj37Ba1yrzUsRJr5F7Q2HGsrgEBi4rYKgxsGd0rBiNLTXcGop8zNwjBjMWE+6jrYeHSh9D3WFTM68aq79lURWF8+/Ee39ZY1SQC637A9n+ilPNyYJUq4y3AHgh7D/rsTGE78/xOdP7zW9oH7OoOf158x5q4jv5bgOopvh2R+my6mB/CwHgicBNlTQNN45h6003oUbujkb7stmvreJVrAr1vze6VuSjou9SPLBisAT1Hs5wCctX4g97N/VRXTa/apvOqTmgFJxupQ/ybBGq/92QhS4LKWqLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(6506007)(26005)(6512007)(186003)(31686004)(2616005)(2906002)(5660300002)(83380400001)(8936002)(8676002)(6486002)(41300700001)(36756003)(478600001)(54906003)(38100700002)(66476007)(66556008)(316002)(31696002)(66946007)(6916009)(4326008)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHFZTG9pMHNKQkZlT21TTWVGMkVnMVkrNUpBeXhTWTZWdjBKc1lQZWg5QmtC?=
 =?utf-8?B?U2dkdVNiamRNb2F3RTdUeDh2Y2Jzd3JyRC9KYnJ2K2cvUlJKTVlOL2lFRTdk?=
 =?utf-8?B?MlBZM0VwdVNBUDVndHRVT2tQZGtZZGVwM3p0VFN1YkNxOHpJNThCMUtPdURF?=
 =?utf-8?B?b3djQlhkSTQ3UytjMmpoWmhRTzh5clJvSE9va0tFbXZkLzRZa2Ficmt1NzBr?=
 =?utf-8?B?SnNFNkU3ZWJkM3hVSE1aWFYvM0hKL3VXNWp5SW1qYncrcW5PMGNNaWpsTXVI?=
 =?utf-8?B?Q0trZGUzZ1VaSnRBYU1RcjN0cEUzaW1MaURWVngxakVUMXBSSTFrV05JZUNa?=
 =?utf-8?B?MkJuZVIySXl1YTVtZEEvaXJXVFl0RXhlQkN2U05wMjlheGhhL09nSjQxbFNq?=
 =?utf-8?B?ajB3NVY2NjJRK1p1V0JlSGFEVXp3QURsM3Z4SDNZOXo3WWwrWkYwTnJuOGpM?=
 =?utf-8?B?TlVhc1JZOVdyTTU1ZUJSdi9WS1JTQ1pvQjFXMjNweGdoWURGcmtIcVd1ZUkz?=
 =?utf-8?B?cXcvUlZuS1d1Q1BFQ3NvWXl4YnE5Z0hsVTdWTU1xeEF3N2ZUaFJPN1hVa21K?=
 =?utf-8?B?V0pmVGtmTklLVHdVMzRHTFJLenNOQVo0SlowSTg1WnpycmxSeWcvQWJDOFVw?=
 =?utf-8?B?UXhmcW5BTGV1L2NlKzl2WVpzNHp6ZCs2NEJXYjU4S1NLN1c5RmNjSjR2OUdB?=
 =?utf-8?B?ZnJWT0tXZ2cwbmM2dWk5bmNZUlhMTVlBbG9jalZFaUJTakhVaFBvRWhhdzhH?=
 =?utf-8?B?a21SSWFUNWo3aUpTSUlKdDVYTm1ZZE9PSTdJUW5NWmFnYUxZUVljR2NtbHF2?=
 =?utf-8?B?MWpJN0thQktvL3R1cEFkMjJGWmFzMjV2bldNVXQvMFVkZ0lnMXdBUndqQWhG?=
 =?utf-8?B?VFFuWXh3RFMvVzNqTXBNOXd1b3ZVOW9WZld0Nm0rSTZnUzJEbEp3bENWcUhs?=
 =?utf-8?B?VGZNLzFUV2FzOTNKUXZmQlhIVWExeFUyS2FjOFdMbFhrMEJObkhaNFhiZ3B5?=
 =?utf-8?B?NG1wNEhmTVlHa0gwUkpXNVN0dnU4blZOU2M4TEpOSUR2S3NNaTVRVVcrWDBO?=
 =?utf-8?B?S1VGRnZRVmFJb1RWRTFDQURvc1ZxYjdRWlFXRzhaMUtsNDR5TVVsbHpZbUN0?=
 =?utf-8?B?ZXhpZEpxcDRLYno5MDdkdkVoWFNCSUhja1FKQ3dyWEU2RURTWHVTbm0wYXRt?=
 =?utf-8?B?UGZXbU5UWTVhN0JDU2d1UGM4RVc4SEtjREJmakdhZlhtK2RWM2drMlN2K2Uz?=
 =?utf-8?B?R2R2Q3NYdXMrWTI2NjJoVUhaVkpoT0pZVFNmZzMrUWtxc1E5R1VrQTBHUC9t?=
 =?utf-8?B?eGR4b08vZVpWblBCSFRJRFJzRmxPYStRQ09Vazl2WVB1TmtyVmJzK2pEQkp6?=
 =?utf-8?B?RmZhYVNCMkpBdEpmbE44Z1UvdzRLY0F4RVZRQmEwUGhuZkpGNlNteTlWckty?=
 =?utf-8?B?SXJHaUttZjQ2WG51UU9aS3cyQXhLWHBwbTlWTGxwMVV1d3NvMjRsczFENEdh?=
 =?utf-8?B?eHJVeEZ2Y2lCSXhGTVVDN2crT3RrenMyaDNSN3MvS0xTeHhxa2wwbExiL0ov?=
 =?utf-8?B?NzhwT2hGOEFjMEEremVieXpDM3lzRUtIaElmc0tRMlVLcVZ0SkwyU2hENU9w?=
 =?utf-8?B?QUR3MExyZkhTVU1wam45cFEzR3ZwMHBHSlg2SU5xb2NMR2IxcnZvVjlCNFlJ?=
 =?utf-8?B?R214WWxFY0pOYzduTmRMOTAxekRlNXV0K1BoUHVleG1QT1dzR2s5UHI1U1JQ?=
 =?utf-8?B?RWVvOGF4NktETExEaG9sd2VNYU9PVFk4VUxNK3hiVDdrNy9FUG5hdG1VcU9H?=
 =?utf-8?B?ajhaRmczdG93ZVBMclh1QnNMOXREamM1ZkFyK1I4MmRqWHJESkQ2WjBSZzFV?=
 =?utf-8?B?aEU0S2owMWpEclppdm5DK2hTSzZvc0tacEFHYnhXZitvVjJZRUpJODFsYnJD?=
 =?utf-8?B?SUsrbXIvWnpTYUQ2WHBybnZRQ2F4K1pGdk8vVVZCVEpqZVRzM0kxMzJKc2x4?=
 =?utf-8?B?SVNQSXVFSkIvVnNWTklaREtzbWk2cDBuWUFVWkRjN0RoNCtyQWlkb2ZaNjJq?=
 =?utf-8?B?VEgwNitISTFkSlVHTUV3K2F1NE1LcVRuZDVLdFl0QncvVmNkK0VqZERPY1Qr?=
 =?utf-8?Q?OZaxGm2A3BCEUCFQjdMckCsvD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc04887b-0423-4823-8252-08db4bbb632d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 09:47:19.9090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pS4CniR+agOgejHU9tQB0i7PoAuRN3b2C3kIYP+c35gMjDm0T6Q3bB9l3l8HGnmYyRWVNqpKt3klmdqIyG3Fmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7980

There's no need to write back caches on all CPUs upon seeing a WBINVD
exit; ones that a vCPU hasn't run on since the last writeback (or since
it was started) can't hold data which may need writing back.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
With us not running AMD IOMMUs in non-coherent ways, I wonder whether
svm_wbinvd_intercept() really needs to do anything (or whether it
couldn't check iommu_snoop just like VMX does, knowing that as of
c609108b2190 ["x86/shadow: make iommu_snoop usage consistent with
HAP's"] that's always set; this would largely serve as grep fodder then,
to make sure this code is updated once / when we do away with this
global variable, and it would be the penultimate step to being able to
fold SVM's and VT-x'es functions).
---
v2: Re-base over changes earlier in the series.

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -537,6 +537,8 @@ void hvm_do_resume(struct vcpu *v)
         v->arch.hvm.inject_event.vector = HVM_EVENT_VECTOR_UNSET;
     }
 
+    __cpumask_set_cpu(v->processor, v->arch.hvm.cache_dirty_mask);
+
     if ( unlikely(v->arch.vm_event) && v->arch.monitor.next_interrupt_enabled )
     {
         struct x86_event info;
@@ -1592,6 +1594,10 @@ int hvm_vcpu_initialise(struct vcpu *v)
     if ( rc )
         goto fail6;
 
+    rc = -ENOMEM;
+    if ( !zalloc_cpumask_var(&v->arch.hvm.cache_dirty_mask) )
+        goto fail6;
+
     rc = ioreq_server_add_vcpu_all(d, v);
     if ( rc != 0 )
         goto fail6;
@@ -1621,6 +1627,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
     hvm_vcpu_cacheattr_destroy(v);
  fail1:
     viridian_vcpu_deinit(v);
+    FREE_CPUMASK_VAR(v->arch.hvm.cache_dirty_mask);
     return rc;
 }
 
@@ -1628,6 +1635,8 @@ void hvm_vcpu_destroy(struct vcpu *v)
 {
     viridian_vcpu_deinit(v);
 
+    FREE_CPUMASK_VAR(v->arch.hvm.cache_dirty_mask);
+
     ioreq_server_remove_vcpu_all(v->domain, v);
 
     if ( hvm_altp2m_supported() )
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2363,8 +2363,14 @@ static void svm_vmexit_mce_intercept(
 
 static void cf_check svm_wbinvd_intercept(void)
 {
-    if ( cache_flush_permitted(current->domain) )
-        flush_all(FLUSH_CACHE_WRITEBACK);
+    struct vcpu *curr = current;
+
+    if ( !cache_flush_permitted(curr->domain) )
+        return;
+
+    flush_mask(curr->arch.hvm.cache_dirty_mask, FLUSH_CACHE_WRITEBACK);
+    cpumask_copy(curr->arch.hvm.cache_dirty_mask,
+                 cpumask_of(curr->processor));
 }
 
 static void svm_vmexit_do_invalidate_cache(struct cpu_user_regs *regs,
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3710,11 +3710,17 @@ static void vmx_do_extint(struct cpu_use
 
 static void cf_check vmx_wbinvd_intercept(void)
 {
-    if ( !cache_flush_permitted(current->domain) || iommu_snoop )
+    struct vcpu *curr = current;
+
+    if ( !cache_flush_permitted(curr->domain) || iommu_snoop )
         return;
 
     if ( cpu_has_wbinvd_exiting )
-        flush_all(FLUSH_CACHE_WRITEBACK);
+    {
+        flush_mask(curr->arch.hvm.cache_dirty_mask, FLUSH_CACHE_WRITEBACK);
+        cpumask_copy(curr->arch.hvm.cache_dirty_mask,
+                     cpumask_of(curr->processor));
+    }
     else
         wbnoinvd();
 }
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -161,6 +161,8 @@ struct hvm_vcpu {
         struct svm_vcpu svm;
     };
 
+    cpumask_var_t       cache_dirty_mask;
+
     struct tasklet      assert_evtchn_irq_tasklet;
 
     struct nestedvcpu   nvcpu;


