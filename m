Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F09A2C55CD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 14:36:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38546.71288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiHRe-0007DL-Ji; Thu, 26 Nov 2020 13:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38546.71288; Thu, 26 Nov 2020 13:36:22 +0000
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
	id 1kiHRe-0007Cw-GM; Thu, 26 Nov 2020 13:36:22 +0000
Received: by outflank-mailman (input) for mailman id 38546;
 Thu, 26 Nov 2020 13:36:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TQ9x=FA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kiHRc-0007Cr-Uv
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 13:36:21 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04e26e6b-0b47-4d5d-889f-ed30077c5dd3;
 Thu, 26 Nov 2020 13:36:19 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TQ9x=FA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kiHRc-0007Cr-Uv
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 13:36:21 +0000
X-Inumbo-ID: 04e26e6b-0b47-4d5d-889f-ed30077c5dd3
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 04e26e6b-0b47-4d5d-889f-ed30077c5dd3;
	Thu, 26 Nov 2020 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606397779;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UNDit+cPLGHUviicj+dccXAQJ4dBH4nn15/fyR+3AQQ=;
  b=UOJW/+88HB/1zYzo4/dpcAaDCdPvT82Bz9k8gvyIOkL2pGN4fhH3bPJu
   nix+yQsPwzY3WUKEJg01LtRDdPb4rH8uakAcCHlrmdbq5mt6m9e+qDSkv
   9iqbmy/8G5xK0B8s3RWNg2bNGUc1MasypGwpKlITdGJYVGeX454dZRY3V
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NUQTTQPUa3K5XQdvBUWK05g/qFcyeKnnAMU6FnviuGHby2blIk0cCUTmw3RXHllYA/bTlkVnDp
 XOpNsHTIV/77lWJzygpzWaFjZlGqc6Ai1EGjravZEbaQQ4LBrWmcKybbB9T12p1sjlpHTc8eXL
 4jm3GBUgK7ZlnJ/HNhu5XIZjiAaiFsW2DzEyHsjzLa7pDHR7L1h0j4cBEQf2Td4o6j0OIcAjnp
 /qkTdXI3kJ1EMIN8M7zDTCnrVPDi5J31tWKUFEh4juII9D9c7r8JJyatBPmDQcsfvq1t5V+tud
 4vc=
X-SBRS: None
X-MesageID: 32334166
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,372,1599537600"; 
   d="scan'208";a="32334166"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYekgSrGhRqcwREA0feEwIxc5OENttseouJepIQYxkDumdzvHJc+Lr/pdYMfhUr01xQDpjtV6Uw7w3jKuponRZZVJ2StZxbeFiKJyc48qj0K/Eb5D+C5BX132l2mghU0NZYcJ0duRA9b3KYeuMKQi5GGm5ZJ1VfUeKEDbEQEJB47HJFzdS4qAv+aD8pxgiKPdDWLTWsG2zQ2cnc6DN9+9+/AvnfMVeTm6VOlEkmstx1Wp+Cns1h5ObkiPrsW6AeZprQKYVVHpFQyRvWqNJdj7bA8b9Szdru8/qVfrmp2Fv1VyRc1WpE029CrmzkkXmazG7yqVCav4uq7UYz2cuniqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAwaaVD6Fj0sDFpd+4YXDhOxDd9+amcuKNAhabbuvj4=;
 b=jR7BMrsnuS+yCkO52I00tQOHvRwRfmoIZgxcOry2v/eEyxe04rXCDIXqEmsqUMggJ1Y+vSM07J9BoIyzSCUcyCPKfeEFqUBpHsy2GXnEzaGoxg/CJyffFemN6B/burW3SyEtYpLhPKh8xQQ1xjur6UBVBiUnqAbIUIvLOom1wLWw8benlGluMvBky63MH18Xs/OCWzVsJ6uIt/syS+KXkeIYkNgrM+7COC60CMI/kHnkVDMb6cEP5JfYxojbVfRvZMdAreHZIp+OLCfRK1sXLZd/Nx0saAlDqe3FYkECDF5wFzDle6OarJMCrT/q/ydCVFvPO7X6YElI9mwwkxKoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAwaaVD6Fj0sDFpd+4YXDhOxDd9+amcuKNAhabbuvj4=;
 b=jJG1+VZR9YmDOTE6bm0nvSIdA/AbjYZJe1b1UoWQF4UUctziJiC1133zcdKlK/nzhVxLUX+oSS3XUMx4MBBAJF9wAAxexLgR8OAGDccXGKds2E6rODoDrksT1SEOo5CKXd/bWkpEGtbq9YqYPpM984N9YWuQu3fjK8t7DR1Tm3A=
