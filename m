Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732482B946B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 15:21:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30830.60981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfknH-0001g2-73; Thu, 19 Nov 2020 14:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30830.60981; Thu, 19 Nov 2020 14:20:15 +0000
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
	id 1kfknH-0001fd-3M; Thu, 19 Nov 2020 14:20:15 +0000
Received: by outflank-mailman (input) for mailman id 30830;
 Thu, 19 Nov 2020 14:20:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Veg=EZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kfknG-0001fY-2N
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 14:20:14 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d88f820-47d8-4c90-85a5-1a05cc51748e;
 Thu, 19 Nov 2020 14:20:11 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=4Veg=EZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kfknG-0001fY-2N
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 14:20:14 +0000
X-Inumbo-ID: 7d88f820-47d8-4c90-85a5-1a05cc51748e
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7d88f820-47d8-4c90-85a5-1a05cc51748e;
	Thu, 19 Nov 2020 14:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605795611;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jKiBdHgO9AYfyZCgmCLajHqpgGa4FpWdnQus946xNhE=;
  b=ifRlDbvFzTO+zytFhrR4g9GkejWMcDQ1t3iRYdK2bc0yinP0ioteLiHY
   0R/dp4baPYqA9MtHYTjSyDVbtabEj1ulLX/nx/nJ5vzE1z1dEhO99qH8f
   DDaOCheg0/Z/8LVbpzQSTTCO1Wvf1rJmIOdr6X1siQIuAuCH+yT/jty0P
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DQVBbvRaYe1CWwjHi59DscQm+PuppxJDwMMPxYAw8h8DHxsKhgPNs0M1iJuabmZXROJotgAY4v
 lyRBCWDTGBzyzCQf2MEzQUuZJwVAHDWR2KSyR+d7a2M/HPcwNRBRTd9zfS1sWsHq2mdQ10v1n9
 HV6k79ySwP5esofYZitwBPCBNHDw0aEybaI3IRBoAb96o2GA4Tz5nzG8dBs/qI/SBeADYEHjBk
 ns1yAVHe6Ym94qkxkG7kEonoEWfezOFq1bGaqIG0Orvd+dw1878NYuIlqVhfXzC65BQxq9n/sL
 XMQ=
X-SBRS: None
X-MesageID: 31758099
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,490,1596513600"; 
   d="scan'208,223";a="31758099"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSzO1OPx//NLGPBxIaBNIPRUG1lOfsf6boG6572w9qFVksYvaaKWdoBz2/idG0KGUOC6v2F2+amcZZuZZQyAfnoE9BQtIq2qOopCiTrOv0vTSGklJF06MTjGfVhNRNEL6TqQIHZFttG860uYFCrx1mKrVx++PhyGja/739S2fRU0CRoGBGOgBkYdexHrfqB6U2pU0ENwK/yEQKsqI97LWVM8UlqfIbuBLVkb0fBJEPsIhEpxP0qXwVFpOZ/mJjADXWtb0o2K40pseNSJYvMZjTKPC7WhyfQw66BpJ7FUJNnTP4Cjlmpj2ZQV6d7r2GApvSK1AkMmASDwSkuBuDtU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xYD+6yimUIh0rI6DWtLIt6ifDqPKnRFCVLT5EUL8Og=;
 b=lbFryb9YNSBcYhHcGyH4O5gPWJGeh+8fp9XPKzR7eXLyYxpVQ3B+jkZ9KW71x7J2PMc3lbvNLCIl5HC6Tr/yy3l0OFHlpPeYbto/e+eA7qlchBzcQwD2zWSJYhQfdNNOrettL8s8pxoFqjEeeuNvv2TE9++SBCFt3cNbbjT9bx2lyy24DWae8s3krksPdX/mdYPeJRzXIyMMtFxYrOnhLsJ6u+CAxE0ZooWoblgPYImby9xe4lS7eU59PfkY8P03MpT8OiGW6isdz1HHY56Ha4OiqELu9xx0vslXyLZOJK4f5j8byDA0unn96F78X7JUuxwCAf/rDc1uU9DBguwDRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xYD+6yimUIh0rI6DWtLIt6ifDqPKnRFCVLT5EUL8Og=;
 b=B3r/TlK8FBdX3c3k7E+Tny1dgtoMmMtsAAF1JDGsBphG4WV4m/OY9uCDblLPpFTEhU7F4Qf+VeMf/QKPKsL9GT512f8bRcRUbpu/f+zar4L2xdrRXUVBqSOPh3cQ7xg99v8T7otd3HzXFM2JjKeEjjYaocsueIWsdV8XD0TcJRw=
