Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D4B1D7A44
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 15:43:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jag38-0001NR-Hh; Mon, 18 May 2020 13:43:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ws3m=7A=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jag37-0001NM-5k
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 13:43:21 +0000
X-Inumbo-ID: 88145346-990d-11ea-a867-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88145346-990d-11ea-a867-12813bfff9fa;
 Mon, 18 May 2020 13:43:19 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: iPDJMvHDM8739jgWth+7bNACdGvlAPah29U/UnnktOeRjWJh3q0uiNGfw68V3DbPh54w8CVTeb
 SJ2bfr0+P2frQ2rNyRC+4d3Vy+yMe9+VmQAmGR2mQvQ5Unc2er8d3G/xob20P+0A41THAc6qSL
 Qs4dE2m+57XjpZMHLSBRZ/FzwZlew+OLXjw3Jh5FqvFZci64dpPY347WW5Jzv7oWXxrXe1y9Jk
 KZdqFgtvg/3p3oRgd/N7TPVO0Z/wGY8LTMYdzElq4cz+PEX1LoVe6tGpplr9Cx6UkAYO5WeOr9
 WcQ=
X-SBRS: 2.7
X-MesageID: 18486562
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="18486562"
Subject: Re: [PATCH] x86: determine MXCSR mask in all cases
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <687f8a71-5c5c-c95e-146d-8f38211e5e00@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f49bc57d-69dc-daba-07a3-016c4786c919@citrix.com>
Date: Mon, 18 May 2020 14:43:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <687f8a71-5c5c-c95e-146d-8f38211e5e00@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18/05/2020 14:16, Jan Beulich wrote:
> For its use(s) by the emulator to be correct in all cases, the filling
> of the variable needs to be independent of XSAVE availability. As
> there's no suitable function in i387.c to put the logic in, keep it in
> xstate_init(), arrange for the function to be called unconditionally,
> and pull the logic ahead of all return paths there.
>
> Fixes: 9a4496a35b20 ("x86emul: support {,V}{LD,ST}MXCSR")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

