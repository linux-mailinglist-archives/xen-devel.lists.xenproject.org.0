Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60702AD13E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 01:40:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i76k9-00049s-3E; Sun, 08 Sep 2019 23:37:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LcfI=XD=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i76k8-00049n-2L
 for xen-devel@lists.xenproject.org; Sun, 08 Sep 2019 23:37:16 +0000
X-Inumbo-ID: 9666d4a2-d291-11e9-b299-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9666d4a2-d291-11e9-b299-bc764e2007e4;
 Sun, 08 Sep 2019 23:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567985835;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=j27af3ptPQZ2OnmzBveENofO7zeBJFyvmuv4vbn2eJQ=;
 b=DH0vzkvqNV1zQOgwMNaBYh4sMTRQC5NCt61eOT2vMJkFGiBxjZhKxbP/
 pKH1W3cDPoYLGRdCZDla7e8ZONDd4VdKmcVPMwnJwqH/fgazAMYc4LBeS
 bhP9OE7RXbpfej/MY38xACAHIwYOfSG1m7yp3ZaNJksWK4+ol7JR50wOx k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +z45qSjQII/5flzz3HRMW6jwaGS/a+cfRgMJ0WNGy16YukfNrmVu9TXJ0w8CiYD8l/iuL83zhL
 3a6i7Ie3l9U6tu87filf2L4dbBdRg7B7h1GPcLY9ooY7gbxXerEy+5NOvXJX7Cs1NOHBVVt0cU
 J9aley3cnBkhdGWuTAExwr5zAq+tdch93XIGPX1/ondc+zRI61/3SWd7tXId/EPUJAFEQN70Wu
 LwHAt1x/7+GdQn2jpSEEUFCYL3ZSlgAoZeJZyQ0kH3h2ZF3hX2/YSuA7g0Qf3HtSVij5bbD+8o
 jXQ=
X-SBRS: 2.7
X-MesageID: 5570001
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,483,1559534400"; 
   d="scan'208";a="5570001"
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
 <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
 <43b7da04-5c42-80d8-898b-470ee1c91ed2@oracle.com>
 <adefac87-c2b3-b67f-fb4d-d763ce920bef@citrix.com>
 <1695c88d-e5ad-1854-cdef-3cd95c812574@oracle.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <4d3bf854-51de-99e4-9a40-a64c581bdd10@citrix.com>
Date: Mon, 9 Sep 2019 00:37:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1695c88d-e5ad-1854-cdef-3cd95c812574@oracle.com>
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

