Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B2B7C5E8
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 17:17:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsqJ4-0004kp-JV; Wed, 31 Jul 2019 15:14:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Msd=V4=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hsqJ3-0004kd-0h
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 15:14:21 +0000
X-Inumbo-ID: de49600e-b3a5-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id de49600e-b3a5-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 15:14:19 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: f8cIaU7lGXh/hblQsmCwvq/RPAITLECvrHmFm6tt6YcaYzzjX4E1CLLLUC/loeVogHJ3yyW3jS
 ZZyud1mWXHFFAq9Zj+96sDkR3KvPB2kyrCJl2MsvjiP8f4/NwP3YB6JSX/jRIRvtVDTtY6PTtv
 PQ7eyWaa/e06vZ96cXoB0hyfO13uwwfN7KfYrdbHlPHjkXEq9crqtlbaNeaxLfUvB39TKzOFEB
 T/mRsHgL1QNrAUVT0CtA9W5nOA5RubN62q0yzJMqEMFUd/bKpodFekgIWvEIa5fzw3xrPypblX
 wdM=
X-SBRS: 2.7
X-MesageID: 3685767
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,330,1559534400"; 
   d="scan'208";a="3685767"
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <5c6f3ed7b2f444918feea4f4b7cec107@ainfosec.com>
 <CABfawhmhPy-BWwRfZ-+pB1Zr98ony9jeXoOEOx+HZBm_z+Ez=g@mail.gmail.com>
 <93971fac-b839-802f-a508-39fa79478db5@citrix.com>
 <CABfawh=B_nOAbV-JzCpFUEfcmVnudAJxh7buUVJRFqMPm2yE6g@mail.gmail.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <1572ea20-d996-8064-a375-8e8b0b9a7052@citrix.com>
Date: Wed, 31 Jul 2019 16:14:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CABfawh=B_nOAbV-JzCpFUEfcmVnudAJxh7buUVJRFqMPm2yE6g@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] Generating Go bindings for libxl
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
Cc: Brendan Kerrigan <kerriganb@ainfosec.com>, "wl@xen.org" <wl@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Nicholas Rosbrook <rosbrookn@ainfosec.com>,
 Nicolas Belouin <nicolas.belouin@gandi.net>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8zMC8xOSA3OjM5IFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gT24gVHVlLCBKdWwg
