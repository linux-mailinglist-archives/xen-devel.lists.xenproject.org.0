Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B5E32D8F
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 12:08:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXjpn-00064F-U8; Mon, 03 Jun 2019 10:04:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9f30=UC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hXjpm-00064A-64
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 10:04:54 +0000
X-Inumbo-ID: 05e91260-85e7-11e9-9630-bbb4d7893ee0
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05e91260-85e7-11e9-9630-bbb4d7893ee0;
 Mon, 03 Jun 2019 10:04:50 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: oxLDvmzBkUncEaNFvOfAl6xfTpWv22VDoYlEMUmfsMKoNKawBK+3rjktoiY5zrrXumZ8OYdw9M
 CmYr+Xaq3Mw0NhqfFZ/1T4RJ+Ypx0OxIGXyKyQ0/w5nxdfbChCTNg8Sh/ouSXqMeYHcX4Pqi1U
 RIxs4BGGjfGk9LUhisrEM1khavtVzCwFlD28Y+8kO64JbezV0aXW8Bsoq69qC1o9hOvT3DAJxr
 R9zylbzKMb4r+prB2dfZpNu6Rbwl/3hM6TRoblLG8aZSaPXB5PQ1xXsvTnvuwWOYEbEPzdXLpZ
 GsE=
X-SBRS: 2.7
X-MesageID: 1208129
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,546,1549947600"; 
   d="scan'208";a="1208129"
To: Jan Beulich <JBeulich@suse.com>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9360200007800233E01@prv1-mh.provo.novell.com>
 <6c267398-fd65-1351-e100-8fdebd9986e4@citrix.com>
 <5CF4F02E0200007800234874@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <3586e8b8-3db3-929f-3fbd-72e94f7fb0dd@citrix.com>
Date: Mon, 3 Jun 2019 11:04:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF4F02E0200007800234874@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/4] bitops: speed up hweight<N>()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDYvMjAxOSAxMTowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzEuMDUuMTkg
YXQgMjE6NDAsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMzEvMDUv
MjAxOSAwMjo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4v
Yml0b3BzLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9iaXRvcHMuaAo+Pj4gQEAgLTE1Myw0
MSArMTUzLDU0IEBAIHN0YXRpYyBfX2lubGluZV9fIGludCBnZXRfY291bnRfb3JkZXIodW4KPj4+
ICAKPj4+ICBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBnZW5lcmljX2h3ZWlnaHQzMih1bnNp
Z25lZCBpbnQgdykKPj4+ICB7Cj4+PiAtICAgIHVuc2lnbmVkIGludCByZXMgPSAodyAmIDB4NTU1
NTU1NTUpICsgKCh3ID4+IDEpICYgMHg1NTU1NTU1NSk7Cj4+PiAtICAgIHJlcyA9IChyZXMgJiAw
eDMzMzMzMzMzKSArICgocmVzID4+IDIpICYgMHgzMzMzMzMzMyk7Cj4+PiAtICAgIHJlcyA9IChy
ZXMgJiAweDBGMEYwRjBGKSArICgocmVzID4+IDQpICYgMHgwRjBGMEYwRik7Cj4+PiAtICAgIHJl
cyA9IChyZXMgJiAweDAwRkYwMEZGKSArICgocmVzID4+IDgpICYgMHgwMEZGMDBGRik7Cj4+PiAt
ICAgIHJldHVybiAocmVzICYgMHgwMDAwRkZGRikgKyAoKHJlcyA+PiAxNikgJiAweDAwMDBGRkZG
KTsKPj4+ICsgICAgdyAtPSAodyA+PiAxKSAmIDB4NTU1NTU1NTU7Cj4+PiArICAgIHcgPSAgKHcg
JiAweDMzMzMzMzMzKSArICgodyA+PiAyKSAmIDB4MzMzMzMzMzMpOwo+Pj4gKyAgICB3ID0gICh3
ICsgKHcgPj4gNCkpICYgMHgwZjBmMGYwZjsKPj4+ICsKPj4+ICsjaWZkZWYgQ09ORklHX0hBU19G
QVNUX01VTFRJUExZCj4+PiArICAgIHJldHVybiAodyAqIDB4MDEwMTAxMDEpID4+IDI0Owo+Pj4g
KyNlbHNlCj4+PiArICAgIHcgKz0gdyA+PiA4Owo+Pj4gKwo+Pj4gKyAgICByZXR1cm4gKHcgKyAo
dyA+PiAxNikpICYgMHhmZjsKPj4+ICsjZW5kaWYKPj4gVGhpcyB3b3VsZCBiZSBzbGlnaHRseSBz
aG9ydGVyLCBsZXNzIGxpYWJsZSB0byBiaXRyb3QsIGFuZCBJTU8gY2xlYW5lciwKPj4gdG8gZG8K
Pj4KPj4gaWYgKCBJU19FTkFCTEVEKENPTkZJR19IQVNfRkFTVF9NVUxUSVBMWSkgKQo+PiAgICAg
dyA9IHcgKiAweDAxMDEwMTAxKSA+PiAyNDsKPj4gZWxzZQo+PiAgICAgdyArPSB3ID4+IDg7Cj4+
Cj4+IHJldHVybiB3Owo+IFdvdWxkIHlvdSBiZSBva2F5IHdpdGgKPgo+IHN0YXRpYyBpbmxpbmUg
dW5zaWduZWQgaW50IGdlbmVyaWNfaHdlaWdodDMyKHVuc2lnbmVkIGludCB3KQo+IHsKPiAgICAg
dyAtPSAodyA+PiAxKSAmIDB4NTU1NTU1NTU7Cj4gICAgIHcgPSAgKHcgJiAweDMzMzMzMzMzKSAr
ICgodyA+PiAyKSAmIDB4MzMzMzMzMzMpOwo+ICAgICB3ID0gICh3ICsgKHcgPj4gNCkpICYgMHgw
ZjBmMGYwZjsKPgo+ICAgICBpZiAoIElTX0VOQUJMRUQoQ09ORklHX0hBU19GQVNUX01VTFRJUExZ
KSApCj4gICAgICAgICByZXR1cm4gKHcgKiAweDAxMDEwMTAxKSA+PiAyNDsKPgo+ICAgICB3ICs9
IHcgPj4gODsKPgo+ICAgICByZXR1cm4gKHcgKyAodyA+PiAxNikpICYgMHhmZjsKPiB9Cj4KPiBk
ZXNwaXRlIHRoZXJlIHRoZW4gc3RpbGwgYmVpbmcgdHdvIHJldHVybiBzdGF0ZW1lbnRzPwoKWWVh
aCAtIHRoaXMgZm9ybSBkb2VzIHJlYWQgbGlrZSBhIHJlZ3VsYXIgZnVuY3Rpb24uCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
