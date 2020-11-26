Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCB92C57E1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 16:10:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38619.71384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiIu4-0007lm-9k; Thu, 26 Nov 2020 15:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38619.71384; Thu, 26 Nov 2020 15:09:48 +0000
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
	id 1kiIu4-0007lL-6e; Thu, 26 Nov 2020 15:09:48 +0000
Received: by outflank-mailman (input) for mailman id 38619;
 Thu, 26 Nov 2020 15:09:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TQ9x=FA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kiIu2-0007lC-NN
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 15:09:46 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e34560ea-5e4d-4c62-887f-0791fcc26732;
 Thu, 26 Nov 2020 15:09:45 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TQ9x=FA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kiIu2-0007lC-NN
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 15:09:46 +0000
X-Inumbo-ID: e34560ea-5e4d-4c62-887f-0791fcc26732
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e34560ea-5e4d-4c62-887f-0791fcc26732;
	Thu, 26 Nov 2020 15:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606403385;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=S3xEXblAkA9UUAnOtoZ8R8dU7OwjQBGIDmjQucm7mYk=;
  b=QrwLpSdAZFsEVCrTsiEYfTDNu2apDPeSojmRnY5dLqiOmCfRlNtuFNfT
   N0Gz44TB02mdeqb5oRrhaZDwZjkoMRlJOFXqtr15F2etORrlIoJVNEZoB
   fJrZ/vqBK87xm6ud+gl76HF4tNOmIavYalPZRDW65l82pOTz0egzt0wIy
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GEClyimU1g6/KT5QycSY5EDEOjXRQRHUQ3ke+9+iSHW2REUnebOQL8pu/zknLYw7/ysg9Ifsd9
 19RLeYK6AdONEq5Slk5ocpwrnM4FS909ShzG6Npu8zH3O2UsuXB0zkQvvXJPw8kq+e0sKbNX+K
 JNxXBx53DMZtvSJC1lnn3+kXUnq25KMs/mH7C+bnq1n7dmjdDjNOVtZDTF5ON+dGEM3HbdObPn
 01tYjAcZmrGxbiZOaXPANPQY6tUb+Cweo/KGwaZKABUGDY7o20N3pZqUVT65Rltwzp/X3FkO+l
 vrg=
X-SBRS: None
X-MesageID: 31969960
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,372,1599537600"; 
   d="scan'208";a="31969960"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emFxJG9hYcgVeUFIx4Nh9horP5kZlQDXp4qLuF2PhAFbwqh2L5F3H43CyQZsrqGxRjR3Ihb8qS+Gu7/1j+GWcs6GiYin7Cnn1MxudMHdysDpyZEMC2vRhBrDN75UIguUoj0N5wP9lfVUbNJeUfF9n6yZxQopEHMm3XbqcYZctZ/Xo2c+nyuqevPW5reF0vondFvS3iFk7kpZsr5klXTxo94GXAkg+hxF/MMgeEujC6j6xhNwWAn2Byml0Zu+C85tsuzMBeEl3x1yVzfdXmmqhc9lusdYWcfQAmqGnVSUDup+IMPlXS5J9goLsPfqlSS2Dfbm9g8fmWoMvJFNMdw0uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wu0uj+4INHqlDzBIKmTM1MaLYOMF9jLy6dsO+VElkyo=;
 b=mt0EhFiiEji+qD1WrZlW3aPQja5kD59a9KazNrtCE9fcqBWefT65NTfcygDMXMWDeh0wUWno1S1J+Mu+hA4H1pstrLdbAHgmSYwCZ6kbsRwj34xD5tn2ZniDPtik0u1vVWN+1Zdjiuzk2yBkK5nO6pfF716u7gmqWadpT74gt+3jteFDozjntspgSxI6+39UFOLfcaQbsOXDeI9zOuP0S/P4UUB4/RUkWSuSHyj7HgL8/ixe05wfTmBq6biWg3G6YJiKHxj9chutrDZ5uwz/cCYs5IKNNff9Ers+wLFMmoZfh5CRsJlBI08yZMSiWDLX+Kpce32JjUYUhEHI5VK/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wu0uj+4INHqlDzBIKmTM1MaLYOMF9jLy6dsO+VElkyo=;
 b=DmrY6HJ0P+RlpMNnNOMyUnqjv78yo920B/5FHseW6KlWUbntZy2/55o7LHAsWPD2m+4PG+q3gfYtT3RmnGC+G9cM+WiHC7ED+V+EvIxTwDNc9uemH03G5qOkrQAkWsz+vLrujv9m+DB038C5EkfzZHScHQ4mIoUoxYet5bO5WEw=
