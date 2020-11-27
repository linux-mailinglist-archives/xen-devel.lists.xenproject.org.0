Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2942C6C84
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 21:22:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39776.72793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kikGA-0002Zf-CI; Fri, 27 Nov 2020 20:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39776.72793; Fri, 27 Nov 2020 20:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kikGA-0002ZG-8x; Fri, 27 Nov 2020 20:22:26 +0000
Received: by outflank-mailman (input) for mailman id 39776;
 Fri, 27 Nov 2020 20:22:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=33Tu=FB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kikG8-0002ZB-BS
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 20:22:24 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34b51b36-d659-4204-8330-ba1a31221c23;
 Fri, 27 Nov 2020 20:22:22 +0000 (UTC)
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
X-Inumbo-ID: 34b51b36-d659-4204-8330-ba1a31221c23
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606508542;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3Foo1KSIrLyoB1XoSKCJ82fTRPhExZiEUXCxQ28bG3U=;
  b=DY9LtKirTC29A2665JeYqfVYi+czabyB6zzVuc5Gqb2kDhvseQueX9K6
   rE/UmmM249Si91BIcwL3ApcB8go8wgd3vLyvdKaEgchP14SZ8TmnPt8MI
   PXwG2Y1hv4H9wutN7o8DjM1F/jp/povnG4Vb6RTRs+RsBfNyelDWDSBwu
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: T5CVIw6T6vD7s3fqOKDrSxGK2PDA/hYbm51IEug+wAqsxelalVfKHNZpbW1xubMpggl5NMlBMw
 jdJ0Q4KJcqy9fT8LBQlz6Mhq9g/jYKxapBbGHI5lIXqoJwBdByKA3lbeikrT/JVov+eP8856+l
 5sJjZki9WQ4QhWOndeaTyjcV2fzYhoiygcGhQ9AJu/WtBRRlCQGkWkZzQuyFueb69VFMZ/nebn
 z551pNtFk15rD/ZHAph7pXmgLc44rQ2D8diczWyjaKWgWCXIj1mpuIKkp6wfeySu+SKhalCyJ7
 K6s=
X-SBRS: None
X-MesageID: 32036929
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,375,1599537600"; 
   d="scan'208";a="32036929"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHve03o28GbM2wh/R9tT5x2U7Xk8y+yXnBt3/Oon2Pm9tatXrRG1xGO6+AUkVGrUGbuGm0zLOKUi09LftONejuXcavP4Lp6WGAhjrpFTi/XWwbadt2kwKMDv6O1fVMVcWVT9OYg77X+t7YrZbGwvDQhMZVHXmXwPoM9zQfkyolj6LfEix33HWUm4ydlomicW9+Xh4Vzt2UgMgO+rL7E2K76GIkA4vqQjBgwZC1tF4f9d9oKq3LrD747ZRTdHCw8QzRXI8K/cvRDdJYiKGHrpfbkZLWFEAOqwo7eud/BLSIvMj+Z/aZVIhpjwAA3fYlSnUuN7pB1Pw8fybCsD+24l1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heGh1O7nkzjYLGRgIUaleIyPjT/GnZ5533/e0xCS4+s=;
 b=XZI53RFeXESJZK17BtY7Kx7T3Nce8OLENngvHLXBMdFJJqMh/fgydO85MvTEUQwNw1FzGa9JankBxH8EMujfFyhHfNp10ohg2KgH9TlnQP5NhkWyftOrm7ui3gRLd4Qm00n/Xxw4Vr4wXH8BPTH2n/KhV/LriHxdnd/RmcNyUL8VEMA+JrTy0hFFJBzwHM0ntzPVzt+7U1HwKVXH6gbvuvqmw8Sf/kh5dJM6n0HIvbcU/31fPld55Y0OlhH6NUpvEReUMsj76ecxYg79Tn3/IeIm+Xb2CuX+hpnOz+ol78YStXl7qd5AhCzQ4aIie+YByTcvcCAUINKy4zgawjTBSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heGh1O7nkzjYLGRgIUaleIyPjT/GnZ5533/e0xCS4+s=;
 b=cac3bM9m1h31bNZWS3cYmTSbkp0G7YQCAV3f6et7Z/Ej9YaLe+dPSoFEKQWYy8W7KKe73L7SKHL+VcffKcuzm3EFSyZj9j3HQDHHQ4jVPayleNvb3VKo/FWW80e10XugAotmGu1lvyjBggN9aQiCt2VmhtAqFW4RUhLQwO4KAFU=
