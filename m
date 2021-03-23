Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC97345B8E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:01:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100574.191750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdqi-0008QC-TA; Tue, 23 Mar 2021 10:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100574.191750; Tue, 23 Mar 2021 10:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdqi-0008Pe-OQ; Tue, 23 Mar 2021 10:01:20 +0000
Received: by outflank-mailman (input) for mailman id 100574;
 Tue, 23 Mar 2021 10:01:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdqg-0008Eu-GT
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:01:18 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 546e2cf3-4ca8-40b6-8fd8-271706176efc;
 Tue, 23 Mar 2021 10:01:12 +0000 (UTC)
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
X-Inumbo-ID: 546e2cf3-4ca8-40b6-8fd8-271706176efc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=/Woeth1Qo4qC19JO5EGPKMCsmplx3e3Bv1+R+5k6GM8=;
  b=JTDGJGWfUZRsIFHsoHBpaLZDtK2n35t1w44/bcr7aZFXAEnXU1HKrfzc
   yh2iMwNDtl2ouS5Z9lOEvLbVTjxtU02yw7ycZ+MiTZKv2TXMj/6eDUyi8
   lGUwdb7CtiDqckKKEeN9j97r8A5tBnGIR/SvRuKwk+kOOMRtd5NkyWrbm
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: A4PPknK72bCwVwF9v6geA7W2A7lMdgdjTAMz15nEfD9Kj1Gr6XGnJSfhtLEbNdHZdNLKeNy1n2
 8Wk3a+dIhabJ8yjtw04s1FsZ4G4n20cB8xdSUjmt51ZBEdaCyl3ONnKtx9JN9MEuognNF60QE9
 gOKI95DXJy2UU4lO66JVhYGd3Rwlg0PXjjtNt3sTXlRtezTkixazO/ulZBO4hz9x6bhIHIy8lu
 8BYAGVoWZdcexSRa2FtUSVPGBIFTAi4A4s+9es3p2fKdbtQCE6dNtbfDFhV+yOuoygvvOD8Qz5
 hTk=
X-SBRS: 5.2
X-MesageID: 40261295
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qPcfFq8VxUJWanqOmeZuk+EKdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnXnKQU3aA6O7C+UA76/Fa5NY0K1/qH/xTMOQ3bstRc26
 BpbrRkBLTLZ2RSoM7m7GCDfOoI78KA9MmT69v261dIYUVUZ7p77wF/Yzzrd3FeYAVdH5I2GN
 69y6N81lmdUE8aZMi6GXUJNtKrz7H2vanrfAIcAFof4BSO5AnC1JfBDxOa0h0COgk/o4sKzG
 6tqW3Ez5Tmid6X4Fv212jf75NZ8eGRt+drNYi3peU+bhnpggasTox9V7OFpyBdmpDS1H8a1O
 Pijj1lE8Nv627AXmzdm2qT5yDQlAwAxlWn6ViEjWDtqcb0LQhKdfZptMZiXTbyr28D1esMt5
 5j7iaimLd8SS7kpmDb4ePFUhl7/3DE2kYKoKoooFF0FbcFZKQ5l/14wGplVK0uMQjd844dHO
 xnHKjnlYxrWGLfVXzfs2V1qebcJ0gbL1ODSkgGjMSfzyJbqnB/11cZ38wShB47heoAd6U=
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="40261295"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxSIYiAohgbBF0klDtKHYdqWnvupqP8/NIagBMTq/1K3i5VSj4ev5jxYli4LWqRrivluWM8r/bqeExtddt+SLCRYkVX+lLePKkFbZFNem/qV7btpHUvt0SWCkUoK0h1I7RWR6EBTkxAsu3zySFySKLA3SRvVnoWNC0i1VRUprBAVgN51/gGZnSMPkX4J6SEL59hQhNgtVNCpslf8lFwRK8kHhIyUCJWnwhi0cVoEydHWuoBBDMcwrNE7y232aaxGH3nt1ton7E1ox+9vn5jeP3GUhDMRPL+mqaAPFgqV4wCggGu9hFEMLiWWEpGdyAR1ZbhO2ToP+YpPVmzg09pXew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlUBOnVeSatdTasqz2pA02ppHxyAvCsUzYnjh93s6fw=;
 b=cDwW2TkyvklVbV/GUeHZ5rSFJBVkXYCCLmuBNrySCGsIzgX6EFrhEQlExMVDfZg6Kef3MJ1837WC+/E6s34s6d3XRHvDfBH3SiV+KDxWwvjOcRNWhV0xlvxJW6k/Ez5Kjx9TRiM/Ao/J4MfF8Hyq2TM0M00JJ4CFyS55DmJQvmKO8DeDrAMUN09X/cymIVeYmQEaLAuTSL8FKvZ9dcnimm026j03IAK/IoJxvccVtc1GE1hQE+FFAm5jiMyTbjq1+JJFOaCWP2VP7qs8eq00T47MyHkgb4pQz7uWbHezMH5ouhLGyhuNilHtRb6c3P+0xmprfBOE2LptmjZ1Rs+4ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlUBOnVeSatdTasqz2pA02ppHxyAvCsUzYnjh93s6fw=;
 b=JUow7egOyee9RYbfQ/3h7JvTbajg7tkFlWfNKwjJQdGXHf+jrEfnRD/eQPU7ECmnpQFzd1IpAQWXeUDjhY8TII0tC6/Pa2m9m5Ormxb/Lw0QkzJUO4gxsUkeF0yL3HOCWRKnxqIT+gzHDI4kobIDjtIkQ6E+1wFo0vgzEdLTVpU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 16/21] libs/guest: make a cpu policy compatible with older Xen versions
