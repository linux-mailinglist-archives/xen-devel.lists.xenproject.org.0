Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1887FF2DFB
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 13:12:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSgcJ-00076p-Pk; Thu, 07 Nov 2019 12:10:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pIbk=Y7=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iSgcI-00076k-Hg
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 12:10:22 +0000
X-Inumbo-ID: 91f90dc8-0157-11ea-9631-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91f90dc8-0157-11ea-9631-bc764e2007e4;
 Thu, 07 Nov 2019 12:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573128621;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=RVESz/0V+n6dEYCG+vWkjMmg5G5Z4Ej3eouoPx4brh8=;
 b=UtqmD1FE6qd7M/DWnyRCRhkDFeaG6yK65PbT179p/OzWLgXoElEBVnOs
 cg7+OGjrRdnvjYcWgOrLgRS6P5wWmEx3oGhma3kh+GksdmHptzYOlSsfn
 LwIPrvv390h/R5E+k8j6XiNCcTbpwTTXmv3jZg8jWRsq6XVCePgF24P/8 I=;
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
IronPort-SDR: D4B5chnMNBLve05vhH9t+ZMW8k1fynngCG6XGm0kUuqyVIE59sV38haUEMkltDI/01OERxyy9O
 4vVt+cPVT24CUdrcDMBnLvjLVaCuMHQ3NgKuYWVmh5P/79ssmysUIQIONq2LtH2hVk8Pdsft44
 diAFF9mCFthhkfFQCZraHQb31AREpZOd6B9sAUDDXa4bMY4ZARmlJSkvTKc685Nw3cA+nF95hr
 cD1Z7OWOutsNwgqVZ03Kk8Vr+AKGR5KQTTUeC30/0adiHOqsw6QV27L+ddL8AYhgfWcuJVaxRc
 h0Y=
X-SBRS: 2.7
X-MesageID: 7990418
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,278,1569297600"; 
   d="scan'208";a="7990418"
To: Jan Beulich <jbeulich@suse.com>
References: <db66edf2-ca66-4127-8920-ba55f4aee14e@suse.com>
 <7045df66-009d-6c9f-8e8d-cfd058c29131@suse.com>
 <3836ccda-3184-1135-2b6f-53dce5507f65@citrix.com>
 <78055525-7158-ee5b-3f9d-6ba47881f548@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <aca9c969-f3de-2ef2-017b-9f3a505c6fc4@citrix.com>
