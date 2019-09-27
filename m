Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49D9C0D49
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 23:32:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDxmC-00089l-Jn; Fri, 27 Sep 2019 21:27:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FMTt=XW=tycho.nsa.gov=dgdegra@srs-us1.protection.inumbo.net>)
 id 1iDxmA-00089g-Ij
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 21:27:43 +0000
X-Inumbo-ID: a1347d0f-e16d-11e9-9684-12813bfff9fa
Received: from USFB19PA34.eemsg.mail.mil (unknown [214.24.26.197])
 by localhost (Halon) with ESMTPS
 id a1347d0f-e16d-11e9-9684-12813bfff9fa;
 Fri, 27 Sep 2019 21:27:40 +0000 (UTC)
X-EEMSG-check-017: 12673366|USFB19PA34_ESA_OUT04.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.64,557,1559520000"; d="scan'208";a="12673366"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
 by USFB19PA34.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 27 Sep 2019 21:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1569619657; x=1601155657;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qFQudubHmS6q0TMG697WkB9xW0lNRlnvCtP90KmRxeg=;
 b=o9TwzJkWNjGXTLWJ7g5q+Xn+fCxtfsRO1CqoLIipJYRW9E10vsqrTaSZ
 lCbcZU7VDOxVNxSBROzIi32Xyfre+8w/ig8iM6IUrJJpwRsYYJYmj5sJa
 MqFhrTvG53yutn7hY1UMlTah2HBrDpue8x4mcnVzG678SEcvW5flaslmZ
 2Bf+cJaY4wL2oFM0NcVepB5by/8UfKf2U/n0t1wM/wZYCi+3qoHhGzkV+
 QJL0TNm7/VRH6dmAoZf7tM0pRprqKBH21wy3hKIwn54k5pEDz6feBKuw4
 7zEiUE9w+iws1n62qoc8HnCdSwITmukBYys381Y92P4LlDSvhjFtLONZQ g==;
X-IronPort-AV: E=Sophos;i="5.64,557,1559520000"; d="scan'208";a="33473184"
IronPort-PHdr: =?us-ascii?q?9a23=3AP2AZXBdsgM5/oGe9Q/jk6V6ClGMj4u6mDksu8p?=
 =?us-ascii?q?Mizoh2WeGdxc26ZxON2/xhgRfzUJnB7Loc0qyK6vumAjJLuMve+Fk5M7V0Hy?=
 =?us-ascii?q?cfjssXmwFySOWkMmbcaMDQUiohAc5ZX0Vk9XzoeWJcGcL5ekGA6ibqtW1aFR?=
 =?us-ascii?q?rwLxd6KfroEYDOkcu3y/qy+5rOaAlUmTaxe7x/IAi4oAnLuMQbgIRuJrsxxx?=
 =?us-ascii?q?bLv3BFZ/lYyWR0KFyJgh3y/N2w/Jlt8yRRv/Iu6ctNWrjkcqo7ULJVEi0oP3?=
 =?us-ascii?q?g668P3uxbDSxCP5mYHXWUNjhVIGQnF4wrkUZr3ryD3q/By2CiePc3xULA0RT?=
 =?us-ascii?q?Gv5LplRRP0lCsKMSMy/XrJgcJskq1UvBOhpwR+w4HKZoGVKOF+db7Zcd8DWG?=
 =?us-ascii?q?ZNQtpdWylHD4yydYsPC/cKM/heoYfzulACqQKyCAeoCe/qzDJDm3340rAg0+?=
 =?us-ascii?q?k5DA/IwgIgEdIJsHrXotv6OqgdXuKpw6fH1jjDc/Fb1C3h5ITUfB0so/eBVq?=
 =?us-ascii?q?9wf8rLzkkvEhvIgFuKpozjPjOayOANuHWV4eV+SOmhinQnpBtrrTih28whjZ?=
 =?us-ascii?q?TGho0IxV/a+iV52pw6KMakSE97fdGkEJxQuzucN4ttWMwuWW5ouCEkyrAfv5?=
 =?us-ascii?q?OwYSsEyIw/yhLCZPGKfJKE7xL+WOqLPzt1i2xpdKiiixu07EOu0PfzVtOu31?=
 =?us-ascii?q?ZPtidFl97MuW0T2BHL8ciHT+d9/l+m2TaSywDf8uFELl4wlarcM5Mh3qQ/lo?=
 =?us-ascii?q?ASsUTeBS/6gln2ja+KeUUk/eik8eLnban9ppCALYN0jwD+MqA2lsy+B+Q3LB?=
 =?us-ascii?q?QOUnCG9emz27Dv5030TKhQgvEonaTVrorWKdkDqq68GQBV04Ij6xilDzeh1d?=
 =?us-ascii?q?QVhWQILF1Ydx2ZgIjpIUvBLevkDfa/n1uskDBry+rAPr36GJrBNHfDkLD/fb?=
 =?us-ascii?q?pl8U5T1BIzzcxD55JTErwBJ/bzVVX/tNHDFBA2LRS0w+jjCNpjzI8RRHyACL?=
 =?us-ascii?q?eDMKzOqV+I+v4vI+6UaY4apjn9LeEp6OPwgn8nh1AdebKk3Z8WaHCjAvRmOF?=
 =?us-ascii?q?+VYHXyjdcHCWcKpA0+TO70h1KeTT5ffXGyX7gz5jsjEoKpEZ/DRpyxgLyGxC?=
 =?us-ascii?q?q7B4BWaXpAClyWHnboapmIVuwDaCKXOMBhkzgEWaK9RI8m0BGkrBX6xKZ/Lu?=
 =?us-ascii?q?rI5i0Ysoru1MNv6O3WiBE96zh0A96B02GNTmF7hXkHRyIy3KBjukFy1FGD0b?=
 =?us-ascii?q?Nhj/xcFd1T4PVJXh09NZ7GwOwpQ+z1DyXFd9nBaFu8Q9OpSWU2Sts/69YDe0?=
 =?us-ascii?q?h5FpOug0aHlzqnBfoZmqKGALQw87nAxD7hKsBl0XHE2aI9yV48TZhhL2qj04?=
 =?us-ascii?q?J28QneA8blng22ja+je+xI0CHB+WiZxEKSrUpYV0h2SqyDUncBMBiF5e/l71?=
 =?us-ascii?q?/PGuf9QY8sNRFMnIvbcfpH?=
