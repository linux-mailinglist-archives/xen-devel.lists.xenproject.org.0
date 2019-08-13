Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FB08BCA7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 17:10:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxYNk-0005st-PQ; Tue, 13 Aug 2019 15:06:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rFE=WJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxYNi-0005so-VL
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 15:06:38 +0000
X-Inumbo-ID: f26ad76e-bddb-11e9-92e2-dfb2872c820b
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f26ad76e-bddb-11e9-92e2-dfb2872c820b;
 Tue, 13 Aug 2019 15:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565708798;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=J8BLf1JeFK2QOmDv5N6g61dM4xQuY9IPeaaMIPH4lwo=;
 b=UZBG/RHfOI7j19YCuRNDDID3JzD03RvD8EIH/K68hn5svX83nN1Mm+S9
 xHULjAr+uhladixV4+QoZrtMcvTMuICELDFQcNWivYhuq0QUHTUnSya9U
 vo74M0Bv7WN3BZBdn1B1ECh9UV9W2w/asoBjv81T5y7sW2rO9cLCkbNHx M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Bz9UItOAHX0pzChpT+WeFdjV2N5yI/Cng8KgHto2DpJqAbWH4arQ0tC/8dMuhKKYrcVXf823Bf
 nj2woC+K3UF5OrBhyvuEPo7Z+a1V3SaA52qYxjyJuzzvnaW09RMlBd0NzXX5SRGBdG2ZYeZCa3
 vXL8LgxoiotLE9isk5o8CCeDzQX9vlixOQV/ZoKABW3F+bLO/vDIN2l/BCoCunLxEZz+6U1TR6
 fdI7ol4yecNenkp9LjXmo13bPowBb8yWmsx+Nd7rCp2SQcNrn/BWc7WEHe9LWeCLVhnIbdrDEB
 qcQ=
X-SBRS: 2.7
X-MesageID: 4253217
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-URL-LookUp-ScanningError: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4253217"
To: Anthony PERARD <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20190813144827.6318-1-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <1ec7f229-e1b9-5919-1337-ecb29124b182@citrix.com>
Date: Tue, 13 Aug 2019 16:06:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813144827.6318-1-anthony.perard@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] libxlu: Handle += in config files
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMDgvMjAxOSAxNTo0OCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gSGFuZGxlICs9IG9m
IGJvdGggc3RyaW5ncyBhbmQgbGlzdHMuCj4KPiBJZiArPSBpcyB1c2VkIGZvciBjb25maWcgb3B0
aW9ucyBleHBlY3RlZCB0byBiZSBudW1iZXJzLCB0aGVuIGEKPiB3YXJuaW5nIGlzIHByaW50ZWQg
YW5kIHRoZSBjb25maWcgb3B0aW9uIGlnbm9yZWQgKGJlY2F1c2UgeGwgaWdub3Jlcwo+IGNvbmZp
ZyBvcHRpb25zIHdpdGggZXJyb3JzKS4KPgo+IFRoaXMgaXMgdG8gYmUgdXNlZCBmb3IgZGV2ZWxv
cG1lbnQgcHVycG9zZXMsIHdoZXJlIG1vZGlmeWluZyBjb25maWcKPiBvcHRpb24gY2FuIGJlIGRv
bmUgb24gdGhlIGB4bCBjcmVhdGUnIGNvbW1hbmQgbGluZS4KPgo+IE9uZSBjb3VsZCBoYXZlIGEg
Y21kbGluZT0gaW4gdGhlIGNmZyBmaWxlLCBhbmQgc3BlY2lmeSBjbWRsaW5lKz0gb24KPiB0aGUg
YHhsIGNyZWF0ZWAgY29tbWFuZCBsaW5lIHdpdGhvdXQgdGhlIG5lZWQgdG8gd3JpdGUgdGhlIHdo
b2xlCj4gY21kbGluZSBpbiBgeGwnIGNvbW1hbmQgbGluZSBidXQgc2ltcGx5IGFwcGVuZCB0byB0
aGUgb25lIGluIHRoZSBjZmcgZmlsZS4KPiBPciBhZGQgYW4gZXh0cmEgdmlmIG9yIGRpc2sgYnkg
c2ltcGx5IGhhdmluZyAidmlmICs9IFsgJycsIF07IiBpbiB0aGUKPiBgeGwnIGNtZGxpbmUuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT4KPiAtLS0KPgo+IE5vdGVzOgo+ICAgICBDb21taXRlciwgdGhlIGxpYnhsdV9jZmdfPy5baGNd
IGZpbGVzIG5lZWRzIHRvIGJlIHJlZ2VuZXJhdGVkLiAod2l0aCBtYWtlKQo+ICAgICAKPiAgICAg
VGhpcyBpcyBhIGRpZmZlcmVudCBwcm9wb3NhbCB0byBBbmRyZXcncyBwYXRjaDoKPiAgICAgPDIw
MTkwODA1MTQ0OTEwLjIwMjIzLTEtYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAgICAgW1BB
VENIXSB0b29scy94bDogTWFrZSBleHRyYT0gdXNhYmxlIGluIGNvbWJpbmF0aW9uIHdpdGggY21k
bGluZT0KCkkgZ2F2ZSB0aGlzIGEgc3BpbiwgYnV0IGdvdDoKCltyb290QGZ1c2Vib3Qgfl0jIC4v
eGxwbHVzIGNyZWF0ZSBzaGltLmNmZwpyYW1kaXNrPVwiL3Jvb3QvdGVzdHMvc2VsZnRlc3QvdGVz
dC1odm02NC1zZWxmdGVzdFwiCmNtZGxpbmUrPVwiZG9tMD1wdmhcIGRvbTAtaW9tbXU9bm9uZVwi
ClBhcnNpbmcgY29uZmlnIGZyb20gc2hpbS5jZmcKc2hpbS5jZmc6MTk6IGNvbmZpZyBwYXJzaW5n
IGVycm9yIG5lYXIgYCs9ImRvbTA9cHZoJzogbGV4aWNhbCBlcnJvcgp3YXJuaW5nOiBDb25maWcg
ZmlsZSBsb29rcyBsaWtlIGl0IGNvbnRhaW5zIFB5dGhvbiBjb2RlLgp3YXJuaW5nOsKgIEFyYml0
cmFyeSBQeXRob24gaXMgbm8gbG9uZ2VyIHN1cHBvcnRlZC4Kd2FybmluZzrCoCBTZWUgaHR0cDov
L3dpa2kueGVuLm9yZy93aWtpL1B5dGhvbkluWGxDb25maWcKRmFpbGVkIHRvIHBhcnNlIGNvbmZp
ZzogSW52YWxpZCBhcmd1bWVudAoKSSBjYW4ndCBhbnkgY29tYmluYXRpb24gb2Ygc3ludGF4IHdo
aWNoIHhsIGlzIGhhcHB5IHdpdGguCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
