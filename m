Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F83303F2D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:46:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75062.135078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Og6-0002nr-6N; Tue, 26 Jan 2021 13:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75062.135078; Tue, 26 Jan 2021 13:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Og6-0002nL-2V; Tue, 26 Jan 2021 13:46:42 +0000
Received: by outflank-mailman (input) for mailman id 75062;
 Tue, 26 Jan 2021 13:46:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkR=G5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4Og4-0002mo-P9
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:46:40 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42f6c252-3aa8-4103-a788-c44e73f23caf;
 Tue, 26 Jan 2021 13:46:39 +0000 (UTC)
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
X-Inumbo-ID: 42f6c252-3aa8-4103-a788-c44e73f23caf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611668799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=hcu6rPXB0GnFJq4wOo4jGXsPQsFB9xSluXYQMH2pwfQ=;
  b=aEXSjKr80CrROtLH+bRDV0eBIPgOetTvLJmZJj/UoCfKaqlNP+Is1/+S
   6adbKRqMbeXf8nONA02BQnp1zetQJJEm8WrJ2I4rdWbtrt4+tvD5CevAq
   wZ2WVUVfVLZDZpeW9+d4XWV029PecHvQX8pZUp+1f1MrD6Kalb0Vg1Lb0
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: F+5N4xvlVypnhSJ/y4LMsFy7hTmvlT0cffeRQW4jbNh9fFCCP1GCqKkiUWkTctIeG2MjWWWGnL
 TsWpXxBEcHAcgajfA0Q2QC5aluTyL0CahuVgGOwVTj38nxff9xYX0I5bYGFqLY4v+Tzwo8MAUX
 xdQAzzkLKHpBSDeT7JNn+cV2sQN6DdU8K98lTHex/8rCOYpqRYYfRdZ5Kj39ffhL1OKfaZpPuw
 6qiPsuy456qgqxh/p/CqA3kPQHUFLP49z9Zk4EQKklwp0w5d1YjKoOZah1AVjCuYpEkINblnd6
 SSM=
X-SBRS: 5.2
X-MesageID: 36241636
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="36241636"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZs0h+3fSJx5DvXQrBzGES3tKd28KY16SjqW9Lx8pE31Irmn7VvxDr/P0l3PNEVVdhBZXOMv0Vq2HMZDhW3dDJ/JAQyteayqXz/Dkragnr8eVwmduWHwGD8e4fsP/0Hs4H2cGDBRQ2EtaxeapJqVcab3U3eZPdqTQ4y/gvv/QOkAYOR6vxAbEp3PcfQ6uCQ1D/KpNDJF6rz65MNKPiVJycwI+w3eatvz/faMqYnIVG4rY5yTMZpNz4nbQxL8MAUxuMGMzh92qxm7DR9jsRkAKqSwj3HcjSOvudTZFFazQAHCUHMcdrWO3+5h0rE4VSDbnlj7YPUUyLvLocwFHPt/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESUtauwQX8NuL5g6STCfuBsRHGMv9bFrt+yaDxNcMYw=;
 b=K1cpizfQnzueyqdUwH5+bUbycEuq4pV5YPdMh/6fyuLjcutzlLwSoRnVKNbbrsVtxXLa3+Or+FrL9bea1dbBJvSKa2FdeGpfETmWBpVIPZ7frsLHzTa20kduMj10LqfWwXJBt0CTkpT4QffSKxkALs6+7e0p4k7xG66lyXXJFK1fHMlTh0eeq0rrLV63S8AtsqUctomv0XdlPGvYtlYddMw/aVl5ShNdBwXDFPa9UNBV2P4ApLDPuQ54jwMkegLz7z1PmN3H5/HokDRmuOKCqb9P76LqFeoFfhBjib9b2Sk02eMVQu5k8PdT/fj/W259FPszG2dXSUHawXfykFssqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESUtauwQX8NuL5g6STCfuBsRHGMv9bFrt+yaDxNcMYw=;
 b=Docy04WjdBBFEGTqVuuKMn1ulIgRzsMP7kKF34uTxuEdvpldsXnOdgi8gHkmpigd51ZKm8YzGr64KRrZdphz6VgJLiqbkoWykFBpYWHSxEoSyzyPqcfXMUJDE5YMSJ8nu8iw7HSDPqwbKW8ILYNLGMvQSTM9l8RBEww7B8cM3zU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 6/6] x86/dpci: remove the dpci EOI timer
