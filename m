Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966062C6FB2
	for <lists+xen-devel@lfdr.de>; Sat, 28 Nov 2020 15:53:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40031.73099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kj1bK-0003y1-Q2; Sat, 28 Nov 2020 14:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40031.73099; Sat, 28 Nov 2020 14:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kj1bK-0003xc-Lw; Sat, 28 Nov 2020 14:53:26 +0000
Received: by outflank-mailman (input) for mailman id 40031;
 Sat, 28 Nov 2020 14:53:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O94F=FC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kj1bJ-0003xX-1x
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2020 14:53:25 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 892251ee-ef61-454e-965e-97f965bf5667;
 Sat, 28 Nov 2020 14:53:22 +0000 (UTC)
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
X-Inumbo-ID: 892251ee-ef61-454e-965e-97f965bf5667
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606575202;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YZK+9AtpdfxzzYwaQC1WSsEEsuRX0Gr7ASA3ElH+GBA=;
  b=hScl1X8lY4e9dNM6nArXkVtBxSANRytuVicNjEHTVA77mqY7p+91S21I
   hATh4XDIO3SYvelVswtdppgZRxe7k0jlfJRIYPYghq4nvColeF7QLfEzH
   HNP5tvhkVHCd6ilMjnkStU8v60b9y+Vww3+0qJBKHPXQNxvp8iX4LKDnx
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KfYPrbFc65l1GpieZZW6T4YeO0ENbB9JqSF2o10Txh7L+M3yGTojoY2QSlc+1Fdb7j3wTzyRl9
 OT7LhSi2dTOB5MpqTMTH2Np+zMhgd2Bz8p0Abso0E0+NcNc7Mx64GofkiwSexFezfntJtOivTB
 MDaV6ahl4TTwKHJnu67VCKFQUTgExfK0hxXohXZSXkEHk8CpFnOH4cH9KMdS/SvbhQYhcVnube
 DGGr4t/Hz5E2P+rQEUBTQyG/+nmMRbBpmLUVTZ9gBnT58/1T/JRycMQYNrKk66MzBZoWGGBO4x
 wtE=
X-SBRS: None
X-MesageID: 32315232
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,377,1599537600"; 
   d="scan'208,223";a="32315232"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdUnPnOmA/qop23/+uKM+k3hurgZAjU0N7lg7+1WKOEI4HSWVYsGLD92EIAfcOPOJYnEp2JyMmbFqdN1IbVBXA0GdsoxqJ7ypR92HFR9Zaewygxgd097GK+jIpQVDMMEp8QleJS+P8FwxH9hvDY1UjBBtluikhcdeumlUtWK/GGkLHF0y34jjMAZR7gnhQ7AlaXtJ9e8+lfqDJPkmkNvYpjp0QBNHYT8yJVxrMGDujb6dQbKGKQL3qCUljW+XAB9wR6FxyBT8xgol4R9gasmxFMXKUVWaD+oXQMuJYEFxOCd0X4mnNoyWQMJ2KGZoUd9xNCK4paso5UW36sMrzLdgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gzy9Wfl5UFss0wnraGiyvh14GkmHtEiACEEAV9ST1Gs=;
 b=FGYm+3k8ZHC5Y8OIpdCAiZwXY0XkPAaXN0Bfsh02TCKbp4Ab5uvl8jd5BG93ZF1siLETXq0dCO02cmMEnTD2+EpaCGY2+zAdBokXkglyMlCtyxENl0B+28xOdWyuOTT6GxKddAyDbDtlmZMpmbor03kH/2w0DQov0NXfMiaQWai+8KJH1h1GrNDeL5zpCfkR6z+fuw9piLjX5J0+Y9jiXtiZqfyNUOECQwrDPWWNEGU5odXrgGog6FqhtV8sr7L6kaFtuUcfNLOBJ1pHJIjPkMDchgSO8ID6P+yQPy4ZS2m+O0smbKsVaCPk7n+zVPfmwvG3EY8bynJKCuQj+A1YIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gzy9Wfl5UFss0wnraGiyvh14GkmHtEiACEEAV9ST1Gs=;
 b=j3WdaGCt06pb0gBml1b+fQ3FE1omItlsSNWdRgF4aatD00Oqg/ls4LZX2XHPQzKpPE1GHfzl+YHzTuC2JymCCVKidX78GH2x4pueA3F3YRKck19dt9mT1m5q3GLYUkmZ7mbsiZjUmIK4r9WZ6v3uqRYwORZlFoApywGLEo1S0ZM=
