Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF561FF248
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 14:50:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jltzb-0000MV-8T; Thu, 18 Jun 2020 12:50:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jltzZ-0000G5-AU
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 12:50:05 +0000
X-Inumbo-ID: 3a3f3255-b162-11ea-ba90-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a3f3255-b162-11ea-ba90-12813bfff9fa;
 Thu, 18 Jun 2020 12:50:03 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: lDJZg6VShbzXaw02eUhPtEgdJTN60PhsvsMwWw/DICKGK20hV7uWOZk7JGzQxW7n4dR+ANidpq
 UcF31dIASKj6c17itJeeREyA0gN7E3qxR4cw8mtbeOhS8CMoaNfNdWO+BsIAoVz4ZaUIbIHDIH
 UKKEc/NerjpaKrqGIi/WrKXEFMQaImtXQW3qlCxGbqgq792TMm6tOJUiiffURraV1C0TRAdXiI
 QIuLAc0xdtPfq1YTeamtaZEDxvEPgBHojD3LG0Ia0HBw3GKQ0yS1wRnYmxMWlvfj6QnSY8/2OC
 mj4=
X-SBRS: 2.7
X-MesageID: 21149400
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,526,1583211600"; d="scan'208";a="21149400"
Date: Thu, 18 Jun 2020 14:49:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH v2 for-4.14] x86/vmx: use P2M_ALLOC in vmx_load_pdptrs
 instead of P2M_UNSHARE
Message-ID: <20200618124956.GN735@Air-de-Roger>
References: <3555e16baa9e1909dbefaaab04330694135c9021.1592410065.git.tamas.lengyel@intel.com>
 <d63e00e0-0097-c37e-ba9d-ac9340192dfb@suse.com>
 <20200618094014.GH735@Air-de-Roger>
 <CABfawhmsBijg=EA2=J3DOTZHByrcOYk5NOQGUrwv24o8nEptTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhmsBijg=EA2=J3DOTZHByrcOYk5NOQGUrwv24o8nEptTw@mail.gmail.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas
 K Lengyel <tamas.lengyel@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 06:21:42AM -0600, Tamas K Lengyel wrote:
> On Thu, Jun 18, 2020 at 3:42 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Thu, Jun 18, 2020 at 08:30:08AM +0200, Jan Beulich wrote:
> > > On 17.06.2020 18:19, Tamas K Lengyel wrote:
> > > > While forking VMs running a small RTOS system (Zephyr) a Xen crash has been
> > > > observed due to a mm-lock order violation while copying the HVM CPU context
> > > > from the parent. This issue has been identified to be due to
> > > > hap_update_paging_modes first getting a lock on the gfn using get_gfn. This
> > > > call also creates a shared entry in the fork's memory map for the cr3 gfn. The
> > > > function later calls hap_update_cr3 while holding the paging_lock, which
> > > > results in the lock-order violation in vmx_load_pdptrs when it tries to unshare
> > > > the above entry when it grabs the page with the P2M_UNSHARE flag set.
> > > >
> > > > Since vmx_load_pdptrs only reads from the page its usage of P2M_UNSHARE was
> > > > unnecessary to start with. Using P2M_ALLOC is the appropriate flag to ensure
> > > > the p2m is properly populated and to avoid the lock-order violation we
> > > > observed.
> > >
> > > Using P2M_ALLOC is not going to address the original problem though
> > > afaict: You may hit the mem_sharing_fork_page() path that way, and
> > > via nominate_page() => __grab_shared_page() => mem_sharing_page_lock()
> > > you'd run into a lock order violation again.
> >
> > Well, I guess Tamas avoids this because of the get_gfn call in
> > hap_update_paging_modes will have already populated the entry, so it's
> > never going to hit the p2m_is_hole check in __get_gfn_type_access.
> >
> > > The change is an improvement, so I'd be fine with it going in this
> > > way, but only as long as the description mentions that there's still
> > > an open issue here (which may be non-trivial to address). Or perhaps
> > > combining with your v1 change is the way to go (for now or even
> > > permanently)?
> >
> > If vmx_load_pdptrs only requires P2M_ALLOC then this is already
> > covered by the call to get_gfn performed in hap_update_paging_modes,
> > so I don't think there's much point in merging with v1, as forcing
> > hap_update_paging_modes to unshare the entry won't affect
> > vmx_load_pdptrs anymore.
> >
> > I'm however worried about other code paths that can call into
> > vmx_load_pdptrs with mm locks taken, and I agree it would be safer to
> > assert that all the higher layers make sure the cr3 loaded is
> > correctly populated for a query without P2M_ALLOC to succeed.
> 
> Using P2M_ALLOC is always safe if 1) the entry is already populated
> like in this case but also in 2) in case the gfn is a hole and gets
> forked. In mem_sharing the paging lock order is only applicable when
> an already present entry is getting converted to a shared type or a
> shared typed is getting unshared. It does not apply when a hole is
> being plugged.

But a hole being plugged can also imply that a page is being set
shareable by nominate_page, which will take the mem sharing page lock?

That would be the path: get_gfn_type_access -> __get_gfn_type_access
-> (hole found in p2m) -> mem_sharing_fork_page -> nominate_page (with
page not being shareable already).

It's likely I'm missing some bits, this is all quite complex.

Thanks, Roger.