Date: Thu, 19 Nov 2020 15:19:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201119141915.igyb7djkw47rf2dt@Air-de-Roger>
References: <20201117150949.GA3791@antioche.eu.org>
 <20201117155807.a7jgmftnj6njg6oz@Air-de-Roger>
 <20201117164033.GB3093@antioche.eu.org>
 <20201118085738.wpnfmjagxjf6cofp@Air-de-Roger>
 <20201118092425.GC1085@antioche.eu.org>
 <20201118100025.ic7r3kfsbdnr6muz@Air-de-Roger>
 <20201118121403.GC3126@antioche.eu.org>
 <20201118143928.hvamuf7t7jycsrzb@Air-de-Roger>
 <bb2b6182-f3a6-61e5-ee70-90a65ae56435@suse.com>
Content-Type: multipart/mixed; boundary="dhu473tb3wpezee4"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb2b6182-f3a6-61e5-ee70-90a65ae56435@suse.com>
X-ClientProxiedBy: LO2P265CA0500.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8917a712-5bb4-4c2f-ae00-08d88c961c26
X-MS-TrafficTypeDiagnostic: DM6PR03MB4299:
X-Microsoft-Antispam-PRVS: <DM6PR03MB429918CA37112B094E4BA7788FE00@DM6PR03MB4299.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dy8wDGnLgHJ1uZVDaGnpkSdQMjZ0EpHAkFjJUgFb1KBVib0cuSMVVreK4n4CCl4bWDdAGZQdXeXvZ2fo1DhsCqwUXI3RUrp4iEWUv/9mseBdpaWM7gJTYyuBVljSA/ihnF79cYzr5liGJLzB5h++jp/rcqrGbd0XosWiuoD4W3VDsltZJ9ynXkXixhNNbt5Jm4yu8OhAjrBtdJKsYSn7+OmZE+ywbAdU3tUhMdPVjjtN0Zj/7bGxtT8UhgPtmj86itO9Rno4CrSNZb2bbCncLeC8+agNlNp08oSvDOqWd0WyFcUamxaQCQ9r8FS5UpUsJQ5ytPfsT5Xy3F3q2IPganvNwDmDcpJMHa8JjnEucVHZoFbg3ucUtjp9OoQKwYXA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(44144004)(8936002)(66556008)(2906002)(86362001)(85182001)(66476007)(110136005)(83380400001)(316002)(53546011)(5660300002)(8676002)(235185007)(33716001)(186003)(16526019)(6496006)(1076003)(6486002)(4326008)(33964004)(6666004)(956004)(26005)(66576008)(478600001)(66946007)(9686003)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: cYBcIHfny6nQi6VJePy5U0mi2E87jn+uRMNyyee9h3iLS/tREeGgDBDOn4Q6Xyk+jOBN/Nlgt+/pmKDlhfGLWQ1As7uSnnS2WVTt49CkWqnZkegVJG2CNDf6ClzcMT6P9Q1T+pNJeyKpoB4Njpm9QZ6mLz9vbD8uh7wLNFsfUk00KbDPLDRjUKhyxIKIAfUYzo3duPvO+FulUd9emneB0HYt1jV81OY85NJvBHJ9+yfmKSctJF0CZl8AZ46QQrdgFGdLX9QALqKAwMdaxZYQauG3TwsLP67WyT6zsxlvufkGroVRy2XvTp3V8Rp2ON2j3A3rzTEfay5ZoWh5vRem9UQ+vg+687mOuLBygYDNZ+6b5XvTzzNX0YSGvJtgnW1QGharSHE4txYFJo9S12jLVrGLBtBjv41hU283eoM7ksfSg55kLFy3yrXyxdoxX+yAx6s8Ii9F3Bp/Nocq6YYBgVAGo8V6OcJHoAv3yLF2jLc50GRywhDfxKBOu8bK5snEZwyGPt5NXB+Iz4UYqHYi1I1iAsYn/n/Uru3dXxxZUFOdw7goboH6XCDd8Qg9UoOJPhtzXemPGI/s7b1i0U7JU3clq8FiLE5NzeiTgR2ZXkwoU+LR1aqbpTW/6o32AFQD7FpwmYbt3tluHJJ7gq9bcnqnzF6DBYvQmYAkbhKT8hl9+R35O3+oj6oITyX4ml7HxkTd68I2otxlJjMGPVdJMBZmcbkWCSXtzNIbAn3pyk5iaTHEdI84/HWW7nGKKgb89IgybcwXQlwtMzxiio03c8yXhQKqGacPFQr3XTXC8+7WeW5VX/I1/QwKSPamm/+gSmAYXwBkbpCWNc28g2KhOpNZpiF3mkHRxsVgS1dOaUfoUUI66uYQm+m5Y9o4S41mSIHs2fnDcnaB4CFZnYPmyw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8917a712-5bb4-4c2f-ae00-08d88c961c26
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 14:19:21.9987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgVgAWpjZ/pZUD+ro4zA0/7VzpcTmNKTSsJpfi3G07umxdvScWcUMRBZjannR7VmU+1+dEfMhSB+bP76ZRuZNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4299
X-OriginatorOrg: citrix.com

