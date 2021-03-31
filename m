Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2090134FE28
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 12:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103861.198130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYDP-0005Qo-Lz; Wed, 31 Mar 2021 10:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103861.198130; Wed, 31 Mar 2021 10:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYDP-0005QI-H9; Wed, 31 Mar 2021 10:36:47 +0000
Received: by outflank-mailman (input) for mailman id 103861;
 Wed, 31 Mar 2021 10:36:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRYDN-0005P3-NK
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 10:36:45 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8057e55-bac8-4d14-b16e-6e684cd096bf;
 Wed, 31 Mar 2021 10:36:44 +0000 (UTC)
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
X-Inumbo-ID: e8057e55-bac8-4d14-b16e-6e684cd096bf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617187004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=JPCmVO9asq4INCZJr57/0dCrCiXwQMJC6md2SxhVFUA=;
  b=c9zNBZqcsB2+0+gVHTEXdjt7yXbQZLT9gH+Gspal3Va/LVhX+Jjv9bic
   musVEHh5as9n4ZqQw+FLN6pb2pFWeasX5yWFYiqDPOuhBohBtxzneX5ev
   x+qFb7fFSiG4NxieZEK3W40KR5ii/KwEI6+JF8H3y3+/MQcqtheIASWbh
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: re6kwNWVYOTXd+BZWHE3Mnn33KcpCYvPJYP3KfhJe2Z85yyiXaDDrrVO843nBt9yiU2I8yU16T
 hg/8H8nDDO2aP7nA3YcqucSQSDrjg30z0UO6ex91pDDXmN13GEMU67vIXTYsc3cTYBvZrxhYAc
 j3Sltq+WLRB2BZRAOACqOV6qdeVvfKtEQSo1m3p6KDNBZ8mYzE6k2gc+EYoUi8LYBgGT3aleMX
 LZ+z1W6hHa8G66a1p1OGYEQwFoODkv3BCS301vsceJbwdw0gNZLy1UDyArZN+RDFUUB2/NDHGM
 hSM=
X-SBRS: 5.2
X-MesageID: 40415700
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:RyErbq9TtTZ4PCIjgRJuk+ECdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnb8oN45pRUAKe6UGDdyQ6VBaxBza+n+T3vHCXi6vVQvJ
 0LT4FSAMD9ZGIUse/U+w+9euxP/PCi0ISFwdjT1G1sSwYCUdAD0y5cBhyAGkN7AClqbKBYKL
 Om6sBKpyWtdB0sB6zWOlA/U/XevNqOrZr6YHc9bCIP0hWEjj+j9dfBYnul9yoZOgkv/Z4StV
 Lrvia8zaWlvvG9xHbnphXuxqUTovTN4J9uAMSNj+IcNznjjB25Db4RJoGqjXQOj8yErHosjd
 nQszcsVv4Dl0/5TyWOjjbGnynmzTo05HfpxTaj8ATeiP28fh0WIY5lp+tiA3/kwntlhv5Q+u
 Z3+ljckJxtARbJjE3GlqD1fiAvrGWYiz4fi+IJ5kYvNrc2WftqgqE02lhaK5sEFDKS0vFdLM
 BeSPvR4/tbajqhHhbkl1gqxNStW0I6FQudTn4DvdSI0yNXkGoR9Tpg+PAi
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40415700"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FeoLPm0S04X22AEQ4NWEiE6YXTD7MgmfZVE+WmQ0XzFHcZGqRnQ+KIsOgaEmROPIo6+quiO622/eymc7Y/rgMjJrHaDNhVK8bkSogrIEAVeYP2/WzDySqfQM0NNp6EdTqqOd6h1lJ4iB/VD6flrqgvPiSZz4KAy00nSnpUGhSKtGiAOzScnt2/FrnbMbAx6ZHtybnLAzkCBU4AMADF+4pSOApop4WyS0BWlJ/KX34I+ULoqmCHG1b0LK5WhABiRuYOPv16sfXrUL6E0Fk9IqQiAxTBzWOpkcTQwUMlCLVsgNfHRAE038+Kn8XSt1fjXkR1Ne2c0po4W/kFTW69lFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoQnGzbvC7IXy//qY3Etmc+ztTD9ZjxducZ3X6OtCAg=;
 b=hNUXZrIbieTUVJKplkJ7eIGMd6FDmUtlPkGcd6tQ5Skqh5TLRXB5ri2C1nsmcxQyQr3O7SK8JUhD5i++Eq57FWlHSRu17C2VEtw3uzVenrxrJQ9UbkRlkltGpY7NLkLmynXybnc+sUPBs5wuLAUBaarPt6yUElPN9HTPleCc0AHhqa6Wm1Jp5S60Y/b5XztJfAGrf5QklCeENwKIZG39OIBJf4sL72X5cc63bNmVGoyMfNuhWM+kxRVRJK2JcVf/8Y/wyqEXQpEj16UWIs2IaU67F4VtXEWadvutdzc/XGjeU+puinwSC1Gex6USg8I2HUPYSqHOveMMSV7RuOFYSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoQnGzbvC7IXy//qY3Etmc+ztTD9ZjxducZ3X6OtCAg=;
 b=Z8H4ow4GMZloXwn1ykrpTSomkhCnprm8xPFTU7dK3LgvziGoFlUSbYkLkTrNmDnjJIsDFF6NkpI3TU8gVK+KDVqN7sHK2EJ0niFmcFlJ9Bwoy8Mev0oCHQ8lnbO2mf/rOzUd2iol+zkni9WwRu1R089yqS0oF6p9dp2LJNLGqt4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 11/11] x86/vpt: introduce a per-vPT lock
