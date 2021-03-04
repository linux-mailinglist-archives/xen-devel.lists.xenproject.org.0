Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2033732D5B2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 15:54:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93316.176135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHpLl-00015k-F5; Thu, 04 Mar 2021 14:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93316.176135; Thu, 04 Mar 2021 14:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHpLl-00015L-Bm; Thu, 04 Mar 2021 14:53:13 +0000
Received: by outflank-mailman (input) for mailman id 93316;
 Thu, 04 Mar 2021 14:53:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zd52=IC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lHpLk-00015G-FQ
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 14:53:12 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21639180-9e91-4789-b59c-db53f127194b;
 Thu, 04 Mar 2021 14:53:10 +0000 (UTC)
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
X-Inumbo-ID: 21639180-9e91-4789-b59c-db53f127194b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614869589;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=w42WT7O2QH2cfRu8u+NxK2WDp7Jcpjgfi1UVGv2ZK2s=;
  b=O8LCT9/iTnaQVmKN3Fb93Y4OA7SePRFXiIjnEqgcZ6QZzLNms6z9QJkv
   sCciy8KtpQWx5HX1ClyjyRue9a+51E3+nrGu2PzCI7Xoo7BavBUbOtjNO
   Nb2JoDfvfQ9dPAGqjlxDtCNXFHz2PR2Lf3d9N6wWhukMik5kmog4a3heX
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: M4CVk+yExLYCaAbS8v9iEsAcaxFgPQrqcoCJF9NjApPMFMp/IpLluTNTxljrSO00F621HEVi0/
 KmjU99aE/7mWKr0pyOAfJdCUeIEUO6rxfxMV1YlP9U8eHN2NcLXS7AKt22dw2C1K6gf4N0Cr2w
 I6j3DHvQgCP0x6Xzb2R/KW2GhMBvSEkiwFHuWdoN8nq5E5jI8+dCLsytUfi1k05Lc1VerdHSl2
 lu5WSaC7Uay9WuT9NwQgO4hiou5/L2Y7M3xxjI3nprpl+8BEvxSJx4xI5XamfDNEkXXjlKKk0v
 cMw=
X-SBRS: 5.2
X-MesageID: 38459263
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,222,1610427600"; 
   d="scan'208";a="38459263"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2WPJsKNvje7T5XikABuU8YAZpOYC4VbzqShiUdY8pUT1wjRbKInFhwPR6Sk9NXmTRUXVDXzpYgnTUGXoU7u9KJlxY9mpLb8YX+htEB0ebbf5OotHZ5a3SRle1cNiOadLYoMMIfhEqnoeB4N2P0Vu0+qd4KGqZ67vXD3D638UPd61iNACx5b6aAue2BlODQv5amN0A9ngGjNSsIV0WsUR9xwzHfGSLDLXzCgysl111JqGxCMd8A30sUMbLSOKTycWFjbA9hRM2m/XSZRD6ibH75xpoCRzfCwVDdiVpE7lB7Ek4RTY90pMzN2/WCH0vrAYTI8sIdU9uEbZfEPYGYsGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2pdlnYkK6NZGcE+3Ae/ki7kRac06cOdBxcW+JVkJzA=;
 b=MLCSzK8wBu0y9pADBQwLIDPWBjuGAYlGEYBKZlc7zEx4GseRhqwbFcD7vUwO6YF1zJe1ksWLSWLKxDmh84OFc1c5oNvy8gq3AtUrvTKCBBp9On1x6YrpiGjJ9CT68JRpMTWi6b/egYzDVTPh2dNl6fgImceMPkueBhmZTnB7ZLKZFe8a4Nz5YwO+5ew1GKw2i0Prc/tJ4bGyvcaEAM/V7N2AW+3t6zPcVm1RatBt2R093desa00dkyFwLLTPDqELZnRxRdein1wPuTibIcug8CRn/U3VoQYXLvxIwkpJ1/GemK7ngpTTksLTgAQcxKJ4Ks8ugV1rm5yu0RrZ6od8sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2pdlnYkK6NZGcE+3Ae/ki7kRac06cOdBxcW+JVkJzA=;
 b=oPdjXu4fJkq3Je83wRqiHvtdhsYq9d9sDbLkVKPhIIzIOir3lgYGiBm/eNU2RsyHRo736r9ozuWCiMf2EcPdxRWSdqNWZc1bRnSlC8GFgCAcDF5ODKFKJnO47Wt0KZc+OWpmpEC/5f/PwUQFMlRykv+PlJQMRvmr10IhX2uGA/g=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>
