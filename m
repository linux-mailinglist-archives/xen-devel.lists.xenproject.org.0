Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 533FB2C6387
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 12:00:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39159.71958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kibTt-0000rG-Ox; Fri, 27 Nov 2020 11:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39159.71958; Fri, 27 Nov 2020 11:00:01 +0000
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
	id 1kibTt-0000oC-KR; Fri, 27 Nov 2020 11:00:01 +0000
Received: by outflank-mailman (input) for mailman id 39159;
 Fri, 27 Nov 2020 11:00:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=33Tu=FB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kibTs-0000o7-0I
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:00:00 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dad782ac-3a2d-40ee-962e-7c888e1d9bd7;
 Fri, 27 Nov 2020 10:59:58 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=33Tu=FB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kibTs-0000o7-0I
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:00:00 +0000
X-Inumbo-ID: dad782ac-3a2d-40ee-962e-7c888e1d9bd7
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id dad782ac-3a2d-40ee-962e-7c888e1d9bd7;
	Fri, 27 Nov 2020 10:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606474797;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sya3w3xjNmTpGM8F+H/vXdnphlyvL9y9J+tvGSk3bCg=;
  b=AJjqswSZimUKHnl/a+NIEN8bZy7Ga/M4xQyvKSmR/rmjeaY4SQM87yp8
   jx8HOPc2teb+SFSBry2shJuPF3yFqRtdhBJUye2w8AtQMyq9/c49BAOFi
   XDaq97CArNvcgswAvDwtVmNVA/sQCTlyiBzkl3pZkj5E6KY4dD/Aa/DYK
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dDvB5GsWLdFN6aEBnZywazOukUByHr/89TcE+loiUT/+T28tmvmcN0OiCvilqVQj8YJEq5M0PE
 +DrDdnz5MuA71N6ZWQ5/L2RXNX+d7OLPD86Rr8dJ1zJJz6y97Iccg/YQdyBxCbOQ4OjokPrlp5
 SV57Fx/cZuWdoTl4KwHWuzdTl/5i7XEPgdwNLDy4RojAxVKh7ouIE5rB2vasNltSQqT7+oFaP/
 D8jZ2GIWynOX1nFAy56+JJF5XMc6r6U0iIyJImGiiJdBn7urbnRiGVdUU0L97PNM14X5JnQ9Yy
 Ffk=
X-SBRS: None
X-MesageID: 32264361
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,374,1599537600"; 
   d="scan'208";a="32264361"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BI1VdwSkKB7dbycXokkxFdRw4wWpXNBxzXIbRWEv1sVB0AwrpSOp2JmM2AsRDXI1bmYCCDkM5JZI/kVUSAPPNa+NzM69Zi58gJx3rtx6EvuakoMQwgxpwTyvamYrFfcoeS/9pOtsnxGur1p3GdS9vd1Eoq4Qh4389eueasyC9DPY75K6eOcpYzNLdUXUNIBSGibO9JgblZ0jrIfvSE8ePgUAyM0vOlMVuNIucu+7oJLiHpiR/KODlq3H+2KCqHwHHW2qTf8OcMPlAAweDnFjXu8F28FWJ52wbTWkKjMG3ggRRjkijW2HoJrz6gdbvC/XouxPXwwtezviCky1nbttHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDIHO9hVwsPiqCeOuuYkyJlQUH63L6Os++lsGP48pas=;
 b=fJZvqhwtZRt4nTJ6XtNg1kOj+hcBhP20amus5cgYPlrG+LdZgAbROfeQyrbzHQlMPs9o4PVXnMzaFIkU6ekJOeAZcKK92e7VfiXye3Cvl4tAMvppLDGwPOfbrKAE8WRA8RQAUv33Ov1SVGmPP8QfACraNTo9ftnKCkO1Bzo9O51ioeM3m9L+PQ283FRFlthCODGRE6Li/t7ECXAq/UfZOh/91HywKusiMULN+ogWxs95QC7VCnrHepA8jfnliHyDV75c0jP+Kdl8dzTDcPuRHPhYJ7kdYYFxzwFakeh2PoA5PtMpvVRWwMya035PT9hT3u1sxWrgX3x357g9OfiiTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDIHO9hVwsPiqCeOuuYkyJlQUH63L6Os++lsGP48pas=;
 b=lwZel5Tp1dIOGkfEz+mySqd2rLlWcsSR0pgIpIdUkn1Fl8JBRdT7YQp4ums47oLD0it1AhWyatitdiue5jwQM2p90aOuQZ5/90sByJLst61yM6DRVo6cP19DCTl/iT0nNx8cyZM60Fv2bJ/ZOwTJGF1bunPL+oI1/16lFhWW548=
