Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC3E1CDFC4
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 17:57:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYAnP-0001FC-DC; Mon, 11 May 2020 15:56:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AmMB=6Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jYAnO-0001F7-Bd
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 15:56:46 +0000
X-Inumbo-ID: 03095043-93a0-11ea-a226-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03095043-93a0-11ea-a226-12813bfff9fa;
 Mon, 11 May 2020 15:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589212604;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=87sgAQ15qhIOWSaRctS80Wh/3gY+1va5Yr3D2qTSETM=;
 b=TMXdhktIXL/ppSIE1ZG1DZv72rROw9OO+PL5+DksF3wQAg7b145YJXND
 2vjn1IxFLi8r4u+vh5r0PPVq+ABCiaHi2UfoNPcL1l/GrDdekkTUvIcyx
 XahtXjQALkL3nH7LotODktr+UgC9AkeGnp3yUezENVLNhHb3D+O7bNm+N w=;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: D6aacQA9vn7Kd3nNvVuNtLnB3B0aGXg1m438x8f99UzvkGWsHoO9Nj+mCA1tmpeOvF2GFGWzjb
 TXv8QqI8Qu5KlmAEtBTv+YqRzF2n2wehTO2p/Hj7PxHYSeShWVTdnoQgZ02ftno12b56gv4O+i
 Uoy+tV9rLxoe6Ub2VbwNyyRbCAdLecpR+pCdXgXckcx52gqKb2uQpRxxQAt2nDkLKJEiwZntf4
 m0k32Mu3Oo7KiKv62C2pGOJu/bxhHFjNDqcIcvVnivPj7PdDU9rvIShUzq6XGFcGjg7BMdeskU
 Xto=
X-SBRS: 2.7
X-MesageID: 17604081
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,380,1583211600"; d="scan'208";a="17604081"
Date: Mon, 11 May 2020 17:56:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/idle: prevent entering C6 with in service
 interrupts on Intel
Message-ID: <20200511155637.GD35422@Air-de-Roger>
References: <20200511101753.36610-1-roger.pau@citrix.com>
 <f3471cee-342e-c169-f3eb-34f559892336@citrix.com>
 <20200511110743.GB35422@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200511110743.GB35422@Air-de-Roger>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 11, 2020 at 01:07:43PM +0200, Roger Pau Monné wrote:
> On Mon, May 11, 2020 at 11:38:49AM +0100, Andrew Cooper wrote:
> > On 11/05/2020 11:17, Roger Pau Monne wrote:
> > > Apply a workaround for Intel errata CLX30: "A Pending Fixed Interrupt
> > > May Be Dispatched Before an Interrupt of The Same Priority Completes".
> > >
> > > It's not clear which models are affected, as the errata is listed in
> > > the "Second Generation Intel Xeon Scalable Processors" specification
> > > update, but the issue has been seen as far back as Nehalem processors.
> > 
> > Really?  I'm only aware of it being Haswell and later.

So I've found the following related erratas:

BDX99: E7-8800 v4, E7-4800 v4 (Broadwell)
CLX30: 2nd Gen Xeon Scalable (Cascade Lake)
SKX100: Xeon Scalable (Skylake)
CFW125: E-2100, E-2200 (Kaby Lake)
BDF104: E5-2600 v4 (Broadwell)
BDH85: i7 LGA2011 v3 socket (Broadwell)
BDM135: 5th Gen Intel Core, Core-M, Mobile Intel Pentium/Celeron (Broadwell)
KBW131: E3-1200 v6 (Kaby Lake)

So my plan would be to cover all chips from Broadwell to Cascade Lake,
this would be: Broadwell, Skylake, Kaby Lake, Coffee Lake,
{Cannon/Whiskey/Amber} Lake and Cascade Lake. I haven't found any
mention of the issue in the Haswell specification updates, and the one
for Xeon E7 v3 was last updated in April 2020.

I think the list of IDs to match against should be:

#define INTEL_FAM6_MODEL(m) { X86_VENDOR_INTEL, 6, m, X86_FEATURE_ALWAYS }
{
    /* Broadwell */
    INTEL_FAM6_MODEL(0x47),
    INTEL_FAM6_MODEL(0x3d),
    INTEL_FAM6_MODEL(0x4f),
    INTEL_FAM6_MODEL(0x56),
    /* Skylake (client) */
    INTEL_FAM6_MODEL(0x5e),
    INTEL_FAM6_MODEL(0x4e),
    /* {Sky/Cascade}lake (server) */
    INTEL_FAM6_MODEL(0x55),
    /* {Kaby/Coffee/Whiskey/Amber} Lake */
    INTEL_FAM6_MODEL(0x9e),
    INTEL_FAM6_MODEL(0x8e),
    /* Cannon Lake */
    INTEL_FAM6_MODEL(0x66),
    {}
}

Let me know if that sounds sensible.

Thanks, Roger.

