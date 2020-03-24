Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740A21913AD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 15:52:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGkrQ-0001g3-4m; Tue, 24 Mar 2020 14:48:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pAsU=5J=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jGkrP-0001fx-80
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 14:48:55 +0000
X-Inumbo-ID: 952a50da-6dde-11ea-bec1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 952a50da-6dde-11ea-bec1-bc764e2007e4;
 Tue, 24 Mar 2020 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585061335;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b35z3TfYS7E76kqrppSaPyd4zNbFlX6pMlhiAiecD+M=;
 b=RC+QtBLbTdJO3Y1rqjun4VFt8RyC3PQHRZzMnzdce3k2Qb25zRltmYuj
 QwMpCldx3YcbMh4weiVp4VCk70UR4Zjd3WdOMVR+/yciyeKkqfRXP18t2
 qP219fUnBl84gzowZ0QGWWmx9iAKgRU8KiDJPd0pe7lgrW/qtJuatT/YD M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HvfleVD8QU3684epASVDPTLQTBZcdt6sE3QegXOsVQ0lXP1TdQtvT6lsJoR25ZDuEWf8iQ3K/r
 fVQeqs9Vg+Eze+BfBPiWoVTB75xoRIWMpc7mlHPPvFKQgiys+advfXcpj0BFLlFGFhgeoEBSpw
 5sIqEnTxUalbLWRnsRD8TRmrrKrXUuIvnmfFQ2Hx+Mab1Ubs4aAQsaAFjb1ivH+adzSLNrifzA
 82564Oqbfp5hS7Adi1DkA6Po6neaR2BacxYLVNQZutgch2a/40cchnAXq5JT451lsqe4a4XV9O
 Hq4=
X-SBRS: 2.7
X-MesageID: 14546504
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,300,1580792400"; d="scan'208";a="14546504"
Date: Tue, 24 Mar 2020 14:48:47 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20200324144752.GN4088@perard.uk.xensource.com>
References: <20200309174505.594607-1-anthony.perard@citrix.com>
 <20200309174505.594607-3-anthony.perard@citrix.com>
 <alpine.DEB.2.21.2003131605490.1269@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2003131614160.1269@sstabellini-ThinkPad-T480s>
 <72604419-b3a1-3c14-c937-07d9ec7fd62b@xen.org>
 <alpine.DEB.2.21.2003171051280.1846@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2003171051280.1846@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [XEN PATCH v3 2/2] xen/arm: Configure early printk
 via Kconfig
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
Cc: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Mar 17, 2020 at 10:51:34AM -0700, Stefano Stabellini wrote:
> On Tue, 17 Mar 2020, Julien Grall wrote:
> > I noticed below you added "depends on ARM_64" on the Xilinx SoC. In 
> > general, platform specific options are tied to either arm32 or arm64, 
> > even if the UART "driver" is arch agnostic.
> > 
> > You could technically boot Xen on Arm 32-bit on Armv8 HW provided they 
> > support 32-bit at the hypervisor level, but we never supported this 
> > case. So I am wondering whether we should add depends on each 
> > earlyprintk. Stefano, any opinions?
> 
> Well spotted.
> 
> Xilinx doesn't support 32-bit Xen on their boards, "support" as in test,
> run or validate. So it would not be a problem from Xilinx point of view
> to add a "depends on ARM_64".
> 
> I take that you are suggesting adding "depends on ARM_64/32" under the
> legacy platform earlyprintk options, from EARLY_PRINTK_BRCM to
> EARLY_PRINTK_ZYNQMP right? If so, I am fine with it, and it seems like a
> good idea.

I don't have useful information on which Xen bitness each platform can
boot or support, so I can't really add those "depends on". But that
could be done in a follow-up.

> The other new generic earlyprintk options, the ones that only depend on
> the uart driver, from EARLY_UART_CHOICE_8250 to EARLY_UART_CHOICE_SCIF,
> it feels more natural to leave them without a specific arch dependency.

That would mean adding drivers for both arm32 and arm64. For example,
debug-cadence.inc is only available in arm64/. So if someone selects
arm32 and the cadence early uart driver, there's going to be a compile
error. That's the only reason on why I've added "depends on" on all
EARLY_UART_CHOICE_*.

Thanks,

-- 
Anthony PERARD

