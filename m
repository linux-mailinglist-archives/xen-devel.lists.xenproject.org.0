Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCD02F7E2C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 15:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68157.121977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q6K-0001JB-Bk; Fri, 15 Jan 2021 14:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68157.121977; Fri, 15 Jan 2021 14:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q6K-0001II-7m; Fri, 15 Jan 2021 14:29:20 +0000
Received: by outflank-mailman (input) for mailman id 68157;
 Fri, 15 Jan 2021 14:29:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0Q6I-0001AY-Dp
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 14:29:18 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d056748c-b9de-4112-b9a5-b45d9b04fd07;
 Fri, 15 Jan 2021 14:29:17 +0000 (UTC)
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
X-Inumbo-ID: d056748c-b9de-4112-b9a5-b45d9b04fd07
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610720957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=q7TwowynPiuo1114WTOt09EyimdPB5HlsFiwkf6AXUY=;
  b=XD5k0c0RLwTj4A67vPM7vHH7lacksr2rQO5YM08usBh2IeFADZ6MvBPu
   fWMaHQEqb1TVj3JtkW9SDtTYizkmwZK3dAzebCkFwFwK3KxX/VDkU9phn
   TDf1ZzPVHkvJoGsx+ol7g0zVfQhk4tJXyKhFquYvyw+bEVhWkd88tPXaD
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IKn3X712fDhL4bIhB5qpybkViB02AVMiR+g+FSRLuvVPpFUU/4DsYp+VrY4tD543csYpfOkIjC
 7tsBTOS85e/Cekyl7m3WfIRNn3hp6FsCCGstoDB9j0/Kj87deCQ6ofiZ9md0D2mlQPL7DjmdY5
 UIaDZ8A+H7TmrE/DlW/+vI34ABRTx1OYS6EECPJ85e9U0Hys1duRrChGLRLKnbu7+anTIInayW
 /jLLta1QxSmU8XcytFL3rRA8FkAvG4T4bjEMzakh45pCfKrMYtjltcLnBGaKcyayVvlWc5MdAC
 Okk=
X-SBRS: 5.2
X-MesageID: 35392919
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35392919"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTLoDRvoGLWo1VrAktoIKzakxMpwEjNX1ek/hCWbrHKl89ABef17u91nA1zKi1RRMFUpncIuHAToWfoIEXc+cTnHB7d0Gb1kONiIdCD5Lf+FIklpQLnXdiWoGmXGUqPkJfCMsPVf2XaI7KHmPNQU/ru6psLdDQOGO1EJATeWA/acfOTt/4fG5hx8cTzDn/nh3m3p3VwuWmSQ38SwqNLQa8HeRhI//J+lzpZEfxRbr2jadUpymjbBxHEIafFThB0TbSg4BcelWNRPkocmGnOWpPBxMfbFui7qLS6lMNRdKTkyJlGNN0PrcCy4Jn/SEb/MOs7uPykOoE2HRWT3oL5Pug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9S8oqivSUa5Nla1v2k3LQFU11L1Xz/UrVWBDEo+COM=;
 b=LIr7Y0VDPZmHmsMsMsEEB5Wan/pSmUrX1CVfo7A+1ZsUcdDActRYn2BJK1oZNto5Tl2lCr8z+/dyWZ39AA8uMKM1bjn2Nt5c7Kb0kQP381wJwxiON0MA2XXF4anE7NwoJgNjMUd79L6ikDTE/+loDht0JwNZDnWalJshHPcxCtRLSr/NWAYxMFepN6r3tIH4GN5tzU/keKEVA+S1dbK0/OzjJP52WiFQQYg2RD1eSUDdKAJPt4wIuu+HkGoGQ3xJfI/zH7OoGWsnEFRsU53MtFFQBzw1j8NU/Mly3eR4GAdxNQl+ug5u7N5+YGlpOcrHpyXLuP3pwXMA7+hkcNqZmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9S8oqivSUa5Nla1v2k3LQFU11L1Xz/UrVWBDEo+COM=;
 b=NWZvqcWfO5TkZdD78qX3FPoNDEychDeKPf9O1mojCvZCvpHRq2sRQgIDqr+gx/UN+rhNVcuKRW3bWlULEFJ8JetzxLuoohe5wVm0Z74xx8OyHAP5ivPkNCWiQ+AuPswAesemO5Js/9n+cpibCDukxo9Arc+h51UZkGrgnoWee4Q=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/4] x86/dpci: remove the dpci EOI timer
