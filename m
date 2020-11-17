Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DFB2B6932
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 16:58:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29105.58356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf3N7-0001JI-7r; Tue, 17 Nov 2020 15:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29105.58356; Tue, 17 Nov 2020 15:58:21 +0000
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
	id 1kf3N7-0001It-4k; Tue, 17 Nov 2020 15:58:21 +0000
Received: by outflank-mailman (input) for mailman id 29105;
 Tue, 17 Nov 2020 15:58:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcuG=EX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kf3N5-0001Io-B2
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 15:58:19 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffca296e-dded-4ea1-9ddc-98f0ceab0b40;
 Tue, 17 Nov 2020 15:58:17 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rcuG=EX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kf3N5-0001Io-B2
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 15:58:19 +0000
X-Inumbo-ID: ffca296e-dded-4ea1-9ddc-98f0ceab0b40
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ffca296e-dded-4ea1-9ddc-98f0ceab0b40;
	Tue, 17 Nov 2020 15:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605628697;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=SGn6ZqOB9PaDN918fLYt0ItUj4Dmmqy9DE1QD6gV1wU=;
  b=gspD/UB/A1Zm4Ralp7TNdT1iK3rBxSDBI0UDChp7yRxio/jlRDsF7Lnb
   F0bsuer5I0UxjrJyCAxtYqWkk0FCbe2KU4wXVMrHzqtFSJAau0kXi6iLP
   gQFUjUTLFz3P86kuYOFZSLWGKOXGr63BqFdyRqlQ9UIlV3ejY3CpYtGzk
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: C9HbK6g+pOtZnGOVZ/O3/gt5oU6RWBq6Ki8ufYTMIR7lMMFf4RJ4UrJYaB8iWF/OJDzzFTdbvT
 GoCduA9ehm5Z6eM9F8SSU0zdkB5jJzZKIEfSijBI9QUBxtqfzXeDjpRNxQmodZaJIbErfQMtAy
 wMiNxXblpnNXREWORnUCgFF/AAK6/9AF5bFJqgl7AA7XdWiwRsdzEq1QppRb/WoDPz2igC589/
 f/030uCHsMGKiQcgqlzRJVcZfwwT3Xoxlxhu3U25mh0UOWhAxGOCH1xLyXHmaJTYBRUjitilnO
 YnQ=
X-SBRS: None
X-MesageID: 32489197
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,485,1596513600"; 
   d="scan'208";a="32489197"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMmUyJPFT9Urfe9/+KhKk8aY0Xd2D1r4zwrWaklIj3erHmUKFdKNEab8jWF+qDHjBzb7R/m09f3MG24FXcsOfAKdxdpm3EWiYH/7nBA8FZpx/kER1fc6iqqv43qokjQCd+qZhLF4sPPDG4N/cW8fJFkzWyLmsZUdkv2CzUgcpFv5A7DxSAsOu1xsph8pWBORfMx9W0lJWfUdFBublPtXJtkIem06mArnFyWIRIpcwtKX2OVVLTULNdGzRU7etJ4iRaVxkHQ++tUnm3u4db5XHwJCetYWEpfqMIjIMwh3uSvlmJUGuD63jni56CaTxMorkg1vvMbzIhLssqs4Klc+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CGoFyLPlUsRQw7DTbXrB6juYSwysCpizYUG3l7GMak=;
 b=MZ48vgDEgqHOnGs+NBp3Hjw4w8thFJwNCasO1Y5lybyjJD1pnKkuBf3z3HD/R+Vq9ximRVFoCaG1/jcWKSVgbBAzU+3J8q5si+f2iur1emah/BP6oYw82B187nWxLLGrHSdCl4ypM4uvI8QBu0PGN1ybUq2TJUVelParZZIBCZVk5gOmRvWmGnq0Qd3SDtZjKc/YhF03/c4xfqqAqywt629uYppZnWfkSkCadji7MTx43dMx+k6xrJ9YTKP8LMKir4d+bcdpbjOrVesqpqF2uHwt/6p/BHxG+O9uB5XXP44p3utbsylsTf9eBkDsiEJORinzWj8PZcbgrKTmq6dsZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CGoFyLPlUsRQw7DTbXrB6juYSwysCpizYUG3l7GMak=;
 b=A2Zn0IKzeoh0vuHcnevETlOoBgWll26MSig6ntTmYFEgpkZY2H0hG+fc6XVTy5IaR9Dz6x+O1fVQ9v82grVWOkvkZBBTLi9f0IxpToc6voJP7Jn/eR++YAKIIH6Ir8DJKXUJi1KeJeJHSQVpAGZ1PAAURWOCTonIqyKKYQP5lss=
