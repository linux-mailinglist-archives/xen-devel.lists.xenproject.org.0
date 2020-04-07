Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E07431A0945
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 10:25:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLjXm-0003Kj-He; Tue, 07 Apr 2020 08:25:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EZeS=5X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jLjXl-0003Ke-2u
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 08:25:13 +0000
X-Inumbo-ID: 4c687357-78a9-11ea-8084-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c687357-78a9-11ea-8084-12813bfff9fa;
 Tue, 07 Apr 2020 08:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586247913;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vU0xvymaevMHBY0bhB4R2dWfQ1hXtORbHvMpPmJVCBQ=;
 b=LyiNXG3yxThIjDd/WEvD/WGIKEj4CkbGoIMcRzVuzUfnyqEyX8QPKBYc
 MmTtRVY4+ZQVALdonO7ufSAtP4cxYToOxn31+iK7OwfQE4N+SNnlsSKRv
 bezJGMwaAIonqx4A5uB9w193nr1nWDWuRwxZeLRVJx5BEGkn143Npa3gu w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: q+PgQ9jKtZ7EG/4aQi+1ENb+7Ml/t9mI8MufE0k4+FyeEc/7WjDU01LqyI3rjktkNioiRHuucB
 V6GPCK4Mpc2pENpud5NcWMfXALuRoiEs2DqfhWulf/pzo7zC7nWweXq1LX+fwOdB2htRbREYdl
 p5g2ljKdFpUBOa8RWqW8nwkRgdh+tw3xzAb314mtGYlWlJyr25dZm+p6QYMnYmy40sc0YfgSYO
 EBrXhbWn65brZ2r2rbhMX62yXelkQyn7fcL8V0j/CfTyKbl61KwD9UL181ACgD/DPLZaz2y0nl
 VL8=
X-SBRS: 2.7
X-MesageID: 15296331
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,353,1580792400"; d="scan'208";a="15296331"
Date: Tue, 7 Apr 2020 10:25:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
Subject: Re: [XEN PATCH] hvmloader: Enable MMIO and I/O decode, after all
 resource allocation
Message-ID: <20200407082501.GA28601@Air-de-Roger>
References: <f7b9e16e394e7e94700ed690f0c9fbd7ce7b5c74.1586195196.git.havanur@amazon.com>
 <001501d60cb0$f60e0660$e22a1320$@xen.org>
 <20200407080651.GZ28601@Air-de-Roger>
 <001801d60cb4$9ed4c880$dc7e5980$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001801d60cb4$9ed4c880$dc7e5980$@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Jan
 Beulich' <jbeulich@suse.com>, 'Harsha Shamsundara Havanur' <havanur@amazon.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 07, 2020 at 09:14:53AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Roger Pau Monné <roger.pau@citrix.com>
> > Sent: 07 April 2020 09:07
> > To: paul@xen.org
> > Cc: 'Harsha Shamsundara Havanur' <havanur@amazon.com>; xen-devel@lists.xenproject.org; 'Wei Liu'
> > <wl@xen.org>; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'Ian Jackson' <ian.jackson@eu.citrix.com>;
> > 'Jan Beulich' <jbeulich@suse.com>
> > Subject: Re: [XEN PATCH] hvmloader: Enable MMIO and I/O decode, after all resource allocation
> > 
> > On Tue, Apr 07, 2020 at 08:48:42AM +0100, Paul Durrant wrote:
> > > > -----Original Message-----
> > > > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Harsha Shamsundara Havanur
> > > > Sent: 06 April 2020 18:47
> > > > To: xen-devel@lists.xenproject.org
> > > > Cc: Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson
> > > > <ian.jackson@eu.citrix.com>; Jan Beulich <jbeulich@suse.com>; Harsha Shamsundara Havanur
> > > > <havanur@amazon.com>; Roger Pau Monné <roger.pau@citrix.com>
> > > > Subject: [XEN PATCH] hvmloader: Enable MMIO and I/O decode, after all resource allocation
> > > >
> > > > It was observed that PCI MMIO and/or IO BARs were programmed with
> > > > BUS master, memory and I/O decodes (bits 0,1 and 2 of PCI COMMAND
> > > > register) enabled, during PCI setup phase. This resulted in
> > > > spurious and premature bus transactions as soon as the lower bar of
> > > > the 64 bit bar is programmed. It is highly recommended that BARs be
> > > > programmed whilst decode bits are cleared to avoid spurious bus
> > > > transactions.
> > > >
> > >
> > > It's not so much spurious transactions that are the issue. I think "spurious and premature bus
> > transactions" should be replaced with "incorrect mappings being created".
> > >
> > > I believe the PCI spec says all three bits should be clear after reset anyway, and BAR programming
> > whilst decodes are enabled causes problems for emulators such as QEMU which need to create and destroy
> > mappings between the gaddr being programming into the virtual BAR and the maddr programmed into the
> > physical BAR.
> > > Specifically the case we see is that a 64-bit memory BAR is programmed by writing the lower half and
> > then the upper half. After the first write the BAR is mapped to an address under 4G that happens to
> > contain RAM, which is displaced by the mapping. After the second write the BAR is re-mapped to the
> > intended location but the RAM displaced by the other mapping is not restored. The OS then continues to
> > boot and function until at some point it happens to try to use that RAM at which point it suffers a
> > page fault and crashes. It was only by noticing that the faulting address lay within the transient BAR
> > mapping that we figured out what was happening.
> > 
> > In order to fix this isn't it enough to just disable memory and IO
> > decodes, leaving bus mastering as it is?
> > 
> > I assume there is (or was) some reason why bus master is enabled by
> > hvmloader in the first place?
> > 
> 
> I admit it is a while since I went mining for the reason BME was being set but IIRC the commit that added the original code did not state why it was done.
> 
> In the past I have run with local hacks disabling it whilst playing with GPU pass-through and not noticed it causing any problems. There is an argument to say that hvmloader should perhaps leave it alone but there is no good reason I can think of why it ought to be enabling it.

IMO forcefully disabling decodings (and enabling them afterwards if
already enabled) and leaving bus mastering as-is would be better.

Thanks, Roger.