--dhu473tb3wpezee4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Nov 18, 2020 at 03:59:44PM +0100, Jan Beulich wrote:
> On 18.11.2020 15:39, Roger Pau Monné wrote:
> > On Wed, Nov 18, 2020 at 01:14:03PM +0100, Manuel Bouyer wrote:
> >> I did some more instrumentation from the NetBSD kernel, including dumping
> >> the iopic2 pin2 register.
> >>
> >> At the time of the command timeout, the register value is 0x0000a067,
> >> which, if I understant it properly, menas that there's no interrupt
> >> pending (bit IOAPIC_REDLO_RIRR, 0x00004000, is not set).
> >> From the NetBSD ddb, I can dump this register multiple times, waiting
> >> several seconds, etc .., it doens't change).
> >> Now if I call ioapic_dump_raw() from the debugger, which triggers some
> >> XEN printf:
> >> db{0}> call ioapic_dump_raw^M
> >> Register dump of ioapic0^M
> >> [ 203.5489060] 00 08000000 00170011 08000000(XEN) vioapic.c:124:d0v0 apic_mem_re
> >> adl:undefined ioregsel 3
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 4
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 5
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 6
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 7
> >>  00000000^M
> >> [ 203.5489060] 08(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 8
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 9
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel a
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel b
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel c
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel d
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel e
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel f
> >>  00000000^M
> >> [ 203.5489060] 10 00010000 00000000 00010000 00000000 00010000 00000000 00010000 00000000^M
> >> [...]
> >> [ 203.5489060] Register dump of ioapic2^M
> >> [ 203.5489060] 00 0a000000 00070011 0a000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 3
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 4
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 5
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 6
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 7
> >>  00000000^M
> >> [ 203.5489060] 08(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 8
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 9
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel a
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel b
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel c
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel d
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel e
> >>  00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel f
> >>  00000000^M
> >> [ 203.5489060] 10 00010000 00000000 00010000 00000000 0000e067 00000000 00010000 00000000^M
> >>
> >> then the register switches to 0000e067, with the IOAPIC_REDLO_RIRR bit set.
> >> From here, if I continue from ddb, the dom0 boots.
> >>
> >> I can get the same effect by just doing ^A^A^A so my guess is that it's
> >> not accessing the iopic's register which changes the IOAPIC_REDLO_RIRR bit,
> >> but the XEN printf. Also, from NetBSD, using a dump fuinction which
> >> doesn't access undefined registers - and so doesn't trigger XEN printfs -
> >> doens't change the IOAPIC_REDLO_RIRR bit either.
> > 
> > I'm thinking about further ways to debug this. I see that all active
> > IO-APIC pins are routed to vCPU0, but does it make a difference if you
> > boot with dom0_max_vcpus=1 on the Xen command line? (thus limiting
> > NertBSD dom0 to a single CPU)
> 
> I too have been pondering possible approaches. One thing I thought might
> help is accompany all places setting remote_irr (and calling
> vioapic_deliver()) with a conditional log message, turning on the
> condition immediately before the first "undefined ioregsel" gets logged.
> (And turn it off again once the last RTE was read in sequence, just to
> avoid spamming the console.) From Manuel's description above, there has
> to be something that sets the bit and causes the delivery _without_ any
> active action by the guest (i.e. neither EOI nor RTE write) and
> _without_ any new instance of the IRQ appearing. I have some vague hope
> that knowing how we end up making the system make progress again may
> also help understand how it got stuck.

I've got two different debug patches for you to try. I'm attaching both
to this email but I think we should start with Jan's suggestion
(conditional_print.patch). That patch will only print extra messages
between the ioregsel 3 ... ioregsel f existing debug messages, you
will have to trigger this from NetBSD by using ioapic_dump_raw AFAICT.

The other patch (verbose_intr.patch) adds some messages related to
interrupts, but I'm afraid it's likely to interfere with the issue we
are trying to debug, since it will add a lot of extra printk's (and
likely flood your console).

Thanks, Roger.

--dhu473tb3wpezee4
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="conditional_print.patch"

From 9f1cf4f5f4f143be2d9e87d1b2f4c4cf4c286b69 Mon Sep 17 00:00:00 2001
From: Roger Pau Monne <roger.pau@citrix.com>
Date: Thu, 19 Nov 2020 14:11:43 +0100
Subject: [PATCH]

---
 xen/arch/x86/hvm/vioapic.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 67d4a6237f..9c0423b26e 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -43,7 +43,13 @@
 /* HACK: Route IRQ0 only to VCPU0 to prevent time jumps. */
 #define IRQ0_SPECIAL_ROUTING 1
 
-static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int irq);
+static void _vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int irq);
+
+static bool __read_mostly print;
+#define vioapic_deliver(vioapic, irq) ({\
+    if ( print && irq == 34 ) \
+        printk("%s:%d:%s: vioapic_deliver\n", __FILE__, __LINE__, __func__); \
+    _vioapic_deliver(vioapic, irq); })
 
 static struct hvm_vioapic *addr_vioapic(const struct domain *d,
                                         unsigned long addr)