Date: Fri, 15 Jan 2021 15:28:20 +0100
Message-ID: <20210115142820.35224-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115142820.35224-1-roger.pau@citrix.com>
References: <20210115142820.35224-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0010.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b93e366-f189-46bb-7e7a-08d8b961ee64
X-MS-TrafficTypeDiagnostic: DM5PR03MB3147:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB31473779C890A579DAAA909F8FA70@DM5PR03MB3147.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z0hj9DVActv0fq7KRBcJmTzGKll8/FtJIKQgNTDXZJUjKy2QL9HWF+173ulp1WbQnMGZ8pOvYF0uAlUn/gP1GmsTo0na20JQa2Xrc0e2nVTM/zaX4tkiu0XxMfZhhnQ/UiKfl3btv9zJBaJ5O03FX0fILSSpHtCYXllqS5zBI8cJCWcfoj+CD6DotcrTwO5nAJGhfRNyomlIYKs2fWpw9waCE7Xaz07LA9zEB/LNw8NPUBlaLCR+4FxNfwsaGZatV+pK2k45ru2E+JG6JtyEByh4F9mCHpsg8oq0A0QPLVvI8HgE4VgPxY8B4TqejmKfmXM9wzKT9KyWSdSfaJ0IYwOosfNHEmuuPCuT6d6MTzwJQ+Fhgw5cSo9dQ+bwR7RHTwnVWEdkvKGdPOT3nlRCsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(6486002)(316002)(86362001)(83380400001)(4326008)(66946007)(6916009)(54906003)(1076003)(36756003)(6496006)(66476007)(66556008)(186003)(5660300002)(8936002)(2616005)(16526019)(478600001)(8676002)(956004)(2906002)(26005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dGVYbmdLRlgyRi9QTWhLSzIxN0ZJdUl1Nk5SVGdFYlFRdW9oWXFkSlVseUhk?=
 =?utf-8?B?TTZkUGlSM2ppalNERXB6cXR0Z1c3VUxIQldMVzVuTEZOUlVKTTZ1NTIyOEpQ?=
 =?utf-8?B?Zy9VT3ZKRmk5QzMwS2Jpd2hEYlo0anVyam5DOWYwQ0ErSUF2aXZzZTR0Qk1E?=
 =?utf-8?B?VHEvMDJxTVlOV1krck1kSVJFK2NVdHBKdldRcWl3OW90OEQyc0FuekdKRGFL?=
 =?utf-8?B?TFVyVXBia1NzODRCQ1UxWGlxektTaGRZcEp3RGRzRVA5aHJoalFhOGZjOEFm?=
 =?utf-8?B?ZmJVd3VLQzlJVDRDeVlGV0RFTVdVNEQwckRucGFXZU90S0MzNnF5SlJDZ0Q3?=
 =?utf-8?B?Y29hVU5IdDI3N1M2THY1WnZVZlI5SVVHdUo3S2c0clZLVU9udk83SGtHKzhu?=
 =?utf-8?B?bnpDaHdSa3FWZmtuUGlvZHFBSFNCRjViY0pDNWdMQ25IYnJ5K3BrUE02eTN6?=
 =?utf-8?B?ZCtoVkZLdmdOTG5EQ01jUFZoTEZ6UUhwN1dxWStheWxvQW1TT1BsWXg4RDBo?=
 =?utf-8?B?SmhvMXoyc2RjZ1VoUzJyK1VKK2grMUJGVk4wSnNCa1JwODF3UFN2ZlpVcXg3?=
 =?utf-8?B?N1NWQmRzYWlQRE1OSnlDU05uWUF2RDFsTUprTEFqdjFyZDE0bUFIU1hIRnVs?=
 =?utf-8?B?NTFmc0VNRTEyZnIyWkpFaURwMmVNT3RXWUt6OW5JTU1pNGZHUVh4QUJub2di?=
 =?utf-8?B?VFpKNm8wMk1HMUdtVHBPY0piT21iaVo4czNNK0pFZGM3SGlqZFBSaVhNaDNv?=
 =?utf-8?B?dGdha2NNZXRyeFVtakVKTklHL0FtbEFNNmYvNUwvaFhzbW1oWGs4cnVDcnp2?=
 =?utf-8?B?TDBMbGNvM0g0Ym5mUE80ZWFwMktBZUlIVDRIc29PVXBoaVZwZTR3VTBUSldP?=
 =?utf-8?B?TkZUMTAwNk5LOUdmSmUwcHZQZWZ4anVMMFF3U01ldTdoUit2dmEzbjYwVWpK?=
 =?utf-8?B?OHg3WXNmZmFSbU5yYlQySWRLbjFNdHo1NlJxdURPYTQzdlJ5ODZqM1d1SW1F?=
 =?utf-8?B?QUdodldhTTN4ekFlanBlWUhHOW9VMzZ6bUlrbTM4THVjbjVBNG9OY3hWTllX?=
 =?utf-8?B?eG1zRWRIYjE1VklyZy85Vy9XQ1haY1l1aTY0TGtKTGtUOCtZTzNIQ2J3YnpT?=
 =?utf-8?B?elJIeSt6WnJjQjAxejBzNDZPdXlldHFBOE9pSHBGR1lsdUpzTjIxazZYUjNp?=
 =?utf-8?B?UEdDeWtUOTcwR2QzZnN0V0diUVY5K2tsaVQzbWMvVGZ0YzlzWU53MjVzcGNK?=
 =?utf-8?B?bEZub1licENXdFVFTTVUc1hFNWVNUks0S04zWEUxSFJsQ08vdTB1K2NUbUI1?=
 =?utf-8?Q?CuddboQGIBWv8w+teY5GhrxQtyBOS42GEI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b93e366-f189-46bb-7e7a-08d8b961ee64
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 14:29:13.6629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyLcmGYY2xOeZ8u/y9aqRLZo1oxpwkJfisA5eKHwNauR6pqLQ2Fs9Ao8t04Ls4NLYh8EsrFX35S8PrN5Q86H8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3147
X-OriginatorOrg: citrix.com

Current interrupt pass though code will setup a timer for each
interrupt injected to the guest that requires an EOI from the guest.
Such timer would perform two actions if the guest doesn't EOI the
interrupt before a given period of time. The first one is deasserting
the virtual line, the second is perform an EOI of the physical
interrupt source if it requires such.

The deasserting of the guest virtual line is wrong, since it messes
with the interrupt status of the guest. This seems to have been done
in order to compensate for missing deasserts when certain interrupt
controller actions are performed. The original motivation of the
introduction of the timer was to fix issues when a GSI was shared
between different guests. We believe that other changes in the
interrupt handling code (ie: proper propagation of EOI related actions
to dpci) will have fixed such errors now.

Performing an EOI of the physical interrupt source is redundant, since
there's already a timer that takes care of this for all interrupts,
not just the HVM dpci ones, see irq_guest_action_t struct eoi_timer
field.

Since both of the actions performed by the dpci timer are not
required, remove it altogether.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Add parentheses.
---
 xen/drivers/passthrough/vtd/x86/hvm.c |  3 -
 xen/drivers/passthrough/x86/hvm.c     | 95 +--------------------------
 xen/include/asm-x86/hvm/irq.h         |  3 -
 xen/include/xen/iommu.h               |  5 --
 4 files changed, 2 insertions(+), 104 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/x86/hvm.c b/xen/drivers/passthrough/vtd/x86/hvm.c
index f77b35815c..b531fe907a 100644
--- a/xen/drivers/passthrough/vtd/x86/hvm.c
+++ b/xen/drivers/passthrough/vtd/x86/hvm.c
@@ -36,10 +36,7 @@ static int _hvm_dpci_isairq_eoi(struct domain *d,
         {
             hvm_pci_intx_deassert(d, digl->device, digl->intx);
             if ( --pirq_dpci->pending == 0 )
-            {
-                stop_timer(&pirq_dpci->timer);
                 pirq_guest_eoi(dpci_pirq(pirq_dpci));
-            }
         }
     }
 
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index edc8059518..5d901db50c 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -136,77 +136,6 @@ static void pt_pirq_softirq_reset(struct hvm_pirq_dpci *pirq_dpci)
     pirq_dpci->masked = 0;
 }
 
