Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD82C027E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 10:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33686.64820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kh8TT-0000Mg-K1; Mon, 23 Nov 2020 09:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33686.64820; Mon, 23 Nov 2020 09:49:31 +0000
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
	id 1kh8TT-0000MH-Gn; Mon, 23 Nov 2020 09:49:31 +0000
Received: by outflank-mailman (input) for mailman id 33686;
 Mon, 23 Nov 2020 09:49:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kh8TS-0000MC-5D
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 09:49:30 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83da4162-00ac-4b4d-96f6-cf13af9158f5;
 Mon, 23 Nov 2020 09:49:28 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kh8TS-0000MC-5D
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 09:49:30 +0000
X-Inumbo-ID: 83da4162-00ac-4b4d-96f6-cf13af9158f5
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 83da4162-00ac-4b4d-96f6-cf13af9158f5;
	Mon, 23 Nov 2020 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606124968;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=JAP52AdonB3Z7Dh+6YuV32toCEepximl/yiUayUcmPI=;
  b=doOUMlf/kyFDvwIBPPGUvzwhyYM4XlKgNuP4hXEvXwBN6ky2r0Bc8IT/
   e3NbX8JKxiU8Rb0IL0IkbLlBejdaIIilP0EY7fI96aQkcDfRwlRH18oqV
   oH0NImBvlEItZhXdGvuQ1Hz0PldBvfVsNhsCPtwmhDXCZgyLFUqrxo803
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TOBUjuq1fzHaVhzdt5eMkZuBUJL851VcAtdqAE+Jxrz60PvJmouCVm6wE8Egi8vep/mrDLP88C
 +msOXakPrCYIZQaKjqEFZyuuk7SBaSuzm8eWe6XbG+93I4C4gaMgMs0xKmtrR8gND/ZVwGty2M
 GFtR09/zVXOTRqEiRf1DrvHnzGq0Y5hCrsHdArovH/Prf7ooGSDedxrjF6qgDxFoGcuUKGD+9R
 FD8QYrZkK4ZNKx7zvysLHAYyJGUMCEhmki2B0m58gdetDG6dTgcihZc7IP2xTq+0Mzns9Qx3ht
 T5o=
X-SBRS: None
X-MesageID: 32883893
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="32883893"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cy4hQmYkr5U8k2Hg3yHcBK2wOgUz36CBFxsuXnu9OrFd7p3GpZsU8plDwUBSfMqBcDIfiQ4FXUEBZoPG+Cxw/0zPvNgi6xGO6meW4jRpVDnfJxYmmFIlC1oLvI3Y35T8S9qWpV7N2cyzDnE6Jolu7RapdXFxMzpNiV5XKw6bS/L6pRLiaUl3/6rJPhdBnrpVL1GxKkvyh9lVSpAabn7KNDTA+rSel8sb+OmioUVv0BFe4ht/awn1gm5ZZMXwv/YoxJRkXPutb/ND15k3yvaFu2w/7wkDkGA2PRwTaEmuO8fwt3cn1VA3xTCdfXuf1k9S85MtcMFG2fc2EiqwqKXDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJFMd475iwVIU2mGpNJbjXvsEuSEI59CiBzjPZm+gac=;
 b=Jqcygkd5aVibyw1QmZC3VVc/szyVI0+8O49vq3mRPrQRfOnJJoiT+qlnljL/N9SCzwcGkWUQAokJH1SHYkjXXGusfdZ7Z8oAml3oKcYrK4D8MALNZ5zKrQ/Ib+jCoQn8uWmcf8H9f6ry/ySUZFtviA12wXD09npHnmBUXGgsb7QFSOlM3/t/CJKYUSoFceqdcN1CfMvlIzbaAZ2AuJYD0LCPvaA2/RL32SsFTnltzSY0FeLAf50wNanr32bh7YHpn156XMwNV3WTZgXaHc2jTZ2NYxapuUU39u/AhiJZtuOgDadP90PZdZOumkgZRI6V6q/Z47yL620u5X8NzKeAFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJFMd475iwVIU2mGpNJbjXvsEuSEI59CiBzjPZm+gac=;
 b=X8h2OrSe2Ua+xwjG6xujhMfdonWL5sBsNzCSnhtzrjLPBHmgYB+XbhdIcsDqjxpNT27rE//cXuMlwixoBTiY32Nx+dNqEhXNaRVh9CYxn3BAkoaQZPMHaoGz9yxSEh8g3X/o4HGMxkjOEIXCX2OeWslxRCv5jBbSbM6HPLL9a6Q=