Date: Wed, 31 Mar 2021 12:33:03 +0200
Message-ID: <20210331103303.79705-12-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210331103303.79705-1-roger.pau@citrix.com>
References: <20210331103303.79705-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0077.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38e6f590-6b03-4422-99d2-08d8f430ded4
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB59684B6DE460BF2BE1671B198F7C9@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:261;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SHJCVJYXsinhDJK20ruHDKPFq2a/Tfit3eRZDPoiB0xpZUWsLX5ON9RvbIdfybicUnLsDuWg2xSz+T5QxKwxna4eXD1l/FC3TpsUvNPC+o3dmIrMpBNbSSfEVFZOxndV+BVgCgKEtQdKObmRTWaJKyVJIY8TBRX8or+bwTr66YbFhEr/cD1vCGmlzkZGgmanyGGglIgtcqsg/NIEtDNr/BO0P4MWq7G2nslgWyP22bmajqQXhvgCV5+sRMqGMY/HF7+/SibPrY5HtpNNvPLhINblexDeud2dDPWYJfEZrh7K3qfL+jEWDW1R0WUJt7AHjP/MgfU8D5UMlU9K+RYcHXFesj5szUBQVMYhY0HJVGd280JJYwHyQcg8L9UhM6tCVErd/sxKpQCad5k6WF8JGG6/PS/vLDB4tn7gdwy3OdXWJLaaThcY6/gKc4tgvQyMSSMnYO7Fe/vTFm/eO5rronv1HEc2YViREmYAiNCEyCm1gOM64sABNOL1yoGkVnrhAykwUKOPu67M4DnzSS1gcFjob3jnZr0AYC+u7tHUJD4sUMAYfhITt+faNR/A5rfz2Apjd8DZVKpKEkI7nt4t9PDpj/Qn9WJDrwgadBx4ApbPOpX7xGkZHH8SOcbazF6Q14jbeY75VPqKhOxewFGKtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(26005)(2906002)(6486002)(8676002)(1076003)(36756003)(38100700001)(8936002)(83380400001)(16526019)(86362001)(186003)(6916009)(6496006)(66556008)(66946007)(478600001)(66476007)(5660300002)(316002)(4326008)(2616005)(6666004)(956004)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R3RhU1BlZkdhK2I0aDlPeEpqMStwLzdIa1dnQkY5Rmh5ZUpXRXV3aHNkRFQr?=
 =?utf-8?B?emlMbkdrSzNkc0lseXh6QmdYWnZZVGxlMlFWV0RwakVxT1JuNXpmczdhRUkv?=
 =?utf-8?B?UXF1d2hoMHBFNHJSeEdiSEtxZURJL1N4ZlZQd2xiaEpOY1owdjhhUUJ4TW0r?=
 =?utf-8?B?YnEzMW0xdHlpT2ZSVk03c2ZpbWlYODFkQnNsREhrQUIwSHpJRGprWmRLWERx?=
 =?utf-8?B?OU5TV2szUjlGZDBwWWN5ZVlIZ3piN3dPQ0g3aHlQUHNId0Z3YlV2N21HWXJZ?=
 =?utf-8?B?TEtxOHVEMERoSWF0OWh6cksyYVI1cythdi9WNUNRbHhqRE03cWhiSFkvWWdF?=
 =?utf-8?B?UjUyS3FXUnNSeGVUdTlVbUN1Rmtvc1A3am9BemZHTUNIK0lLNEdqMk1GeG9R?=
 =?utf-8?B?dnBudFU5VWc4eXdNczRIRHZpZXBIM2lnRGFKcDU3eWVzckxiamdQRU90dUta?=
 =?utf-8?B?MmlMZ1g1RHFJMnNTR2tjRi9VZlROUk1HYUVkdEJ1SkYzNVNsNjR2cUdZb0pP?=
 =?utf-8?B?N1RCRUQzUjJXWEJWQSt6d3FqeC9saVZ5d3NWeGVhdzFoVjRhN3Y0U0ZiSm9x?=
 =?utf-8?B?UWFLU1RyWGIrRXNIdEtBYWE0MU9YSnh5N2cxKyt6bTQvSGloVHpjSGVhcTd1?=
 =?utf-8?B?cnRZeWZoOTJzbkorQlV3SGRkWXpGUEZkNDdtZTBXNHlqMERYMnE2bWkxL25J?=
 =?utf-8?B?TmUrRmRtWWlJOWsva1l5K2tMQnpxRHNzSGRQYk5tRVlYeEtibnJTUnJEbGNB?=
 =?utf-8?B?UnRmVEhmdWt2SElCSTZnbEZjNm5ueTQvNC93QlRud2pnZnBUS0JMRzVXa0hZ?=
 =?utf-8?B?cFdxS2x1RDkzSkQ2N0dvRHl4aGk3c1UrNWVvQk1DSTRFUUhwUFVhU1g4czVN?=
 =?utf-8?B?RDJzWDR4RGlqbEI1ekRHaElBK3pCOXQ0UVlyVHBlK2V3SldobU4rcm1nemda?=
 =?utf-8?B?MXJpNElEdnRMcHRZMWQxc1hFYzJrMmJuTzMrVmVMWUtsQXBCc09KN3k0Tkl5?=
 =?utf-8?B?T3NCNGp4amNqZFJJemgzelJOMW8vUWdld0hoN1o1UTBldXY5eVhnTUNHL2t3?=
 =?utf-8?B?c3VZc0RpcjlPeWFUdGJNUDZDQ1Z4NVhVL0ZUSzErU0xzY3dBY01FaHNPaDBu?=
 =?utf-8?B?NmRSbFM2TU0wMk5nYXVubjd1Wno1ZzRqN1Z3U3hycnJGNzE2dzRHV0U2VGN4?=
 =?utf-8?B?R3Qxd210QnZMSStZQ0p3VG5DTlh6d0p0YTR5NHRTOHhJU04vR3BrOCt6WjFL?=
 =?utf-8?B?MHlNS2w3dXdQaExLeklJQUhCYnBPbEQzUWRqcGZpTnhQNENpM1dGTmFIdmNm?=
 =?utf-8?B?Sy8xdDFoVW9SdTFKUTlXalNwaGNIbVdMZkFSUmZZenZEbG54Zm96dzd2VXRj?=
 =?utf-8?B?WG9NelJzbU1Tbkp5QnBnNDNudmlDbVdhZ2doSyszdUxUZzJFZjhwYllGOXYv?=
 =?utf-8?B?YXIvalp1aEo5V2VzN2xjWllKL0YzdERmUExSakMxSjc5aGVIcndtVlZhamxy?=
 =?utf-8?B?MnBzbjhXVy9YL0daV0xxZzV2eXFzVTY4czUvUzdDUTRoM3A1Z254OHJVdm5N?=
 =?utf-8?B?dWt3MWZoWFdBamw2Mlg3OGVRV1BsZjhmV2NRZktSK2R6TEFwU0hmdWNEUDJM?=
 =?utf-8?B?ZGFIMTZFZXBpYm1yQk5sOW9Ic05OOFEvWnBzZnNpNWV5YlFaaW5pWnNlNU1K?=
 =?utf-8?B?UHhaM25Ub1F2dUNMemZxT2VKZ2Q0UmVzNUc0ZHdMTWhtdXhpSkFrNExYUU5L?=
 =?utf-8?Q?80b/sCpWmUJmh9NAtRbdUVI5QMvzHuoMZCLmkcX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e6f590-6b03-4422-99d2-08d8f430ded4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 10:36:40.7923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzBoUqqnaX7cmcSwvHyMqDesYwrSL0pDPxYDUPnGM9+W02FIX7EwEI8iDYse2fB4RNeVX2AXFpyo028Fh0uI8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-OriginatorOrg: citrix.com

