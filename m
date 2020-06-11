Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CBF1F6C23
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 18:26:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjQ1u-0000P8-S1; Thu, 11 Jun 2020 16:26:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSbG=7Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jjQ1t-0000P2-Si
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 16:26:13 +0000
X-Inumbo-ID: 43c8faf6-ac00-11ea-b547-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43c8faf6-ac00-11ea-b547-12813bfff9fa;
 Thu, 11 Jun 2020 16:26:13 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PfrY6UUWB2zpZ7pWpiIXITDAEtG5X0DCX++wVZwHhfRIphXv8tqKbSQ0y07jiHpgLp4qNdHGFY
 BY4bBzm4iKOlZ7VjmTxdxL5Wvmc1w6415atAMYoam+Vkx00u0rY2QdiRgds/i+Ek94Evq/KL4G
 BxShepJnsI1rZrskZq29KdnIAh81fOdIpJj1rreRvjPeQhv4mQRe4VPZBrWFXHwvTr7Ob71T9N
 hMaCF+jo6Nvfac9hAuLcodTNttB1gg73yykcnrZDOZPJ1qQ7Uxi7J2hZIyvcJqOWTxk8+bNw9Q
 1ts=
X-SBRS: 2.7
X-MesageID: 20156416
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,499,1583211600"; d="scan'208";a="20156416"
Subject: Re: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a flag for
 GSIs not requiring an EOI or unmask
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20200610142923.9074-1-roger.pau@citrix.com>
 <20200610142923.9074-3-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6de3a582-d9a8-60b5-9525-c9223932e4ed@citrix.com>
Date: Thu, 11 Jun 2020 17:26:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610142923.9074-3-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10/06/2020 15:29, Roger Pau Monne wrote:
> There's no need to setup a timer for GSIs that are edge triggered,
> since those don't require any EIO or unmask, and hence couldn't block
> other interrupts.
>
> Note this is only used by PVH dom0, that can setup the passthrough of
> edge triggered interrupts from the vIO-APIC. One example of such kind
> of interrupt that can be used by a PVH dom0 would be the RTC timer.
>
> While there introduce an out label to do the unlock and reduce code
> duplication.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

