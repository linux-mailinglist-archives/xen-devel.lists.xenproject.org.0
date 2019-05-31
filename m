Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DF131721
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2019 00:20:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWpp3-00052C-FC; Fri, 31 May 2019 22:16:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWpp1-000527-PK
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 22:16:23 +0000
X-Inumbo-ID: b76d0a3e-83f1-11e9-a9b2-977cdb83a417
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b76d0a3e-83f1-11e9-a9b2-977cdb83a417;
 Fri, 31 May 2019 22:16:20 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: +1BZVFbxaWtFQO3Vl53p84zg4bp2mdTUX/pnwCZyAPuyOvgq1eqkOZl9gDTqCpQybg0AlI0joI
 H+YeyoibXTnEwvNAmOPOBv1td71i5pwS9KisyXZfRcUzyCKtmZc1/iciDNVyZnRyrpkWk9XW7K
 ya2Zu73lIbI8l4aGGuXNprhQcKbkWf4i9KeYXoN9bm6U05NSkNX5YevN1QfYYfhjV+OrXeGAvA
 EdfnE6uc+Jz9y3Lo1Mf6ECYVfvoReC2B9gZGsO3tvl2GDh3oD6iAvgNWhLuJbssLtUYGYjw6Ws
 PiQ=
X-SBRS: 2.7
X-MesageID: 1182119
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,536,1549947600"; 
   d="scan'208";a="1182119"
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
References: <CAHnBbQ8u+MywkV4+qmxhkA8216knGhGZjcy1Sz6Ukv3=PJZmXQ@mail.gmail.com>
 <293280a7-5011-e5a1-da53-80587b7b9a94@citrix.com>
 <alpine.DEB.2.11.1904162258280.33856@procyon.dur.ac.uk>
 <alpine.LFD.2.21.1905312010270.2763@austen3.home>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <f0fe2652-5b00-3cc7-10c7-8af08969e3a4@citrix.com>