Date: Thu, 26 Nov 2020 14:34:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
References: <20201123173925.GG4662@antioche.eu.org>
 <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
 <20201124122102.3igsriesou3vl6mu@Air-de-Roger>
 <20201124135948.GL2020@antioche.eu.org>
 <6d6a77cf-58de-4e4d-ed75-e9365be060b7@suse.com>
 <20201124142713.GM2020@antioche.eu.org>
 <e6a0fc84-e7ed-825c-5356-29b8a6359a2b@suse.com>
 <20201124150842.GN2020@antioche.eu.org>
 <20201124154917.l3jwa6w4ejumjuqw@Air-de-Roger>
 <20201124160914.GQ2020@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201124160914.GQ2020@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0023.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2f7c608-1946-4a88-dfc8-08d892100c8f
X-MS-TrafficTypeDiagnostic: DM6PR03MB5179:
X-Microsoft-Antispam-PRVS: <DM6PR03MB51798676705554F5AB1C1FD38FF90@DM6PR03MB5179.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5YE8ZcFxmGSlB9S0S2kY9jG1/MKcda90l2KA+eZ3kT4N0usABps8heuJjD/XyyQqtE9RAok1HriA6bzuzMctNNcH7BSi38QfH+fVJNyj44UN6Swxs+zrGlD1++x8Pu5YHgVc//OAi3Uope2wz8P8Hyn22np44QSIeORY3XtYTYSz3w70SlRLJjrCXTamZdEZ5Wox9Y345Sx52djLOYejxEVZO76McYsMzJ7QCren75Se4Xr1FLZHMIhJ4j0pMpFB/+XmabwYskbcL3KkbG3X+x3kgX86o2iiltBIZYdFOcIng1yFe4aydEx9kjKWXJ4mMWlV6WP7DBMXwpRNlCnvD95Swdf2hd+PSnHBVKQRZ0R9Pf1qK0kkpmgyJxPGvNLUKkypBmECZE6o2BFlZQt+OQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(396003)(366004)(346002)(39860400002)(136003)(8676002)(16526019)(6486002)(6496006)(8936002)(85182001)(956004)(478600001)(5660300002)(66556008)(66946007)(66476007)(6666004)(1076003)(6916009)(86362001)(83380400001)(2906002)(966005)(186003)(316002)(33716001)(26005)(4326008)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UFEyZVlHVlJZWHVSNEdGdUp3Kys0MjZRYmlBYkh2WlZlWmllT1A4MDVVVVBv?=
 =?utf-8?B?cDBvSG42U0pFbnVjL2hTa05RQlVBZlNmNXZNdGxsT2hGMFNEd1lQNEVaM1RP?=
 =?utf-8?B?b3VnN1VMYWtMbUZYaVd3T2lQOFk4TnBPaGQ3bVpKOXRjcXhLVSthc0lpTjUz?=
 =?utf-8?B?Y1pJZ296VjlMVG8wdXYrMnJDZURybkZzeGtMQXJ3bk1lYlBoQTgwOVl3OXpo?=
 =?utf-8?B?dmEwQkgzR2N2SW9razBTM0JkL1E1dnBqS0pmOXAzZTV4SVpuTTF2bXNIOXpt?=
 =?utf-8?B?VWpsMXB1cnJGTTRldTEvdC95T0xTUzREQ2Nyc0VaMjRMa1ZERlJJQVhHMnA4?=
 =?utf-8?B?L0cvN2xINit1OHB3SVM5ZGZJZStXV1M3MmMwSU9rRHBCY2h4c2o3cWtJUkhm?=
 =?utf-8?B?RkNjcUVBVGcxUnFPYjQ5U04wRW1lU1M2VjVKUlFoTEZGRVZZdE8yUlhneGhl?=
 =?utf-8?B?TVlLOE5HdjJTK3l6RzNtbE5OaW1YSEpFUUpDVHNmaSs2ekFFMmVnTlIxTjJh?=
 =?utf-8?B?R2Vkb0hWR2Nwb21oL2s3VWwwRmNSMmVXQUFpNmFJWGVYZUpNckN1dG8wWndW?=
 =?utf-8?B?QmYwRG1EdnhtV25RdTZ4RTFZNGFQbE5DZklucXpGNTRiOHdBVnFlREtzNDY4?=
 =?utf-8?B?TUFGcDJBWi9OQ0dDQ2dZckVXN3B4YVNoVkg2cHRtNTFPWDNCYThWRUttejFC?=
 =?utf-8?B?NEFIQ2drL2d4dEhpclBSVUVseEI2bFBLMmhmWmxtMmtwem9DQnNKcU1iN3hh?=
 =?utf-8?B?UytJRlhNQ0VIVXBKeTZydFJza29RQ3VZc0NTWHBhUWg2U2hyOXd1eWMrNzNm?=
 =?utf-8?B?dk9lOVgwUWY4NVVyUjBjRlZmZ2F2OEtOY1dkcE1GckRDbWt4Ly9DQ2tnUlph?=
 =?utf-8?B?dkFZNVR1d1BqcEExWGNza2lXRTFuWThKVitSZUhCNXlDYTg5RGFmUVJEZlZn?=
 =?utf-8?B?SzRLQ1lMNDBEM1hEY3NTUFNGY1dKTVF6MnV2c3VMMms4cGhFSXdOWGxzSTlG?=
 =?utf-8?B?b0ZGakFPalpzU2xLM1VzNkdCQkpXQ0c1Zk1UM1lJeExoMElUdjhhbzVSS2or?=
 =?utf-8?B?ZURrNVJ2VlpuQ3cvRGllQlVjeDZCRjdOb01heHlScHVkRHhZTUZnTXRPeXlE?=
 =?utf-8?B?RGtBbWE5M1pKZldyd0NId1hMT2xyQVQrd2tFeEdPdTk5L2pRRDJwUVV4d3Ar?=
 =?utf-8?B?b2JMay9GZ2xsMkc3Zk5VSllpKzdLaHRnc1ZXL1Z3V2NiaXkwWkwvU3paQXNU?=
 =?utf-8?B?M2FsVmY3ZFUwU0tmcUNtVk01cWxnVkVOWXIvOGNqZWlOdlVXS2phbWZRNHg1?=
 =?utf-8?Q?A020MeIX7zqm5ThJ5qVFTe9Sun5I5fft3Q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f7c608-1946-4a88-dfc8-08d892100c8f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 13:34:50.4028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBd8fZyt0Ax/AiEZ/nGkXNvYPLbvmhfOJp27+BD2ug/21YcW2mjJINidmLIC5DnCcW9kCU7tAQ20DwH7YbxZ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5179
