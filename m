Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F661E1EAD
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 11:35:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdVz6-0004a3-3y; Tue, 26 May 2020 09:34:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vX9/=7I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jdVz5-0004Zy-4V
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 09:34:55 +0000
X-Inumbo-ID: 24249198-9f34-11ea-9947-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24249198-9f34-11ea-9947-bc764e2007e4;
 Tue, 26 May 2020 09:34:48 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: WuLYWAQddVlidClve6sgpt1aMbR1w/JuXyEnOdxAtjCsL/iK1mzpoExUyUmnlpcZK8yY+xdhcr
 Fx2u0I2BEK/kPiAGjG/7RNvJUyMor2aGJQHKwGRK1kluQi5ZoengjiHaO+vniDa4m3buLacnvC
 uaUIVwO5Q+eN7m8KORkzoyr4DvieRelbBHDriH5preC+GwmWMPDMXvJgEq9ZbB3eb9yat4YbYw
 EysZQmH7b1ZplhSs7BuELbE/SwuPQLl0QgueZPeTqxpHKdYjFtc9D3D/KdedZSZo0MMFIuLa2t
 l44=
X-SBRS: None
X-MesageID: 18390190
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-URL-LookUp-ScanningError: 1
Date: Tue, 26 May 2020 11:34:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Martin Lucina <martin@lucina.net>
Subject: Re: Xen PVH domU start-of-day VCPU state
Message-ID: <20200526093421.GA38408@Air-de-Roger>
References: <20200525160401.GA3091@nodbug.lucina.net>
 <a17fef73-382c-50b3-1e6b-5904fc3bf60f@suse.com>
 <6a22e477-c9e7-f0d7-6cb1-615137a778be@citrix.com>
 <20200526085221.GB5942@nodbug.lucina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200526085221.GB5942@nodbug.lucina.net>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, anil@recoil.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, mirageos-devel@lists.xenproject.org,
 dave@recoil.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 26, 2020 at 10:52:21AM +0200, Martin Lucina wrote:
> On Monday, 25.05.2020 at 17:59, Andrew Cooper wrote:
> > On 25/05/2020 17:42, Jürgen Groß wrote:
> > > You need to setup virtual addressing and enable 64 bit mode before using
> > > 64-bit GDT.
> > >
> > > See Mini-OS source arch/x86/x86_hvm.S
> > 
> > Or
> > https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen-test-framework.git;a=blob;f=arch/x86/hvm/head.S;h=f7dc72b58ab9ec68538f0087969ab6f72d181d80;hb=HEAD
> > 
> > But yes - Juergen is correct.  Until you have enabled long mode, lgdt
> > will only load the bottom 32 bits of GDTR.base.
> 
> Ah, I missed Jurgen's and your reply here.
> 
> LGDT loading only the bottom 32 bits of GDTR.base shouldn't matter.
> Examining gdt_ptr some more:
> 
>     (gdb) set architecture i386
>     The target architecture is assumed to be i386
>     (gdb) x /xh 0x108040
>     0x108040:	0x002f
>     (gdb) x /xw 0x108042
>     0x108042:	0x00108000
>     (gdb) x /6xb 0x108040
>     0x108040:	0x2f	0x00	0x00	0x80	0x10	0x00
>     (gdb) x /8xb 0x108040
>     0x108040:	0x2f	0x00	0x00	0x80	0x10	0x00	0x00	0x00

Could you also print the GDT entry at 0x10 (ie: 0x108000 + 0x10), just
to make sure it contains the right descriptor?

Roger.

