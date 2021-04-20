Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A78F5365B00
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 16:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113802.216868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr9J-0002h6-Tr; Tue, 20 Apr 2021 14:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113802.216868; Tue, 20 Apr 2021 14:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr9J-0002g2-QL; Tue, 20 Apr 2021 14:14:45 +0000
Received: by outflank-mailman (input) for mailman id 113802;
 Tue, 20 Apr 2021 14:14:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYr53-0000xF-70
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 14:10:21 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3dd5d826-5ad6-44e3-8a3f-2d0e32d1be67;
 Tue, 20 Apr 2021 14:10:11 +0000 (UTC)
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
X-Inumbo-ID: 3dd5d826-5ad6-44e3-8a3f-2d0e32d1be67
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618927811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=6coVnkxQH01xuYysdoaEe/x+kf4TGmb+qk9wPm0DpYI=;
  b=gRzxMhFd67R4tVsUFhUQaU0nfqMm5s0ftACVBK2bYMUTd+LukGv8Di8y
   aZ+B/7rSG8aT5zROm6r/RW0KAux2d2s9Jy3DuKlMoaokgARzMIPIqqBID
   n5suIQJLlUJK04bZZPX9caopa5dcSOGDWHxAIUL4RCMIBUkWQDd8SjEH0
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vAFnK7NDiRRwYOPcJH1dCdLhVEwDl3eyU+HorpVhmf8rPqfLDOpZvbbCy9mtmGO6G8Pc0nGasi
 UOPRa1wWfa6nr5J0uFJquPziEXWMn1mPex1CwqZOis1C1vZQSAU03KIWyR3GluGBz1AMGCvf4X
 wlRjqiBxf2byANfBSa8SG9wa+6LEFVwhnBCkr9ZHB0eoaWZWOnNMf6+ad4E34CKgucF56A0GTY
 heNinqBjzao3jGLdFAig53LqvWnTjzFaKqgVYTV8TMKTW0U2hKcska6CrCjvmBktOgpfXtyhjP
 LVE=
X-SBRS: 5.2
X-MesageID: 41988343
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:siYtua4ViwGSh4VEBwPXwRKBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3Xa6JJz/M0tLa6vNTOW3VeAAaNDyc/ZwzPmEzDj7eI178
 1dWoV3FdGYNzdHpOng5g3QKbgd6f2m1IztuuvE1XdqSmhRGsNdxiN0EBySHEEzZCQuP/oEPa
 GR7MZGuDasEE5/BqiGL0IIQvTZoJnznI/mCCRsOzcc9AKMgTm0gYSKcCSw4xF2aVJy6IZny0
 fpuUjT5qKvs/a0oyWsrVP73tBtt/bKjvdGDMyIoMAJJjvrkRbAXvUdZ5Sy+AobjcvqxFE2kM
 TdgxpIBbUO11rhOlubjDGo+w783C0g43XvoGXo/kfLkIjCax8RT+9i7LgpFifx2g4bk/xXlJ
 9v5Sa/saFaCBvR9R6Nn+TgZlVRuWef5UY5nfV7tQ05baIuLIV/gKY4501vHJIJDEvBmfsaOd
 grNs3a6fpMGGnqCUzxjy1qyNyoaHw5Ag2LdEgEotCUyDhbhhlCvjIl+PA=
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="41988343"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fi25bHQT0LD5RxwOA4yFInRufE5sq6cNZpJl7fuf1oR7zhppTP7OCUen6/1UPRT2nL3CszZm4DpxpVZ8udQ1drAjHnIwDF3hb7XkDGPhF4tPOxUBeFEo2XUrKKZGwbb87LcOwJwqNmHBBbARHtEgX+AtS5/voyhXx2MOh0lFM9LTb0ovJKW5KXTm89yrF+nLnW7rFU4RzSbmdKo9jYZZAtBLxrXRIiiciT5n1qe/z4iVQbMHWkKIFUlkJRv7zXdA9dskqLJYP+QGpg7IWNdDqgUF4t1HOYKnczRwcszZavyRA4+Jr5N9T5n8s3ZGKvG+Pg1gH+U0t2IkfZKLWbu/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPLww0jyAC3ZvVT3vwHc3Orw5CsWBNndVX/YLz+UW6g=;
 b=OFDv3eBg/qd+EmvxMRs4fj2k+y+xIlx8X/+SKmsyKG1Q0Md4gGHat98so81NMqUauv6CHYsEV6Sit+jcncz0ebSmSZ0nMV6/f1DYTqdrTeOp7RzUqpeH0crqTwXy7TokkA9+HkUkQznok3j9wyF4un/+fAXJlIxPNUdz4062qPcYvEJb6keL2+DukVeZwwJL+zhU8Cvpcgy/GJVFRH5rIo353C3Y31lqMuVb9Xmnl/3NKhMb5muiW8UcXx6uPYKsHum0L0rV1FJw9ZL2otTMoHAJ2cIs3J2q5XthondDNTR8dsspvrhqzIquNNUym02Ohw8yBeUmIoYpACUEGe99CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPLww0jyAC3ZvVT3vwHc3Orw5CsWBNndVX/YLz+UW6g=;
 b=oIfbfM9RMSyu2Ajz4Y6I1M83MQttJWwX5dWIZj2ivXG6oG1I/VMTs5XcM5h3gc/esxjF5cWg9hQvkJ72EYSOV6bytJk6KlNWjhmIrBaVCJhLiGtwg2Uo3D2F/LJ4dfV5EjXDz89Qy+GhnKY1kVEP/ua4Wh+69Oma3kcziZCfgOs=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 12/12] x86/vpt: introduce a per-vPT lock
