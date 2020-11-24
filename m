Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 517872C2590
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 13:21:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35884.67536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khXJy-0002MJ-6b; Tue, 24 Nov 2020 12:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35884.67536; Tue, 24 Nov 2020 12:21:22 +0000
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
	id 1khXJy-0002Lu-37; Tue, 24 Nov 2020 12:21:22 +0000
Received: by outflank-mailman (input) for mailman id 35884;
 Tue, 24 Nov 2020 12:21:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IwAZ=E6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1khXJw-0002Lm-1S
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 12:21:20 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00e2104e-7bcf-496d-9923-191005c00d95;
 Tue, 24 Nov 2020 12:21:18 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IwAZ=E6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1khXJw-0002Lm-1S
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 12:21:20 +0000
X-Inumbo-ID: 00e2104e-7bcf-496d-9923-191005c00d95
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 00e2104e-7bcf-496d-9923-191005c00d95;
	Tue, 24 Nov 2020 12:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606220479;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UT1Jw74Vs/Hv2fHQGoRVXkE+ZNaVwVPscpNr1DaJqr4=;
  b=ZgDlnn9zBpYIbh9K+/lVNYiVCQwNSxD5JdLFejNqiWAp16LC41wxjFWv
   Dt5PbM82bYkfC+VHwaAGje9UUL0vUtMd3AwvdsIZYu61OG1rH8EZpirTh
   QImW70ceTMjWJ2jjMyryv2rlNk6Q6AX0hoF1fe1F+0tQ43onkPLu22S4z
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: P26pmw1m8uQYa0VNLSfqkzvQGOMBoB6DXMkpVJv9oq51mLl90ZGR2rM0mRQMSh2YQipBiYvptj
 zlnKCV0OHetvgWv+orhEBMm+GsTREkzo+YdtjhEYqbG3GBD3tXJyriiLQ0FrZwv7VTaxCpupjj
 zONm+wmeBKwBaBSvbWY64OCpAxElBzcYC8XJiZJK58CHcaWPut08LlKxzU85Pz1vVzyXqo9W1s
 Hl6fJXzEFFmtMHCOxm3v/V61G8TaLnLd4LRKEjvn2fsllfIKmrGlghyq0eZjl/nx5OYtTo/nR4
 1ic=
X-SBRS: None
X-MesageID: 31821158
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,366,1599537600"; 
   d="scan'208";a="31821158"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akyBNoR98n2oyBfNGJUi0DlYUIxfEU1juvtwllcFDByr6tOe1yvwU59l/MdKQeONPUzGsgDa/nl66Bav9zMCzzhgJVvwHYF7ERqgqy3LQS4J2q2MDd0mlvBu8Iq06M6pBby7t3xriyWeCGmEtwCooo1zRhClwLpfBR6dqF1MjFM7VckRn9Nq+vBc25Ms++pgYLNanNpSxfQooIEASIqCPLmKD+fiTmYBO4v38j58oSInUrGrTTB1jBscWforhYs1USqhXr/tbVY5cVAgERs3NkQByy3t3qPvic6tqvY/VPa1qRbt282srDjOzHbfONMyBX5mlIuQZ+CbEY4VS08kPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+wZjtA5qv85uNzbG2MpKsL2j7/fVq+8tr23ISSjgW0=;
 b=gDKjXQrygG5WC6+H8FNUyydzbGnNwY/VROWbF43cI62t1ESv4dRvT6i+WjW734c7dnEVwkwHQ9Tuw2lUBu3xNSJPwaw3z08Z3bpso92RekKn1zqAQruTcCfNQUFUX0LjMLZWgzmWqNiwt2kykb+9lP1DwlhghJVbma6/3+9zx2BNtfoZ8aNA+sJ8/qq3Fme+Mraa2Yp6LU8/1YTDOsdDTHFKf+Uu+Orv1ZVy8ldycB2nJN1pZNefc3qPBXsxqmKr5OWtzkAfiB6eQ8fegba3pHuXEHQSD+1wAmaZk78nRzH8oZtMiqMjzg45SkRET4TE2AWuZbDU/y6nPousDoLXYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+wZjtA5qv85uNzbG2MpKsL2j7/fVq+8tr23ISSjgW0=;
 b=vZnED5EYGTfRwCkaO2keLavZ+bkXhazGCzk5/sYExGKYQ7KlNSY/k/HH1lErWUuvLQsrFh4UuZ3296D0bZ3/GA4xFv7DLnq8qyG6OhD+0lx3tsT9NS8UDBkrpTYbDXXv2DWLmNntWH3HxaOus7vT/Xj6OSLoAQInS4PPnF1toB8=
