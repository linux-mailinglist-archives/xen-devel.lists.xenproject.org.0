Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A6F8A10D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 16:28:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxBFh-0006un-5x; Mon, 12 Aug 2019 14:24:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eAtL=WI=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hxBFf-0006ui-4Y
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 14:24:47 +0000
X-Inumbo-ID: ee687b61-bd0c-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ee687b61-bd0c-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 14:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565619885;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=U+8HxhJA/jOqNFxsmsjf49IM+mVMuzoup/Y//XX+iYc=;
 b=GxD8srpTYj213yI0wfPP5kiB7Wr/grw10gAmPhKR1BmUVT/NXYR7D5+G
 usgNmlDtyF8TPbpvrCHkrnM0dO0dmxY5c+pRS/EpBBkLmpVyCurBUJGfk
 eoq1BAriN0MxrkfNgjTQwBjn7L1Og7H1BDki/oYRs61kLcY8xP4IJdZlC E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Z0cNJe2/0ydWv0SoulxwQWDZ1rkTux0B6YHaklwtDxWKVdDDz2HoUsbthjr6K+uDkxcM990/xG
 fZ1qSJAzDAfIVUuuRItfOoRWEEzHZx8unjxK+cIjLD7ceurtQ6h8JwmkZHtZpj4PCIHSs9rk0V
 /EBanXPN4xUpiONBu1Bm9+GS88qi4CY/fgRkSaIdTCeNyRssR2CWMiSg1vvHmQUSFeK5mT14Wp
 fnl/iP9Oclc4nEbyqxetYNF+2DnXufYW4XPj2jxwO86+SSQcT5RMoc/yZQGc4D2OvQ5W4oB/4d
 lNI=
X-SBRS: 2.7
X-MesageID: 4200203
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4200203"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190802092227.43058-1-roger.pau@citrix.com>
 <8f92a662-d576-8d41-2856-74f38c10c1b3@citrix.com>
 <20190812135628.624gtsgv4if2zd6l@Air-de-Roger>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <b2200e4e-ba26-5e5c-2841-d55ab03b2f12@citrix.com>