-bool pt_irq_need_timer(uint32_t flags)
-{
-    return !(flags & (HVM_IRQ_DPCI_GUEST_MSI | HVM_IRQ_DPCI_TRANSLATE |
-                      HVM_IRQ_DPCI_NO_EOI));
-}
-
-static int pt_irq_guest_eoi(struct domain *d, struct hvm_pirq_dpci *pirq_dpci,
-                            void *arg)
-{
-    if ( __test_and_clear_bit(_HVM_IRQ_DPCI_EOI_LATCH_SHIFT,
-                              &pirq_dpci->flags) )
-    {
-        pirq_dpci->masked = 0;
-        pirq_dpci->pending = 0;
-        pirq_guest_eoi(dpci_pirq(pirq_dpci));
-    }
-
-    return 0;
-}
-
-static void pt_irq_time_out(void *data)
-{
-    struct hvm_pirq_dpci *irq_map = data;
-    const struct hvm_irq_dpci *dpci;
-    const struct dev_intx_gsi_link *digl;
-
-    spin_lock(&irq_map->dom->event_lock);
-
-    if ( irq_map->flags & HVM_IRQ_DPCI_IDENTITY_GSI )
-    {
-        ASSERT(is_hardware_domain(irq_map->dom));
-        /*
-         * Identity mapped, no need to iterate over the guest GSI list to find
-         * other pirqs sharing the same guest GSI.
-         *
-         * In the identity mapped case the EOI can also be done now, this way
-         * the iteration over the list of domain pirqs is avoided.
-         */
-        hvm_gsi_deassert(irq_map->dom, dpci_pirq(irq_map)->pirq);
-        irq_map->flags |= HVM_IRQ_DPCI_EOI_LATCH;
-        pt_irq_guest_eoi(irq_map->dom, irq_map, NULL);
-        spin_unlock(&irq_map->dom->event_lock);
-        return;
-    }
-
-    dpci = domain_get_irq_dpci(irq_map->dom);
-    if ( unlikely(!dpci) )
-    {
-        ASSERT_UNREACHABLE();
-        spin_unlock(&irq_map->dom->event_lock);
-        return;
-    }
-    list_for_each_entry ( digl, &irq_map->digl_list, list )
-    {
-        unsigned int guest_gsi = hvm_pci_intx_gsi(digl->device, digl->intx);
-        const struct hvm_girq_dpci_mapping *girq;
-
-        list_for_each_entry ( girq, &dpci->girq[guest_gsi], list )
-        {
-            struct pirq *pirq = pirq_info(irq_map->dom, girq->machine_gsi);
-
-            pirq_dpci(pirq)->flags |= HVM_IRQ_DPCI_EOI_LATCH;
-        }
-        hvm_pci_intx_deassert(irq_map->dom, digl->device, digl->intx);
-    }
-
-    pt_pirq_iterate(irq_map->dom, pt_irq_guest_eoi, NULL);
-
-    spin_unlock(&irq_map->dom->event_lock);
-}
-
 struct hvm_irq_dpci *domain_get_irq_dpci(const struct domain *d)
 {
     if ( !d || !is_hvm_domain(d) )
@@ -568,15 +497,10 @@ int pt_irq_create_bind(
                 }
             }
 