Date: Fri, 27 Nov 2020 11:59:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
References: <20201124142713.GM2020@antioche.eu.org>
 <e6a0fc84-e7ed-825c-5356-29b8a6359a2b@suse.com>
 <20201124150842.GN2020@antioche.eu.org>
 <20201124154917.l3jwa6w4ejumjuqw@Air-de-Roger>
 <20201124160914.GQ2020@antioche.eu.org>
 <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
 <20201126141608.GA4123@antioche.eu.org>
 <20201126142635.uzi643co3mxp5h42@Air-de-Roger>
 <20201126150937.jhbfp7iefkmtedx7@Air-de-Roger>
 <20201126172034.GA7642@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201126172034.GA7642@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f53541ec-585d-4551-ff12-08d892c391bb
X-MS-TrafficTypeDiagnostic: DM6PR03MB4682:
X-Microsoft-Antispam-PRVS: <DM6PR03MB46828C8F88557CE1F921AFAE8FF80@DM6PR03MB4682.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PEYwC9MKPOYDYQjlzTAdLNz0BJen+6T3VU2U5UPu7n2L9fIsLz3UtndERz4syWLBtUtycp1MMyU4JnGYQOb5iu2F8pZ27zP1oglVsAwJ6RtDMLLgXNB7bc1EOt79Wj5VcwuIMQ5W94Skk8R9iTp+j98xBlgbsvRce/R97nz9sEmcSjUz7xSIWwhZtCly00NmmprWhbXR6fR5XKQ/CWN7wYNhqap2zULpKl4U1ThHsvDqqCQ3p1bKQWAQQXFMZ9cHNlFN/aM9NpLTI3/jk8ot2mD+A+1fyz6nO4o6lUxJn3a8r1GHUSJIOSWXZ7alFApLfI7eJgv3VmmJUPHVxD2ixs6c7OMFtjNgoze1bKG9MScciDqKj01HWez8ASjLAb9qB4o+67SwiEtMKt33oupsxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(376002)(396003)(136003)(346002)(39860400002)(33716001)(6496006)(4326008)(8676002)(26005)(5660300002)(9686003)(2906002)(16526019)(8936002)(6486002)(316002)(186003)(66946007)(6666004)(956004)(85182001)(66476007)(66556008)(478600001)(1076003)(966005)(83380400001)(6916009)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NElxalJHNEYxSGlHOVVsNC9KYnBOdVZ0SGRLZ0tNcjBseFpzNU1iSEFNZDZ1?=
 =?utf-8?B?aVV0UUJURWlzM1dXaDBVa0xiRGQ1WEdKdXF0YndMZTc4Q1ZqbndZd0d4WGcv?=
 =?utf-8?B?cTR1Nnhza0FmYWdBcG9nQzNRL1R3QmVSS0dkbUVKaXNDcGlDcEE3RnNVd2FL?=
 =?utf-8?B?aHhNZTh4Q09xVWxlOEZFczJnQ21kMWVKLzh6MzNBTno1b09UVWZLTlJacGNv?=
 =?utf-8?B?bkFiVWRsK2I3WndXRGRWODRrUHhZanliWFZ4QXFpbGtVMzQzOS83WnRVYzVa?=
 =?utf-8?B?REZxZVV6VGVqY2JEVDZ3UW5wYjBUNmZEd2tvSDRSTStoVkNWOVRSdVprb3ht?=
 =?utf-8?B?NVlzejR4WTJiM1ZaSU5LdnJuZnJWTHFncVI1Rkc1ckdGVkt2dThXN2R2TVZ2?=
 =?utf-8?B?aGx4M2FwVGtjRDFjUi83eDFaZkQ0R3MxOWV2aEpoeHVxZXhteFovRG5Ma1px?=
 =?utf-8?B?alVyT3ZBenQ0RldBSkVGTFZsMm1xV3FRSWZwbmkvL3Mxb0VtT21IRHFLK0JJ?=
 =?utf-8?B?S1cyeDh0UWJxblB2bXN1RU01V1RHcHovYllGRWQvTGViUGFQdFUzaGZOS0pG?=
 =?utf-8?B?Y2txSWkxREordWE4NXBpNmdhdWlzTFlTTnV5dnIyRHhiUlR3d1pvZmEya3NQ?=
 =?utf-8?B?aERoSnBQNUJWc21XcGp6bmNJNGlRYitkdnlLTGxkSGNxVnZPSHR1L0c5M0w5?=
 =?utf-8?B?SWZLbVFqODU1YXQ4QzlZdXI1MmhNTUJEd0NDUzZNNHlqY1d2cjBkSnJoQW5k?=
 =?utf-8?B?cFZ1SHJjZ2gweVdQRVdNajEyQzh2RGZ6V0ZkRjhSUlNnbjY2OHNBQjZIY0lx?=
 =?utf-8?B?OGNsem5sTHB0TytlaUxFL0s2SG9CM1lTcDNXMzlSa0U5L2p0YVkxaXhUakJF?=
 =?utf-8?B?VHJzNUZ1dlJydTVtalliYjNNQWM1RVh2L0tZaGhsQks4c0NrSWF0aHdVS3BM?=
 =?utf-8?B?TllBbHZDZ25CYncxNFpSOVNwekRhd3dkQmw5KzM2YzVFNUJiOGRTZkptMHJS?=
 =?utf-8?B?QTdlUmxZZzBHQlVPSnJFWkRybGVpRVZhL1BCdHBxd2lXMk4xK2o1dHZ0VHdz?=
 =?utf-8?B?dEFaR2k2b21lUHgvcExxSmpuR09Cb0xEUVViUW9NT3ArODZtcXRKUHpxaFFH?=
 =?utf-8?B?NlNRaE5BVGMvbUpDUks3TjNtZllwYWdEWDZaemQrR3pTRG9uRGZDTFowQXli?=
 =?utf-8?B?Y21MREdYWmFnSldJdUZtOGU1aFNUaUVmdU8vNlZOZEZkNE9oRzJMQ3NydWpG?=
 =?utf-8?B?T3NCMGRoTXc3NjdFUlJITXZDK3dvZjNnWm1PbUZLOVAxK1ZlK3puWDNqUWtv?=
 =?utf-8?Q?bwlrtBGSGdcIff+YoTEzqCCth4gUjb0Lu+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f53541ec-585d-4551-ff12-08d892c391bb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 10:59:53.5952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMneGnAUL1ngLRmOAqUjLMPirkKqiGPwnRa/n/SdApof7YyKP3nRlAxL7WjX7hosIP9SHTXXqlYFXF1oduvflQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4682