MzAsIDIwMTkgYXQgOTo0OSBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+IHdyb3RlOgo+Pgo+PiBPbiA3LzMwLzE5IDI6NDggUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90
ZToKPj4+IE9uIFR1ZSwgSnVsIDMwLCAyMDE5IGF0IDc6MzIgQU0gTmljaG9sYXMgUm9zYnJvb2sK
Pj4+IDxyb3Nicm9va25AYWluZm9zZWMuY29tPiB3cm90ZToKPj4+Pgo+Pj4+IEhlbGxvLAo+Pj4+
Cj4+Pj4gQXMgYSBmb2xsb3cgdXAgdG8gdGhlIHByZXNlbnRhdGlvbiB0aGF0IEJyZW5kYW4gS2Vy
cmlnYW4gYW5kIEkgZ2F2ZSBhdCBYZW4KPj4+PiBzdW1taXQgZWFybGllciB0aGlzIG1vbnRoLCAi
Q2xpZW50IFZpcnR1YWxpemF0aW9uIFRvb2xzdGFjayBpbiBHbyIsIEkgd291bGQgbGlrZSB0byBv
cGVuCj4+Pj4gYSBkaXNjdXNzaW9uIGFyb3VuZCB0aGUgZGV2ZWxvcG1lbnQgb2YgR28gYmluZGlu
Z3MgZm9yIGxpYnhsLiBHZW9yZ2UgRHVubGFwLAo+Pj4+IE5pY29sYXMgQmVsb3VpbiBhbmQgSSBo
YXZlIGhhZCBzb21lIGRpc2N1c3Npb24gb2ZmLWxpbmUgYWxyZWFkeS4KPj4+Pgo+Pj4+IFNvIGZh
ciwgdGhlc2UgYXJlIHRoZSB0b3BpY3Mgb2YgZGlzY3Vzc2lvbjoKPj4+Cj4+PiBIaSBOaWNob2xh
cywKPj4+IHRvIGFkZCB0byB0aGUgbGlzdCBvZiB0b3BpY3MgSSBqdXN0IHdhbnQgdG8gbWVudGlv
biB0aGF0IHBlcmhhcHMgaXQKPj4+IG1heSBiZSBiZW5lZmljaWFsIHRvIGNvbnNpZGVyIHBhcnRz
IG9mIHRoZSBnbyBiaW5kaW5ncyBub3QgZ28gdG8gbGlieGwKPj4+IGF0IGFsbC4gSSBoYXZlIGJl
ZW4gZGlnZ2luZyB0aHJvdWdoIGxpYnhsIGZvciB0aGUgcGFzdCBjb3VwbGUgbW9udGhzCj4+PiBh
bmQgaXQncyBhc3luY2hyb25vdXMgY2FsbGJhY2sgc3lzdGVtIGlzIGRhbW4gbmVhciBpbXBvc3Np
YmxlIHRvCj4+PiBmb2xsb3cgYW5kIEkganVzdCBjYW4ndCBzaGFrZSB0aGUgZmVlbGluZyB0aGF0
IGl0IHdvdWxkIGJlIGEgbG90Cj4+PiBlYXNpZXIgdG8gZm9sbG93IGlmIGl0IHdhcyBpbiBnby4K
Pj4KPj4gU28gSSBkb24ndCB0aGluayB3ZSdyZSBldmVyIGdvaW5nIHRvIHN3aXRjaCB0byBnb2xh
bmcgYmVpbmcgb3VyIHByaW1hcnkKPj4gdG9vbHN0YWNrIGxhbmd1YWdlLCBiZWNhdXNlIGNhbGxp
bmcgaXQgZnJvbSBvdGhlciBsYW5ndWFnZXMgaXNuJ3QgcmVhbGx5Cj4+IGFuIG9wdGlvbi4gIFRo
YXQgbWVhbnMgdGhhdCBpbXBsZW1lbnRpbmcgdGhpbmdzIGxpa2UgZG9tYWluIGNyZWF0aW9uIGlu
Cj4+IEdvIG1lYW4gZHVwbGljYXRpbmcgZnVuY3Rpb25hbGl0eSBpbiB0d28gcGxhY2VzLCB3aGlj
aCBpcwo+PiBleHRyYW9yZGluYXJpbHkgZXhwZW5zaXZlIGZyb20gYSBzb2Z0d2FyZS1lbmdpbmVl
cmluZyBwZXJzcGVjdGl2ZS4KPj4KPj4gRldJVyBJIHRoaW5rIHRoZSBhc3luY2hyb25vdXMgY2Fs
bGJhY2sgc3lzdGVtIGp1c3QgbmVlZHMgYmV0dGVyCj4+IGRvY3VtZW50YXRpb24uICBJdCBhbHdh
eXMgdGFrZXMgbWUgYSBsaXR0bGUgYml0IHRvIGdldCBteSBiZWFyaW5ncyBhZ2Fpbgo+PiBvbmNl
IEkgaGF2ZSB0byBjaGFuZ2UgdGhhdCBjb2RlLCBidXQgb25jZSBJIGRvLCBldmVyeXRoaW5nIGlz
Cj4+IGNvbnNpc3RlbnQuICBBbmQgYXMgSSB1bmRlcnN0YW5kIGl0LCB0aGUgZXh0ZXJuYWwgaW50
ZXJmYWNlIHdhcyB3cml0dGVuCj4+IHByaW1hcmlseSB3aXRoIGxpYnZpcnQgaW4gbWluZCwgc28g
aXQgd291bGQgcHJvYmFibHkgYmUgZGlmZmljdWx0IHRvCj4+IGNoYW5nZSBpdCB3aGlsZSByZW1h
aW5pbmcgY29tcGF0aWJsZS4KPj4KPj4+IE5vdCB0byBtZW50aW9uIHRoZSBwZXJmb3JtYW5jZQo+
Pj4gaXNzdWVzIHdpdGggdGhlIGJ1aWx0LWluIGdhcmJhZ2UgY29sbGVjdG9yCj4+Cj4+IFdoYXQg
cGVyZm9ybWFuY2UgaXNzdWVzIHdlcmUgeW91IHNlZWluZyB3aXRoIGxpYnhsJ3MgZ2FyYmFnZSBj
b2xsZWN0b3I/Cj4+IEkgdGhvdWdodCBpdCBqdXN0IGtlcHQgYSBsaXN0IG9mIHBvaW50ZXJzIGFu
ZCBmcmVlZCB0aGVtIGF0IHRoZSB2ZXJ5IGVuZC4KPiAKPiBJIGRpZG4ndCBpbnZlc3RpZ2F0ZSB0
b28gY2xvc2VseSBidXQgb24gc29tZSBvY2Nhc2lvbnMgYSBjb25zaWRlcmFibGUKPiBhbW91bnQg
b2YgdGhlIGV4ZWN1dGlvbiB0aW1lIHdhcyBiZWluZyBzcGVudCBpbiB0aGVyZSBhY2NvcmRpbmcg
dG8KPiBjYWxsZ3JpbmQuIEFmdGVyIGV2ZXJ5dGhpbmcgd2FzIGZpbmlzaGVkIGluIGEgZG9tYWlu
IGNyZWF0aW9uIHhsIHdvdWxkCj4ganVzdCAiaGFuZyIgaW4gdGhlcmUgZm9yIGEgd2hpbGUgYmVm
b3JlIGFjdHVhbGx5IGV4aXRpbmcuIEl0IHdhcyBub3QKPiB2ZXJ5IGNvbnNpc3RlbnQgYW5kIHJl
Y29tcGlsaW5nIGxpYnhsIHNvbWV0aW1lcyBzcGVkIHRoaW5ncyB1cC4KPiBIYXZlbid0IHJ1biBp
bnRvIGl0IHNpbmNlIEkndmUgdXBncmFkZWQgdG8gZGViaWFuIGJ1c3RlciBhbmQgYSBuZXdlcgo+
IGdjYy4KCklzIGl0IHBvc3NpYmxlIHRoaXMgd2FzIGFjdHVhbGx5IGRvaW5nIHRoZSAiYXN5bmMi
IHBhcnRzIG9mIGxvbmctcnVubmluZwpvcGVyYXRpb25zPyAgV2hlbiBubyBhc3luYyBjYWxsYmFj
ayBpcyBwcm92aWRlZCwgdGhlIHZlcnkgbGFzdCB0aGluZwp0aGF0IGhhcHBlbnMgYmVmb3JlIGEg
cmV0dXJuIGlzIHRvICBzbGVlcCBhbmQgd2FpdCBmb3IgdGhlIG5leHQgdGhpbmcgdG8KaGFwcGVu
LCB0aGVuIGNhbGwgdGhlIG5leHQgdGhpbmcgaW4gdGhlIGFzeW5jIGNoYWluLgoKIC1HZW9yZ2UK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
