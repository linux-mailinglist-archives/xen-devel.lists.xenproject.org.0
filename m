Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DB310A1C2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 17:16:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZdU1-0004JB-JN; Tue, 26 Nov 2019 16:14:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZdU0-0004J6-8V
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 16:14:32 +0000
X-Inumbo-ID: d38d0c20-1067-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d38d0c20-1067-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 16:14:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 09AA3AF86;
 Tue, 26 Nov 2019 16:14:30 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191126120357.13398-1-andrew.cooper3@citrix.com>
 <20191126120357.13398-3-andrew.cooper3@citrix.com>
 <93e3dd69-698e-17ee-5eef-a932b1989786@suse.com>
 <fc3aea0d-1fec-7754-8f50-d00bfd2a52e1@citrix.com>
 <391ef1a5-a01f-4595-dc51-32a580f112a6@suse.com>
 <4b464322-a25c-3ec1-0a75-f28eb81d2602@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e29e2966-7d04-7e12-a15a-46a14765cae4@suse.com>
Date: Tue, 26 Nov 2019 17:14:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <4b464322-a25c-3ec1-0a75-f28eb81d2602@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/svm: Always intercept ICEBP
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Juergen Gross <jgross@suse.com>, Tamas KLengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAxNzoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNi8xMS8yMDE5
IDE2OjA1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjYuMTEuMjAxOSAxNjo1OSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDI2LzExLzIwMTkgMTU6MzIsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDI2LjExLjIwMTkgMTM6MDMsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IElD
RUJQIGlzbid0IGhhbmRsZWQgd2VsbCBieSBTVk0uCj4+Pj4+Cj4+Pj4+IFRoZSBWTWV4aXQgc3Rh
dGUgZm9yIGEgI0RCLXZlY3RvcmVkIFRBU0tfU1dJVENIIGhhcyAlcmlwIHBvaW50aW5nIHRvIHRo
ZQo+Pj4+PiBhcHByb3ByaWF0ZSBpbnN0cnVjdGlvbiBib3VuZGFyeSAoZmF1bHQgb3IgdHJhcCwg
YXMgYXBwcm9wcmlhdGUpLCBleGNlcHQgZm9yCj4+Pj4+IGFuIElDRUJQLWluZHVjZWQgI0RCIFRB
U0tfU1dJVENILCB3aGVyZSAlcmlwIHBvaW50cyBhdCB0aGUgSUNFQlAgaW5zdHJ1Y3Rpb24KPj4+
Pj4gcmF0aGVyIHRoYW4gYWZ0ZXIgaXQuICBBcyBJQ0VCUCBpc24ndCBkaXN0aW5ndWlzaGVkIGlu
IHRoZSB2ZWN0b3JpbmcgZXZlbnQKPj4+Pj4gdHlwZSwgdGhlIHN0YXRlIGlzIGFtYmlndW91cy4K
Pj4+Pj4KPj4+Pj4gVG8gYWRkIHRvIHRoZSBjb25mdXNpb24sIGFuIElDRUJQIHdoaWNoIG9jY3Vy
cyBkdWUgdG8gSW50cm9zcGVjdGlvbgo+Pj4+PiBpbnRlcmNlcHRpbmcgdGhlIGluc3RydWN0aW9u
LCBvciBmcm9tIHg4Nl9lbXVsYXRlKCkgd2lsbCBoYXZlICVyaXAgdXBkYXRlZCBhcwo+Pj4+PiBh
IGNvbnNlcXVlbmNlIG9mIHBhcnRpYWwgZW11bGF0aW9uIHJlcXVpcmVkIHRvIGluamVjdCBhbiBJ
Q0VCUCBldmVudCBpbiB0aGUKPj4+Pj4gZmlyc3QgcGxhY2UuCj4+Pj4+Cj4+Pj4+IFdlIGNvdWxk
IGluIHByaW5jaXBsZSBzcG90IHRoZSBub24taW5qZWN0ZWQgY2FzZSBpbiB0aGUgVEFTS19TV0lU
Q0ggaGFuZGxlciwKPj4+Pj4gYnV0IHRoaXMgc3RpbGwgcmVzdWx0cyBpbiBjb21wbGV4aXR5IGlm
IHRoZSBJQ0VCUCBpbnN0cnVjdGlvbiBhbHNvIGhhcyBhbgo+Pj4+PiBJbnN0cnVjdGlvbiBCcmVh
a3BvaW50IGFjdGl2ZSBvbiBpdCAod2hpY2ggZ2VudWluZWx5IGhhcyBmYXVsdCBzZW1hbnRpY3Mp
Lgo+Pj4+Pgo+Pj4+PiBVbmNvbmRpdGlvbmFsbHkgaW50ZXJjZXB0IElDRUJQLiAgVGhpcyBkb2Vz
IGhhdmUgYSB0cmFwIHNlbWFudGljcyBmb3IgdGhlCj4+Pj4+IGludGVyY2VwdCwgYW5kIGFsbG93
cyB1cyB0byBtb3ZlICVyaXAgZm9yd2FyZHMgYXBwcm9wcmlhdGVseSBiZWZvcmUgdGhlCj4+Pj4+
IFRBU0tfU1dJVENIIGludGVyY2VwdCBpcyBoaXQuCj4+Pj4gQm90aCBiZWNhdXNlIG9mIHlvdSBt
ZW50aW9uaW5nIHRoZSBtb3ZpbmcgZm9yd2FyZHMgb2YgJXJpcCBhbmQgd2l0aCB0aGUKPj4+PiBp
cmMgZGlzY3Vzc2lvbiBpbiBtaW5kIHRoYXQgd2UgaGFkIG5vIGlyYywgZG9uJ3QgeW91IG1lYW4g
ImZhdWx0Cj4+Pj4gc2VtYW50aWNzIiBoZXJlPwo+Pj4gSUNFQlAgcmVhbGx5IGlzIHRvbyBicm9r
ZW4gdW5kZXIgU1ZNIHRvIGhhbmRsZSBhcmNoaXRlY3R1cmFsbHkuCj4+Pgo+Pj4gVGhlIElDRUJQ
IGludGVyY2VwdCBoYXMgblJJUCBkZWNvZGUgc3VwcG9ydCwgYmVjYXVzZSBpdCBpcyBhbgo+Pj4g
aW5zdHJ1Y3Rpb24gaW50ZXJjZXB0LsKgIFdlIGVtdWxhdGUgdGhlIGluamVjdGlvbiAoYmVjYXVz
ZSBpdCBpcyBJQ0VCUCksCj4+PiB3aGljaCBtZWFucyB3ZSByZS1lbnRlciB0aGUgZ3Vlc3Qgd2l0
aCAlcmlwIG1vdmVkIGZvcndhcmQsIGFuZCAjREIKPj4+IChIV19FWENFUFRJT04pIHBlbmRpbmcg
Zm9yIGluamVjdGlvbi7CoCBUaGlzIG1lYW5zIHRoYXQuLi4KPj4+Cj4+Pj4gIElmIHNvCj4+Pj4g
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IC4uLiB0aGUg
SUNFQlAtI0RCLXZlY3RvcmVkIFRBU0tfU1dJVENIIHdpbGwgbm93IGZpbmQgJXJpcCBwb2ludGlu
ZyBhZnRlcgo+Pj4gdGhlIElDRUJQIGluc3RydWN0aW9uLCByYXRoZXIgdGhhbiBhdCBpdCwgbWFr
aW5nIGl0IGNvbnNpc3RlbnQgd2l0aAo+Pj4gZXZlcnkgb3RoZXIgI0RCLXZlY3RvcmVkIFRBU0tf
U1dJVENILgo+Pj4KPj4+IFRoaXMgZG9lcyBtZWFucyB0aGF0IGFuIGVhcmx5IHRhc2stc3dpdGNo
IGZhdWx0IGZvciBJQ0VCUCB3aWxsIHJlbGlhYmx5Cj4+PiBiZSBkZWxpdmVyZWQgd2l0aCB0aGUg
d3JvbmcgKGkuZS4gdHJhcCkgc2VtYW50aWNzLCBidXQgdGhpcyBpcyBsZXNzIGJhZAo+Pj4gdGhh
biBtaXhlZCBmYXVsdC90cmFwIHNlbWFudGljcyBkZXBlbmRpbmcgb24gd2hldGhlciB0aGUgc291
cmNlIG9mIHRoZQo+Pj4gSUNFQlAgd2FzIGludHJvc3BlY3Rpb24vZW11bGF0aW9uIG9yIG5hdGl2
ZSBleGVjdXRpb24uCj4+Pgo+Pj4gV2UgY291bGQgcmVzdG9yZSBwcm9wZXIgZmF1bHQgYmVoYXZp
b3VyIGJ5IGV4dGVuZGluZwo+Pj4gc3ZtX2VtdWxfc3dpbnRfaW5qZWN0aW9uKCkgdG8gZmlndXJl
IG91dCB0aGF0IGEgdGFzayBzd2l0Y2ggaXMgbmVlZGVkLAo+Pj4gYW5kIGludm9rZSBodm1fdGFz
a19zd2l0Y2goKSBkaXJlY3RseSwgYnV0IEkgZG9uJ3QgaGF2ZSBlbm91Z2ggVFVJVFMKPj4+IHJp
Z2h0IG5vdy4KPj4+Cj4+Pj4gT3RoZXJ3aXNlIEkgZ3Vlc3MgSSdtIHN0aWxsIG1pc3Npbmcgc29t
ZXRoaW5nLgo+Pj4gSSBob3BlIHRoaXMgY2xlYXJzIGl0IHVwLgo+PiBXZWxsLCBpdCBoZWxwcywg
YnV0IHlvdSBkb24ndCByZWFsbHkgYW5zd2VyIHRoZSBxdWVzdGlvbjogSXMgInRyYXAiCj4+IGlu
IHRoYXQgc2VudGVuY2Ugb2YgdGhlIGRlc2NyaXB0aW9uIHJlYWxseSBjb3JyZWN0PyBJLmUuIGRv
bid0IHlvdQo+PiBpbnN0ZWFkIG1lYW4gImZhdWx0IiB0aGVyZT8KPiAKPiBJJ3ZlIHJld29yZGVk
IHRoYXQgYml0IHRvOgo+IAo+IFVuY29uZGl0aW9uYWxseSBpbnRlcmNlcHQgSUNFQlAuwqAgVGhp
cyBkb2VzIGhhdmUgTlJJUHMgc3VwcG9ydCBhcyBpdCBpcyBhbgo+IGluc3RydWN0aW9uIGludGVy
Y2VwdCwgd2hpY2ggYWxsb3dzIHVzIGFsbG93cyB1cyB0byBtb3ZlICVyaXAgZm9yd2FyZHMKPiBh
cHByb3ByaWF0ZWx5IGJlZm9yZSB0aGUgVEFTS19TV0lUQ0ggaW50ZXJjZXB0IGlzIGhpdC7CoCBU
aGlzIGFsbG93cy4uLgo+IAo+IEFueSBiZXR0ZXI/CgpBaCB5ZXMsIHRoYW5rcy4gKEJ1dCBwbGVh
c2UgZHJvcCBvbmUgb2YgdGhlIHR3byAiYWxsb3dzIHVzIi4pCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
