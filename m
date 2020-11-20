Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 531D22BA4A3
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 09:30:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31733.62369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg1nB-00035i-DV; Fri, 20 Nov 2020 08:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31733.62369; Fri, 20 Nov 2020 08:29:17 +0000
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
	id 1kg1nB-00035J-AA; Fri, 20 Nov 2020 08:29:17 +0000
Received: by outflank-mailman (input) for mailman id 31733;
 Fri, 20 Nov 2020 08:29:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pyS4=E2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kg1nA-00035E-2H
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:29:16 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3681cc1d-15a6-4020-b68f-c76db1f3c5fe;
 Fri, 20 Nov 2020 08:29:13 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pyS4=E2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kg1nA-00035E-2H
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:29:16 +0000
X-Inumbo-ID: 3681cc1d-15a6-4020-b68f-c76db1f3c5fe
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3681cc1d-15a6-4020-b68f-c76db1f3c5fe;
	Fri, 20 Nov 2020 08:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605860953;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=e/XOJfm6Yik9fbB6LpDsWUcJp3GKSVVGsFy97xkjHng=;
  b=AtaIZC4mL1++55xtLFLYHSg7PMDGtnyk3poOJwiR2S+I5vYt5tHb3ddH
   4pvB7qZFnpONk5N0DrV9oka3LPWzpj1e3zOJ5yi8pIy0OTHSskgRr5Nc3
   DM7grxVKQT7FdpPmvt5FyL10J01PKAKaksKw24mN3gMDvLhAlGgcSW2FA
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: M8T2BEx/CbFnLXagUoBnqAmqLkvlvum0KFxQvndoHExxaCSIjIaOsKwi7Xdwj0Jjrn40HILdy0
 IQx6CrzM+vQzcvKoETflzJiXHtGwOzagiwsmBeIGrikYa8MEj5MfMBuCzodgiw1HPzXdeP/KmH
 CgsPUOa4lgA/9kdNzj7CocJxJcgH5Va1yB7npP788KZ2L9yAd8LWj02iKAESxV/QPgE0BDxEbN
 j9D00bbaFgBRNk+etQPBjhAFrpn0978vgA9W/Xo8E6sp6BO8Sxbdd7Z/8SwO7WonpNlORCEZry
 2gU=
X-SBRS: None
X-MesageID: 31569347
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,356,1599537600"; 
   d="scan'208";a="31569347"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czVRnoQ0dW9Z+4wTICjf8d0Db3kDxJ7QGH6pC+fNREjnP6W7fyJ2bwtbo8LUX+MY93KwLz/toRIW0vq1M0pfc3QRh1VnmizR4qRFwb+eoGSW/G8IIRnks+gc49qDbKrmaC4ItiuaN3BhN7WOzlAeLYiki/jfoPXvGwiNVKg4te2PfslDSSCvun/ohODlVitVpgJvdulTRTR2ELiZuLV+lj0xSMZKqX5mnRbhdap/JkpW/OpGZ4H1HhJY4IOvAVnH64//rkoHkTUE9nx/XHpiiYhKhKAu42c0fipyGiiaR5wnC44v2Xd9Q8edf4SJ+NhmeHRyAsNCV/NoFcwC47/2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvalSxWtSQRZMaNFJ/AY+WptABqmVJaN1WINBaBf2F0=;
 b=ZqdvSPfj2qpXNsY17YdEyp0Ogh/pfDrKm1zlRJ3CQcgApGJ3NEMsB97zwue+l3lYDyLjJw02HS5hY6+6fAgR85v2wEV0ApD1wYLFWzAU69Yqp8v0lS6wxeRrT6aJQ8OAmrc24B72SJkLG/Zk7uLQSfHRlbuplfEA8w4IpLX7tt4/F9AlATxnCtaqPiniW7Tk/JS09cEYRQ7zxKd+tN5xvv0XNkVjtTiEJgqWqpnA7W6sVdRGhvBurNtTCrZu8LGNP2LDQFy5LEo0Hrg7eKTLxTQPXV6BWfgwNxIqOZWXh6PWNMZ+pbZg+TdAwrljlxkyzeTfX48oXwGVWR8QnOynMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvalSxWtSQRZMaNFJ/AY+WptABqmVJaN1WINBaBf2F0=;
 b=N8JNHrzcM3kKbi7EHiq1d9kgr2zGv6AnIL68cWtaI92W+gvaq5DC+paASMzi5HE2fZrYFYKfFGIZc2JrR2nbf3VNswESGxK8yhA3eWhAVNv+Vj8Mps9tAac8ts7IVefQS5rWrTE/f2dgwKAxCza7etr72CnhG7FCqEgEWPYnzMA=