Date: Tue, 26 Jan 2021 14:45:21 +0100
Message-ID: <20210126134521.25784-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126134521.25784-1-roger.pau@citrix.com>
References: <20210126134521.25784-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0177.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::16)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f362332-9e36-4f2e-215c-08d8c200cc02
X-MS-TrafficTypeDiagnostic: DM5PR03MB3209:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB32097BA119A8329B687B084F8FBC9@DM5PR03MB3209.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RjFIeuz43TaSp5UaOvcqgwqMvz4igqJMjYBBurZh3bizXYVgUMknBSKsgsM6EcZktTa3iAPuyvo8GNrx8HXByWwWmjkvsfIXeda7JjFSVXELhvnKcs4LRQ418zOMj8/1QNV5ZQYH9S/lMqHTE/DkDxHiod2P4ktCnh7DDLAUdvrOAFlQLbkffRAsDuvHTAAXVE8x53bKQQrzY96jCrJWd4cMsDhUHXRS8k9a9jUiExrH+LQh48do2QHQLfZVRuTfvNZMU7h05rOTMM4SMIkjjvr9pUoA7sKfb+GMAMPfsPFUIznNGDrWzN1b5gDvfYxvUOmgMwPxQjodIGFS/yaNVVE+u0nnB6Il41JbAZ2mODAOtaLxxbAamV5IO3pYBNNkWAIdNX6+Ke9Hw7goWcNsfhR7TmzkemaWmNSsBTHAUvmB3/+r1k27GnGRgWjwiVL6IHCmGSA8tnB0y3loYP6jF6B7h751Gob7vkiOsCEMD1GfiLm4Rr9m3RB9HZ0f7Hb2Uf3YP5al3AsUYKeJAEvFnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(6666004)(6916009)(66946007)(8936002)(956004)(86362001)(36756003)(478600001)(2616005)(8676002)(83380400001)(4326008)(6486002)(186003)(6496006)(54906003)(16526019)(2906002)(1076003)(5660300002)(66476007)(316002)(26005)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dDUyQXBGdjlyS0FqaFpYYWszek9LbnhaYlZNK3FGUVZTTUpiM2g1RmNDaFoy?=
 =?utf-8?B?dkFNWWdnR3FWdzg2eHhLK2w0WkxLLzN1U2NObDZ3SWI2WE42RUIySkVCY0lI?=
 =?utf-8?B?ZXRiSkxYNjhWMFFNeFhsWGprdEFJVis5Ymt5ZzRxQXpNcCs4TnJFaGROQmxm?=
 =?utf-8?B?NktaQmYrYWoxSDVmTHV1UndFbmRaMzBjUzNWMXZUTms3RFhVdVMrWFJxOTl3?=
 =?utf-8?B?MHJmSEpuZVNrY2ZQTWFzbkg4TjNjd2J3OEhiMkk5VVVMbHhnYVI3NVNZNDdS?=
 =?utf-8?B?enhRMkVIays2UzJJb2doTk9iZGRzVFl5NCtPRWdDY2lVUFdaNm9qa09NZHVM?=
 =?utf-8?B?cFM1T0ZKYjczbTBqS2U5L2syT3U2QXRTeUhHclFqZHJDSjA1U0krQ2hOZFkv?=
 =?utf-8?B?VlBGeHdZQld3emJuM3RJTUVkcldEQmJoaUpMa21UV0FIZ24rc2pNMUxzcXB0?=
 =?utf-8?B?KytrTTJGWlBLcGlEYUJMQlRXWnVzNEZVNW9kaU0zWmloc05ZTHRXRVV5YU8x?=
 =?utf-8?B?TnFjTjkwa1dkSUdVT3BnaWJNYlRUdmViU3prWVBiSU9wR0M1WTZzS3NuSzJL?=
 =?utf-8?B?T2JOWDNERHB1Nm9ZODZHK2MyZVNralIwTGJDQmNUUXIrQTh4cVdIdXR0Misw?=
 =?utf-8?B?dHFHTXE5c3RPNy9QUThJMWNQREYxU05hN0pNRXNFSU9ORkRsZ3VWTzh0L2VX?=
 =?utf-8?B?T2x3a3JMNU9jRGVPZ1NZOUprMWI2RkZha0RibjQwTXpXZEJ5bjVSSDlOT2sx?=
 =?utf-8?B?VW1KaFZyNkVaNmxjakFXRklnWkJ1dSsyTVpQUHZ1UFFQZzhjaHI0M21Gd0w4?=
 =?utf-8?B?ejZTdTc2YS9mQW5iMUFvd1ZvZkp1VGN1NW9uUUJVYWxvd2srTllaa3A0ZFNH?=
 =?utf-8?B?cklPOCtOdXVGWlZLVmpBbkdSQy9HNlFZOGtQZm11cTNtWDUzWWoxOWttd2k1?=
 =?utf-8?B?ZzNqV1lJNTF4dkNXeSsrWjFINVM5SWhlN29NZUFTei9zZ1NyaCtEODhQVEFP?=
 =?utf-8?B?ZW1lV2VsM09jVGl5aGUvWWkzeTBDVDlyMEFnOHEvck1HUmpZU1ZaZVZqV2JP?=
 =?utf-8?B?ODdMQ3NzUjJwZHZSdnNEZG5DNTJTRnBNUFNXdFhYcDhibVlxVnhxR2tXVi9v?=
 =?utf-8?B?bUNVbzJDazhSb0FmL0I4YXkrS1hKd29ERjNUUUJncmR6ZVhLb2VkaGRPeVlZ?=
 =?utf-8?B?c29qQ0ZobzZnRDJrT2szd25iN0haSnZISmx6a2MvdC9VVGo3RHR3N1d6Qk4v?=
 =?utf-8?B?QWpYS3JHV3pTQnVGeVpkZ3VsbjZZTGx0UjhObTE2TGlLSHI2eFR5WmFQVVd5?=
 =?utf-8?B?em8yWjdxZ0dXSkZvLzRNMkl3RjNkMy9lRFowb0lmWTRzYnVuR3IyTGZhTmlZ?=
 =?utf-8?B?WllpZVVYZHQ0aURxOHFWWjhvVmZlZWZDeS9NQmZKWHE3NnhaQ3crTENscTJi?=
 =?utf-8?B?OGdWZVJoeSszZzdaYmczZ1JNL0V4dTZWSU5HMW5RPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f362332-9e36-4f2e-215c-08d8c200cc02
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 13:46:35.2739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HmbMAl3wDf3gqiTMY3EEsYXNduTJ5dU+hGVF+eAiivItDxQkWjBZKQgFGzdlmgyLkPWVDUI4IgOV+pVwbRi8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3209
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
index a6e2863c14..351daafdc9 100644
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
+         (pirq_dpci->flags & HVM_IRQ_DPCI_TRANSLATE) )
         return;
 
-    stop_timer(&pirq_dpci->timer);
     pirq_guest_eoi(pirq);
 }
 
@@ -1042,9 +954,6 @@ static int pci_clean_dpci_irq(struct domain *d,
 
     pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
 
-    if ( pt_irq_need_timer(pirq_dpci->flags) )
-        kill_timer(&pirq_dpci->timer);
-
     list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
     {
         list_del(&digl->list);
diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/include/asm-x86/hvm/irq.h
index 7f76f6c437..07b1ab99cd 100644
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
@@ -171,7 +169,6 @@ struct hvm_pirq_dpci {
     struct list_head digl_list;
     struct domain *dom;
     struct hvm_gmsi_info gmsi;
-    struct timer timer;
     struct list_head softirq_list;
 };
 
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 863a68fe16..192ee07127 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -183,11 +183,6 @@ int pt_irq_destroy_bind(struct domain *, const struct xen_domctl_bind_pt_irq *);
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


