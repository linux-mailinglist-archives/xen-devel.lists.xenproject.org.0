Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6BE2481D6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 11:25:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7xrm-0007TA-6b; Tue, 18 Aug 2020 09:25:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DvGD=B4=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1k7xrk-0007T4-Pq
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 09:25:12 +0000
X-Inumbo-ID: 5f8fafd6-0d38-4c6b-a902-9a715006a26e
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f8fafd6-0d38-4c6b-a902-9a715006a26e;
 Tue, 18 Aug 2020 09:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597742712;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G9lIqK0m3KX1PEu14IKt8NFJ88sL3Tn29FbUFB22r/E=;
 b=AH/hAGRKMp9sa5ODaUgPCGlbVqgTVkZJ2O5/HNhg7fMbwGj9QizRCFP9
 ZVRRP0GjX+yj8PMKDGTygqq7oN4CfRnn2db0m3eXGeyFKEiupbYe8i0Bw
 hAjyX1JdhFv8+PjKy95U8j2e7Itvut9Y1qtfrtnp78B1l5MHt/GMKNU1r E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: BYjaYox372jwQM1C2eyXdlCYXKmUhx5s6YX1pkuDEmzEiSNObLytBIGEV992rvx+wX0MtLKMcb
 Ul86xYgPnxe8/xkHFzWA6H1gWFwJwhM6tO4t5gRXxQs7iufU1HbzObz1y6FmZNIJMkb3iLOI5Y
 bXsMUtsVfvDx0siSaM2HqbU/xhNxSzlBPZ+acPT55nc8byYaNbD2etgIjtJwReikzFjt3+KGag
 cR/+tZ9jHISR6GGaQWJl80rmGenRIzOC+uHo6LRprXhoyjy14Bb3qJs9b5eOIapmRGVYYj4eWg
 ni8=
X-SBRS: 2.7
X-MesageID: 24735556
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,326,1592884800"; d="scan'208";a="24735556"
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: Ian Jackson <Ian.Jackson@citrix.com>, "dave@recoil.org" <dave@recoil.org>, 
 "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v1 0/6] tools/ocaml/xenstored: simplify code
Thread-Topic: [PATCH v1 0/6] tools/ocaml/xenstored: simplify code
Thread-Index: AQHWcof9CyuGFmlmrU+YP676eBh39Kk8RbglgAEV8ACAAEGz3g==
Date: Tue, 18 Aug 2020 09:25:07 +0000
Message-ID: <1597742707142.74318@citrix.com>
References: <cover.1597439193.git.edvin.torok@citrix.com>
 <1597668966374.91968@citrix.com>,
 <cbb2742191e9c1303fdfd95feef4d829ecf33a0d.camel@citrix.com>
In-Reply-To: <cbb2742191e9c1303fdfd95feef4d829ecf33a0d.camel@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

I see little reason to support old OCaml releases and requiring OCaml 4.06 =
would be fine with me but I assume that the project might have its own idea=
s about this.=0A=
=0A=
________________________________________=0A=
From: Edwin Torok=0A=
Sent: 18 August 2020 08:28=0A=
To: Christian Lindig; xen-devel@lists.xenproject.org=0A=
Cc: Ian Jackson; dave@recoil.org; wl@xen.org=0A=
Subject: Re: [PATCH v1 0/6] tools/ocaml/xenstored: simplify code=0A=
=0A=
On Mon, 2020-08-17 at 14:56 +0200, Christian Lindig wrote:=0A=
> This all looks good - I left a small comment on one of the patches=0A=
> and I agree that this needs testing. I also wonder about=0A=
> compatibility with earlier OCaml releases that we support but I see=0A=
> no real obstacles.=0A=
>=0A=
=0A=
I've developed the series using OCaml 4.08.1. I think the newest=0A=
feature I used was Map.update (OCaml 4.06, nearly 3 years ago).=0A=
Looking through https://repology.org/project/ocaml/versions I'm not=0A=
sure if we can require more than 4.05 though.=0A=
The README in Xen doesn't specify a minimum version, but configure=0A=
checks for >=3D4.02.=0A=
=0A=
I can try to backport my series to OCaml 4.05 (to use Map.find_opt=0A=
instead of Map.update) and update the configure check to require 4.05.=0A=
It would be possible to backport even further to 4.02 by introducing=0A=
additional inefficiencies (Map.mem + Map.find would traverse the map=0A=
twice, and Map.find on its own would raise an exception on Not found,=0A=
which is more costly than returning None in Map.find_opt), I'd avoid=0A=
doing that.=0A=
=0A=
Xen's CI from automation might need some updates to use latest stable=0A=
versions:=0A=
* Fedora 29 is EOL, should use at least Fedora 31=0A=
* Debian Jessie is EOL. Stretch is present, but Buster is missing=0A=
=0A=
Best regards,=0A=
--Edwin=0A=

