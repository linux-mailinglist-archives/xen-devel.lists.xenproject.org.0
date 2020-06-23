Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B32F205597
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 17:16:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnkeO-0005HU-2j; Tue, 23 Jun 2020 15:15:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClC/=AE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jnkeN-0005HP-Cs
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 15:15:51 +0000
X-Inumbo-ID: 6bda982a-b564-11ea-bf9c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bda982a-b564-11ea-bf9c-12813bfff9fa;
 Tue, 23 Jun 2020 15:15:50 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: imf+8yrEZnrmNjn0kDn9noktt/xPRBYRPrTmXgyXBqcWXb7lf8KWD9AauBbSPIuy00dkUzouUM
 R08/Yh+irSFhFH2Dy+psZ5FmUf4gh9hU5lBg9gsOJOj/BCgBSDgq56ysSuKiSeT9VIEj5ka4Cm
 gPPfBuBqSsNyKkQG1imR1fIACyt4Sl2WIgwvKDPZ1cMAz5dByDDWbu/Md6bvsQAQL6lkW4TpOW
 uQYvcvW8F74Ej44anJi5BNVNXnB3tgCqfIRpf1mO/l2oJNLHnHyWiKmjy6qM90bH9Gh3c2sRR5
 1Ls=
X-SBRS: 2.7
X-MesageID: 20742011
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,271,1589256000"; d="scan'208";a="20742011"
Date: Tue, 23 Jun 2020 17:15:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.14 v2] x86/tlb: fix assisted flush usage
Message-ID: <20200623151542.GR735@Air-de-Roger>
References: <20200623145006.66723-1-roger.pau@citrix.com>
 <741ff589-4366-1430-6639-13dc5f02fdfa@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <741ff589-4366-1430-6639-13dc5f02fdfa@xen.org>
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
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 23, 2020 at 04:08:06PM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 23/06/2020 15:50, Roger Pau Monne wrote:
> > diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> > index 9b62087be1..f360166f00 100644
> > --- a/xen/include/xen/mm.h
> > +++ b/xen/include/xen/mm.h
> > @@ -639,7 +639,8 @@ static inline void accumulate_tlbflush(bool *need_tlbflush,
> >       }
> >   }
> > -static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp)
> > +static inline void filtered_flush_tlb_mask(uint32_t tlbflush_timestamp,
> > +                                           bool sync)
> 
> I read the commit message and went through the code, but it is still not
> clear what "sync" means in a non-architectural way.
> 
> As an Arm developper, I would assume this means we don't wait for the TLB
> flush to complete. But I am sure this would result to some unexpected
> behavior.

No, when we return from filtered_flush_tlb_mask the flush has been
performed (either with sync or without), but I understand the
confusion given the parameter name.

> So can you explain on non-x86 words what this really mean?

sync (in this context) means to force the usage of an IPI (if built
with PV or shadow paging support) in order to perform the flush.
AFAICT on Arm you always avoid an IPI when performing a flush, and
that's fine because you don't have PV or shadow, and then you don't
require this. Also I'm not sure Arm has the concept of a spurious
page fault.

I could rename to force_ipi (or require_ipi) if that's better?

Roger.