Date: Tue, 20 Apr 2021 16:07:23 +0200
Message-ID: <20210420140723.65321-13-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210420140723.65321-1-roger.pau@citrix.com>
References: <20210420140723.65321-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0048.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::36)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e043e9ca-7e03-4ba0-2268-08d90405ffee
X-MS-TrafficTypeDiagnostic: DM5PR03MB3068:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3068D8CD7887A0018169E80E8F489@DM5PR03MB3068.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:451;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CS3Mp09alfYJWF+bDJKlOFi4CXzVTj5yYSBEupyawzjBmaYn7kfCBVHbtgHr9lrGtw2tuZIivjSfrmnRER0bVLWfTHSky0cN5+MGJFRqlUoAroceMRsiDYAEEJ7qEAqfVBx05tMSVpESsEc6f1lhXEeYhV34DcszYCiOPc39m624ISo3OiqX9nKr4UJc/QXSud5a65mduDwm60B9ecXkmLepRmK3tjXp2wagGT5wrfIa9vnsXxtxHSBCon3Vb3LxxBfvNm87POfkPXdxz4A7lxxL5KCTpMY0PpnwfLscXD1kIyAPo6wVSUiRJFV6PdWB7LI2Btyvz1229Sb5QmfBkG9qEC2FZt2Ti5px6G4pwonGqEkZsPJGYvQQXhlyYc3I9Lp0G9pUX+iK2LivlAdLUw13WfeQ26uYlJI6D4yvSUIpAP+EkscfST8VGfIbwfOCgBTycFQiHrGUQm2LtBGda6KFlstwxpmBywSeSghSkpYLimsXgCe2awqfMrnqgjhy9PmpDKCksh3OVz/3W73j7nybUVN1r1TNP29UATz8ab/mvG8hkn6/iAvFBEqveDbIovv33hjFLJjRjrspHatesg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(54906003)(316002)(2906002)(6486002)(956004)(1076003)(38100700002)(36756003)(2616005)(16526019)(5660300002)(6496006)(83380400001)(4326008)(8676002)(26005)(66556008)(66946007)(66476007)(186003)(8936002)(86362001)(6666004)(478600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aG5FVFdNZFB4RFhLTENBb0R2QmxhRld0TjRJSWVwS3JIU3dhYVpGZFF6L2Zo?=
 =?utf-8?B?dmhwVkQ3TDluNTl5VHUvbFc5VERzVlVKNzg2cVJ4bWZyTXNZVGRsZ2N1Nm9Q?=
 =?utf-8?B?NzMxdEc3bTEyYUVUVTJidUlZMVZhUTBzTk1RRE1yOUlEOEZxckhPem41TzJK?=
 =?utf-8?B?QUF6eS9yUUJVTXYwRGcwVmZZcm9MdTlWcWJoQmJ3NXF0R1JOMENkSWh4bzFE?=
 =?utf-8?B?eS8zZGEydDE2Z3N1MS8wSUdiWHNnajgxeGRuRHp0YXREVUpMRUlzZnBWRTF6?=
 =?utf-8?B?aW82Njk0YzFidEtyYVFVUURmM3dGTUpiMTNETVNqbmZYTzFWbjgzQzdhaFJ1?=
 =?utf-8?B?Ym9wQjMzU0FYNDUycS9IZFdvMnRpTjNjbW0wQTk1T2dPc2tDYzVZbXg2RXJP?=
 =?utf-8?B?TGtUeWtDd2ZVYkhGL2hxdnpNY0xWSWtnVkp1am1maVpjZHZRR2xTMVZTcVIy?=
 =?utf-8?B?Sm10QTZiMExycENySzZpKy9qSjlGeWI4cDg1MWpxc1o3ZnZDT0Z3eFpDS0xX?=
 =?utf-8?B?ZlZjUGJXMXBJSmYzYUtvOUp5Qk5CTFF2K29DSTc4OUw4RXFuQ1NQM0Z6bitl?=
 =?utf-8?B?N2JINEpYaVVhRDVJVjdvSWZaQU8vRWZRL0EwSVMwM05FY0RJVUhraCt1NUpC?=
 =?utf-8?B?Zi9QSVhvZGMwaVNNcXd5bFZQRmoxek5BN3VlMHNJRGxIV0Ezc1pIbStDZFps?=
 =?utf-8?B?eXZGSjUxc2xQRm8ybnBOK1ovYmZpRVVIRzFjbS9mTFh6YnhhM1ExaTJSZHFE?=
 =?utf-8?B?aEdNMHYrYkpVMVFITDVobDU1d2RQL0dMYnJrU3VoZTRwUVVSaVVadytLc252?=
 =?utf-8?B?eWZ3MUN6MmsreEJvaDB2MDdWdzNTck5RUFRNUUxvcUlLTDl4b2Y4dDVkamta?=
 =?utf-8?B?RGE0NkhJTGs0bEdSbHUySjNPR0twMm4ya2hMVTN5UGh1WEF2enIvanBNWVpy?=
 =?utf-8?B?TFM1Z3lGZXVpVnJHY0pSaWM4REZlaXR3S0hGd2ZZdnZRV2dqYlQzZ3pOZ2J0?=
 =?utf-8?B?VFpUMHZxelhOdkNZNzhBV01nYXJpNGl5ek8vRGs5YjI5bG1RVGhMQzNtWmZZ?=
 =?utf-8?B?c3crY0RuQzRnL1JFYUcxWSsvMGdZakFTYnF5ejQ5OHludFZoeGlNWTB2alNF?=
 =?utf-8?B?a0ZWMEM2VUZkNTE0NVNNU0RoZm5kSldscFFOeFZaOGwzc2JDWGYvZzVqQVEr?=
 =?utf-8?B?ZjhVb0pjaUd4Uno1VUlwdzNhaG5waGNaWDhFbDhiTTZaNnBKcUxRRHcrZ2tn?=
 =?utf-8?B?ZXpHWWZmWUM4UHdYbXB3MWZFc3RhWHNWd1doZjNHMHJhanBrSGZSSjhLOGNy?=
 =?utf-8?B?KzZyT3ZodUw2bnFQSVJnVnNtY0ovdUhWSGpsS3J5amdsY0U2M0drZzNRak96?=
 =?utf-8?B?THFjbEtnWkVHYW5YaUcyTGF3ZGNwN1o1Ujl0L2grT2s4dlZOZWFLRm9rbTR0?=
 =?utf-8?B?N2NTZDNYL21nZWhBWHk1eGJLUi9TekpWSUVBOW9hMS9MMkFGMk1BMnVVM3BD?=
 =?utf-8?B?R1I3NkpVWUNFQ1BVQy93eDNieDVMMFhUSFFDVDB1T0dNQTFsL3R2WFNFUEV4?=
 =?utf-8?B?THl5dkQ0VWkwZTNrT2ZRRnNZUDJqYjVyaGpXaGNCaUNZR3lEOFI4VVBYaXBT?=
 =?utf-8?B?NXAvaTZoaDlacWhtUWF4ZnRTeE5aSjI2RGVOYnhGWXNzRG5MRXd6dzJCa2U3?=
 =?utf-8?B?Q0lOSjM5ZHdxK2hTNTV5NmR1bXlKbGorZUZhN0hZSTZkU2ZqZ0RTb2hDNzJv?=
 =?utf-8?Q?uBx9c8rd/xKai1zO7WHt4F7ph2zVwPS3l3vzRzU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e043e9ca-7e03-4ba0-2268-08d90405ffee
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:10:06.5795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ectUjC0k1VlVfVYgK0ktZYjSrZ1RCZo/P5u0v/jvxWgTB4TJjJyyxiOIUChH1FnXdNgSD4BovjeTBD+0eoHVUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3068
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
 xen/arch/x86/hvm/vpt.c         | 52 ++++++++++++++--------------------
 xen/include/asm-x86/hvm/vcpu.h |  3 --
 xen/include/asm-x86/hvm/vpt.h  | 15 ++--------
 8 files changed, 33 insertions(+), 52 deletions(-)

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
index ec4ab1f5199..0498c3b02e2 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -666,8 +666,6 @@ int hvm_domain_initialise(struct domain *d)
     /* need link to containing domain */
     d->arch.hvm.pl_time->domain = d;
 
-    rwlock_init(&d->arch.hvm.pl_time->pt_migrate);
-
     /* Set the default IO Bitmap. */
     if ( is_hardware_domain(d) )
     {
@@ -1557,8 +1555,6 @@ int hvm_vcpu_initialise(struct vcpu *v)
 
     hvm_asid_flush_vcpu(v);
 
-    spin_lock_init(&v->arch.hvm.tm_lock);
-
     rc = hvm_vcpu_cacheattr_init(v); /* teardown: vcpu_cacheattr_destroy */
     if ( rc != 0 )
         goto fail1;
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index b66ca6f64f1..8c8b4ed4018 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -821,6 +821,7 @@ void rtc_init(struct domain *d)
     init_timer(&s->update_timer, rtc_update_timer, s, smp_processor_id());
     init_timer(&s->update_timer2, rtc_update_timer2, s, smp_processor_id());
     init_timer(&s->alarm_timer, rtc_alarm_cb, s, smp_processor_id());
+    init_periodic_timer(&s->pt);
 
     register_portio_handler(d, RTC_PORT(0), 2, handle_rtc_io);
 
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 2af24989dd5..5c60bf66584 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1654,6 +1654,7 @@ int vlapic_init(struct vcpu *v)
         return 0;
     }
 
+    init_periodic_timer(&vlapic->pt);
     vlapic->pt.source = PTSRC_lapic;
 
     vlapic->regs_page = alloc_domheap_page(v->domain, MEMF_no_owner);
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 6a8d216c7b5..e4ecb98d3a4 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -125,27 +125,6 @@ static int pt_irq_masked(struct periodic_time *pt)
     return 1;
 }
 
