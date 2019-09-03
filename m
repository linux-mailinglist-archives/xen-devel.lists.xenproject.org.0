Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF95A6530
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 11:30:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i555H-0004YK-9H; Tue, 03 Sep 2019 09:26:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=spUC=W6=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1i555G-0004Y5-0n
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 09:26:42 +0000
X-Inumbo-ID: ef7da642-ce2c-11e9-b95f-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef7da642-ce2c-11e9-b95f-bc764e2007e4;
 Tue, 03 Sep 2019 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567502801;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=52LXoZ/7BPrDxFTjQAL/Em/VJ6Y8ZY9Kr8YNCuwC5CY=;
 b=BrjYfOS8x+3eZwEn15WPc1Wdxu8NUYpWYfz9g7NvC8sLVtW9MRLtN1aZ
 QZ4RrPTY1mpeRaarideDO/tFcKe1aD1w9BJmsouYO40zoDDTrwQaWvAfM
 cB3dke5G1c9EqLXegYShOUJIb2MkJNUZNha7YDEBMsHdNH4glfxT+jmFu w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=edvin.torok@citrix.com;
 spf=Pass smtp.mailfrom=edvin.torok@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 edvin.torok@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="edvin.torok@citrix.com";
 x-sender="edvin.torok@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 edvin.torok@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="edvin.torok@citrix.com";
 x-sender="edvin.torok@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="edvin.torok@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C3vTfgIC/H+WoQZEGfguOrNO66N4lZRbeWgTZ80d0EQE6f9BP3PQKluKn2bup0ntxJws48cgw4
 AHibdhRUcnd7Y6zSj/vHey9BELejBCOrCpUArYlXpInK6DA/Qf/zbh4BQrvm1yeqbnwRoL1kbC
 m7iZg0yL14lfmLAPWhVijIIpACykEbzicwK9ePr9UKdtt3TRc/E7blYiDU3ZYEEjY9K07O7oNS
 0+Xjb10PxJvcXdAAlZ80y6NdYeubA7hK8GglWHSefowyVdkWkn1GRLwBPxz02hAY3f0T5DjVgF
 5kk=
X-SBRS: 2.7
X-MesageID: 5096282
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,462,1559534400"; 
   d="scan'208";a="5096282"
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1567448405.git.edvin.torok@citrix.com>
 <a4ce05dc1da29722dc6292159a2f83811af84f6f.1567448405.git.edvin.torok@citrix.com>
 <15f2f120-8362-62f3-c175-5ca4b7e35d57@suse.com>
