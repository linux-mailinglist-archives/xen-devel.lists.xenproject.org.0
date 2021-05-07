Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BF0376441
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 13:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123956.233930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyJt-00030a-UQ; Fri, 07 May 2021 11:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123956.233930; Fri, 07 May 2021 11:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyJt-0002wc-Po; Fri, 07 May 2021 11:06:57 +0000
Received: by outflank-mailman (input) for mailman id 123956;
 Fri, 07 May 2021 11:06:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leyJs-0002vm-3t
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 11:06:56 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c89341f9-f751-4ab8-8fb3-44538a7d9b43;
 Fri, 07 May 2021 11:06:54 +0000 (UTC)
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
X-Inumbo-ID: c89341f9-f751-4ab8-8fb3-44538a7d9b43
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620385614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=0X8TxPH7KufbkpJ3x7eqxsup3Sr7s5HEON67QQy9Z/I=;
  b=Fu1P4DFRv+cZ94asXtr8nn1RSsO5YhL5tou5AI2AfSGp2ocMKy4AA3lj
   ziA6XKBx3Mfj9nvQMACaMJZeUXh2uYwLVW3RLqyFeWyi1DZ8AVSeJQ/Co
   E98mVlcJXSTGrC8+J/qLrH6bb1UKmhlwcARvrwh9h3Fo88sfT7L914Ccj
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BOFMUJfSWYClqkoGCme7WkfTfBpjZ1XbTDCxp7MzIlLmTKnlNaopmaf9cCqRXi8UhXn4JQZ1J1
 /khIlyAukr19Akzqj3Dk4j+kvvOzIZD0twqyO2/1gIOdfZw0hLsXuxL6bwiI45DmhtunE4Vt/S
 WHpcEyV2YE8RRXmsu/+Fmz1PFNJW4qEgQfAbPfCtAKkPI7Vd+4Inj2MTP+4SGUvgmD3YXCpKC2
 v2o+M3hRFsSK1WLIk2U7bAcjnyZJhDPu64loX2+emqyaE7GNS8lUzT3srRamhz8TXnGNxv3EaG
 Vds=
X-SBRS: 5.1
X-MesageID: 43096201
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:v2wSUqHQ4un4coLKpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="43096201"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpljV9Bfwb8R7D/1BiqmW3b2N1q6g6sFvB1gND0540ZiWICWsyJNqLCdN8KDkTCcPNx+NdQXdaCoz8xsQxjT5sTB6EuQ7V7aPrDA4PCyEC6SvGGRsr7F8TTVSWS3ESF93tcr95lywdrpLa6pHPAajwyVR5XV8WxqPLPSsfxMNiOgsrVL4Bz7HDCyiiY6EHeoY95Dgefv12UVmD78jTQWpDJh8iA2r3GuGJVrTjWh5JcGcdxkw1gkpREYobQ8eke6WxETIHZMwnIn8rRFGkNtVSeUR+pQEnsajZ1HsKQ7+MqccCcRPRd2x8aEp31xM2bMLqF67IczWVBVJZIj+DjqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64awfqRB5ESkjIM24i+z107CJ81OENwIGfRhEqoVoZE=;
 b=OTCWx9kZDsrDaaYDwl845walkFvK8QKtVoRrMB1h0V9WCXQEFxsZxhO9sjASD85kmhY5/SkVAnAy9KO7QvYfPjDKhNeBhng3rWlBq6RNejyVfrydjrPNnEjzJiIfNSdfaXLuVw/1W9pANmuBEhLOsUb3BDX8wz4FKINJLAUtnLr7CkVBYYTx5pORaEygxn4Gj6tD14OmrP+/hX6QS+7zM99KJj1jxw4F3L1Wbjrx32p/4Yy/hhwvp/hexDog/e3kOhiYR7hxOsXOByZCWB7LLuQViF4Fl6Vi2XABPhjfNpBicBGhEUKx91g6Ay3EjinBYCstajNu4O8U9pU0570XkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64awfqRB5ESkjIM24i+z107CJ81OENwIGfRhEqoVoZE=;
 b=IxLaZG7RffYOeOdF/Qr3PNSFCKNgt9hJZ+Nbl3SNue6QtZX8DeOt58M43OABlLRAfxuYCO8T+/VeMLlTyVzi8t5120XCgki27j0Y+Ocz2i89Ek9YrdLumOfNiKtlWeJWCA2kIYdyw4hIuVnZ3sSQQFmz8FMt8A+w/o0uqXMXTSI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v4 01/10] libx86: introduce helper to fetch cpuid leaf
