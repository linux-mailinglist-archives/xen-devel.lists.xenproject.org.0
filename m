Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF64694F4C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 22:47:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzoWC-0007sw-HJ; Mon, 19 Aug 2019 20:44:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4zt0=WP=tycho.nsa.gov=dgdegra@srs-us1.protection.inumbo.net>)
 id 1hzoWA-0007sq-F6
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 20:44:43 +0000
X-Inumbo-ID: 28c8d726-c2c2-11e9-b90c-bc764e2007e4
Received: from UCOL19PA39.eemsg.mail.mil (unknown [214.24.24.199])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28c8d726-c2c2-11e9-b90c-bc764e2007e4;
 Mon, 19 Aug 2019 20:44:38 +0000 (UTC)
X-EEMSG-check-017: 11510855|UCOL19PA39_ESA_OUT06.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.64,406,1559520000"; d="scan'208";a="11510855"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
 by UCOL19PA39.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 19 Aug 2019 20:44:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1566247476; x=1597783476;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=/GCDgV+s78G/GuemHQexjev/TdW4EIA3I1Ze4W/TG2g=;
 b=lEuYC/Rt4JFNvey+brkzXkpPX5jdjH/qTKTxm4Djy0u3YbrXNrvkMg6b
 e45xB/a2EN8EMFykQN4qoITzVzGHdfuWHJCpKJQ1AGBPUmhfS2RVRSTj6
 1hSanpVM3YT7U5OtkVBDxsxnMS9bSzCBGao3fH/seZKMtHvmj0S/WAyj3
 vY1AzQW2csXCsZ/zxyZK31nIwP898F1I2BWqiHDAGCADTNG9xPJe9GnJQ
 9tLTRgT0GBhfhCPSDAFuwkjbE8uaYJjGesjrHjTv9yePTpxPIsLwztIcD
 I8orGvmdjPvINKhmthAfuGg6oseksTrJGNLlfE4UyTkM/2H4LbNmx26AQ A==;
X-IronPort-AV: E=Sophos;i="5.64,406,1559520000"; d="scan'208";a="31670707"
IronPort-PHdr: =?us-ascii?q?9a23=3AxZpHGRRSU5Obbmd1SCMzLnJRydpsv+yvbD5Q0Y?=
 =?us-ascii?q?Iujvd0So/mwa67YRSFt8tkgFKBZ4jH8fUM07OQ7/m6HzVbsN3Y7SpKWacPfi?=
 =?us-ascii?q?dNsd8RkQ0kDZzNImzAB9muURYHGt9fXkRu5XCxPBsdMs//Y1rPvi/6tmZKSV?=
 =?us-ascii?q?3wOgVvO+v6BJPZgdip2OCu4Z3TZBhDiCagbb9oIxi6sBvdutMLjYZsLqs9xQ?=
 =?us-ascii?q?bFr3tWd+9L2W5mOFWfkgrm6Myt5pBj6SNQu/wg985ET6r3erkzQKJbAjo7LW?=
 =?us-ascii?q?07/dXnuhbfQwSB4HscSXgWnQFTAwfZ9hH6X4z+vTX8u+FgxSSVJ8z2TbQzWT?=
 =?us-ascii?q?S/86dmTQLjhSkbOzIl9mzcl9d9h7xHrh2/uxN/wpbUYICLO/p4YqPdZs4RSW?=
 =?us-ascii?q?5YUspMSyBNHoawYo0BAOobOeZTspfzqV0AoxCjAQWgHe3ixztNinLwwKY00f?=
 =?us-ascii?q?kuERve0QI9AdwOvnTarNL2OqkcX++6w6vHwinMYf5NxTfw65LFfgw9rfyCX7?=
 =?us-ascii?q?99d9fax0k1FwPCi1WdsYLrMCmT1uQMrWeb6/drW+yxhGU6qg9xuCKgyd0iio?=
 =?us-ascii?q?LUgY8a11/E+jhnz4Y6P923UlV2YcKkEZRMtyGaMJF6QsU5Q25yoio6xboGuY?=
 =?us-ascii?q?CicSUM1Z8pxAbfZuSaf4WH7R/vTuacLSpiiH57d7+zmQy+/VWmx+bhTMe7yk?=
 =?us-ascii?q?xKoTBAktTUs3AN0AHc5dafR/tm+0ehxS6P1wfO6uFYOUw0lbTUK5omwrMoip?=
 =?us-ascii?q?ocq17DHi7rmEXtlqOWakUl9fSo6+TgeLnmoIOTN5RohQ3kN6Qum8i/Dfw5Mg?=
 =?us-ascii?q?gIQWeb5fyx2KDs8ED2WrlHjuA6nrPHvJ3VO8gXvLO1DxdQ0ok56ha/Czmm0M?=
 =?us-ascii?q?4fnXkCNF9KZR2HgJX3NFHBOvD3F+yyg0iskTh3x/DGOaftApPWLnfZirvhcr?=
 =?us-ascii?q?F961BExAop0d9f/45UCq0GIP/rQk/+rsHYDhsjPwOp3ubnEs992ZkYWWKTGa?=
 =?us-ascii?q?KWLKLSsUOS5uIuLOiAfpMauDH4K/I9/f7hkWc5mUMBfamuxZYWZ263HvJ/L0?=
 =?us-ascii?q?qEf3XsnMkOEWMRswo6Tezqk0GCUSVJa3e9Qa084Ck7CJihDYfBWI+inKCB0D?=
 =?us-ascii?q?28Hp1MaWBMEkqMHmvwd4WYR/cMbzqfItVmkjwLS7ehUZUt1Qm0uw/n0LdoMu?=
 =?us-ascii?q?vU+jECtZLi29l5/fHclRY39TZsFcSSz3mNT31onmMPXzI43b5woUtnyleMz6?=
 =?us-ascii?q?d0mfJWFcFV5/NNSAg6LYXRwPJnC9zoRg3Bf8uJSEynQtSpGz0+UtUxw9oWaU?=
 =?us-ascii?q?ZnB9qilgzD3zatA7INjbOLAoE78rjC0Hn/Pcpy13HG1K45j1Y4WMtCO3arib?=
 =?us-ascii?q?J+9wjPHY7JkkqYm7y2eqQb2S7H7H2DwnaWvEFETA5wVr3IXXEFaUvQt9j55F?=
 =?us-ascii?q?nNQKOtCbQ8NQtBz9WPJbVXatHzkVpGRevjOM7fY2O+gWu/GRGIxraUZorwZ2?=
 =?us-ascii?q?odxDndCFQDkw0L/3aJLhYxBjqlo2LfEDNuFUniY1jx8elltny3VFM7zwaPb0?=
 =?us-ascii?q?d5zbq65gYVheCAS/MUxr8EujohqzF1HFmj2dLaEdWApxB7c6VYZdMw+01I1X?=
 =?us-ascii?q?jctwBnIpOgKKVijEYEcwtrp0Puywl3CoJYnMgpq3MqyhByJriF319beTKY3J?=
 =?us-ascii?q?TwOr7MJ2n15hCgcbLZ2lXA39qM5qgP7/E4oU35vA61Dkoi72ln095N3nuH/Z?=
 =?us-ascii?q?XKEBAdXonvXUYz8xh6prfaYigm6oPXy3JsK6+0vSHG294zA+sl0Bmgdc9FMK?=
 =?us-ascii?q?yYDA/yD9EaB8+2Jew2mlipawkJPe9M+64yJc+mcOGG2KGzNuZ6gD2mlXhH4J?=
 =?us-ascii?q?x60k+U+St8TvXF3pkbzPGexAeHUC38jFjy+vzwzLhNeDVaMnel0yHiGMYFfq?=
 =?us-ascii?q?RvecAHFH20Ksur7t5/m4TsSzhT81v1QxsW1cnsdReMYljV2QxLyV9RsXGhgT?=
 =?us-ascii?q?G/zTF/j3cutKXM8jbJxrHOfRwGN2oDaGQqok3lKIb829wVUEWndQEBiAqu5U?=
 =?us-ascii?q?G8wbNS4qt4MT+AEg9zYyHqIjQ6AeOLvb2YbpsKsch5vA=3D=3D?=