Date: Fri, 31 May 2019 15:16:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.1905312010270.2763@austen3.home>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] booting domU guest as pvh works in xen-4.11.1 but
 fails in 4.12
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Pry Mar <pryorm09@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMDUvMjAxOSAxMjoxOCwgWU9VTkcsIE1JQ0hBRUwgQS4gd3JvdGU6Cj4gT24gVHVlLCAx
NiBBcHIgMjAxOSwgTSBBIFlvdW5nIHdyb3RlOgo+Cj4+IE9uIFR1ZSwgMTYgQXByIDIwMTksIEFu
ZHJldyBDb29wZXIgd3JvdGU6Cj4+Cj4+PiBGcm9tIHRoZSBsb2c6Cj4+Pgo+Pj4gdHJhcHM6IG1v
ZHByb2JlWzQ4XSB0cmFwIGludmFsaWQgb3Bjb2RlIGlwOjdmNzk3ZGM3YmI5NSBzcDo3ZmZlMzA5
OWNkYjggZXJybwo+Pj4gcjowIGluIGxkLTIuMjkuc29bN2Y3OTdkYzYxMDAwKzIxMDAwXQo+Pj4K
Pj4+Cj4+PiBDYW4geW91IGRpc2Fzc2VtYmxlIGxkLTIuMjkuc28gYW5kIGZpbmQgb3V0IHdoYXQg
dGhhdCBpbnN0cnVjdGlvbiBpcz/CoCBJdCBpcwo+Pj4gYWxtb3N0IGNlcnRhaW5seSBhIHJlbGF0
ZWQgZmFjdG9yLgo+PiBJIGdldCBsaW5lcyBsaWtlCj4+IFsgICAgMS4zODQzNTZdIHRyYXBzOiBt
b2Rwcm9iZVszNl0gdHJhcCBpbnZhbGlkIG9wY29kZSBpcDo3ZjU3NDQ4YWYxNzkKPj4gc3A6N2Zm
ZjhmYzNhOTM4IGVycm9yOjAgaW4gbGQtMi4yOS5zb1s3ZjU3NDQ4OTUwMDArMjAwMDBdCj4+Cj4+
IEkgYW0gZ3Vlc3NpbmcgdGhlIHJpZ2h0IHBsYWNlIHRvIGxvb2sgaW4gbGQtMi4yOS5zbyBpcwo+
PiAweDdmNTc0NDhhZjE3OS0weDdmNTc0NDg5NTAwMDAtMjAwMDAgPSA4Njg3MyBpbiB3aGljaCBj
YXNlIEkgZ2V0Cj4+IChnZGIpIHgvMTBpIDg2ODczCj4+ICAgMHgxNTM1OSA8X2RsX2Nsb3NlX3dv
cmtlciszNTkzPjoJbW92ICAgICglcnNpLCVyY3gsOCksJXI4Cj4+ICAgMHgxNTM1ZCA8X2RsX2Ns
b3NlX3dvcmtlciszNTk3PjoJdGVzdGIgICQweDIwLDB4MzFkKCVyOCkKPj4gICAweDE1MzY1IDxf
ZGxfY2xvc2Vfd29ya2VyKzM2MDU+OglqbmUgICAgMHgxNTM3NQo+PiA8X2RsX2Nsb3NlX3dvcmtl
ciszNjIxPgo+PiAgIDB4MTUzNjcgPF9kbF9jbG9zZV93b3JrZXIrMzYwNz46CWNtcCAgICAlZWN4
LCVlZHgKPj4gICAweDE1MzY5IDxfZGxfY2xvc2Vfd29ya2VyKzM2MDk+OglqZSAgICAgMHgxNTM3
Mgo+PiA8X2RsX2Nsb3NlX3dvcmtlciszNjE4Pgo+PiAgIDB4MTUzNmIgPF9kbF9jbG9zZV93b3Jr
ZXIrMzYxMT46CW1vdiAgICAlZWR4LCVyOWQKPj4gICAweDE1MzZlIDxfZGxfY2xvc2Vfd29ya2Vy
KzM2MTQ+Ogltb3YgICAgJXI4LCglcnNpLCVyOSw4KQo+PiAgIDB4MTUzNzIgPF9kbF9jbG9zZV93
b3JrZXIrMzYxOD46CWFkZCAgICAkMHgxLCVlZHgKPj4gICAweDE1Mzc1IDxfZGxfY2xvc2Vfd29y
a2VyKzM2MjE+OglhZGQgICAgJDB4MSwlcmN4Cj4+ICAgMHgxNTM3OSA8X2RsX2Nsb3NlX3dvcmtl
ciszNjI1PjoJY21wICAgICVlY3gsJWVheAo+Pgo+PiBTb21lIG1vcmUgbGluZXMgbGlrZSB0aGlz
IGFyZQo+PiBbICAgIDEuNTcxNDc5XSB0cmFwczogbW9kcHJvYmVbNDFdIHRyYXAgaW52YWxpZCBv
cGNvZGUgaXA6N2YzZTM2MjhkMTc5Cj4+IHNwOjdmZmM4NmFiYmUwOCBlcnJvcjowIGluIGxkLTIu
Mjkuc29bN2YzZTM2MjczMDAwKzIwMDAwXQo+PiBbICAgIDEuNjMwNTYyXSB0cmFwczogbW9kcHJv
YmVbNDNdIHRyYXAgaW52YWxpZCBvcGNvZGUgaXA6N2YyMjdiMzlhMTc5Cj4+IHNwOjdmZmRmZDk0
MzE5OCBlcnJvcjowIGluIGxkLTIuMjkuc29bN2YyMjdiMzgwMDAwKzIwMDAwXQo+PiB3aGljaCBh
bGwgc2VlbSB0byBnZXQgdG8gdGhlIHNhbWUgcGxhY2UuIElzIHRoaXMgdXNlZnVsIG9yIGFtIEkg
bG9va2luZyBpbgo+PiB0aGUgd3JvbmcgcGxhY2U/Cj4gSSBkaWQgYSBiaXNlY3Qgb24gdGhpcyBp
c3N1ZSwgYW5kIGl0IGlkZW50aWZpZWQgdGhlIGZpcnN0IGJhZCBjb21taXQgYXMgCj4gZmQzMmRj
ZmU0YzlhNTM5ZjhlNWQyNmZmNGM1Y2E1MGVlNTQ1NTZiMgo+IHg4Ni92bXg6IERvbid0IGxlYWsg
RUZFUi5OWEUgaW50byBndWVzdCBjb250ZXh0CgpBYWggLSB0aGlzIHdpbGwgYmUgYSBoYXJwZXJ0
b3duIGNvcmUuCgpZb3UgbmVlZCBlMjhjMGVlMzM1NmY1MmY1ODliYmFlNTRlODlhYWVkMjVjMWY1
OTlkIGZyb20gc3RhZ2luZywgd2hpY2gKaGFzIGJlZW4gYmFja3BvcnRlZCB0byBzdGFnaW5nLTQu
MTIKKDg0NTdjMTViOTgxYmEwNGMwNzA5ZTZmMjVhZjNiNzZiZWIzNGNhZmEpIHR3byB3ZWVrcyBh
Z28uCgpUaGlzIGJ1dCBhY2NpZGVudGFsbHkgcmVzdWx0ZWQgaW4gdGhlIFNZU0NBTEwgaW5zdHJ1
Y3Rpb24gYmVpbmcgZGlzYWJsZWQKYmVoaW5kIHRoZSBiYWNrIG9mIHRoZSBndWVzdCwgd2hpY2gg
YnJva2UgYWxsIHVzZXJzcGFjZSBzeXN0ZW0gY2FsbHMuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
