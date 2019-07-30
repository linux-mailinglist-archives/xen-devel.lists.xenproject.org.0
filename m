Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C567AD7F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 18:27:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsUuJ-0001p7-CS; Tue, 30 Jul 2019 16:23:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x3jf=V3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hsUuH-0001p2-RB
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 16:23:21 +0000
X-Inumbo-ID: 56fcd638-b2e6-11e9-a7d0-ffa9bc110d9d
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56fcd638-b2e6-11e9-a7d0-ffa9bc110d9d;
 Tue, 30 Jul 2019 16:23:18 +0000 (UTC)
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
IronPort-SDR: l/E71SuqYY6hCuHPj7yJ2T0q9oMDHpgbIB63/HJ1v03lxkM0wh0k7VIJ1xlypnxj7S/mZgbBy7
 fqNhRZR8gqUYfdjpHeP1esyuEufS0uJhyJHvK4lERmnf4qfQ4gqjgZMpwb4EcqJ0crEDZxtaaZ
 wSCqkA9QErRZkCL05vJm+5dJP7FuoWEvASPsaW3ACF31U61Uwr1C4f0lQKzmIE+51s7V9dMFHp
 n428fxvIGEAF5683p2ex6qO0BnZZDuSFtfeqI4Kx2Xrpd20n+mJWwO8feizzYcu/AGKuoqGWMf
 Z74=
X-SBRS: 2.7
X-MesageID: 3735699
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,327,1559534400"; 
   d="scan'208";a="3735699"
To: Jan Beulich <JBeulich@suse.com>, "christopher.w.clark@gmail.com"
 <christopher.w.clark@gmail.com>
References: <20190725005326.3553-1-christopher.w.clark@gmail.com>
 <6166d236-b3ae-e3d6-3a3c-101063d07701@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <5e1fadcd-e383-3142-e39b-56bae19c87fb@citrix.com>
Date: Tue, 30 Jul 2019 17:23:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6166d236-b3ae-e3d6-3a3c-101063d07701@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] tests/cpu-policy: fix format-overflow
 warning by null terminating strings
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDcvMjAxOSAxNjo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjUuMDcuMjAxOSAw
Mjo1MywgY2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20gd3JvdGU6Cj4+IEZyb206IENocmlz
dG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4KPj4KPj4gZ2NjIDku
MS4wIHJlcG9ydHM6Cj4+Cj4+IHwgdGVzdC1jcHUtcG9saWN5LmM6NjQ6MTg6IGVycm9yOiAnJS4x
MnMnIGRpcmVjdGl2ZSBhcmd1bWVudCBpcyBub3QgYSBudWwtdGVybWluYXRlZCBzdHJpbmcgWy1X
ZXJyb3I9Zm9ybWF0LW92ZXJmbG93PV0KPj4gfCAgICA2NCB8ICAgICAgICAgICAgIGZhaWwoIiAg
VGVzdCAnJS4xMnMnLCBleHBlY3RlZCB2ZW5kb3IgJXUsIGdvdCAldVxuIiwKPj4gfCAgICAgICB8
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fgo+PiB8IHRlc3QtY3B1LXBvbGljeS5jOjIwOjEyOiBub3RlOiBpbiBkZWZpbml0aW9u
IG9mIG1hY3JvICdmYWlsJwo+PiB8ICAgIDIwIHwgICAgIHByaW50ZihmbXQsICMjX19WQV9BUkdT
X18pOyAgICAgICAgICAgICAgICAgXAo+PiB8ICAgICAgIHwgICAgICAgICAgICBefn4KPj4gfCB0
ZXN0LWNwdS1wb2xpY3kuYzo2NDoyNzogbm90ZTogZm9ybWF0IHN0cmluZyBpcyBkZWZpbmVkIGhl
cmUKPj4gfCAgICA2NCB8ICAgICAgICAgICAgIGZhaWwoIiAgVGVzdCAnJS4xMnMnLCBleHBlY3Rl
ZCB2ZW5kb3IgJXUsIGdvdCAldVxuIiwKPj4gfCAgICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn4KPj4gfCB0ZXN0LWNwdS1wb2xpY3kuYzo0NDo3OiBub3RlOiByZWZlcmVuY2Vk
IGFyZ3VtZW50IGRlY2xhcmVkIGhlcmUKPj4gfCAgICA0NCB8ICAgICB9IHRlc3RzW10gPSB7Cj4+
IHwgICAgICAgfCAgICAgICBefn5+fgo+IEluIG9yZGVyIHRvIHBvc3NpYmx5IGNyZWF0ZSBhIGJ1
ZyByZXBvcnQgYWdhaW5zdCBnY2MgSSd2ZSB0cmllZCB0aGlzOgo+Cj4gI2luY2x1ZGUgPHN0ZGlv
Lmg+Cj4KPiBzdHJ1Y3QgcyB7Cj4gCWNoYXIgYWNbMTJdOwo+IAlpbnQgaTsKPiB9Owo+Cj4gdm9p
ZCB0ZXN0KGNvbnN0IHN0cnVjdCBzKnBzKSB7Cj4gCXByaW50ZigiJyUuMTJzJ1xuIiwgcHMtPmFj
KTsKPiB9Cj4KPiBUaGVyZSdzIG5vIHdhcm5pbmcgaGVyZS4gQ291bGQgeW91IGNoZWNrIHdoZXRo
ZXIgdGhlIGNvbXBpbGVyIHdhcm5zIG9uCj4gdGhhdCBzaW1wbGUgdGVzdCBmb3IgeW91PyBJZiBp
dCBkb2VzIC0gYXJlIHdlIHRhbGtpbmcgYWJvdXQgcGxhaW4KPiB1cHN0cmVhbSA5LjEuMCAoaW4g
d2hpY2ggY2FzZSBJJ2QgYmUgcmVhbGx5IHB1enpsZWQgYnkgdGhlIGRpZmZlcmVuY2UKPiBpbiBi
ZWhhdmlvcik/CgpDQyBEYXJpbyB3aG8gYWxzbyByZXBvcnRlZCB0aGlzIGJ1aWxkIGZhaWx1cmUu
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
