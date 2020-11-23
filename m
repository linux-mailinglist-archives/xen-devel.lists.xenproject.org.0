Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469872C07F5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 13:51:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34209.65077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBJV-0003fE-4I; Mon, 23 Nov 2020 12:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34209.65077; Mon, 23 Nov 2020 12:51:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBJV-0003eo-13; Mon, 23 Nov 2020 12:51:25 +0000
Received: by outflank-mailman (input) for mailman id 34209;
 Mon, 23 Nov 2020 12:51:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1khBJT-0003ei-Gm
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:51:23 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31a95a6f-9ede-4aad-97ab-3266d758226c;
 Mon, 23 Nov 2020 12:51:22 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1khBJT-0003ei-Gm
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:51:23 +0000
X-Inumbo-ID: 31a95a6f-9ede-4aad-97ab-3266d758226c
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 31a95a6f-9ede-4aad-97ab-3266d758226c;
	Mon, 23 Nov 2020 12:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606135882;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SfC3p/z9eWWdbWa/c5ZLmvKkAg+PRbhplWH4zRvZ6tY=;
  b=VcSrpFLosPffYvtnOpZTqvv0mqDvqasUsbQ4KQQ0H1UaJPtHDG7kgGi6
   79OaOmO+L/3wYCD7M+2amW5n0YSaJ+urs6k9kE5Zw7mdVBLZR49aOyW+O
   3c91E2HMyD2iwHbK72B+Qj0TrFJUdQWwvmj2ss2ulXSb3KK3zK99tHhhd
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2D09qRZfCGM8GLFzpPQhyuTjolrFcwmMot1c+i67v30RLY3E8pUkb+LeYHG/9BMtg8tgq8bbtf
 DR4qkLXlRDEaiWZuwaWR69vcOG1PimAob5mI6PQRFXzyL9/EFbBoc7r3oVw2UFsXMx6pJf6+Pa
 7FvUXOJ9MwtZl7l1ehi0hPLAyVc7wWqcwFAJvPaG9mHxVFtLDUnyhP3PnMy1I95Q94PBv0lFFb
 Ou7bIKAmSEEjVO7B5TmuhKlnbFJ3M3fXuWV21Ff7WWL50+27ZTs0yeFjj8U64C0ghTmYh8uZTf
 cxs=
X-SBRS: None
X-MesageID: 31708105
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="31708105"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrv/o9PbOAi6UxfPCsN8M30AGXRqZF2fkEjLZlYuxmtqaIJHthfVD/CDr6P9HKHglNBkEVfCFEaQtA9nGe+SxsmcHpMXJYJ7VG6IIIEavI2WeEM3kmHjTkgBPErYWG1SarRJ8Z0fbiMRVkpAfaHCswEug6RQqd1Azi4hkTWawJGqhSiP0Wup+N0J+0IG7Z8f3Xl4gLDgv7v15nDhIX/slnhm5YZkEy6+Hl5h6EN+SnJVkmVwlEhKC+gH1dcc83+HG/a0sUAvKEebbxmZMLzCPXg+3OlSBv+NA2NOdunJP7AMzYI2HzG5Od8Bcsts/tcc3b3sM9wJ7jkNuByNwT8ORA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wS4mvdF9pF3kroJXsX5KKF0x+deMXeeFrt+fAWdTMlc=;
 b=OVAVbj4dW95SxhnKVo3NU30BVdyTMczYVkNr8bEsoAtNK+DPIiJrCsObBt2hxu8x4aGeX2OvglD9YU5fISIdjCRDJ0IFGR0ZASSTAqrHgzmGkRpy/qTHiIh9rlQVyWayX0QxxThLn1gBcqn3VCZHlQrIhWZ+jq5w0aT08R05drrR3T02anU8tbLcc1wMyEocVFSecwatpIzBZpG8iSsFys6iIUghvCt6IBHSbUyzurEMiz5PGa4rqtDqr+ImYyVGzCfLJD/H06SVWrmQlN9awHnZSDf6lR1/37ptSv3VGb8EcUZUccdx1lhD7TbZ/cTN9wyhwXgGe+nrlI7GmC11gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wS4mvdF9pF3kroJXsX5KKF0x+deMXeeFrt+fAWdTMlc=;
 b=pAKucgd4XzFTW17K1IMFTCPXle6yJ5iBmSnT+2UMHw4ArXmCu2rPyAonzw50ulBdKhQFreXbB0t89wifOyTf+I+zOdXs6ObdIS0wysVRdUtCncca//qsPbFt6hOt5R98tD9FoaA9T1WnIqhoLs6eRe5yz4gZZpsC3Vt1lz0manU=