Introduce a per virtual timer lock that replaces the existing per-vCPU
and per-domain vPT locks. Since virtual timers are no longer assigned
or migrated between vCPUs the locking can be simplified to a
in-structure spinlock that protects all the fields.

This requires introducing a helper to initialize the spinlock, and
that could be used to initialize other virtual timer fields in the
future.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - New in his version.
---
 xen/arch/x86/emul-i8254.c      |  1 +
 xen/arch/x86/hvm/hpet.c        |  8 +++++-
 xen/arch/x86/hvm/hvm.c         |  4 ---
 xen/arch/x86/hvm/rtc.c         |  1 +
 xen/arch/x86/hvm/vlapic.c      |  1 +
 xen/arch/x86/hvm/vpt.c         | 48 +++++++++++++++-------------------
 xen/include/asm-x86/hvm/vcpu.h |  3 ---
 xen/include/asm-x86/hvm/vpt.h  |  9 ++-----
 8 files changed, 33 insertions(+), 42 deletions(-)

diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 73be4188ad4..a47138cbab7 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -484,6 +484,7 @@ void pit_init(struct domain *d, unsigned long cpu_khz)
     {
         register_portio_handler(d, PIT_BASE, 4, handle_pit_io);
         register_portio_handler(d, 0x61, 1, handle_speaker_io);
+        init_periodic_timer(&pit->pt0);
     }
 
     pit_reset(d);
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index ca94e8b4538..20593c3862d 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -739,12 +739,18 @@ static void hpet_set(HPETState *h)
 
 void hpet_init(struct domain *d)
 {
+    HPETState *h = domain_vhpet(d);
+    unsigned int i;
+
     if ( !has_vhpet(d) )
         return;
 
-    hpet_set(domain_vhpet(d));
+    hpet_set(h);
     register_mmio_handler(d, &hpet_mmio_ops);
     d->arch.hvm.params[HVM_PARAM_HPET_ENABLED] = 1;
+
+    for ( i = 0; i < HPET_TIMER_NUM; i++ )
+        init_periodic_timer(&h->pt[i]);
 }
 
 void hpet_deinit(struct domain *d)
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 3a72da67ef2..1c014fc26c3 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -665,8 +665,6 @@ int hvm_domain_initialise(struct domain *d)
     /* need link to containing domain */
     d->arch.hvm.pl_time->domain = d;
 