-            /* Init timer before binding */
-            if ( pt_irq_need_timer(pirq_dpci->flags) )
-                init_timer(&pirq_dpci->timer, pt_irq_time_out, pirq_dpci, 0);
             /* Deal with gsi for legacy devices */
             rc = pirq_guest_bind(d->vcpu[0], info, share);
             if ( unlikely(rc) )
             {
-                if ( pt_irq_need_timer(pirq_dpci->flags) )
-                    kill_timer(&pirq_dpci->timer);
                 /*
                  * There is no path for __do_IRQ to schedule softirq as
                  * IRQ_GUEST is not set. As such we can reset 'dom' directly.
@@ -743,8 +667,6 @@ int pt_irq_destroy_bind(
     {
         pirq_guest_unbind(d, pirq);
         msixtbl_pt_unregister(d, pirq);
-        if ( pt_irq_need_timer(pirq_dpci->flags) )
-            kill_timer(&pirq_dpci->timer);
         pirq_dpci->flags = 0;
         /*
          * See comment in pt_irq_create_bind's PT_IRQ_TYPE_MSI before the
@@ -934,16 +856,6 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
             __msi_pirq_eoi(pirq_dpci);
             goto out;
         }
-
-        /*
-         * Set a timer to see if the guest can finish the interrupt or not. For
-         * example, the guest OS may unmask the PIC during boot, before the
-         * guest driver is loaded. hvm_pci_intx_assert() may succeed, but the
-         * guest will never deal with the irq, then the physical interrupt line
-         * will never be deasserted.
-         */
-        ASSERT(pt_irq_need_timer(pirq_dpci->flags));
-        set_timer(&pirq_dpci->timer, NOW() + PT_IRQ_TIME_OUT);
     }
 
  out:
