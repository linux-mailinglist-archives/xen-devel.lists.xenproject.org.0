Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A5C1545B1
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 15:04:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izhiZ-0006jb-LW; Thu, 06 Feb 2020 14:01:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3kaZ=32=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1izhiX-0006jW-Ss
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 14:01:17 +0000
X-Inumbo-ID: 2472c83c-48e9-11ea-af99-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2472c83c-48e9-11ea-af99-12813bfff9fa;
 Thu, 06 Feb 2020 14:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580997677;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=tM6qIXUdg2MzIZdncmzytaGi2r5g1AgDTzHXQAv4xiQ=;
 b=Bra/YDsGA1RMiKPMmDb6HwsSq3hDcCYBQexHIasPZvRsbXhCtewlZtVW
 MOER7Csyi9mxO1Pz2D8cx9fFCTJd6/kNd9beQSRZn/2wPOprF4bjmuo7c
 OZQUjOVSCFxvFtL8dGdBU/yXicteGa2T6VjgEY0W7xy5GjayGV6tCPAsL w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VFY3yhAXl0Dfh2wVMd7zzHKxsLKLhzsVGd+EIlHBjY3Esw1WD9na1bphE9oHgfQJ6sr9Xzn2jV
 BxXDpEuJhwvB2HauJmYOMYJ9RXZSWauCBewxwdFtPXhMK82a7ghixUibbDpUjvbI1ClYNC+UEX
 LsXMe+IXv/Zxnombl8eh5qIPu+8dMkE6wrYNKHG3sl8MM+sqJO+fUxYgSDMbP4f4dx1mRfVv/B
 QUWESfbvxMAhQL9/ZJks3UUohNvxw122egZvtYvtvaP99A1uMrWcSnYRHF0+Bkh5z2m81F9Fs+
 AE4=
X-SBRS: 2.7
X-MesageID: 12483526
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,409,1574139600"; d="scan'208";a="12483526"
To: <xen-devel@lists.xenproject.org>
References: <20200206103833.15355-1-julien@xen.org>
 <d30a9c1b478c4e3a8b082fa625c8989a@EX13D32EUC003.ant.amazon.com>
 <0fb52abc-1a41-ab91-9c74-6f0913092a02@xen.org>
 <202acf94cd674228a1d852ccd372a90c@EX13D32EUC003.ant.amazon.com>
 <94c9aee5-04de-c4d4-5c35-0078b57dfd42@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b28c3f32-74fc-c300-0d47-0ae2959d0db0@citrix.com>
Date: Thu, 6 Feb 2020 14:01:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <94c9aee5-04de-c4d4-5c35-0078b57dfd42@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] xen/mm: Avoid assuming the page is inuse
 in assign_pages()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDIvMjAyMCAxMjo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDYuMDIuMjAyMCAx
