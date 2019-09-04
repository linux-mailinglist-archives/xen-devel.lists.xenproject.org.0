Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49869A8118
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 13:32:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5TTE-0005m0-Uw; Wed, 04 Sep 2019 11:29:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zWnQ=W7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i5TTC-0005lT-J4
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 11:29:02 +0000
X-Inumbo-ID: 3128155c-cf07-11e9-b299-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3128155c-cf07-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 11:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567596542;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=KGOXxefXGwoDextUEmdeE5nUCF/LC/2brRQEs0ynN0U=;
 b=Kec43J6C+Dic8DY8/alRUMufxPsBryXYpVOQttmSUXcgj4Ke8m6vhATS
 8YN2VALRy6AMJC0BVZh9j85ZLDQ2XoFXiE57mN6tpXr251qK/fWJBegu1
 gLVxyYXwUxIzMLL9ksxTWOUcp031r4Uu7e6t4dEnrnXpi+gVBVrid77QP s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7DJ3jm/wbYTrdcYlPqXQkoiqOu7RipLJnW/QoYr3lfl02j+0NXEy93ZEAqTE9E59ZdyxK6HMqQ
 9PdnGV+SOlSQSswSOQhLcsZGAgwCayRhrznfAf80UhvqcoIg06QsK75sgHU1nz2KMaDinKLmAy
 5WKECxDKIE70CbE4FkBA/d8rbUWjIAgo7LxbMM5cvR+sEPGez6wuKvlLjPD4AnnZInLQrJe4pY
 CClXCcFKKLrsvSgn8l9GH06EmoKVNhx7misET4sbO1AO0mB6Ch61Wu/kPQrutlxODpCpTaBiU9
 gMs=
X-SBRS: 2.7
X-MesageID: 5111163
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,465,1559534400"; 
   d="scan'208";a="5111163"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <23892a29-60ef-b1e4-9e19-024559e0d2a0@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <8cca5d7f-5a6b-0826-b15d-2a5f42d1a3f2@citrix.com>
Date: Wed, 4 Sep 2019 12:28:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23892a29-60ef-b1e4-9e19-024559e0d2a0@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/shadow: don't enable shadow mode with
 too small a shadow allocation (part 2)
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDkvMjAxOSAwODo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQ29tbWl0IDI2MzRiOTk3
YWYgKCJ4ODYvc2hhZG93OiBkb24ndCBlbmFibGUgc2hhZG93IG1vZGUgd2l0aCB0b28gc21hbGwK
PiBhIHNoYWRvdyBhbGxvY2F0aW9uIikgd2FzIGluY29tcGxldGU6IFRoZSBhZGp1c3RtZW50IGRv
bmUgdGhlcmUgdG8KPiBzaGFkb3dfZW5hYmxlKCkgaXMgYWxzbyBuZWVkZWQgaW4gc2hhZG93X29u
ZV9iaXRfZW5hYmxlKCkuIFRoZSAobmV3KQo+IHByb2JsZW0gcmVwb3J0IHdhcyAoYXBwYXJlbnRs
eSkgYSBmYWlsZWQgUFYgZ3Vlc3QgbWlncmF0aW9uIGZvbGxvd2VkIGJ5Cj4gYW5vdGhlciBtaWdy
YXRpb24gYXR0ZW1wdCBmb3IgdGhhdCBzYW1lIGd1ZXN0LiBEaXNhYmxpbmcgbG9nLWRpcnR5IG1v
ZGUKPiBhZnRlciB0aGUgZmlyc3Qgb25lIGhhZCBsZWZ0IGEgY291cGxlIG9mIHNoYWRvdyBwYWdl
cyBhbGxvY2F0ZWQgKHBlcmhhcHMKPiBzb21ldGhpbmcgdGhhdCBhbHNvIHdhbnRzIGZpeGluZyks
IGFuZCBoZW5jZSB0aGUgc2Vjb25kIGVuYWJsaW5nIG9mCj4gbG9nLWRpcnR5IG1vZGUgd291bGRu
J3QgaGF2ZSBhbGxvY2F0ZWQgYW55dGhpbmcgZnVydGhlci4KPgo+IFJlcG9ydGVkLWJ5OiBKYW1l
cyBXYW5nIDxqbndhbmdAc3VzZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24u
Ywo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMKPiBAQCAtMjg2NCw3ICsy
ODY0LDggQEAgc3RhdGljIGludCBzaGFkb3dfb25lX2JpdF9lbmFibGUoc3RydWN0Cj4gIAo+ICAg
ICAgbW9kZSB8PSBQR19TSF9lbmFibGU7Cj4gIAo+IC0gICAgaWYgKCBkLT5hcmNoLnBhZ2luZy5z
aGFkb3cudG90YWxfcGFnZXMgPT0gMCApCj4gKyAgICBpZiAoIGQtPmFyY2gucGFnaW5nLnNoYWRv
dy50b3RhbF9wYWdlcyA8Cj4gKyAgICAgICAgIHNoX21pbl9hbGxvY2F0aW9uKGQpICsgZC0+YXJj
aC5wYWdpbmcuc2hhZG93LnAybV9wYWdlcyApCgpUaGlzIGxvZ2ljIGxvb2tzIHN1c3BlY3QuwqAg
VGhlIGNoYW5nZSBmcm9tID09IDAgdG8gPCBtaW4gbG9va3MgZmluZSwgYW5kCmZlZWxzIGxpa2Ug
dGhlIHJpZ2h0IHRoaW5nIHRvIGRvLgoKSG93ZXZlcizCoCBzaF9taW5fYWxsb2NhdGlvbigpIHNo
b3VsZCBieSBkZWZpbml0aW9uIGJlIHRoZSBtaW5pbXVtCnF1YW50aXR5IG9mIHBhZ2VzIG5lY2Vz
c2FyeSBmb3IgdGhpbmdzIHRvIGZ1bmN0aW9uLCB3aGljaCBtYWtlcyB0aGUgKyBvbgp0aGUgZW5k
IGxvb2sgd3JvbmcuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