Date: Fri, 27 Nov 2020 21:22:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201127202211.eqrxloii5x54zode@Air-de-Roger>
References: <20201126142635.uzi643co3mxp5h42@Air-de-Roger>
 <20201126150937.jhbfp7iefkmtedx7@Air-de-Roger>
 <20201126172034.GA7642@antioche.eu.org>
 <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
 <e9610278-84e5-dc32-b568-8867011de4e4@suse.com>
 <20201127131324.GJ1717@antioche.eu.org>
 <714e9393-d7f4-ed47-d1ed-aff79f3552a0@suse.com>
 <20201127133121.GN1717@antioche.eu.org>
 <96aa5a9b-3f4a-ce9d-0f41-4a24d409ed55@suse.com>
 <20201127135929.GR1717@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201127135929.GR1717@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0083.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 399cf661-393e-44c0-64cc-08d8931222a2
X-MS-TrafficTypeDiagnostic: DM6PR03MB4300:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4300C974661D2841CFC6F0038FF80@DM6PR03MB4300.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oG9qG4LRfgpsH2GUvtR3X1gB9ducaV5FICix1ZuOS+5Q+M6kwYZ9NgctX+r6+X2aAmriXVVVCr3Q+FxziSfC/gMThheMbH18bFN565ggqSn9XmGB39l3JPwqffyshkL7+fNWHuC+Ye87C+LxuTSEOO11xTU7i7uzFQV4vtcWy231Pw5VveqDJGQpKCPh6CprFBAD21bi3NVnPBzC3+0icrvihXZZwfNlSe4/QeycDMqUsqCHXQLJfe0YvyR9C/gK3TxisCHb+iCUm0wWTWpu6T+Iy744bxEuJtzpbaEIUBFmJH/m03tOAyyPk6mlY/EkOtWL3NtrxXtse/JI9gEbGm+HN9juiNIAwcGEF/5bVRgE+6Tv04+z8fiTXUUoYiGmyLex1Hv04WYoDdIkpy8OmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(85182001)(33716001)(86362001)(956004)(966005)(186003)(53546011)(6486002)(478600001)(16526019)(26005)(1076003)(6496006)(9686003)(6916009)(2906002)(66476007)(66556008)(6666004)(83380400001)(316002)(4326008)(5660300002)(66946007)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bW1wejFwSFlJU2tDUGFQTDlsWUVjaXZwbFdBelpzUWs4a0hBQ3FJNC9xSmVB?=
 =?utf-8?B?enJwUXJlSFFuOXBLYWtab2JWZ0JjTDhTZGpsbFkvQ3BnaENWeGhiRDVLTDhr?=
 =?utf-8?B?Z2hKRFhNektNdUUxcjN2OER4b0pySWsrOEl6bG5XTzVCbEwyV1VsYnV2YzFQ?=
 =?utf-8?B?ZzBEZS94ZXJ0cGo4V1RJWXRaMjNvbzVNVWlYb0dnQXlUbm1QdGlJRmF2cW45?=
 =?utf-8?B?K09CUFdUMitUemJhQ1c2L2tndTFLYisrWjZpclV0azdWNEJvdHo3OHB5N2Z4?=
 =?utf-8?B?UHFmdFpnL0JVOWIxZ3hINGlnRGZUREZQVTZZWnFEVWpvZ1pTQlhlTUUzRmZO?=
 =?utf-8?B?SFVySlh6RmFteVV3S2o3Sk8xNllCSWhYaGZtaDdHWGlhTFdVd2cwQWZMWHFj?=
 =?utf-8?B?Uk9Eclh0c2cxaDdEUEhqc2Jjbi9jNGw0OEl6QXdFampGUW9LR3NESklZZ1Vn?=
 =?utf-8?B?ZElxS0FDZ2p0ZUJ4UXpQbFpZL3EyZ2tMNVowNWF4RG1FUjg0MnJyVGtzc3FN?=
 =?utf-8?B?MS9jNG91YVVpZ1pQU2kycWIrYVFrd0NZVm9iVXgwN2VHdVhWa1k4TUlRWlJ3?=
 =?utf-8?B?SXJTMFE4L0F1ejAxNFhKN0UwcHVxaGMyTnJkZnd4ekdlenRlOU5xSlFIV01o?=
 =?utf-8?B?cG44RVlhMExUWWNNOXdnYzNRUGplNmJrWWxEL2FCSEd1UVplZ0RhOU5nelp6?=
 =?utf-8?B?RzJvNnZuKzdKdWJucm5XRzRaTFp0VUtnMDBwM2ZwY2dva0xGZ3lSbkpPd0VY?=
 =?utf-8?B?dTEyemJoOTZ5VXRPMDk2WEQ1OSs4VGNXL1IrVFVjYTY5b0ozbXVhUVRvdlZX?=
 =?utf-8?B?blRWYzhtcStUQ1BSbFlKMy96VXQ0VHlLZDJyNDlDajd2c01hbkttS25ObnVw?=
 =?utf-8?B?QjhwR3pQa2J1ZGl2K1dtN0hBcERkOGZncXJFZDVjQk1Kbk4zZ2lZK2FCRnk5?=
 =?utf-8?B?bVNhR2JEMU5SZnRuUktvVlRDZk1xQnNRc2IreUwycUtuSFppR0lEQTJBQ3BQ?=
 =?utf-8?B?QU5yaUFudVl1Tm9kWjZrYnphbG5hMVBCVWdPZ1BBdGcycmEyYkhwL3dVYzFJ?=
 =?utf-8?B?ck5OZWNWV2RTMzc2K2tjcDhYU0Zid1BiQm5LQURPKzVUSmpuR1ZqMmxWUHk5?=
 =?utf-8?B?QzNpRjRHSm85Uk02bmFyeTE1N3VwNFk1Q0VVNzJUTDF2OU0wbnB5YU8xTXJZ?=
 =?utf-8?B?ZlRya3poUVVQaVlCQU40cFRkaGhhazFSQTZZQW01RTV5S1RmOGpJQlZJS2M1?=
 =?utf-8?B?dEwwc2U3TTRFUnEzY2lPd1h1WmtOL3AvYmV4SzNIdmJwNmZtdENQUFpDaGF5?=
 =?utf-8?Q?8zZd7Qu8chKcmi03vgId+S8f6qT1lS0lZ9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 399cf661-393e-44c0-64cc-08d8931222a2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 20:22:17.4041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vyKf8YHvefT68HtqizNB2jPo6Rmo+jMmBFw/jI6c9scYi70V4CAgQKDOZvOiRoZFx2LD6VFS3abx54hPiVtECA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4300
