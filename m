Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505C03BA28
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 18:57:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haNZB-0002yR-SR; Mon, 10 Jun 2019 16:54:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CttF=UJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1haNZA-0002yM-MO
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 16:54:40 +0000
X-Inumbo-ID: 6f6eb145-8ba0-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6f6eb145-8ba0-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 16:54:39 +0000 (UTC)
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
IronPort-SDR: Hk60vSRKR8F1W/znY34iGZ2I26v8HWwgWqXydm6G76v/4tYvIpt58RU/nKBiybKWC2DU0RNrdy
 H0QnNNsWCSdbXeemfRsz8FTcD9ju2k4FcN6z95VVqaoQW7fPVDMwzb1cQ2iAZBqV7zSJuphGQj
 fJDTT+PyzMVs5d511+/1NROZzNpV6+oEt0o3uI/Y5ZZR61dh98VQeFcO/arPlFU5N+W46383rd
 SCcKq04HNA2pQEJ0jbjU4VbzF3CdsK9kfmeICE/rzWhXVY+F0LqaDg/yLv8KytVilK7aB/xxgn
 rRE=
X-SBRS: 2.7
X-MesageID: 1533927
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,575,1557201600"; 
   d="scan'208";a="1533927"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
 <5CE68FDB0200007800231B41@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <298febae-cc8c-23c4-ee42-2c9ca8643d21@citrix.com>
Date: Mon, 10 Jun 2019 17:54:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CE68FDB0200007800231B41@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 5/5] tools/libxc: allow controlling the max
 C-state sub-state
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMDUvMjAxOSAxMzoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRnJvbTogUm9zcyBMYWdl
cndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+Cj4KPiBTaWduZWQtb2ZmLWJ5OiBSb3Nz
IExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KPgo+IE1ha2UgaGFuZGxpbmcg
aW4gZG9fcG1fb3AoKSBtb3JlIGhvbW9nZW5lb3VzOiBCZWZvcmUgaW50ZXJwcmV0aW5nCj4gb3At
PmNwdWlkIGFzIHN1Y2gsIGhhbmRsZSBhbGwgb3BlcmF0aW9ucyBub3QgYWN0aW5nIG9uIGEgcGFy
dGljdWxhcgo+IENQVS4gQWxzbyBleHBvc2UgdGhlIHNldHRpbmcgdmlhIHhlbnBtLgo+Cj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Cj4gLS0tIGEvdG9v
bHMvbGlieGMveGNfcG0uYwo+ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX3BtLmMKPiBAQCAtMzc5LDcg
KzM3OSw3IEBAIGludCB4Y19nZXRfY3B1aWRsZV9tYXhfY3N0YXRlKHhjX2ludGVyZmEKPiAgICAg
IH0KPiAgICAgIHN5c2N0bC5jbWQgPSBYRU5fU1lTQ1RMX3BtX29wOwo+ICAgICAgc3lzY3RsLnUu
cG1fb3AuY21kID0gWEVOX1NZU0NUTF9wbV9vcF9nZXRfbWF4X2NzdGF0ZTsKPiAtICAgIHN5c2N0
bC51LnBtX29wLmNwdWlkID0gMDsKPiArICAgIHN5c2N0bC51LnBtX29wLmNwdWlkID0gdHlwZTsK
CldoYXQgaXMgdHlwZSwgYW5kIHdoeSBpdCBpcyBiZWluZyBwdXQgaW50byBhIGZpZWxkIGNhbGxl
ZCBjcHVpZD8KCj4gLS0tIGEvdG9vbHMvbWlzYy94ZW5wbS5jCj4gKysrIGIvdG9vbHMvbWlzYy94
ZW5wbS5jCj4gQEAgLTExMjAsMTMgKzExMjgsMTcgQEAgdm9pZCBnZXRfdmNwdV9taWdyYXRpb25f
ZGVsYXlfZnVuYyhpbnQgYQo+ICAKPiAgdm9pZCBzZXRfbWF4X2NzdGF0ZV9mdW5jKGludCBhcmdj
LCBjaGFyICphcmd2W10pCj4gIHsKPiAtICAgIGludCB2YWx1ZTsKPiArICAgIGludCB2YWx1ZSwg
c3VidmFsID0gWEVOX1NZU0NUTF9DWF9VTkxJTUlURUQ7Cj4gICAgICBjaGFyIGJ1ZlsxMl07Cj4g
IAo+IC0gICAgaWYgKCBhcmdjICE9IDEgfHwKPiArICAgIGlmICggYXJnYyA8IDEgfHwgYXJnYyA+
IDIgfHwKPiAgICAgICAgICAgKHNzY2FuZihhcmd2WzBdLCAiJWQiLCAmdmFsdWUpID09IDEKPiAg
ICAgICAgICAgID8gdmFsdWUgPCAwCj4gLSAgICAgICAgICA6ICh2YWx1ZSA9IFhFTl9TWVNDVExf
Q1hfVU5MSU1JVEVELCBzdHJjbXAoYXJndlswXSwgInVubGltaXRlZCIpKSkgKQo+ICsgICAgICAg
ICAgOiAodmFsdWUgPSBYRU5fU1lTQ1RMX0NYX1VOTElNSVRFRCwgc3RyY21wKGFyZ3ZbMF0sICJ1
bmxpbWl0ZWQiKSkpIHx8Cj4gKyAgICAgICAgIChhcmdjID09IDIgJiYKPiArICAgICAgICAgIChz
c2NhbmYoYXJndlsxXSwgIiVkIiwgJnN1YnZhbCkgPT0gMQo+ICsgICAgICAgICAgID8gc3VidmFs
IDwgMAo+ICsgICAgICAgICAgIDogKHN1YnZhbCA9IFhFTl9TWVNDVExfQ1hfVU5MSU1JVEVELCBz
dHJjbXAoYXJndlsxXSwgInVubGltaXRlZCIpKSkpICkKClVzYWdlIHVwZGF0ZT8KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