Subject: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed rdmsr behavior
Date: Thu,  4 Mar 2021 15:47:55 +0100
Message-ID: <20210304144755.35891-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0094.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::9) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53b59604-9366-4dce-df87-08d8df1d34d0
X-MS-TrafficTypeDiagnostic: SA2PR03MB5772:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB57720328364B6A9DD96DB0968F979@SA2PR03MB5772.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J4wfbGdnx7fgWiJbTy5Wm7XzPWCGESwo6fsf/lLgzatFICt5GrZu6nv27TXC3iEKLbSjn/48177G3Vkg8iAWXTNd/9YFs/YeSwE0tDVif+KimVaJB8VZFVuJf+NJiOpdmYrWJSFW9gmg31UnYLh28CFhqUGu80I6wF+oUwbssenaQIhw3hc939bTFHlmz15+x1j6FvU8wGoUxDZjERTtD2bpsgLes4ItoO8R8KI0o4iEFjrFylma6//d8qvO5f8BBjZKjZtyLo2m5PSlIyts7ZTryqYcjiARMiZRZdt1uS0sjSfbeM1P/POBgxmLK9STTJDHU1g7x5OybXBDu2oL3JzPiBy262MG81PGKkB/yW4CsAAMnC9+1v3hdsxpuVMGI1Q9fsG8ViHXePFhk49Q6QU0tSJu9p4ptQD/45sxDGHafx/IBWjKrhyo6LEW9pjVj7K4WrIMZpILNZFKQZ4ynqWedH7/AkdMEcB1oPp14Wd6nukY19HpUwAqSCImJGalTn6hJQGpapMUNJ856ek/Hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(6916009)(316002)(86362001)(6496006)(54906003)(6486002)(6666004)(956004)(2906002)(2616005)(16526019)(66556008)(5660300002)(8676002)(8936002)(186003)(66476007)(478600001)(26005)(66946007)(83380400001)(1076003)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RmNpMUFTRHptaGVqdktQNmpnc3l3ZFpwYnJubm1nQ0FOb0hJRnd3UWcyOWJG?=
 =?utf-8?B?cE8rNjlhaFhOLzV6bjgvN0xjSlRDbVlza1U4RjJqVEJVTFFGeTlrK0Voai9H?=
 =?utf-8?B?OFpaTDNFQnplVWN3V3pNL05mZ0lQTTV6NkUvbDRzc1J1Rklsbk1QMGwyREFV?=
 =?utf-8?B?VnE4K05hMnJHeFE4djhuaGFKNHY4bWxZUzA5UVlzeEtPa21icFA3b1Q0b3hh?=
 =?utf-8?B?OHdxc1E1VkkwelZPZ1d5TXlIS2RRUk1uSk9ISDB1SWwzUnZUdkZUQVBWbU9K?=
 =?utf-8?B?RnI3Rm5tVFB3VCtaQ0Vrei9sQlY3d1VUdGszSmhGQkJWUWJlV2lRMzNMMmt2?=
 =?utf-8?B?Wkg0TFJtcXBnVmFSTWxuazFlMDNwM05ucFE3T2FBcUJ4LzV2UXgyRHpQdW5O?=
 =?utf-8?B?TlFkaGtsOGMwWWhyRHlsS0FHZDIxSUhNRW5UdTQyay9rb2tTU21OSm1tZ2dZ?=
 =?utf-8?B?anFSTWRML1JLcWI2djdqTG41L1paZUdGeEdNMnVKNWtlTkhrTkVzaFpQTUZv?=
 =?utf-8?B?Mmo2Yit4elVKOU96aG9zaWVmR2xFY2ZKc0kxdVRWNHRZVDc4Zk81OGFBVUgw?=
 =?utf-8?B?V2Q5ajI1cjRZODduOThJNmt0WFBMelgyc2l3cXRJV2Mxc1dCYjZ5U2t1SHYw?=
 =?utf-8?B?bXlVN3JNRHU1MHZBNnE3ckVFcVBSR2wwTit6R3dVZjJtVTh0Z1loVHVxSjll?=
 =?utf-8?B?VDhOb3pUT2hJZnQ4Q1JtWEFmbk9CVXpXM2NEcVBadU9tVnNQQ3pZbXdWN21R?=
 =?utf-8?B?dGVKYXdFNWlvMHhYNUlpcHVLMU5vM2Z0alBPbzR6czFRd2dMOU03a3pINGdz?=
 =?utf-8?B?dmlKZ1YyWkp6N21lNFd6WlEyTUdxSk9PRTRzeVdjb1kvWFQ5bW1XWWxHR2NE?=
 =?utf-8?B?MFQ2eURhemtiVEtCaHJqUklxcVErNE1ONms0SVFib1VwYVAxNlhrTjdqMjFv?=
 =?utf-8?B?MitlY3hjYTZqOUpCT2RLMFZQempic0o1NW5nNzJEV3dsamd5MnpINkNEREJt?=
 =?utf-8?B?aXI2U1RDajRyVFFjNW5CN2wwNk8xdGRIS2lCRFdFZ2R1TmlBQSsvUEUvRlBS?=
 =?utf-8?B?Y2hBSWlYcldIMm5qbzRsc1hNRHFNR0hQT013YzVkQU9mNVN4Vmp5LzZ6cGxC?=
 =?utf-8?B?a202TnBzM2lUdVU1VU5Cc0l6MThmbEUwc2NOVGFSdkQzb2NjaDdjVXZPOGo5?=
 =?utf-8?B?VUxJdU84VHJ0Y3JuYVJlODZtR3hDcEQ3d0FQUXdXQXBmMGNNTmxkait4NlpQ?=
 =?utf-8?B?bWtJcTJ2c2NTSjhUMzNqQlhseVc5NFhzUlJza2twQmhHWkdJRVZHQ1VMT2NW?=
 =?utf-8?B?Zy9Pa1c5bUsva01aMXlreU5OOHM4SC85OTNQTDFnWUp1VnJrbmh4UE9IL1pa?=
 =?utf-8?B?dzZ1Z1UvT3hlY3JWZTBnMG9Pa3U2VS8wR2lTdTBGbW4zOHprSFhNOGZoTnVs?=
 =?utf-8?B?QW8vek1LUWNKYzBVV21jTFVoTlpmamhNRENOa2U5UTBlSS92ODB2S1BheTJx?=
 =?utf-8?B?dTdzWHNkdGtrQTVRUUR5YXZxY1dBOWtyaGpzMXV0RE9YSitxcWN1UG9XbDBL?=
 =?utf-8?B?VjVXem8rbU1VUXRBbzFKeUtsdzNOT0J0ajd1VVh1aEFqTU9SSXg0MER0aWlW?=
 =?utf-8?B?N0pBU2YxV1BHOWFoR2JCeWlTRVllRDYvcFlDQWxuSG9WTUVJd3RpdTJhWHFO?=
 =?utf-8?B?WjB0aHRDOGw4RFpvenRQOUpUVGFvS3BtcWFISUZLbUlaMm15a01hSXFqaXow?=
 =?utf-8?Q?xeCHEFYnv8yVhfdgj69ENZTQ8EnXl5xRXcA+DPc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b59604-9366-4dce-df87-08d8df1d34d0
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 14:53:00.8543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFca3N1Yiq7fTemOMGz4mXVAXOrptu3lgBTJu7PV+Vuxbcsr+iPWo7RXQrLazKUKbvvLQg5gzFBHsPQovQ0plg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5772
X-OriginatorOrg: citrix.com

