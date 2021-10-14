Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2333942DDA1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 17:10:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209467.365938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb2Mh-0000c4-2W; Thu, 14 Oct 2021 15:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209467.365938; Thu, 14 Oct 2021 15:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb2Mg-0000Zc-Vc; Thu, 14 Oct 2021 15:09:50 +0000
Received: by outflank-mailman (input) for mailman id 209467;
 Thu, 14 Oct 2021 15:09:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i4ou=PC=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mb2Mf-0000ZW-Nc
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 15:09:49 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25b35b83-6a18-48fd-8c18-dbc197d65505;
 Thu, 14 Oct 2021 15:09:48 +0000 (UTC)
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
X-Inumbo-ID: 25b35b83-6a18-48fd-8c18-dbc197d65505
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634224188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A/eVLzCfFUVyQdqeKwlKTmaRG8eA9V1d03EtCCfE+1Y=;
  b=CVkQl/qZKlBDP9QGVtBWgFHMEGWhyMs+VFbWkBBh78NqzOKRt4VoTKWn
   nRhwbvY09s9d6Gg6idaiUcTrIaFgy2MDM/nepv9l/rlATbGmDgR4P8RuU
   5OFnlTvE537gdvVDI9if5U3Ggnij+HL20zH/YlkjRmM4OM0Hm9PucbKXq
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: k54B7eE9/mhGK8OVivIzBoQxxrj+tWBs2DcJ5RYoxWodEgNhGRXYulbL8uWff7m85Ta/0niy6m
 HkfH5vvTkiZvxBSA3SnxYk5ffjL3ttvNRmoQYvDhjAn4wumqQvLqz4CtS0KAa5CU1f5i5yWEt0
 EFlGnQdD03vLoLx4Kc0ky8mARiBqmSGaiDMMm0OQT058NLB2Y3P985FYTPaEYO5c7CbzOjYqgu
 G51A2bEuEaVITBPYoUZTHj2Gp4jMVHS/+pQlw8LbrOgcRZJYxfibXLXJDMX9tGfij9lQLKtM6A
 OdprsSN1qDzqJAUBrPhirPff
X-SBRS: 5.1
X-MesageID: 57086575
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6cQswath8izBG7Fvj5H2dv2po+fnVMhZMUV32f8akzHdYApBsoF/q
 tZmKTvQO/rfM2HxeYh1OYuw9hwHv5CBn9FgTwpu+yo1RitE+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29cw2IThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl7JebRFdwJJDwx+00aEEIMT5vfvd5weqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6DO
 JJJN2cwMXwsZTUMJ3UyDspks96CpVDgSTQbo1G8u7Qotj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhoTLtCYxBKO+2iggeKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80jE1saE4+UivT9/8dx61uniJulgbQdU4O+8w5RyJy6HUyx2EHWVCRTlEAPQnq80eVTEsz
 kWOnd7iGXpoqrL9YXCA8raZqxuiNC5TKnUNDRLoViNcvYOl+ttqyEuSEJAzS8ZZk+EZBxmpy
 BuH/HEkuolMhOcwj/WZ4kGE2Q2V882hohEO2i3bWWes7wVcbYGjZpC15VWz0cusPLp1XXHa4
 yBaw5n2APQmSMjXznTUEbpl8KSBvq7daFXhbUhT847NHthH00WoepxM+3lALUNtP9dsldTBM
 RKL5105CHO+OhKXgU5Lj2CZV5tCIUvIT42NuhXogjxmOcUZmOivpnAGWKJo9zqx+HXAaIlmU
 XthTe6iDGwBFYNsxyesSuEW3NcDn35lmTqOHc6knkr5idJygUJ5r59ebTNiichjvcu5TPj9q
 Y4DZ6NmNT0OOAEBXsUn2dFKdg1bRZTKLZv3t9ZWZoa+zvlOQwkc5wvq6ep5IeRNxv0N/s+Rp
 y3VchIImTLX2CycQS3XOy8LVV8adcsmxZ7NFXd3ZgjANrlKSdvH0ZrzgLNsJuB8rrY9naAkJ
 xTHEu3Zaslypv3802x1RfHAQEZKJXxHXCqCYHioZiYRZZllS1Cb89PoZFK3piIPEjC2pY01p
 Lj5jlHXRp8KRgJDCsfKaa3wkwPt7CZFwO8iDVHVJtRzeVn39NQ4ISLGkfJqcdoHLg/Ox2XG2
 l/OUwsYv+TEv6Q87MLN2fKft46sHuYnRhhaEmDX4KyYLy7f+mb/k4ZMXPzRJWLWVX/u+bXkb
 uJQlqmuPPoClVdMkox9D7c0kv5uu4qx/+dXl102Em/KYlKnDqJbDkOHhcQf5LdQwrJ5uBetX
 h7d8NdtJrjUatjuF0QcJVR5Y73bh+0UgDTb8d88PF7+uH1s5LOCXEhfY0uMhShaIOcnOY8p2
 7586ssf6gj5gRs2KNeWyCtT8j3UfHAHVqwmsLAcAZPq1VV3mg0TP8SEB3+k+oyLZvVNLlIuc
 22di6f1jrhBwlbPLigoHn/X0OsB3ZkDtXimFrPZy4hlTjYdusIK4Q==
IronPort-HdrOrdr: A9a23:O8atVqPV/end7cBcTsGjsMiBIKoaSvp037Eqv3oedfVwSL39qy
 nOpoV/6faaslsssR0b9exofZPwJk80lqQFg7X5X43DYOCOggLBR+tfBMnZsl7d8kXFh4hgPM
 xbEpSWZueeMWRH
X-IronPort-AV: E=Sophos;i="5.85,372,1624334400"; 
   d="scan'208";a="57086575"
Date: Thu, 14 Oct 2021 16:09:33 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Doug Goldstein <cardoe@cardoe.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 30/51] build: hook kconfig into xen build system
Message-ID: <YWhILTCeiQ363rhy@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-31-anthony.perard@citrix.com>
 <eb7accc1-f46f-51c3-6610-4c6afbc40507@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eb7accc1-f46f-51c3-6610-4c6afbc40507@suse.com>

On Mon, Oct 11, 2021 at 05:38:47PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > Now that xen's build system is very close to Linux's ones, we can hook
> > "Makefile.host" into Xen's build system, and we can build Kconfig with
> > that.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

I'll be squashing the previous patch into this one i.e. adding
"$(XEN_ROOT)/.config: ;" into tools/kconfig/Makefile (the previous patch
was adding it into Rules.mk).

And will be adding the following into the commit message:

    "tools/kconfig/Makefile" now needs a workaround to not rebuild
    "$(XEN_ROOT)/.config", as `make` tries the rules "%.config" which
    fails with:
        tools/kconfig/Makefile:95: *** No configuration exists for this target on this architecture.  Stop.

-- 
Anthony PERARD

