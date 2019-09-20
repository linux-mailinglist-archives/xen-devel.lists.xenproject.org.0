Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 965E5B8E45
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 12:08:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBFmq-0006de-IP; Fri, 20 Sep 2019 10:05:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EUeC=XP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iBFmp-0006dZ-3G
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 10:05:11 +0000
X-Inumbo-ID: 20d81308-db8e-11e9-9688-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20d81308-db8e-11e9-9688-12813bfff9fa;
 Fri, 20 Sep 2019 10:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568973910;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=rhk1hzyVXrX2xJyanUq4yfP9SU85FQCaXGRVx0UMA1U=;
 b=W/I+mWelcZxUqjVW5Pbcn8OzXqLZRt5b+hSIRYBpV06cqHzFCyMGrC7s
 GypF5BhAbIedt0IFOUGgtiSW/PI/2gIROubl4+soS2NhTOgYYhf/zl0iX
 TpHdKq8jO9KEanV1GddHo2zTS6LR1RuSXXLbUKnkmyUw0GtaSUl3a5rj7 Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: r3i3Ql/WuTRsUIId9zhbvU9cWAoTBkT1HuySFvmtvdk9ThLS58Q6e3fX31HEFlyfufWWrKrB0m
 D+9XSs0hdru4h5SN+Xw860Rb6IwhSFHQTBM9Xq7UQZcVC0sanCigXDd+TFaUjHNUT3G8aDm1H8
 2wr/lGg/TeDWZGFoHSPcz1mVoYgl/e3wR9g8eehvVX9iIWsPaksenOGvbo+atzukZi3OcZThF0
 jybJS8OledZsWc3kVIyMeauyiZcP0ZL7aPGSTZJS7s+TrQ59lyRyCMlsY7TPKpQyQiCPoaeA69
 zyU=
X-SBRS: 2.7
X-MesageID: 5841521
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,528,1559534400"; 
   d="scan'208";a="5841521"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <b080fa0f-08d2-34d0-3f54-549e1303eeb4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <77f8b74c-c9a9-efc4-07b1-d20dbd5545c5@citrix.com>
