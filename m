Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB15145403
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 12:47:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuERF-0000gf-1v; Wed, 22 Jan 2020 11:44:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vprz=3L=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iuERD-0000ga-Ll
 for xen-devel@lists.xen.org; Wed, 22 Jan 2020 11:44:47 +0000
X-Inumbo-ID: 91c07b5c-3d0c-11ea-b833-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91c07b5c-3d0c-11ea-b833-bc764e2007e4;
 Wed, 22 Jan 2020 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579693479;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=taTvG30o2lzCFECZ8oPRanYhtgw4edbpBHKC542YCjs=;
 b=cumm8gEjQkSOSJWqj5ea9XQFehuA9XXnsrBgraP5wwD3JOyWvrpjj7jP
 du/wB4L0FUJieI/uK4Ngj5QPXb40J6Rf4MvHrOHwy+zDEufcy90jmrVc+
 LwzGrLFLaijoyAJtIUhHeTe2vILTYu5K8vcCYUGo+NQSP8vRpnFYqMdyz Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zcNe3mFlT7EO5/h/RST0bFVh6XaNyK6GZKDS2QTwuM6YeSCACvgRZvYflVq4kDi5vvmbIb+oBR
 7FpBAC3S9KW1oETTotGeRg6k+53hXNrXChWcytyitDYifGCXpMtDg8klqKrXuhhzcHcMEWjpwZ
 1H3R6DDRft0Mjc644Oh2KRooFvOZXaWmGjqq2+ivz+uT/fGoO//xOrqn9GoGuio5PDG0h/2LF6
 CNZtjISRoh49iKsbt86RDR+Pi+dbd21QsuoWEOcFPjux/HH3dYsnMWGavfev9OlaSDTdl+DLHa
 vIU=
X-SBRS: 2.7
X-MesageID: 11275254
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,349,1574139600"; d="scan'208";a="11275254"
To: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
 <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
 <18e39089-80e7-07be-d2fe-409fa1dfc083@citrix.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <3fc57c86-f861-9a7b-a248-6c45824ab6f5@citrix.com>
