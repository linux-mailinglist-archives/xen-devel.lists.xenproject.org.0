Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD85E1B3982
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 09:58:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRAFA-0007VO-O4; Wed, 22 Apr 2020 07:56:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1SgQ=6G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jRAF8-0007VI-AS
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 07:56:26 +0000
X-Inumbo-ID: c329b5f6-846e-11ea-9e09-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c329b5f6-846e-11ea-9e09-bc764e2007e4;
 Wed, 22 Apr 2020 07:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587542186;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DfDeNp+iCCsiAIDZvvALimFgTCBS7+oN9x/w2MadkKk=;
 b=fSOuLHr6khbgCEWHtDoS1S/d2mHj5SPZl41ri91nL2oaloPlGQuGyCpK
 zhSzYhGjRGKRTZTx4nieW5tnDrNHRwgFGjlKcK491Tpcj5x/U4+1StQWU
 bTXuMp3Zg1pDanN4+FTzyUz02BzjFcWQhmD2DI4WRr7EydgCA99KX3QjC g=;
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
IronPort-SDR: SkDqbVlerrzvnEVk/b/6m3nBvc6sIAQPzp0mEnGKPtFZvl3Jsi3UAG7F+i2osJTpEMfFfz5b1M
 WLye/oICbSrDcI3lomoUJUc9FUlgYg/4zRJJisgos7G/geNTUJdewsPp6T1idubM7ecjSWfBPn
 QuYqTmo1Nu7YzyBWfQBaCi+0f67Noga03kOSnp67b3CwjjcdaPzmIy2cESwOyPk0j+d43Qfh1Q
 iNQMQ1cckJTNlOb94pOHggkPO1XatvCfCDJLSM9WIwuton1gt07n3IX1SN6eHWIfFnfWF+wYKf
 PFY=
X-SBRS: 2.7
X-MesageID: 16065250
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,412,1580792400"; d="scan'208";a="16065250"
Date: Wed, 22 Apr 2020 09:56:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 4/4] x86: adjustments to guest handle treatment
Message-ID: <20200422075614.GZ28601@Air-de-Roger>
References: <9d4b738a-4487-6bfc-3076-597d074c7b47@suse.com>
 <e820e1b9-7a7e-21f3-1ea0-d939de1905dd@suse.com>
 <20200421173010.GY28601@Air-de-Roger>
 <524885c7-5189-7215-41e6-1652a8bd08a2@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <524885c7-5189-7215-41e6-1652a8bd08a2@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 21, 2020 at 07:44:55PM +0100, Julien Grall wrote:
> Hi,
> 
> On 21/04/2020 18:30, Roger Pau Monné wrote:
> > On Tue, Apr 21, 2020 at 11:13:23AM +0200, Jan Beulich wrote:
> > > First of all avoid excessive conversions. copy_{from,to}_guest(), for
> > > example, work fine with all of XEN_GUEST_HANDLE{,_64,_PARAM}().
> > 
> > I'm not sure I understand the difference between those two, as they
> > are both placeholders for linear guest addresses?
> > 
> > AFAICT XEN_GUEST_HANDLE should be used for guest pointers inside of an
> > hypercall struct, while XEN_GUEST_HANDLE_PARAM is for guest pointers
> > as hypercall arguments. But those are both just guest pointers,
> > whether they are a parameter to the hypercall or a field in a
> > struct, and hence could use the same type?
> > 
> > I assume there's some reason for not doing so, and I see the comment
> > about other arches, but again a linear guest address is just that in
> > all arches, regardless of it's placement.
> 
> On Arm:
>  * XEN_GUEST_HANDLE() will always be 64-bit on both 32-bit and 64-bit
> hypervisor.
>  * XEN_GUEST_HANDLE_PARAM() will be 32-bit for 32-bit hypervisor. For 64-bit
> hypervisor, it will be 64-bit.
> 
> Per the ABI, each argument only fit a register. So you could not use
> XEN_GUEST_HANDLE() as now an argument will be held in 2 registers on 32-bit.
> 
> We also want the structure layout to be the same for 32-bit and 64-bit. So
> using XEN_GUEST_HANDLE_PARAM() everywhere is not the solution as the virtual
> address is not the same.

Right, you hide the 'padding' inside XEN_GUEST_HANDLE by making it
have a fixed size on all bitnesses, I can see how that's not
desirable for hypercall params though.

Iff we ever switch to an ABI that uses physical addresses instead of
linear ones we would have to switch everything to be a 64bit integer,
or else 32bit PAE won't work correctly. Or come up with a completely
different ABI (ie: use a pre-allocated set of buffer pages, IIRC as
suggested by Juergen).

> 
> We could possibly convert internally XEN_GUEST_HANDLE_PARAM() to
> XEN_GUEST_HANDLE(), but I am not sure how this would be beneficial. We would
> have to use 2 registers for arm 32-bit everytime.

Hm, we could maybe expand hypercall parameters to 64bit using some
kind of translation layer between the entry point and the actual
handler, but anyway, I get now there's a need to keep this difference.

Thanks, Roger.

