Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA6C26DE3F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 16:30:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIuuD-0004HR-Kl; Thu, 17 Sep 2020 14:29:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7l8=C2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kIuuC-0004HM-N3
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 14:29:00 +0000
X-Inumbo-ID: 3912104a-c2e6-4d10-818a-5ee43528bae7
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3912104a-c2e6-4d10-818a-5ee43528bae7;
 Thu, 17 Sep 2020 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600352938;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9LddfTm+/uZgC7ynIjHDNhv3q25RnJRBtD2wKtfoOAs=;
 b=e3ansZ/Fj6JG+8HLmULuDVAVw19fmyVhs3EeYSLHn35/VR4zrwCp7zul
 RARsdE+weAq5ftmfczE/yxSdgzDSZDmA2Zvv5D5hcsI9ZMMMdsZUx++Ht
 H+zhs2neDdtb3eMK4M9TnRoVfeG/KlvolwpBHWgQW2wq0blbnpd1QhvlC M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uyTy4Ega7RpvpClUaZu0STPgW2IKt2rH7SXsWL8Vn2VZ7Iss8jND6cQqjw4jxdM7kFTkM0HyMp
 1C9jm8UOGU9ho3n9BQ1C/NmFRrSpbAsp85LEioabkE4qOzXqybTZ8/bPdHtJln6s//VdGADMoK
 /tPbPZgzYzsANCSfG/ZvJY2A2k91YMcc6/q3ZwiU1Ej3u9/OHxDTmPn4e8ukEfv3ww0wiG8tpf
 qtSAaHuI2fgAhfhrBY9/AngYfm9T6nBURdUPNXp3buSSvM87FMyM/6XLHgOb5ve8F0Ybxg0b98
 E4o=
X-SBRS: 2.7
X-MesageID: 27921529
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,437,1592884800"; d="scan'208";a="27921529"
Date: Thu, 17 Sep 2020 16:28:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
 <paul@xen.org>
Subject: Re: [PATCH] x86/mm: do not mark IO regions as Xen heap
Message-ID: <20200917142849.GE19254@Air-de-Roger>
References: <20200910133514.82155-1-roger.pau@citrix.com>
 <e7230e70-3aae-61a2-3574-6eeae6e4e57a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7230e70-3aae-61a2-3574-6eeae6e4e57a@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Sep 17, 2020 at 04:12:23PM +0200, Jan Beulich wrote:
> On 10.09.2020 15:35, Roger Pau Monne wrote:
> > arch_init_memory will treat all the gaps on the physical memory map
> > between RAM regions as MMIO and use share_xen_page_with_guest in order
> > to assign them to dom_io. This has the side effect of setting the Xen
> > heap flag on such pages, and thus is_special_page would then return
> > true which is an issue in epte_get_entry_emt because such pages will
> > be forced to use write-back cache attributes.
> > 
> > Fix this by introducing a new helper to assign the MMIO regions to
> > dom_io without setting the Xen heap flag on the pages, so that
> > is_special_page will return false and the pages won't be forced to use
> > write-back cache attributes.
> > 
> > Fixes: 81fd0d3ca4b2cd ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I'm sorry for noticing this only now, but there is a place where
> we actually build on these pages being marked "special": In
> xenmem_add_to_physmap_one() we have
> 
>     if ( mfn_valid(prev_mfn) )
>     {
>         if ( is_special_page(mfn_to_page(prev_mfn)) )
>             /* Special pages are simply unhooked from this phys slot. */
>             rc = guest_physmap_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
>         else
>             /* Normal domain memory is freed, to avoid leaking memory. */
>             rc = guest_remove_page(d, gfn_x(gpfn));
>     }
> 
> As you'll notice MMIO pages not satisfying mfn_valid() will simply
> bypass any updates here, but the subsequent guest_physmap_add_page()
> will have the P2M entry updated anyway. MMIO pages which satisfy
> mfn_valid(), however, would previously have been passed into
> guest_physmap_remove_page() (which generally would succeed) while
> now guest_remove_page() will (afaict) fail (get_page() there won't
> succeed).

Would Xen even get to the get_page in guest_remove_page on that case?

There's a p2m_mmio_direct type check that will succeed for MMIO
ranges, and that just clears the p2m entry and returns before doing
any get_page.

Roger.

