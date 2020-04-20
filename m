Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7B31B0CF7
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 15:40:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQWeh-0001OF-A5; Mon, 20 Apr 2020 13:40:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQWef-0001O8-Rn
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 13:40:09 +0000
X-Inumbo-ID: 735baa10-830c-11ea-83d8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 735baa10-830c-11ea-83d8-bc764e2007e4;
 Mon, 20 Apr 2020 13:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587390008;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dkX0LhNkF7QXB5i7ncQgZIg5lPgcDEw3d4hNAnw1U2A=;
 b=gNBe3oJ8DWyWa6TlnHr2m0xtGaUh63A/hxhTtsniIfUBHSBoP4+2VQ76
 S0/auIGpehujDwQWLp6jpBm2N8YJqXPD81I5oR6kE613RRNtAHF5vjI2G
 tvEf2fF95MyGEcgp2XUhvaRy4QGO5oGwi2CwW1y3FZnFya7G77amRk58u E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: y1HcT2tUx2uuBM38CT6ha1INOCW9zW3Nu58s+MT2Lj1kMr+PbnnFaFbyn0vBY6nHQ6lJRfwHeB
 e8NqKeX6nIVP11Rz7EldKGqP7IahnkHAuQtM3moIhxTXhqltdngHcFcE3nmtaWslgRKCwRtq0a
 8CEePjA63mYGx31oqA/EN2ISY6MMe9JtSgbdwfVDkfv9xwTQshGMNWOPC3Mflzq1D9oPcWAp9a
 ms+jiP8rp2+83j87ec3mI3KDWwaIHy5PzcXnWv7YLZOoYYVhD+8pczPsYxxyCKqwcmPU1ApInk
 LwA=
X-SBRS: 2.7
X-MesageID: 16253199
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,406,1580792400"; d="scan'208";a="16253199"
Subject: Re: [PATCH] x86emul: SYSRET must change CPL
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <d193babc-9afa-7cff-13f4-532e62d5e3e6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4f605ad9-ebf0-522e-6d84-ec717ab6171e@citrix.com>
Date: Mon, 20 Apr 2020 14:40:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d193babc-9afa-7cff-13f4-532e62d5e3e6@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/04/2020 13:14, Jan Beulich wrote:
> The special AMD behavior of leaving SS mostly alone wasn't really
> complete: We need to adjust CPL aka SS.DPL.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Oops.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

>
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -6022,6 +6022,8 @@ x86_emulate(
>  
>              /* There's explicitly no RPL adjustment here. */
>              sreg.sel = (msr_val >> 48) + 8;
> +            /* But DPL needs adjustment, for the new CPL to be correct. */
> +            sreg.dpl = 3;
>          }
>  
>  #ifdef __x86_64__


