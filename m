Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 663EA1B592F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:30:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRZ7i-0002bu-Ql; Thu, 23 Apr 2020 10:30:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IVNM=6H=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jRZ7g-0002bp-Kb
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 10:30:24 +0000
X-Inumbo-ID: 70e4e3f8-854d-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70e4e3f8-854d-11ea-b58d-bc764e2007e4;
 Thu, 23 Apr 2020 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aPFru5k8xeaS99OltKI3qFaxgEJ+9rtIHqVXBXXSvwc=; b=0ENP90q83mbn0TqfQmxNo4h4nP
 70pxRthb9VfRCKb2p8Y2EMnLuP96FjVUex1bq43zVfq15doEeekDWWyqsqfiv0rh00U9dh0a2te78
 ZkBqIS5HZUqZ7kOmiq2xYosXMRk2TeKPLDduq5LoYoC4kaP/mXUfQqpkvwTqs1v9Yoa0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jRZ7e-0000UO-Pb; Thu, 23 Apr 2020 10:30:22 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jRZ7e-0005YI-EW; Thu, 23 Apr 2020 10:30:22 +0000
Date: Thu, 23 Apr 2020 11:30:19 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v10 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200423103019.a43rnmub5jdszjhc@debian>
References: <20200416135909.16155-1-roger.pau@citrix.com>
 <20200416135909.16155-2-roger.pau@citrix.com>
 <20200422163338.GF28601@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200422163338.GF28601@Air-de-Roger>
User-Agent: NeoMutt/20180716
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 22, 2020 at 06:33:38PM +0200, Roger Pau Monné wrote:
> On Thu, Apr 16, 2020 at 03:59:07PM +0200, Roger Pau Monne wrote:
> > @@ -254,3 +257,14 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
> >  
> >      return flags;
> >  }
> > +
> > +void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask)
> > +{
> > +    unsigned int flags = (is_pv_domain(d) || paging_mode_shadow(d) ? FLUSH_TLB
> > +                                                                   : 0) |
> > +                         (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
> > +                                                          : 0);
> 
> Maybe I'm getting confused, but I think the above is wrong and ASID
> should _always_ be flushed when running a HVM domain in shadow mode
> regardless of whether the underlying hw is Intel or AMD, ie:
> 
> bool shadow = paging_mode_shadow(d);
> unsigned int flags = (shadow ? FLUSH_TLB : 0) |
>                      (is_hvm_domain(d) &&
>                       (cpu_has_svm || shadow) ? FLUSH_HVM_ASID_CORE : 0);

This sort of long expression is prone to error. See XSA-316.

Can I request it to be broken down a bit?

Wei.

