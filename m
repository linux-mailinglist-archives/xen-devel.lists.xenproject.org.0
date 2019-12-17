Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BD3123A2B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 23:46:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihLZl-0001BA-Th; Tue, 17 Dec 2019 22:44:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UMsG=2H=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ihLZj-0001B2-Sc
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 22:44:19 +0000
X-Inumbo-ID: c21be4e4-211e-11ea-8fcd-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c21be4e4-211e-11ea-8fcd-12813bfff9fa;
 Tue, 17 Dec 2019 22:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576622659;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=lHvWM3flPGx2kJYbwbQn+S82P9e9Bsxav0oNidocI64=;
 b=f7CjQqTLvXfW1mUhAnnYvUYr8Oi4J5N0KM2tkDbMTRMBelMgEWdHt/1B
 rtXk/qzjY4fuMn35fs7FmpLdPGiJwHQrGsMX9zvTfrRh3AcwLlOdbfXlC
 1C/BuNea+OC+RkVaGRQhiTbzEZTXXIlaB99LGQR/47h/yQzStksS9vAVa 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 44ybqdeV6qD9r2JSl8kjHOtKsDsYl+bzhDe7RwakiyRZtRmUItnrhrBWeorljjN03w2TCZZQGp
 rvXmV1JWgTQ9dOuRGCkBBl3e3bTq7qAqYZD3DmKhG9uk6+U4OUs3aZIbPCaY/ttl+uOZeWKq+V
 REY1uONmp7e34eaJJx0cHpoMBX0+vYOzijC42zoeQwCrpnVFEglDdYqSuh1iQaCcqgFQ8qYay1
 BD81LX+DRuD5JMVg2klwT1En9eaniszTKN9gyNegvA4w+5jlOWibbxnwbrY6Pzt4rI6M0oWgmB
 B6Y=
X-SBRS: 2.7
X-MesageID: 9854680
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,327,1571716800"; 
   d="scan'208";a="9854680"
To: Eslam Elnikety <elnikety@amazon.com>, Jan Beulich <jbeulich@suse.com>
References: <20191209084119.87563-1-elnikety@amazon.com>
 <180013ce-7b18-335a-f04b-1db0d4f2adf4@citrix.com>
 <eca670cd-7f8c-a662-320a-43981ba60c9a@amazon.com>
 <5bdb27b7-f827-23bd-a1dd-a0cec039ce54@suse.com>
 <e25e1ae4-d5b1-7ce8-348f-f2d1809d0635@amazon.com>
 <eb8beed3-3b9e-25f9-94bf-c6fe56a397f5@suse.com>
 <ff5b0699-5010-fabc-f7fd-2d40f8c56644@amazon.com>
 <2d23e5e7-fe5d-3446-57e5-6559cd8e7258@citrix.com>
 <56d6a14e-e7fa-2f74-c2cc-7aa33a261dd9@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <00fb888f-1397-16f2-e765-0f6175a3ad72@citrix.com>
Date: Tue, 17 Dec 2019 22:44:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <56d6a14e-e7fa-2f74-c2cc-7aa33a261dd9@amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/microcode: Support builtin CPU microcode
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMTIvMjAxOSAyMjo0MSwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gT24gMTMuMTIuMTkg
MTQ6NTcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDEyLzEyLzIwMTkgMjI6MTMsIEVzbGFt
IEVsbmlrZXR5IHdyb3RlOgo+Pj4+PiBTZWNvbmQsIHRoZXJlIGlzIG9mdGVuIG5lZWQgdG8gY291
cGxlIGEgWGVuIGJ1aWxkIHdpdGggYSBtaW5pbXVtCj4+Pj4+IG1pY3JvY29kZSBwYXRjaCBsZXZl
bC4gSGF2aW5nIHRoZSBtaWNyb2NvZGUgYnVpbHQgd2l0aGluIHRoZSBYZW4KPj4+Pj4gaW1hZ2UK
Pj4+Pj4gaXRzZWxmIGlzIGEgc3RyZWFtbGluZWQsIG5hdHVyYWwgd2F5IG9mIGFjaGlldmluZyB0
aGF0Lgo+Pj4+Cj4+Pj4gT2theSwgSSBjYW4gYWNjZXB0IHRoaXMgYXMgYSByZWFzb24sIHRvIHNv
bWUgZGVncmVlIGF0IGxlYXN0LiBZZXQKPj4+PiBhcyBzYWlkIGVsc2V3aGVyZSwgSSBkb24ndCB0
aGluayB5b3Ugd2FudCB0aGVuIHRvIG92ZXJyaWRlIGEKPj4+PiBwb3NzaWJsZSAiZXh0ZXJuYWwi
IHVjb2RlIG1vZHVsZSB3aXRoIHRoZSBidWlsdGluIGJsb2JzLiBJbnN0ZWFkCj4+Pj4gdGhlIG5l
d2VzdCBvZiBldmVyeXRoaW5nIHRoYXQncyBhdmFpbGFibGUgc2hvdWxkIHRoZW4gYmUgbG9hZGVk
Lgo+Pj4KPj4+IEV4dGVuZGluZyBYZW4gdG8gd29yayBhcm91bmQgdG9vbHMgc2hvcnRjb21pbmdz
IGlzIGFic29sdXRlbHkgbm90IHdoYXQKPj4+IEkgaGF2ZSBpbiBtaW5kLiBJIHNob3VsZCBoYXZl
IHN0YXJ0ZWQgd2l0aCB0aGUgc2Vjb25kIHJlYXNvbi4gUmVhZAo+Pj4gdGhpcyBhczogWGVuIHJl
bGllcyBvbiBhIG1pbmltdW0gbWljcm9jb2RlIGZlYXR1cmUgc2V0LCBhbmQgaXQgbWFrZXMKPj4+
IHNlbnNlIHRvIGNvdXBsZSBib3RoIGluIG9uZSBiaW5hcnkuIFRoaXMgY291cGxpbmcganVzdCBo
YXBwZW5zIHRvCj4+PiBwcm92aWRlIGFuIGFkZGVkIGJlbmVmaXQgaW4gdGhlIGZhY2Ugb2YgdG9v
bHMgc2hvcnRjb21pbmcuCj4+Cj4+IERvIHdlIGhhdmUgYW55dGhpbmcgd2hpY2ggc3RyaWN0bHkg
cmVsaWVzIG9uIGEgbWluaW11bSB2ZXJzaW9uPwo+Cj4gSSBoYWQgaW4gbWluZCBtaWNyb2NvZGUg
c3BlY3VsYXRpb24gbWl0aWdhdGlvbiBmZWF0dXJlcyB3aGVuIHJlYXNvbmluZwo+IHdpdGggdGhl
IG1pbmltdW0gcGF0Y2ggbGV2ZWwgYXJndW1lbnQuCgpDb25zaWRlcmluZyBob3cgd2VsbCB0aGUg
Zmlyc3Qgcm91bmQgb2Ygc3BlY3VsYXRpdmUgbWljcm9jb2RlIHdlbnQsCm1hbmRhdGluZyBpdCB3
b3VsZCBoYXZlIGJlZW4gYSByYXRoZXIgYmFkIHRoaW5nLi4uCgpCdXQgeWVzIC0gYXMgYSB1c2Vj
YXNlIG9mICJJIHdpc2ggdG8gYnVuZGxlIHRoZSBtaW5pbXVtIG1pY3JvY29kZSBJJ2QKbGlrZSB0
byB3b3JrIHdpdGgiLCB0aGlzIHNlZW1zIGVudGlyZWx5IHJlYXNvbmFibGUuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
