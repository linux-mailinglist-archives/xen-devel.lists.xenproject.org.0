Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A98914A8C7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 18:16:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw7wu-0002Yt-4R; Mon, 27 Jan 2020 17:13:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEJ2=3Q=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iw7wt-0002Yo-7E
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 17:13:19 +0000
X-Inumbo-ID: 4f72d2b6-4128-11ea-857d-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f72d2b6-4128-11ea-857d-12813bfff9fa;
 Mon, 27 Jan 2020 17:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580145198;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=KVYsIXCWpgeroqt8lRHoc3OdKnhPuWaj96dRwzdxVj8=;
 b=GTh+VCc8IJziUwf63csGrdvNNC5moC+t4suPaa8t4MJDc4L8ZECYm6SJ
 d4z2Al2ijojq2W9RmxoQ5MAusGJLrhQzTVPqMYsz07mf8yxlgXqnZRxhu
 J1bev9iJNs/n3vjRSRIVX7mYI3LWMvPnqtRz2B2ocm/wYEYhbicM8vqHU 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: M1Bu4jUUBgLcunjPjeLnMp9fuqQceXOUQaAqwE8+HDumTqrgm/QTXOnvFMsZQukiLbQ/YvxkzD
 1b+SPP4TEogqB2a99qlJQJAd74MNNXwWYZCW+em4IammDALGn+Q74AsjPuGKylZLwIZNBrzxEZ
 TNtxfZ+AidKFyWzltLVCdQhvvADw3wke+T7366uS4hrsNM5cUOLEQO5bT80Dkeqgtw4DT/kUML
 vq2NeXaowyNF7z13nqv1HHwMydMe4GiI/DvwVKZbLgpy6+cPmRuk1lzGyzk+VpOY8c6hzYh0nt
 epo=
X-SBRS: 2.7
X-MesageID: 11497964
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11497964"
To: "Xia, Hongyan" <hongyxia@amazon.com>, "George.Dunlap@eu.citrix.com"
 <George.Dunlap@eu.citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>, "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
References: <cover.1578397252.git.hongyxia@amazon.com>
 <5f64321c4cceccd057e3b3e7fadea696793a7966.1578397252.git.hongyxia@amazon.com>
 <baa1a699-179f-b0ae-d857-699f7f63b214@suse.com>
 <dd3836c12457a92af545651b09acf910c2071bcf.camel@amazon.com>
 <1d38a17c-9b6b-a423-1326-33e24c583393@suse.com>
 <d28777c594dbb46d49f63f0541668888943a8358.camel@amazon.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <7a75cdbb-dfbf-60a0-92dd-b8acc347e3d5@citrix.com>
Date: Mon, 27 Jan 2020 17:13:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d28777c594dbb46d49f63f0541668888943a8358.camel@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/7] x86: introduce a new set of APIs to
 manage Xen page tables
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Grall, 
 Julien" <jgrall@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8yNy8yMCAzOjA3IFBNLCBYaWEsIEhvbmd5YW4gd3JvdGU6Cj4gT24gTW9uLCAyMDIwLTAx
