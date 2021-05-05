Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B5E373923
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 13:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123009.232065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leFWZ-0007bK-9t; Wed, 05 May 2021 11:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123009.232065; Wed, 05 May 2021 11:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leFWZ-0007YI-6d; Wed, 05 May 2021 11:17:03 +0000
Received: by outflank-mailman (input) for mailman id 123009;
 Wed, 05 May 2021 11:17:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTpK=KA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leFWX-0007YB-LV
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 11:17:01 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24d0530d-f50a-4d6b-aece-2cebf12cb607;
 Wed, 05 May 2021 11:17:00 +0000 (UTC)
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
X-Inumbo-ID: 24d0530d-f50a-4d6b-aece-2cebf12cb607
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620213420;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=IEv5J0a3Yb64RUsVoPmC0OSXkoGKJxR6yV+Y6hxAXDE=;
  b=haKk5AOflyseaZN2CubrTt4WZQmdJtr8/+N5Huq+9yVaQ49i2J6XlFmg
   rrJOgcDoTqPLORa9AzaoMQrPY30ouf1gcEy1NeR2SPAH23VMpy40RUZl+
   nV0Irxa4Hu2GN4QIz4AJZxTLitRgsaQd1wOGDG2AuG8DFPj8NDd5i5VYG
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dB/AvBxhu0khi0C/B41B7S4F99/9K4G4CCb3rQT2Vnw9kuW6f/6ERrO/H0fxVsNTg9wFLKjF3U
 V/KR81VPmowsDIFtclloC+FMgZNu7+SK1zqfDvh2qu9pJ8a5SFrL+H9HlirriqbNvm8S90bQQq
 7sFkJvtSSScfvJmVO9aYQjhfdDGvStnTzlkSv8bh7dZ6qlQtf8JY586FGxqbS+PXL6ay4TZ0Rt
 JsWgHdprNVwFTTMJrNZftvg2aeig2yafbWTzrR8tIi3XroaYlu/to8IOr4GjQ0KPnMWzuSiGi7
 bVI=
X-SBRS: 5.1
X-MesageID: 43490432
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Q6u+7q/nsJ5mOSJ01X5uk+EKdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnXnKQU3aA6O7C+UA76/Fa5NY0K1/qH/xTMOQ3bstRc26
 BpbrRkBLTLZ2RSoM7m7GCDfOoI78KA9MmT69v261dIYUVUZ7p77wF/Yzzrd3FeYAVdH5I2GN
 69y6N81lmdUE8aZMi6GXUJNtKrz7H2vanrfAIcAFof4BSO5AnC1JfBDxOa0h0COgk/o4sKzG
 6tqW3Ez5Tmid6X4Fv212jf75NZ8eGRt+drNYi3peU+bhnpggasTox9V7OFpyBdmpDS1H8a1O
 Pijj1lE8Nv627AXmzdm2qT5yDQlAwAxlWn6ViEjWDtqcb0LQhKdfZptMZiXTbyr28D1esMt5
 5j7iaimLd8SS7kpmDb4ePFUhl7/3DE2kYKoKoooFF0FbcFZKQ5l/14wGplVK0uMQjd844dHO
 xnHKjnlYxrWGLfVXzfs2V1qebcJ0gbL1ODSkgGjMSfzyJbqnB/11cZ38wShB47heoAd6U=
X-IronPort-AV: E=Sophos;i="5.82,274,1613451600"; 
   d="scan'208";a="43490432"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYFHTpQUlcp69nTmQ/bYYFGoG4He246QuzuVgp2R5kGBlD5ky3bCpmsfFybo90Ct3DYiAamZ4RINDmOMc5JcJXt8CEwgc4Flxy6hBAw0ycwmhRPKRFtEhN1YkEbhVwl8c9CBrTauUWlo1iyQw3jxRLnfjn29EJuI8owKxVJwUUNCGLOeqAiayL/PAVsc5162i43VL4zma94itrRAzdj95KwqKE0dLeOk5yqfLFOyJmu5qrLXYzYVh4wVMizPKpSYo+fFrx+ahcX6agfykXQMGfLAhH8H/5/4UOXrWL1UNCBcfy/N61pBeYejCDDCQL6RgNUiz6Ua6rshhp9amY6LJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnlliABA1MOSnvjHoZCf/ytWk5CO5Q2ObzTDCNg3FPA=;
 b=MFfA5Vn9CcCtGZ9IPRDS3SVFDJTleQLEDqypFuNmo8ReuTLrvwg/y/K3jUozuDgsHyTXq0ETA8ggblNWM3xxUPsuH0lhhiVZDw21m228GKsKfx2IkUUr0ODOmP90HPljo0cvtu1Jp9nwYUC1LmvzyxoXilYuA2StVMz0wXwM7ZGtIAXIxuwxGjgv8P022hxQq4ttleGQPTTV6fFyJdo74ehjhCjJ1chHL3SYxT/KsEfjzpkrkORd2+H5Y90RvxsUl9COSXkd464SGsVYJ0i7amZ8B5bU/XWExt67NnGSQw0eg4+fcP4ViL/fis4S5ugWNGJkqnu41q8lAbt5/5Gauw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnlliABA1MOSnvjHoZCf/ytWk5CO5Q2ObzTDCNg3FPA=;
 b=cLj9mZOf32vmI1OxqulM5uTnmOyxBCtwNNJAr5RjP0nayVYFpfE7/XzxP+JGLl7p7C7ZxLMqdlRFcNhowQHsCyDYXFGdIswBbToXb5JqeSZVa3JwNjzuZUjy/NAseEh9YMnHOIeBioM8pWW1bcKIKQpkkCAYtuiPIl1pHHue/MI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [PATCH] tools/libs: move cpu policy related prototypes to xenguest.h