Date: Mon, 23 Nov 2020 13:51:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
References: <20201119175733.GA6067@antioche.eu.org>
 <1a50e1e2-b69c-afd6-a179-316231512004@suse.com>
 <20201120082855.5z4cibcd5djlwmgp@Air-de-Roger>
 <20201120085249.GA1508@antioche.eu.org>
 <97f371a9-00fe-33fe-8923-c247f44f9af6@suse.com>
 <20201120092754.GH1508@antioche.eu.org>
 <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
 <20201120103824.GJ1508@antioche.eu.org>
 <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
 <20201123113241.GE2520@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201123113241.GE2520@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0173.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::12)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b6be81e-432f-472c-e769-08d88fae7821
X-MS-TrafficTypeDiagnostic: DS7PR03MB5607:
X-Microsoft-Antispam-PRVS: <DS7PR03MB5607AA64FBCC3735E07786728FFC0@DS7PR03MB5607.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wAYhAsCgu+r8UfPR06RqUfsedtDOjXeNiSSKJdsN7je9lPhVOKuf7gqJs+BU6XWsmC0mGQdgn3aCM0ShI3Y21Qg+xyjUwWWfXjTnfy0yza83nE1VuzTLUI91IbAC1+T1S6W1gTddDuhgtu1d7HWiYV/nYuWHKlYgYRnOQDV9zpWgOrb8CMX7/pXJphvLUuzcotyyH1dxtSlws0kxPnLu9GstxuC548ONNxWFitO8hQwGC+xWYakP5WWLWbuO9UxMAiFmDYCLQclqumZGk5yXbxcdNhy0Dv6Q2hVel/aL6EyPkCa89vuHhJi5DmpAIXlk6Hz+AP8FJVvoOwrquElx3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(8676002)(9686003)(86362001)(26005)(5660300002)(83380400001)(6916009)(316002)(956004)(66946007)(6486002)(66476007)(85182001)(66556008)(1076003)(186003)(478600001)(16526019)(4326008)(6666004)(2906002)(6496006)(8936002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: M5F770z8JJ5BE3Q+nzQEs1oj0FJ5OgD2uLMlt8rM9o1BZd617fCO3k1rj/NrjAjm3xrn7ICBZ/hGStWQjb4j0BiNnJijCOOx9SNKERhNohWNhZnGJhBsiU47yAWATfDTEP6sjxjWe8F+EClkjzNbBBkNUvRbjK22jEeQVCjea6ch3zIs6BHuJyf4+bcU6XD4ZkMg6Mz/IRPdWp2pmXnUuYfRSqJpLH46zL5S7eyASTNhYhfpxUr+mjtmjBVXHq0P3N6QY7D91wgB9EPA4NCDYpJNpxhn9ipQ4NDDWBqBuUOk8CCku2ZIyRCC4IFF82uM7Ct2PcBP0DkaB4IyMV6dQTc0GxULw2W2ZK6QgqMmUfhPFz2W6buhC6uOJ2hUuadG7PDGHkrVpfhGrsN1Yfxt1660AEdMBoR9Ntgg3O0xw+gBvm2cX0G06DLCnrEFCUEPh2p7pT1zEN1iB69NCFe8gPJgtap3wZ+u8swQlXaUTB8yG70ojkAO724Erya4RO/QIvhdvyI3bsJ6t/QhpgFq9KesA7N9Wdk6q+PvHSJItAjkFOElq8GOgB8tYB0CW+RaFFTC6+yIOz3RRkDaLJ7pm6DNId8IVA0BUN5MM6R6q0u49jxqh8s7GWLVHDCL7R1UUmh5f1+pEzmLYNpjUP9H9gQaPynxtCwTiLCO03PyXcCKQOPDsTKbgLV8bG2Cue98X1qP4919lttgmb1EfingZUFcHFho41XORZihCYsl2/uZ9hAYudBvBOSfpvfHb79t918sBOXBA5cHtUVzKDJsWW4mULZnvJKTh39e9Fpgxyqxz/Ra4Ai4E5JiAlTu4rEUTL5I6e2bfy1lyXCFPgr4JaNhg0xb6xDZwUB8in+W/x4z6OiSwDjdMrl33rBG0zY5GgvsFvbMSldv1USwF9hjyQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6be81e-432f-472c-e769-08d88fae7821
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 12:51:17.6699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76XGQAHkkMK1DMQFuht1AtlNe/osqXRUouawicdW5qqRBcGh9hOkbbhzBV2oNTZQvqgJZdHEJ7CeerEuq4JtoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5607
X-OriginatorOrg: citrix.com

On Mon, Nov 23, 2020 at 12:32:41PM +0100, Manuel Bouyer wrote:
> On Mon, Nov 23, 2020 at 10:57:13AM +0100, Roger Pau Monné wrote:
> > > [...]
> > > OK.
> > > I finally found where the EOI occurs (it's within a macro so s simple grep
> > > didn't show it).
> > > 
> > > When interrupts are not masked (e.g. via cli), the ioapic halder is called.
> > > From here, 2 paths can happen:
> > > a) the software interrupt priority level (called spl in BSD world) allows the
> > >   driver's handler to run. In this case it's called, then the interrupt
> > >   is unmasked at ioapic level, and EOI'd at lapic.
> > > b) the software interrupt priority level doesn't allow this driver's handler to
> > >   run. In this case, the interrupt is marked as pending in software,
> > >   explicitely masked at the iopic level and EOI'd at lapic.
> > >   Later, when the spl is lowered, the driver's interrupt handler is run,
> > >   then the interrupt is unmasked at ioapic level, and EOI'd at lapic
> > >   (this is the same path as a)). here we may EOI the lapic twice, and the
> > >   second time when there's no hardware interrupt pending any more.
> > > 
> > > I suspect it's case b) which causes the problem with Xen.
> > 
> > Case b) should be handled fine AFAICT. If there's no interrupt pending
> > in the lapic ISR the EOI is just a noop. Iff there's somehow another
> > vector pending in ISR you might actually be EOIing the wrong vector,
> > and thus this would be a bug in NetBSD. I certainly don't know much of
> > NetBSD interrupt model in order to know whether this second EOI is just
> > not necessary or whether it could cause issues.
> > 
> > Can you actually assert that disabling this second unneeded EOI does
> > solve the problem?
> 
> I tried this, and it didn't change anything ...
> 
> I'm out of idea to try.

