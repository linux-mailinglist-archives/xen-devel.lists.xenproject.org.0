Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1003283B1
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 17:24:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91784.173168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlLC-0001wz-Ie; Mon, 01 Mar 2021 16:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91784.173168; Mon, 01 Mar 2021 16:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlLC-0001wc-FE; Mon, 01 Mar 2021 16:24:14 +0000
Received: by outflank-mailman (input) for mailman id 91784;
 Mon, 01 Mar 2021 16:24:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrjX=H7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lGlLA-0001wX-3X
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:24:12 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01187b4a-a34f-4b79-b5c9-d48aae380bfa;
 Mon, 01 Mar 2021 16:24:10 +0000 (UTC)
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
X-Inumbo-ID: 01187b4a-a34f-4b79-b5c9-d48aae380bfa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614615850;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=L/P0mpMUUNghf52mTKN+x+sVATYe+KXYWa/zIU8uaTc=;
  b=gpWlSerNIoMbbKZzKtc+3acx+0yFDb5Lx/thE2OxNR/t9gi7zxgNz1TR
   uY4e0DtkiC5lH11rKXRMa5Dc+fFOBsnZmLu4e6rJAP7AGeewCcf+WiEhB
   YcjbXMHRZJpIc2+3qQ2l/0qdjjjI6SzPOt5HpQSB99ZJdXU6lw2j8NDmr
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Ou4bAb5gwR8HbugNqZCY6L80s/5vZQlwYx17Si2ZQSabIhejkYZga+ZEBhFh0NflaS5SmM8j9G
 2lbAG56dwWx1isNVAYvCOqgxt34d2dcovmsG6Il6ytVOHDQkQApsXx9iW5s9TB1tz4HMJpN84P
 rj0RvBV5itFLOFRDx38fB/vNMSARjXXE2n2VSLihJvdBnpMzR9+I4rX6whvxGbieUEor54IDHb
 lCuA1l84pnoC25vsNMsmV7tiiyUVFccs0miBMJhTWhrTz7X13Lt+fadp04eZLbKHen6uWsa8dO
 mUY=
X-SBRS: 5.2
X-MesageID: 38624870
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38624870"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHspOr2Qkgc2WBQfGMEwoPT4ns9/350mgNLmfQyR3dg+ZGMlhW8YLb9Bjx2+EWX90fYT/apq3pOofgWpXoDOtHYQDJQ4YRYVP+adUc6t3I69e+JJHhmdW8I2//r78V175apUFzOfB0JpgV4z2tqNOoyyJH+zBOqz6+XrrQJxTNJX57GrS3w83bxgYA0qhwESlurLpAhxR4eddKQb4MwCEozp0DXqPNxxuYkXX4SGi+3sjwLBticNdbALVNfDTvPGgP9wx93ZO6lnwEZikyLZxNoIRIUAjZoIdA8O0eg9THYHTe4BPFGIhfSSccPizSlLr4ozzNjzb8aA8cOX74CGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RC7mBTH8yFWH4JJP7/8eNT3uB9uzY9/brAacouFZM8=;
 b=WzckbRv7x8G/+qxRwigMEPqXyCyZWtdDvNlDClTSA/GObR/BwRZDHvuIfhXcQoHV90ZP1W/a1inBTukguIAAk3acUnzY5mKgI2Gl8IvIT8uy0uYGuB559LHA4bUL3Khzg0tfSH2tTfJ368BloVoMr4P6MTfadvxF+EDCbykGNdK8ggcyw4jcI1fHhD2n4g+Oem++hbZtOI6K3caPNCuwdt2XYpXV8YT11+QhI75gzW9X9gsHWK8Urcz+khgELmuY5quoP1/G0FPJ2lI4wVsQ+hb1Ei32zl3eIataYos0YGMF56PGjBK6CS0wa2seHrLxx9AJ1pY4RgKvIUNhSMBktA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RC7mBTH8yFWH4JJP7/8eNT3uB9uzY9/brAacouFZM8=;
 b=CwbbPQP4AKfhpzAZIdypN+tK4EKTkdgnSN8TdozZUPPpEJmNEDOnp9uoidLcxBk8pFe3widwQFVZEFtzkbm+LBcrDpZPyX8dkOtBwdXIJlsaWqVwkMsSXE4/vBRFBfD6YHv4j3V0Fuj7qmB36p4OWP/FJE4QzXhc+Nt/6hx0dMw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>