Date: Mon, 23 Nov 2020 10:49:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Manuel Bouyer <bouyer@antioche.eu.org>, <xen-devel@lists.xenproject.org>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201123094918.xat7oka47nehqsng@Air-de-Roger>
References: <20201118121403.GC3126@antioche.eu.org>
 <20201118143928.hvamuf7t7jycsrzb@Air-de-Roger>
 <bb2b6182-f3a6-61e5-ee70-90a65ae56435@suse.com>
 <20201119141915.igyb7djkw47rf2dt@Air-de-Roger>
 <20201119155718.GB4104@antioche.eu.org>
 <20201119165734.GA4903@antioche.eu.org>
 <20201119175733.GA6067@antioche.eu.org>
 <1a50e1e2-b69c-afd6-a179-316231512004@suse.com>
 <20201120082855.5z4cibcd5djlwmgp@Air-de-Roger>
 <5e637a72-085d-45b9-aa5c-01e138c81875@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e637a72-085d-45b9-aa5c-01e138c81875@suse.com>
X-ClientProxiedBy: MRXP264CA0048.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c06ff43-8254-480c-6755-08d88f950f78
X-MS-TrafficTypeDiagnostic: DM5PR03MB3209:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3209C60F211EAFE8479E480F8FFC0@DM5PR03MB3209.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mq/qzPiWwuC7dBazRhnK/365vjX2rXO5J48lhMvyXXs6i6NdTYQUfFgx6SpfMo69QEE2zyu9Wry/Mdmmr1YcO9N89p4KCY6Al2+UhgUHxU1v57j8VMxJDGFnxHEnhcprDyluLoyA2AAItpK7Jzx7v8UMSLtLSR8g8yXudPPWLZwEB5SH9cPJsn+VOl2lAggr8Omb2xaclJPrPCthPzhSY7OK8Sz5sWelYKJhoCOi7P16uwpwjTXblN0QDeaK0jR24f06FRKNJjYLxGFiIZoD6OpY6dD7zKCwWqEfhKUPmB1gRzI7fDQyYdDTCclv3JeixbWMqnk7IrZXBGPbWZfQKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39850400004)(396003)(376002)(366004)(346002)(83380400001)(1076003)(33716001)(2906002)(66946007)(9686003)(6916009)(85182001)(478600001)(4326008)(86362001)(316002)(6496006)(5660300002)(16526019)(8676002)(26005)(8936002)(6666004)(66556008)(53546011)(6486002)(186003)(956004)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: J5A4NfHPJghWuxWObKd10XKzJGpSLwksUljXmTThzShWtOKfBzHcSlJs3DZhiGJItHi7P3L7rN63W3dC849JdsnxLDM3DCn05JcTrqt6u3naQHdjn690oXlcDEmegAV4KRZgiZCGlcOTRKPw4Otp5DlDbK+ihmG0jENobwhQ+TYiXd4vMXeeqa9R5sLu2WYSC87FYBWz14WCkCFm4N6PL20QyaaBkTm/t1kj6gEGo/+HOK/toi+u/BsxWNjdi0ZRCwjEEbtQgJ46AWgRYjYEsZolVLjV8WXmZx0oshNVd+aEW9ePq65NAtZMUYfxartPMYW8Ss0oeSb0LK+fVf/gdiw9d3ISeMVDcx+guEUVVJb8hkrKWMW37a6Sr8vIB0/Z1NbYSc5rckbl4tPjsxjcd9yj8qLxyeKtRVopSRE8XIHji5u0lsrxRhosox06zYdUEE0oMY4lHaBr8zcO66DY3Q4Kphq4cDBzhpUFLMCMRp37T2NJrNMD+8s+0PgZLMXK/LmEu+kJIir/iUYKxuliiqzBObUSi/NIJwkRh+pqr8JkHZ+5+GpfN88NDfLarIIFyKIWB3tYXYw3B99f5WQDgd3EPBnKeqdAc5qMkt2mBtrTh7hIhFVnnRXeLtVICCYNGNkx3eQ/ujmhOmHmQkzS4iQPHhaGbR80WqEjGR3SomH2zwt9YGFLk5yT9Xf6U0VZr2bEP4pkcZEiKVlhzEVy9QdsKDbLFTO+HVl/AW30fX6Xomvq1dLNMNg+5E3h5I/bpoCTn1P0uX2hSy7ehKMiAkg8QTRzFE0oyGcH3UUHDmvL5emTyz2v6svhgXEOt8d8hnXcJV1SJxxeZ9TVvM1g14ASHXTPiFE/KV1OvJBQUZDqT3pWNv44Dgix70Hmp4ZGxHcVPCS8iQdRfoYkmdrx5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c06ff43-8254-480c-6755-08d88f950f78
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 09:49:24.6548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/2SaKMISNtZT6rMHR4H893sLXeiKFgVu+YKMDFknokh+MDvIy/JjXEDjI516zPg9ESz32+B3JkhxfBeWbegjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3209
X-OriginatorOrg: citrix.com