Date: Tue, 17 Nov 2020 16:58:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201117155807.a7jgmftnj6njg6oz@Air-de-Roger>
References: <20201117150949.GA3791@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201117150949.GA3791@antioche.eu.org>
X-ClientProxiedBy: MRXP264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d2e4869-55ff-4b4b-4227-08d88b1196e5
X-MS-TrafficTypeDiagnostic: DM6PR03MB4682:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4682D222D05BEC06BE2483848FE20@DM6PR03MB4682.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PD9xVZDi1yMoyDCBQaoYtqtmHLOxvXh67SMbvf2ZB0GROi5ppBkpL6Un1wfJB3DuB23lQJj5Mlm3eSpf8q4FBjnb857+Dyldy6miMS911sUD1FU46Zx3mL6Ywpp4brYhs7StmAWjHb5VsRldc4ah9DbzsKVE8Ahyhd5OTMo+900HUsu8Qp282uc//kesNraQZaZtkMkxZsCJLt9fmXSkY53GUHx/EFOl6G44di7eRjCRybcs8b/DjA/cvbMqOcC+m8taKq6L2cE08t/+bTM7J/26gNkbmpyuN6t/m6GSkHGy7YX74bkvOB0ZxbKoOtKM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(186003)(4326008)(956004)(6496006)(33716001)(6666004)(6916009)(86362001)(5660300002)(6486002)(2906002)(8936002)(16526019)(316002)(8676002)(478600001)(26005)(83380400001)(66556008)(9686003)(1076003)(66476007)(85182001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: +cAqydkCbVmGyJb3o1mA9bzWcL+WAPQE6wRg8GsNNJaTNvh5NEwilRih1ww57K081Wpl00NwOt8hbyzTznI63Gavj++EwSc9FXY9AfSFX2RMVgYKyokrjAtcueQNTD95Kd6kNSrjHWe/bLjAp5toxQ7cP3rHQ2SYtGxw3UQGtkNKaW8jPm7GYruxRQRPqzhuNy+LTD2nbOz3a+deWnnMNq2dzaheSBvyx9ji+ccm0TeWOX4mRUnMb+x0t9L+L/ron4vEWc3rV9p8AAEWx7Id6Q30Ie5MzRjSFpmDIMDYhosVoRE1UQy/E6vfqHbZmwQkFiWIl4hAgEhk2da6+F870JDmilZIi/r4jP1M950K+Yjx0i2Ly5YwDou07rfdeYJkRoXcLP3POjhlTPSeeerUJlHJqtev0aIHvwHmw8WVlee6PYoA/jsYINeclR6NQUEV/ybwFDdWIWKd4qjQqaIMgo5W54Y9sGXNMg56n9b7tnAtXrF0qyTkVEF/010uFP+qLxUnDFKZ6vtHjDB7jqObS9EqAYYesXJmUQvCJgUjFPLOPXytLabOtDRnx13/ffrvQTDdClVKsuJpZjQSzyf10MhiUvGkTET+6gJWg9bDHaKD9asdo1DINdv6nfUohUGndBEfGjpZm8XlQRwecX9zJxUx4Zq5lfhwu5K3SwikE3LoaMGmjsguuqgAf6t21BBhbjTIK3kyClu0EdzOPrOqdXntAKioby8sgxUnN30vBy46UTdbDFmwQ+Tfs7cMBIifeK9goOH2hSXSc8ReegAuw7e0/fCuFLEtWwOUDtjF5ZG+QBQYZI5O70T+VX3CXlyVzDFAwwIrlE5ZGMMwdrpLSnbsJt8un+slse40VrKGb0IhEc1+DZUa5Dd6jpqBMiY7WpM74XNVWmRxGXWuBaVZWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2e4869-55ff-4b4b-4227-08d88b1196e5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 15:58:13.7208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUCNzKzazMU0mCTpBANxJCu7QW3CO8nP8DINVFS8jhS5R3E8i16OSCD5Zs4wX5Ko29KdqEZ/+dSVQ4LNVPkiBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4682
X-OriginatorOrg: citrix.com

