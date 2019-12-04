Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C99E112C72
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 14:19:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icUXB-0006YH-BI; Wed, 04 Dec 2019 13:17:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WV3s=Z2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1icUXA-0006YB-1e
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 13:17:36 +0000
X-Inumbo-ID: 6f52a846-1698-11ea-8204-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f52a846-1698-11ea-8204-12813bfff9fa;
 Wed, 04 Dec 2019 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575465455;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hfJ8XV7HMWxIgkCQYKigSEcybBaCKKoQPUs5SuVqeYE=;
 b=XjxisKZRgT6appefG4ZUxki7hQ3OaLX9rQUSBezfbYGoKlDlHDiM1+VG
 gkQy29TXDdftLYP0pkyCafC/Ygppm7R79eshRD4+2smIdvjfjKP+8Vw2I
 sKfjys+InbogRgn0bW+GDfDK8MUx2l/dNL1Hm0R6Z660S1XVy7SeNbQmo M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nv/L8yGWAebGQgexuGbKde11Ir1I7/LDwY1PuEMHFl7kusLHY7fKc4hIqYTxmXa5z8IUSUe8Jc
 jnHw0JRxP8f47sfn4F4UCOs51ohFspuZ+BW6CpLTOam8oocq2u5sz3uX7BY6pOYrj69MB0Mlxs
 Qc1V8z7+ShGHb9b5IzpkdPHf1hrJNHxAHprpCXAB9x3CbAWBaxh+BwMalT52LoL7Hczq277Pwc
 MgUR38dNc8f3JEa3H4adYtAi3YghwaAroMHSrOfZXke3rsgEdhWqQTJ5Kmf+PcgiSxYlw9Fz5S
 1l4=
X-SBRS: 2.7
X-MesageID: 9175629
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9175629"
Date: Wed, 4 Dec 2019 14:17:27 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191204131727.GK980@Air-de-Roger>
References: <20191204104420.34418-1-roger.pau@citrix.com>
 <a8827921-2d27-de07-8019-e99252dec703@suse.com>
 <20191204115243.GJ980@Air-de-Roger>
 <ecb09829-6ac0-b14b-cc07-2c040bb7c8b1@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecb09829-6ac0-b14b-cc07-2c040bb7c8b1@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] x86: do not enable global pages when
 virtualized on AMD hardware
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMDQsIDIwMTkgYXQgMDI6MTU6NThQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDQuMTIuMjAxOSAxMjo1MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFdlZCwgRGVjIDA0LCAyMDE5IGF0IDEyOjA1OjM1UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDA0LjEyLjIwMTkgMTE6NDQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
LS0tIGEveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jCj4gPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9w
di9kb21haW4uYwo+ID4+PiBAQCAtMTE4LDExICsxMTgsMTggQEAgdW5zaWduZWQgbG9uZyBwdl9m
aXh1cF9ndWVzdF9jcjQoY29uc3Qgc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGxvbmcgY3I0KQo+
ID4+PiAgICAgICAgICAgICAgKG1tdV9jcjRfZmVhdHVyZXMgJiBQVl9DUjRfR1VFU1RfVklTSUJM
RV9NQVNLKSk7Cj4gPj4+ICB9Cj4gPj4+ICAKPiA+Pj4gK3N0YXRpYyBpbnQgb3B0X2dsb2JhbF9w
YWdlcyA9IC0xOwo+ID4+Cj4gPj4gaW50OF90IF9fcmVhZF9tb3N0bHkKPiA+Pgo+ID4+PiArYm9v
bGVhbl9ydW50aW1lX3BhcmFtKCJnbG9iYWwtcGFnZXMiLCBvcHRfZ2xvYmFsX3BhZ2VzKTsKPiA+
Pj4gKwo+ID4+PiAgdW5zaWduZWQgbG9uZyBwdl9tYWtlX2NyNChjb25zdCBzdHJ1Y3QgdmNwdSAq
dikKPiA+Pj4gIHsKPiA+Pj4gICAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWlu
Owo+ID4+PiAgICAgIHVuc2lnbmVkIGxvbmcgY3I0ID0gbW11X2NyNF9mZWF0dXJlcyAmCj4gPj4+
ICAgICAgICAgIH4oWDg2X0NSNF9QQ0lERSB8IFg4Nl9DUjRfUEdFIHwgWDg2X0NSNF9UU0QpOwo+
ID4+PiArICAgIGJvb2wgcGdlID0gb3B0X2dsb2JhbF9wYWdlcyA9PSAtMSA/ICghY3B1X2hhc19o
eXBlcnZpc29yIHx8Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAhPQo+ID4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBYODZfVkVORE9SX0FNRCkKPiA+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgOiAhIW9wdF9nbG9iYWxfcGFnZXM7Cj4gPj4KPiA+
PiBMZXQncyBhdm9pZCByZS1kb2luZyB0aGlzIGV2YWx1YXRpb24gZWFjaCB0aW1lIHdlIGNvbWUg
aGVyZS4KPiA+PiBQb3N0IGJvb3QgdGhlIHZhbHVlIGNhbiBvbmx5IGNoYW5nZSB0byAwIG9yIDEu
IEhlbmNlIGluIHNvbWUKPiA+PiBfX2luaXQgZnVuY3Rpb24geW91IGNhbiBhcHBseSB0aGUgZGVm
YXVsdCBjYWxjdWxhdGlvbiBkb25lCj4gPj4gaGVyZS4KPiA+IAo+ID4gSSd2ZSBhc3N1bWVkIHRo
YXQgYm9vbGVhbl9ydW50aW1lX3BhcmFtIGNhbiBiZSBjaGFuZ2VkIGR1cmluZyBydW50aW1lCj4g
PiBieSB0aGUgdXNlciwgYW5kIGhlbmNlIHRoZSB2YWx1ZSBjYWxjdWxhdGVkIGF0IGJvb3QgdGlt
ZSB3b3VsZCBiZWNvbWUKPiA+IHN0YWxlIGlmIHRoZSB1c2VyIGNoYW5nZXMgaXQgYWZ0ZXIgYm9v
dCwgd2hpY2ggc2hvdWxkIGJlIGZpbmUgZm9yIHRoaXMKPiA+IG9wdGlvbi4KPiAKPiBJJ20gYWZy
YWlkIEkgY2FuJ3QgZGVjaWRlIHdoZXRoZXIgeW91IGFncmVlIG9yIGRpc2FncmVlIHdpdGggbXkK
PiBjb21tZW50LgoKT2ggc29ycnkgZnJvIG5vdCBiZWluZyBjbGVhci4gSSB3YXMgbWVhbnQgdG8g
ZGlzYWdyZWUsIGNhbGN1bGF0aW5nIGEKdmFsdWUgYXQgaW5pdCB0aW1lIHdvdWxkIGJlIHdyb25n
LCBzaW5jZSBvcHRfZ2xvYmFsX3BhZ2VzIGNhbiBjaGFuZ2UKZHVyaW5nIHJ1bnRpbWUuCgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