-    rwlock_init(&d->arch.hvm.pl_time->pt_migrate);
-
     /* Set the default IO Bitmap. */
     if ( is_hardware_domain(d) )
     {
@@ -1556,8 +1554,6 @@ int hvm_vcpu_initialise(struct vcpu *v)
 
     hvm_asid_flush_vcpu(v);
 
-    spin_lock_init(&v->arch.hvm.tm_lock);
-
     rc = hvm_vcpu_cacheattr_init(v); /* teardown: vcpu_cacheattr_destroy */
     if ( rc != 0 )
         goto fail1;
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 3150f5f1479..2d540b16acd 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -846,6 +846,7 @@ void rtc_init(struct domain *d)
     init_timer(&s->update_timer, rtc_update_timer, s, smp_processor_id());
     init_timer(&s->update_timer2, rtc_update_timer2, s, smp_processor_id());
     init_timer(&s->alarm_timer, rtc_alarm_cb, s, smp_processor_id());
+    init_periodic_timer(&s->pt);
 
     register_portio_handler(d, RTC_PORT(0), 2, handle_rtc_io);
 
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 8091b6d8925..688ff85e710 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1651,6 +1651,7 @@ int vlapic_init(struct vcpu *v)
         return 0;
     }
 
+    init_periodic_timer(&vlapic->pt);
     vlapic->pt.source = PTSRC_lapic;
 
     vlapic->regs_page = alloc_domheap_page(v->domain, MEMF_no_owner);
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 84d49c1b25c..9cb0b8a0a82 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -126,23 +126,6 @@ static int pt_irq_masked(struct periodic_time *pt)
     return 1;
 }
 
