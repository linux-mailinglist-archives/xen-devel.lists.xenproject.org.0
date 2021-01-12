Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F71F2F3735
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 18:33:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65799.116559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzNXg-0007o5-0f; Tue, 12 Jan 2021 17:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65799.116559; Tue, 12 Jan 2021 17:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzNXf-0007ng-TP; Tue, 12 Jan 2021 17:33:15 +0000
Received: by outflank-mailman (input) for mailman id 65799;
 Tue, 12 Jan 2021 17:33:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=59Pv=GP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kzNXe-0007nb-JF
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 17:33:14 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ed764f0-62db-40a2-b944-a61835640a9b;
 Tue, 12 Jan 2021 17:33:12 +0000 (UTC)
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
X-Inumbo-ID: 0ed764f0-62db-40a2-b944-a61835640a9b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610472792;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=5b5EEB5n2KPMQJ0RAxzQ00aVaFTw9QTTSKZEcpUIoaw=;
  b=Y4ttE/yL2ywxCR+WND+NfDDr0+BldfdF3bc1YN9cWsSd/BqFQ9BBKWBn
   QZzysDE10JkRfD17wcez1EdZb0d+mI6dzBdOCxJmuVKo/C/d4Ei6TE0F/
   5hvVoAIWJvQ/5E4vtpZ13mCjr72K9w2Lf8BegjnP6L5ByxFfLWJrieiDa
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6EjmcShuvERNWkPJVnz2QJ1mDoLNQRsfeKtmrYX6lyI/bpP6SYRygSxx1JY32mTN9q8RtoUYsv
 ox4HN/Sm591Rz8HvbXCItW1zCqtCE7qnFVlUv/G7RHkl79zRiqPuCtBVY7WMpkII8VBBHha6Za
 Pah4I3LSc3kbyDqjuIz0TljVUFFvaNldu+2qjrHAmdwxXJeghwz5+fV3Zt+zbq0MpOirKCIFgW
 rDJRHTonp5YKPxKREasAov15Z6dzYv3DPMl5QNThvQJmkqx1v9f5JsCWJG3aigi33lpyHQOVtY
 y8g=
X-SBRS: 5.2
X-MesageID: 36223295
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,342,1602561600"; 
   d="scan'208";a="36223295"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCIU9qG7/HzscFs2XtKZMmsw21me4hPBun/LRQDN5RH1SbvlVTJw8eM+8bNutagoSz9jZ8DYlEKknn5Zl0AnYSs7sm5EHJXw0teuh0FhSTubF33O+CygN0Q76WNh6pQij6n9ceuLBWTMJHDJbcnWr/Je78iUzWhVWCvgyeWUX7UuDiYcwNg8ZCf4VcuWbYd20TOblEIwGM+/ks+10JjZzhqNo8CDMFTgMiSZ7PgxB2RtI1cUXwq2E/0wXJgXKPurhiCqKzfEq532zKlpOMiXy/Y1liFXjQul/NzeL7HPCSuzKExr5ckbDfpZGrq+0VyN6KyatkDsFNNpEzJJNXRFRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tczF6TeA7GIOiOdn1PrWZZNCA5w8PkBFAyvUKwedo0M=;
 b=CgPW6e/Qq5QTqcTmY75aerqtYkoywbu3d8dUVkxxNLjvsjersx+7bH1yZx/Lo69HayIuPBMS2yVJGxG9js3sWaXuNOqjjTv2bdAZ7uGxgy6qb0rs6v7UsLi8mgcJhWmTdS+75vJ5PkSXHAw3+iXAanwIPLnvz3XTygd8ODIPp63/LD8nZLUb9sKFhMsvvokZZ1y3cxMZgSoSYCWY2eGMzBannY54KwmgjMWK4vW4IguOU/ElLADNA0tdNLCaQewBAqQsskipMPztXf/K48JnQEaFKCxFfGGtJM+8GFJzpH0v1Q3364MysdMcVYa+rD+FQtwTJNE+/ZIq3JPEuETgCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tczF6TeA7GIOiOdn1PrWZZNCA5w8PkBFAyvUKwedo0M=;
 b=Z42Lwk+xd/PFDenKV+JlEflEaVsqvVKtXCmGWvEyb2NZXYMJ8c2tUDh/DgP2LhTEKTYOBtbgUpPveyZVh9R5Pp4QHVAbFgy9cOAclvok2nA7gC/k2C8VdA+lXKwAabBS7F1zR8P8aEhNfsmNyLlViwFT8jZ1kcPVMEOvnLS7aNY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/dpci: remove the dpci EOI timer