X-OriginatorOrg: citrix.com

On Fri, Nov 27, 2020 at 02:59:29PM +0100, Manuel Bouyer wrote:
> On Fri, Nov 27, 2020 at 02:40:22PM +0100, Jan Beulich wrote:
> > On 27.11.2020 14:31, Manuel Bouyer wrote:
> > > On Fri, Nov 27, 2020 at 02:18:54PM +0100, Jan Beulich wrote:
> > >> On 27.11.2020 14:13, Manuel Bouyer wrote:
> > >>> On Fri, Nov 27, 2020 at 12:29:35PM +0100, Jan Beulich wrote:
> > >>>> On 27.11.2020 11:59, Roger Pau Monné wrote:
> > >>>>> --- a/xen/arch/x86/hvm/irq.c
> > >>>>> +++ b/xen/arch/x86/hvm/irq.c
> > >>>>> @@ -187,6 +187,10 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
> > >>>>>       * to know if the GSI is pending or not.
> > >>>>>       */
> > >>>>>      spin_lock(&d->arch.hvm.irq_lock);
> > >>>>> +    if ( gsi == TRACK_IRQ )
> > >>>>> +        debugtrace_printk("hvm_gsi_assert irq %u trig %u assert count %u\n",
> > >>>>> +                          gsi, trig, hvm_irq->gsi_assert_count[gsi]);
> > >>>>
> > >>>> This produces
> > >>>>
> > >>>> 81961 hvm_gsi_assert irq 34 trig 1 assert count 1
> > >>>>
> > >>>> Since the logging occurs ahead of the call to assert_gsi(), it
> > >>>> means we don't signal anything to Dom0, because according to our
> > >>>> records there's still an IRQ in flight. Unfortunately we only
> > >>>> see the tail of the trace, so it's not possible to tell how / when
> > >>>> we got into this state.
> > >>>>
> > >>>> Manuel - is this the only patch you have in place? Or did you keep
> > >>>> any prior ones? Iirc there once was one where Roger also suppressed
> > >>>> some de-assert call.
> > >>>
> > >>> Yes, I have some of the previous patches (otherwise Xen panics).
> > >>> Attached is the diffs I currently have 
> > >>
> > >> I think you want to delete the hunk dropping the call to
> > >> hvm_gsi_deassert() from pt_irq_time_out(). Iirc it was that
> > >> addition which changed the behavior to just a single IRQ ever
> > >> making it into Dom0. And it ought to be only the change to
> > >> msix_write() which is needed to avoid the panic.
> > > 
> > > yes, I did keep the hvm_gsi_deassert() patch because I expected it
> > > to make things easier, as it allows to interract with Xen without changing
> > > interrupt states.
> > 
> > Right, but then we'd need to see the beginning of the trace,
> > rather than it starting at (in this case) about 95,000. Yet ...
> > 
> > > I removed it, here's a new trace
> > > 
> > > http://www-soc.lip6.fr/~bouyer/xen-log12.txt
> > 
> > ... hmm, odd - no change at all:
> > 
> > 95572 hvm_gsi_assert irq 34 trig 1 assert count 1
> 
> But I can confirm that now, entering ^A^A^A gets interrupt going in again