Subject: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR behavior selection
Date: Mon,  1 Mar 2021 17:23:57 +0100
Message-ID: <20210301162357.76527-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0108.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c995f108-bcc2-4a84-021a-08d8dcce6d61
X-MS-TrafficTypeDiagnostic: DM6PR03MB4970:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4970BEB7D18352298250AD418F9A9@DM6PR03MB4970.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E8T4vxK3lpeBmmO/3GGjN7DK+SmyVtJtt5F5fyxZ3gWdjbMGsa46XkUGGxteud0yQ4Sf2r9H0dq2HURiwxTk1omA0MgKb2jKzdef5WPrEMv1DKdaGzTrgzHOBDeRcWoOVerRzkXNVigXW8NkdyWtXhpZNuZ37mbVETsublYTlQDqRMknTA0mB4ENKSX1IjYqGGUC0c9z3Czh2uJoRDuSkzntxQpQBhm3EPv4ticN1U29StA4MfTGsubaPgX6eQOFZkBN8ncnET6TsfG0wWR4ErIyaS0/0uuDHjBSI0P7lWwBXK7u6A4eXA5ZGhEx2d9T6WyySiQ4szgbqLUGpQSW1ywz06QennRAbRkVC3rFfDqUdssnCAiMb/Ozku/OSRuoQusSQgRRKjA3U2HxtDhLaNZQzt8YUAa0LDedinCk4f4v60j6sLXgc0zoC0dqk1nyqgH3MlVLbis5SuoZILOriot1WkCFTOqTjAiKVjxaYCMyuVskG/XoLILcmvLzB3vqFH8aeYzBv2C9/32l//tvTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(5660300002)(2616005)(36756003)(956004)(316002)(186003)(6496006)(4326008)(16526019)(26005)(83380400001)(8936002)(2906002)(6916009)(6666004)(66946007)(86362001)(478600001)(1076003)(54906003)(8676002)(66556008)(66476007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cVp4UWU0L0VtYW8wdjYxcXpkWmN6TEhESmVPS3RIM0tlODZuM1orMloya0t4?=
 =?utf-8?B?UFMrWnFVb0ZqcUtnWTNDOE9JcTN1MDV0WFg4cjlYRFdJVkpXek9Ic1JBRTBX?=
 =?utf-8?B?WFhuSSt0SS9oN2RLNWQ1ZmFLWDN5QW1iNXpXem94eFpqWTczZVJmMmtlNDBG?=
 =?utf-8?B?RFVmZ0ZQT0NqZjdHMjhsaFJIYlBsU2w0OElWVEVsQ29MbEFLVFB1OFhKd1lK?=
 =?utf-8?B?TENNWlY3RUVPNHpNVjBOcDZiUVVab2szVHdENnRtdzA3OGRoaDJNRndpa2t5?=
 =?utf-8?B?ZVQ5WktCS3pISVJWaDlwNjl2L3NxaExYV0hYbUhEYkpNbjduMmJMcEthdU4y?=
 =?utf-8?B?cU0yc0NUSGJQZlRxZmZvSlZWTGZNSUhjVDFxVTdZcmNMalhMT2RaTU1JeFd0?=
 =?utf-8?B?NjBaMDhjQzNiSG5XbmM5U1VYUXhrNWFPZXVKVkRROGNJdUZhbUEwRlJRYkVa?=
 =?utf-8?B?R1l0ZWJnallnL0IyaVZweVZaYWFmbzMzZG5UVjVMMHJEdXZobnVRV1RZNERF?=
 =?utf-8?B?MDA4V29jdlJ4YW9Bb3hvMi9sQ3krQ25aNlFaazgzdXVTM3k4MTNsSVh3NXRC?=
 =?utf-8?B?V05reG9GYlJnakx4TnA5c0NqRkFLa21BUm12TXpxOGxqNjRTdnFpaGROc0hH?=
 =?utf-8?B?aEZNOEw3TXJGVjcrTFlhS3RzaU15OU0wL05FUHVqU1FuYjQvWTZLY0tFTkVT?=
 =?utf-8?B?a2lQL1J0bkp6UE5UY3NjK0lYbWM4WDVML2N4MGpLeDE5dmw5Smt0Sk9IckZI?=
 =?utf-8?B?Vys2WTAvRVI1NnBrQ3hnS2VGMXBpSU93MVd1WTdLaTM3cm1UelZGK2NHOUtp?=
 =?utf-8?B?dll3M1doUHdpRzBSRk13blgwSWtOa3o3UFgydjdFWlFpNUxWY2w3dVZRS2Fh?=
 =?utf-8?B?NjhoQ24wMEhIZEhzNUJXWUdUam1vN3dKQW5yYW4yL2pMN0lxM216RFI1RUd3?=
 =?utf-8?B?cFd5K2RUdzF1cXhOYWVXTkw1R21qSkl4VnpKVVNRTGszUEo0QUtYOW1vbmlt?=
 =?utf-8?B?MGVsSjN0QVNPZ2VpdTNKTEt5MXdoYkpIVHJPUGNuL24wMnBKSCsyL29hb0hM?=
 =?utf-8?B?cnNXdGxNbHd0NVBjTjhETVBVSjgvZm1JY3pmb1E1Q3hlQ015VW85WDhoRUZt?=
 =?utf-8?B?MU9xUVEvdGFhMk5FSTBoVk1BbThlN0dhZEltUkdWcmd6Si84NVZkekovZUVn?=
 =?utf-8?B?ZWZBNzdTQVVBSGpmWTRRQU9UeFdYRXJicXNRbGhPaGM2OVYwWkZQdWxrVjBU?=
 =?utf-8?B?TWZEbW43eGhEWk9sWXA1S252ZDM3OU5pMUVVZzB2QmxVK0QzbUZUOGxHZVBo?=
 =?utf-8?B?ZU91SUh2V1g2M096cDc0czY0UTA5K1o4NENkeXhQQjhYbmlEUzVmcSswazdQ?=
 =?utf-8?B?bU1CTmRScmpUSGdvdE1qSE1JeWtsZTF4WFZQdVlyVVQydTlyWWNwL1Y1RHdJ?=
 =?utf-8?B?dm9aekpmTEFLZ08rdlhiRVovTjYyOTRBYWZKZmlBRGZHbDI5TDFmb0RIWENZ?=
 =?utf-8?B?OWlaSFBNZWRjcmUxcXY5L2pxRDduaDB1cnpleEdvT3dYa3I0RDVsOUk4cFd5?=
 =?utf-8?B?Sy8wZUlId0FlU1VYRUpCUFBzYmpubWFqeTk2d3cwbE5TK1Vqa1FrZzVsQlVa?=
 =?utf-8?B?NGg3SnYycCtsWCttcng2UGRwQ0xXeHFtM0lCQnF1SUxHSDhMWTQySWNacG54?=
 =?utf-8?B?cjZWTjREQ0U3VVhDaTZSclZlNEdKRzBOZGFXbU1FTkszWnllOTBMTStGQmdt?=
 =?utf-8?Q?3y7CVX+tw2EYfSJy4OkC57CbHt+nWbdXjPn+zVL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c995f108-bcc2-4a84-021a-08d8dcce6d61
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 16:24:03.0766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4duPEQ88rBz2JAxM9VaXSh6hBVIbSkUiTn7jQuj4te+kkEg58QUnRiLTLsCqCIKpQQ+WH7bJSl4qUZfaUyt09Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4970
X-OriginatorOrg: citrix.com