Date: Wed,  5 May 2021 13:15:08 +0200
Message-ID: <20210505111508.82956-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0119.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfda7b39-9b26-471d-7cb7-08d90fb74ab2
X-MS-TrafficTypeDiagnostic: DM6PR03MB5273:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB52731205A0F9D6C2714F489D8F599@DM6PR03MB5273.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 49MG4m3Fim++wrIzn2krFsGVwfh4h2OXopMFbke8XmBFay3t1mNi7k9SECf2ilUUIbHTGjmPnEgcezrI/aENxgytLZUG14pVH9M7/VI8u0uueuMUzLmLRZJGxPFjcClyNwjg6EOiJPV/rHx/IQKeV99LCchS8YOVj0+kgllBtHt7moYCS1aO4/IlzYC3KFvHT1PhR+7Qf0LbHxoFYaYf5mo1cFQ2Z+nOoHvir4chJPQogZacumTSVgbtkoHN9fGXuvSPPadPnjaUoG4Bj396veLKeyJZ5zwGdcTYRWdGfONnGCo9qi8ZOseSZJqdoHmVQCgkmJSLpkC/Xz7Y07+QxErvDq8FxAivE2PJd6SHZaP8stD3/BrRpEma5QipQWDCijnQGiG0w+DyTQ0b3s1PrxGqEDHw8luSegrrXolGsNT9WJ8iDts7sI1rSbKbpRVlxYE1FEgl0L9n5JYHTTraH1nKg7W0qz6Q5J31oFXrCtzpqZv0I/M2/xagYbg9sZgVCe87CvrTxtAe12pCznelrB0mj23/NEC6QvPKCo7bgy/RjBRLvkxjqq8jWbJmiAQTmA3DGaNWBNjFQ2Q8ozFtj7QLyWeIgXOeDZz9MMCOc6k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(66946007)(66476007)(66556008)(36756003)(6496006)(956004)(2616005)(5660300002)(316002)(6486002)(4326008)(478600001)(26005)(54906003)(186003)(16526019)(1076003)(6666004)(86362001)(107886003)(6916009)(83380400001)(2906002)(8936002)(38100700002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QThkbzdmUG92TjV5ZmpTUmxPYnB4SzVHcG0wZWpTcDloTzhld1l2eEtjYUtG?=
 =?utf-8?B?REpTNE9qaDczNHN1Kzllb3FqNWdybFRQUThvdlE3V3pRdWY3TG5nN2VBekxR?=
 =?utf-8?B?L0k4eVJYZ29iUnRDYmRZSW9tUzV4bmtGQUlHLzBzZi9YMklKckFmQ2VtOUVk?=
 =?utf-8?B?UnJzVGRlZGJFUTJCRjNMVEhZU2swYUtwaEJZeENXbjVSTmhLUnpybUhYY2Yv?=
 =?utf-8?B?NW9nU1BUZlRLcGFFaHg4bUNEbmNDSDByWUlOUlorV0Jpd3hRV25Gc3NzK0Ny?=
 =?utf-8?B?RkNQNnJJcFVCZTNVczZDbHR1eDZqSERNZDVpUjhWKzFUQ0gzcC9lZmtJMkE4?=
 =?utf-8?B?UWxlRGMyTWJDMEEySmpNemk0dlBuN2xjNkgxTmpNaTdBNHplOXZVeWtVQTBC?=
 =?utf-8?B?b3dBOTZuVVJJZUEyWEZVZ1ZQdEZnTnZ2N2ZuM3NFQ2ZUUnNJU2VndHYwdG5I?=
 =?utf-8?B?a3hHZFhEdEdkMTIyOW1OaEFzcEVqSHdBVE9BQUEwMFYxazl5TDZOblN1c2hY?=
 =?utf-8?B?ZjliRS9VelJXSFFNejRTUjhpcWVzMzg3NWltZjlueTV6eEdGNUQ4THBFSUJ1?=
 =?utf-8?B?NS8vMDFsREgxY1lxSExwUll0MlMzeW5IbkltNDJEMkZhdDlXQURyd2x2MTNI?=
 =?utf-8?B?TDZKbjFlQTBtazZiOFkrQk4rcjdDS2dXd2c2NzVHVTI0OEw0RW1yZVFMVFBQ?=
 =?utf-8?B?azJVOFMrOVBLandrMjNwTTZpYWUvd3A1S0k3YkkvU2xXVjRPZStWTjdSNE9B?=
 =?utf-8?B?bDJZOWczdDFpbENWREFjalNoK1Q1NHdrMEl6QVU3NXhQUzJZZUZqUXlreGdz?=
 =?utf-8?B?TnNxOWpkUUdvVmN0aERrbFRJb0gvZlpmVm85cmRnREFsa3Q3bGhXOWV4dFdz?=
 =?utf-8?B?dGNWdkJuSDZYNnNnZldqQ0xGelZYL0hYWGkrQTBQSXhucU91UCt2cDFJU3Nh?=
 =?utf-8?B?TkxsbFNqZzRPdExMaUNvcThCTDYyNEJNME5vWnNQWGx0eDJnSlAwOEtSKzV6?=
 =?utf-8?B?bFBLRzZ3akxBVXFsbkUxNDVpeTlScG8vbGJoQlh3WW5kR2YweGl4UGFtU3I3?=
 =?utf-8?B?ZEp3MTllVUxBM090S3c1VURPNUFOMEMzRExQSkw4d256UWMvN0hQc3lDWDJO?=
 =?utf-8?B?MEhvZ1BUVjFSc2F0UFRXM0Z5OHZETmVzUnN3TFkyNnZYdHZaUFZSV3Mxb1Nk?=
 =?utf-8?B?bjVIRXJPMmI2NnNxQVlyL1N3Mzk0eGVHMnFXV2pJYjJZb1JiV1dxdnExdnhY?=
 =?utf-8?B?cXd2emZ6Yk8zTGFaTnQ4RlVKUWpjYkRub21UQUc0dm5wN0g1SWhNeis2WU0y?=
 =?utf-8?B?b2w2aGsrSXI2UjZyQ3hHQXNJNiszZEduaVMvNjlqNXJHYlM4WDRScWlhM3Vr?=
 =?utf-8?B?MC9EaGRiVjBiSndPUEp0T2ZXSDkraUdpd0lEa1MvOVJnUVVJRW9mNWlyMGFK?=
 =?utf-8?B?L3FHN2sxODdOZ0FVUmQwN08yOE9GbXlyYUtFQkQ2SUpUUFV6MmZqRExoQUFJ?=
 =?utf-8?B?Z3E5VElyU2trTWZTb1FMRDVSQ3lvVEQvRFZHb204WnF0SUxJZEJXak9xL1p0?=
 =?utf-8?B?U01RWXFIQndmZ0N5UHJGOVNtd2hZT2w2dGFBNkkzaUo2ZS9EbyttNGRLbWJL?=
 =?utf-8?B?MjRVbEpBcnkzMStrSU82Q2R4SUx6L1dWdzVJajFBYVl4YTBLNjFHVUErU2Ft?=
 =?utf-8?B?TmJGQndjTVpBYVluN1BSRUFOWVRvWDhrU29QWWhRd1JTK28ycE1pSjF3UXUz?=
 =?utf-8?Q?vElH3TraubIdYs2OW2dLc+JZ/jaY7iKOQSNR9NN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfda7b39-9b26-471d-7cb7-08d90fb74ab2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 11:16:55.7682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RERXI4fgQnHLGBxpUc3W7xtCTCyb5g4kcjl0JRkVfgRxgL84RMeCvTiBbih7LluFIxTyz3BbpnjpKSLnmbxFTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5273
X-OriginatorOrg: citrix.com

Do this before adding any more stuff to xg_cpuid_x86.c.

The placement in xenctrl.h is wrong, as they are implemented by the
xenguest library. Note that xg_cpuid_x86.c needs to include
xg_private.h, and in turn also fix xg_private.h to include
xc_bitops.h.

As a result also modify xen-cpuid to include xenguest.h.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Note this is based on top of Andrew's xc_cpu_policy_t type change.
---
 tools/include/xenctrl.h         | 55 --------------------------------
 tools/include/xenguest.h        | 56 +++++++++++++++++++++++++++++++++
 tools/libs/guest/xg_cpuid_x86.c |  3 +-
 tools/libs/guest/xg_private.h   |  1 +
 tools/misc/xen-cpuid.c          |  1 +
 5 files changed, 59 insertions(+), 57 deletions(-)

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
 
-- 
2.31.1