Date: Thu, 26 Nov 2020 16:09:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201126150937.jhbfp7iefkmtedx7@Air-de-Roger>
References: <20201124135948.GL2020@antioche.eu.org>
 <6d6a77cf-58de-4e4d-ed75-e9365be060b7@suse.com>
 <20201124142713.GM2020@antioche.eu.org>
 <e6a0fc84-e7ed-825c-5356-29b8a6359a2b@suse.com>
 <20201124150842.GN2020@antioche.eu.org>
 <20201124154917.l3jwa6w4ejumjuqw@Air-de-Roger>
 <20201124160914.GQ2020@antioche.eu.org>
 <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
 <20201126141608.GA4123@antioche.eu.org>
 <20201126142635.uzi643co3mxp5h42@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201126142635.uzi643co3mxp5h42@Air-de-Roger>
X-ClientProxiedBy: MRXP264CA0014.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0d17e61-8f73-4192-b39b-08d8921d4cb1
X-MS-TrafficTypeDiagnostic: DM5PR03MB2780:
X-Microsoft-Antispam-PRVS: <DM5PR03MB27804F7C166DC1B9B67B90C68FF90@DM5PR03MB2780.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WydnORSkeqrc+bFFMcUlY6yoUAkWdtuexWyvoTAdKx46UK/4ZygXti+/AUPFLnNjiRr6DE/n/vNPKc0V7M82WG8RBKl99f1Vx0ZGwWJJ3ZoMYD15ZKEaWDDYlqzYkjTqoAUaBVEnB1wwCNrAm8OO6mpBtecGfbMSRdVUDUA3sqJzgum8sXrZIlU6wYYazy8L2lHTeM1pRtWMO4g4tydQ3WWGcYehjBKWxmWAocjRNlwMd1yXq7T6EQkwxP4QmcHYd6A4gd51M0H84/6YBHm3sgCtWn7ws/oywc9OcfZleorDleV4p8XAGhUN90WCJRJxIJcLCzlc1WXO0tkp9+ScVdjDQdzYL8FTqtiATphWpf9Me5v71wJ6M1jWqISdvzY1gQRTlkBEw/ujC04ifLSFUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(39860400002)(136003)(376002)(366004)(396003)(478600001)(66556008)(66476007)(6486002)(8676002)(86362001)(8936002)(1076003)(966005)(66946007)(16526019)(5660300002)(26005)(186003)(2906002)(956004)(4326008)(33716001)(6916009)(9686003)(316002)(6496006)(83380400001)(85182001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dTFRdUdicUdqV3d1Ym1LMnRLbTYzWFp1SDNqWGVnV2l5bEs1UCt6N0tTeE8x?=
 =?utf-8?B?UGYzWTcwZkZxUXRzWFdlc05ZOUtaaHlZdXlnUWtqaXFIUnc3SDZoRjFFaCts?=
 =?utf-8?B?b0Z3dzVyT0taVWVESFVMYk5RWkhjb0MvZjlEMnhOOU5aT2VueWY0MEhaQnpu?=
 =?utf-8?B?SnJuV3hibzBrNVdWWVQyTkNUS3kyeHhxcDYwemhuNXN2L2lGTUFDQU0vVmxk?=
 =?utf-8?B?ZWdjWWoyaHZPRjhwZ2FxNTVuTUV4T2N5Ui9EWUE0UFo1emV5RWhMcklUWVpk?=
 =?utf-8?B?U1QzVm1jMTcxVFVMMC9GY2s0QnJQWEF1ZXNDMitMbDJHY01EbzByUElueVZD?=
 =?utf-8?B?WlYyclNFV2lydis1YVE0blBsVDdJRFNGbkhWZEVTWUxxNTFRM0dzWFQrRTB4?=
 =?utf-8?B?UEdIKzhUTko2UVhWSlNrYmJYQzQvYWJWOGRMaWEwRlpWR3AxTGViYkdBdjJJ?=
 =?utf-8?B?Y1BoTWIzYi9hdlh5d1Y2ZkQ5K20vYmxrSkdQY1NHbGZtYVBROEdBSW9aQ0Fi?=
 =?utf-8?B?U3Y5emRlbHpFdk9nWm9oYjhQTlloMlh2MEVXY2JYSkZsZEtSeWFzbWwvMFFI?=
 =?utf-8?B?TitrRi8zeVNQY3ZuVTVrdnFxbDNGdzhycXBWOGt1T3RmdVdQMXh4V2psSmlw?=
 =?utf-8?B?S1g1alhGQ0hXSkx6NVBmcjNMbHJFUVNiUUNvL1NybE4xdU5pdHhSK25TR1lB?=
 =?utf-8?B?YjF5SWx1L1BrZHVTRkc3dHpTcXhrVmdJWlBIL2ZaZnVMTk8zQ2NIcFNoMndx?=
 =?utf-8?B?dGFGUXlVckNmZ2wxcjlpV0FGQS9MN0tKbmZkV2FaWk5ZRjV0cEVCY3QzK2tJ?=
 =?utf-8?B?V2YwVWhqd3B0Q0JHQjN4TVRGYVR2L0NWaDRvSTEwKzhiWXFwZWJZYVcyRzRE?=
 =?utf-8?B?VDI4bTQrSDl1VmFpREVyYUdhK1dub2daL1o5ZGtOZmwwaWdPZzJxVkN0ZXFt?=
 =?utf-8?B?UjVtZzBZL2hOM3orUlZvY1cxcHduUWU3Wm94ZlJqQUZnVGc1WElrQkxqWXBp?=
 =?utf-8?B?d0NDRVpEWFk4MTVBazR6ejV4UDJCT3F3UWQ0ME5SY0t6M0R1MGFvUEFXejNV?=
 =?utf-8?B?em5vanh6MjJNaitmNkVtMmJtbjAxeHVHYkhlZ0xVZllxMTl3dlVYNEFDN1k4?=
 =?utf-8?B?Uitwa1VQN2E2STB1RXdySU1icmkzcTNybmZBcWRUZi9PZS9Cd3NMRElxMFBW?=
 =?utf-8?B?NTczdXBkQU5YUEZzUnFtOTRIejU5eDFCakJPQU5RV3pVTHU5bEEwU1p3enE2?=
 =?utf-8?B?OGViYVBqUnptWGZxSGdnQnBYRTIyNE9pV1JwMVpVeTRHMkZmcEpqeGd2TUd2?=
 =?utf-8?Q?+l+qKxaIu+kTJk9E8mfI82oBBH+mZfh/gU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d17e61-8f73-4192-b39b-08d8921d4cb1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 15:09:41.2471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kxPHxjvM4r4rxKFdEouUefwC0aYEnKLfQMSBbIagoOl+nDjKtpp9Co7fbftmq0nJYh+30aXZzn6XjINvhJikw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2780
X-OriginatorOrg: citrix.com

On Thu, Nov 26, 2020 at 03:26:35PM +0100, Roger Pau Monné wrote:
> On Thu, Nov 26, 2020 at 03:16:08PM +0100, Manuel Bouyer wrote:
> > On Thu, Nov 26, 2020 at 02:34:44PM +0100, Roger Pau Monné wrote:
> > > On Tue, Nov 24, 2020 at 05:09:14PM +0100, Manuel Bouyer wrote:
> > > > On Tue, Nov 24, 2020 at 04:49:17PM +0100, Roger Pau Monné wrote:
> > > > > Could you also give a try with ioapic_ack=new on the Xen command line?
> > > > 
> > > > With this I still have the interrupt issue, but Xen doesn't panic on 'i'.
> > > > http://www-soc.lip6.fr/~bouyer/xen-log8.txt
> > > 
> > > Sorry for the delay, I have yet another debug patch for you to try.
> > > Can you remove the ioapic_ack=new from the command line and rebuild
> > > the hypervisor with the provided patch applied and debug trace
> > > enabled? (`gmake -C xen menuconfig` and go into Debugging Options to
> > > find it).
> > 
> > menuconfig doens't build on NetBSD, I set CONFIG_DEBUG_TRACE=y in
> > .config. I guess it is enough ?
> > 
> > For the record, my boot commad line is now
> > menu=Boot Xen PVH:load /test console=com0 root=dk0 -vx; multiboot /xen-test.gz dom0_mem=1024M console=com2 com2=57600,8n1,,0 loglvl=all guest_loglvl=all gnttab_max_nr_frames=64 dom0=pvh iommu=debug dom0_vcpus_pin sync_console dom0_max_vcpus=1 watchdog=force iommu=no-intremap
> > 
> > 
> > > 
> > > Then once the system stalls use the 'T' debug key to dump the buffer.
> > 
> > Here it is. It seems to be stuck in an infinite loop, I hit the 'R' key
> > after several minutes
> > http://www-soc.lip6.fr/~bouyer/xen-log9.txt
> 
> Oh, that's actually very useful. The interrupt is being constantly
> injected from the hardware and received by Xen, it's just not then
> injected into dom0 - that's the bit we are missing. Let me look into
> adding some more debug to that path, hopefully it will tell us where
> things are getting blocked.

So I have yet one more patch for you to try, this one has more
debugging and a slight change in the emulated IO-APIC behavior.
Depending on the result I might have to find a way to mask the
interrupt so it doesn't spam the whole buffer in order for us to see
exactly what triggered this scenario you are in.

Thanks, Roger.
---8<---
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 38ac5fb6c7..9db3dcc957 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -187,6 +187,10 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
      * to know if the GSI is pending or not.
      */
     spin_lock(&d->arch.hvm.irq_lock);
+    if ( gsi == TRACK_IRQ )
+        debugtrace_printk("hvm_gsi_assert irq %u trig %u assert count %u\n",
+                          gsi, trig, hvm_irq->gsi_assert_count[gsi]);
+
     if ( trig == VIOAPIC_EDGE_TRIG || !hvm_irq->gsi_assert_count[gsi] )
     {
         if ( trig == VIOAPIC_LEVEL_TRIG )
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 67d4a6237f..aeff9c7687 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -257,7 +257,17 @@ static void vioapic_write_redirent(
         vlapic_adjust_i8259_target(d);
     }
     else if ( ent.fields.trig_mode == VIOAPIC_EDGE_TRIG )
+    {
+        if ( gsi == TRACK_IRQ )
+            debugtrace_printk("vIO-APIC set edge trigger irq %u\n", gsi);
         pent->fields.remote_irr = 0;
+        if ( is_iommu_enabled(d) )
+        {
+            spin_unlock(&d->arch.hvm.irq_lock);
+            hvm_dpci_eoi(d, gsi, pent);
+            spin_lock(&d->arch.hvm.irq_lock);
+        }
+    }
     else if ( !ent.fields.mask &&
               !ent.fields.remote_irr &&
               hvm_irq->gsi_assert_count[idx] )
@@ -278,6 +288,10 @@ static void vioapic_write_redirent(
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
@@ -285,6 +299,9 @@ static void vioapic_write_redirent(
             unmasked = 0;
         }
     }
+    else if ( is_hardware_domain(d) && gsi == TRACK_IRQ )
+        debugtrace_printk("vIO-APIC MASK irq %u\n", gsi);
+
 
     if ( gsi == 0 || unmasked )
         pt_may_unmask_irq(d, NULL);
@@ -405,6 +422,10 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
 
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
index 6b1305a3e5..92f3670508 100644
--- a/xen/drivers/passthrough/io.c
+++ b/xen/drivers/passthrough/io.c
@@ -828,6 +828,9 @@ int hvm_do_IRQ_dpci(struct domain *d, struct pirq *pirq)
          !pirq_dpci || !(pirq_dpci->flags & HVM_IRQ_DPCI_MAPPED) )
         return 0;
 
+    if ( pirq->pirq == TRACK_IRQ )
+        debugtrace_printk("hvm_do_IRQ_dpci irq %u\n", pirq->pirq);
+
     pirq_dpci->masked = 1;
     raise_softirq_for(pirq_dpci);
     return 1;
@@ -1010,6 +1013,9 @@ void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi,
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