On Tue, Nov 17, 2020 at 04:09:49PM +0100, Manuel Bouyer wrote:
> Hello,
> so, after fixing an issue in the NetBSD kernel, related to PV clock
> interrupts, I'm back with physical interrupts issues.
> At some point in the initialisation, the dom0 kernel stops receiving
> interrupts for its disks controller. The disk controller is:
> [   1.0000030] mfii0 at pci6 dev 0 function 0: "PERC H740P Adapter ", firmware 51.13.0-3485, 8192MB cache
> (XEN) d0: bind: m_gsi=34 g_gsi=34
> [   1.0000030] allocated pic ioapic2 type level pin 2 level 6 to cpu0 slot 2 idt entry 103
> [   1.0000030] mfii0: interrupting at ioapic2 pin 2
> 
> entering the NetBSD kenrel debugger and looking at interrupt counters,
> I see that some interrupts did trigger on ioapic2 pin 2, as well as for
> some other hardware controllers.
> I did print the controller's status when the command times out, and
> the controller says that there is an interrupt pending. So I guess that
> the command was executed, but the dom0 kernel didn't get interupted.
> 
> At this point I can't say if other hardware controller interripts are
> working (because of the lockdown I don't have physical access
> to the hardware).
> 
> What's strange is that some Xen console activity seems to be enough to
> resume interrupt activity. Hitting ^A 3 times is enough to get some progess
> on the dom0's disk controller, and hitting 'v' is usually enough to
> get the dom0 multiuser. Once there the systems looks stable, I can log
> in from network. But I/O may stall again on reboot, maybe because the
> dom0 kenrel is back using synchronous console output.

Hm, certainly weird.

> Any idea what to look at from here ?

I have attached a patch below that will dump the vIO-APIC info as part
of the 'i' debug key output, can you paste the whole output of the 'i'
debug key when the system stalls?

Can you assert that you properly EOI the vectors on the local APIC? (I
don't have a patch to dump the emulated lapic ISR right now, but could
provide one if needed).

Roger.
---8<---
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 67d4a6237f..fd0d75db80 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -30,6 +30,7 @@
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/sched.h>
+#include <xen/softirq.h>
 #include <xen/nospec.h>
 #include <public/hvm/ioreq.h>
 #include <asm/hvm/io.h>
@@ -720,3 +721,34 @@ void vioapic_deinit(struct domain *d)
 
     vioapic_free(d, d->arch.hvm.nr_vioapics);
 }