-/*
- * Functions which want to modify a particular periodic_time object
- * use pt_{un}lock locking helpers.
- *
- * These users lock whichever vCPU the periodic_time is attached to,
- * but since the vCPU could be modified without holding any lock, they
- * need to take an additional lock that protects against pt->vcpu
- * changing.
- */
-static void pt_lock(struct periodic_time *pt)
-{
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
@@ -220,7 +199,7 @@ static void pt_timer_fn(void *data)
     void *cb_priv;
     unsigned int irq;
 
-    pt_lock(pt);
+    spin_lock(&pt->lock);
 
     v = pt->vcpu;
     irq = pt->irq;
@@ -235,7 +214,7 @@ static void pt_timer_fn(void *data)
         cb_priv = pt->priv;
     }
 
-    pt_unlock(pt);
+    spin_unlock(&pt->lock);
 
     if ( cb )
         cb(v, cb_priv);
@@ -247,7 +226,7 @@ static void eoi_callback(struct periodic_time *pt)
     time_cb *cb = NULL;
     void *cb_priv = NULL;
 
-    pt_lock(pt);
+    spin_lock(&pt->lock);
 
     irq_eoi(pt);
     if ( pt->pending_intr_nr && inject_interrupt(pt) )
@@ -258,7 +237,7 @@ static void eoi_callback(struct periodic_time *pt)
         v = pt->vcpu;
     }
 