Date: Fri,  7 May 2021 13:04:13 +0200
Message-ID: <20210507110422.24608-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507110422.24608-1-roger.pau@citrix.com>
References: <20210507110422.24608-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0154.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03aa3151-bb8f-41a5-8ce8-08d911483614
X-MS-TrafficTypeDiagnostic: DM6PR03MB4475:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4475BFE994B3E18C4C8DAAE08F579@DM6PR03MB4475.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: saP422w1aJ5dYAWn1ezGpYjTDRrutZ43B66BzYku2uCir1XyZoe5UrQUan9Qt9XIvPjq5yBaZXcNaDLNF0PMCCPPNZdVzNWyLa3LI7A8GTFo2PmB8vMFnbvCf7z+ooaP10ekRz0IjjvF2CzRc+1LJNrSJyJc6jjhOcqEzgX1nU4gQhT/geG3CpVKEOYCEgecoBBlOPdPaFew0GaTcdmbD/YQhNkvUId2iSdnjhvJawzt3wCwHvD4XVGD5YwiH6avuFB7pmohYSVNsMxXj7MSUynIH0QxBo8xuocuwwac7BxonSmKLjVAJlZ8oQQbhI9ZkQ3y7R4JuhAQoiquiBFGwtM5FuV64lrr5JogHDFY0v7Q1p7HqDqQRjyvEMeyxCT/84dpxCRJ7DiV2LgU+DWbDvdZs4Ug0bux73UhqTbB1wfujcw41b9Bxhpar2cgCijBWiLTNPjjmdwVhPh3HQeggTkvU+iWAtCAo+8owUDrsgoGCNtopkE5LJdWG4oYck87H754vB56WcH/PCU1rdA5FJHQQ27MoNlRYR2Y7clERmo6DoUzYK3RknSSRfHKUBi3RaawkkzAw52suMHbHWDFv3CwRMUho3QFHL66ovmA9gw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(8676002)(6496006)(26005)(66946007)(5660300002)(66556008)(66476007)(83380400001)(478600001)(956004)(1076003)(6916009)(316002)(38100700002)(54906003)(6486002)(2616005)(86362001)(8936002)(36756003)(6666004)(4326008)(186003)(16526019)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WklZc25IaExpV2h4SVk0TEtPU3N2cnBxK2J2MElJb1JBaDVnQkNxc3JPSThC?=
 =?utf-8?B?ZVBZdGNvQllDMFBwNlpyWGYrMlBMdDNQNkhmaURnRnJvUnpwRjRmbTVsTzJx?=
 =?utf-8?B?YVFuYy9pZ1pUbklEeXYvUkVWRmNLc1JBOFZhMmh2R3VFRzBieW5Dd2JrODU4?=
 =?utf-8?B?NlhFQU5CcHpqcFFpbmpQWnBxTU54SDZpZGN2QjVOaVp4R1RraEpWVVJldzAx?=
 =?utf-8?B?RUFwa3NPREtucjBuRys3WENoOHJoNEVZWGdlMlpldmtlNnBCQmxxVTg4SFha?=
 =?utf-8?B?djhsUUdEUk9wc3JqYVdkajIwZEFYRWczR0FLTjM1a05VQWowb0oyU0h6V2Mw?=
 =?utf-8?B?UW42ZHVUZnR5c1IxNUJFc0tuQVJPNC9zb3dFSURsZ3E1am5vTzNmTS9rb0Rq?=
 =?utf-8?B?ZnNPTjM5TUJaVm90V0ZNSklJRUttcjNvOEEwb1Vua2NDeFZEWjEyRzJEdlJM?=
 =?utf-8?B?eGNPRUZOQm9kZW9pVWYxc2ErN1RQS3pnL2lOTmZTZ0pmcCtwbGtXTmNycnpT?=
 =?utf-8?B?TitEZ3ppaE9sWXFzTEwxU1VPZE5leXQ2b0E3WDVIT2JqOTdDakZJSDc2TGlE?=
 =?utf-8?B?NXJlOFJCVlVaWGRNT3JFM3hTcFBtaUlldTRJUWhzZzgwTG5hamN1b0R2dWVT?=
 =?utf-8?B?d1V3ajRWWDdsbHh0VEFHbTZreHRpNnN1clF1ZUxlS3cwdEZHY0lDT2pQQkYv?=
 =?utf-8?B?NmZVUExYNUxBb3JReWQwOC9yanBZbFZ3cHA5Q2hXdFlyUFVackt6alRtRHYr?=
 =?utf-8?B?QjhCV01nSFRoQU5jQ0JJZ3piYzBzbGV5WmFqWG9LLzAzaHJMdzhneEkyVm1S?=
 =?utf-8?B?U3BId3hGN2F6MXZhemRrS25mdGU4Wm9WZFVwYTJCZWtsSE8rdENUL3VmblFO?=
 =?utf-8?B?UGNTdUJtd0YrMXVmOUVQVFNEcVVqREI1aXhYMFRieTlVZEtuZnFRQ0Y2QnZz?=
 =?utf-8?B?eEovRnFIRlpHMVU2MEtVbWxVcURPSFRjRUg1L2YrMFIyMGhHbWRLakdaOUFU?=
 =?utf-8?B?WjM0TTkrM1hFWkU2Uk5uRWZWenR0OUI2dS83NWxKVXhTYUs2VEhOWWluWFlz?=
 =?utf-8?B?N29tbGZEYUpyUG0xRDJBTDQxVndRZm8yTjdqWHNxOXMxMk1Ga0RSdHk4aGNE?=
 =?utf-8?B?TVo2Z3Z6c2FyU3dHQ3ZZSjR3QWtkOHpoYWx5c0FqU2NZb1FWWm9iSW5pN2w3?=
 =?utf-8?B?bVNhOW5CZnI0TGNiVTY1Y2tSWDgvZC95WE1JWnR2U3YyY1FsUVdkNUdHM3Iv?=
 =?utf-8?B?VWthbDFSR290ekpTVGVwK1UzeUMrNVFnSWVuTW8xc1RLaUtpclJVUlRSVzdv?=
 =?utf-8?B?YUpjREczNUQ2ODJQcE41Rk1XY01pVlJPVW8vNFUxUUZOM2lhNEJXVHhGL1N4?=
 =?utf-8?B?aFlxMlFvdkVFNndZSUV4MHM4WUN5UklMUjkzZE1wMzZDVWtLOWxYaGVNVzZP?=
 =?utf-8?B?SkozbEZHSFM3aVRjS3MrekhSYlpCQ09md0xINnRvVGZEcnRxT21Wa2NTMmts?=
 =?utf-8?B?Q2pldGxTbGNNRkZSdERRYnhnNEVGb0hYVVlGUUhERTUzZGFNMWF6WUF1K08y?=
 =?utf-8?B?QWY0d3JsZWJGdDBlRTBIWEZHaDZWanF6KzQ2QncxeTNvM2VwM051SUR5NHpN?=
 =?utf-8?B?YVVyZ3Bud2pnNDlEa1dkczJQaEtZaVNBYmhleFlINTFja3JqQjJhNXZza2cv?=
 =?utf-8?B?Y1lqMUljSGZuUWFsYU5TRUY4TTdTc0xjR09LQ0diTFFpTWtoZVZGVHRoMGlK?=
 =?utf-8?Q?TKPqt+26jDcdMTf2LvFzcsx9z14eriLkVe9h528?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03aa3151-bb8f-41a5-8ce8-08d911483614
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 11:06:49.7148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKZKwf/VV/yFNlrPEhUSzYDsEMiW9ZSFhsCH0/04nozO7xLRoAycDRPzdp+mXYt8m1GLi/Ko9Vl0jhaV8IFCHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4475
X-OriginatorOrg: citrix.com