T24gMDkvMDkvMjAxOSAwMDozMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDkvOC8xOSA1
OjExIFBNLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4gT24gMDgvMDkvMjAxOSAxOToyOCwgQm9y
aXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4gT24gOS82LzE5IDc6MDAgUE0sIElnb3IgRHJ1emhpbmlu
IHdyb3RlOgo+Pj4+IE9uIDA2LzA5LzIwMTkgMjM6MzAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToK
Pj4+Pj4gV2hlcmUgaXMgTUNGRyBwYXJzZWQ/IHBjaV9hcmNoX2luaXQoKT8KPj4+Pj4+IEl0IGhh
cHBlbnMgdHdpY2U6Cj4+Pj4gMSkgZmlyc3QgdGltZSBlYXJseSBvbmUgaW4gcGNpX2FyY2hfaW5p
dCgpIHRoYXQgaXMgYXJjaF9pbml0Y2FsbCAtIHRoYXQKPj4+PiB0aW1lIHBjaV9tbWNmZ19saXN0
IHdpbGwgYmUgZnJlZWQgaW1tZWRpYXRlbHkgdGhlcmUgYmVjYXVzZSBNQ0ZHIGFyZWEgaXMKPj4+
PiBub3QgcmVzZXJ2ZWQgaW4gRTgyMDsKPj4+PiAyKSBzZWNvbmQgdGltZSBsYXRlIG9uZSBpbiBh
Y3BpX2luaXQoKSB3aGljaCBpcyBzdWJzeXN0ZW1faW5pdGNhbGwgcmlnaHQKPj4+PiBiZWZvcmUg
d2hlcmUgUENJIGVudW1lcmF0aW9uIHN0YXJ0cyAtIHRoaXMgdGltZSBBQ1BJIHRhYmxlcyB3aWxs
IGJlCj4+Pj4gY2hlY2tlZCBmb3IgYSByZXNlcnZlZCByZXNvdXJjZSBhbmQgcGNpX21tY2ZnX2xp
c3Qgd2lsbCBiZSBmaW5hbGx5Cj4+Pj4gcG9wdWxhdGVkLgo+Pj4+Cj4+Pj4gVGhlIHByb2JsZW0g
aXMgdGhhdCBvbiBhIHN5c3RlbSB0aGF0IGRvZXNuJ3QgaGF2ZSBNQ0ZHIGFyZWEgcmVzZXJ2ZWQg
aW4KPj4+PiBFODIwIHBjaV9tbWNmZ19saXN0IGlzIGVtcHR5IGJlZm9yZSBhY3BpX2luaXQoKSBh
bmQgb3VyIFBDSSBob29rcyBhcmUKPj4+PiBjYWxsZWQgaW4gdGhlIHNhbWUgcGxhY2UuIFNvIE1D
RkcgaXMgc3RpbGwgbm90IGluIHVzZSBieSBYZW4gYXQgdGhpcwo+Pj4+IHBvaW50IHNpbmNlIHdl
IGhhdmVuJ3QgcmVhY2hlZCBvdXIgeGVuX21jZmdfbGF0ZSgpLgo+Pj4KPj4+IFdvdWxkIGl0IGJl
IHBvc3NpYmxlIGZvciB1cyB0byBwYXJzZSBNQ0ZHIG91cnNlbHZlcyBpbiBwY2lfeGVuX2luaXQo
KT8gSQo+Pj4gcmVhbGl6ZSB0aGF0IHdlJ2QgYmUgZG9pbmcgdGhpcyB0d2ljZSAob3IgbWF5YmUg
ZXZlbiB0aHJlZSB0aW1lcyBzaW5jZQo+Pj4gYXBwYXJlbnRseSBib3RoIHBjaV9hcmNoX2luaXQo
KcKgIGFuZCBhY3BpX2luaSgpIGRvIGl0KS4KPj4+Cj4+IEkgZG9uJ3QgdGhpbmUgaXQgbWFrZXMg
c2Vuc2U6Cj4+IGEpIGl0IG5lZWRzIHRvIGJlIGRvbmUgYWZ0ZXIgQUNQSSBpcyBpbml0aWFsaXpl
ZCBzaW5jZSB3ZSBuZWVkIHRvIHBhcnNlCj4+IGl0IHRvIGZpZ3VyZSBvdXQgdGhlIGV4YWN0IHJl
c2VydmVkIHJlZ2lvbiAtIHRoYXQncyB3aHkgaXQncyBjdXJyZW50bHkKPj4gZG9uZSBpbiBhY3Bp
X2luaXQoKSAoc2VlIGNvbW1pdCBtZXNzYWdlIGZvciB0aGUgcmVhc29ucyB3aHkpCj4gCj4gSG1t
Li4uIFdlIHNob3VsZCBiZSBhYmxlIHRvIHBhcnNlIEFDUEkgdGFibGVzIGJ5IHRoZSB0aW1lCj4g
cGNpX2FyY2hfaW5pdCgpIGlzIGNhbGxlZC4gSW4gZmFjdCwgaWYgeW91IGxvb2sgYXQKPiBwY2lf
bW1jZmdfZWFybHlfaW5pdCgpIHlvdSB3aWxsIHNlZSB0aGF0IGl0IGRvZXMganVzdCB0aGF0Lgo+
IAoKVGhlIHBvaW50IGlzIG5vdCB0byBwYXJzZSBNQ0ZHIGFmdGVyIGFjcGlfaW5pdCBidXQgdG8g
cGFyc2UgRFNEVCBmb3IKcmVzZXJ2ZWQgcmVzb3VyY2Ugd2hpY2ggY291bGQgYmUgZG9uZSBvbmx5
IGFmdGVyIEFDUEkgaW5pdGlhbGl6YXRpb24uCgo+PiBiKSBnaXZlbiAoYSkgd2UgY2Fubm90IGRv
IGl0IG91cnNlbHZlcyBiZWZvcmUgYWNwaV9pbml0IGFuZCBhZnRlciBpcyB0b28KPj4gbGF0ZSBh
cyB3ZSdyZSBhbHJlYWR5IHBhc3QgQUNQSSBQQ0kgZW51bWVyYXRpb24KPj4gYykgd2UnZCBoYXZl
IHRvIGRvIGl0IGluIHRoZSBzYW1lIHBsYWNlIEkgY2FsbCB4ZW5fbWNmZ19sYXRlKCkgYW5kIGl0
J2QKPj4gYmUgY29kZSBkdXBsaWNhdGlvbiBvZiB3aGF0J3MgYWxyZWFkeSBkb25lIGJ5IHRoZSBl
eGlzdGluZyBjb2RlLgo+IAo+IAo+IElmIHdlIG1hbmFnZSB0byBwYXJzZSBNQ0ZHIG91cnNlbHZl
cyBlYXJseSB0aGVuIG1heWJlIHdlIHdvbid0IG5vdCBuZWVkCj4geGVuX21jZmdfbGF0ZSgpPyBX
ZSBjYW4gY2FsbCBQSFlTREVWT1BfcGNpX21tY2ZnX3Jlc2VydmVkIHJpZ2h0IGF3YXkuCgpBZ2Fp
biwgdGhpcyBjYW5ub3QgYmUgZG9uZSB1bnRpbGUgYWNwaV9pbml0IGZpbmlzaGVzIGJhc2ljIHNl
dHVwIHRvCnBhcnNlIERTRFQuCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
