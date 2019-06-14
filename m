Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398FA456EA
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 10:04:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbh8k-00076x-VL; Fri, 14 Jun 2019 08:00:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PpO1=UN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hbh8k-00076s-4S
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 08:00:50 +0000
X-Inumbo-ID: 8416db0e-8e7a-11e9-9ad7-9b159dd6f29d
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8416db0e-8e7a-11e9-9ad7-9b159dd6f29d;
 Fri, 14 Jun 2019 08:00:47 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lIK8uRyv3J9C8Tab6kOP2ulS71S5RTNGfnFsGUL07XbS+821uBhx7jt9xR3JgO8RLAn43MYqT0
 yYjySklJiQ59Sb12ApaM+zOvobdyE3jlGrzLgoYMKeD/SLmJok9pxRz3Gteu5cTtZh9g+4XA0z
 gPeDChkEBC8+64hV4VCOfeXK2HJNRnnceJG0rpKF9kq5K/FFDM6GqOPc6XJJ/9xlq4eaL0Njb8
 U3c6dYGyeykWQtUx4H3CJAo5acH6k0Ujtsw/1KbBYrwq6JuPTnx8x+lyEWm40MkL3dkS6EWgKt
 o50=
X-SBRS: 2.7
X-MesageID: 1730806
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,372,1557201600"; 
   d="scan'208";a="1730806"
To: Juergen Gross <jgross@suse.com>, Ankur Arora <ankur.a.arora@oracle.com>,
 <linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-5-ankur.a.arora@oracle.com>
 <11f8b620-11ac-7075-019a-30d6bad7583c@citrix.com>
 <fbfc0a0c-3707-7f17-9f2a-6c9d2c7b05b1@oracle.com>
 <59f7cc19-cd9b-119a-1715-50a947cd995d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <2d097a0d-a538-86ec-060b-492629a86bc3@citrix.com>
