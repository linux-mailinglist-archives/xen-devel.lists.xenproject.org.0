Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0E51B8501
	for <lists+xen-devel@lfdr.de>; Sat, 25 Apr 2020 11:01:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSGgY-0006OS-Pk; Sat, 25 Apr 2020 09:01:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RPhZ=6J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jSGgX-0006ON-Bx
 for xen-devel@lists.xenproject.org; Sat, 25 Apr 2020 09:01:17 +0000
X-Inumbo-ID: 513f970a-86d3-11ea-9599-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 513f970a-86d3-11ea-9599-12813bfff9fa;
 Sat, 25 Apr 2020 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587805275;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=O3sa6ilycJjGZncHn47Gzj2fxIElXn+IwOpcCrdTk2M=;
 b=P4JON1UE3mhfG5rVDOqJSMJSu2S9M6C8bd70a1t0BNNEQnuxV4Bf5UQQ
 yvsR3U9a0FcalTKbuPg+Hop7aN/BKSqg3CDWqvNWEeDuOMJzu6Inydi23
 CMnAFozo5QvYbQj2uwUEgpn1ubexx2S5z8FpO7tsTth5NYnXn/7uQIjVZ 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ahsmVPWdzXumDMeF3ETP5iLVDh/vc9SLSF3WjRrQpiDWALpdJ+skEr9gy/67JzmJiPZlHoZdxh
 ILT3qNEwwDPqn1k7RCMOFUfFbuN+k/kHtpgUQg97exQ1EIbjevLtzI9kNcyUOFJck3bWHGjvke
 QAngl2HRsNWnCMaCRoZ0pLs/vbHCRjNvsJixyQztmJmpmnRKHaNgnySmVAFRhA0YEwf9b2g4SG
 lN8yr74PRFRX6fkHTM1UpEwYOTW7aViYEc9DSB0oc9A3Ymn5ngHXFBvuqfWWtF5hxakRnYoSCo
 Qwo=
X-SBRS: 2.7
X-MesageID: 16494186
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,315,1583211600"; d="scan'208";a="16494186"
Date: Sat, 25 Apr 2020 11:01:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v17 1/2] mem_sharing: fix sharability check during fork
 reset
Message-ID: <20200425090107.GK28601@Air-de-Roger>
References: <70ea4889e30ed35760329331ddfeb279fcd80786.1587655725.git.tamas.lengyel@intel.com>
 <20200424094343.GH28601@Air-de-Roger>
 <CABfawhnRhLJ0AKjTKBx7snEOHBX5oJ2KrwbscQk=e7qXHFD3mA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhnRhLJ0AKjTKBx7snEOHBX5oJ2KrwbscQk=e7qXHFD3mA@mail.gmail.com>
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 24, 2020 at 06:18:24AM -0600, Tamas K Lengyel wrote:
> On Fri, Apr 24, 2020 at 3:44 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Thu, Apr 23, 2020 at 08:30:06AM -0700, Tamas K Lengyel wrote:
> > > When resetting a VM fork we ought to only remove pages that were allocated for
> > > the fork during it's execution and the contents copied over from the parent.
> > > This can be determined if the page is sharable as special pages used by the
> > > fork for other purposes will not pass this test. Unfortunately during the fork
> > > reset loop we only partially check whether that's the case. A page's type may
> > > indicate it is sharable (pass p2m_is_sharable) but that's not a sufficient
> > > check by itself. All checks that are normally performed before a page is
> > > converted to the sharable type need to be performed to avoid removing pages
> > > from the p2m that may be used for other purposes. For example, currently the
> > > reset loop also removes the vcpu info pages from the p2m, potentially putting
> > > the guest into infinite page-fault loops.
> > >
> > > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> >
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks!
> 
> >
> > I've been looking however and I'm not able to spot where you copy the
> > shared_info data, which I think it's also quite critical for the
> > domain, as it contains the info about event channels (when using L2).
> > Also for HVM forks the shared info should be mapped at the same gfn as
> > the parent, or else the child trying to access it will trigger an EPT
> > fault that won't be able to populate such gfn, because the shared_info
> > on the parent is already shared between Xen and the parent.
> 
> Pages that cause an EPT fault but can't be made shared get a new page
> allocated for them and copied in mem_sharing_fork_page. There are many
> pages like that, mostly due to QEMU mapping them and thus holding an
> extra reference. That said, shared_info is manually copied during
> forking in copy_special_pages, at the end of the function you will
> find:
> 
> old_mfn = _mfn(virt_to_mfn(d->shared_info));
> new_mfn = _mfn(virt_to_mfn(cd->shared_info));
> 
> copy_domain_page(new_mfn, old_mfn);

Yes, that's indeed fine, you need to copy the contents of the shared
info page, but for HVM you also need to make sure the shared info page
is mapped at the same gfn as the parent. HVM guest issue a hypercall
to request the mapping of the shared info page to a specific gfn,
since it's not added to the guest physmap by default.
XENMAPSPACE_shared_info is used in order to request the shared info
page to be mapped at a specific gfn.

AFAICT during fork such shared info mapping is not replicated to the
child, and hence the child trying to access the gfn of the shared info
page would just result in EPT faults that won't be fixed (because the
parent shared info page cannot be shared with the child)?

You should be able to use get_gpfn_from_mfn in order to get the parent
gfn where the shared info mfn is mapped (if any), and then replicate
this in the child using it's own shared info.

On fork reset you should check if the child shared info gfn != parent
shared info gfn and reinstate the parent state if different from the
child.

Roger.