Date: Mon, 12 Aug 2019 15:24:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190812135628.624gtsgv4if2zd6l@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/iommu: remove usage of
 {set/clear}_identity_p2m_entry against PV domains
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Roman Shaposhnik <roman@zededa.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xMi8xOSAyOjU2IFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIE1vbiwgQXVn
IDEyLCAyMDE5IGF0IDAyOjE3OjUzUE0gKzAxMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9u
IDgvMi8xOSAxMDoyMiBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gU3dpdGNoIHJtcnJf
aWRlbnRpdHlfbWFwcGluZyB0byB1c2UgaW9tbXVfe3VufW1hcCBpbiBvcmRlciB0bwo+Pj4gZXN0
YWJsaXNoIFJNUlIgbWFwcGluZ3MgZm9yIFBWIGRvbWFpbnMsIGxpa2UgaXQncyBkb25lIGluCj4+
PiBhcmNoX2lvbW11X2h3ZG9tX2luaXQuIFRoaXMgc29sdmVzIHRoZSBpc3N1ZSBvZiBhIFBWIGhh
cmR3YXJlIGRvbWFpbgo+Pj4gbm90IGdldHRpbmcgUk1SUiBtYXBwaW5ncyBiZWNhdXNlIHtzZXQv
Y2xlYXJ9X2lkZW50aXR5X3AybV9lbnRyeSB3YXMKPj4+IG5vdCBwcm9wZXJseSB1cGRhdGluZyB0
aGUgaW9tbXUgcGFnZSB0YWJsZXMuCj4+Cj4+IFNvcnJ5LCBJIHRoaW5rIHRoaXMgZGVzY3JpcHRp
b24gaXMgc29tZXdoYXQgYmFja3dhcmRzOiB5b3UncmUgc2F5aW5nCj4+IHdoYXQgeW91J3JlIGRv
aW5nIGZpcnN0LCBhbmQgdGhlbiBzYXlpbmcgd2hhdCB0aGUgcHJvYmxlbWF0aWMgYmVoYXZpb3IK
Pj4gd2FzLCBidXQgbm90IGFjdHVhbGx5IHNheWluZyB3aGF0IHdhcyBjYXVzaW5nIHRoZSBwcm9i
bGVtYXRpYyBiZWhhdmlvci4KPj4KPj4gV2h5IHdhcyB7c2V0LGNsZWFyfV9pZGVudGl0eV9wMm0g
bm90IHVwZGF0aW5nIHRoZSBwYWdlIHRhYmxlcz8KPj4KPj4gSSBhZ3JlZSB3aXRoIEphbiwgdGhh
dCBmaWd1cmluZyB0aGF0IG91dCBpcyBhIHByZXJlcXVpc2l0ZSBmb3IgYW55IGtpbmQKPj4gb2Yg
Zml4OiBpZiBgbmVlZF9pb21tdV9wdF9zeW5jKClgIGlzIGZhbHNlIGF0IHRoYXQgcG9pbnQgZm9y
IHRoZQo+PiBoYXJkd2FyZSBkb21haW4sIHRoZW4gdGhlcmUncyBhIGJpZ2dlciBwcm9ibGVtIHRo
YW4gUk1SUnMgbm90IGJlaW5nCj4+IGFkanVzdGVkIHByb3Blcmx5Lgo+IAo+IG5lZWRfaW9tbXVf
cHRfc3luYyBpcyBpbmRlZWQgZmFsc2UgZm9yIGEgUFYgaGFyZHdhcmUgZG9tYWluIG5vdAo+IHJ1
bm5pbmcgaW4gc3RyaWN0IG1vZGUsIHNlZToKPiAKPiBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dp
dHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmM7
aD1mOGMzYmY1M2JkMTc5M2RmOTNkN2RkZWE2NTY0ZGM5MjlmNDBjMTU2O2hiPUhFQUQjbDE5Mgo+
IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAx
OS0wNy9tc2cwMTU0Ny5odG1sCj4gCj4gVGhpcyBpcyBmaW5lIGZvciBhIG5vbi1zdHJpY3QgUFYg
aGFyZHdhcmUgZG9tYWluLCBzaW5jZSBpdCBoYXMgYWxsIHRoZQo+IGhvc3QgbWVtb3J5IChtaW51
cyBtZW1vcnkgdXNlZCBieSBYZW4pIG1hcHBlZCBpbiB0aGUgaW9tbXUgcGFnZSB0YWJsZXMKPiBl
eGNlcHQgZm9yIFJNUlIgcmVnaW9ucyBub3QgbWFya2VkIGFzIHJlc2VydmVkIGluIHRoZSBlODIw
IG1lbW9yeSBtYXAsCj4gd2hpY2ggYXJlIGFkZGVkIHVzaW5nIHNldF9pZGVudGl0eV9wMm1fZW50
cnkuCj4gCj4gVGhlIGlzc3VlIGhlcmUgaXMgdGhhdCB0aGlzIHBhdGNoIGFsb25lIGRvZXNuJ3Qg
Zml4IHRoZSBpc3N1ZSBmb3IgdGhlCj4gcmVwb3J0ZXIsIGFuZCB0aGVyZSBzZWVtcyB0byBiZSBh
biBhZGRpdGlvbmFsIGZsdXNoIHJlcXVpcmVkIGluIG9yZGVyCj4gdG8gZ2V0IHRoZSBpc3N1ZSBz
b2x2ZWQgb24gaGlzIGVuZDoKPiAKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hp
dmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDgvbXNnMDA1MjYuaHRtbAo+IAo+IE15IHRoZW9yeSBp
cyB0aGF0IHRoZSBzeXN0ZW0gUm9tYW4gaXMgdXNpbmcgaXMgYm9vdGluZyB3aXRoIERNQQo+IHJl
bWFwcGluZyBlbmFibGVkIGluIHRoZSBpb21tdSwgYW5kIHNvbWVob3cgdGhlIGNhbGwgdG8KPiBp
b21tdV9mbHVzaF9hbGwgaW4gaW50ZWxfaW9tbXVfaHdkb21faW5pdCBkb2Vzbid0IHNlZW0gdG8g
d29yawo+IHByb3Blcmx5LCB3aGlsZSBjYWxsaW5nIGlvbW11X2lvdGxiX2ZsdXNoX2FsbCBkb2Vz
IHNlZW0gdG8gZG8gdGhlCj4gcmlnaHQgdGhpbmcuIEknbSBzdGlsbCB3YWl0aW5nIGZvciBSb21h
biB0byBjb21lIGJhY2sgd2l0aCB0aGUgcmVzdWx0Cj4gb2YgbXkgbGFzdCBkZWJ1ZyBwYXRjaGVz
IGluIG9yZGVyIHRvIGZpZ3VyZSBvdXQgd2hldGhlciBteSBoeXBvdGhlc2lzCj4gYWJvdmUgaXMg
dHJ1ZS4KPiAKPiBUaGlzIGhvd2V2ZXIgd29uJ3Qgc3RpbGwgZXhwbGFpbiB0aGUgd2VpcmQgYmVo
YXZpb3VyIG9mCj4gaW9tbXVfZmx1c2hfYWxsLCBhbmQgZnVydGhlciBkZWJ1Z2dpbmcgd2lsbCBz
dGlsbCBiZSByZXF1aXJlZC4KCk9LOyBzbyB0aGlzIHBhdGNoIGhhcyBmb3VyIGVmZmVjdHMsIGl0
IGxvb2tzIGxpa2U6CgoxLiBpb21tdV9sZWdhY3lfW3VuXW1hcCAtPiBpb21tdV9bdW5dbWFwCjIu
IE1vdmUgaW9tbXUgb3BzIG91dCBvZiB7c2V0LGNsZWFyfV9pZGVudGl0eV9wMm0gZm9yIFBWIGd1
ZXN0czsKb3Blbi1jb2RlIHRoZW0gaW4gcm1ycl9pZGVudGl0eV9tYXBwaW5nCjMuIEZvciBub24t
dHJhbnNsYXRlZCBndWVzdHMsIGRvIHRoZSBvcGVyYXRpb24gdW5jb25kaXRpb25hbGx5CjQuIEFk
ZCBhIGZsdXNoCgpSZWdhcmRpbmcgIzMsIHRoZSBwcmV2aW91cyBwYXRjaCBjaGFuZ2VkIGl0IGZy
b20gImlmCmlvbW11X25lZWRzX3B0X3N5bmMiIHRvICJpZiBoYXNfaW9tbXVfcHQiOyB0aGlzIG9u
ZSBjaGFuZ2VzIGl0IHRvCiJhbHdheXMiLiAgSXMgdGhhdCB3aGF0IHlvdSBpbnRlbmRlZD8KCkkg
ZG9uJ3QgcmVhbGx5IHNlZSB0aGUgcG9pbnQgb2YgIzI6IGZyb20gdGhlIGRldmljZSdzIHBlcnNw
ZWN0aXZlLCB0aGUKInBoeXNtYXAiIGlzIHRoZSBJT01NVSBmb3IgUFYgZ3Vlc3RzLCBhbmQgSU9N
TVUrcDJtIGZvciBIVk0gZ3Vlc3RzOyBpdAptYWtlcyBzZW5zZSB0byBoYXZlIGEgc2luZ2xlIHBs
YWNlIHRvIGNhbGwgZm9yIGVpdGhlciB0eXBlIG9mIGd1ZXN0LApyYXRoZXIgdGhhbiBvcGVuLWNv
ZGluZyBldmVyeSBsb2NhdGlvbi4KCkNhbid0IGNvbW1lbnQgb24gdGhlIG90aGVyIGFzcGVjdHMu
CgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