Date: Tue, 12 Jan 2021 18:32:48 +0100
Message-ID: <20210112173248.28646-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0006.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9293530-f43f-404f-744d-08d8b7201d27
X-MS-TrafficTypeDiagnostic: DM6PR03MB5323:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5323F751A5213BA07E297E908FAA0@DM6PR03MB5323.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: al+/05UEeCT/1H8+QSxaOJiRP6yN/47G5eTUK77NNnV/j39nAMizXEmSIfxnHI5CrU0U3Tp+B2c9rW5Q7TJEGRqYMxpG+I2mlCQpIB9P1TmCUj1ThnjD/DrFHpmeKqGDExFVUVHmX5ZxdGebXn5+hKagRIyzRskkGj4OzsKLYeqYh3dESwop7AXX6f+fGsz/A6sWBJfv0ujsJ41XwRFGUzJtW8K6brATOoejhz7pCrB535FaehXFJJG/JwLGVt1HNBKOWRwQHSKpt+yrnJ4ocUYmHcMKn6YcBD2PsJGsH2spC1yfq52I7nYhWlTW9LBWKpc+5moGb4pPkIO0gQOmH2VKZpWTI6NnCz3Tpm6m2uXet2fjWjFBOauliyXsVLBeyvPMsuG2TFt2y577+cJTxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(6486002)(5660300002)(8676002)(6916009)(1076003)(6496006)(86362001)(2616005)(54906003)(2906002)(16526019)(6666004)(316002)(26005)(478600001)(8936002)(83380400001)(66556008)(66946007)(36756003)(186003)(66476007)(4326008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QkNLN1ZucEVoK1NaN3U4WU85Z1dhUElOS0xwN25lRGs1YVhCQ05XUStZdjJm?=
 =?utf-8?B?ZzFzMGluS3NMY2hNY0dqM1JBeGE0WEdFck84V2FXL0V4M1ovbzdJNU1EQ1I5?=
 =?utf-8?B?Y3ZncWVuUDJyaWpoWk4zdU5BUnNCL2ZKWmdNUVdPeHpPVUNqSTVhTXVqVmhH?=
 =?utf-8?B?Wng3aHA5RXNBL0g0c2N0UDFiUk1CWlpOTGlOZWJMcVgxcGR6ZjFJMGJieitu?=
 =?utf-8?B?ZTd0Rm4vdnV1b0p3dkxTcjh0YmFid2ZPWjluU01mOUpZN080VGNWaDcyWWd4?=
 =?utf-8?B?eEQyVmdtKzI5ekdaeERROExjb0NXNmRiaTdEUnA5L1VoTkthOWQyWXdZNS8z?=
 =?utf-8?B?d1B3TjZMNExOT21KZnhpTWk2NlFITnMycXgrVWR5VmJnMVE0MG1wdWpwNTZ2?=
 =?utf-8?B?elNnZmFsaDNncjZ5OHplSmxvVUFmUzYzQlEwQldpaHRYRTFJd1NmODcyc2JL?=
 =?utf-8?B?ZDNEL0RERytiOS8yTDhOQXFpMlBNU2NRR01vZ25Kak1ibjBuUFNTVzRUcDl0?=
 =?utf-8?B?TDdXanNiS3hab2pqdkhveVhWeVRtbWF2K3VVd3NKTmFkQXZIY1l6TTNDNHl1?=
 =?utf-8?B?YVBJeGFEZyt5M1IzRnlScCt4UWNmVkx0Q2hmci9DSVZlRTlJK1RoNDZuWk1L?=
 =?utf-8?B?U1RKS2xYZ3VBVzdqMHdLc3JVeGI5QzdKUUZ4NW9qMi9lUHJ2YTc3MVlvdml3?=
 =?utf-8?B?Y0dmdlJrZkJBWkZEQWJOaVNwMnNuakdxWUFLRVRtNFNNV0dhbEhaSVkyVkpi?=
 =?utf-8?B?aGxHZWpUcnNncE11OHNJMWJDVURsZFBmOEFvb296SENEQ1NFUS9VbTNNY0lm?=
 =?utf-8?B?VFZsTzZhV0JONFJ3SnhBSVppQlQ4TGh4SmhlajRWMVJoMDlReHlVWlNrcWli?=
 =?utf-8?B?TFZIVmlNUGh2dlZubFZPWGZMaHVJR0ptNWM0OEdqc1JucmhPeUdBeHNzd2tY?=
 =?utf-8?B?bnRjRUpHYi9ZOTFvcWhPSXhHMlpkY3FMQ1N1STRUTzFCWVFuYkpGZUVTWHNY?=
 =?utf-8?B?YTlCSzJFYW5tZ2duNGx3R2lTUHVDcVUwcjIvaWFscHR4ajU2ZmhBS2FlN3dG?=
 =?utf-8?B?STEvL2QxV090TWk2NGhoV3FydUFHN2J2emZwN3lKelBNZFMxOGd2cWxLa3BI?=
 =?utf-8?B?bGxVMzRZTVZ1NnZsOURKNXUzRkZjQjZVd08vSVpKYVFiVG81aEdoTWlyaGJi?=
 =?utf-8?B?SVVycmxGWlUvU0xXd25FdG1PZWh4UzQzS1JuMWN5Q21IMC9Cd0VWK09KcG52?=
 =?utf-8?B?ZmZZQ0JEa1ZURFJTQ29iZENveWtqM1NlWUdkRGJPUHRXNWZVVjJwTUw3UDFH?=
 =?utf-8?Q?njBgurLQVdPNei+gRp8LH/yA1E0X9GYYUU?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 17:33:02.7741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: b9293530-f43f-404f-744d-08d8b7201d27
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wb3KdfLcP1PUG16i3zB7sgAlatBO/8wivEi1Ol+z3L0YeOikeJpT06ooIpVGP5EB+0vnNLXp27kDbn+WHH0Lig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5323
X-OriginatorOrg: citrix.com

Current interrupt pass though code will setup a timer for each
interrupt injected to the guest that requires an EOI from the guest.
Such timer would perform two actions if the guest doesn't EOI the
interrupt before a given period of time. The first one is deasserting
the virtual line, the second is perform an EOI of the physical
interrupt source if it requires such.

The deasserting of the guest virtual line is wrong, since it messes
with the interrupt status of the guest. It's not clear why this was
odne in the first place, it should be the guest the one to EOI the
interrupt and thus deassert the line.

Performing an EOI of the physical interrupt source is redundant, since
there's already a timer that takes care of this for all interrupts,
not just the HVM dpci ones, see irq_guest_action_t struct eoi_timer
field.

Since both of the actions performed by the dpci timer are not
required, remove it altogether.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
As with previous patches, I'm having a hard time figuring out why this
was required in the first place. I see no reason for Xen to be
deasserting the guest virtual line. There's a comment:

/*
 * Set a timer to see if the guest can finish the interrupt or not. For
 * example, the guest OS may unmask the PIC during boot, before the
 * guest driver is loaded. hvm_pci_intx_assert() may succeed, but the
 * guest will never deal with the irq, then the physical interrupt line
 * will never be deasserted.
 */

Did this happen because the device was passed through in a bogus state
where it would generate interrupts without the guest requesting

Won't the guest face the same issues when booted on bare metal, and
thus would already have the means to deal with such issues?
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