Date: Tue, 24 Nov 2020 13:21:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Manuel Bouyer <bouyer@antioche.eu.org>, <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201124122102.3igsriesou3vl6mu@Air-de-Roger>
References: <20201120092754.GH1508@antioche.eu.org>
 <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
 <20201120103824.GJ1508@antioche.eu.org>
 <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
 <20201123113241.GE2520@antioche.eu.org>
 <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
 <20201123143150.GG2520@antioche.eu.org>
 <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
 <20201123173925.GG4662@antioche.eu.org>
 <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
X-ClientProxiedBy: LNXP265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0f3f439-d5e7-4b76-223f-08d89073701e
X-MS-TrafficTypeDiagnostic: DM5PR03MB2970:
X-Microsoft-Antispam-PRVS: <DM5PR03MB2970CF23602DF67A847EAB0E8FFB0@DM5PR03MB2970.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Bylk13G0VCykW43GuU1TvNvg0Dfr+dhOZ103It9FEbGEeVnPaKQHCFnx0x62izfC0kqLi2/YV3k80/cfG7Yg9x1AH0c0WY14YFfxfJHoH58BCBaZDmKvp8/hGGyvuhDm+1HOHWIbkbrY5G1x5xD4cW9j+ArJAqR8qDPE3QEiGYEQHzambWSb76/pOTiRA/cfj8QxlJwIuFDJ/lsQJMURcFXmseUACzdxib56sWY/uRH0/YWWoQF4pefEyajMRfYtEoMWaoZiDhmAxNtOFOZ5ZGHgonlWsjA0BsUsxVeQQjg2YXblS3ZBBKtlEWCIIjyT8Am+nqVLj7U4cSCR3SzcUO6dyvnuwBrqQKGQm9+05dkAh6wtoMSaDPqg/uDLFqrBjhauSfnOkNeL3aRCv18EA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(39860400002)(366004)(376002)(396003)(346002)(6496006)(66556008)(66476007)(966005)(6916009)(66946007)(5660300002)(478600001)(85182001)(956004)(186003)(4326008)(6666004)(8936002)(9686003)(2906002)(33716001)(1076003)(26005)(8676002)(83380400001)(53546011)(316002)(16526019)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: E+Ze+aUnovIsm1NPO1v9zskaM+rvSGLA/xKJoGrpMPHWD/DUTPRIDcgGY5XsuDABIziJSyCdUIhD+NLL+JOkDzgmawY7HEYwhLsrWgTMlI1ZSgWDETqFGRFlyVjMmE4ndSMFEmUxA7SYcH4f5Vnfdd1mE3veIsxTfWPEWKg9S+P58xQ+SgzP3FeB0RVfIEsy1WiqBSvDQ88ko83mpzuUmiuvAep7cIHA9V8UprMHPgwWG4xbjHtEtkgYMcZlvx3H+O3vWsO2xkUgE9Li/A0gF1+m0jNCthD7UkzKhzYwMYDz/1pRsVowqhzWnehs9crE/8iYEsK/Vsepj7lyZPbpDTxczbRPXDrgueStgClPmWmgNxtRN8xdMrizT9VLYsaooQJ1vhwdoXW2qgyKu2AYJmimdpueWvfYnhhPZYNn1Xk2rQ7w6qylu/7MjK92d82r6yOqacJ9HZKAGgoOkIe24QR6uCTm7qtGaaFWNaE7vKhCXo6GnEB0g8hXeKF2A4nMp7vhdXQ+l9SJ+9Ytts4stDiyGHXmdCBCqsThRwfNp6ctFAaDPXs35ijArn1etJbP1Hem6EewNV+GkprwW5mpRQNckVt+yIwXtXMGktfwc48QWQcO54+LQ7s8kniU8/aqVNICqrxN9lz1swtxnkLTT5X/FmegvtrCf7qoI6XJq8l0J+bW707FrX/ut02HeDL4SqcJkwnKIK3bEFNc1ibilmYwUGBmRZajLjcrILlNUGbCSDahKQMg9BV/cpv83yQ843xpebdsQF4zh7rkIqWR1qfVNHSV+Q6SvYKYDRM3syyEOrlO16LbbfOCjV2ehWFlb8+o7Upe6vCktZzc3YRas3rsyiP+VzKS/d0YuLNm55/0R2SAytGS5CyB9w/hGt/ihNibTtM403zZfiheFynMIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f3f439-d5e7-4b76-223f-08d89073701e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 12:21:15.0851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5M6ohzohVqb6VcjnYntnN1wilOG9Pc/+l0u40d7DfaFxfQKrRBxdnU6mwuyIpJMqPatiosZBDLNigxQatbO+Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2970
X-OriginatorOrg: citrix.com

