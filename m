Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 435AF1B4AA2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 18:33:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRIJn-0005zy-Sp; Wed, 22 Apr 2020 16:33:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1SgQ=6G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jRIJn-0005zt-2D
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 16:33:47 +0000
X-Inumbo-ID: 09547280-84b7-11ea-b58d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09547280-84b7-11ea-b58d-bc764e2007e4;
 Wed, 22 Apr 2020 16:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587573226;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G3mkT4oFR4kXoNWmMSQAwM0sbSjW+8RCU+61QXmBpTQ=;
 b=SdG5KLDOr3bFLKQFIN/TZK6ONvjU/LkB3y1a0j0tgPMmRDFtQQALoxVQ
 veZG9lT/Je6Av6PHRR0KkVCFUmcFUiCE9JAJkrU5RWF7g8mxDtmnrr7np
 w/mwJxGWsjQgoyzM8Aqoa0Jhya/9z0rwTtAGc8PpWpTAcn+YqpHaGr1Qw k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yErkoYtC1pkuSH/KMiklMSFy8elHhAlwjvW9jzltzN4Plt0GRGKPZp7Agkj0WE7l0jpKv08KMX
 cQT/Dk1CJy0aASgtNlgyeHIEc5Y41Eu3Sq7fnBHDm8vqTXl66CY80HmVsqjqxahhG10zlSeH8R
 X0nrml/R/OWjPe3B0gtkSiEjWOnZvEkB5gEtqh2QZ+19HxsaxLJNYr/2tYI3kLGw0PDiOuLGzG
 i07DzjQ+SISFZmqIb7zWB+NPx/JEGTHDeKKcwkiLu28B0m+QR9MHfAZJfoeFpC4r0zMKxgXjID
 beA=
X-SBRS: 2.7
X-MesageID: 16395186
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,304,1583211600"; d="scan'208";a="16395186"
Date: Wed, 22 Apr 2020 18:33:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v10 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200422163338.GF28601@Air-de-Roger>
References: <20200416135909.16155-1-roger.pau@citrix.com>
 <20200416135909.16155-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200416135909.16155-2-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 16, 2020 at 03:59:07PM +0200, Roger Pau Monne wrote:
> @@ -254,3 +257,14 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
>  
>      return flags;
>  }
> +
> +void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask)
> +{
> +    unsigned int flags = (is_pv_domain(d) || paging_mode_shadow(d) ? FLUSH_TLB
> +                                                                   : 0) |
> +                         (is_hvm_domain(d) && cpu_has_svm ? FLUSH_HVM_ASID_CORE
> +                                                          : 0);

Maybe I'm getting confused, but I think the above is wrong and ASID
should _always_ be flushed when running a HVM domain in shadow mode
regardless of whether the underlying hw is Intel or AMD, ie:

bool shadow = paging_mode_shadow(d);
unsigned int flags = (shadow ? FLUSH_TLB : 0) |
                     (is_hvm_domain(d) &&
                      (cpu_has_svm || shadow) ? FLUSH_HVM_ASID_CORE : 0);

Is the correct version.

Roger.