+
+void vioapic_dump(void)
+{
+    const struct domain *d = hardware_domain;
+    unsigned int i;
+
+    if ( !has_vioapic(d) )
+        return;
+
+    printk("vIO-APIC dom%u state:\n", d->domain_id);
+    for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
+    {
+        const struct hvm_vioapic *vioapic = domain_vioapic(d, i);
+        unsigned int j;
+
+        for ( j = 0; j < vioapic->nr_pins; j++ )
+        {
+            const union vioapic_redir_entry *ent = &vioapic->redirtbl[j];
+
+            printk("ioapic %u pin %u gsi %u vector %#x\n"
+                   "  delivery mode %u dest mode %u delivery status %u\n"
+                   "  polarity %u IRR %u trig mode %u mask %u dest id %u\n",
+                   i, j, vioapic->base_gsi + j, ent->fields.vector,
+                   ent->fields.delivery_mode, ent->fields.dest_mode,
+                   ent->fields.delivery_status, ent->fields.polarity,
+                   ent->fields.remote_irr, ent->fields.trig_mode,
+                   ent->fields.mask, ent->fields.dest_id);
+            process_pending_softirqs();
+        }
+    }
+}
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 8d1f9a9fc6..bd208efc58 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -24,6 +24,7 @@
 #include <asm/msi.h>
 #include <asm/current.h>
 #include <asm/flushtlb.h>
+#include <asm/hvm/vioapic.h>
 #include <asm/mach-generic/mach_apic.h>
 #include <irq_vectors.h>
 #include <public/physdev.h>
@@ -441,8 +442,15 @@ int __init init_irq_data(void)
     set_bit(HYPERCALL_VECTOR, used_vectors);
 #endif
     
-    /* IRQ_MOVE_CLEANUP_VECTOR used for clean up vectors */
-    set_bit(IRQ_MOVE_CLEANUP_VECTOR, used_vectors);
+    /*
+     * Mark vectors up to the cleanup one as used, to prevent an infinite loop
+     * in irq_move_cleanup_interrupt.
+     */
+    BUILD_BUG_ON(IRQ_MOVE_CLEANUP_VECTOR < FIRST_DYNAMIC_VECTOR);
+    for ( vector = FIRST_DYNAMIC_VECTOR;
+          vector <= IRQ_MOVE_CLEANUP_VECTOR;
+          vector++ )
+        set_bit(vector, used_vectors);
 
     return 0;
 }
@@ -727,10 +735,6 @@ void irq_move_cleanup_interrupt(struct cpu_user_regs *regs)
 {
     unsigned vector, me;
 
-    /* This interrupt should not nest inside others. */
-    BUILD_BUG_ON(APIC_PRIO_CLASS(IRQ_MOVE_CLEANUP_VECTOR) !=
-                 APIC_PRIO_CLASS(FIRST_DYNAMIC_VECTOR));
-
     ack_APIC_irq();
 
     me = smp_processor_id();
@@ -764,6 +768,8 @@ void irq_move_cleanup_interrupt(struct cpu_user_regs *regs)
              cpumask_test_cpu(me, desc->arch.cpu_mask) )
             goto unlock;
 
+        BUG_ON(vector <= IRQ_MOVE_CLEANUP_VECTOR);
+
         irr = apic_read(APIC_IRR + (vector / 32 * 0x10));
         /*
          * Check if the vector that needs to be cleanedup is
@@ -2524,6 +2530,7 @@ static void dump_irqs(unsigned char key)
             printk("   %#02x -> %ps()\n", i, direct_apic_vector[i]);
 
     dump_ioapic_irq_info();
+    vioapic_dump();
 }
 
 static int __init setup_dump_irqs(void)
diff --git a/xen/include/asm-x86/hvm/vioapic.h b/xen/include/asm-x86/hvm/vioapic.h
index d6f4e12d54..8a3ad18b20 100644
--- a/xen/include/asm-x86/hvm/vioapic.h
+++ b/xen/include/asm-x86/hvm/vioapic.h
@@ -70,4 +70,6 @@ int vioapic_get_mask(const struct domain *d, unsigned int gsi);
 int vioapic_get_vector(const struct domain *d, unsigned int gsi);
 int vioapic_get_trigger_mode(const struct domain *d, unsigned int gsi);
 
+void vioapic_dump(void);
+
 #endif /* __ASM_X86_HVM_VIOAPIC_H__ */