On Tue, Nov 24, 2020 at 11:05:12AM +0100, Jan Beulich wrote:
> On 23.11.2020 18:39, Manuel Bouyer wrote:
> > On Mon, Nov 23, 2020 at 06:06:10PM +0100, Roger Pau Monné wrote:
> >> OK, I'm afraid this is likely too verbose and messes with the timings.
> >>
> >> I've been looking (again) into the code, and I found something weird
> >> that I think could be related to the issue you are seeing, but haven't
> >> managed to try to boot the NetBSD kernel provided in order to assert
> >> whether it solves the issue or not (or even whether I'm able to
> >> repro it). Would you mind giving the patch below a try?
> > 
> > With this, I get the same hang but XEN outputs don't wake up the interrupt
> > any more. The NetBSD counter shows only one interrupt for ioapic2 pin 2,
> > while I would have about 8 at the time of the hang.
> > 
> > So, now it looks like interrupts are blocked forever.
> 
> Which may be a good thing for debugging purposes, because now we have
> a way to investigate what is actually blocking the interrupt's
> delivery without having to worry about more output screwing the
> overall picture.
> 
> > At
> > http://www-soc.lip6.fr/~bouyer/xen-log5.txt
> > you'll find the output of the 'i' key.
> 
> (XEN)    IRQ:  34 vec:59 IO-APIC-level   status=010 aff:{0}/{0-7} in-flight=1 d0: 34(-MM)
> 
> (XEN)     IRQ 34 Vec 89:
> (XEN)       Apic 0x02, Pin  2: vec=59 delivery=LoPri dest=L status=1 polarity=1 irr=1 trig=L mask=0 dest_id:00000001
> 
> (XEN) ioapic 2 pin 2 gsi 34 vector 0x67
> (XEN)   delivery mode 0 dest mode 0 delivery status 0
> (XEN)   polarity 1 IRR 0 trig mode 1 mask 0 dest id 0
> 
> IOW from guest pov the interrupt is entirely idle (mask and irr clear),
> while Xen sees it as both in-flight and irr also already having become
> set again. I continue to suspect the EOI timer not doing its job. Yet
> as said before, for it to have to do anything in the first place the
> "guest" (really Dom0 here) would need to fail to EOI the IRQ within
> the timeout period. Which in turn, given your description of how you
> handle interrupts, cannot be excluded (i.e. the handling may simply
> take "slightly" too long).

I've tried to force some of those scenarios myself by modifying the
code, and didn't seem to be able to trigger the same scenario. I guess
the NetBSD case is slightly difficult to recreate.

> What we're missing is LAPIC information, since the masked status logged
> is unclear: (-MM) isn't fully matching up with "mask=0". But of course
> the former is just a software representation, while the latter is what
> the RTE holds. IOW for the interrupt to not get delivered, there needs
> to be this or a higher ISR bit set (considering we don't use the TPR),
> or (I think we can pretty much exclude this) we'd need to be running
> with IRQs off for extended periods of time.

Let's dump the physical lapic(s) IRR and ISR together with the
IO-APIC state. Can you please apply the following patch and use the
'i' key again? (please keep the previous patch applied)

Thanks, Roger.
---8<---
diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 60627fd6e6..c33d682b69 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1547,3 +1547,24 @@ void check_for_unexpected_msi(unsigned int vector)
 {
     BUG_ON(apic_isr_read(vector));
 }
+
+static DEFINE_SPINLOCK(dump_lock);
+void dump_lapic(void *unused)
+{
+    unsigned int i;
+    unsigned long flags;
+
+    spin_lock_irqsave(&dump_lock, flags);
+    printk("CPU %u APIC ID %u\n", smp_processor_id(), apic_read(APIC_ID));
+
+    printk("IRR ");
+    for ( i = APIC_ISR_NR - 1; i-- > 0; )
+        printk("%08x", apic_read(APIC_ISR + i*0x10));
+
+    printk("\nISR ");
+    for ( i = APIC_ISR_NR - 1; i-- > 0; )
+        printk("%08x", apic_read(APIC_IRR + i*0x10));
+    printk("\n");
+
+    spin_unlock_irqrestore(&dump_lock, flags);
+}
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index e66fa99ec7..92edb3000a 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2470,6 +2470,7 @@ static const char * delivery_mode_2_str(
     }
 }
 
+void dump_lapic(void *unused);
 void dump_ioapic_irq_info(void)
 {
     struct irq_pin_list *entry;
@@ -2516,6 +2517,9 @@ void dump_ioapic_irq_info(void)
             entry = &irq_2_pin[entry->next];
         }
     }
+
+    dump_lapic(NULL);
+    smp_call_function(dump_lapic, NULL, true);
 }
 
 static unsigned int __initdata max_gsi_irqs;