Introduce a helper based on the current Xen guest_cpuid code in order
to fetch a cpuid leaf from a policy. The newly introduced function in
cpuid.c should not be directly called and instead the provided
x86_cpuid_get_leaf macro should be used that will properly deal with
const and non-const inputs.

Also add a test to check that the introduced helper doesn't go over
the bounds of the policy.

Note the code in x86_cpuid_copy_from_buffer is not switched to use the
new function because of the boundary checks against the max fields of
the policy, which might not be properly set at the point where
x86_cpuid_copy_from_buffer get called, for example when filling an
empty policy from scratch.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - New in this version.
---
Regarding safety of the usage of array_access_nospec to obtain a
pointer to an element of an array, there are already other instances
of this usage, for example in viridian_time_wrmsr, so I would assume
this is fine.
---
 tools/tests/cpu-policy/test-cpu-policy.c | 75 ++++++++++++++++++++++++
 xen/arch/x86/cpuid.c                     | 55 +++--------------
 xen/include/xen/lib/x86/cpuid.h          | 18 ++++++
 xen/lib/x86/cpuid.c                      | 51 ++++++++++++++++
 4 files changed, 151 insertions(+), 48 deletions(-)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 75973298dfd..81de9720c8d 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -670,6 +670,80 @@ static void test_cpuid_maximum_leaf_shrinking(void)
     }
 }
 