Date: Sat, 28 Nov 2020 15:53:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201128145311.3gmzq5lnkz6ajdtr@Air-de-Roger>
References: <20201126172034.GA7642@antioche.eu.org>
 <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
 <e9610278-84e5-dc32-b568-8867011de4e4@suse.com>
 <20201127131324.GJ1717@antioche.eu.org>
 <714e9393-d7f4-ed47-d1ed-aff79f3552a0@suse.com>
 <20201127133121.GN1717@antioche.eu.org>
 <96aa5a9b-3f4a-ce9d-0f41-4a24d409ed55@suse.com>
 <20201127135929.GR1717@antioche.eu.org>
 <20201127202211.eqrxloii5x54zode@Air-de-Roger>
 <20201127214420.GA637@antioche.eu.org>
Content-Type: multipart/mixed; boundary="4ld5vgy3khrjzwcn"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201127214420.GA637@antioche.eu.org>
X-ClientProxiedBy: LO4P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2740643a-aa06-4b30-2fa0-08d893ad56f2
X-MS-TrafficTypeDiagnostic: DM6PR03MB3947:
X-Microsoft-Antispam-PRVS: <DM6PR03MB39470118A438B26AB66195248FF70@DM6PR03MB3947.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yOzhkaZI3ys3HnraC5hb0oHZg4obh8XsFuoIMzwwf6dAbLd/TKy7csI7nO09dqPAs7+Nnj1ylYwPAWJ/8ESUpXeO+80DF04+G+cDLfAc7T84ZoDhoejc/0+M1HVJwHiSCavDbcIqI/vVVS+Vwu9ypIfE2eWOTTyle07JN4VFjUmMJuWo2m63iSk6zDwZ5XLgKnu/s+BCJwbceL4FTws5AMA4Y9jU/HBQNUTYIpm59bnNbdBNnTif0YlO5xJCBz3kggF7/reI7ewoyrJxWj15gS0Tz5MUMjTwsBIiqkb3yiJO3iiS+sv8kRdApffLeXY170298YhzR1ZLdbWboROMUY7sh+DOBfmUY5+x2HrCa8DPgfG6D37j9qdn8yeI1o1FTlnRMnbZLXn9HHf48zndNoNloV3lS95wxbVwSS50/NbYs9uGXIfQ8qZUcKqEpQI8JY6FVdL7m937JYUZyciWag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39850400004)(346002)(366004)(376002)(396003)(5660300002)(83380400001)(235185007)(16526019)(186003)(9686003)(4326008)(8676002)(66556008)(66476007)(66576008)(85182001)(66946007)(8936002)(6666004)(86362001)(33964004)(316002)(26005)(44144004)(6916009)(6486002)(1076003)(956004)(33716001)(2906002)(6496006)(966005)(478600001)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZlA3SG5sWWc0WmtndEsvWVdhY243WERSWnR1REVGQzZGZTV5L1B1OW1zU3Zk?=
 =?utf-8?B?dElscDlvNW9KOXZXaUxKNkZ4UkdSc1FLekVNWXlnOVBJMWdYQlFzUkFVVTdt?=
 =?utf-8?B?SUdWbVk5WUVwTUlXYjBPc3dTaUpTOXVWbkZMYTFkNkp6emtPQThXdXMwaTRG?=
 =?utf-8?B?TTVzMkV2TGQ5NlFWS0lmcS9xNVN5d0lEZTNqOFpmUmtadnJtY3FFVjJLS0VD?=
 =?utf-8?B?VGpkbENvcW1iZ1d6aUh4YjlHTGxSelJYcXVGc0lRQnl3dGhDY2tpYk1kZFJD?=
 =?utf-8?B?WVY5R3BabGQ5SWMrWEE5OG9hMVNMMzIwSXBjZTFFTkxPQW1DK3U4U1FkcmpW?=
 =?utf-8?B?Nk92RjFOelJTQVZ2NUZoWGluMC9xZHRPYXlWcFVrbCtneGFIOWhZUEJVa0NI?=
 =?utf-8?B?V0hORFFQYlJMaGh0R01LdFR4bE1ZOTBpSjVHSEloQ2J4TElrNTh4SnJRdVdy?=
 =?utf-8?B?RHJNQnpBeDJSbGNLSzN5Sk5PWFp1amdJaDJRQjFZN3lKRk5oSjdsc0w4MzAv?=
 =?utf-8?B?YXRDNklXSHVnNld1NGpLR3dKS2puNFU2Y0ZYVW9qMEp3RHBhN1grS0RBcE4w?=
 =?utf-8?B?NlRDTitwMmlMeHBHSlBoSDg3OTJ5ZHR5dGxmN2VYa1RKeG5SSEsrVlhTYmVE?=
 =?utf-8?B?Vk5uaTErSW90V2pMMXZjaTVRVDRrRHRFNlJoWDJKenpKUlRiaWJpUERUeG5K?=
 =?utf-8?B?d0RzSGk3b1FXVlVFRXVhSVZiZHJrbmxCRVZaSXREYUo2QmtzYnVNU3hEbmdM?=
 =?utf-8?B?U0VDOGlCSjNnWk9KeFJ4djA3RlFoK0JRbjVsZXB4RjYweFUzWU5kekRma1JC?=
 =?utf-8?B?N2FZUCtyZ1NjVjVWb0FqTEx6VTVhYXNHdUxrUU5pWGQvY01NTHp2NjllT3Ft?=
 =?utf-8?B?Kzg0SWpGQTBLQ0cyUTZJL0VLaTVNOERoVVI4bGtrVnYwSFlFTmFxUzkxYSt5?=
 =?utf-8?B?a2J2MnZJZ28vVlp6MUZweFJiNE5XTmMxTFprU0Vab0hIdzJrUDEwaVQxRzVa?=
 =?utf-8?B?NjlGcWJwTDJ6TWVLNzJvNUJUM1JHRjZiTmFNbURyNFJJQ1BHbmV3WW1XcGZ0?=
 =?utf-8?B?VUtWbUV4YWRHQmhMeG9tOHBHeG1zd0xmaXlPZTJVRkJvdGNUWVNHeHZJWmll?=
 =?utf-8?B?V0lhRWR2VTFKMEFYMENxMEZ6QVBHQnZsUlhCWS8rY0J2Y3VHTVkxU2ovZHRk?=
 =?utf-8?B?VktleUdtWGNJcHFZeEZqSWZzQ2VhSEQzT3NzTzB1ZVRGS3FFeHAvUGRYWTQz?=
 =?utf-8?B?WmwzOTcrNVErRWlwaUtUcnJUaXdaMzRtSmNkNkw1MjR3ZGRzMnlaNnZBS1ZY?=
 =?utf-8?Q?SGVcm9f0MWXIrjeeYG0sxJ5iAnbQcEa/Zh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2740643a-aa06-4b30-2fa0-08d893ad56f2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2020 14:53:17.2453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOal45zokzuM4WW3dX3fkzW13l1CvHwx7LkuZopeiY6E5bYrL7mKNNSKFm6uE3r6fkFf5qgrDJnVDUam9VekwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3947
