Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 802BA3751DC
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 11:58:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123399.232723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lealL-0006k6-4K; Thu, 06 May 2021 09:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123399.232723; Thu, 06 May 2021 09:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lealL-0006hr-0b; Thu, 06 May 2021 09:57:43 +0000
Received: by outflank-mailman (input) for mailman id 123399;
 Thu, 06 May 2021 09:57:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HEOH=KB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lealI-0006hl-Te
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 09:57:41 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 788cfdf2-b699-4c15-87e7-ea6064af0ac3;
 Thu, 06 May 2021 09:57:38 +0000 (UTC)
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
X-Inumbo-ID: 788cfdf2-b699-4c15-87e7-ea6064af0ac3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620295058;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=/v5wimBLgevMxM2ps68tYaaP25TA6n8o1lF4wq9Fz6M=;
  b=AiepEDcz1BmiuTQa+dir2AzC1I0ma0CdqitMDHQLAP41Gzfcs5oDawCR
   IxjZr5P9nhSdGdlYpTQ/J9QUE8MaQAWThQjs4gCo2k9KTM3pIA6d3JkZs
   YshzEGQsvNNj996EwlWNGiKGAmqnGtjHOVQFQXPpbKqY7YnL8zsAp5KWk
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 563QkYKpxDBVqFMi8GWC6tPXjwxU45+2KA0DD+hPvg6LPgnknRrJ9NtDZ2eqohkxLtxvUVzlOx
 O1BWJofwqkmQ+imA8EhZtLeNaMn6mij2yTvYxjHj64xkZLabdsCVyf7HABCCATT3/6qDuL2Xni
 05haO7HZ4NlnoE7aDeDcmB/yOv0WhG0CK35FNyjt71l7tOElF6DL1MiQpB9G56Onyr+EhreL7H
 FBkdVEsl3SEcXqbPO3DMq5JNWnfNKmSdKJsmjoMYts59KjUxOfNfwsDMsqbSyZVT3NEOKZ6wTj
 SfI=
X-SBRS: 5.1
X-MesageID: 43207016
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:a1pVSKszdgfhtfbe3a03BzVD7skCeoMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK6yXcT2/htAV7CZnidhILMFuBfBOTZskTd8kHFh4tgPM
 RbAtlD4b/LfCBHZK/BiWHSebtQo6jkgdOVbI/lvglQpGpRGsddBmlCe2Km+hocfng4OXN1Lu
 vQ2iIpzADQNUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZebxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESjtu+RXvUjZ1S+hkF2nAn2g2xa1e
 Uk4i1QcPib0kmhPl1c+nDWqk3dOF9E0Q6T9bea6UGT6fARCghKTPaoKOpiA2zkAnEbzaRBOZ
 RwriukXqpsfGH9dRvGlqz1vmlR5zGJSFoZ4KUuZi9kIMEjgIE4l/1owKoDKuZ9IMu90vFgLN
 VT
X-IronPort-AV: E=Sophos;i="5.82,277,1613451600"; 
   d="scan'208";a="43207016"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCS8INC8u/MLjkAAF8q6RILCjOPKrrXv1Fp7TghRslcPBc8al2Ndy2YPyg8ddKJOheKOPwpaKFtWhYVjQkFS9dGChMePL7RHFOtYcklETRQPrmysi+vKt0exG2OSvWm2WxpiQjdiuokvd7WxFc41v0rr+jZX5L3N4e9OgBJfS/6Pqbp8ad+B8Xk4qjI/eUqYLphz29lJg4oikM+ZAfQNPmoRhBG4gVzY9jfZJAfHVax/Z1D8ITCDH6DF1EFkgUABULUn2uVy5aDMr8KU4kTDsNONB7rOOGX0Wv+dPyMamNY2jLQrjDtrzHbKjetKMjr5fdkSE8w0VZTUxrVmX8hyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+pCfK3ruyr0u0q8biCc2bOuDQxymNsb+FKpc4zeygM=;
 b=N9pvnWGTngoimklzXv/Pwv7etY3LEXxmnvrUMhLdtidY26KJ43+aDZJMvexEkj9D+m8RXJEG5PfvxkPnKCsdwOsqDEeCzG7N8zUkToDDrKWGel0CMapDHN9PQ46jUwHCav3GqUyIGCTcYJdmGdd7GMwKcVnBE+mALD+YIMk6JGm1t9zWrIfRqwciNBAwf7Gv/6U4JRr49C5TNO9VGd5DnsK+KUGIJv7kmTR/yaqTtBDI6hnbcbnuReV8A0OrKmBP5AQ8S/Y1nJdXxupLIOw4HSVmXzVSeQ85l0O5H686uqin3lE008tA4QWRukpTpKZ+erE5z10li0NoN9shDU7pFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+pCfK3ruyr0u0q8biCc2bOuDQxymNsb+FKpc4zeygM=;
 b=kCyZqBt9sA1q2vjrIdweAZdyR9e30j7Pn40xqE6dK9HoMS0qSwDK8OFp3/H04hdUT0cn9wJlfQp2GboiN4VabTrGCLaZeoyLxZBFnuM1GrXLPmLK6tOJ6mk3EYE2lrEdjlb2slZYRNDq+QeR1UGSgDEHCuw8Lb2aak4bRUD0RMA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v2] tools/libs: move cpu policy related prototypes to xenguest.h