Date: Fri, 20 Sep 2019 11:05:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b080fa0f-08d2-34d0-3f54-549e1303eeb4@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] libxc/x86: avoid overflow in CPUID APIC ID
 adjustments
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDkvMjAxOSAxMjo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gUmVjZW50IEFNRCBwcm9j
ZXNzb3JzIG1heSByZXBvcnQgdXAgdG8gMTI4IGxvZ2ljYWwgcHJvY2Vzc29ycyBpbiBDUFVJRAo+
IGxlYWYgMS4gRG91YmxpbmcgdGhpcyB2YWx1ZSBwcm9kdWNlcyAwICh3aGljaCBPU2VzIHNpbmNl
cmVseSBkaXNsaWtlKSwKPiBhcyB0aGUgcmVzcGVjdGl2ZSBmaWVsZCBpcyBvbmx5IDggYml0cyB3
aWRlLiBTdXBwcmVzcyBkb3VibGluZyB0aGUgdmFsdWUKPiAoYW5kIGl0cyBsZWFmIDB4ODAwMDAw
MDggY291bnRlcnBhcnQpIGluIHN1Y2ggYSBjYXNlLgo+Cj4gQWRkaXRpb25hbGx5IGRvbid0IGV2
ZW4gZG8gYW55IGFkanVzdG1lbnQgd2hlbiB0aGUgaG9zdCB0b3BvbG9neSBhbHJlYWR5Cj4gaW5j
bHVkZXMgcm9vbSBmb3IgbXVsdGlwbGUgdGhyZWFkcyBwZXIgY29yZS4KPgo+IEZ1cnRoZXJtb3Jl
IGRvbid0IGRvdWJsZSB0aGUgTWF4aW11bSBDb3JlcyBQZXIgUGFja2FnZSBhdCBhbGwgLSBieSB1
cwo+IGludHJvZHVjaW5nIGEgZmFrZSBIVFQgZWZmZWN0LCB0aGUgY29yZSBjb3VudCBkb2Vzbid0
IG5lZWQgdG8gY2hhbmdlLgo+IEluc3RlYWQgYWRqdXN0IHRoZSBNYXhpbXVtIExvZ2ljYWwgUHJv
Y2Vzc29ycyBTaGFyaW5nIENhY2hlIGZpZWxkLCB3aGljaAo+IHNvIGZhciB3YXMgemFwcGVkIGFs
dG9nZXRoZXIuCj4KPiBBbHNvIHphcCBsZWFmIDQgKGFuZCBhdCB0aGUgc2FtZSB0aW1lIGxlYWYg
MikgRURYIG91dHB1dCBmb3IgQU1ELgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IFRCRDogVXNpbmcgeGNfcGh5c2luZm8oKSBvdXRwdXQg
aGVyZSBuZWVkcyBhIGJldHRlciBzb2x1dGlvbi4gVGhlCj4gICAgICB0aHJlYWRzX3Blcl9jb3Jl
IHZhbHVlIHJldHVybmVkIGlzIHRoZSBjb3VudCBvZiBhY3RpdmUgc2libGluZ3Mgb2YKPiAgICAg
IENQVSAwLCByYXRoZXIgdGhhbiBhIHN5c3RlbSB3aWRlIGFwcGxpY2FibGUgdmFsdWUgKGFuZCBj
b25zdGFudAo+ICAgICAgb3ZlciB0aGUgZW50aXJlIHNlc3Npb24pLiBVc2luZyBDUFVJRCBvdXRw
dXQgKGxlYXZlcyA0IGFuZAo+ICAgICAgODAwMDAwMWUpIGRvZXNuJ3QgbG9vayB2aWFibGUgZWl0
aGVyLCBkdWUgdG8gdGhpcyBub3QgcmVhbGx5IGJlaW5nCj4gICAgICB0aGUgaG9zdCB2YWx1ZXMg
b24gUFZILiBKdWRnaW5nIGZyb20gdGhlIGhvc3QgZmVhdHVyZSBzZXQncyBIVFQKPiAgICAgIGZs
YWcgYWxzbyB3b3VsZG4ndCB0ZWxsIHVzIHdoZXRoZXIgdGhlcmUgYWN0dWFsbHkgYXJlIG11bHRp
cGxlCj4gICAgICB0aHJlYWRzIHBlciBjb3JlLgoKVGhlIGtleSB0aGluZyBpcyB0aGF0IGh0dCAh
PSAibW9yZSB0aGFuIG9uZSB0aHJlYWQgcGVyIGNvcmUiLsKgIEhUVCBpcwpzdHJpY3RseSBhIGJp
dCBpbmRpY2F0aW5nIHRoYXQgdG9wb2xvZ3kgaW5mb3JtYXRpb24gaXMgYXZhaWxhYmxlIGluIGEK
bmV3IGZvcm0gaW4gdGhlIENQVUlEIGxlYXZlcyAob3IgaW4gQU1EcyBjYXNlLCB0aGUgc2FtZSBp
bmZvcm1hdGlvbgpzaG91bGQgYmUgaW50ZXJwcmV0ZWQgaW4gYSBuZXcgd2F5KS7CoCBKdXN0IGJl
Y2F1c2UgSFRUIGlzIHNldCAoYW5kIGl0CmRvZXMgZ2V0IHNldCBpbiBub24tSFQgY2FwYWJsZSBz
eXN0ZW1zKSwgZG9lc24ndCBtZWFuIHRoZXJlIGlzIHNwYWNlIGZvcgptb3JlIHRoYW4gdGhyZWFk
IHBlciBjb3JlIGluIHRvcG9sb2d5IGluZm9ybWF0aW9uLgoKRm9yIFBWIGd1ZXN0cywgbXkgYWRq
dXN0bWVudCBpbiB0aGUgQ1BVSUQgc2VyaWVzIHNob3dzICh3aGF0IEkgYmVsaWV2ZQp0byBiZSkg
dGhlIG9ubHkgY29ycmVjdCB3YXkgb2YgcHJvcGFnYXRpbmcgdGhlIGhvc3QgSFRUL0NNUF9MRUdB
Q1kKc2V0dGluZ3MgdGhyb3VnaC4KCkZvciBIVk0gZ3Vlc3RzLCBpdCByZWFsbHkgc2hvdWxkbid0
IHJlYWxseSBoYXZlIGFueXRoaW5nIHRvIGRvIHdpdGggdGhlCmhvc3Qgc2V0dGluZy7CoCBXZSBz
aG91bGQgYmUgY2hvb3NpbmcgaG93IG1hbnkgdGhyZWFkcy9jb3JlIHRvIGdpdmUgdG8KdGhlIGd1
ZXN0LCB0aGVuIGNvbnN0cnVjdGluZyB0aGUgdG9wb2xvZ3kgaW5mb3JtYXRpb24gZnJvbSBmaXJz
dCBwcmluY2lwbGVzLgoKSWdub3JlIHRoZSBQVkggY2FzZS7CoCBJdCBpcyB0b3RhbGx5IGJyb2tl
biBmb3Igc2V2ZXJhbCBvdGhlciByZWFzb25zIGFzCndlbGwsIGFuZCBQVkggRG9tMCBpc24ndCBh
IHByb2R1Y3Rpb24tcmVhZHkgdGhpbmcgeWV0LgoKVGhpcyBnZXRzIHVzIGJhY2sgdG8gdGhlIFBW
IGNhc2Ugd2hlcmUgdGhlIGhvc3QgaW5mb3JtYXRpb24gaXMgYWN0dWFsbHkKaW4gdmlldywgYW5k
IChmb3IgYmFja3BvcnQgcHVycG9zZXMpIGNhbiBiZSB0cnVzdGVkLgoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
