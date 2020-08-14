Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFDA244B4A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 16:42:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6atl-00041C-Ad; Fri, 14 Aug 2020 14:41:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCCI=BY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k6atk-000417-Dg
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 14:41:36 +0000
X-Inumbo-ID: 0cd10582-c7a2-4501-95ed-07eb079c7aa5
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cd10582-c7a2-4501-95ed-07eb079c7aa5;
 Fri, 14 Aug 2020 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597416095;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Kv2fF5No4N9w7Vh3RTqjk2kqqDXatSINmrbuDIuVnqE=;
 b=LFBBCT1rKVdrP3VkREG0NptgP+QDkzYO/msZBa6lpboc/NHuZgGgtNCk
 Wut86/6zRmf8A2MM56BCmJdEzyu//VOr1P4+2uSVF2YXhBsBoBb/1UaoD
 o53rzCr9nVjYV0vEDvyjDDzLbR+RJhVoXAGcskPDy/bG5IbcJ5a9Q2bxU k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0rwV0jQmHtZzFWESy+q57kZeD3Z3tEyfds1g/tW+HpA58+xr/4Z8xUVj4ilEKuSCtKecYhsMAn
 ZpFV6/cH/eXJypxSsNYR+HSyCxJVrxKJwf/QB3X8zHpEv1hHDR9S8+ydHMj1fz0ZoHXyFOPReZ
 2rpAm2dHty5u+KLTbR9TFtm9/E2anrOpxNwSXZS0MTKexWbnw7XLcCCXYjjjyN/UgBI4/C3hSr
 9YFQKJJ1B6Fe/pObleXHgadMK5R9rvQvmo4L7VXPcTGL12j8OtO6C1v3L926qb+YYpcYclpkf7
 WBw=
X-SBRS: 2.7
X-MesageID: 24563432
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,312,1592884800"; d="scan'208";a="24563432"
Date: Fri, 14 Aug 2020 16:41:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: <paul@xen.org>, <xen-devel@lists.xenproject.org>, 'Eslam Elnikety'
 <elnikety@amazon.de>, 'Andrew Cooper' <andrew.cooper3@citrix.com>, "'Shan
 Haitao'" <haitao.shan@intel.com>, 'Jan Beulich' <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v2] x86/hvm: re-work viridian APIC assist code
Message-ID: <20200814144126.GM975@Air-de-Roger>
References: <20180118151059.1336-1-paul.durrant@citrix.com>
 <1535153880.24926.28.camel@infradead.org>
 <7547be305e3ede9edb897e2be898fe54e0b4065c.camel@infradead.org>
 <002d01d67149$37404b00$a5c0e100$@xen.org>
 <20200813094555.GF975@Air-de-Roger>
 <999f185404fcedc03d8cf1bd1f47a492219b8e9b.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <999f185404fcedc03d8cf1bd1f47a492219b8e9b.camel@infradead.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Aug 14, 2020 at 03:13:51PM +0100, David Woodhouse wrote:
> On Thu, 2020-08-13 at 11:45 +0200, Roger Pau Monné wrote:
> > > The loop appears to be there to handle the case where multiple
> > > devices assigned to a domain have MSIs programmed with the same
> > > dest/vector... which seems like an odd thing for a guest to do but I
> > > guess it is at liberty to do it. Does it matter whether they are
> > > maskable or not?
> > 
> > Such configuration would never work properly, as lapic vectors are
> > edge triggered and thus can't be safely shared between devices?
> > 
> > I think the iteration is there in order to get the hvm_pirq_dpci
> > struct that injected that specific vector, so that you can perform the
> > ack if required. Having lapic EOI callbacks should simply this, as you
> > can pass a hvm_pirq_dpci when injecting a vector, and that would be
> > forwarded to the EOI callback, so there should be no need to iterate
> > over the list of hvm_pirq_dpci for a domain.
> 
> If we didn't have the loop — or more to the point if we didn't grab the
> domain-global d->event_lock that protects it — then I wouldn't even
> care about optimising the whole thing away for the modern MSI case.
> 
> It isn't the act of not doing any work in the _hvm_dpci_msi_eoi()
> function that takes the time. It's that domain-global lock, and a
> little bit the retpoline-stalled indirect call from pt_pirq_interate().
> 
> I suppose with Roger's series, we'll still suffer the retpoline stall
> for a callback that ultimately does nothing, but it's nowhere near as
> expensive as the lock.