-static void pt_lock(struct periodic_time *pt)
-{
-    /*
-     * We cannot use pt_vcpu_lock here, because we need to acquire the
-     * per-domain lock first and then (re-)fetch the value of pt->vcpu, or
-     * else we might be using a stale value of pt->vcpu.
-     */
-    read_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
-    spin_lock(&pt->vcpu->arch.hvm.tm_lock);
-}
-
-static void pt_unlock(struct periodic_time *pt)
-{
-    spin_unlock(&pt->vcpu->arch.hvm.tm_lock);
-    read_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
-}
-
 static void pt_process_missed_ticks(struct periodic_time *pt)
 {
     s_time_t missed_ticks, now = NOW();
@@ -213,7 +196,7 @@ static void pt_timer_fn(void *data)
     void *cb_priv;
     unsigned int irq;
 
-    pt_lock(pt);
+    spin_lock(&pt->lock);
 
     v = pt->vcpu;
     irq = pt->irq;
@@ -228,7 +211,7 @@ static void pt_timer_fn(void *data)
         cb_priv = pt->priv;
     }
 
-    pt_unlock(pt);
+    spin_unlock(&pt->lock);
 
     if ( cb )
         cb(v, cb_priv);
@@ -245,7 +228,7 @@ static void eoi_callback(unsigned int unused, void *data)
     time_cb *cb = NULL;
     void *cb_priv;
 
-    pt_lock(pt);
+    spin_lock(&pt->lock);
 
     pt_irq_fired(pt->vcpu, pt);
     if ( pt->pending_intr_nr && inject_interrupt(pt) )
@@ -256,7 +239,7 @@ static void eoi_callback(unsigned int unused, void *data)
         v = pt->vcpu;
     }
 
-    pt_unlock(pt);
+    spin_unlock(&pt->lock);
 
     if ( cb )
         cb(v, cb_priv);
@@ -312,6 +295,11 @@ static bool inject_interrupt(struct periodic_time *pt)
     return true;
 }
 
+void init_periodic_timer(struct periodic_time *pt)
+{
+    spin_lock_init(&pt->lock);
+}
+
 void create_periodic_time(
     struct vcpu *v, struct periodic_time *pt, uint64_t delta,
     uint64_t period, uint8_t irq, time_cb *cb, void *data, bool level)
