Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0B024C355
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 18:28:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8nQS-0003zp-Kj; Thu, 20 Aug 2020 16:28:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SJFq=B6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k8nQR-0003zk-Pr
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 16:28:27 +0000
X-Inumbo-ID: bdd9de4e-b040-4103-8a42-4f61d70204ff
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdd9de4e-b040-4103-8a42-4f61d70204ff;
 Thu, 20 Aug 2020 16:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597940905;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Axksu/Iv3SbOD0tTwLgRHTDx3HnaEY2nh3SjLNZtRoQ=;
 b=d1Jiif2DP1K5pr+Z3evUvoldkBVU+9SDWi9Soa35DpLmMwkXn6UcJFkf
 P2HgaHCeoP+kqSg1GsA0zqutfh/+hZ19wzxM6EC0+5uOM/C4DVCI1EFI9
 eBwOX0TFHyPW7+zaFF9aw7EnmY8NEXH6k+tzodeepvJ8bWxuOzdebLVUq Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: hNcEtqR5OKtBF0NproD8JYBFnrKVwN07ttWjCQ7uVjec+gyb2H7sN2DZnIKawNQanksAOWfB3U
 IhuC4k18UYwDU+DYCAZOzYY98rh/4pGCYTR0ZtnXYBbRLAWsC3ny3AqGC2d/r56QYR1AVWbfqb
 8ddUEYmWiEI/uExW89+8zFnUrsp9+++A1uMrg5qy1QXJsJI1Yx/kD3Y5mIUFRHdM/4iupsDd+I
 gAP9xOu7i36sDKypEIAUVIYjwvEYe2E+H3zs7L25q3qe9LV+A5cxmqAXFXjFm9wl0Xl4b47igL
 pbI=
X-SBRS: 2.7
X-MesageID: 25115815
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="25115815"
Subject: Re: [PATCH 2/2] x86/vpic: also execute dpci callback for non-specific
 EOI
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200820153442.28305-1-roger.pau@citrix.com>
 <20200820153442.28305-3-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <625060e6-bdd0-c72c-c7fc-9a31588511b3@citrix.com>
Date: Thu, 20 Aug 2020 17:28:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200820153442.28305-3-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/08/2020 16:34, Roger Pau Monne wrote:
> Currently the dpci EOI callback is only executed for specific EOIs.
> This is wrong as non-specific EOIs will also clear the ISR bit and
> thus end the interrupt. Re-arrange the code a bit so that the common
> EOI handling path can be shared between all EOI modes.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/vpic.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
> index feb1db2ee3..3cf12581e9 100644
> --- a/xen/arch/x86/hvm/vpic.c
> +++ b/xen/arch/x86/hvm/vpic.c
> @@ -249,15 +249,15 @@ static void vpic_ioport_write(
>                  if ( priority == VPIC_PRIO_NONE )
>                      break;
>                  pin = (priority + vpic->priority_add) & 7;
> -                vpic->isr &= ~(1 << pin);
> -                if ( cmd == 5 )
> -                    vpic->priority_add = (pin + 1) & 7;
> -                break;
> +                goto common_eoi;
> +
>              case 3: /* Specific EOI                */
>              case 7: /* Specific EOI & Rotate       */
>                  pin = val & 7;

You'll need a /* Fallthrough */ here to keep various things happy.

Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Can fix on commit if you're happy.

> +
> +            common_eoi:
>                  vpic->isr &= ~(1 << pin);
> -                if ( cmd == 7 )
> +                if ( cmd == 7 || cmd == 5 )
>                      vpic->priority_add = (pin + 1) & 7;
>                  /* Release lock and EOI the physical interrupt (if any). */
>                  vpic_update_int_output(vpic);