X-OriginatorOrg: citrix.com

--4ld5vgy3khrjzwcn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 27, 2020 at 10:44:20PM +0100, Manuel Bouyer wrote:
> On Fri, Nov 27, 2020 at 09:22:11PM +0100, Roger Pau Monné wrote:
> > > 
> > > But I can confirm that now, entering ^A^A^A gets interrupt going in again
> > 
> > I think there are some weird things with dpci interrupts that I'm
> > trying to understand. I have a patch now that will panic when the
> > buffer is full, so we will hopefully be able to see the whole trace of
> > events. There will be no need for you to press the 'T' key now, the
> > system will panic when the buffer is full.
> > 
> > Note this patch also removes the deassert done in pt_irq_time_out.
> 
> thanks
> the trace is at
> http://www-soc.lip6.fr/~bouyer/xen-log13.txt

Thanks! I think I've found the issue and I'm attaching a possible fix
(fix.patch) to this email. In any case I've also attached a further
debug patch, in case the fix turns out to be wrong. Please test the
fix first, as the debug patch will end up triggering a panic when the
buffer is full.

Roger.

--4ld5vgy3khrjzwcn
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="fix.patch"
Content-Transfer-Encoding: 8bit

From 232112a292c3b82b3063ea6c7aab56afc8e03f67 Mon Sep 17 00:00:00 2001
From: Roger Pau Monne <roger.pau@citrix.com>
Date: Sat, 28 Nov 2020 15:06:26 +0100
Subject: [PATCH] x86/vioapic: fix usage of index in place of GSI in
 vioapic_write_redirent
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The usage of idx instead of the GSI in vioapic_write_redirent when
accessing gsi_assert_count can cause a PVH dom0 with multiple
vIO-APICs to lose interrupts in case a pin of a IO-APIC different than
the first one is unmasked with pending interrupts.