Introduce an option to allow selecting a less strict behaviour for
rdmsr accesses targeting a MSR not explicitly handled by Xen. Since
commit 84e848fd7a162f669 accesses to MSRs not explicitly handled by
Xen result in the injection of a #GP to the guest. This is a behavior
change since previously a #GP was only injected if accessing the MSR
on the real hardware will also trigger a #GP.

This commit attempts to offer a fallback option similar to the
previous behavior. Note however that the value of the underlying MSR
is never leaked to the guest, as the newly introduced option only
changes whether a #GP is injected or not.

Long term the plan is to properly handle all the MSRs, so the option
introduced here should be considered a temporary resort for OSes that
don't work properly with the new MSR policy. Any OS that requires this
option to be enabled should be reported to
xen-devel@lists.xenproject.org.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Only apply the option to HVM guests.
 - Only apply the special handling to MSR reads.
 - Sanitize the newly introduced flags field.
 - Print a warning message when the option is used.
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
Boris, could you please test with Solaris to see if this fixes the
issue?

I wonder whether we need to to enable this option by default for
guests being migrated from previous Xen versions? Maybe that's not
required as the option is helpful mostly for early boot I would
assume, afterwards an OS should already have the #GP handler setup
when accessing MSRs.

From a release PoV the biggest risk would be breaking some of the
existing MSR functionality. I think that's a necessary risk in order
to offer such fallback option, or else we might discover after the
release that guests that worked on Xen 4.14 don't work anymore in Xen
4.15.
---
 docs/man/xl.cfg.5.pod.in          | 17 +++++++++++++++++
 tools/include/libxl.h             |  8 ++++++++
 tools/libs/light/libxl_types.idl  |  2 ++
 tools/libs/light/libxl_x86.c      |  4 ++++
 tools/xl/xl_parse.c               |  7 +++++++
 xen/arch/x86/domain.c             | 10 ++++++++++
 xen/arch/x86/hvm/svm/svm.c        |  6 ++++++
 xen/arch/x86/hvm/vmx/vmx.c        |  7 +++++++
 xen/include/asm-x86/hvm/domain.h  |  3 +++
 xen/include/public/arch-x86/xen.h |  8 ++++++++
 10 files changed, 72 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 040374dcd6..62178b9829 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2861,6 +2861,23 @@ No MCA capabilities in above list are enabled.
 
 =back
 