Date: Fri, 14 Jun 2019 09:00:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <59f7cc19-cd9b-119a-1715-50a947cd995d@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [RFC PATCH 04/16] x86/xen: hypercall support for
 xenhost_t
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
Cc: pbonzini@redhat.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joao.m.martins@oracle.com, konrad.wilk@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQvMDYvMjAxOSAwODozNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxNC4wNi4xOSAw
OToyMCwgQW5rdXIgQXJvcmEgd3JvdGU6Cj4+IE9uIDIwMTktMDYtMTIgMjoxNSBwLm0uLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMDkvMDUvMjAxOSAxODoyNSwgQW5rdXIgQXJvcmEgd3Jv
dGU6Cj4+Pj4gQWxsb3cgZm9yIGRpZmZlcmVudCBoeXBlcmNhbGwgaW1wbGVtZW50YXRpb25zIGZv
ciBkaWZmZXJlbnQgeGVuaG9zdAo+Pj4+IHR5cGVzLgo+Pj4+IE5lc3RlZCB4ZW5ob3N0LCB3aGlj
aCBoYXMgdHdvIHVuZGVybHlpbmcgeGVuaG9zdHMsIGNhbiB1c2UgYm90aAo+Pj4+IHNpbXVsdGFu
ZW91c2x5Lgo+Pj4+Cj4+Pj4gVGhlIGh5cGVyY2FsbCBtYWNyb3MgKEhZUEVSVklTT1JfKikgaW1w
bGljaXRseSB1c2UgdGhlIGRlZmF1bHQKPj4+PiB4ZW5ob3N0LngKPj4+PiBBIG5ldyBtYWNybyAo
aHlwZXJ2aXNvcl8qKSB0YWtlcyB4ZW5ob3N0X3QgKiBhcyBhIHBhcmFtZXRlciBhbmQKPj4+PiBk
b2VzIHRoZQo+Pj4+IHJpZ2h0IHRoaW5nLgo+Pj4+Cj4+Pj4gVE9ETzoKPj4+PiDCoMKgIC0gTXVs
dGljYWxscyBmb3Igbm93IGFzc3VtZSB0aGUgZGVmYXVsdCB4ZW5ob3N0Cj4+Pj4gwqDCoCAtIHhl
bl9oeXBlcmNhbGxfKiBzeW1ib2xzIGFyZSBvbmx5IGdlbmVyYXRlZCBmb3IgdGhlIGRlZmF1bHQK
Pj4+PiB4ZW5ob3N0Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5rdXIgQXJvcmEgPGFua3Vy
LmEuYXJvcmFAb3JhY2xlLmNvbT4KPj4+Cj4+PiBBZ2Fpbiwgd2hhdCBpcyB0aGUgaHlwZXJ2aXNv
ciBuZXN0aW5nIGFuZC9vciBndWVzdCBsYXlvdXQgaGVyZT8KPj4gVHdvIGh5cGVydmlzb3JzLCBM
MCBhbmQgTDEsIGFuZCB0aGUgZ3Vlc3QgaXMgYSBjaGlsZCBvZiB0aGUgTDEKPj4gaHlwZXJ2aXNv
ciBidXQgY291bGQgaGF2ZSBQViBkZXZpY2VzIGF0dGFjaGVkIHRvIGJvdGggTDAgYW5kIEwxCj4+
IGh5cGVydmlzb3JzLgo+Pgo+Pj4KPj4+IEkgY2FuJ3QgdGhpbmsgb2YgYW55IGNhc2Ugd2hlcmUg
YSBzaW5nbGUgcGllY2Ugb2Ygc29mdHdhcmUgY2FuCj4+PiBsZWdpdGltYXRlbHkgaGF2ZSB0d28g
aHlwZXJjYWxsIHBhZ2VzLCBiZWNhdXNlIGlmIGl0IGhhcyBvbmUgd29ya2luZwo+Pj4gb25lLCBp
dCBpcyBieSBkZWZpbml0aW9uIGEgZ3Vlc3QsIGFuZCB0aGVyZWZvcmUgbm90IHByaXZpbGVnZWQK
Pj4+IGVub3VnaCB0bwo+Pj4gdXNlIHRoZSBvdXRlciBvbmUuCj4+IERlcGVuZGluZyBvbiB3aGlj
aCBoeXBlcmNhbGwgcGFnZSBpcyB1c2VkLCB0aGUgaHlwZXJjYWxsIHdvdWxkCj4+IChldmVudHVh
bGx5KSBsYW5kIGluIHRoZSBjb3JyZXNwb25kaW5nIGh5cGVydmlzb3IuCj4+Cj4+IEp1ZXJnZW4g
ZWxzZXdoZXJlIHBvaW50ZWQgb3V0IHByb3h5aW5nIGh5cGVyY2FsbHMgaXMgYSBiZXR0ZXIgYXBw
cm9hY2gsCj4+IHNvIEknbSBub3QgcmVhbGx5IGNvbnNpZGVyaW5nIHRoaXMgYW55IG1vcmUgYnV0
LCBnaXZlbiB0aGlzIGxheW91dCwgYW5kCj4+IGFzc3VtaW5nIHRoYXQgdGhlIGh5cGVyY2FsbCBw
YWdlcyBjb3VsZCBiZSBlbmNvZGVkIGRpZmZlcmVudGx5IHdvdWxkIGl0Cj4+IHN0aWxsIG5vdCB3
b3JrPwo+Cj4gSHlwZXJjYWxscyBtaWdodCB3b3JrLCBidXQgaXQgaXMgYSBiYWQgaWRlYSBhbmQg
YSB2aW9sYXRpb24gb2YgbGF5ZXJpbmcKPiB0byBsZXQgYSBMMSBndWVzdCBpc3N1ZSBoeXBlcmNh
bGxzIHRvIEwwIGh5cGVydmlzb3IsIGFzIHRob3NlIGh5cGVyY2FsbHMKPiBjb3VsZCBpbmZsdWVu
Y2Ugb3RoZXIgTDEgZ3Vlc3RzIGFuZCBldmVuIHRoZSBMMSBoeXBlcnZpc29yLgo+Cj4gSG1tLCB0
aGlua2luZyBtb3JlIGFib3V0IGl0LCBJIGV2ZW4gZG91YnQgdGhvc2UgaHlwZXJjYWxscyBjb3Vs
ZCB3b3JrIGluCj4gYWxsIGNhc2VzOiB3aGVuIGlzc3VlZCBmcm9tIGEgTDEgUFYgZ3Vlc3QgdGhl
IGh5cGVyY2FsbHMgd291bGQgc2VlbSB0bwo+IGJlIGlzc3VlZCBmcm9tIHVzZXIgbW9kZSBmb3Ig
dGhlIEwwIGh5cGVydmlzb3IsIGFuZCB0aGlzIGlzIG5vdCBhbGxvd2VkLgoKVGhhdCBpcyBleGFj
dGx5IHRoZSBwb2ludCBJIHdhcyB0cnlpbmcgdG8gbWFrZS4KCklmIEwyIGlzIGFuIEhWTSBndWVz
dCwgdGhlbiBib3RoIGl0cyBoeXBlcmNhbGwgcGFnZXMgd2lsbCBiZSB1c2luZwpWTUNBTEwvVk1N
Q0FMTCB3aGljaCB3aWxsIGVuZCB1cCBtYWtpbmcgaHlwZXJjYWxscyB0byBMMSwgcmF0aGVyIHRo
YW4KaGF2aW5nIG9uZSBnbyB0byBMMC4KCklmIEwyIGlzIGEgUFYgZ3Vlc3QsIHRoZW4gb25lIGh5
cGVyY2FsbCBwYWdlIHdpbGwgYmUgU1lTQ0FMTC9JTlQgODIKd2hpY2ggd2lsbCBnbyB0byBMMSwg
YW5kIG9uZSB3aWxsIGJlIFZNQ0FMTC9WTU1DQUxMIHdoaWNoIGdvZXMgdG8gTDAsCmJ1dCBMMCB3
aWxsIHNlZSBpdCBmcm9tIHJpbmcxL3JpbmczIGFuZCByZWplY3QgdGhlIGh5cGVyY2FsbC4KCkhv
d2V2ZXIgeW91IG5lc3QgdGhlIHN5c3RlbSwgZXZlcnkgZ3Vlc3Qgb25seSBoYXMgYSBzaW5nbGUg
b2NjdXJyZW5jZSBvZgoic3VwZXJ2aXNvciBzb2Z0d2FyZSIsIHNvIG9ubHkgaGFzIGEgc2luZ2xl
IGNvbnRleHQgdGhhdCB3aWxsIGJlCnRvbGVyYXRlZCB0byBtYWtlIGh5cGVyY2FsbHMgYnkgdGhl
IG5leHQgaHlwZXJ2aXNvciB1cC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