Date: Thu,  6 May 2021 11:57:05 +0200
Message-ID: <20210506095705.1796-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0018.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13365b05-6bd8-466e-a27f-08d910755411
X-MS-TrafficTypeDiagnostic: DM6PR03MB5065:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB50650E02FA5D4268CBB0B2318F589@DM6PR03MB5065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oZw/w+Z4oTFLk1fQRpmn5T9pyqefvW3x8nlGoFOBWl2DDxCTXoohP+/MFBwWsHLNXts85BFIsZVPyDyWNbpYbs40wh4Akb2n901trH01IRrGKoxu88A31VRGeEnsdMp5zkU9sZlVxs/fcUpXquODJLIC7iNDwCJZAZKfQIE1NMKj2/rYV+Js9bxPWCBoY3pmUSK2K54DrPITsKzmUODT/KPaH9ORSXW9juN3C0jZfd7bKL9VmmO7z4OUEDXNcz/NrL1U+V9XinftwUG+zUmqC89dmtHsgd+Hw73TYvnDFftvkIMM0k1x0hpVTL6fmY1OCgZgIHKiuxHX0/pZvik6yWtHHijrVhC5/Mv+2g+dinCiFFuwYSaMehr8bIpeKkKOF5kyLzpDhGj6LP1+g5oBYeYJzD+ZBe2gaMEEsUmNCb/vm8IBvsWJ/A/E8uQFDobQmrCt7XFbvBjOHFdr9U+l0g8tBPGNsSLdHx4fQv7WPi68w33GHe8ThVqBhHx8mhk8ttrT8LKZhT+rINXL8592NF0vxQ1xO4EyMsBhMyhkOiLyLHJ7Rb5wvfQEVYtDLb0wb6sT+qN+sLPtkfR0dG6D03kq0Mai6Xo1dhi0/FmyVhI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(26005)(6666004)(6486002)(1076003)(86362001)(8936002)(8676002)(478600001)(38100700002)(36756003)(66946007)(66476007)(54906003)(316002)(66556008)(16526019)(186003)(2616005)(5660300002)(2906002)(956004)(6916009)(4326008)(6496006)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T05IenNnbjNMTEFURTE3VGlOeVFybzh6c1Zsb1k2WEkxWXhXY1JhNXJUZHBn?=
 =?utf-8?B?aUx4dXRUUUIyMGprVEZQek11VHhPa090OW4zWGVkV0VpanhaVWNUeU85eFAz?=
 =?utf-8?B?ZjFDaUxKZTRlNUsyUW8zbnNGa05ONnVDckJlZ1dZRkJ6VG9IeVlzWFZoRytp?=
 =?utf-8?B?T3h6VUFMS0NGVzJIRGFGRzJRQ2hFazlIbDhYSFZiTGxyRE44QVIrNlJFTjdi?=
 =?utf-8?B?bFczSVRWdmU0N0MrdVpGT2pldEROZENIZGI3VW9wbzNDbnB6cUxaenVZclVX?=
 =?utf-8?B?aDZEaWN4czdpcWN0RHhyMUZQRStpT2FuUVQvSDFBcXBNUzE2dXhHQ1E4Tk4x?=
 =?utf-8?B?UTlUODd3bzZ4VStWRXY5eS9SQUFkSVVRYWZEM0NPaG5ZNmcwRUpScDFuNTNB?=
 =?utf-8?B?T2tEc2hkS2wyaEFPUGJiM2JBb1RIZE5NbWZ0OCtVRlVmc2l5S29VSVNMVmhO?=
 =?utf-8?B?cmRmaWwyNTdrS2svSGJ5QVBMbmpCY0V1SmRwZjIzSTVjZW5Jc1ZPbXFQdVNw?=
 =?utf-8?B?MkRHM3VaRDQ2eDRTNk52UFRucVF0RllWZmViNldRTU1Sd09weHU2WmNqcHhC?=
 =?utf-8?B?bktad0xnalVDNVA0c284ZXVsaVp5Vm1RUzdHNjQ2TGNOZTF4NWsvcWIzemts?=
 =?utf-8?B?YzNCWXhvV0dMNFcwNjkrMEEvS2R2YnZPTTNuakMveUNoUjA0L0hnTTZPSUdi?=
 =?utf-8?B?M1JVRlNLWlZMbGVOSXNRZjgvVllidjdsK09vUWpLUjg1V1FEdHc4bnFQNUJw?=
 =?utf-8?B?ZHc4Zmk3d1hmQzlrY1FUcVA0WWsxRGZqNzBFbDd0ZTNqVXFpNmFLSGlqVTBP?=
 =?utf-8?B?TUtyMEVNeGhaUTdLbHRzWjNwemI5TDFzWHBpaXI5eGU1V1RZSFNoMHN5UmZD?=
 =?utf-8?B?Ty95VmhRNy9yNHNGeC8wL3RNc2xlaS8rbVFFaFV0TFZOZCtjZEtqNnpSUkpB?=
 =?utf-8?B?Zm1PRERYTy94cE5aWUYva3VsRVVMdkNvdmIxcGxCL0hhTnVJLzVXTVBqbTRm?=
 =?utf-8?B?MEE3Wm8yWkJZdDd2MDlkUXUyWk9EL0RlUmdKK2xFckZGbFpPRSsxUWNrb3Jx?=
 =?utf-8?B?NVVpT3oxUHNDcFpKNHY3WWEzOUpGTVFQeFg3M0pNY1pqWk5qdEVOaVFnRmV1?=
 =?utf-8?B?Ym1nWW0zekh4Zk44SUw5M01xUGZPU0ZwQitOMzYzMzVuWkJuZWpORThYRSs3?=
 =?utf-8?B?TEk2elJ3M05DMDVDL3dUZzFVc1NKcytlZlJRUFQzbmRUZVhtREg0WjNpalI4?=
 =?utf-8?B?Q2kxMWlidjFHb25IUXpIWkFGSGRBSzF6aVo5ZjlZRzdpSkQwc0pLK2tqckkv?=
 =?utf-8?B?RThjaURzdHFRMHdGMlFDZFJjeCtFZHBNbE93OGhGTzJKUnM5aFRNbU1mSHNn?=
 =?utf-8?B?L1VYU3Y2UndxWW9Zc09EeGhUK3pMNW82UFVaYm1oWjFDSitRTzh0UzFHQ2NI?=
 =?utf-8?B?RVZlNVY2WGwvRXJtREZPRnM0RW5LQ0NPVjQ3a01hMWROaFRTM0tDdktYd3Bq?=
 =?utf-8?B?bjA0a1g5T2pOdjloK1B1cElWSVE4YVNXeUtNaXRST1ZhRXRIc21lSFBlN2F0?=
 =?utf-8?B?NlZlUWJHd3hRRnR6QU1nZzM4bU85MGhqazNCU3pTdDRzazd0by9hUTg5anJ0?=
 =?utf-8?B?SEVOanIrb3Y1K1NsR1hFbUQ5Q0NsN2o1M1Z0NytObkw0ZFdPWDc0Tjc3SjlZ?=
 =?utf-8?B?Vnl0OHFqSEJWbDAvUVEyRVdVRVkxVHBMbDNnODVjbWFjVnJ1T0ZISGs5Snps?=
 =?utf-8?Q?yQUX7CYt3bCjJgGP+KhpOUmj/Fvos1AP41mqZKN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13365b05-6bd8-466e-a27f-08d910755411
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 09:57:15.8540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Em9ozvofMDww6tnGjlqigcnuB6xKbCKEwgvYg+H2TMV8E2EL/cJwoYmzqgPk6o3+Q9/NAQqYDgQr16/Oxb4PwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5065
X-OriginatorOrg: citrix.com