X-IPAS-Result: =?us-ascii?q?A2ATBABDCVtd/wHyM5BmHAEBAQQBAQcEAQGBZ4FuKoE/M?=
 =?us-ascii?q?iqEH48QgWItj02LQQkBAQEBAQEBAQE0AQIBAYQ/AoMmIzgTAgUBAQEEAQEBA?=
 =?us-ascii?q?QEGAwEBbIUzgjopAYJnAQUjDwEFQRALGAICJgICVwYBDAYCAQGCXz+CC6s9g?=
 =?us-ascii?q?TKFSIMugUmBDCiLaREGgX+BOIJrPodPglgEjmCccQmCH5QzBhuCIQGWIi2NL?=
 =?us-ascii?q?ZoaIYFYKwoYKQ+DJ5EjIwMwAYEFAQGNeAEB?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
 by emsm-gh1-uea11.NCSC.MIL with ESMTP; 19 Aug 2019 20:44:35 +0000
Received: from moss-nexus.infosec.tycho.ncsc.mil (moss-nexus [192.168.25.48])
 by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id
 x7JKiWkk026667; Mon, 19 Aug 2019 16:44:32 -0400
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-5-paul.durrant@citrix.com>
From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Organization: National Security Agency
Message-ID: <3d9bbc33-175f-48a2-7ab4-5157fba4ed3a@tycho.nsa.gov>
Date: Mon, 19 Aug 2019 16:44:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190816172001.3905-5-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 04/10] domain: remove the 'is_xenstore'
 flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNi8xOSAxOjE5IFBNLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gVGhpcyBwYXRjaCBpbnRy
b2R1Y2VzIGEgY29udmVuaWVuY2UgbWFjcm8sIGlzX3hlbnN0b3JlX2RvbWFpbigpLCB3aGljaAo+
IHRlc3RzIHRoZSBkb21haW4gJ29wdGlvbnMnIGRpcmVjdGx5IGFuZCB0aGVuIHVzZXMgdGhhdCBp
biBwbGFjZSBvZgo+IHRoZSAnaXNfeGVuc3RvcmUnIGZsYWcuCj4gCj4gU2lnbmVkLW9mZi1ieTog
UGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogIlJv
Z2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBBY2tlZC1ieTogR2Vvcmdl
IER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgoKQWNrZWQtYnk6IERhbmllbCBE
ZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292PgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