+=item B<rdmsr_relaxed=BOOLEAN>
+
+Select whether to use a relaxed behavior for read accesses to MSRs not
+explicitly handled by Xen instead of injecting a #GP to the guest.  Such access
+mode will force Xen to replicate the behaviour from the hardware it's currently
+running on in order to decide whether a #GP is injected to the guest.  Note
+that the guest is never allowed to read the value of unhandled MSRs, this
+option only changes whether a #GP might be injected or not.
+
+This option is only relevant for HVM guests, and will be removed in future
+releases once we are certain the default MSR access policy has been properly
+tested by a wide variety of guests.  If you need to use this option please send
+a bug report to xen-devel@lists.xenproject.org with the details of the guests
+you are running that require it.
+
+=back
+
 =back
 
 =head1 SEE ALSO
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index a7b673e89d..1cc40a2d67 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -495,6 +495,14 @@
  */
 #define LIBXL_HAVE_VMTRACE_BUF_KB 1
 
+/*
+ * LIBXL_HAVE_RDMSR_RELAXED indicates the toolstack has support for switching
+ * the rdmsr handling in the hypervisor to relaxed mode, where #GP is only
+ * injected to guests for unhandled MSRs if accessing the MSR on the physical
+ * hardware also triggers a #GP.
+ */
+#define LIBXL_HAVE_RDMSR_RELAXED 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 5b85a7419f..03b0c80146 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -644,6 +644,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                ("vuart", libxl_vuart_type),
                               ])),
