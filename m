Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43B72484E6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 14:41:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k80ug-0001wG-Sv; Tue, 18 Aug 2020 12:40:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gypu=B4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k80uf-0001wB-3f
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 12:40:25 +0000
X-Inumbo-ID: 474d6a36-5dd8-45d3-b2f3-78ce3d3d0b27
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 474d6a36-5dd8-45d3-b2f3-78ce3d3d0b27;
 Tue, 18 Aug 2020 12:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597754423;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=jGhNuXZWs6l5vILHVgLNpgCN/EgznOx2kpLZQgHamCc=;
 b=MDEHFEpvFp6Gdzs6ppNGB7ESwBjgdU/S+3YUysKl865911wT34AnUH4M
 gUfv1Zpp3jL4pBJ656+sePZh9XJEpo9MIEw83AV4EQx6uvcSxWQ+DZ+Ya
 7gzWrZvfngyfnPWHO7t+EHMNZ+puQYocsTjRFN9SHsucNMpt+6cTPiZJL A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Wn2tfHIJ7FEaxMb7GdsleuEyCSYi9fUEd5LNe1oYqwBiKG2L//yzbKG5tZx+l9/Vteryx2QBBQ
 8B8Da5xf9ZCIbHU2KwAMT4Qr5tr25EZU4lPXbaBTdJWRXHD+h9ZK2vUYOtxVydSto7WgiUSRPw
 MN3i/wUPNdPKono3DCnVGnB0W7uSu2Xj005/YMUE4NHONdK8Vw1W5Hr8DIgsaJFBFUEM38Zb+E
 G8cnH1OWH/8aEB23ieO9Prr0PJAl3nFicIyicnlJl/ucJ9XnCYq3gsdr2IqEpBcwrM2+O//qj0
 Fk8=
X-SBRS: 2.7
X-MesageID: 25689174
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="25689174"
Subject: Re: [PATCH v1 0/6] tools/ocaml/xenstored: simplify code
To: Christian Lindig <christian.lindig@citrix.com>, Edwin Torok
 <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Ian Jackson <Ian.Jackson@citrix.com>, "dave@recoil.org" <dave@recoil.org>, 
 "wl@xen.org" <wl@xen.org>
References: <cover.1597439193.git.edvin.torok@citrix.com>
 <1597668966374.91968@citrix.com>
 <cbb2742191e9c1303fdfd95feef4d829ecf33a0d.camel@citrix.com>
 <1597742707142.74318@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cd17508f-b170-3e3c-d8d3-26e827f7492a@citrix.com>
Date: Tue, 18 Aug 2020 13:40:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597742707142.74318@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18/08/2020 10:25, Christian Lindig wrote:
> I see little reason to support old OCaml releases and requiring OCaml 4.06 would be fine with me but I assume that the project might have its own ideas about this.
>
> ________________________________________
> From: Edwin Torok
> Sent: 18 August 2020 08:28
> To: Christian Lindig; xen-devel@lists.xenproject.org
> Cc: Ian Jackson; dave@recoil.org; wl@xen.org
> Subject: Re: [PATCH v1 0/6] tools/ocaml/xenstored: simplify code
>
> On Mon, 2020-08-17 at 14:56 +0200, Christian Lindig wrote:
>> This all looks good - I left a small comment on one of the patches
>> and I agree that this needs testing. I also wonder about
>> compatibility with earlier OCaml releases that we support but I see
>> no real obstacles.
>>
> I've developed the series using OCaml 4.08.1. I think the newest
> feature I used was Map.update (OCaml 4.06, nearly 3 years ago).
> Looking through https://repology.org/project/ocaml/versions I'm not
> sure if we can require more than 4.05 though.
> The README in Xen doesn't specify a minimum version, but configure
> checks for >=4.02.
>
> I can try to backport my series to OCaml 4.05 (to use Map.find_opt
> instead of Map.update) and update the configure check to require 4.05.
> It would be possible to backport even further to 4.02 by introducing
> additional inefficiencies (Map.mem + Map.find would traverse the map
> twice, and Map.find on its own would raise an exception on Not found,
> which is more costly than returning None in Map.find_opt), I'd avoid
> doing that.
>
> Xen's CI from automation might need some updates to use latest stable
> versions:
> * Fedora 29 is EOL, should use at least Fedora 31
> * Debian Jessie is EOL. Stretch is present, but Buster is missing

We're working on the CI loop.

As maintainer, it is ultimately Christian's choice to as to if/when to
bump the minimum versions.


As a general rule, we don't want to be sufficiently bleeding edge to
rule out in-use distros.  I have no idea if 4.06 is ok there, or whether
it is too new.  Then again, the Ocaml components are strictly optional
so it is perhaps less important.

Whatever happens WRT version, the configure change should occur before
changes in the code which would fail on older versions.

~Andrew

