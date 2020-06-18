Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 455C91FF266
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 14:52:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlu1i-0000Xx-Sv; Thu, 18 Jun 2020 12:52:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlu1i-0000XS-0C
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 12:52:18 +0000
X-Inumbo-ID: 873353f6-b162-11ea-bca7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 873353f6-b162-11ea-bca7-bc764e2007e4;
 Thu, 18 Jun 2020 12:52:12 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xbVmioi1Tt9J3AkzMvzVBKmTKpkEywDal7J9qwTkyXXT60NNx8TipqJGeH4j5dTE8nCnDtZQhK
 mgAVrtOohRL8hTDdoPFL+byvouZDvFtfp854BgJnFlA70616KTdgMpnswlqetqXUeDXnMaInHg
 WoJGKSgRzUayba0o3UZr5pPauilBjpGMyu8lI8ImlAf975e6wW1Zt+k9MpdmYa8NOzA+Hq1V2T
 EJsI2b/AzIvHdwXzg7b3HVq8+nwpcthYf6mgt6FaR6Ey1CiD6W8VSP9b0RdIBK1lVBmUaTozqS
 VvY=
X-SBRS: 2.7
X-MesageID: 20592167
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,526,1583211600"; d="scan'208";a="20592167"
Date: Thu, 18 Jun 2020 14:52:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 for-4.14] x86/vmx: use P2M_ALLOC in vmx_load_pdptrs
 instead of P2M_UNSHARE
Message-ID: <20200618125205.GO735@Air-de-Roger>
References: <3555e16baa9e1909dbefaaab04330694135c9021.1592410065.git.tamas.lengyel@intel.com>
 <d63e00e0-0097-c37e-ba9d-ac9340192dfb@suse.com>
 <CABfawhngJT0cFJfNxoa9H6qvPEF1nNO9m9PrrbRgQsA5Z0Jc6g@mail.gmail.com>
 <c9288d56-297d-dc1f-0e99-6537d82b393c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <c9288d56-297d-dc1f-0e99-6537d82b393c@suse.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 02:46:24PM +0200, Jan Beulich wrote:
> On 18.06.2020 14:39, Tamas K Lengyel wrote:
> > On Thu, Jun 18, 2020 at 12:31 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 17.06.2020 18:19, Tamas K Lengyel wrote:
> >>> While forking VMs running a small RTOS system (Zephyr) a Xen crash has been
> >>> observed due to a mm-lock order violation while copying the HVM CPU context
> >>> from the parent. This issue has been identified to be due to
> >>> hap_update_paging_modes first getting a lock on the gfn using get_gfn. This
> >>> call also creates a shared entry in the fork's memory map for the cr3 gfn. The
> >>> function later calls hap_update_cr3 while holding the paging_lock, which
> >>> results in the lock-order violation in vmx_load_pdptrs when it tries to unshare
> >>> the above entry when it grabs the page with the P2M_UNSHARE flag set.
> >>>
> >>> Since vmx_load_pdptrs only reads from the page its usage of P2M_UNSHARE was
> >>> unnecessary to start with. Using P2M_ALLOC is the appropriate flag to ensure
> >>> the p2m is properly populated and to avoid the lock-order violation we
> >>> observed.
> >>
> >> Using P2M_ALLOC is not going to address the original problem though
> >> afaict: You may hit the mem_sharing_fork_page() path that way, and
> >> via nominate_page() => __grab_shared_page() => mem_sharing_page_lock()
> >> you'd run into a lock order violation again.
> > 
> > Note that the nominate_page you see in that path is for the parent VM.
> > The paging lock is not taken for the parent VM thus nominate_page
> > succeeds without any issues any time fork_page is called. There is no
> > nominate_page called for the client domain as there is nothing to
> > nominate when plugging a hole.
> 
> But that's still a lock order issue then, isn't it? Just one that
> the machinery can't detect / assert upon.

Yes, mm lock ordering doesn't differentiate between domains, and the
current lock order on the pCPU is based on the last lock taken
(regardless of the domain it belongs to).

Roger.