X-OriginatorOrg: citrix.com

On Tue, Nov 24, 2020 at 05:09:14PM +0100, Manuel Bouyer wrote:
> On Tue, Nov 24, 2020 at 04:49:17PM +0100, Roger Pau Monné wrote:
> > Could you also give a try with ioapic_ack=new on the Xen command line?
> 
> With this I still have the interrupt issue, but Xen doesn't panic on 'i'.
> http://www-soc.lip6.fr/~bouyer/xen-log8.txt

Sorry for the delay, I have yet another debug patch for you to try.
Can you remove the ioapic_ack=new from the command line and rebuild
the hypervisor with the provided patch applied and debug trace
enabled? (`gmake -C xen menuconfig` and go into Debugging Options to
find it).

Then once the system stalls use the 'T' debug key to dump the buffer.

Thanks, Roger.
---8<---
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 67d4a6237f..adbfccdd0f 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -278,6 +278,10 @@ static void vioapic_write_redirent(
          */
         int ret = vioapic_hwdom_map_gsi(gsi, ent.fields.trig_mode,
                                         ent.fields.polarity);
+
+        if ( gsi == TRACK_IRQ )
+            debugtrace_printk("vIO-APIC UNMASK irq %u\n", gsi);
+
         if ( ret )
         {
             gprintk(XENLOG_ERR,
@@ -285,6 +289,9 @@ static void vioapic_write_redirent(
             unmasked = 0;
         }
     }
+    else if ( is_hardware_domain(d) && gsi == TRACK_IRQ )
+        debugtrace_printk("vIO-APIC MASK irq %u\n", gsi);
+
 
     if ( gsi == 0 || unmasked )
         pt_may_unmask_irq(d, NULL);
@@ -405,6 +412,10 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
 
     ASSERT(spin_is_locked(&d->arch.hvm.irq_lock));
 
+    if ( irq == TRACK_IRQ )
+            debugtrace_printk("vIO-APIC deliver irq %u vector %u\n",
+                              irq, vector);
+
     HVM_DBG_LOG(DBG_LEVEL_IOAPIC,
                 "dest=%x dest_mode=%x delivery_mode=%x "
                 "vector=%x trig_mode=%x",
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 49bd778484..db7167eb4b 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1641,6 +1641,9 @@ static void mask_and_ack_level_ioapic_irq(struct irq_desc *desc)
     unsigned long v;
     int i;
 
+    if ( desc->irq == TRACK_IRQ )
+        debugtrace_printk("ACK irq %u\n", desc->irq);
+
     irq_complete_move(desc);
 
     if ( !directed_eoi_enabled )
@@ -1688,6 +1691,9 @@ static void mask_and_ack_level_ioapic_irq(struct irq_desc *desc)
 
 static void end_level_ioapic_irq_old(struct irq_desc *desc, u8 vector)
 {
+    if ( desc->irq == TRACK_IRQ )
+        debugtrace_printk("END irq %u\n", desc->irq);
+
     if ( directed_eoi_enabled )
     {
         if ( !(desc->status & (IRQ_DISABLED|IRQ_MOVE_PENDING)) )
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 8d1f9a9fc6..baef41cd37 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1109,6 +1109,10 @@ static void irq_guest_eoi_timer_fn(void *data)
     unsigned int i, irq = desc - irq_desc;
     irq_guest_action_t *action;
 
+    if ( desc->irq == TRACK_IRQ )
+        debugtrace_printk("irq_guest_eoi_timer_fn irq %u status %x\n",
+                          desc->irq, desc->status);
+
     spin_lock_irq(&desc->lock);
     
     if ( !(desc->status & IRQ_GUEST) )
@@ -1118,6 +1122,10 @@ static void irq_guest_eoi_timer_fn(void *data)
 
     ASSERT(action->ack_type != ACKTYPE_NONE);
 
+    if ( desc->irq == TRACK_IRQ )
+        debugtrace_printk("ack_type %u in_flight %u\n",
+                          action->ack_type, action->in_flight);
+
     /*
      * Is no IRQ in flight at all, or another instance of this timer already
      * running? Skip everything to avoid forcing an EOI early.
@@ -1837,6 +1845,10 @@ static void do_IRQ_guest(struct irq_desc *desc, unsigned int vector)
     unsigned int        i;
     struct pending_eoi *peoi = this_cpu(pending_eoi);
 
+    if ( desc->irq == TRACK_IRQ )
+        debugtrace_printk("do_IRQ_guest irq %u\n", desc->irq);
+
+
     if ( unlikely(!action->nr_guests) )
     {
         /* An interrupt may slip through while freeing an ACKTYPE_EOI irq. */
diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
index 6b1305a3e5..25ee1791f8 100644
--- a/xen/drivers/passthrough/io.c
+++ b/xen/drivers/passthrough/io.c
@@ -1010,6 +1010,9 @@ void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi,
     if ( !is_iommu_enabled(d) )
         return;
 
+    if ( guest_gsi == TRACK_IRQ )
+        debugtrace_printk("hvm_dpci_eoi irq %u\n", guest_gsi);
+
     if ( is_hardware_domain(d) )
     {
         spin_lock(&d->event_lock);
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 43d567fe44..91579c33b9 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -174,4 +174,6 @@ unsigned int arch_hwdom_irqs(domid_t);
 void arch_evtchn_bind_pirq(struct domain *, int pirq);
 #endif
 
+#define TRACK_IRQ 34
+
 #endif /* __XEN_IRQ_H__ */