I think there are some weird things with dpci interrupts that I'm
trying to understand. I have a patch now that will panic when the
buffer is full, so we will hopefully be able to see the whole trace of
events. There will be no need for you to press the 'T' key now, the
system will panic when the buffer is full.

Note this patch also removes the deassert done in pt_irq_time_out.

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
diff --git a/xen/common/debugtrace.c b/xen/common/debugtrace.c
index f3794b9453..b22c09297d 100644
--- a/xen/common/debugtrace.c
+++ b/xen/common/debugtrace.c
@@ -130,14 +130,14 @@ static void debugtrace_toggle(void)
 
 void debugtrace_dump(void)
 {
-    unsigned long flags;
+    //unsigned long flags;
 
     watchdog_disable();
-    spin_lock_irqsave(&debugtrace_lock, flags);
+    //spin_lock_irqsave(&debugtrace_lock, flags);
 
     debugtrace_dump_worker();
 
-    spin_unlock_irqrestore(&debugtrace_lock, flags);
+    //spin_unlock_irqrestore(&debugtrace_lock, flags);
     watchdog_enable();
 }
 
@@ -152,7 +152,10 @@ static void debugtrace_add_to_buf(char *buf)
     {
         data->buf[data->prd++] = *p;
         if ( data->prd == debugtrace_bytes )
+        {
+            panic("END of buffer\n");
             data->prd = 0;
+        }
     }
 }
 
diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
index 6b1305a3e5..c8fefc2648 100644
--- a/xen/drivers/passthrough/io.c
+++ b/xen/drivers/passthrough/io.c
@@ -174,7 +174,10 @@ static void pt_irq_time_out(void *data)
          * In the identity mapped case the EOI can also be done now, this way
          * the iteration over the list of domain pirqs is avoided.
          */
-        hvm_gsi_deassert(irq_map->dom, dpci_pirq(irq_map)->pirq);
+        if ( dpci_pirq(irq_map)->pirq == TRACK_IRQ )
+            debugtrace_printk("pt_irq_time_out irq %u\n",
+                              dpci_pirq(irq_map)->pirq);
+        //hvm_gsi_deassert(irq_map->dom, dpci_pirq(irq_map)->pirq);
         irq_map->flags |= HVM_IRQ_DPCI_EOI_LATCH;
         pt_irq_guest_eoi(irq_map->dom, irq_map, NULL);
         spin_unlock(&irq_map->dom->event_lock);
@@ -828,6 +831,9 @@ int hvm_do_IRQ_dpci(struct domain *d, struct pirq *pirq)
          !pirq_dpci || !(pirq_dpci->flags & HVM_IRQ_DPCI_MAPPED) )
         return 0;
 
+    if ( pirq->pirq == TRACK_IRQ )
+        debugtrace_printk("hvm_do_IRQ_dpci irq %u\n", pirq->pirq);
+
     pirq_dpci->masked = 1;
     raise_softirq_for(pirq_dpci);
     return 1;
@@ -1010,6 +1016,9 @@ void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi,
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


