Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED18D3D6DB
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 21:32:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hamSS-0002rg-1o; Tue, 11 Jun 2019 19:29:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LgYn=UK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hamSQ-0002rb-7g
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 19:29:22 +0000
X-Inumbo-ID: 35d2d6cd-8c7f-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 35d2d6cd-8c7f-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 19:29:20 +0000 (UTC)
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
IronPort-SDR: 6b2XMNjYN+J3Teox4Ds3FFVYxk7+ynuB63Piq1NYxV2PI6A6PWUY56YSiOGzZ9/wW1Og4h7pQZ
 aH2f32UOAvxH+/0UIKCnTLw9txiFi05DDsb7gF2DeWd8FM+h0b+q33aFo5dUGI8PsP8t9zUpql
 ZxmgbOWIsO6GhiQhlo8w1O58UkA3R0UJpBqlrRWnIV5X5bo53dKdwasTqARVQ82KQckLAGpjwU
 0YOphGTJeVn70j5P43rZwgBs1NJPCPaxucqQV1O4/8CN6h5wptfPO+4qvhHnz1ZzXOEd5wl33B
 9BE=
X-SBRS: 2.7
X-MesageID: 1599901
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,362,1557201600"; 
   d="scan'208";a="1599901"
To: Christopher Clark <christopher.w.clark@gmail.com>
References: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560272437.git.tsirakisn@ainfosec.com>
 <CACMJ4GYFeudWjWUOEDPYCKPF+JNJ761yQ7n+rkEY4bzWbnO69Q@mail.gmail.com>
 <fed80081-964c-05a2-8438-4b01d250eb8c@citrix.com>
 <CACMJ4GYGAc0xU836Cz2B6NTn-52uKmA5q0+s9vmOt6HD8kYUKw@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ab0aea99-7680-ea4a-0a23-27eee0d19a89@citrix.com>
Date: Tue, 11 Jun 2019 20:29:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CACMJ4GYGAc0xU836Cz2B6NTn-52uKmA5q0+s9vmOt6HD8kYUKw@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] argo: warn sendv() caller when ring is
 full
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Nicholas Tsirakis <tsirakisn@ainfosec.com>,
 Nicholas Tsirakis <niko.tsirakis@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMDYvMjAxOSAyMDoyMiwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gT24gVHVlLCBK
dW4gMTEsIDIwMTkgYXQgMTI6MTYgUE0gQW5kcmV3IENvb3Blcgo+IDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPiB3cm90ZToKPj4gT24gMTEvMDYvMjAxOSAxOTo0MywgQ2hyaXN0b3BoZXIgQ2xh
cmsgd3JvdGU6Cj4+PiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAxMDoxMSBBTSBOaWNob2xhcyBU
c2lyYWtpcwo+Pj4gPG5pa28udHNpcmFraXNAZ21haWwuY29tPiB3cm90ZToKPj4+PiBJbiBpdHMg
Y3VycmVudCBzdGF0ZSwgaWYgdGhlIGRlc3RpbmF0aW9uIHJpbmcgaXMgZnVsbCwgc2VuZHYoKQo+
Pj4+IHdpbGwgcmVxdWV1ZSB0aGUgbWVzc2FnZSBhbmQgcmV0dXJuIHRoZSByYyBvZiBwZW5kaW5n
X3JlcXVldWUoKSwKPj4+PiB3aGljaCB3aWxsIHJldHVybiAwIG9uIHN1Y2Nlc3MuIFRoaXMgcHJl
dmVudHMgdGhlIGNhbGxlciBmcm9tCj4+Pj4gZGlzdGluZ3Vpc2hpbmcgdGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiBhIHN1Y2Nlc3NmdWwgd3JpdGUgYW5kIGEKPj4+PiBtZXNzYWdlIHRoYXQgbmVlZHMg
dG8gYmUgcmVzZW50IGF0IGEgbGF0ZXIgdGltZS4KPj4+Pgo+Pj4+IEluc3RlYWQsIGNhcHR1cmUg
dGhlIC1FQUdBSU4gdmFsdWUgcmV0dXJuZWQgZnJvbSByaW5nYnVmX2luc2VydCgpCj4+Pj4gYW5k
ICpvbmx5KiBvdmVyd3JpdGUgaXQgaWYgdGhlIHJjIG9mIHBlbmRpbmdfcmVxdWV1ZSgpIGlzIG5v
bi16ZXJvLgo+Pj4+IFRoaXMgYWxsb3dzIHRoZSBjYWxsZXIgdG8gbWFrZSBpbnRlbGxpZ2VudCBk
ZWNpc2lvbnMgb24gLUVBR0FJTiBhbmQKPj4+PiBzdGlsbCBiZSBhbGVydGVkIGlmIHRoZSBwZW5k
aW5nIG1lc3NhZ2UgZmFpbHMgdG8gcmVxdWV1ZS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IE5p
Y2hvbGFzIFRzaXJha2lzIDx0c2lyYWtpc25AYWluZm9zZWMuY29tPgo+Pj4gVGhhbmtzIGZvciB0
aGUgY29ycmVjdCBpZGVudGlmaWNhdGlvbiBvZiB0aGUgcHJvYmxlbSBhbmQgdGhlIHBhdGNoLgo+
Pj4KPj4+IFJldmlld2VkLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2
QGJhZXN5c3RlbXMuY29tPgo+PiBTbyBJIHdhcyBjb21pbmcgdG8gY29tbWl0IHRoaXMsIGJ1dCB0
ZWNobmljYWxseSBhY2NvcmRpbmcgdG8gdGhlCj4+IG1haW50YWluZXJzIGZpbGUsIEFSR08gaXMg
bWFpbnRhaW5lZCBieSA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+Cj4+Cj4+IExvb2tp
bmcgYXQgdGhlIEFSR08gc2VyaWVzIGFzIGNvbW1pdHRlZCwgdGhlIHBhdGNoZXMgd2hlcmUgYWxs
IEZyb206Cj4+IGdtYWlsLCBTb0I6IGJhZXN5c3RlbXMuCj4+Cj4+IFdoaWNoIGlzIHRoZSBjb3Jy
ZWN0IGFsaWFzIHRvIHVzZT8KPiBGb3IgdGhpcyBwdXJwb3NlOgo+IFJldmlld2VkLWJ5OiBDaHJp
c3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+CgpGaXhlZCB1cCBh
bmQgcHVzaGVkLsKgIFRoYW5rcy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