I think we could ultimately avoid the callback (and the vmexit when
running on Intel with virtual interrupt delivery) by not registering
any callback when injecting a vector that originated from a source
that doesn't require any Ack, the diff below should be applied on top
of my series and I think should remove the execution of a callback
when there's no Ack to perform. Still pretty much a proof of concept
and could do with some further cleanup.

---8<---
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index e192c4c6da..483c69deb3 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -110,7 +110,7 @@ int vmsi_deliver(struct domain *d, int vector, uint8_t dest, uint8_t dest_mode,
                                  trig_mode, NULL, NULL);
 }
 
-void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
+void vmsi_deliver_pirq(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
 {
     uint32_t flags = pirq_dpci->gmsi.gflags;
     int vector = pirq_dpci->gmsi.gvec;
@@ -118,6 +118,7 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
     bool dest_mode = flags & XEN_DOMCTL_VMSI_X86_DM_MASK;
     uint8_t delivery_mode = MASK_EXTR(flags, XEN_DOMCTL_VMSI_X86_DELIV_MASK);
     bool trig_mode = flags & XEN_DOMCTL_VMSI_X86_TRIG_MASK;
+    struct pirq *pirq = dpci_pirq(pirq_dpci);
 
     HVM_DBG_LOG(DBG_LEVEL_IOAPIC,
                 "msi: dest=%x dest_mode=%x delivery_mode=%x "
@@ -127,7 +128,7 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
     ASSERT(pirq_dpci->flags & HVM_IRQ_DPCI_GUEST_MSI);
 
     vmsi_deliver_callback(d, vector, dest, dest_mode, delivery_mode, trig_mode,
-                          hvm_dpci_msi_eoi, NULL);
+                          pirq->masked ? hvm_dpci_msi_eoi : NULL, pirq_dpci);
 }
 
 /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id */
diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
index 3793029b29..2a0b7014f2 100644
--- a/xen/drivers/passthrough/io.c
+++ b/xen/drivers/passthrough/io.c
@@ -851,29 +851,6 @@ static void __msi_pirq_eoi(struct hvm_pirq_dpci *pirq_dpci)
     }
 }
 
-static int _hvm_dpci_msi_eoi(struct domain *d,
-                             struct hvm_pirq_dpci *pirq_dpci, void *arg)
-{
-    int vector = (long)arg;
-
-    if ( (pirq_dpci->flags & HVM_IRQ_DPCI_MACH_MSI) &&
-         (pirq_dpci->gmsi.gvec == vector) )
-    {
-        unsigned int dest = MASK_EXTR(pirq_dpci->gmsi.gflags,
-                                      XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
-        bool dest_mode = pirq_dpci->gmsi.gflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
-
-        if ( vlapic_match_dest(vcpu_vlapic(current), NULL, 0, dest,
-                               dest_mode) )
-        {
-            __msi_pirq_eoi(pirq_dpci);
-            return 1;
-        }
-    }
-
-    return 0;
-}
-
 void hvm_dpci_msi_eoi(struct vcpu *v, unsigned int vector, void *data)
 {
     struct domain *d = v->domain;
@@ -883,7 +860,7 @@ void hvm_dpci_msi_eoi(struct vcpu *v, unsigned int vector, void *data)
        return;
 
     spin_lock(&d->event_lock);
-    pt_pirq_iterate(d, _hvm_dpci_msi_eoi, (void *)(long)vector);
+    __msi_pirq_eoi(data);
     spin_unlock(&d->event_lock);
 }
 
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index be0d8b0a4d..c28fbf96f9 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -264,7 +264,7 @@ int vmsi_deliver(
     uint8_t dest, uint8_t dest_mode,
     uint8_t delivery_mode, uint8_t trig_mode);
 struct hvm_pirq_dpci;
-void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *);
+void vmsi_deliver_pirq(struct domain *d, struct hvm_pirq_dpci *);
 int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_mode);
 
 enum hvm_intblk