+static void test_cpuid_get_leaf_failure(void)
+{
+    static const struct test {
+        struct cpuid_policy p;
+        const char *name;
+        uint32_t leaf, subleaf;
+    } tests[] = {
+        /* Bound checking logic. */
+        {
+            .name = "Basic max leaf >= array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC,
+            },
+        },
+        {
+            .name = "Feature max leaf >= array size",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+                .feat.max_subleaf = CPUID_GUEST_NR_FEAT,
+            },
+            .leaf = 0x00000007,
+        },
+        {
+            .name = "Extended max leaf >= array size",
+            .p = {
+                .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD,
+            },
+            .leaf = 0x80000000,
+        },
+
+        {
+            .name = "Basic leaf >= max leaf",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+            },
+            .leaf = CPUID_GUEST_NR_BASIC,
+        },
+        {
+            .name = "Feature leaf >= max leaf",
+            .p = {
+                .basic.max_leaf = CPUID_GUEST_NR_BASIC - 1,
+                .feat.max_subleaf = CPUID_GUEST_NR_FEAT - 1,
+            },
+            .leaf = 0x00000007,
+            .subleaf = CPUID_GUEST_NR_FEAT,
+        },
+        {
+            .name = "Extended leaf >= max leaf",
+            .p = {
+                .extd.max_leaf = 0x80000000 + CPUID_GUEST_NR_EXTD - 1,
+            },
+            .leaf = 0x80000000 + CPUID_GUEST_NR_EXTD,
+        },
+    };
+    const struct cpuid_policy pc;
+    const struct cpuid_leaf *lc;
+    struct cpuid_policy p;
+    struct cpuid_leaf *l;
+
+    /* Constness build test. */
+    lc = x86_cpuid_get_leaf(&pc, 0, 0);
+    l = x86_cpuid_get_leaf(&p, 0, 0);
+
+    printf("Testing CPUID get leaf bound checking:\n");
+
+    for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+
+        if ( x86_cpuid_get_leaf(&t->p, t->leaf, t->subleaf) )
+            fail("  Test %s get leaf fail\n", t->name);
+    }
+}
+
 static void test_is_compatible_success(void)
 {
     static struct test {
@@ -786,6 +860,7 @@ int main(int argc, char **argv)
     test_cpuid_deserialise_failure();
     test_cpuid_out_of_range_clearing();
     test_cpuid_maximum_leaf_shrinking();
+    test_cpuid_get_leaf_failure();
 
     test_msr_serialise_success();
     test_msr_deserialise_failure();
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 752bf244ea3..f7481c3168d 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -779,48 +779,16 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
     switch ( leaf )
     {
     case 0 ... CPUID_GUEST_NR_BASIC - 1:
-        ASSERT(p->basic.max_leaf < ARRAY_SIZE(p->basic.raw));
-        if ( leaf > min_t(uint32_t, p->basic.max_leaf,
-                          ARRAY_SIZE(p->basic.raw) - 1) )
-            return;
-
-        switch ( leaf )
-        {
-        case 0x4:
-            if ( subleaf >= ARRAY_SIZE(p->cache.raw) )
-                return;
-
-            *res = array_access_nospec(p->cache.raw, subleaf);
-            break;
-
-        case 0x7:
-            ASSERT(p->feat.max_subleaf < ARRAY_SIZE(p->feat.raw));
-            if ( subleaf > min_t(uint32_t, p->feat.max_subleaf,
-                                 ARRAY_SIZE(p->feat.raw) - 1) )
-                return;
-
-            *res = array_access_nospec(p->feat.raw, subleaf);
-            break;
-
-        case 0xb:
-            if ( subleaf >= ARRAY_SIZE(p->topo.raw) )
-                return;
-
-            *res = array_access_nospec(p->topo.raw, subleaf);
-            break;
-
-        case XSTATE_CPUID:
-            if ( !p->basic.xsave || subleaf >= ARRAY_SIZE(p->xstate.raw) )
-                return;
+    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
+    {
+        const struct cpuid_leaf *tmp = x86_cpuid_get_leaf(p, leaf, subleaf);
 
-            *res = array_access_nospec(p->xstate.raw, subleaf);
-            break;
+        if ( !tmp )
+            return;
 
-        default:
-            *res = array_access_nospec(p->basic.raw, leaf);
-            break;
-        }
+        *res = *tmp;
         break;
+    }
 
     case 0x40000000 ... 0x400000ff:
         if ( is_viridian_domain(d) )
@@ -835,15 +803,6 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
     case 0x40000100 ... 0x400001ff:
         return cpuid_hypervisor_leaves(v, leaf, subleaf, res);
 
-    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
-        ASSERT((p->extd.max_leaf & 0xffff) < ARRAY_SIZE(p->extd.raw));
-        if ( (leaf & 0xffff) > min_t(uint32_t, p->extd.max_leaf & 0xffff,
-                                     ARRAY_SIZE(p->extd.raw) - 1) )
-            return;
-
-        *res = array_access_nospec(p->extd.raw, leaf & 0xffff);
-        break;
-
     default:
         return;
     }
diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
index 2300faf03e2..4e8797f9f5f 100644
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -438,6 +438,24 @@ int x86_cpuid_copy_from_buffer(struct cpuid_policy *policy,
                                uint32_t nr_entries, uint32_t *err_leaf,
                                uint32_t *err_subleaf);
 
+/**
+ * Get a cpuid leaf from a policy object.
+ *
+ * @param policy      The cpuid_policy object.
+ * @param leaf        The leaf index.
+ * @param subleaf     The subleaf index.
+ * @returns a pointer to the requested leaf or NULL in case of error.
+ *
+ * The function will perform out of bound checks. Do not call this function
+ * directly and instead use x86_cpuid_get_leaf that will deal with both const
+ * and non-const policies returning a pointer with constness matching that of
+ * the input.
+ */
+const struct cpuid_leaf *_x86_cpuid_get_leaf(const struct cpuid_policy *p,
+                                             uint32_t leaf, uint32_t subleaf);
+#define x86_cpuid_get_leaf(p, l, s) \
+    ((__typeof__(&(p)->basic.raw[0]))_x86_cpuid_get_leaf(p, l, s))
+
 #endif /* !XEN_LIB_X86_CPUID_H */
 
 /*
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index 1409c254c8e..3637466ff9f 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -532,6 +532,57 @@ int x86_cpuid_copy_from_buffer(struct cpuid_policy *p,
     return -ERANGE;
 }
 
+const struct cpuid_leaf *_x86_cpuid_get_leaf(const struct cpuid_policy *p,
+                                             uint32_t leaf, uint32_t subleaf)
+{
+    switch ( leaf )
+    {
+    case 0 ... CPUID_GUEST_NR_BASIC - 1:
+        if ( p->basic.max_leaf >= ARRAY_SIZE(p->basic.raw) ||
+             leaf > p->basic.max_leaf )
+            return NULL;
+
+        switch ( leaf )
+        {
+        case 0x4:
+            if ( subleaf >= ARRAY_SIZE(p->cache.raw) )
+                return NULL;
+
+            return &array_access_nospec(p->cache.raw, subleaf);
+
+        case 0x7:
+            if ( p->feat.max_subleaf >= ARRAY_SIZE(p->feat.raw) ||
+                 subleaf > p->feat.max_subleaf )
+                return NULL;
+
+            return &array_access_nospec(p->feat.raw, subleaf);
+
+        case 0xb:
+            if ( subleaf >= ARRAY_SIZE(p->topo.raw) )
+                return NULL;
+
+            return &array_access_nospec(p->topo.raw, subleaf);
+
+        case 0xd:
+            if ( !p->basic.xsave || subleaf >= ARRAY_SIZE(p->xstate.raw) )
+                return NULL;
+
+            return &array_access_nospec(p->xstate.raw, subleaf);
+        }
+
+        return &array_access_nospec(p->basic.raw, leaf);
+
+    case 0x80000000 ... 0x80000000 + CPUID_GUEST_NR_EXTD - 1:
+        if ( (p->extd.max_leaf & 0xffff) >= ARRAY_SIZE(p->extd.raw) ||
+             leaf > p->extd.max_leaf )
+            return NULL;
+
+        return &array_access_nospec(p->extd.raw, leaf & 0xffff);
+    }
+
+    return NULL;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.31.1