LTI3IGF0IDE1OjQzICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjcuMDEuMjAyMCAx
NTozMywgWGlhLCBIb25neWFuIHdyb3RlOgo+Pj4gLi4uCj4+Pgo+Pj4gUmVmbGVjdGluZyBiYWNr
IHRvIHlvdXIgY29tbWVudCBpbiB2MyBhYm91dCB3aGV0aGVyIHRoZSBuZXcgWGVuCj4+PiBwYWdl
Cj4+PiB0YWJsZSBtYXBwaW5nIEFQSXMgKG1hcC91bm1hcF94ZW5fcGFnZXRhYmxlKSBhcmUgcmVh
bGx5IG5lY2Vzc2FyeSwKPj4+IEkKPj4+IGFncmVlIGluIHRoZSBlbmQgdGhleSB3aWxsIGp1c3Qg
ZG8gdGhlIHNhbWUgdGhpbmcgYXMKPj4+IG1hcC91bm1hcF9kb21haW5fcGFnZSwgYWx0aG91Z2gg
b25lIHRoaW5nIGlzIHRoYXQgdGhlIGxhdHRlcgo+Pj4gc3VnZ2VzdHMKPj4+IGl0IGlzIHRyeWlu
ZyB0byBtYXAgYSBgZG9tYWluJyBwYWdlLCB3aG9zZSBkZWZpbml0aW9uIHByb2JhYmx5IGRvZXMK
Pj4+IG5vdAo+Pj4gaW5jbHVkZSBYZW4gcGFnZSB0YWJsZXMsIHNvIHRoZSBuYW1lIGNvdWxkIGJl
IGEgYml0IGNvbmZ1c2luZwo+Pj4gKHdlbGwsIHdlCj4+PiBjb3VsZCBhcmd1ZSB0aGF0IFhlbiBw
YWdlIHRhYmxlcyBhcmUganVzdCBpZGxlIGBkb21haW4nIHBhZ2VzIHNvCj4+PiB0aGUKPj4+IG5h
bWUgc3RpbGwgaG9sZHMpLiBJZiB3ZSBhcmUgaGFwcHkgd2l0aCB1c2luZyBtYXBfZG9tYWluX3Bh
Z2Ugb24KPj4+IFhlbgo+Pj4gUFRFIHRhYmxlcyB0aGVuIEkgYW0gb2theSB3aXRoIGRyb3BwaW5n
IHRoZSBuZXcgbWFwcGluZyBBUElzIGFuZAo+Pj4gb25seQo+Pj4gaW5jbHVkZSB0aGUgbmV3IGFs
bG9jIEFQSXMuCj4+Cj4+IEFueW9uZSBvbiB0aGUgVG86IGxpc3QgLSBvcGluaW9ucz8KPiAKPiBU
aGVyZSBpcyBvbmUgYXJndW1lbnQuIFdlIGFscmVhZHkgdXNlIG1hcF9kb21haW5fcGFnZSBvbiBu
b24tZG9tYWluCj4gcGFnZXMgYW5kIG91dHNpZGUgdGhlIGRvbWhlYXAuIEZvciBleGFtcGxlLCB0
aGUgdHJhcCBoYW5kbGVyIHdhbGtzIHBhZ2UKPiB0YWJsZXMgYW5kIHByaW50IHRyYWNlcyB2aWEg
bWFwX2RvbWFpbl9wYWdlIHJlZ2FyZGxlc3Mgb2Ygd2hlcmUgdGhlCj4gdW5kZXJseWluZyBwYWdl
IGlzIGZyb20uIFRoZSBtYXBwZWQgcGFnZSBjb3VsZCBqdXN0IGJlIGZyb20gWGVuLgoKWWVzLCBJ
J3ZlIGxvbmcgc29ydCBvZiBtZW50YWxseSBmaWx0ZXJlZCBvdXQgdGhlICdkb21haW4nIHBhcnQg
b2YKIm1hcF9kb21haW5fcGFnZSgpIjsgaXQncyByZWFsbHkgYW4gYXJ0aWZhY3Qgb2YgYSBieWdv
bmUgZXJhLCB3aGVuIHRoZXJlCndlcmUgc2VwYXJhdGUgeGVuIGFuZCBkb21haW4gaGVhcHMuICAo
SW4gZmFjdCwgaXQncyByZWFsbHkgIm1hcCBkb21oZWFwCnBhZ2UiLCBhbmQgYXQgdGhlIG1vbWVu
dCB3ZSBvbmx5ICBoYXZlIGEgZG9taGVhcC4pCgpJdCBtaWdodCBiZSB3b3J0aCB0aGlua2luZyBh
Ym91dCBkb2luZyBhIGdsb2JhbApzL21hcF9kb21haW5fcGFnZS9tYXBfcGFnZS87IGJ1dCB1bnRp
bCB0aGVuLCBJIHRoaW5rIGl0J3MgZmluZSB0byB1c2UKIm1hcF9kb21haW5fcGFnZSIgZm9yICJt
YXAgcGFnZXMgaW4gdGhlIGRvbWhlYXAiLCBnaXZlbiB0aGF0IHRoZXJlICppcyoKb25seSB0aGUg
ZG9taGVhcC4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