Date: Tue, 23 Mar 2021 10:58:44 +0100
Message-ID: <20210323095849.37858-17-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0121.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3351dc00-b919-4c09-fab6-08d8ede29472
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB49693ADFA9337392C01091758F649@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SZn8WarrbgJ2JOZZDmVG9Htb4IGDptJa+sGghFce0AKgoVqaDG/p1PODu42BFjHwaknI7cOmYg1+tqZFkMxYWtdIct1RKf4IKyorcXRtA5cyqReJjScsUHjNZM6c5ga9oWLgpr8GT49SkRsMMT8YO8g9gl/jQM7C+AjIHToe0WHSi6F9+w43BDRk35RvMq4p37HYPYCBQ/OX47zHSnXeL3F5viV07kYiWOr0taWbQmHXgNhDXXP+cbWxMEx6FTPqWR1F81oJCI3dR4erz2zeJsbZL/aGbK6hHvvoo/EPKMTL0DEFbVeKGWQ2lTXHvnSYjoxUB1+E/mkcKn7x2EIx8NQc2fRZBTS2BodtJ4ltUmULjaLu/6Ui+1x4NeiwfidDnODCcNUwW0TLNQsI0l3OLUVJotgEVZ5I2464PxSiXhrCflLtISt0Vv31TJgobkqSB5TApmO0J+PbFCp9NZ9gfzmAru/rqyjCc4xq/18aGypVJMzStrNJjcgWmmJZeQ0kRi/mOTGn5wZLfujIoe2saa7B1aliuuApyda/FrBqC8AwDZCvo19r65SJdorJBTeJxLE/0wePYulhnA+Ydrb6vrMKZ7ylrfC3VtkiCnQ1HRu2MnYiKUKt+Wp82Kb1nP3tSEUZReYbus3OYjVbcfwbCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(36756003)(2616005)(316002)(26005)(6486002)(956004)(16526019)(186003)(2906002)(86362001)(66556008)(6916009)(478600001)(5660300002)(8936002)(6496006)(38100700001)(83380400001)(6666004)(66476007)(8676002)(66946007)(1076003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q3pUeEN3Zy82bTVkR0huaWtpQUVGRTUyUTdFUmhGQXl0R3pKVDA5RnhpMU0y?=
 =?utf-8?B?eG14RW5qdkZpOUFoOWdoNmI5d2tmcUd0T09PZi9qZVc1MkI0YnpRUHc4Ulds?=
 =?utf-8?B?MGV1SDFLSDR0UFYvMUIxTmo1a0RkcXNzZW9TN3Voa2tnSVFpek40dE16RjJq?=
 =?utf-8?B?WDB6NzFVbDZUZnNoOXJ2bFA2NmRVczhkZXJxUlJQV0NKTzB0SWpLdExwaGs4?=
 =?utf-8?B?c1I1eDZJVGlJODFxTGZZazlhZFltNGhZUlVERFRtZlRBZmJ6T0xTSllzeTRS?=
 =?utf-8?B?WHMrVW1ibUpDeTk0NHZVNTJpQ0s4RnJiUWZtZjg5M0V4cnlPSUFsS2FuNGZk?=
 =?utf-8?B?SVN3VVFnMzdtcnZUV1A4ckRqM1dXdlRLaHZDZTVPYlRPS29wZ0hnaWJ4T3JV?=
 =?utf-8?B?TmpqdDNZY0w0Ym1IVFpxRlFKRHRPNVZuR3gvcjFwRCtUVUpXU1Z2QXF5ejdq?=
 =?utf-8?B?bW0vYy84RkVwVXNvclgvWnRwNlUyS3pvN3NQek4wbndjSjU0S2UxSWwrV3NU?=
 =?utf-8?B?bmxXYjhwTzBsWHpZWmFZdHpJSGRId1dMUStOVlFqRWY2Mk9ySUZJWjFabGYx?=
 =?utf-8?B?akhyTDZIYjZtOW96S0puSUc4akJydnVjcWhRRUhGSHd0Y0N0dFB6TFNuL2JM?=
 =?utf-8?B?YlZWUGRHenIyM0Riak5USGZ5b2lTd2IzbW9wYm9Va3UzcDlwN215cWUxOSs3?=
 =?utf-8?B?WlZmT1k3cTFXNURKVzZ2TXlnRTExVy8raE5qR3dLbVBjc1N0ZEM3SElYdzFh?=
 =?utf-8?B?LzNMZ2ZUV0xmWGlMSlhkV3lUZDVNTVh5MVlxdFZmN0svRFhyWkIvZ3RFbE15?=
 =?utf-8?B?bFJ1SUhxTk9XN0hTeWdzYThwOGVKS2ovdVRSUGF0SzBlVWc4VXA1TGZpbHQv?=
 =?utf-8?B?Q0hOOUFjMFpRdlhPQmthRFAyaERlWTB5OUdRWG0raFd3R1NBQUR2YjhWL2hJ?=
 =?utf-8?B?WVhMRHgrVXUxd1VTVGZaZm1FSTRRVENLbjI2S3dUbWs2cVBXYjJWUEJsMFVn?=
 =?utf-8?B?VE15VFh2bS8rY08zODZoYkFuOG9PcjFkS21kNUFjRVN6SExRYjUyWWR6SzF2?=
 =?utf-8?B?U0VQT3VtZTN1eGU0WHpwb2JYcVNLWTBVUUxnY3grdml5amZmNWlKWi8xTmNw?=
 =?utf-8?B?S05SSlNHWVJBUEE5ZUw1WEdTc2F4SkNyTHVsQlBTWnEyZ1ZiOXhkQVpZSEhy?=
 =?utf-8?B?bFR1VHI1OFR4ak1hRmgzTTJxMHBvb0QyZHVlN3RzVFpBVTJxYjNXRWd3MXFv?=
 =?utf-8?B?T3h0QzVHY1ZYOXBHSEJwWEZVeUhHTENtaTJsOU50NlNtQUl6eFR0SFl2QlRa?=
 =?utf-8?B?djVWSXNJUmlwREIwaGZlbnlDNzhseDlqUWpqbi9KQmFNV2N2b1IzbHdtdm5a?=
 =?utf-8?B?SmkwQWtnbW5yNUt5SGFNRWg2Y1RaN1BYV0tkMnBjN2lLUi9UbDM2aHU2NzBB?=
 =?utf-8?B?ek1jQTZzZjFFM2xqUDk1MUJQUjlLLy9ZczVabmV2V0gyRDFwZTQzS29kK0g5?=
 =?utf-8?B?UjBueHpDRG5iLyt1RzNrdUloVGc5WFZRRG9BL3E2UmtBTlg3ZUVaYXo1ZW9Q?=
 =?utf-8?B?cFV1QmNYVW01RWJMV0xIVW9qVUExUHNyT2NEWDdBb1NVK0ZlZkRTMFBaZTVl?=
 =?utf-8?B?QWR3WDJVUTlqdGlsM1J4di9FZDkrL080TkhHYytJOCtGYUZkaUJmZSsvUXpw?=
 =?utf-8?B?aFFMWEVxVENKVkhlNHNNS01jTlJjMy8yNmY4Q1dLckpWOTI0MHBCblZyZVdD?=
 =?utf-8?Q?xo0JA8U+oPyRWXNupM4s24ssdXvbv7MeIn1yK9Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3351dc00-b919-4c09-fab6-08d8ede29472
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:01:08.3811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twU6gfn5Hvho/KdLgZ8bWKV3Yw1WtuR3KSkJrnBjiHz8SKr/USrMa599tCnDlhWY4U0ywECJCZ6jB60gGVN9lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

Older Xen versions used to expose some CPUID bits which are no longer
exposed by default. In order to keep a compatible behavior with
guests migrated from versions of Xen that don't encode the CPUID data
on the migration stream introduce a function that sets the same bits
as older Xen versions.

This is pulled out from xc_cpuid_apply_policy which already has this
logic present.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  4 ++++
 tools/libs/guest/xg_cpuid_x86.c | 39 ++++++++++++++++++++++++++++-----
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 5f3e5e17e9d..6f7158156fa 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2627,6 +2627,10 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
                                   const xc_cpu_policy_t p2,
                                   xc_cpu_policy_t out);
 
