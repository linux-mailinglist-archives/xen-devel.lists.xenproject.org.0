Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CBFAF3E8
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 03:19:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7rE8-00044j-B7; Wed, 11 Sep 2019 01:15:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GyXI=XG=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i7rE6-00044e-DX
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 01:15:18 +0000
X-Inumbo-ID: 9cc3b35a-d431-11e9-ac21-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cc3b35a-d431-11e9-ac21-12813bfff9fa;
 Wed, 11 Sep 2019 01:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568164516;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=5SOj58q8zjzP3gXE2tIU0/axznvGb5lEQXD3pecgzxI=;
 b=I8ijHRyd/BgjMaI3ALAwWLOJeFBnAdmGf62PB9Y7In1Eq/Cvr+R3sHNC
 jB6TrK8UQOEyhA4SuwOrXk8Cxi1Mhi7tCQRTGRmW1a/CUjI9c8OhGK1/+
 QX5/JRhgCQTJmZwwin99n6VNW7Inpy92zgKpNLIxzq4dwLI5CPZ+60psQ k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2iROYvmhvGaU9c4Wz9o+O792gJVVNt9kTQX9GaFM5PYP9KqwZ0yXFbPSgp+lFWEuulyrKA/6RV
 367AAPVqmYtaEMObG59XNh0sl0C6TL1qz1K1zT7UcvtqrE1s9bCAssAZgnFvItFJ+U9u4A/60O
 L4cLmwt2zH2Jo3zbbVlaBsLKwj24x9yrylB7zk0oGxoItxFFS8Gf9PyySJfqQeLbJmR2Pb+W/S
 +zBRfGCHNjpOiHdBIsTvxj52wKxO92GWhrCRhxZ6NlpRJt5nPf3FEN+3OktJcmOxDJ/ZlytbuF
 xdY=
X-SBRS: 2.7
X-MesageID: 5647574
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,491,1559534400"; 
   d="scan'208";a="5647574"
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
 <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
 <43b7da04-5c42-80d8-898b-470ee1c91ed2@oracle.com>
 <adefac87-c2b3-b67f-fb4d-d763ce920bef@citrix.com>
 <1695c88d-e5ad-1854-cdef-3cd95c812574@oracle.com>
 <4d3bf854-51de-99e4-9a40-a64c581bdd10@citrix.com>
 <bc3da154-d451-02cf-6154-5e0dc721a6e6@oracle.com>
 <c45b8786-5735-a95d-bc40-61372c326037@citrix.com>
 <43e492ff-f967-7218-65c4-d16581fabea3@oracle.com>
 <416ff4b7-3186-f61a-75fa-bcfc968f8117@citrix.com>
 <df64cd80-d92e-27ad-b1bc-e58184379e50@oracle.com>
 <d281baaf-a6d7-306e-63aa-b84552ac3ea5@citrix.com>
 <9ac1f34b-ea2a-3818-4cbd-a22a9a475dd4@oracle.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <74c9d2cc-a528-2cec-099e-0d803aeace6f@citrix.com>