Mjo0NCwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
Cj4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+Pj4gU2VudDogMDYgRmVi
cnVhcnkgMjAyMCAxMToxNwo+Pj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5j
by51az47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+Pj4gQ2M6IEdyYWxsLCBKdWxp
ZW4gPGpncmFsbEBhbWF6b24uY29tPgo+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0geGVuL21t
OiBBdm9pZCBhc3N1bWluZyB0aGUgcGFnZSBpcyBpbnVzZSBpbgo+Pj4gYXNzaWduX3BhZ2VzKCkK
Pj4+Cj4+PiBIaSBQYXVsLAo+Pj4KPj4+IE9uIDA2LzAyLzIwMjAgMTA6NTIsIER1cnJhbnQsIFBh
dWwgd3JvdGU6Cj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+Pj4+IEZyb206IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4+Pj4+IFNlbnQ6IDA2IEZlYnJ1YXJ5IDIwMjAg
MTA6MzkKPj4+Pj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+Pj4+PiBDYzog
anVsaWVuQHhlbi5vcmc7IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IEdy
YWxsLAo+Pj4gSnVsaWVuCj4+Pj4+IDxqZ3JhbGxAYW1hem9uLmNvbT4KPj4+Pj4gU3ViamVjdDog
W1BBVENIIHYyXSB4ZW4vbW06IEF2b2lkIGFzc3VtaW5nIHRoZSBwYWdlIGlzIGludXNlIGluCj4+
Pj4+IGFzc2lnbl9wYWdlcygpCj4+Pj4+Cj4+Pj4+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxs
QGFtYXpvbi5jb20+Cj4+Pj4+Cj4+Pj4+IEF0IHRoZSBtb21lbnQsIGFzc2lnbl9wYWdlcygpIG9u
IHRoZSBwYWdlIHRvIGJlIGludXNlIChQR0Nfc3RhdGVfaW51c2UpCj4+Pj4+IGFuZCB0aGUgc3Rh
dGUgdmFsdWUgdG8gYmUgMC4KPj4+Pj4KPj4+Pj4gSG93ZXZlciwgdGhlIGNvZGUgbWF5IHJhY2Ug
d2l0aCB0aGUgcGFnZSBvZmZsaW5pbmcgY29kZSAoc2VlCj4+Pj4+IG9mZmxpbmVfcGFnZSgpKS4g
RGVwZW5kaW5nIG9uIHRoZSBvcmRlcmluZywgdGhlIHBhZ2UgbWF5IGJlIGluCj4+PiBvZmZsaW5p
bmcKPj4+Pj4gc3RhdGUgKFBHQ19zdGF0ZV9vZmZsaW5pbmcpIGJlZm9yZSBpdCBpcyBhc3NpZ25l
ZCB0byBhIGRvbWFpbi4KPj4+Pj4KPj4+Pj4gT24gZGVidWcgYnVpbGQsIHRoaXMgbWF5IHJlc3Vs
dCB0byBoaXQgdGhlIGFzc2VydCBvciBqdXN0IGNsb2JiZXIgdGhlCj4+Pj4+IHN0YXRlLiBPbiBu
b24tZGVidWcgYnVpbGQsIHRoZSBzdGF0ZSB3aWxsIGdldCBjbG9iYmVyZWQuCj4+Pj4+Cj4+Pj4+
IEluY2lkZW50YWxseSB0aGUgZmxhZyBQR0NfYnJva2VuIHdpbGwgZ2V0IGNsb2JiZXJlZCBhcyB3
ZWxsLgo+Pj4+Pgo+Pj4+PiBHcmFiIHRoZSBoZWFwX2xvY2sgdG8gcHJldmVudCBhIHJhY2Ugd2l0
aCBvZmZsaW5lX3BhZ2UoKSBhbmQga2VlcCB0aGUKPj4+Pj4gc3RhdGUgYW5kIGJyb2tlbiBmbGFn
IGFyb3VuZC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxA
YW1hem9uLmNvbT4KPj4+PiBUaGlzIHNlZW1zIGxpa2UgYSByZWFzb25hYmxlIGNoYW5nZS4gSSBn
dWVzcyBoYXZpbmcgYXNzaWduX3BhZ2VzKCkgdGFrZQo+Pj4gdGhlIGdsb2JhbCBsb2NrIGlzIG5v
IG1vcmUgcHJvYmxlbSB0aGFuIGl0cyBleGlzdGluZyBjYWxsIHRvCj4+PiBkb21haW5fYWRqdXN0
X3RvdF9wYWdlcygpIHdoaWNoIGFsc28gdGFrZXMgdGhlIHNhbWUgbG9jay4KPj4+Cj4+PiBUaGF0
J3MgbXkgdW5kZXJzdGFuZGluZy4gU3VtbWFyaXppbmcgb3VyIGRpc2N1c3Npb24gSVJMIGZvciB0
aGUgb3RoZXIsCj4+PiBpdCBpcyBub3QgY2xlYXIgd2hldGhlciB0aGUgbG9jayBpcyBlbm91Z2gg
aGVyZS4KPj4+Cj4+PiAgRnJvbSBteSB1bmRlcnN0YW5kaW5nIHRoZSBzZXF1ZW5jZQo+Pj4KPj4+
IHBnW2ldLmNvdW50X2luZm8gJj0gLi4uOwo+Pj4gcGdbaV0uY291bnRfaW5mbyB8PSAuLi47Cj4+
Pgo+Pj4gY291bGQgcmVzdWx0IHRvIG11bHRpcGxlIHJlYWQvd3JpdGUgZnJvbSB0aGUgY29tcGls
ZXIuIFdlIGNvdWxkIHVzZSBhCj4+PiBzaW5nbGUgYXNzaWdubWVudCwgYnV0IEkgc3RpbGwgZG9u
J3QgdGhpbmsgdGhpcyBwcmV2ZW50IHRoZSBjb21waWxlciB0bwo+Pj4gYmUgdXNlIG11bHRpcGxl
IHJlYWQvd3JpdGUuCj4+Pgo+Pj4gVGhlIGNvbmNlcm4gd291bGQgYmUgYSByYWNlIHdpdGggZ2V0
X3BhZ2Vfb3duZXJfYW5kX3JlZmVyZW5jZSgpLiBJZiAxIGlzCj4+PiBzZXQgYmVmb3JlIHRoZSBy
ZXN0IG9mIHRoZSBiaXRzLCB0aGVuIHlvdSBtYXkgYmUgYWJsZSB0byBnZXQgdGhlIHBhZ2UuCj4+
Pgo+Pj4gU28gSSBtaWdodCB3YW50IHRvIHVzZSB3cml0ZV9hdG9taWMoKSBiZWxvdy4gQW55IG9w
aW5pb24/Cj4+Pgo+PiBUQkggSSB3b25kZXIgaWYgd2Ugb3VnaHQgdG8gc2F5IHRoYXQgYW55IHVw
ZGF0ZSB0byBjb3VudF9pbmZvIG91Z2h0IHRvCj4+IGJlIGRvbmUgYnkgYSB3cml0ZV9hdG9taWMg
KHdoZXJlIGl0J3Mgbm90IGFscmVhZHkgZG9uZSBieSBjbXB4Y2hnKS4KPiBJIGFncmVlLgoKSXQg
d29uJ3QgZml4IGFueXRoaW5nLCBhbmQgZ2l2ZXMgdGhlIGNvbXBpbGVyIGEgaGFyZGVyIHRpbWUu
Cgp3cml0ZV9hdG9taWMoKSBpcyBhIG1vdiBpbnN0cnVjdGlvbi7CoCBJdCBwcm9oaWJpdHMgdGhl
IHVzZSBvZiBhbmQvb3IKJGltbSwgbWVtIGVuY29kaW5ncy4KCklmIG11bHRpcGxlIHJlYWRzL3dy
aXRlcyBhcmUgYSBjb25jZXJuIHRoZW4gdGhlIG9ubHkgdmFsaWQgY29kZQpnZW5lcmF0aW9uIGlz
IGZvciAqZXZlcnkqIG1vZGlmaWNhdGlvbiBvZiBjb3VudCBpbmZvIHRvIHVzZSBsb2NrZWQKb3Bl
cmF0aW9ucy4KClN3YXBwaW5nIHJlZ3VsYXIgQyBmb3IgYSBzaW5nbGUgbW92IGluc3RydWN0aW9u
IGhlcmUgaXMgbm90IGdvaW5nIHRvIGZpeAphIGJ1ZywgaWYgc3VjaCBhIGJ1ZyBleGlzdHMuCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