@@ -967,10 +879,10 @@ static void hvm_pirq_eoi(struct pirq *pirq)
      * since interrupt is still not EOIed
      */
     if ( --pirq_dpci->pending ||
-         !pt_irq_need_timer(pirq_dpci->flags) )
+         /* When the interrupt source is MSI no Ack should be performed. */
+         pirq_dpci->flags & HVM_IRQ_DPCI_TRANSLATE )
         return;
 
-    stop_timer(&pirq_dpci->timer);
     pirq_guest_eoi(pirq);
 }
 
@@ -1038,9 +950,6 @@ static int pci_clean_dpci_irq(struct domain *d,
 
     pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
 
-    if ( pt_irq_need_timer(pirq_dpci->flags) )
-        kill_timer(&pirq_dpci->timer);
-
     list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
     {
         list_del(&digl->list);
diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/include/asm-x86/hvm/irq.h
index 532880d497..d40e13de6e 100644
--- a/xen/include/asm-x86/hvm/irq.h
+++ b/xen/include/asm-x86/hvm/irq.h
@@ -117,7 +117,6 @@ struct dev_intx_gsi_link {
 #define _HVM_IRQ_DPCI_MACH_PCI_SHIFT            0
 #define _HVM_IRQ_DPCI_MACH_MSI_SHIFT            1
 #define _HVM_IRQ_DPCI_MAPPED_SHIFT              2
-#define _HVM_IRQ_DPCI_EOI_LATCH_SHIFT           3
 #define _HVM_IRQ_DPCI_GUEST_PCI_SHIFT           4
 #define _HVM_IRQ_DPCI_GUEST_MSI_SHIFT           5
 #define _HVM_IRQ_DPCI_IDENTITY_GSI_SHIFT        6
@@ -126,7 +125,6 @@ struct dev_intx_gsi_link {
 #define HVM_IRQ_DPCI_MACH_PCI        (1u << _HVM_IRQ_DPCI_MACH_PCI_SHIFT)
 #define HVM_IRQ_DPCI_MACH_MSI        (1u << _HVM_IRQ_DPCI_MACH_MSI_SHIFT)
 #define HVM_IRQ_DPCI_MAPPED          (1u << _HVM_IRQ_DPCI_MAPPED_SHIFT)
-#define HVM_IRQ_DPCI_EOI_LATCH       (1u << _HVM_IRQ_DPCI_EOI_LATCH_SHIFT)
 #define HVM_IRQ_DPCI_GUEST_PCI       (1u << _HVM_IRQ_DPCI_GUEST_PCI_SHIFT)
 #define HVM_IRQ_DPCI_GUEST_MSI       (1u << _HVM_IRQ_DPCI_GUEST_MSI_SHIFT)
 #define HVM_IRQ_DPCI_IDENTITY_GSI    (1u << _HVM_IRQ_DPCI_IDENTITY_GSI_SHIFT)
@@ -173,7 +171,6 @@ struct hvm_pirq_dpci {
     struct list_head digl_list;
     struct domain *dom;
     struct hvm_gmsi_info gmsi;
-    struct timer timer;
     struct list_head softirq_list;
 };
 
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index f0295fd6c3..4f3098b6ed 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -184,11 +184,6 @@ int pt_irq_destroy_bind(struct domain *, const struct xen_domctl_bind_pt_irq *);
 void hvm_dpci_isairq_eoi(struct domain *d, unsigned int isairq);
 struct hvm_irq_dpci *domain_get_irq_dpci(const struct domain *);
 void free_hvm_irq_dpci(struct hvm_irq_dpci *dpci);
-#ifdef CONFIG_HVM
-bool pt_irq_need_timer(uint32_t flags);
-#else
-static inline bool pt_irq_need_timer(unsigned int flags) { return false; }
-#endif
 
 struct msi_desc;
 struct msi_msg;
-- 
2.29.2


