Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 956511B9A2D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 10:28:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSz7C-00070f-Lb; Mon, 27 Apr 2020 08:27:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jrem=6L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jSz7B-00070a-QN
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 08:27:45 +0000
X-Inumbo-ID: f7a6e2c2-8860-11ea-b07b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7a6e2c2-8860-11ea-b07b-bc764e2007e4;
 Mon, 27 Apr 2020 08:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587976065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VamndsIc6D4njTKjruX3ezIU6Oaxfq7corgjz5d5xS4=;
 b=iXesne0S654rhx3qKkZ80tTlALciI5+qfTgHWbvDXF8Bdv/VsmCSp/0F
 Qz3/ASF8wfSEVSr3jXf2K0jSHCURQfLRLm+ye4hjzZdGDX/X+OIHa8ySu
 s3ZhU/G+ZECimOwRkDxfCb9i9B7NhC+KJx7pG6Fwg4MXyPl5OkgYTFn02 o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HbSE5VdzEWDEh3BCDRYkZrCPom25cCnaUppFJG9/MwFoaO2ULKeO79inTeJy4TGsyvUxIe8QN4
 gBQ3LyiIaoY6y40M6HFOAUaS5KroPzHdwDED7itd6Fr442BvY5gmmNiX1kHJ4RmbVAWvLPul5g
 bMApA6y2Me3Cyma+Tod/qu/Pttt9FsApANXnu0RVi45vWtNxhg5Ye6I3k6OvDsO+ZIZIz0AITa
 rSXfOTxeP8lm8dI2VzuagUifCt9QFvxVl/SK3jXmJ2tcie3aBSqumJyk+H2EVYCsFQ6VfGcXtF
 Qwk=
X-SBRS: 2.7
X-MesageID: 16268685
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,323,1583211600"; d="scan'208";a="16268685"
Date: Mon, 27 Apr 2020 10:27:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v17 1/2] mem_sharing: fix sharability check during fork
 reset
Message-ID: <20200427082734.GM28601@Air-de-Roger>
References: <70ea4889e30ed35760329331ddfeb279fcd80786.1587655725.git.tamas.lengyel@intel.com>
 <20200424094343.GH28601@Air-de-Roger>
 <CABfawhnRhLJ0AKjTKBx7snEOHBX5oJ2KrwbscQk=e7qXHFD3mA@mail.gmail.com>
 <20200425090107.GK28601@Air-de-Roger>
 <CABfawh=e-DjK2ONDV5DagMncLEvP-xA--+YsMOMuUWdM1hx0ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawh=e-DjK2ONDV5DagMncLEvP-xA--+YsMOMuUWdM1hx0ug@mail.gmail.com>
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

On Sat, Apr 25, 2020 at 06:31:46AM -0600, Tamas K Lengyel wrote:
> On Sat, Apr 25, 2020 at 3:01 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Fri, Apr 24, 2020 at 06:18:24AM -0600, Tamas K Lengyel wrote:
> > > On Fri, Apr 24, 2020 at 3:44 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > >
> > > > On Thu, Apr 23, 2020 at 08:30:06AM -0700, Tamas K Lengyel wrote:
> > > > > When resetting a VM fork we ought to only remove pages that were allocated for
> > > > > the fork during it's execution and the contents copied over from the parent.
> > > > > This can be determined if the page is sharable as special pages used by the
> > > > > fork for other purposes will not pass this test. Unfortunately during the fork
> > > > > reset loop we only partially check whether that's the case. A page's type may
> > > > > indicate it is sharable (pass p2m_is_sharable) but that's not a sufficient
> > > > > check by itself. All checks that are normally performed before a page is
> > > > > converted to the sharable type need to be performed to avoid removing pages
> > > > > from the p2m that may be used for other purposes. For example, currently the
> > > > > reset loop also removes the vcpu info pages from the p2m, potentially putting
> > > > > the guest into infinite page-fault loops.
> > > > >
> > > > > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > > >
> > > > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > >
> > > Thanks!
> > >
> > > >
> > > > I've been looking however and I'm not able to spot where you copy the
> > > > shared_info data, which I think it's also quite critical for the
> > > > domain, as it contains the info about event channels (when using L2).
> > > > Also for HVM forks the shared info should be mapped at the same gfn as
> > > > the parent, or else the child trying to access it will trigger an EPT
> > > > fault that won't be able to populate such gfn, because the shared_info
> > > > on the parent is already shared between Xen and the parent.
> > >
> > > Pages that cause an EPT fault but can't be made shared get a new page
> > > allocated for them and copied in mem_sharing_fork_page. There are many
> > > pages like that, mostly due to QEMU mapping them and thus holding an
> > > extra reference. That said, shared_info is manually copied during
> > > forking in copy_special_pages, at the end of the function you will
> > > find:
> > >
> > > old_mfn = _mfn(virt_to_mfn(d->shared_info));
> > > new_mfn = _mfn(virt_to_mfn(cd->shared_info));
> > >
> > > copy_domain_page(new_mfn, old_mfn);
> >
> > Yes, that's indeed fine, you need to copy the contents of the shared
> > info page, but for HVM you also need to make sure the shared info page
> > is mapped at the same gfn as the parent. HVM guest issue a hypercall
> > to request the mapping of the shared info page to a specific gfn,
> > since it's not added to the guest physmap by default.
> > XENMAPSPACE_shared_info is used in order to request the shared info
> > page to be mapped at a specific gfn.
> >
> > AFAICT during fork such shared info mapping is not replicated to the
> > child, and hence the child trying to access the gfn of the shared info
> > page would just result in EPT faults that won't be fixed (because the
> > parent shared info page cannot be shared with the child)?
> >
> > You should be able to use get_gpfn_from_mfn in order to get the parent
> > gfn where the shared info mfn is mapped (if any), and then replicate
> > this in the child using it's own shared info.
> >
> > On fork reset you should check if the child shared info gfn != parent
> > shared info gfn and reinstate the parent state if different from the
> > child.
> 
> OK, I see what you mean. In the way things set up currently the EPT
> fault-loop problem doesn't happen since the page does get copied, it
> just gets copied to a new mfn not the one d->shared_info points to. So
> whatever issue that may bring it must be subtle because we haven't
> noticed any instability.

In any case I think it would be good if you could add such mapping on
domain fork and reset, as you already partially handle the shared info
page by copying the data from the parent into the child. Or at least
add a FIXME comment to note the fact that a child trying to access the
shared info page won't work.

> Also, looking at the save/restore code in libxc it seems to me that
> shared_info is actually a PV specific page and it doesn't get
> saved/restored with an HVM domain. The hvm code paths don't process
> REC_TYPE_SHARED_INFO at all. So since forks are exclusively for HVM
> domains, do we really need it and if so, why doesn't HVM save/restore
> need it?

HVM domains on suspend/resume are aware of the need to re-instate the
shared info mapping, as it's part of the protocol and the guest is
actively cooperating on such actions. The same happens with the vcpu
info pages or the PV timers for example: they are not saved during a
suspend/resume and the guest needs to setup them again on restore.

Fork however is completely transparent from a guest PoV, and hence
there's no way to signal the child it needs to setup the shared info
mapping (or any other mapping or interface FWIW).

Roger.