Date: Wed, 11 Sep 2019 02:15:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9ac1f34b-ea2a-3818-4cbd-a22a9a475dd4@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/pci: try to reserve MCFG areas earlier
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
Cc: jgross@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDkvMjAxOSAyMjoxOSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDkvMTAvMTkg
NDozNiBQTSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDEwLzA5LzIwMTkgMTg6NDgsIEJv
cmlzIE9zdHJvdnNreSB3cm90ZToKPj4+IE9uIDkvMTAvMTkgNTo0NiBBTSwgSWdvciBEcnV6aGlu
aW4gd3JvdGU6Cj4+Pj4gT24gMTAvMDkvMjAxOSAwMjo0NywgQm9yaXMgT3N0cm92c2t5IHdyb3Rl
Ogo+Pj4+PiBPbiA5LzkvMTkgNTo0OCBQTSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+Pj4+PiBP
biAwOS8wOS8yMDE5IDIwOjE5LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4+
IFRoZSBvdGhlciBxdWVzdGlvbiBJIGhhdmUgaXMgd2h5IHlvdSB0aGluayBpdCdzIHdvcnRoIGtl
ZXBpbmcKPj4+Pj4+PiB4ZW5fbWNmZ19sYXRlKCkgYXMgYSBsYXRlIGluaXRjYWxsLiBIb3cgY291
bGQgTUNGRyBpbmZvIGJlIHVwZGF0ZWQKPj4+Pj4+PiBiZXR3ZWVuIGFjcGlfaW5pdCgpIGFuZCBs
YXRlX2luaXRjYWxscyBiZWluZyBydW4/IEknZCB0aGluayBpdCBjYW4gb25seQo+Pj4+Pj4+IGhh
cHBlbiB3aGVuIGEgbmV3IGRldmljZSBpcyBob3RwbHVnZ2VkLgo+Pj4+Pj4+Cj4+Pj4+PiBJdCB3
YXMgYSBwcmVjYXV0aW9uIGFnYWluc3Qgc2V0dXBfbWNmZ19tYXAoKSBjYWxscyB0aGF0IG1pZ2h0
IGFkZCBuZXcKPj4+Pj4+IGFyZWFzIHRoYXQgYXJlIG5vdCBpbiBNQ0ZHIHRhYmxlIGJ1dCBmb3Ig
c29tZSByZWFzb24gaGF2ZSBfQ0JBIG1ldGhvZC4KPj4+Pj4+IEl0J3Mgb2J2aW91c2x5IGEgImZp
cm13YXJlIGlzIGJyb2tlbiIgc2NlbmFyaW8gc28gSSBkb24ndCBoYXZlIHN0cm9uZwo+Pj4+Pj4g
ZmVlbGluZ3MgdG8ga2VlcCBpdCBoZXJlLiBXaWxsIHByZWZlciB0byByZW1vdmUgaW4gdjIgaWYg
eW91IHdhbnQuCj4+Pj4+IElzbid0IHNldHVwX21jZmdfbWFwKCkgY2FsbGVkIGJlZm9yZSB0aGUg
Zmlyc3QgeGVuX2FkZF9kZXZpY2UoKSB3aGljaCBpcyB3aGVyZSB5b3UgYXJlIGNhbGxpbmcgeGVu
X21jZmdfbGF0ZSgpPwo+Pj4+Pgo+Pj4+IHNldHVwX21jZmdfbWFwKCkgY2FsbHMgYXJlIGRvbmUg
aW4gb3JkZXIgb2Ygcm9vdCBidXMgZGlzY292ZXJ5IHdoaWNoCj4+Pj4gaGFwcGVucyAqYWZ0ZXIq
IHRoZSBwcmV2aW91cyByb290IGJ1cyBoYXMgYmVlbiBlbnVtZXJhdGVkLiBTbyB0aGUgb3JkZXIK
Pj4+PiBpczogY2FsbCBzZXR1cF9tY2ZnX21hcCgpIGZvciByb290IGJ1cyAwLCBmaW5kIHRoYXQK
Pj4+PiBwY2lfbW1jZmdfbGF0ZV9pbml0KCkgaGFzIGZpbmlzaGVkIE1DRkcgYXJlYSByZWdpc3Ry
YXRpb24sIHBlcmZvcm0gUENJCj4+Pj4gZW51bWVyYXRpb24gb2YgYnVzIDAsIGNhbGwgeGVuX2Fk
ZF9kZXZpY2UoKSBmb3IgZXZlcnkgZGV2aWNlIHRoZXJlLCBjYWxsCj4+Pj4gc2V0dXBfbWNmZ19t
YXAoKSBmb3Igcm9vdCBidXMgWCwgZXRjLgo+Pj4gQWgsIHllcy4gTXVsdGlwbGUgYnVzc2VzLgo+
Pj4KPj4+IElmIHRoYXQncyB0aGUgY2FzZSB0aGVuIHdoeSBkb24ndCB3ZSBuZWVkIHRvIGNhbGwg
eGVuX21jZmdfbGF0ZSgpIGZvcgo+Pj4gdGhlIGZpcnN0IGRldmljZSBvbiBlYWNoIGJ1cz8KPj4+
Cj4+IElkZWFsbHksIHllcyAtIHdlJ2QgbGlrZSB0byBjYWxsIGl0IGZvciBldmVyeSBidXMgZGlz
Y292ZXJlZC4gQnV0IGJvb3QKPj4gdGltZSBidXNlcyBhcmUgYWxyZWFkeSBpbiBNQ0ZHIChvdGhl
cndpc2Ugc3lzdGVtIGJvb3QgbWlnaHQgbm90IHNpbXBseQo+PiB3b3JrIGFzIEphbiBwb2ludGVk
IG91dCkgc28gaXQncyBub3Qgc3RyaWN0bHkgcmVxdWlyZWQuIFRoZSBvbmx5IGNhc2UgaXMKPj4g
YSBwb3RlbnRpYWwgUENJIGJ1cyBob3QtcGx1ZyBidXQgSSdtIG5vdCBzdXJlIGl0IGFjdHVhbGx5
IHdvcmtzIGluCj4+IHByYWN0aWNlIGFuZCB3ZSBjZXJ0YWlubHkgZGlkbid0IHN1cHBvcnQgaXQg
YmVmb3JlLiBJdCBtaWdodCBiZSBzb2x2ZWQKPj4gdGhlb3JldGljYWxseSBieSBzdWJzY3JpYmlu
ZyB0byBhY3BpX2J1c190eXBlIHRoYXQgaXMgYXZhaWxhYmxlIGFmdGVyCj4+IGFjcGlfaW5pdCgp
Lgo+IAo+IE9LLiBUaGVuICpJIHRoaW5rKiB3ZSBjYW4gZHJvcCBsYXRlX2luaXRjYWxsKCkgYnV0
IEkgd291bGQgcmVhbGx5IGxpa2UKPiB0byBoZWFyIHdoZW4gb3RoZXJzIHRoaW5rLgo+IAoKQW5v
dGhlciB0aGluZyB0aGF0IEkgaW1wbGllZCBieSAibm90IHN1cHBvcnRpbmciIGJ1dCB3YW50IHRv
IGV4cGxpY2l0bHkKY2FsbCBvdXQgaXMgdGhhdCBjdXJyZW50bHkgWGVuIHdpbGwgcmVmdXNlIHJl
c2VydmluZyBhbnkgTUNGRyBhcmVhCnVubGVzcyBpdCBhY3R1YWxseSBleGlzdGVkIGluIE1DRkcg
dGFibGUgYXQgYm9vdC4gSSBkb24ndCBjbGVhcmx5CnVuZGVyc3RhbmQgcmVhc29uaW5nIGJlaGlu
ZCBpdCBidXQgaXQgbWlnaHQgYmUgd29ydGggcmVsYXhpbmcgYXQgbGVhc3QKc2l6ZSBtYXRjaGlu
ZyByZXN0cmljdGlvbiBvbiBYZW4gc2lkZSBub3cgd2l0aCB0aGlzIGNoYW5nZS4KCklnb3IKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