@@ -119,6 +125,16 @@ static uint32_t vioapic_read_indirect(const struct hvm_vioapic *vioapic)
 
         if ( redir_index >= vioapic->nr_pins )
         {
+            switch ( vioapic->ioregsel )
+            {
+            case 3:
+                print = true;
+                break;
+
+            case 0xf:
+                print = false;
+                break;
+            }
             gdprintk(XENLOG_WARNING, "apic_mem_readl:undefined ioregsel %x\n",
                      vioapic->ioregsel);
             break;
@@ -391,7 +407,7 @@ static void ioapic_inj_irq(
     vlapic_set_irq(target, vector, trig_mode);
 }
 
-static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
+static void _vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
 {
     uint16_t dest = vioapic->redirtbl[pin].fields.dest_id;
     uint8_t dest_mode = vioapic->redirtbl[pin].fields.dest_mode;
-- 
2.29.2


--dhu473tb3wpezee4
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="verbose_intr.patch"

From 381eebe51657a3b3101dc80880fa3350dcfb1e23 Mon Sep 17 00:00:00 2001
From: Roger Pau Monne <roger.pau@citrix.com>
Date: Thu, 19 Nov 2020 10:45:00 +0100
Subject: [PATCH]

---
 xen/arch/x86/hvm/vioapic.c   | 9 +++++++++
 xen/arch/x86/irq.c           | 3 +++
 xen/drivers/passthrough/io.c | 3 +++
 xen/include/asm-x86/irq.h    | 2 ++
 4 files changed, 17 insertions(+)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 67d4a6237f..1702434f0d 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -235,6 +235,10 @@ static void vioapic_write_redirent(
     pent = &vioapic->redirtbl[idx];
     ent  = *pent;
 
+    if ( gsi == TRACK_IRQ )
+        printk("vioapic write %s word %d val %#x current %#lx\n",
+               top_word ? "top" : "low", val, ent.bits);
+
     if ( top_word )
     {
         /* Contains only the dest_id. */
@@ -410,6 +414,9 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
                 "vector=%x trig_mode=%x",
                 dest, dest_mode, delivery_mode, vector, trig_mode);
 
+    if ( irq == TRACK_IRQ )
+        printk("vioapic inject vector %#x\n", vector);
+
     switch ( delivery_mode )
     {
     case dest_LowestPrio:
@@ -517,6 +524,8 @@ void vioapic_update_EOI(struct domain *d, u8 vector)
                 continue;
 
             ent->fields.remote_irr = 0;
+            if ( vioapic->base_gsi + pin == TRACK_IRQ )
+                printk("vioapic EOI\n");
 
             if ( is_iommu_enabled(d) )
             {
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 8d1f9a9fc6..34f50a24ea 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1837,6 +1837,9 @@ static void do_IRQ_guest(struct irq_desc *desc, unsigned int vector)
     unsigned int        i;
     struct pending_eoi *peoi = this_cpu(pending_eoi);
 
+    if ( desc->irq == TRACK_IRQ )
+        printk("do_IRQ_guest\n");
+
     if ( unlikely(!action->nr_guests) )
     {
         /* An interrupt may slip through while freeing an ACKTYPE_EOI irq. */
diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
index 6b1305a3e5..ddbda10593 100644
--- a/xen/drivers/passthrough/io.c
+++ b/xen/drivers/passthrough/io.c
@@ -997,6 +997,9 @@ static void hvm_gsi_eoi(struct domain *d, unsigned int gsi,
     if ( !pirq_dpci(pirq) )
         return;
 
+    if ( gsi == TRACK_IRQ )
+        printk("dpci EOI\n");
+
     hvm_gsi_deassert(d, gsi);
     hvm_pirq_eoi(pirq, ent);
 }
diff --git a/xen/include/asm-x86/irq.h b/xen/include/asm-x86/irq.h
index 7c825e9d9c..bb450e5e59 100644
--- a/xen/include/asm-x86/irq.h
+++ b/xen/include/asm-x86/irq.h
@@ -218,4 +218,6 @@ int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p);
 int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
                               int type, struct msi_info *msi);
 
+#define TRACK_IRQ 34
+
 #endif /* _ASM_HW_IRQ_H */
-- 
2.29.2


--dhu473tb3wpezee4--