Hm, yes, it's quite weird. Do you know whether a NetBSD kernel can be
multibooted from pxelinux with Xen? I would like to see if I can
reproduce this myself.

I have the following patch also which will print a warning message
when GSI 34 is injected from hardware or when Xen performs an EOI
(either from a time out or when reacting to a guest one). I would
expect at least the interrupt injection one to trigger together with
the existing message.

Thanks, Roger.
---8<---
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 67d4a6237f..bbd141a3d9 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -43,7 +43,12 @@
 /* HACK: Route IRQ0 only to VCPU0 to prevent time jumps. */
 #define IRQ0_SPECIAL_ROUTING 1
 
-static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int irq);
+static void _vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int irq);
+
+bool __read_mostly irqprint;
+#define vioapic_deliver(vioapic, irq) ({\
+    WARN_ON(irqprint && vioapic->base_gsi + irq == 34); \
+    _vioapic_deliver(vioapic, irq); })
 
 static struct hvm_vioapic *addr_vioapic(const struct domain *d,
                                         unsigned long addr)
@@ -119,6 +124,16 @@ static uint32_t vioapic_read_indirect(const struct hvm_vioapic *vioapic)
 
         if ( redir_index >= vioapic->nr_pins )
         {
+            switch ( vioapic->ioregsel )
+            {
+            case 3:
+                irqprint = true;
+                break;
+
+            case 0xf:
+                irqprint = false;
+                break;
+            }
             gdprintk(XENLOG_WARNING, "apic_mem_readl:undefined ioregsel %x\n",
                      vioapic->ioregsel);
             break;
@@ -391,7 +406,7 @@ static void ioapic_inj_irq(
     vlapic_set_irq(target, vector, trig_mode);
 }
 
-static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
+static void _vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
 {
     uint16_t dest = vioapic->redirtbl[pin].fields.dest_id;
     uint8_t dest_mode = vioapic->redirtbl[pin].fields.dest_mode;
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 8d1f9a9fc6..91fb99d271 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1388,10 +1388,12 @@ static void set_eoi_ready(void *data)
     flush_ready_eoi();
 }
 
+extern bool irqprint;
 void pirq_guest_eoi(struct pirq *pirq)
 {
     struct irq_desc *desc;
 
+    WARN_ON(irqprint && pirq->pirq == 34);
     ASSERT(local_irq_is_enabled());
     desc = pirq_spin_lock_irq_desc(pirq, NULL);
     if ( desc )
@@ -1837,6 +1839,8 @@ static void do_IRQ_guest(struct irq_desc *desc, unsigned int vector)
     unsigned int        i;
     struct pending_eoi *peoi = this_cpu(pending_eoi);
 
+    WARN_ON(irqprint && desc->irq == 34);
+
     if ( unlikely(!action->nr_guests) )
     {
         /* An interrupt may slip through while freeing an ACKTYPE_EOI irq. */