Introduce an option to allow selecting the legacy behavior for
accesses to MSRs not explicitly handled. Since commit
84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
handled by Xen result in the injection of a #GP to the guest. This is
a behavior change since previously a #GP was only injected if
accessing the MSR on the real hardware will also trigger a #GP.

This seems to be problematic for some guests, so introduce an option
to fallback to this legacy behavior. The main difference between what
was previously done is that the hardware MSR value is not leaked to
the guests on reads.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
Note that this option is not made available to dom0. I'm not sure
whether it makes sense to do so, since anyone updating Xen to such
newer version will also likely pair it with a newish kernel that
doesn't require such workarounds.

RFC because there's still some debate as to how we should solve the
MSR issue, this is one possible way, but IMO we need to make a
decision soon-ish because of the release timeline.

Boris, could you please test with Solaris to see if this fixes the
issue?
---
 docs/man/xl.cfg.5.pod.in          | 11 +++++++++++
 tools/include/libxl.h             |  8 ++++++++
 tools/libs/light/libxl_types.idl  |  2 ++
 tools/libs/light/libxl_x86.c      |  5 +++++
 tools/xl/xl_parse.c               |  3 +++
 xen/arch/x86/domain.c             |  3 +++
 xen/arch/x86/hvm/svm/svm.c        |  9 +++++++++
 xen/arch/x86/hvm/vmx/vmx.c        | 11 +++++++++++
 xen/arch/x86/pv/emul-priv-op.c    | 10 ++++++++++
 xen/include/asm-x86/domain.h      |  3 +++
 xen/include/public/arch-x86/xen.h |  3 +++
 11 files changed, 68 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 040374dcd6..78dadcdfdd 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2861,6 +2861,17 @@ No MCA capabilities in above list are enabled.
 
 =back
 