Switch to use gsi instead to fix the issue.

Fixes: 9f44b08f7d0e4 ('x86/vioapic: introduce support for multiple vIO APICS')
Signed-off-by: Roger Pau Monné <roge.rpau@citrix.com>
---
 xen/arch/x86/hvm/vioapic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 67d4a6237f..e64abee7a9 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -260,7 +260,7 @@ static void vioapic_write_redirent(
         pent->fields.remote_irr = 0;
     else if ( !ent.fields.mask &&
               !ent.fields.remote_irr &&
-              hvm_irq->gsi_assert_count[idx] )
+              hvm_irq->gsi_assert_count[gsi] )
     {
         pent->fields.remote_irr = 1;
         vioapic_deliver(vioapic, idx);
-- 
2.29.2


--4ld5vgy3khrjzwcn
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="debug.patch"

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
index e64abee7a9..df82147f9b 100644
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
               hvm_irq->gsi_assert_count[gsi] )
@@ -278,6 +282,12 @@ static void vioapic_write_redirent(
          */
         int ret = vioapic_hwdom_map_gsi(gsi, ent.fields.trig_mode,
                                         ent.fields.polarity);
+
+        if ( gsi == TRACK_IRQ )
+            debugtrace_printk("vIO-APIC UNMASK irq %u irr %u mask %u assert count %u\n",
+                              gsi, pent->fields.remote_irr, pent->fields.mask,
+                              hvm_irq->gsi_assert_count[gsi]);
+
         if ( ret )
         {
             gprintk(XENLOG_ERR,
@@ -285,6 +295,9 @@ static void vioapic_write_redirent(
             unmasked = 0;
         }
     }
+    else if ( is_hardware_domain(d) && gsi == TRACK_IRQ )
+        debugtrace_printk("vIO-APIC MASK irq %u\n", gsi);
+
 
     if ( gsi == 0 || unmasked )
         pt_may_unmask_irq(d, NULL);
@@ -405,6 +418,10 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
 
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
index 6b1305a3e5..e0949b7057 100644
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
@@ -1010,6 +1016,10 @@ void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi,
     if ( !is_iommu_enabled(d) )
         return;
 
+    if ( guest_gsi == TRACK_IRQ )
+        debugtrace_printk("hvm_dpci_eoi irq %u irr %u\n", guest_gsi,
+                          ent->fields.remote_irr);
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
 
+#define TRACK_IRQ 17
+
 #endif /* __XEN_IRQ_H__ */
-- 
2.29.2


--4ld5vgy3khrjzwcn--