Do this before adding any more stuff to xg_cpuid_x86.c.

The placement in xenctrl.h is wrong, as they are implemented by the
xenguest library. Note that xg_cpuid_x86.c needs to include
xg_private.h, and in turn also fix xg_private.h to include
xc_bitops.h. The bitops definition of BITS_PER_LONG needs to be
changed to not be an expression, so that xxhash.h can use it in a
preprocessor if directive.

As a result also modify xen-cpuid and the ocaml stubs to include
xenguest.h.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v1:
 - Include xenguest.h in ocaml stubs.
 - Change BITS_PER_LONG definition in xc_bitops.h.
---
 tools/include/xenctrl.h             | 55 ----------------------------
 tools/include/xenguest.h            | 56 +++++++++++++++++++++++++++++
 tools/libs/ctrl/xc_bitops.h         |  6 +++-
 tools/libs/guest/xg_cpuid_x86.c     |  3 +-
 tools/libs/guest/xg_private.h       |  1 +
 tools/misc/xen-cpuid.c              |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c |  1 +
 7 files changed, 65 insertions(+), 58 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 58d3377d6ab..e894c5c392d 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2589,61 +2589,6 @@ int xc_psr_get_domain_data(xc_interface *xch, uint32_t domid,
                            uint64_t *data);
 int xc_psr_get_hw_info(xc_interface *xch, uint32_t socket,
                        xc_psr_feat_type type, xc_psr_hw_info *hw_info);
