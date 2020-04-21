Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431D31B2889
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 15:52:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQtJc-0000Zw-8i; Tue, 21 Apr 2020 13:51:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zbep=6F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jQtJa-0000Zr-7J
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 13:51:54 +0000
X-Inumbo-ID: 40e95976-83d7-11ea-9146-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40e95976-83d7-11ea-9146-12813bfff9fa;
 Tue, 21 Apr 2020 13:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587477113;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Sh7/fshD/STrrXYzJ6J4SzYayDsi9ZusIGDEMiMQapo=;
 b=ejRJT/y2uRLxER4dzU5x068ROfkgmJwQBfvWmdNjYP7KpLyRjIOow+40
 PHYjaZ5XkZpsQHyANp78LbyGgfo12sqwpz+OW2tbXL0176huLoC687VPG
 /nbEIWu7B35+soU1wkLiI/EMzHTe+mIrjiB/XNiOKVD2DrOhVCw1YiUxZ 4=;
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
IronPort-SDR: n+jV2mVCOHIfT5fIQ4JqxYewBtVaZ4UF4JdCnEy0u++GsLbSbEFKOcqZSb/EPYjPahm+OGJIRj
 vwnKKEIgkBkzj6o6UfOnB26lmHHy+uwSryfH1iip6XCXj5MF9F84qeSfpkZdyfK2FxF1ggLmnE
 dyf318e2Ikx4mAvOjC7QlikBU+JEhWwuVmgiKyrVJQioLUsIFeCSMpubv35h+ebMyjgTrNSZil
 bqW9x0vtJGcKlwol80DnTHtaLzMToigCT8PqTqxgPZ2esYYpon9eg5PZSo0/qMxl8JbxBvbcUq
 pLY=
X-SBRS: 2.7
X-MesageID: 15987758
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="15987758"
Date: Tue, 21 Apr 2020 15:51:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v10 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200421135144.GV28601@Air-de-Roger>
References: <20200416135909.16155-1-roger.pau@citrix.com>
 <20200416135909.16155-2-roger.pau@citrix.com>
 <80288e76-aff6-61d5-71aa-ae7c8e9d9a65@suse.com>
 <20200421104335.GU28601@Air-de-Roger>
 <21abc8e6-5665-9d6f-395f-6e4eb8bf2e58@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21abc8e6-5665-9d6f-395f-6e4eb8bf2e58@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 21, 2020 at 02:59:10PM +0200, Jan Beulich wrote:
> On 21.04.2020 12:43, Roger Pau Monné wrote:
> > On Tue, Apr 21, 2020 at 12:21:12PM +0200, Jan Beulich wrote:
> >> On 16.04.2020 15:59, Roger Pau Monne wrote:
> >>> Introduce a specific flag to request a HVM guest linear TLB flush,
> >>> which is an ASID/VPID tickle that forces a guest linear to guest
> >>> physical TLB flush for all HVM guests.
> >>>
> >>> This was previously unconditionally done in each pre_flush call, but
> >>> that's not required: HVM guests not using shadow don't require linear
> >>> TLB flushes as Xen doesn't modify the guest page tables in that case
> >>> (ie: when using HAP).
> >>
> >> I'm afraid I'm being confused by this: Even in shadow mode Xen
> >> doesn't modify guest page tables, does it?
> > 
> > I'm also confused now. It's my understand that when running in shadow
> > mode guest page tables are not actually used, and the guest uses Xen's
> > crafted shadow tables instead, which are based on the original guest
> > page tables suitably adjusted by Xen in order to do the p2m
> > translation in the HVM case, or the needed PTE adjustments in the PV
> > case.
> > 
> > So guest page tables are not modified, but are also not used as they
> > are never loaded into cr3.
> 
> This matches my understanding.

Please bear with me, as I'm not sure if your question was because you
think the paragraph is not clear and/or should be expanded.

The point of the paragraph you mention was to have a difference
between guests running in shadow mode vs guests running in HAP mode.
Maybe I should use guest loaded page pages, to differentiate between
guest created page tables and the page tables actually loaded in cr3
in guest mode?

> >>> @@ -254,3 +257,14 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
> >>>  
> >>>      return flags;
> >>>  }
> >>> +
> >>> +void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask)
> >>> +{
> >>> +    unsigned int flags = (is_pv_domain(d) || paging_mode_shadow(d) ? FLUSH_TLB
> >>> +                                                                   : 0) |
> >>> +                         (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
> >>> +                                                          : 0);
> >>
> >> Why the is_pv_domain() part of the condition? Afaict for PV
> >> domains you can get here only if they have shadow mode enabled.
> > 
> > Right now yes, the only way to get here for PV domains is when using
> > shadow, but if this helper gets used in other non-shadow PV paths then
> > Xen's needs to do a TLB flush.
> 
> Why would a non-shdow PV path find a need to call this function?

The memory management code in PV guests also needs to perform TLB
flushes, so I wasn't sure whether the aim was to also switch it to use
guest_flush_tlb_mask.

I guess this doesn't make a lot of sense since PV guests just need a
plain TLB flush, and there's not a lot of benefit from having a helper
around that. Maybe for PV guests running in XPTI mode, where the flush
can be avoided as the return to guest path already flushes the page
tables? Anyway, will remove the is_pv_domain check.

Thanks, Roger.