Date: Fri, 20 Nov 2020 09:28:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Manuel Bouyer <bouyer@antioche.eu.org>, <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201120082855.5z4cibcd5djlwmgp@Air-de-Roger>
References: <20201118092425.GC1085@antioche.eu.org>
 <20201118100025.ic7r3kfsbdnr6muz@Air-de-Roger>
 <20201118121403.GC3126@antioche.eu.org>
 <20201118143928.hvamuf7t7jycsrzb@Air-de-Roger>
 <bb2b6182-f3a6-61e5-ee70-90a65ae56435@suse.com>
 <20201119141915.igyb7djkw47rf2dt@Air-de-Roger>
 <20201119155718.GB4104@antioche.eu.org>
 <20201119165734.GA4903@antioche.eu.org>
 <20201119175733.GA6067@antioche.eu.org>
 <1a50e1e2-b69c-afd6-a179-316231512004@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1a50e1e2-b69c-afd6-a179-316231512004@suse.com>
X-ClientProxiedBy: LO2P265CA0231.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef9ca351-6b3a-4baa-b781-08d88d2e547b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4299:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4299630F2FEE00D25B4DA7E28FFF0@DM6PR03MB4299.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YTa8yKe5d3kg4zFQfpBQyXg1UEuF1vkpmDAgEWJBYF9/sXVsMNO8j21eAEnZLkNO/hDwU6J15o6KEPrFZRSKHe0Scu0qoTpTubgziMaXjWPl/y+fX7wgpbgMQnCQ8gWGKF8GJDqPgkcZ4khtUi2Uc6eOFOMviKLgQiNkaWXWV7Gz4ezNEYo7DxFVpx7X8DjSI06jYn2wZC06qzOgAYIpBkCSpfrQQOa5HX+hJ6bay+yioxaUSHLjEd/v1nxngVqIxqV1oQ35znmqQs6F0qgylZc128n6fPOs7RQqENXRWOBaHXgB2L+NY+ppHrBp32XkXAr/zBidLsTEmDdTaUTGcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(8936002)(6666004)(6486002)(9686003)(4326008)(1076003)(26005)(956004)(66946007)(478600001)(316002)(85182001)(86362001)(2906002)(6916009)(16526019)(8676002)(186003)(6496006)(33716001)(83380400001)(66556008)(66476007)(5660300002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 90JPh3RGZBUNsCouo1iDBU0tkhWg6D8wCtYNzsM0EMXc3NbrJf9SCPkzZJQyFaG3peFqdT4GMoxcO7QmZBXAGH8X1kT8ohJK7qCBL/ST2IHzaOi0o8EZLZ3rmx9s134hiFEUbt73fOf1zHA9bfR2zVvH//2rTzFK1E8UDI+zbrY1OOUhw0WdI3J6uTdu0nWlCg8elWPdsMxa4EMeZdMbPJ3Kjduor25J6Oz20x2zZgyK91+JGYgEQ92WYf7x1MrfDFplEL+ryIrFmrGjuYlI0vCthVA7U3azWwvNvRBtJkFWxH81nuC7jKYGo6dF1l2aMlLItk3vBy0tkWnagfzJMoTO+U4DYDRE0so1/OkE0e/oxBP9v/1oakNFw+DuHOovpX80GMk9aQ/s43An6pAHfJpfNmW+sMdsas7hN2ghdQgrZ9xyjaRYxcaBkq4/ObRMv9MFlffuBcUQQfXk69a4nJfuBA1vtZgWNOh/b5d3hqF+26o3DxVcyhYEP4VwD39lz5onlRSG+kL5Qpa/tDLCPo+lQYnF/GuyPcLU4Cr2w2HWG4rVjn3iAf6NM+4izpPwS0tcSD7MzNGmX93PrKH2gROd9tZx0oiNN8ogTCPtYQSo3AVkH6JKiHo1efAZxElVVzEYsgQskvRVC7C69V62QiPE5sAtrJxAN4guaGASNx64SOSF1RQdiJYlju3CwE69p/NOjgk667J5kgEoqW2gu8S2eREk/H3ybeR4pLYVJ5PW4Ji3ZqHO6nn8/qmZ7bBvcLAjatXTRnkIviRY/SaarMlT1UYhLwVb/aFlJgbI+PKjpHL6G11rPSUtrX77ywfTfURV4I5E5vjs5bzdS/yy/Vo1zl91NChe+c0SQBUH5efA/ll5ugyrO9QjbRLNLCtW5n70XBb1K3T9L1H81yNu2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9ca351-6b3a-4baa-b781-08d88d2e547b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 08:28:59.9874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3cjR7A3BVLwMr8vLRee6loHDVKTLqfPn5pTdLWwnepmNiIbtbbIQfrNxw2tofupM1jQSeeKgvRls576YG6hGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4299
X-OriginatorOrg: citrix.com

On Fri, Nov 20, 2020 at 09:09:51AM +0100, Jan Beulich wrote:
> On 19.11.2020 18:57, Manuel Bouyer wrote:
> > I added an ASSERT() after the printf to ket a stack trace, and got:
> > db{0}> call ioapic_dump_raw^M
> > Register dump of ioapic0^M
> > [  13.0193374] 00 08000000 00170011 08000000(XEN) vioapic.c:141:d0v0 apic_mem_readl:undefined ioregsel 3
> > (XEN) vioapic.c:512:vioapic_irq_positive_edge: vioapic_deliver 2
> > (XEN) Assertion '!print' failed at vioapic.c:512
> > (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:   C   ]----
> > (XEN) CPU:    0
> > (XEN) RIP:    e008:[<ffff82d0402c4164>] vioapic_irq_positive_edge+0x14e/0x150
> > (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v0)
> > (XEN) rax: ffff82d0405c806c   rbx: ffff830836650580   rcx: 0000000000000000
> > (XEN) rdx: ffff8300688bffff   rsi: 000000000000000a   rdi: ffff82d0404b36b8
> > (XEN) rbp: ffff8300688bfde0   rsp: ffff8300688bfdc0   r8:  0000000000000004
> > (XEN) r9:  0000000000000032   r10: 0000000000000000   r11: 00000000fffffffd
> > (XEN) r12: ffff8308366dc000   r13: 0000000000000022   r14: ffff8308366dc31c
> > (XEN) r15: ffff8308366d1d80   cr0: 0000000080050033   cr4: 00000000003526e0
> > (XEN) cr3: 00000008366c9000   cr2: 0000000000000000
> > (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> > (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> > (XEN) Xen code around <ffff82d0402c4164> (vioapic_irq_positive_edge+0x14e/0x150):
> > (XEN)  3d 10 be 1d 00 00 74 c2 <0f> 0b 55 48 89 e5 41 57 41 56 41 55 41 54 53 48
> > (XEN) Xen stack trace from rsp=ffff8300688bfdc0:
> > (XEN)    0000000200000086 ffff8308366dc000 0000000000000022 0000000000000000
> > (XEN)    ffff8300688bfe08 ffff82d0402bcc33 ffff8308366dc000 0000000000000022
> > (XEN)    0000000000000001 ffff8300688bfe40 ffff82d0402bd18f ffff830835a7eb98
> > (XEN)    ffff8308366dc000 ffff830835a7eb40 ffff8300688bfe68 0100100100100100
> > (XEN)    ffff8300688bfea0 ffff82d04026f6e1 ffff830835a7eb30 ffff8308366dc0f4
> > (XEN)    ffff830835a7eb40 ffff8300688bfe68 ffff8300688bfe68 ffff82d0405cec80
> > (XEN)    ffffffffffffffff ffff82d0405cec80 0000000000000000 ffff82d0405d6c80
> > (XEN)    ffff8300688bfed8 ffff82d04022b6fa ffff83083663f000 ffff83083663f000
> > (XEN)    0000000000000000 0000000000000000 0000000a7c62165b ffff8300688bfee8
> > (XEN)    ffff82d04022b798 ffff8300688bfe08 ffff82d0402a4bcb 0000000000000000
> > (XEN)    0000000000000206 ffff8316da86e61c ffff8316da86e600 ffff938031fd47c0
> > (XEN)    0000000000000003 0000000000000400 ff889e8da08f928a 0000000000000000
> > (XEN)    0000000000000002 0000000000000100 000000000000b86e ffff93803237f010
> > (XEN)    0000000000000000 ffff8316da86e61c 0000beef0000beef ffffffff80555918
> > (XEN)    000000bf0000beef 0000000000000046 ffff938031fd4790 000000000000beef
> > (XEN)    000000000000beef 000000000000beef 000000000000beef 000000000000beef
> > (XEN)    0000e01000000000 ffff83083663f000 0000000000000000 00000000003526e0
> > (XEN)    0000000000000000 0000000000000000 0000060100000001 0000000000000000
> > (XEN) Xen call trace:
> > (XEN)    [<ffff82d0402c4164>] R vioapic_irq_positive_edge+0x14e/0x150
> > (XEN)    [<ffff82d0402bcc33>] F arch/x86/hvm/irq.c#assert_gsi+0x5e/0x7b
> > (XEN)    [<ffff82d0402bd18f>] F hvm_gsi_assert+0x62/0x77
> > (XEN)    [<ffff82d04026f6e1>] F drivers/passthrough/io.c#dpci_softirq+0x261/0x29e
> > (XEN)    [<ffff82d04022b6fa>] F common/softirq.c#__do_softirq+0x8a/0xbf
> > (XEN)    [<ffff82d04022b798>] F do_softirq+0x13/0x15
> > (XEN)    [<ffff82d0402a4bcb>] F vmx_asm_do_vmentry+0x2b/0x30
> > (XEN) 
> > (XEN) 
> > (XEN) ****************************************
> > (XEN) Panic on CPU 0:
> > (XEN) Assertion '!print' failed at vioapic.c:512
> > (XEN) ****************************************
> 
> Right, this was the expected path after what you've sent prior to this.
> Which turned my attention back to the 'i' debug key output you had sent
> the other day. There we have
> 
> (XEN)    IRQ:  34 vec:51 IO-APIC-level   status=010 aff:{0}/{0-7} in-flight=1 d0: 34(-MM)
> 
> i.e. at that point we're waiting for Dom0 to signal it's done handling
> the IRQ. There is, however, a timer associated with this. Yet that's
> actually to prevent the system getting stuck, i.e. the "in-flight"
> state ought to clear 1ms later (when that timer expires), and hence
> ought to be pretty unlikely to catch when non-zero _and_ something's
> actually stuck.

I somehow assumed the interrupt was in-flight because the printing to
the Xen console caused one to be injected, and thus dom0 didn't had
time to Ack it yet.

> 
> So for the softirq to get Dom0 out of its stuck state, there has got to
> be yet some other event. Nevertheless it may be worthwhile
> instrumenting irq_guest_eoi_timer_fn() to prove we actually take this
> path, i.e. Xen is trying to "clean up" after Dom0 taking too long to
> service an IRQ. In normal operation this path shouldn't be taken, so I
> wouldn't exclude something got broken in that logic. (Orthogonal to
> this it may also be worth seeing whether increasing the timeout would
> actually help things. This wouldn't be a solution, but another data
> point hinting something's wrong on this code path.)
> 
> Roger, I'm also somewhat puzzled by the trailing (-MM): Is PVH using
> event channels for delivering pIRQ-s?

No, it's always using emulated interrupt controllers. I explicitly
disabled HVM PIRQ for PVH.

> I thought that's purely vIO-APIC
> and vMSI? I wonder whether we misleadingly dump info from evtchn 0
> here, in which case only the 2nd of the M-s would be meaningful (and
> would be in line with non-zero in-flight).

Likely - will have to look closer but there's no event channel
associated with a PIRQ on PVH dom0. I will send a patch to fix dump_irqs.

Maybe we should track interrupt EOI, and see when the interrupt gets
EOI'ed. Will see if I can find some time later to prepare another
debug patch.

Roger.