From: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>
Openpgp: preference=signencrypt
Message-ID: <1d2cfe43-0e01-4543-4a82-a868a1b9eeea@citrix.com>
Date: Tue, 3 Sep 2019 10:26:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <15f2f120-8362-62f3-c175-5ca4b7e35d57@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/1] x86/arch: VM resume: avoid RDTSC
 emulation due to host clock drift
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDkvMjAxOSAwODo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDIuMDkuMjAxOSAy
MDoyNywgRWR3aW4gVMO2csO2ayAgd3JvdGU6Cj4+IE9uIGEgSW50ZWwoUikgWGVvbihSKSBDUFUg
RTUtMjY5NyB2MyBAIDIuNjBHSHogdGhlIGhvc3QgZnJlcXVlbmN5IGRyaWZ0czoKPj4gYGBgCj4+
IChYRU4pIFsgICAgNi42MDc2OTNdIERldGVjdGVkIDI2MDAuMDA0IE1IeiBwcm9jZXNzb3IuCj4+
IChYRU4pIFsgMjY3NC4yMTMwODFdIGRvbTEoaHZtKTogbW9kZT0wLG9mcz0weGZmZmVlNmY3MGI3
ZmFhNDgsa2h6PTI2MDAwMTgsaW5jPTMKPj4gKFhFTikgWyAyNjc0LjIxMzA4N10gZG9tMihodm0p
OiBtb2RlPTAsb2ZzPTB4ZmZmZWU2ZmQ0OTk4MzVjMCxraHo9MjYwMDAxOCxpbmM9Mgo+PiBgYGAK
Pj4KPj4gVGhlIDIgZG9tYWlucyB3ZXJlIHN1c3BlbmRlZCBwcmlvciB0byByZWJvb3RpbmcgdGhl
IGhvc3QgYW5kIGFwcGx5aW5nIGEKPj4geGVuL21pY3JvY29kZSBwYXRjaC4gQWZ0ZXIgdGhlIHJl
Ym9vdCB0aGUgZnJlcXVlbmN5IG9mIHRoZSBob3N0IHdhcyBkZWVtZWQgdG8KPj4gYmUgc2xpZ2h0
bHkgZGlmZmVyZW50LCBhbmQgdGhlcmVmb3JlIHN3aXRjaGluZyBvbiBSRFRTQyBlbXVsYXRpb24g
Zm9yIHRoZSBMaW51eAo+PiBIVk0gZ3Vlc3QsIGV2ZW4gdGhvdWdoIHRoZSBkaWZmZXJlbmNlIHdh
cyBvbmx5IDUgcHBtLiBUaGlzIENQVSBkb2Vzbid0IHN1cHBvcnQKPj4gVFNDIHNjYWxpbmcuCj4+
Cj4+IFRoZXJlZm9yZSB3ZSBzaG91bGQgZWl0aGVyIG1lYXN1cmUgdGhlIHN0YW5kYXJkIGRldmlh
dGlvbiBvZiBvdXIgY2FsaWJyYXRpb24KPj4gYW5kIGhhdmUgYSByYW5nZSBvZiBhY2NlcHRhYmxl
IGZyZXF1ZW5jaWVzIGFzICJzYW1lIiwgb3IgaGF2ZSBhIHN0YXRpYwo+PiB0b2xlcmFuY2UgdmFs
dWUuCj4+Cj4+IFRoZSBwbGF0Zm9ybSB0aW1lcidzIGNsb2NrIGZyZXF1ZW5jeSBhY2N1cmFjeSBp
czoKPj4gKiBJQS1QQyBIUEVUIFNwZWNpZmljYXRpb24gMS4wYSBzZWN0aW9ucyAyLjIgYW5kIDIu
NC4xOiA1MDAgcHBtIG9yIGJldHRlcgo+PiAqIEFDUEkgUE0gdGltZXIsIGFuZCBQSVQgdGltZXIg
ZG8gbm90IGhhdmUgZGVmaW5lZCBhY2N1cmFjaWVzCj4+ICogSW50ZWwgMzAwIFNlcmllcyBkYXRh
c2hlZXQgc2VjdGlvbiAyNS42OiAyNCBNSHogY3J5c3RhbCAxMDAgcHBtIG9yIGJldHRlcgo+PiAq
IE5UUCBGQVEgc2VjdGlvbiAzLjMgQ2xvY2sgUXVhbGl0eTogMTEgcHBtIGRyaWZ0IGR1ZSB0byB0
ZW1wZXJhdHVyZQo+PiAqIHNlY3Rpb24gMi4yLjIgY2xhaW1zIHRoYXQgUElUL0FDUEkgUE0gdGlt
ZXIgc2hhcmUgdGhlIHNhbWUgY3J5c3RhbCBhcyBIUEVUIGFuZAo+PiB0aHVzIDUwMCBwcG0gYXMg
YW4gdXBwZXIgYm91bmQsICJ0aGUgcmVhbCBkcmlmdCBpcyB1c3VhbGx5IHNtYWxsZXIgdGhhbiAz
MHBwbSIKPj4KPj4gRm9yIHNpbXBsaWNpdHkgYW5kIGRldGVybWluaXNtIG9wdGVkIGZvciBhIHN0
YXRpYyB0b2xlcmFuY2UgdmFsdWUgb2YgMTAwIHBwbQo+PiBoZXJlLCBzdWNoIHRoYXQgdGhlIGFu
eSBlcnJvciB3b3VsZCBiZSB3ZWxsIHdpdGhpbiB0aGUgZXJyb3IgeW91IHdvdWxkIGdldCB3aXRo
Cj4+IEhQRVQvTGludXgncyBjYWxpYnJhdGlvbi4gTlRQIGNhbiBjb3BlIHdpdGggYSBkcmlmdCA8
IDUwMCBwcG0uCj4+IE1vc3QgaW1wb3J0YW50bHkgdGhpcyBzaG91bGQgc3RvcCBYZW4gZnJvbSBj
bGFpbWluZyB0aGF0IHRoZSBjbG9jayBmcmVxdWVuY3kgb24KPj4gdGhlIHNhbWUgaG9zdCBpcyBk
aWZmZXJlbnQgYWNyb3NzIHJlYm9vdHMuIFNwZWNpZmljYXRpb25zIGRvIG5vdCBjdXJyZW50bHkK
Pj4gbWFuZGF0ZSBhbiBhY2N1cmFjeSBoaWdoZXIgdGhhbiAxMDAgcHBtLCB0aGVyZWZvcmUgT1Nl
cyBzaG91bGQgYWxyZWFkeSBiZSBhYmxlCj4+IHRvIGNvcGUgd2l0aCBzdWNoIGRyaWZ0IG9uIHJl
YWwgaGFyZHdhcmUuIEFueSBpbXByb3ZlbWVudHMgaW4gYWNjdXJhY3kgZnJvbQo+PiBmdXR1cmUg
c3BlY2lmaWNhdGlvbnMvbW90aGVyYm9hcmRzIHdvdWxkbid0IGJlIGFwcGxpY2FibGUsIGJlY2F1
c2UgdGhleSB3b3VsZAo+PiBhbHNvIGNvbWUgd2l0aCBuZXdlciBDUFVzIHRoYXQgc3VwcG9ydCBU
U0Mgc2NhbGluZy4KPj4KPj4gSWYgdGhlIENQVSBkb2VzIHN1cHBvcnQgVFNDIHNjYWxpbmcgWGVu
IHdpbGwgb2YgY291cnNlIHN0aWxsIGF0dGVtcHQgdG8gbWF0Y2gKPj4gdGhlIGV4YWN0IGZyZXF1
ZW5jeSB2YWx1ZSBpdCB0aGlua3MgdGhlIGd1ZXN0IGhhZCB3aGVuIGl0IHdhcyBzdXNwZW5kZWQu
Cj4+IFNlZSBiZWxvdyBmb3IgYGlmICggaHZtX3RzY19zY2FsaW5nX3N1cHBvcnRlZCAmJiAhZC0+
YXJjaC52dHNjIClgIChub3QgdmlzaWJsZQo+PiBpbiBwYXRjaCBjb250ZXh0KS4KPj4KPj4gbGxh
YnMoKSBkb2Vzbid0IGFwcGVhciB0byBiZSBhdmFpbGFibGUgd2hlbiBidWlsZGluZyB4ZW4sIGhl
bmNlIHRoZSAyIGNvbXBhcmlzb25zLgo+Pgo+PiBBZnRlciB0aGlzIHBhdGNoIHdoZW4gc3VzcGVu
ZGluZyBhIFZNLCBhbmQgcmVib290aW5nIHRoZSBob3N0IEkgZ2V0IHRoaXMgb3V0cHV0Ogo+PiBg
YGAKPj4gKFhFTikgWyAgICA2LjYxNDcwM10gRGV0ZWN0ZWQgMjYwMC4wMTAgTUh6IHByb2Nlc3Nv
ci4KPj4gKFhFTikgWyAgMTM4LjkyNDM0Ml0gVFNDIG1hcmtlZCBhcyByZWxpYWJsZSwgd2FycCA9
IDAgKGNvdW50PTIpCj4+IChYRU4pIFsgIDEzOC45MjQzNDZdIGRvbTEoaHZtKTogbW9kZT0wLG9m
cz0weGZmZmVkMDE5MDEwMTZkMTgsa2h6PTI2MDAwMTIsaW5jPTIKPj4gYGBgCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEVkd2luIFTDtnLDtmsgPGVkdmluLnRvcm9rQGNpdHJpeC5jb20+Cj4gCj4gRmly
c3Qgb2YgYWxsIC0gYXJlIHlvdSBhd2FyZSB0aGF0IHRoZXJlIGhhZCBiZWVuIG11bHRpcGxlIGl0
ZXJhdGlvbnMKPiBvZiBhIHBhdGNoIChieSBPbGFmIEhlcmluZykgbWFraW5nIHRoaXMgYSBjb21t
YW5kIGxpbmUgYW5kL29yIGd1ZXN0Cj4gY29uZmlnIGNvbnRyb2xsYWJsZSBzZXR0aW5nPwoKTm8s
IEknbGwgdGFrZSBhIGxvb2sgYXQgdGhlbSBhbmQgdGhlIGFzc29jaWF0ZWQgZGlzY3Vzc2lvbi4K
Rm91bmQgYSAnW1BBVENIIHYxMF0gbmV3IGNvbmZpZyBvcHRpb24gdnRzY190b2xlcmFuY2Vfa2h6
IHRvIGF2b2lkIFRTQyBlbXVsYXRpb24nIGluIHRoZSBhcmNoaXZlcyBmcm9tIDkgbW9udGhzIGFn
by4KCj4gSWYgc28sIGl0IHdvdWxkIGhhdmUgYmVlbiBuaWNlIGlmIGF0Cj4gbGVhc3QgdGhlIGNv
dmVyIGxldHRlciBpZGVudGlmaWVkIHRoZSBjb3JyZWxhdGlvbi4gSWYgbm90LCBwbGVhc2UKPiB0
YWtlIGEgbG9vay4gQWZ0ZXIgYWxsIGl0IGhhc24ndCBnb25lIGluIHNvIGZhciBiZWNhdXNlIG9m
IG9iamVjdGlvbnMKPiBieSBBbmRyZXcuCj4gCj4gVXNpbmcgYSBoYXJkY29kZWQgdG9sZXJhbmNl
IHZhbHVlIGluIGFueSBldmVudCByYWlzZXMgdGhlIHF1ZXN0aW9uCj4gb2YgaG93IHlvdSBrbm93
IHdoZXRoZXIgYSBwYXJ0aWN1bGFyIGd1ZXN0IE9TIGNhbiBhY3R1YWxseSBjb3BlLgo+IAo+PiAt
LS0gYS94ZW4vYXJjaC94ODYvdGltZS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni90aW1lLmMKPj4g
QEAgLTIxNzEsNiArMjE3MSwxMiBAQCB2b2lkIHRzY19nZXRfaW5mbyhzdHJ1Y3QgZG9tYWluICpk
LCB1aW50MzJfdCAqdHNjX21vZGUsCj4+ICAgICAgICAgICplbGFwc2VkX25zZWMgPSAwOwo+PiAg
fQo+PiAgCj4+ICtzdGF0aWMgaW5saW5lIGludCBmcmVxdWVuY3lfc2FtZV93aXRoX3RvbGVyYW5j
ZShpbnQ2NF90IGtoejEsIGludDY0X3Qga2h6MikKPiAKPiBUaGUgcmV0dXJuIHR5cGUgd2FudHMg
dG8gYmUgYm9vbC4gQW5kIHRoZXJlIHdhbnRzIHRvIGJlIGFuIGV4cGxhaW5pbmcKPiBjb21tZW50
IGFoZWFkIG9mIHRoZSBmdW5jdGlvbiwgKHJlLSlzdGF0aW5nIHNvbWUgb2Ygd2hhdCB5b3UgaGF2
ZSBpbgo+IHRoZSBkZXNjcmlwdGlvbi4KPiAKPj4gK3sKPj4gKyAgICBpbnQ2NF90IHBwbSA9IChr
aHoyIC0ga2h6MSkgKiAxMDAwMDAwIC8ga2h6MjsKPj4gKyAgICByZXR1cm4gLTEwMCA8IHBwbSAm
JiBwcG0gPCAxMDA7Cj4gCj4gV2hpbGUgd2UgaGF2ZSBubyBsbGFicygpLCB5b3Ugc2hvdWxkIGlt
byB1c2UgZWl0aGVyIEFCUygpIG9yCj4gX19idWlsdGluX2xhYnMoKSAvIF9fYnVpbHRpbl9sbGFi
cygpLgo+IAo+IEZ1cnRoZXJtb3JlLCBjb3VsZCB3ZSBsaW1pdCB0aGlzIGJlaGF2aW9yIHRvIHRo
ZSBjYXNlIG9mIHRoZXJlIG5vdAo+IGJlaW5nIFRTQyBzY2FsaW5nIGF2YWlsYWJsZSAoZHVlIHRv
IHJ1bm5pbmcgb24gb2xkIGhhcmR3YXJlLCBvciBkdWUKPiB0byBpdCBiZWluZyBhIFBWIGd1ZXN0
KT8KClllcywgdGhhdCdkIG1ha2Ugc2Vuc2UuCgoKQmVzdCByZWdhcmRzLAotLUVkd2luCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