+/* Make a policy compatible with previous Xen versions. */
+int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
+                                  bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 4afca3249ba..2abaf400a2b 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -436,6 +436,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     unsigned int i, nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpuid_policy *p = NULL;
+    struct cpu_policy policy = { };
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
     uint32_t len = ARRAY_SIZE(host_featureset);
@@ -504,12 +505,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
      */
     if ( restore )
     {
-        p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
-
-        if ( di.hvm )
-        {
-            p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
-        }
+        policy.cpuid = p;
+        xc_cpu_policy_make_compatible(xch, &policy, di.hvm);
     }
 
     if ( featureset )
@@ -1230,3 +1227,33 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
 
     return rc;
 }
+
+int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
+                                  bool hvm)
+{
+    xc_cpu_policy_t host;
+    int rc;
+
+    host = xc_cpu_policy_init();
+    if ( !host )
+    {
+        errno = ENOMEM;
+        return -1;
+    }
+
+    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
+    if ( rc )
+    {
+        ERROR("Failed to get host policy");
+        goto out;
+    }
+
+    policy->cpuid->basic.rdrand = host->cpuid->basic.rdrand;
+
+    if ( hvm )
+        policy->cpuid->feat.mpx = host->cpuid->feat.mpx;
+
+ out:
+    xc_cpu_policy_destroy(host);
+    return rc;
+}
-- 
2.30.1