-    pt_unlock(pt);
+    spin_unlock(&pt->lock);
 
     if ( cb )
         cb(v, cb_priv);
@@ -324,6 +303,11 @@ static bool inject_interrupt(struct periodic_time *pt)
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
@@ -340,7 +324,7 @@ void create_periodic_time(
 
     destroy_periodic_time(pt);
 
-    write_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
+    spin_lock(&pt->lock);
 
     pt->pending_intr_nr = 0;
 
@@ -403,18 +387,21 @@ void create_periodic_time(
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
@@ -427,7 +414,7 @@ void destroy_periodic_time(struct periodic_time *pt)
         hvm_gsi_unregister_callback(pt->vcpu->domain, gsi, &pt->eoi_cb);
         break;
     }
-    pt_unlock(pt);
+    spin_unlock(&pt->lock);
 
     /*
      * pt_timer_fn() can run until this kill_timer() returns. We must do this
@@ -442,10 +429,13 @@ static void pt_resume(struct periodic_time *pt)
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
@@ -453,7 +443,7 @@ static void pt_resume(struct periodic_time *pt)
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
index 323afa605e7..5628cff8f7a 100644
--- a/xen/include/asm-x86/hvm/vpt.h
+++ b/xen/include/asm-x86/hvm/vpt.h
@@ -48,6 +48,7 @@ struct periodic_time {
     time_cb *cb;
     void *priv;                 /* point back to platform time source */
     struct hvm_gsi_eoi_callback eoi_cb; /* EOI callback registration data */
+    spinlock_t lock;
 };
 
 
