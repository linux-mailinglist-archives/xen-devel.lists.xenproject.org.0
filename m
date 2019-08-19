Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5EA94C58
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 20:07:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzm1h-0002As-J5; Mon, 19 Aug 2019 18:05:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ecZk=WP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hzm1g-0002Am-3c
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 18:05:04 +0000
X-Inumbo-ID: ddd1b7da-c2ab-11e9-a661-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddd1b7da-c2ab-11e9-a661-bc764e2007e4;
 Mon, 19 Aug 2019 18:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566237903;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=X01UcwsCupQhIHAsCbHjh6id4Ti3ZscvKTSl1g5E86A=;
 b=UjTjGYOIgtdsxU62H0rJvvyEZQ3CglZY40wUgxQ75genwNrXtlt93/v9
 RsdNTarD1+5fXeStwOCeMtDzL3Z0WqI4h4z1tOQK4S4US/ZIMCp0Tyitr
 +PHStW2lRfEMSBT8PzvQ18eJKI/kMVB3bzkfwvgR+CtirfXL7cdN4PtWH w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ryWcrB/cAzB1N/WOtQmbNyHlAd5TuDURnHGis07rfDPMKpBCPYfloT9Pn1oiWjEAtlHZZuZrPT
 QYanL/8xfGRd6vurE3iZ6zscgjsmMaCaRsHYCICreLidvLqh/M3cJLvn5KP2eU3Fjc6cGaqwC5
 BQQ7b3wLB3dC1eBqaj+cyA5eaHqCuTctMdh4lAsLSECVhlHM+Bn0KtNqgze9A38p04ebtT0sge
 /VvPwTsT/DZkPyAOb1Oui1O3fjRIz7XITDMbDqndRybB7eBPJLWQZmTCp2189hLgi/bcRavNA3
 KBE=
X-SBRS: 2.7
X-MesageID: 4613209
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,405,1559534400"; 
   d="scan'208";a="4613209"
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <20190819180125.17504-1-julien.grall@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ddf69b87-e6f3-689a-17c6-84b00af7d475@citrix.com>
Date: Mon, 19 Aug 2019 19:04:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819180125.17504-1-julien.grall@arm.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/console: Fix build when
 CONFIG_DEBUG_TRACE=y
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDgvMjAxOSAxOTowMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENvbW1pdCBiNWU2ZTFl
ZThkYSAieGVuL2NvbnNvbGU6IERvbid0IHRyZWF0IE5VTCBjaGFyYWN0ZXIgYXMgdGhlIGVuZAo+
IG9mIHRoZSBidWZmZXIiIGV4dGVuZGVkIHNlcmNvbl9wdXRzIHRvIHRha2UgdGhlIG51bWJlciBv
ZiBjaGFyYWN0ZXIKPiB0byBwcmludCBpbiBhcmd1bWVudC4KPgo+IFNhZGx5LCBhIGNvdXBsZSBv
ZiBjb3VwbGUgb2YgdGhlIGNhbGxlcnMgaW4gZGVidWd0cmFjZV9kdW1wX3dvcmtlcigpCj4gd2Vy
ZSBub3QgY29udmVydGVkLiBUaGlzIHJlc3VsdCB0byBhIGJ1aWxkIGZhaWx1cmUgd2hlbiBlbmFi
bGluZwo+IENPTkZJR19ERUJVR19UUkFDRS4KPgo+IFNwb3R0ZWQgYnkgVHJhdmlzIHVzaW5nIHJh
bmRjb25maWcKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgo+IC0tLQo+ICB4ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyB8IDUgKysrLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29s
ZS5jCj4gaW5kZXggMmMxNGMyY2E3My4uOTI0ZDQ5NzFjYSAxMDA2NDQKPiAtLS0gYS94ZW4vZHJp
dmVycy9jaGFyL2NvbnNvbGUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4g
QEAgLTExODUsMTEgKzExODUsMTIgQEAgc3RhdGljIHZvaWQgZGVidWd0cmFjZV9kdW1wX3dvcmtl
cih2b2lkKQo+ICAKPiAgICAgIC8qIFByaW50IG9sZGVzdCBwb3J0aW9uIG9mIHRoZSByaW5nLiAq
Lwo+ICAgICAgQVNTRVJUKGRlYnVndHJhY2VfYnVmW2RlYnVndHJhY2VfYnl0ZXMgLSAxXSA9PSAw
KTsKPiAtICAgIHNlcmNvbl9wdXRzKCZkZWJ1Z3RyYWNlX2J1ZltkZWJ1Z3RyYWNlX3ByZF0pOwo+
ICsgICAgc2VyY29uX3B1dHMoJmRlYnVndHJhY2VfYnVmW2RlYnVndHJhY2VfcHJkXSwKPiArICAg
ICAgICAgICAgICAgIHN0cmxlbigmZGVidWd0cmFjZV9idWZbZGVidWd0cmFjZV9wcmRdKSk7CgpJ
c24ndCB0aGlzIGp1c3QgZGVidWd0cmFjZV9ieXRlcyAtIGRlYnVndHJhY2VfcHJkIC0gMSA/Cgp+
QW5kcmV3Cgo+ICAKPiAgICAgIC8qIFByaW50IHlvdW5nZXN0IHBvcnRpb24gb2YgdGhlIHJpbmcu
ICovCj4gICAgICBkZWJ1Z3RyYWNlX2J1ZltkZWJ1Z3RyYWNlX3ByZF0gPSAnXDAnOwo+IC0gICAg
c2VyY29uX3B1dHMoJmRlYnVndHJhY2VfYnVmWzBdKTsKPiArICAgIHNlcmNvbl9wdXRzKCZkZWJ1
Z3RyYWNlX2J1ZlswXSwgZGVidWd0cmFjZV9wcmQpOwo+ICAKPiAgICAgIG1lbXNldChkZWJ1Z3Ry
YWNlX2J1ZiwgJ1wwJywgZGVidWd0cmFjZV9ieXRlcyk7Cj4gIAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