-
-typedef struct xc_cpu_policy xc_cpu_policy_t;
-
-/* Create and free a xc_cpu_policy object. */
-xc_cpu_policy_t *xc_cpu_policy_init(void);
-void xc_cpu_policy_destroy(xc_cpu_policy_t *policy);
-
-/* Retrieve a system policy, or get/set a domains policy. */
-int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
-                             xc_cpu_policy_t *policy);
-int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
-                             xc_cpu_policy_t *policy);
-int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
-                             xc_cpu_policy_t *policy);
-
-/* Manipulate a policy via architectural representations. */
-int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *policy,
-                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
-                            xen_msr_entry_t *msrs, uint32_t *nr_msrs);
-int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
-                               const xen_cpuid_leaf_t *leaves,
-                               uint32_t nr);
-int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
-                              const xen_msr_entry_t *msrs, uint32_t nr);
-
-/* Compatibility calculations. */
-bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
-                                 xc_cpu_policy_t *guest);
-
-int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
-int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
-                          uint32_t *nr_features, uint32_t *featureset);
-
-int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
-                           uint32_t *nr_msrs);
-int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
-                             uint32_t nr_leaves, xen_cpuid_leaf_t *leaves,
-                             uint32_t nr_msrs, xen_msr_entry_t *msrs,
-                             uint32_t *err_leaf_p, uint32_t *err_subleaf_p,
-                             uint32_t *err_msr_p);
-
-uint32_t xc_get_cpu_featureset_size(void);
-
-enum xc_static_cpu_featuremask {
-    XC_FEATUREMASK_KNOWN,
-    XC_FEATUREMASK_SPECIAL,
-    XC_FEATUREMASK_PV_MAX,
-    XC_FEATUREMASK_PV_DEF,
-    XC_FEATUREMASK_HVM_SHADOW_MAX,
-    XC_FEATUREMASK_HVM_SHADOW_DEF,
-    XC_FEATUREMASK_HVM_HAP_MAX,
-    XC_FEATUREMASK_HVM_HAP_DEF,
-};
-const uint32_t *xc_get_static_cpu_featuremask(enum xc_static_cpu_featuremask);
-
 #endif
 
 int xc_livepatch_upload(xc_interface *xch,
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 217022b6e76..03c813a0d78 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -719,4 +719,60 @@ xen_pfn_t *xc_map_m2p(xc_interface *xch,
                       unsigned long max_mfn,
                       int prot,
                       unsigned long *mfn0);
+
+#if defined(__i386__) || defined(__x86_64__)
+typedef struct xc_cpu_policy xc_cpu_policy_t;
+
+/* Create and free a xc_cpu_policy object. */
+xc_cpu_policy_t *xc_cpu_policy_init(void);
+void xc_cpu_policy_destroy(xc_cpu_policy_t *policy);
+
+/* Retrieve a system policy, or get/set a domains policy. */
+int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
+                             xc_cpu_policy_t *policy);
+int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
+                             xc_cpu_policy_t *policy);
+int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
+                             xc_cpu_policy_t *policy);
+
+/* Manipulate a policy via architectural representations. */
+int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *policy,
+                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
+                            xen_msr_entry_t *msrs, uint32_t *nr_msrs);
+int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
+                               const xen_cpuid_leaf_t *leaves,
+                               uint32_t nr);
+int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
+                              const xen_msr_entry_t *msrs, uint32_t nr);
+
+/* Compatibility calculations. */
+bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
+                                 xc_cpu_policy_t *guest);
+
+int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
+int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
+                          uint32_t *nr_features, uint32_t *featureset);
+
+int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
+                           uint32_t *nr_msrs);
+int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
+                             uint32_t nr_leaves, xen_cpuid_leaf_t *leaves,
+                             uint32_t nr_msrs, xen_msr_entry_t *msrs,
+                             uint32_t *err_leaf_p, uint32_t *err_subleaf_p,
+                             uint32_t *err_msr_p);
+
+uint32_t xc_get_cpu_featureset_size(void);
+
+enum xc_static_cpu_featuremask {
+    XC_FEATUREMASK_KNOWN,
+    XC_FEATUREMASK_SPECIAL,
+    XC_FEATUREMASK_PV_MAX,
+    XC_FEATUREMASK_PV_DEF,
+    XC_FEATUREMASK_HVM_SHADOW_MAX,
+    XC_FEATUREMASK_HVM_SHADOW_DEF,
+    XC_FEATUREMASK_HVM_HAP_MAX,
+    XC_FEATUREMASK_HVM_HAP_DEF,
+};
+const uint32_t *xc_get_static_cpu_featuremask(enum xc_static_cpu_featuremask);
+#endif /* __i386__ || __x86_64__ */
 #endif /* XENGUEST_H */