+=item B<msr_legacy_handling=BOOLEAN>
+
+Select whether to use the legacy behaviour for accesses to MSRs not explicitly
+handled by Xen instead of injecting a #GP to the guest.  Such legacy access
+mode will force Xen to replicate the behaviour from the hardware it's currently
+running on in order to decide whether a #GP is injected to the guest.  Note
+that the guest is never allowed access to unhandled MSRs, this option only
+changes whether a #GP might be injected or not.
+
+=back
+
 =back
 
 =head1 SEE ALSO
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index a7b673e89d..3bf6aded97 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -495,6 +495,14 @@
  */
 #define LIBXL_HAVE_VMTRACE_BUF_KB 1
 
+/*
+ * LIBXL_HAVE_MSR_LEGACY_HANDLING indicates the toolstack has support for
+ * switching the MSR handling in the hypervisor to legacy mode, where #GP is
+ * only injected to guests for unhandled MSRs if accessing the MSR on the
+ * physical hardware also triggers a #GP.
+ */
+#define LIBXL_HAVE_MSR_LEGACY_HANDLING 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 5b85a7419f..5bb12bc70d 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -644,6 +644,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                ("vuart", libxl_vuart_type),
                               ])),
+    ("arch_x86", Struct(None, [("msr_legacy_handling", libxl_defbool),
+                              ])),
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
     ("altp2m", libxl_altp2m_mode),
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 58187ed760..4b2b5d69a6 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -19,6 +19,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         abort();
     }
 
+    config->arch.domain_flags = 0;
+    if (libxl_defbool_val(d_config->b_info.arch_x86.msr_legacy_handling))
+        config->arch.domain_flags |= XEN_X86_LEGACY_MSR_HANDLING;
+
     return 0;
 }
 
@@ -809,6 +813,7 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
                                               libxl_domain_build_info *b_info)
 {
     libxl_defbool_setdefault(&b_info->acpi, true);
+    libxl_defbool_setdefault(&b_info->arch_x86.msr_legacy_handling, false);
 }
 
 int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1893cfc086..fc79b6cc83 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2741,6 +2741,9 @@ skip_usbdev:
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
                         &c_info->xend_suspend_evtchn_compat, 0);
 
