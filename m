Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABCE2D23C
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 01:10:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVlCD-0008IG-4Z; Tue, 28 May 2019 23:07:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qGVJ=T4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hVlCB-0008IB-C8
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 23:07:51 +0000
X-Inumbo-ID: 689d5f4a-819d-11e9-94c3-93e8cc3a96d3
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 689d5f4a-819d-11e9-94c3-93e8cc3a96d3;
 Tue, 28 May 2019 23:07:48 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: m/SZlwuu9k8tYAem1NHH1tk+SkJopjkihY0V75giOxcNISotuujFlQZTxgXv9kKrNeR1Li+xsi
 AxFRjLFmZfaeSQ2ygdix1AJlPA0izGhqrMxek6rPocTHd7QfzvJl3eOBG6kC4kK2dgRJGKPHGc
 CV5XLeOZEjpUe5+6xRpbplmqtXhvQ3RDpjTkkqk0soNbpxfxWFlBPXekPdaz3EU0Is+cPd+Qnn
 aBCqAqXNmY7lXioHhCo6VYa2H0b5fPyumFI7rs5kzaQOWaqAy+rErnkdqlkm4SlDnSw/K19arJ
 XkI=
X-SBRS: 2.7
X-MesageID: 988073
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,524,1549947600"; 
   d="scan'208";a="988073"
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <20190528105457.2305-1-jgross@suse.com>
 <CABfawhnMVFrpwc8tc_cPtCFD+he6X79PZZ-LtHQ0d0Jcwv58LA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <89f4a2db-46bd-c039-af05-708ef6077abf@citrix.com>
Date: Wed, 29 May 2019 00:07:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABfawhnMVFrpwc8tc_cPtCFD+he6X79PZZ-LtHQ0d0Jcwv58LA@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDUvMjAxOSAxNDo0NCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+PiAqICBJbXByb3Zl
bWVudHMgdG8gZG9tYWluIGNyZWF0aW9uICh2MikKPj4gICAtICBBbmRyZXcgQ29vcGVyCj4gSGkg
QW5kcmV3LAo+IGNvdWxkIHlvdSBwb2ludCBtZSB0byBhIGdpdCBicmFuY2ggd2hlcmUgeW91IGhh
dmUgdGhpcyB3b3JrPyBJJ20KPiBleHBlcmltZW50aW5nIHdpdGggc29tZSBzdHVmZiBhbmQgd291
bGQgbGlrZSB0byBzZWUgd2hhdCB5b3VyIHdvcmsgaW4KPiB0aGlzIGFyZWEgdG91Y2hlcy4KClRo
ZXJlIGlzIGVzc2VudGlhbGx5IG5vdGhpbmcgd2hpY2ggaXNuJ3QgYWxyZWFkeSBpbiBzdGFnaW5n
LsKgIFN1ZmZpY2UgaXQKdG8gc2F5IHRoYXQgTURTIGdvdCBpbiB0aGUgd2F5IG9mIGNvbnRpbnVp
bmcgdGhhdCB3b3JrLgoKVGhlIG5leHQgdGFzayBvbiB0aGUgbGlzdCBpcyB0byBtYWtlIHRoZSB2
Y3B1L2RvbWFpbiBkZXN0cm95IHBhdGhzCmlkZW1wb3RlbnQsIHRoZW4gcmVpbXBsZW1lbnQgdGhl
IGNyZWF0ZSBwYXRocyBieSBqdXN0IHJldHVybmluZyBvdXQgb2YKdGhlIHRvcCBvZiB0aGUgY2Fs
bCB0cmVlIHdpdGggYW4gZXJyb3IsIGFuZCBoYXZpbmcgdGhlIHRvcCBsZXZlbCBjYWxsCmRlc3Ry
b3kuwqAgVGhpcyBhdm9pZHMgaGF2aW5nIHR3byBkaWZmZXJlbnQgc2V0cyBvZiBkZXN0cnVjdGlv
biBsb2dpYwp3aGljaCBhcmVuJ3QgcXVpdGUgaWRlbnRpY2FsLgoKV2l0aCB0aGF0IGluIHBsYWNl
LCBJIGNhbiBtb3ZlIHRoZSB2Y3B1IGFsbG9jYXRpb24gbG9vcCBpbnRvCmRvbWFpbl9jcmVhdGUo
KSBhZnRlciB3aGljaCBpdCB3aWxsIGJlIGltcG9zc2libGUgdG8gZmluZCBhIGRvbWFpbiBieSBJ
RAphbmQgdHJpcCBvdmVyIHNvbWUgTlVMTCB2Y3B1IHBvaW50ZXJzLgoKSWYgeW91IGFyZSBpbnRy
b2R1Y2luZyBvciBhZGp1c3RpbmcgYWxsb2NhdGlvbi9kZWFsbG9jYXRpb24gbG9naWMsCnBsZWFz
ZSBtYWtlIHRoZSBkZWFsbG9jYXRpb24gaWRlbXBvdGVudCwgYW5kIGlkZWFsbHkgdXNlIHRoZSBk
ZWFsbG9jYXRlCmZ1bmN0aW9uIHRvIGNsZWFuIHVwIGZyb20gYSBmYWlsZWQgYWxsb2NhdGUuwqAg
VGhlcmUgd2lsbCBiZSBzb21lCnRyZWUtd2lkZSByZWZhY3RvcmluZyBhdCBzb21lIHBvaW50IGlu
IHRoZSBmdXR1cmUgd2hpY2ggbW92ZXMgZXZlcnl0aGluZwppbnRvIHBsYWNlLsKgIFVudGlsIHRo
ZW4sIGhhdmUgYXQgaXQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