Date: Wed, 22 Jan 2020 11:44:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <18e39089-80e7-07be-d2fe-409fa1dfc083@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: "sergey.dyasli@citrix.com >> Sergey Dyasli" <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMDEvMjAyMCAxMDo1NywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxLzIyLzIwIDEw
OjE0IEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDIyLzAxLzIwMjAgMTA6MDEs
IFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+PiBPbiAyMC8wMS8yMDIwIDEwOjAxLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+PiBPbiAxNy4wMS4yMDIwIDE3OjQ0LCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+
Pj4+PiB2MiAtLT4gdjM6Cj4+Pj4+IC0gUmVtb3ZlIGh2bWxvYWRlciBmaWx0ZXJpbmcKPj4+Pgo+
Pj4+IFdoeT8gU2VlaW5nIHRoZSBwcmlvciBkaXNjdXNzaW9uLCBob3cgYWJvdXQgYWRkaW5nIFhF
TlZFUl9kZW5pZWQgdG8KPj4+PiByZXR1cm4gdGhlICJkZW5pZWQiIHN0cmluZywgYWxsb3dpbmcg
Y29tcG9uZW50cyB3aGljaCB3YW50IHRvIGZpbHRlcgo+Pj4+IHRvIGtub3cgZXhhY3RseSB3aGF0
IHRvIGxvb2sgZm9yPyBBbmQgdGhlbiByZS1hZGQgdGhlIGZpbHRlcmluZyB5b3UKPj4+PiBoYWQ/
IChUaGUgaGVscCB0ZXh0IG9mIHRoZSBjb25maWcgb3B0aW9uIHNob3VsZCB0aGVuIHBlcmhhcHMg
YmUKPj4+PiBleHRlbmRlZCB0byBtYWtlIHZlcnkgY2xlYXIgdGhhdCB0aGUgY2hvc2VuIHN0cmlu
ZyBzaG91bGQgbm90IG1hdGNoCj4+Pj4gYW55dGhpbmcgdGhhdCBjb3VsZCBwb3RlbnRpYWxseSBi
ZSByZXR1cm5lZCBieSBhbnkgb2YgdGhlIFhFTlZFUl8KPj4+PiBzdWItb3BzLikKPj4+Cj4+PiBJ
IGhhZCB0aGUgZm9sbG93aW5nIHJlYXNvbmluZzoKPj4+Cj4+PiAxLiBNb3N0IHJlYWwtd29ybGQg
dXNlcnMgd291bGQgc2V0IENPTkZJR19YU01fREVOSUVEX1NUUklORz0iIiBhbnl3YXkuCj4+Pgo+
Pj4gMi4gRmlsdGVyaW5nIGluIERNSSB0YWJsZXMgaXMgbm90IGEgY29tcGxldGUgc29sdXRpb24s
IHNpbmNlIGRlbmllZAo+Pj4gc3RyaW5nIGxlYWtzIGVsc2V3aGVyZSB0aHJvdWdoIHRoZSBoeXBl
cmNhbGwgKFBWIGd1ZXN0cywgc3lzZnMsIGRyaXZlcgo+Pj4gbG9ncykgYXMgQW5kcmV3IGhhcyBw
b2ludGVkIG91dCBpbiB0aGUgcHJldmlvdXMgZGlzY3Vzc2lvbi4KPj4+Cj4+PiBPbiB0aGUgb3Ro
ZXIgaGFuZCwgU01CaW9zIGZpbHRlcmluZyBzbGlnaHRseSBpbXByb3ZlcyB0aGUgc2l0dWF0aW9u
IGZvcgo+Pj4gSFZNIGRvbWFpbnMsIHNvIEkgY2FuIHJldHVybiBpdCBpZiBtYWludGFpbmVycyBm
aW5kIGl0IHdvcnRoeS4KPj4KPj4gV2hpbGUgSSBhbSBub3QgYSBtYWludGFpbmVyIG9mIHRoaXMg
Y29kZSwgbXkgY29uY2VybiBpcyB5b3UgaW1wb3NlIHRoZQo+PiBjb252ZXJzaW9uIGZyb20gImRl
bmllZCIgdG8gIiIgdG8gYWxsIHRoZSB1c2VycyAoaW5jbHVkZSB0aG9zZSB3aG8gd2FudHMKPj4g
dG8ga2VlcCAiZGVuaWVkIikuCj4+Cj4+IElmIHlvdSB3ZXJlIGRvaW5nIGFueSBmaWx0ZXJpbmcg
aW4gaHZtbG9hZGVyLCB0aGVuIGl0IHdvdWxkIGJlIGJlc3QgaWYKPj4gdGhpcyBpcyBjb25maWd1
cmFibGUuIEJ1dCB0aGlzIGlzIGEgYml0IHBvaW50bGVzcyBpZiB5b3UgYWxyZWFkeSBhbGxvdwo+
PiB0aGUgdXNlciB0byBjb25maWd1cmUgdGhlIHN0cmluZyBhdCB0aGUgaHlwZXJ2aXNvciBsZXZl
bCA6KS4KPgo+IFNvIHRoZXJlIGFyZSB0d28gdGhpbmdzIHdlJ3JlIGNvbmNlcm5lZCBhYm91dDoK
PiAtIFNvbWUgcGVvcGxlIGRvbid0IHdhbnQgdG8gc2NhcmUgdXNlcnMgd2l0aCBhICI8ZGVuaWVk
PiIgc3RyaW5nCj4gLSBTb21lIHBlb3BsZSBkb24ndCB3YW50IHRvICJzaWxlbnRseSBmYWlsIiB3
aXRoIGEgIiIgc3RyaW5nCj4KPiBUaGUgZmFjdCBpcywgaW4gKmJvdGggY2FzZXMqLCB0aGlzIGlz
IGEgVUkgcHJvYmxlbS4gIEVWRVJZIGNhbGxlciBvZgo+IHRoaXMgaW50ZXJmYWNlIHNob3VsZCBm
aWd1cmUgb3V0IGluZGVwZW5kZW50bHkgd2hhdCBhIGdyYWNlZnVsIHdheSBvZgo+IGhhbmRsaW5n
IGZhaWx1cmUgaXMgZm9yIHRoZWlyIHRhcmdldCBVSS4gIEFueSBjYWxsZXIgd2hvIGRvZXMgbm90
IHRoaW5rCj4gY2FyZWZ1bGx5IGFib3V0IHdoYXQgdG8gZG8gaW4gdGhlIGZhaWx1cmUgY2FzZSBp
cyBidWdneSAtLSB3aGljaAo+IGluY2x1ZGVzIGV2ZXJ5IHNpbmdsZSBjYWxsZXIgdG9kYXkuICBU
aGUgQ09ORklHX1hTTV9ERU5JRURfU1RSSU5HIGlzIGEKPiBncm9zcyBoYWNrIGZhbGxiYWNrIGZv
ciBidWdneSBVSXMuCj4KPiBOb3csIEkgZG9uJ3QgbGlrZSB0byB0ZWxsIG90aGVyIHBlb3BsZSB0
byBkbyB3b3JrLCBhbmQgSSBjZXJ0YWlubHkgZG9uJ3QKPiBwbGFuIG9uIGZpeGluZyBodm1sb2Fk
ZXIgYXQgdGhlIG1vbWVudCwgYmVjYXVzZSBpdCdzIGxvdy1wcmlvcml0eSBmb3IKPiBtZS4gIEJ1
dCBJIGRvIHRoaW5rIHRoYXQgaGF2aW5nIGh2bWxvYWRlciBkZXRlY3QgZmFpbHVyZSBhbmQgZXhw
bGljaXRseQo+IG1ha2UgYSBzZW5zaWJsZSBkZWNpc2lvbiBpcyB0aGUgcmlnaHQgdGhpbmcgdG8g
ZG8sIHJlZ2FyZGxlc3Mgb2YgdGhlCj4gYXZhaWxhYmlsaXR5IG9mIENPTkZJR19YU01fREVOSUVE
X1NUUklORyB0byB3b3JrIGFyb3VuZCBidWdneSBjYWxsZXJzLgoKSXQncyBub3QgZW50aXJlbHkg
Y2xlYXIgdG8gbWUgd2hhdCB5b3Ugc3VnZ2VzdCB0byBkbyB3aXRoIGh2bWxvYWRlci4KQ291bGQg
eW91IGVsYWJvcmF0ZSBhIGJpdD8KCi0tClRoYW5rcywKU2VyZ2V5CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