+    xlu_cfg_get_defbool(config, "msr_legacy_handling",
+                        &b_info->arch_x86.msr_legacy_handling, 0);
+
     xlu_cfg_destroy(config);
 }
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 6c7ee25f3b..28805d50b8 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -852,6 +852,9 @@ int arch_domain_create(struct domain *d,
 
     domain_cpu_policy_changed(d);
 
+    d->arch.msr_legacy_handling = config->arch.domain_flags &
+                                  XEN_X86_LEGACY_MSR_HANDLING;
+
     return 0;
 
  fail:
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b819897a4a..b535c5927a 100644
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
+        if ( d->arch.msr_legacy_handling && !rdmsr_safe(msr, tmp) )
+        {
+            *msr_content = 0;
+            break;
+        }
         gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
         goto gpf;
     }
@@ -2151,6 +2157,9 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         break;
 
     default:
+        if ( d->arch.msr_legacy_handling && !rdmsr_safe(msr, msr_content) )
+            break;
+
         gdprintk(XENLOG_WARNING,
                  "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
                  msr, msr_content);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index faba95d057..7707ae8cbc 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3114,6 +3114,7 @@ static int is_last_branch_msr(u32 ecx)
 static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
 {
     struct vcpu *curr = current;
+    uint64_t tmp;
 
     HVM_DBG_LOG(DBG_LEVEL_MSR, "ecx=%#x", msr);
 
@@ -3195,6 +3196,12 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
             break;
         }
 
+        if ( curr->domain->arch.msr_legacy_handling && !rdmsr_safe(msr, tmp) )
+        {
+            *msr_content = 0;
+            break;
+        }
+
         gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
         goto gp_fault;
     }
@@ -3497,6 +3504,10 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
              is_last_branch_msr(msr) )
             break;
 
+        if ( v->domain->arch.msr_legacy_handling &&
+             !rdmsr_safe(msr, msr_content) )
+            break;
+
         gdprintk(XENLOG_WARNING,
                  "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
                  msr, msr_content);
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index e5a22b9347..ecf98c4a05 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -875,6 +875,7 @@ static int read_msr(unsigned int reg, uint64_t *val,
     const struct domain *currd = curr->domain;
     const struct cpuid_policy *cp = currd->arch.cpuid;
     bool vpmu_msr = false;
+    uint64_t tmp;
     int ret;
 
     if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
@@ -986,6 +987,12 @@ static int read_msr(unsigned int reg, uint64_t *val,
         }
         /* fall through */
     default:
+        if ( currd->arch.msr_legacy_handling && !rdmsr_safe(reg, tmp) )
+        {
+            *val = 0;
+            return X86EMUL_OKAY;
+        }
+
         gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
         break;
 
@@ -1148,6 +1155,9 @@ static int write_msr(unsigned int reg, uint64_t val,
         }
         /* fall through */
     default:
+        if ( currd->arch.msr_legacy_handling && !rdmsr_safe(reg, val) )
+            return X86EMUL_OKAY;
+
         gdprintk(XENLOG_WARNING,
                  "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
                  reg, val);
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 3900d7b48b..213557fc2c 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -437,6 +437,9 @@ struct arch_domain
     /* Mem_access emulation control */
     bool_t mem_access_emulate_each_rep;
 
+    /* Legacy handling of MSR accesses. */
+    bool msr_legacy_handling;
+
     /* Emulated devices enabled bitmap. */
     uint32_t emulation_flags;
 } __cacheline_aligned;
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index 629cb2ba40..0a6b40bb89 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -304,6 +304,9 @@ struct xen_arch_domainconfig {
                                      XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
                                      XEN_X86_EMU_VPCI)
     uint32_t emulation_flags;
+
+#define XEN_X86_LEGACY_MSR_HANDLING (1u << 0)
+    uint32_t domain_flags;
 };
 
 /* Location of online VCPU bitmap. */
-- 
2.30.1


