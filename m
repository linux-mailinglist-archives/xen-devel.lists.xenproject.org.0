Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFC42007AE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 13:21:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmF5Q-0005SF-Di; Fri, 19 Jun 2020 11:21:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z6Go=AA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jmF5O-0005SA-H2
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 11:21:30 +0000
X-Inumbo-ID: 0507e2f8-b21f-11ea-bb68-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0507e2f8-b21f-11ea-bb68-12813bfff9fa;
 Fri, 19 Jun 2020 11:21:29 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0wOIVdkT3G2h9ju7T5EzUsx6SBGvXUlgnK5eFMP+qBhY5WNfDQ/REVj9kYLvuRG/sdPXzUx31n
 RbhZmvqLcCnMXoLAWB5ZuDPC9EdvrtZhoDu/GErkMf4tITCnpa2zC1oFEypJM9IgktVXdUk+aR
 5WfoKQuVIFIPvVFcE/pSRVA2HUO57TlDBrX0N7TQr1Wy9TAmSc+w5nlsbDr7QneoQXMjn4b1Ty
 Dm7au3d1WHSfCPmJpub+MIjbw7nU4cmg0+Xx/72eDnFH5YdFaWZMJyppxb0NuABRT1YY32uLZ1
 Re0=
X-SBRS: 2.7
X-MesageID: 20806862
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,255,1589256000"; d="scan'208";a="20806862"
Date: Fri, 19 Jun 2020 13:21:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Martin Lucina <martin@lucina.net>
Subject: Re: Event delivery and "domain blocking" on PVHv2
Message-ID: <20200619112119.GY735@Air-de-Roger>
References: <62479d08f7650c22678d7a86851eafc4@lucina.net>
 <5865159c-4190-e841-8020-7a4f3cf0fc24@citrix.com>
 <20200618101330.GB10330@nodbug.lucina.net>
 <20200618114617.GJ735@Air-de-Roger>
 <17deb17cec442f96cc7aba98ef4c047c@lucina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17deb17cec442f96cc7aba98ef4c047c@lucina.net>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 mirageos-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 19, 2020 at 12:28:50PM +0200, Martin Lucina wrote:
> On 2020-06-18 13:46, Roger Pau Monné wrote:
> > On Thu, Jun 18, 2020 at 12:13:30PM +0200, Martin Lucina wrote:
> > > At this point I don't really have a clear idea of how to progress,
> > > comparing my implementation side-by-side with the original PV
> > > Mini-OS-based
> > > implementation doesn't show up any differences I can see.
> > > 
> > > AFAICT the OCaml code I've also not changed in any material way, and
> > > that
> > > has been running in production on PV for years, so I'd be inclined
> > > to think
> > > the problem is in my reimplementation of the C parts, but where...?
> > 
> > A good start would be to print the ISR and IRR lapic registers when
> > blocked, to assert there are no pending vectors there.
> > 
> > Can you apply the following patch to your Xen, rebuild and check the
> > output of the 'l' debug key?
> > 
> > Also add the output of the 'v' key.
> 
> Had to fight the Xen Debian packages a bit as I wanted to patch the exact
> same Xen (there are some failures when building on a system that has Xen
> installed due to following symlinks when fixing shebangs).
> 
> Here you go, when stuck during netfront setup, after allocating its event
> channel, presumably waiting on Xenstore:
> 
> 'e':
> 
> (XEN) Event channel information for domain 3:
> (XEN) Polling vCPUs: {}
> (XEN)     port [p/m/s]
> (XEN)        1 [1/0/1]: s=3 n=0 x=0 d=0 p=33
> (XEN)        2 [1/1/1]: s=3 n=0 x=0 d=0 p=34
> (XEN)        3 [1/0/1]: s=5 n=0 x=0 v=0
> (XEN)        4 [0/1/1]: s=2 n=0 x=0 d=0
> 
> 'l':
> 
> (XEN) d3v0 IRR:
> ffff8301732dc200b
> (XEN) d3v0 ISR:
> ffff8301732dc100b

Which version of Xen is this? AFAICT it doesn't have the support to
print a bitmap.

Do you think you could also pick commit
8cd9500958d818e3deabdd0d4164ea6fe1623d7c [0] and rebuild? (and print
the info again).

Thanks, Roger.

[0] http://xenbits.xen.org/gitweb/?p=xen.git;a=patch;h=8cd9500958d818e3deabdd0d4164ea6fe1623d7c