@@ -328,7 +316,7 @@ void create_periodic_time(
 
     destroy_periodic_time(pt);
 
-    write_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
+    spin_lock(&pt->lock);
 
     pt->pending_intr_nr = 0;
 
@@ -391,18 +379,21 @@ void create_periodic_time(
     init_timer(&pt->timer, pt_timer_fn, pt, v->processor);
     set_timer(&pt->timer, pt->scheduled);
 
-    write_unlock(&v->domain->arch.hvm.pl_time->pt_migrate);
+    spin_unlock(&pt->lock);
 }
 
 void destroy_periodic_time(struct periodic_time *pt)
 {
     unsigned int gsi;
 
+    spin_lock(&pt->lock);
     /* Was this structure previously initialised by create_periodic_time()? */
     if ( pt->vcpu == NULL )
+    {
+        spin_unlock(&pt->lock);
         return;
+    }
 
-    pt_lock(pt);
     pt->pending_intr_nr = 0;
 
     gsi = pt->irq;
@@ -415,7 +406,7 @@ void destroy_periodic_time(struct periodic_time *pt)
         hvm_gsi_unregister_callback(pt->vcpu->domain, gsi, &pt->eoi_cb);
         break;
     }
-    pt_unlock(pt);
+    spin_unlock(&pt->lock);
 
     /*
      * pt_timer_fn() can run until this kill_timer() returns. We must do this
@@ -430,10 +421,13 @@ static void pt_resume(struct periodic_time *pt)
     time_cb *cb = NULL;
     void *cb_priv;
 
+    spin_lock(&pt->lock);
     if ( pt->vcpu == NULL )
+    {
+        spin_unlock(&pt->lock);
         return;
+    }
 
-    pt_lock(pt);
     if ( pt->pending_intr_nr && inject_interrupt(pt) )
     {
         pt->pending_intr_nr--;
@@ -441,7 +435,7 @@ static void pt_resume(struct periodic_time *pt)
         cb_priv = pt->priv;
         v = pt->vcpu;
     }
-    pt_unlock(pt);
+    spin_unlock(&pt->lock);
 
     if ( cb )
         cb(v, cb_priv);
diff --git a/xen/include/asm-x86/hvm/vcpu.h b/xen/include/asm-x86/hvm/vcpu.h
index 9a756964fb0..fe3d0e10426 100644
--- a/xen/include/asm-x86/hvm/vcpu.h
+++ b/xen/include/asm-x86/hvm/vcpu.h
@@ -148,9 +148,6 @@ struct hvm_vcpu {
     s64                 cache_tsc_offset;
     u64                 guest_time;
 
-    /* Lock for virtual platform timers. */
-    spinlock_t          tm_lock;
-
     bool                flag_dr_dirty;
     bool                debug_state_latch;
     bool                single_step;
diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.h
index af04efa5e01..5628cff8f7a 100644
--- a/xen/include/asm-x86/hvm/vpt.h
+++ b/xen/include/asm-x86/hvm/vpt.h
@@ -48,6 +48,7 @@ struct periodic_time {
     time_cb *cb;
     void *priv;                 /* point back to platform time source */
     struct hvm_gsi_eoi_callback eoi_cb; /* EOI callback registration data */
+    spinlock_t lock;
 };
 
 
@@ -126,13 +127,6 @@ struct pl_time {    /* platform time */
     struct RTCState  vrtc;
     struct HPETState vhpet;
     struct PMTState  vpmt;
-    /*
-     * rwlock to prevent periodic_time vCPU migration. Take the lock in read
-     * mode in order to prevent the vcpu field of periodic_time from changing.
-     * Lock must be taken in write mode when changes to the vcpu field are
-     * performed, as it allows exclusive access to all the timers of a domain.
-     */
-    rwlock_t pt_migrate;
     /* guest_time = Xen sys time + stime_offset */
     int64_t stime_offset;
     /* Ensures monotonicity in appropriate timer modes. */
@@ -167,6 +161,7 @@ void create_periodic_time(
     struct vcpu *v, struct periodic_time *pt, uint64_t delta,
     uint64_t period, uint8_t irq, time_cb *cb, void *data, bool level);
 void destroy_periodic_time(struct periodic_time *pt);
+void init_periodic_timer(struct periodic_time *pt);
 
 int pv_pit_handler(int port, int data, int write);
 void pit_reset(struct domain *d);
-- 
2.30.1