@@ -126,19 +127,6 @@ struct pl_time {    /* platform time */
     struct RTCState  vrtc;
     struct HPETState vhpet;
     struct PMTState  vpmt;
-     /*
-      * Functions which want to modify the vcpu field of the vpt need
-      * to hold the global lock (pt_migrate) in write mode together
-      * with the per-vcpu locks of the lists being modified. Functions
-      * that want to lock a periodic_timer that's possibly on a
-      * different vCPU list need to take the lock in read mode first in
-      * order to prevent the vcpu field of periodic_timer from
-      * changing.
-      *
-      * Note that two vcpu locks cannot be held at the same time to
-      * avoid a deadlock.
-      */
-    rwlock_t pt_migrate;
     /* guest_time = Xen sys time + stime_offset */
     int64_t stime_offset;
     /* Ensures monotonicity in appropriate timer modes. */
@@ -173,6 +161,7 @@ void create_periodic_time(
     struct vcpu *v, struct periodic_time *pt, uint64_t delta,
     uint64_t period, uint8_t irq, time_cb *cb, void *data, bool level);
 void destroy_periodic_time(struct periodic_time *pt);
+void init_periodic_timer(struct periodic_time *pt);
 
 int pv_pit_handler(int port, int data, int write);
 void pit_reset(struct domain *d);
-- 
2.30.1