diff --git a/tools/libs/ctrl/xc_bitops.h b/tools/libs/ctrl/xc_bitops.h
index f0bac4a071d..4a776dc3a57 100644
--- a/tools/libs/ctrl/xc_bitops.h
+++ b/tools/libs/ctrl/xc_bitops.h
@@ -6,7 +6,11 @@
 #include <stdlib.h>
 #include <string.h>
 
-#define BITS_PER_LONG (sizeof(unsigned long) * 8)
+#ifdef __LP64__
+#define BITS_PER_LONG 64
+#else
+#define BITS_PER_LONG 32
+#endif
 
 #define BITMAP_ENTRY(_nr,_bmap) ((_bmap))[(_nr) / 8]
 #define BITMAP_SHIFT(_nr) ((_nr) % 8)
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 1ebc108213d..144b5a5aee6 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -22,8 +22,7 @@
 #include <stdlib.h>
 #include <stdbool.h>
 #include <limits.h>
-#include "xc_private.h"
-#include "xc_bitops.h"
+#include "xg_private.h"
 #include <xen/hvm/params.h>
 #include <xen-tools/libs.h>
 
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index 8f9b257a2f3..db93521c567 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -27,6 +27,7 @@
 #include <sys/stat.h>
 
 #include "xc_private.h"
+#include "xc_bitops.h"
 #include "xenguest.h"
 
 #include <xen/memory.h>
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index d4bc83d8c92..2b1a0492b30 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -8,6 +8,7 @@
 #include <inttypes.h>
 
 #include <xenctrl.h>
+#include <xenguest.h>
 
 #include <xen-tools/libs.h>
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index d05d7bb30ec..6e4bc567f53 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -32,6 +32,7 @@
 
 #define XC_WANT_COMPAT_MAP_FOREIGN_API
 #include <xenctrl.h>
+#include <xenguest.h>
 #include <xen-tools/libs.h>
 
 #include "mmap_stubs.h"
-- 
2.31.1