On Fri, Nov 20, 2020 at 09:54:42AM +0100, Jan Beulich wrote:
> On 20.11.2020 09:28, Roger Pau Monné wrote:
> > On Fri, Nov 20, 2020 at 09:09:51AM +0100, Jan Beulich wrote:
> >> On 19.11.2020 18:57, Manuel Bouyer wrote:
> >>> I added an ASSERT() after the printf to ket a stack trace, and got:
> >>> db{0}> call ioapic_dump_raw^M
> >>> Register dump of ioapic0^M
> >>> [  13.0193374] 00 08000000 00170011 08000000(XEN) vioapic.c:141:d0v0 apic_mem_readl:undefined ioregsel 3
> >>> (XEN) vioapic.c:512:vioapic_irq_positive_edge: vioapic_deliver 2
> >>> (XEN) Assertion '!print' failed at vioapic.c:512
> >>> (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:   C   ]----
> >>> (XEN) CPU:    0
> >>> (XEN) RIP:    e008:[<ffff82d0402c4164>] vioapic_irq_positive_edge+0x14e/0x150
> >>> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v0)
> >>> (XEN) rax: ffff82d0405c806c   rbx: ffff830836650580   rcx: 0000000000000000
> >>> (XEN) rdx: ffff8300688bffff   rsi: 000000000000000a   rdi: ffff82d0404b36b8
> >>> (XEN) rbp: ffff8300688bfde0   rsp: ffff8300688bfdc0   r8:  0000000000000004
> >>> (XEN) r9:  0000000000000032   r10: 0000000000000000   r11: 00000000fffffffd
> >>> (XEN) r12: ffff8308366dc000   r13: 0000000000000022   r14: ffff8308366dc31c
> >>> (XEN) r15: ffff8308366d1d80   cr0: 0000000080050033   cr4: 00000000003526e0
> >>> (XEN) cr3: 00000008366c9000   cr2: 0000000000000000
> >>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> >>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> >>> (XEN) Xen code around <ffff82d0402c4164> (vioapic_irq_positive_edge+0x14e/0x150):
> >>> (XEN)  3d 10 be 1d 00 00 74 c2 <0f> 0b 55 48 89 e5 41 57 41 56 41 55 41 54 53 48
> >>> (XEN) Xen stack trace from rsp=ffff8300688bfdc0:
> >>> (XEN)    0000000200000086 ffff8308366dc000 0000000000000022 0000000000000000
> >>> (XEN)    ffff8300688bfe08 ffff82d0402bcc33 ffff8308366dc000 0000000000000022
> >>> (XEN)    0000000000000001 ffff8300688bfe40 ffff82d0402bd18f ffff830835a7eb98
> >>> (XEN)    ffff8308366dc000 ffff830835a7eb40 ffff8300688bfe68 0100100100100100
> >>> (XEN)    ffff8300688bfea0 ffff82d04026f6e1 ffff830835a7eb30 ffff8308366dc0f4
> >>> (XEN)    ffff830835a7eb40 ffff8300688bfe68 ffff8300688bfe68 ffff82d0405cec80
> >>> (XEN)    ffffffffffffffff ffff82d0405cec80 0000000000000000 ffff82d0405d6c80
> >>> (XEN)    ffff8300688bfed8 ffff82d04022b6fa ffff83083663f000 ffff83083663f000
> >>> (XEN)    0000000000000000 0000000000000000 0000000a7c62165b ffff8300688bfee8
> >>> (XEN)    ffff82d04022b798 ffff8300688bfe08 ffff82d0402a4bcb 0000000000000000
> >>> (XEN)    0000000000000206 ffff8316da86e61c ffff8316da86e600 ffff938031fd47c0
> >>> (XEN)    0000000000000003 0000000000000400 ff889e8da08f928a 0000000000000000
> >>> (XEN)    0000000000000002 0000000000000100 000000000000b86e ffff93803237f010
> >>> (XEN)    0000000000000000 ffff8316da86e61c 0000beef0000beef ffffffff80555918
> >>> (XEN)    000000bf0000beef 0000000000000046 ffff938031fd4790 000000000000beef
> >>> (XEN)    000000000000beef 000000000000beef 000000000000beef 000000000000beef
> >>> (XEN)    0000e01000000000 ffff83083663f000 0000000000000000 00000000003526e0
> >>> (XEN)    0000000000000000 0000000000000000 0000060100000001 0000000000000000
> >>> (XEN) Xen call trace:
> >>> (XEN)    [<ffff82d0402c4164>] R vioapic_irq_positive_edge+0x14e/0x150
> >>> (XEN)    [<ffff82d0402bcc33>] F arch/x86/hvm/irq.c#assert_gsi+0x5e/0x7b
> >>> (XEN)    [<ffff82d0402bd18f>] F hvm_gsi_assert+0x62/0x77
> >>> (XEN)    [<ffff82d04026f6e1>] F drivers/passthrough/io.c#dpci_softirq+0x261/0x29e
> >>> (XEN)    [<ffff82d04022b6fa>] F common/softirq.c#__do_softirq+0x8a/0xbf
> >>> (XEN)    [<ffff82d04022b798>] F do_softirq+0x13/0x15
> >>> (XEN)    [<ffff82d0402a4bcb>] F vmx_asm_do_vmentry+0x2b/0x30
> >>> (XEN) 
> >>> (XEN) 
> >>> (XEN) ****************************************
> >>> (XEN) Panic on CPU 0:
> >>> (XEN) Assertion '!print' failed at vioapic.c:512
> >>> (XEN) ****************************************
> >>
> >> Right, this was the expected path after what you've sent prior to this.
> >> Which turned my attention back to the 'i' debug key output you had sent
> >> the other day. There we have
> >>
> >> (XEN)    IRQ:  34 vec:51 IO-APIC-level   status=010 aff:{0}/{0-7} in-flight=1 d0: 34(-MM)
> >>
> >> i.e. at that point we're waiting for Dom0 to signal it's done handling
> >> the IRQ. There is, however, a timer associated with this. Yet that's
> >> actually to prevent the system getting stuck, i.e. the "in-flight"
> >> state ought to clear 1ms later (when that timer expires), and hence
> >> ought to be pretty unlikely to catch when non-zero _and_ something's
> >> actually stuck.
> > 
> > I somehow assumed the interrupt was in-flight because the printing to
> > the Xen console caused one to be injected, and thus dom0 didn't had
> > time to Ack it yet.
> 
> By "injected" you mean from Xen into Dom0, or by the hardware for Xen
> to handle? (I ask because I think I saw you use the term also for the
> latter case, in some context.) If the former, then something would
> need to have caused Xen to inject it, while in the latter case there
> would need to have been a reason that it didn't get delivered earlier.

Sorry, wrote this in a hurry and didn't realize it could be
misleading. I meant injected from hardware to Xen, which would then
also be injected from Xen to dom0.

I would expect softirqs to be running normally (as you have already
asked and Manuel proved the watchdog is not triggering).

Roger.