X-IPAS-Result: =?us-ascii?q?A2ANAgAkfo5d/wHyM5BmGwEBAQEDAQEBDAMBAQGBZ4F0K?=
 =?us-ascii?q?oFAMiqEIpB+mx8JAQEBAQEBAQEBNAECAQGEQAKDNyM4EwIMAQEBBAEBAQEBB?=
 =?us-ascii?q?QMBAWyFOYI6KQGCaAEFIxVBEAsYAgImAgJXBgEMBgIBAYJfP4ILri2BMoVNg?=
 =?us-ascii?q?zqBSIEMKIwOEgaBf4E4gms+h0+CWASWCpcNgiyVBQYbgieXDY4hmy8hgVgrC?=
 =?us-ascii?q?hgpD4MnUBAUggaOKSUDMIEGAQGOPQEB?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
 by emsm-gh1-uea11.NCSC.MIL with ESMTP; 27 Sep 2019 21:27:35 +0000
Received: from moss-nexus.infosec.tycho.ncsc.mil (moss-nexus [192.168.25.48])
 by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id
 x8RLRWaf005382; Fri, 27 Sep 2019 17:27:33 -0400
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
References: <20190924140319.11303-1-olaf@aepfle.de>
 <20190924140319.11303-2-olaf@aepfle.de>
From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Organization: National Security Agency
Message-ID: <4d4938a5-f808-feaa-c3f3-b8b89ed460c1@tycho.nsa.gov>
Date: Fri, 27 Sep 2019 17:27:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190924140319.11303-2-olaf@aepfle.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RESEND v1 1/8] stubdom/vtpm: include stdio.h
 for declaration of printf
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Quan Xu <quan.xu0@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yNC8xOSAxMDowMyBBTSwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gVGhlIGZ1bmN0aW9uIHJl
YWRfdnRwbWJsayB1c2VzIHByaW50ZigzKSwgYnV0IHN0ZGlvLmggaXMgbm90IGluY2x1ZGVkCj4g
aW4gdGhpcyBmaWxlLiBUaGlzIHJlc3VsdHMgaW4gYSB3YXJuaW5nIGZyb20gZ2NjLTc6Cj4gCj4g
dnRwbWJsay5jOiBJbiBmdW5jdGlvbiAncmVhZF92dHBtYmxrJzoKPiB2dHBtYmxrLmM6MzIyOjc6
IHdhcm5pbmc6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdwcmludGYnIFstV2lt
cGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgICAgICAgcHJpbnRmKCJFeHBlY3RlZDog
Iik7Cj4gdnRwbWJsay5jOjMyMjo3OiB3YXJuaW5nOiBpbmNvbXBhdGlibGUgaW1wbGljaXQgZGVj
bGFyYXRpb24gb2YgYnVpbHQtaW4gZnVuY3Rpb24gJ3ByaW50ZicKPiB2dHBtYmxrLmM6MzIyOjc6
IG5vdGU6IGluY2x1ZGUgJzxzdGRpby5oPicgb3IgcHJvdmlkZSBhIGRlY2xhcmF0aW9uIG9mICdw
cmludGYnCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgpB
Y2tlZC1ieTogRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