+    ("arch_x86", Struct(None, [("rdmsr_relaxed", libxl_defbool),
+                              ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
     ("altp2m", libxl_altp2m_mode),
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 58187ed760..c9cff44088 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -5,9 +5,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
                                       struct xen_domctl_createdomain *config)
 {
+    config->arch.domain_flags = 0;
     switch(d_config->c_info.type) {
     case LIBXL_DOMAIN_TYPE_HVM:
         config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
+        if (libxl_defbool_val(d_config->b_info.arch_x86.rdmsr_relaxed))
+            config->arch.domain_flags |= XEN_X86_RDMSR_RELAXED;
         break;
     case LIBXL_DOMAIN_TYPE_PVH:
         config->arch.emulation_flags = XEN_X86_EMU_LAPIC;
@@ -809,6 +812,7 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
                                               libxl_domain_build_info *b_info)
 {
     libxl_defbool_setdefault(&b_info->acpi, true);
+    libxl_defbool_setdefault(&b_info->arch_x86.rdmsr_relaxed, false);
 }
 
 int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1893cfc086..9f52c7e914 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2636,6 +2636,13 @@ skip_usbdev:
         xlu_cfg_replace_string (config, "spice_streaming_video",
                                 &b_info->u.hvm.spice.streaming_video, 0);
         xlu_cfg_get_defbool(config, "nographic", &b_info->u.hvm.nographic, 0);
+        if (!xlu_cfg_get_defbool(config, "rdmsr_relaxed",
+                                 &b_info->arch_x86.rdmsr_relaxed, 0))
+            fprintf(stderr,
+                    "WARNING: rdmsr_relaxed will be removed in future versions.\n"
+                    "If it fixes an issue you are having please report to "
+                    "xen-devel@lists.xenproject.org.\n");
+
         if (!xlu_cfg_get_long(config, "gfx_passthru", &l, 1)) {
             libxl_defbool_set(&b_info->u.hvm.gfx_passthru, l);
         } else if (!xlu_cfg_get_string(config, "gfx_passthru", &buf, 0)) {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 5e3c94d3fa..c06b17d338 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -760,6 +760,13 @@ int arch_domain_create(struct domain *d,
                d->domain_id);
     }
 
+    if ( config->arch.domain_flags & ~XEN_X86_RDMSR_RELAXED )
+    {
+        printk(XENLOG_G_ERR "d%d: Invalid arch domain flags: %#x\n",
+               d->domain_id, config->arch.domain_flags);
+        return -EINVAL;
+    }
+
     emflags = config->arch.emulation_flags;
 
     if ( is_hardware_domain(d) && is_pv_domain(d) )
@@ -824,6 +831,9 @@ int arch_domain_create(struct domain *d,
     {
         if ( (rc = hvm_domain_initialise(d)) != 0 )
             goto fail;
+
+        d->arch.hvm.rdmsr_relaxed = config->arch.domain_flags &
+                                    XEN_X86_RDMSR_RELAXED;
     }
     else if ( is_pv_domain(d) )
     {
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b819897a4a..d036809bd3 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1795,6 +1795,7 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
     const struct domain *d = v->domain;
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     const struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
+    uint64_t tmp;
 
     switch ( msr )
     {
@@ -1965,6 +1966,11 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
         break;
 
     default:
+        if ( d->arch.hvm.rdmsr_relaxed && !rdmsr_safe(msr, tmp) )
+        {
+            *msr_content = 0;
+            break;
+        }
         gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
         goto gpf;
     }
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index bfea1b0f8a..883e43a0bb 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3123,6 +3123,7 @@ static int is_last_branch_msr(u32 ecx)
 static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
 {
     struct vcpu *curr = current;
+    uint64_t tmp;
 
     HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x", msr);
 
@@ -3204,6 +3205,12 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
             break;
         }
 
+        if ( curr->domain->arch.hvm.rdmsr_relaxed && !rdmsr_safe(msr, tmp) )
+        {
+            *msr_content = 0;
+            break;
+        }
+
         gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
         goto gp_fault;
     }
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index 7b60e9125f..fdc1b36513 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -122,6 +122,9 @@ struct hvm_domain {
 
     bool_t                 is_s3_suspended;
 
+    /* Don't unconditionally inject #GP for unhandled MSRs reads. */
+    bool rdmsr_relaxed;
+
     /*
      * TSC value that VCPUs use to calculate their tsc_offset value.
      * Used during initialization and save/restore.
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index 629cb2ba40..fbf91bf3b9 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -304,6 +304,14 @@ struct xen_arch_domainconfig {
                                      XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
                                      XEN_X86_EMU_VPCI)
     uint32_t emulation_flags;
+
+/*
+ * HVM only: select whether to use a relaxed behavior for read accesses to MSRs
+ * not explicitly handled by Xen instead of injecting a #GP to the guest. Note
+ * this option doesn't allow the guest to read the hardware value.
+ */
+#define XEN_X86_RDMSR_RELAXED       (1u << 0)
+    uint32_t domain_flags;
 };
 
 /* Location of online VCPU bitmap. */
-- 
2.30.1


