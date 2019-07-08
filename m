Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE7E62A83
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 22:41:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkaPD-0005Vq-E6; Mon, 08 Jul 2019 20:38:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7H6o=VF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hkaPC-0005Vl-O5
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 20:38:34 +0000
X-Inumbo-ID: 588052f0-a1c0-11e9-9ea7-1b7c117e7e90
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 588052f0-a1c0-11e9-9ea7-1b7c117e7e90;
 Mon, 08 Jul 2019 20:38:30 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oH34h2E/BYhKBVCRep6EnI4CstGd60ufi7fouBzuoOrvsSUHznBiO7z1W+1xj51oDfi+emjHel
 MmY7Rm90m22BtWuG1x/0sn9fb9myBf5EDIA7JWBlxkGIpF90S2UT5f5KDc3lsrO/XaCsJvfmaD
 V+mKwJv4bwoin+MYb5G+Jlrf1sEY6vNIw76e3QFG4gxzb4RXF9wtlWYxW6sX2rdKHbmJPtuoSa
 jMulYIRyT1zYqt1Vvmb4pWDlg3UaEP5/Oc8KHEannGyVUkh+qnohUKcEfbG5zWvFT4VokDV9ey
 Oy0=
X-SBRS: 2.7
X-MesageID: 2723299
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,468,1557201600"; 
   d="scan'208";a="2723299"
To: Julien Grall <julien.grall@arm.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <1561109798-8744-5-git-send-email-andrew.cooper3@citrix.com>
 <20190704191449.22486-1-andrew.cooper3@citrix.com>
 <96aff7db-67f7-546a-da63-a915cdadd7b9@arm.com>
 <fba23c81-2ab9-28b8-86f2-89b3220345a9@citrix.com>
 <14762cea-1b87-4dea-69cc-6e4cf001c73b@arm.com>
 <2bfc235e-6b66-4b97-baef-618d5e80b360@citrix.com>
 <1ed8fc50-1c8e-b8c1-604a-bdb58d69af5b@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <1311bbbd-6b01-fc08-0ac7-74befee9d374@citrix.com>
Date: Mon, 8 Jul 2019 15:38:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1ed8fc50-1c8e-b8c1-604a-bdb58d69af5b@arm.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 4/5] xen/gnttab: Refactor
 gnttab_clear_flag() to be gnttab_clear_flags()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMDcvMjAxOSAyMToyOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Cj4+Pj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzE1NjExMDk3OTgtODc0NC01LWdpdC1zZW5kLWVt
YWlsLWFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20vVC8jdAo+Pj4+Cj4+Pj4KPj4+Cj4+PiBUbyBi
ZSBob25lc3QsIEkgdGhpbmsgaXQgaXMgd3JvbmcgdG8gdHJ5IHRvIG1pY3JvLW9wdGltaXplIGEg
Y29tbW9uCj4+PiBwcm90b3R5cGUgZm9yIHRoZSBiZW5lZml0IG9mIG9uZSBhcmNoaXRlY3R1cmUg
YW5kIG9uZSBjb21waWxlciB2ZXJzaW9uCj4+PiAob3IgZXZlbiBub25lIHBlciB0aGUgZS1tYWls
KS4KPj4KPj4gVGhlIHByb3RvdHlwZSB3YXNuJ3QgY29tbW9uLsKgIE9ic2VydmUgdGhhdCBiZWZv
cmUgdGhpcyBwYXRjaCwgQVJNIHVzZWQKPj4gdW5zaWduZWQgbG9uZyB3aGlsZSB4ODYgdXNlZCB1
aW50MTZfdC7CoCBJdCBzaG91bGQgYmVjb21lIGNvbW1vbiwKPj4gaG93ZXZlci4KPgo+IEkgYW0g
bm90IHN1cmUgdG8gZm9sbG93IHRoaXMuIEFGQUlDVCwgd2UgdXNlIHVpbnQxNl90IHByb3Blcmx5
IG9uIEFybS4KCkxvb2sgYXQgdGhlIG1vZGlmaWNhdGlvbnMgdG8gZ250dGFiX2NsZWFyX2ZsYWdz
KCksIGFuZCBpbiBwYXJ0aWN1bGFyLAp0aGUgcmVtb3ZhbHMuwqAgQmVmb3JlIHRoaXMgcGF0Y2gs
IHRoZSBBUEkgcmVhbGx5IGlzIGRpZmZlcmVudCBiZXR3ZWVuCkFSTSBhbmQgeDg2LsKgIChBbHRo
b3VnaCBpdCBkaWZmZXJlZCBiZXR3ZWVuIHVuc2lnbmVkIGxvbmcgYW5kIHVuc2lnbmVkCmludC7C
oCBUaGUgdWludDE2X3Qgd2FzIGEgbWlzdGFrZSBvbiBteSBiZWhhbGYuKQoKPgo+Pgo+PiBJbiBw
cmFjdGljZSwgd2UncmUgdGFsa2luZyBhYm91dCBiaXRzIDMgYW5kIDQsIGFuZCB0aGlzIGlzbid0
IGxpYWJsZSB0bwo+PiBjaGFuZ2UgaW4gYSBodXJyeS4KPj4KPj4+IE9uZSBjb3VsZCBhbHNvIGFy
Z3VlIHRoYXQgdGhpcyBtYXkgYmUgbm90IGJlbmVmaWNpYWwgZm9yIHRoZSBub24teDg2Cj4+PiBh
cmNoaXRlY3R1cmUgZGVwZW5kaW5nIG9uIGhvdyB0aGUgY29tcGlsZXIgZGVjaWRlIHRvIGRvIHRo
ZSBjYXN0IGZyb20KPj4+IDMyLWJpdCB0byAxNi1iaXQuLi4KPj4KPj4gQWxsIGFyY2hpdGVjdHVy
ZSBuZWNlc3NhcmlseSBzdWZmZXIgdGhlIGRvd25jYXN0IHNvbWV3aGVyZSwgZXZlbiB4ODYuCj4+
IEFSTSdzIGlzIGluIHRoZSBwcm90b3R5cGUgZm9yIGd1ZXN0X2NsZWFyX21hc2sxNigpLCBidXQg
aW4gdGVybXMgb2YgdGhlCj4+IGNvbW1vbiBsb2dpYyBmb3IgY2FsY3VsYXRpbmcgY29uZGl0aW9u
YWxseSB3aGljaCBiaXRzIHRvIGNsZWFyLCBrZWVwaW5nCj4+IGV2ZXJ5dGhpbmcgYXMgdW5zaWdu
ZWQgaW50IGZvciBhcyBsb25nIGFzIHBvc3NpYmxlIG9mZmVycyB0aGUgbW9zdAo+PiBmbGV4aWJp
bGl0eSB0byB0aGUgY29tcGlsZXIsIGFzIGl0IGNhbiBzZWUgYWxsIHRoZSBjb25zdGFudHMgaW52
b2x2ZWQuCj4KPiBUaGlzIGlzIHRoZSBhcmd1bWVudCBJIHdhcyBsb29raW5nIGZvciA6KS4gVGhh
bmsgeW91IGZvciB3cml0aW5nIGl0IQoKQ2FuIEkgdGFrZSB0aGlzIGFzIGFuIGFjaywgb3IgYSBy
ZXF1ZXN0IGZvciBjbGFyaWZpY2F0aW9uIGluIHRoZSBjb21taXQKbWVzc2FnZSwgb3Igc29tZXRo
aW5nIGVsc2U/CgooVGhpcyBkZXRhaWwgaXMgdGhlIGZpbmFsIG91dHN0YW5kaW5nIHBpZWNlIGZv
ciB0aGUgc2VyaWVzIHRvIGJlIGNvbW1pdHRlZC4pCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