X-OriginatorOrg: citrix.com

On Thu, Nov 26, 2020 at 06:20:34PM +0100, Manuel Bouyer wrote:
> On Thu, Nov 26, 2020 at 04:09:37PM +0100, Roger Pau Monné wrote:
> > > 
> > > Oh, that's actually very useful. The interrupt is being constantly
> > > injected from the hardware and received by Xen, it's just not then
> > > injected into dom0 - that's the bit we are missing. Let me look into
> > > adding some more debug to that path, hopefully it will tell us where
> > > things are getting blocked.
> > 
> > So I have yet one more patch for you to try, this one has more
> > debugging and a slight change in the emulated IO-APIC behavior.
> > Depending on the result I might have to find a way to mask the
> > interrupt so it doesn't spam the whole buffer in order for us to see
> > exactly what triggered this scenario you are in.
> 
> OK, here it is:
> http://www-soc.lip6.fr/~bouyer/xen-log9.txt
> 
> I had to restart from a clean source tree to apply this patch, so to make
> sure we're in sync I attached the diff from my sources

I'm quite confused about why your trace don't even get into
hvm_do_IRQ_dpci, so I've added some more debug info.

Here is the new patch, sorry for so many rounds of testing.
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
index 67d4a6237f..e6748e0649 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -257,7 +257,11 @@ static void vioapic_write_redirent(
         vlapic_adjust_i8259_target(d);
     }
     else if ( ent.fields.trig_mode == VIOAPIC_EDGE_TRIG )
+    {
+        if ( gsi == TRACK_IRQ )
+            debugtrace_printk("vIO-APIC set edge trigger irq %u\n", gsi);
         pent->fields.remote_irr = 0;
+    }
     else if ( !ent.fields.mask &&
               !ent.fields.remote_irr &&
               hvm_irq->gsi_assert_count[idx] )
@@ -278,6 +282,10 @@ static void vioapic_write_redirent(
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
@@ -285,6 +293,9 @@ static void vioapic_write_redirent(
             unmasked = 0;
         }
     }
+    else if ( is_hardware_domain(d) && gsi == TRACK_IRQ )
+        debugtrace_printk("vIO-APIC MASK irq %u\n", gsi);
+
 
     if ( gsi == 0 || unmasked )
         pt_may_unmask_irq(d, NULL);
@@ -405,6 +416,10 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
 
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
index 8d1f9a9fc6..ec52e44cb7 100644
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
@@ -1837,6 +1845,12 @@ static void do_IRQ_guest(struct irq_desc *desc, unsigned int vector)
     unsigned int        i;
     struct pending_eoi *peoi = this_cpu(pending_eoi);
 
+    if ( desc->irq == TRACK_IRQ )
+        debugtrace_printk("do_IRQ_guest irq %u nr_guests %u ack_type %u in_flight %u\n",
+                          desc->irq, action->nr_guests, action->ack_type,
+                          action->in_flight);
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


