Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7BF1BC4C1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 18:14:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTSsI-0002U8-0m; Tue, 28 Apr 2020 16:14:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p0bN=6M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jTSsG-0002U2-KX
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 16:14:20 +0000
X-Inumbo-ID: 50745ac8-896b-11ea-ae69-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50745ac8-896b-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588090460;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zq0Jx5MHlQZq+e3iKREbzZrUiDP1DyzQrc4wS1gRCRs=;
 b=CDLg+Gb12VRMV5wTqoVTvMF+b9O5mfvKahp42A2N2/CXbfB0X6LD39UZ
 n2HLWqwCXlzwOrHOsOIBvllh6ru8fqU57iX+FuSAWP5mESloudgWaSZF1
 lP/0gdDt1Hzz+9vFcR0LtsY5BGRzKzTZLUvlYzW0aG5fTzkOZwQgF6rq2 k=;
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
IronPort-SDR: PjWnpGOBbuz85tqkA2j/L9iUdkjp2Jaip1l/lKs3PgLQd48ltaXueK86FHN6OHrnHffQkFw5Om
 77X+hF7YXXPFOcdOqC6hMVxcnqd8zHc3Ucw0mK/LINtUIVStN1EbeDCWqh/fNF+lFJLDmk7OtP
 tZzJLMzaRX56K1uZvkbZghHFvh0zjP9PusJot3ZcbKzm3Neex969aXuC7hNN7wnCMNwlxxXgfk
 prDl9OvNXz/qt2/VTSqARr9E5RQWp7004umGu8UJedUGi9lSueLfQ93QIVgge6Q1cX7MIwy+cp
 TFM=
X-SBRS: 2.7
X-MesageID: 16398089
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,328,1583211600"; d="scan'208";a="16398089"
Date: Tue, 28 Apr 2020 18:14:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/pass-through: avoid double IRQ unbind during domain
 cleanup
Message-ID: <20200428161412.GU28601@Air-de-Roger>
References: <6fddc420-b582-cb2f-92ce-b3e067c420c4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6fddc420-b582-cb2f-92ce-b3e067c420c4@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Varad Gautam <vrd@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 28, 2020 at 02:21:48PM +0200, Jan Beulich wrote:
> XEN_DOMCTL_destroydomain creates a continuation if domain_kill -ERESTARTs.
> In that scenario, it is possible to receive multiple _pirq_guest_unbind
> calls for the same pirq from domain_kill, if the pirq has not yet been
> removed from the domain's pirq_tree, as:
>   domain_kill()
>     -> domain_relinquish_resources()
>       -> pci_release_devices()
>         -> pci_clean_dpci_irq()
>           -> pirq_guest_unbind()
>             -> __pirq_guest_unbind()
> 
> Avoid recurring invocations of pirq_guest_unbind() by removing the pIRQ
> from the tree being iterated after the first call there. In case such a
> removed entry still has a softirq outstanding, record it and re-check
> upon re-invocation.
> 
> Reported-by: Varad Gautam <vrd@amazon.de>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Varad Gautam <vrd@amazon.de>
> 
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -1323,7 +1323,7 @@ void (pirq_cleanup_check)(struct pirq *p
>      }
>  
>      if ( radix_tree_delete(&d->pirq_tree, pirq->pirq) != pirq )
> -        BUG();
> +        BUG_ON(!d->is_dying);

I think to keep the previous behavior this should be:

BUG_ON(!is_hvm_domain(d) || !d->is_dying);

Since the pirqs will only be removed elsewhere if the domain is HVM?

Thanks, Roger.