Date: Thu, 7 Nov 2019 12:10:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <78055525-7158-ee5b-3f9d-6ba47881f548@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] introduce GFN notification for
 translated domains
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
Cc: Juergen Gross <jgross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 JulienGrall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Sander Eikelenboom <linux@eikelenboom.it>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvNy8xOSAxMTo0NyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDcuMTEuMjAxOSAx
MjozNSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMTEvNi8xOSAzOjE5IFBNLCBKYW4gQmV1
bGljaCB3cm90ZToKPj4+IEluIG9yZGVyIGZvciBpbmRpdmlkdWFsIElPTU1VIGRyaXZlcnMgKGFu
ZCBmcm9tIGFuIGFic3RyYWN0IHBvdiBhbHNvCj4+PiBhcmNoaXRlY3R1cmVzKSB0byBiZSBhYmxl
IHRvIGFkanVzdCB0aGVpciBkYXRhIHN0cnVjdHVyZXMgYWhlYWQgb2YgdGltZQo+Pj4gd2hlbiB0
aGV5IG1pZ2h0IGNvdmVyIG9ubHkgYSBzdWItcmFuZ2Ugb2YgYWxsIHBvc3NpYmxlIEdGTnMsIGlu
dHJvZHVjZQo+Pj4gYSBub3RpZmljYXRpb24gY2FsbCB1c2VkIGJ5IHZhcmlvdXMgY29kZSBwYXRo
cyBwb3RlbnRpYWxseSBpbnN0YWxsaW5nIGEKPj4+IGZyZXNoIG1hcHBpbmcgb2YgYSBuZXZlciB1
c2VkIEdGTiAoZm9yIGEgcGFydGljdWxhciBkb21haW4pLgo+Pgo+PiBTbyB0cnlpbmcgdG8gcmV2
ZXJzZSBlbmdpbmVlciB3aGF0J3MgZ29pbmcgb24gaGVyZSwgeW91IG1lYW4gdG8gc2F5Cj4+IHNv
bWV0aGluZyBsaWtlIHRoaXM6Cj4+Cj4+IC0tLQo+PiBJbmRpdmlkdWFsIElPTU1VIGRyaXZlcnMg
Y29udGFpbiBhZGp1Y3QgZGF0YSBzdHJ1Y3R1cmVzIGZvciBnZm4gcmFuZ2VzCj4+IGNvbnRhaW5l
ZCBpbiB0aGUgbWFpbiBwMm0uICBGb3IgZWZmaWNpZW5jeSwgdGhlc2UgYWRqdWN0IGRhdGEgc3Ry
dWN0dXJlcwo+PiBvZnRlbiBjb3ZlciBvbmx5IGEgc3Vic2V0IG9mIHRoZSBnZm4gcmFuZ2UuICBJ
bnN0YWxsaW5nIGEgZnJlc2ggbWFwcGluZwo+PiBvZiBhIG5ldmVyLXVzZWQgZ2ZuIG1heSByZXF1
aXJlIHRoZXNlIHJhbmdlcyB0byBiZSBleHBhbmRlZC4gIERvaW5nIHRoaXMKPj4gd2hlbiB0aGUg
cDJtIGVudHJ5IGlzIGZpcnN0IHVwZGF0ZWQgbWF5IGJlIHByb2JsZW1hdGljIGJlY2F1c2UgPHJl
YXNvbnM+Lgo+Pgo+PiBUbyBmaXggdGhpcywgaW1wbGVtZW50IG5vdGlmeV9nZm4oKSwgdG8gYmUg
Y2FsbGVkIHdoZW4gWGVuIGZpcnN0IGJlY29tZXMKPj4gYXdhcmUgdGhhdCBhIHBvdGVudGlhbGx5
IG5ldyBnZm4gbWF5IGJlIGFib3V0IHRvIGJlIHVzZWQuICBUaGlzIHdpbGwKPj4gbm90aWZ5IHRo
ZSBJT01NVSBkcml2ZXIgYWJvdXQgdGhlIG5ldyBnZm4sIGFsbG93aW5nIGl0IHRvIGV4cGFuZCB0
aGUKPj4gZGF0YSBzdHJ1Y3R1cmVzLiAgSXQgbWF5IHJldHVybiAtRVJFU1RBUlQgKD8pIGZvciBs
b25nLXJ1bm5pbmcKPj4gb3BlcmF0aW9ucywgaW4gd2hpY2ggY2FzZSB0aGUgb3BlcmF0aW9uIHNo
b3VsZCBiZSByZXN0YXJ0ZWQgb3IgYQo+PiBkaWZmZXJlbnQgZXJyb3IgaWYgdGhlIGV4cGFuc2lv
biBvZiB0aGUgZGF0YSBzdHJ1Y3R1cmUgaXMgbm90IHBvc3NpYmxlLgo+PiAgSW4gdGhlIGxhdHRl
ciBjYXNlLCB0aGUgZW50aXJlIG9wZXJhdGlvbiBzaG91bGQgZmFpbC4KPj4gLS0tCj4+Cj4+IElz
IHRoYXQgYWJvdXQgcmlnaHQ/Cj4gCj4gV2l0aCB0aGUgZXhjZXB0aW9uIG9mIHRoZSAtRVJFU1RB
UlQgLyBsb25nIHJ1bm5pbmcgb3BlcmF0aW9ucyBhc3BlY3QsCj4geWVzLiBQbHVzIGFzc3VtaW5n
IHlvdSBtZWFuICJhZGp1bmN0IiAobm90ICJhZGp1Y3QiLCB3aGljaCBteQo+IGRpY3Rpb25hcnkg
ZG9lc24ndCBrbm93IGFib3V0KS4KPiAKPj4gIE5vdGUgSSd2ZSBoYWQgdG8gbWFrZSBhIGxvdCBv
ZiBndWVzc2VzIGhlcmUgYWJvdXQKPj4gdGhlIGZ1bmN0aW9uYWxpdHkgYW5kIGludGVudC4KPiAK
PiBXZWxsLCBldmVuIGFmdGVyIHNlZWluZyB5b3VyIGxvbmdlciBkZXNjcmlwdGlvbiwgSSBkb24n
dCBzZWUgd2hhdCBtaW5lCj4gZG9lc24ndCBzYXkKCiogIkFoZWFkIG9mIHRpbWUiIC0tIGFoZWFk
IG9mIHdoYXQ/CgoqIFdoeSBkbyB0aGluZ3MgbmVlZCB0byBiZSBkb25lIGFoZWFkIG9mIHRpbWUs
IHJhdGhlciB0aGFuIGF0IHRoZSB0aW1lCihmb3Igd2hhdGV2ZXIgaXQgaXMpPyAgKEkgY291bGRu
J3QgZXZlbiByZWFsbHkgZ3Vlc3MgYXQgdGhpcywgd2hpY2ggaXMKd2h5IEkgcHV0ICI8cmVhc29u
cz4iLikKCiogVG8gbWUgIm5vdGlmeSIgZG9lc24ndCBpbiBhbnkgd2F5IGltcGx5IHRoYXQgdGhl
IG9wZXJhdGlvbiBjYW4gZmFpbC4KTW9zdCBtb2Rlcm4gbm90aWZpY2F0aW9ucyBhcmUgRllJIG9u
bHksIHdpdGggbm8gb3Bwb3J0dW5pdHkgdG8gcHJldmVudAp0aGUgdGhpbmcgZnJvbSBoYXBwZW5p
bmcuICAoVGhhdCdzIG5vdCB0byBzYXkgdGhhdCBub3RpZnkgaXMgYW4KaW5hcHByb3ByaWF0ZSBu
YW1lIC0tIGp1c3QgdGhhdCBieSBpdHNlbGYgaXQgZG9lc24ndCBpbXBseSB0aGUgYWJpbGl0eQp0
byBjYW5jZWwsIHdoaWNoIHNlZW1zIGxpa2UgYSBtYWpvciBmYWN0b3IgdG8gdW5kZXJzdGFuZGlu
ZyB0aGUgaW50ZW50Cm9mIHRoZSBwYXRjaC4pCgo+Pj4gTm90ZSB0aGF0IGluIGdudHRhYl90cmFu
c2ZlcigpIHRoZSBub3RpZmljYXRpb24gYW5kIGxvY2sgcmUtYWNxdWlyZQo+Pj4gaGFuZGxpbmcg
aXMgYmVzdCBlZmZvcnQgb25seSAodGhlIGd1ZXN0IG1heSBub3QgYmUgYWJsZSB0byBtYWtlIHVz
ZSBvZgo+Pj4gdGhlIG5ldyBwYWdlIGluIGNhc2Ugb2YgZmFpbHVyZSwgYnV0IHRoYXQncyBpbiBs
aW5lIHdpdGggdGhlIGxhY2sgb2YgYQo+Pj4gcmV0dXJuIHZhbHVlIGNoZWNrIG9mIGd1ZXN0X3Bo
eXNtYXBfYWRkX3BhZ2UoKSBpdHNlbGYpLgo+Pgo+PiBJcyB0aGVyZSBhIHJlYXNvbiB3ZSBjYW4n
dCBqdXN0IHJldHVybiBhbiBlcnJvciB0byB0aGUgY2FsbGVyPwo+IAo+IFJvbGxpbmcgYmFjayB3
aGF0IGhhcyBiZWVuIGRvbmUgYnkgdGhhdCBwb2ludCB3b3VsZCBzZWVtIHJhdGhlcgo+IGRpZmZp
Y3VsdCwgd2hpY2ggSSBndWVzcyBpcyB0aGUgcmVhc29uIHdoeSB0aGUgY29kZSB3YXMgd3JpdHRl
biB0aGUKPiB3YXkgaXQgaXMgKHByaW9yIHRvIG15IGNoYW5nZSkuCgpUaGUgcGhyYXNpbmcgbWFk
ZSBtZSB0aGluayB0aGF0IHlvdSB3ZXJlIGNoYW5naW5nIGl0IHRvIGJlIGJlc3QtZWZmb3J0LApy
YXRoZXIgdGhhbiBmb2xsb3dpbmcgc3VpdCB3aXRoIGV4aXN0aW5nIGZ1bmN0aW9uYWxpdHkuCgpN
YXliZToKCiJOb3RlIHRoYXQgYmVmb3JlIHRoaXMgcGF0Y2gsIGluIGdudHRhYl90cmFuc2Zlcigp
LCBvbmNlIDxjb25kaXRpb24+CmhhcHBlbnMsIGZ1cnRoZXIgZXJyb3JzIG1vZGlmeWluZyB0aGUg
cGh5c21hcCBhcmUgaWdub3JlZCAocHJlc3VtYWJseQpiZWNhdXNlIGl0IHdvdWxkIGJlIHRvbyBj
b21wbGljYXRlZCB0byB0cnkgdG8gcm9sbCBiYWNrIGF0IHRoYXQgcG9pbnQpLgogVGhpcyBwYXRj
aCBmb2xsb3dzIHN1aXQgYnkgaWdub3JpbmcgZmFpbGVkIG5vdGlmeV9nZm4oKXMsIHNpbXBseQpw
cmludGluZyBvdXQgYSB3YXJuaW5nIHRoYXQgdGhlIGdmbiBtYXkgbm90IGJlIGFjY2Vzc2libGUg
ZHVlIHRvIHRoZQpmYWlsdXJlLiIKCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
