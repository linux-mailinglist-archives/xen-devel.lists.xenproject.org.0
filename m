Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3555225CEE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 12:52:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxTPD-0003t2-T1; Mon, 20 Jul 2020 10:52:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UosC=A7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxTPC-0003st-27
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 10:52:22 +0000
X-Inumbo-ID: 15bc86d8-ca77-11ea-8489-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15bc86d8-ca77-11ea-8489-bc764e2007e4;
 Mon, 20 Jul 2020 10:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595242341;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W5cFX+NQcCdqdZtpNy/cgjcVgDwoZyubBv44b1n+/0s=;
 b=KnDRdLsUiVmgzQKiBCPXgb18vT1Em1MV3bh71Cd77GQTOrg8l+JdBCKa
 ljaa2g4ydgJaEpFx2vg6L2gROBE6Gt0PED1F0EKVfvOuKIpFTG3Lu8mLL
 eqp842gCxsVdTVbbztxdUWADU9rzUvL73n9U+m9qGo5/LhCuyomcxmCVR g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2NUAkrW7DnbNYpkBNcJoed9MwbVDC7VgUPdzvanQkhXPJ/Hlzb8oQP2cB0p43ePPbr7SbrVCua
 sZyTxceZgpZuL4tK0bLOIvplOYG0SGE6WrU+/HZeSCU21i3zMgYzVmhXB+IGEAzyej6IZzmMx3
 mrS7dP5MUlZa7HtuODPSkYoKH1IA4ckmAzf83dgqItL96Hyzw7e5+zhQo4X75h1FwNDiXIgL1M
 SuafOD4fGi89QCOc+ArK3rA6d2oQwAJ6higTp/TIMeNk0W7zES22B4aNeiwWQA0EGcSOTr+gMY
 Jhs=
X-SBRS: 2.7
X-MesageID: 23065228
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="23065228"
Date: Mon, 20 Jul 2020 12:52:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86: guard against port I/O overlapping the RTC/CMOS range
Message-ID: <20200720105213.GI7191@Air-de-Roger>
References: <38c73e17-30b8-27b4-bc7c-e6ef7817fa1e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <38c73e17-30b8-27b4-bc7c-e6ef7817fa1e@suse.com>
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 17, 2020 at 03:10:43PM +0200, Jan Beulich wrote:
> Since we intercept RTC/CMOS port accesses, let's do so consistently in
> all cases, i.e. also for e.g. a dword access to [006E,0071]. To avoid
> the risk of unintended impact on Dom0 code actually doing so (despite
> the belief that none ought to exist), also extend
> guest_io_{read,write}() to decompose accesses where some ports are
> allowed to be directly accessed and some aren't.

Wouldn't the same apply to displaced accesses to port 0xcf8?

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -210,7 +210,7 @@ static bool admin_io_okay(unsigned int p
>          return false;
>  
>      /* We also never permit direct access to the RTC/CMOS registers. */
> -    if ( ((port & ~1) == RTC_PORT(0)) )
> +    if ( port <= RTC_PORT(1) && port + bytes > RTC_PORT(0) )
>          return false;
>  
>      return ioports_access_permitted(d, port, port + bytes - 1);
> @@ -297,6 +297,17 @@ static uint32_t guest_io_read(unsigned i
>              if ( pci_cfg_ok(currd, port & 3, size, NULL) )
>                  sub_data = pci_conf_read(currd->arch.pci_cf8, port & 3, size);
>          }
> +        else if ( ioports_access_permitted(currd, port, port) )
> +        {
> +            if ( bytes > 1 && !(port & 1) &&
> +                 ioports_access_permitted(currd, port, port + 1) )
> +            {
> +                sub_data = inw(port);
> +                size = 2;
> +            }
> +            else
> +                sub_data = inb(port);
> +        }
>  
>          if ( size == 4 )
>              return sub_data;
> @@ -373,25 +384,31 @@ static int read_io(unsigned int port, un
>      return X86EMUL_OKAY;
>  }
>  
> +static void _guest_io_write(unsigned int port, unsigned int bytes,
> +                            uint32_t data)

There's nothing guest specific about this function I think? If so you
could drop the _guest_ prefix and just name it io_write?

> +{
> +    switch ( bytes )
> +    {
> +    case 1:
> +        outb((uint8_t)data, port);
> +        if ( amd_acpi_c1e_quirk )
> +            amd_check_disable_c1e(port, (uint8_t)data);
> +        break;
> +    case 2:
> +        outw((uint16_t)data, port);
> +        break;
> +    case 4:
> +        outl(data, port);
> +        break;
> +    }

Newlines after break statements would be nice, and maybe add a
default: ASSERT_UNREACHABLE() case to be on the safe side?

Thanks, Roger.

