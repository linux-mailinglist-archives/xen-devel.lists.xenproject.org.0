Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E33F8710D4A
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 15:34:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539605.840671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2B6d-0003ni-FU; Thu, 25 May 2023 13:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539605.840671; Thu, 25 May 2023 13:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2B6d-0003lI-CW; Thu, 25 May 2023 13:34:15 +0000
Received: by outflank-mailman (input) for mailman id 539605;
 Thu, 25 May 2023 13:34:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ga2A=BO=citrix.com=prvs=5022cd99a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q2B6b-0003lC-Up
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 13:34:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d48766e4-fb00-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 15:34:11 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d48766e4-fb00-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685021651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YuXT6CmD5hAPYpvYA3geWSPDUf8sUjKkWT9oJZHJvSE=;
  b=G15HhiiaUX0Px9Tkh2myxKq6tjIX8Cpi2WLHeRr98qkazfbljM18SvFL
   X4Qm3zLaeyki/br2I++AU7lm+UJJmJyPaOQez8VhsmR/CQuIUOKVvgDIa
   cHbBxD+E4IiV6GM3mZ+LfCYS/BBE9T+J4z1f3PNrlyGMse1Xl6Fr4tFpP
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110803567
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:2lSInaJ8fZH7LswiFE+R55UlxSXFcZb7ZxGr2PjKsXjdYENS1DdUy
 TFLWGCEM/rfYmKgeIxxa97l90kDvJ7SydRnHQVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4wZjPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5TGVAX6
 OwzdwkRf0+HhL7qxJ+2RNhF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHJ0Fxh3F+
 D2uE2LRACxAbta44iq+onu329/mvynqZaAgPejtnhJtqALKnTFCYPEMbnO5q/Skjk+1W/pEN
 lcZvCEpqMAa+FSwS9jhXzWxuHOeogMHQN1UDvE77weWjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+dtT6oMDIZBXMDbyQDCwAC5rHeTJob10yVCIw5Sejs04OzQGurq
 9yXkMQgr5ELvJcWx47kxEzW3Dav+sTNYwM71yyCCwpJ8ThFTIKiYoWp733S4vBBMJuVQzG9g
 ZQUpySNxLtQVM/QzURhVM1IRej0vKjdbFUwlHY1R/EcGyKRF2lPlGy6yBV3Pw9XP8kNYlcFi
 2eD6FoKtPe/0JZHBJKbgr5d6exwlcAM9vy/DJg4i+aihbAvHDJrBAk0OSatM5nFySDAa50XN
 5aBatqLBn0HE6lhxzfeb75DgeN6m3tknjmKGMiTI/GbPV22PST9dFv4GAHWMrBRAF2s+205D
 Oqzx+PVkk4CAYUSkwHc8JIJLEBiEEXX8ave8pQNHsbae1oOJY3UI6OJqV/XU9A/zvs9eyah1
 i3VZ3K0P3Kk2yOceFvUMCw4AF4tNL4mxU8G0eUXFQ7A8xAejUyHtc/zq7NfkWEbydFe
IronPort-HdrOrdr: A9a23:VQj646G2YsorJ6EkpLqEwMeALOsnbusQ8zAX/mt6Q3VuA7elfg
 6V7Y0mPH7P+U4ssRQb8+xoV5PwJE80maQFg7X5eI3SPzUO21HIEGgB1/qH/9SIIUSXndK1l5
 0BT0EUMqyWMbEVt7ed3OB6KbodKRu8nZxASd2w856ld29XV50=
X-Talos-CUID: 9a23:dJCjwmP9xKLjF+5DfDFWrVMEMZ8cbmyCyHSMf0uVBGhYYejA
X-Talos-MUID: 9a23:9DOsvQZbdRZPXuBTtQK23jtFH9dTs621VXAks58Xhuu2HHkl
X-IronPort-AV: E=Sophos;i="6.00,191,1681185600"; 
   d="scan'208";a="110803567"
Date: Thu, 25 May 2023 14:34:06 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 04/15] build: hide policy.bin commands
Message-ID: <ce86e239-5cc1-4f7c-ba6b-de6eb9c1442d@perard>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-5-anthony.perard@citrix.com>
 <c75368db-6444-6910-487c-8ac9477a6785@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c75368db-6444-6910-487c-8ac9477a6785@suse.com>

On Wed, May 24, 2023 at 09:11:10AM +0200, Jan Beulich wrote:
> On 23.05.2023 18:38, Anthony PERARD wrote:
> > --- a/xen/xsm/flask/Makefile
> > +++ b/xen/xsm/flask/Makefile
> > @@ -48,10 +48,15 @@ targets += flask-policy.S
> >  FLASK_BUILD_DIR := $(abs_objtree)/$(obj)
> >  POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
> >  
> > +policy_chk = \
> > +    $(Q)if ! cmp -s $(POLICY_SRC) $@; then \
> > +        $(kecho) '  UPD     $@'; \
> > +        cp $(POLICY_SRC) $@; \
> 
> Wouldn't this better use move-if-changed? Which, if "UPD ..." output is
> desired, would then need overriding from what Config.mk supplies?

I don't like move-if-changed, because it remove the original target. On
incremental build, make will keep building the original target even
when not needed. So we keep seeing the `checkpolicy` command line when
there's otherwise nothing to do.

I could introduce a new generic macro instead, copy-if-changed, which
will do compare and copy (like policy_chk is doing here).

Thanks,

-- 
Anthony PERARD

