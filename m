Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168935EB8D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 20:26:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hijv4-0000II-Eu; Wed, 03 Jul 2019 18:23:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZJKH=VA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hijv2-0000IC-Ej
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 18:23:48 +0000
X-Inumbo-ID: b27a5a0e-9dbf-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b27a5a0e-9dbf-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 18:23:47 +0000 (UTC)
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
IronPort-SDR: LPj0FG91dr2fkqcFCRjdNqFubYj382m+wQ8LTfcASEMTGHX2PuPNd6KAn9g4qhqJITRYt9iFBD
 oQvAkoF7mIBxL+LHKALY/B7w/GrZo0/xoOailjKtS8obNrssMVCkGUWmQxg0mZHOMgPuHfCpb6
 Ve4D0bxDJBGcAcQbn+ow74tNYg70VcGiGnuxWQNOUbGB+kg1BWB/+PGXDOwjvGGgvr/rf0gH+Q
 PPr0oWouzhKtKzKJk+L2OWHEYHav+TJMUoe313mezpWrZlP7ZpyJoDkQSSHtju7h2wGoFmbBWM
 DHQ=
X-SBRS: 2.7
X-MesageID: 2571736
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2571736"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE91530200007800230078@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <643c5eb5-f0cb-549e-681e-142f2309958b@citrix.com>
Date: Wed, 3 Jul 2019 19:23:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5CDE91530200007800230078@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 06/15] x86/IRQ: fix locking around vector
 management
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
Cc: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDUvMjAxOSAxMTo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQWxsIG9mIF9fe2Fzc2ln
bixiaW5kLGNsZWFyfV9pcnFfdmVjdG9yKCkgbWFuaXB1bGF0ZSBzdHJ1Y3QgaXJxX2Rlc2MKPiBm
aWVsZHMsIGFuZCBoZW5jZSBvdWdodCB0byBiZSBjYWxsZWQgd2l0aCB0aGUgZGVzY3JpcHRvciBs
b2NrIGhlbGQgaW4KPiBhZGRpdGlvbiB0byB2ZWN0b3JfbG9jay4gVGhpcyBpcyBjdXJyZW50bHkg
dGhlIGNhc2UgZm9yIG9ubHkKPiBzZXRfZGVzY19hZmZpbml0eSgpIChpbiB0aGUgY29tbW9uIGNh
c2UpIGFuZCBkZXN0cm95X2lycSgpLCB3aGljaCBhbHNvCj4gY2xhcmlmaWVzIHdoYXQgdGhlIG5l
c3RpbmcgYmVoYXZpb3IgYmV0d2VlbiB0aGUgbG9ja3MgaGFzIHRvIGJlLgo+IFJlZmxlY3QgdGhl
IG5ldyBleHBlY3RhdGlvbiBieSBoYXZpbmcgdGhlc2UgZnVuY3Rpb25zIGFsbCB0YWtlIGEKPiBk
ZXNjcmlwdG9yIGFzIHBhcmFtZXRlciBpbnN0ZWFkIG9mIGFuIGludGVycnVwdCBudW1iZXIuCj4K
PiBBbHNvIHRha2UgY2FyZSBvZiB0aGUgdHdvIHNwZWNpYWwgY2FzZXMgb2YgY2FsbHMgdG8gc2V0
X2Rlc2NfYWZmaW5pdHkoKToKPiBzZXRfaW9hcGljX2FmZmluaXR5X2lycSgpIGFuZCBWVC1kJ3Mg
ZG1hX21zaV9zZXRfYWZmaW5pdHkoKSBnZXQgY2FsbGVkCj4gZGlyZWN0bHkgYXMgd2VsbCwgYW5k
IGluIHRoZXNlIGNhc2VzIHRoZSBkZXNjcmlwdG9yIGxvY2tzIGhhZG4ndCBnb3QKPiBhY3F1aXJl
ZCB0aWxsIG5vdy4gRm9yIHNldF9pb2FwaWNfYWZmaW5pdHlfaXJxKCkgdGhpcyBtZWFucyBhY3F1
aXJpbmcgLwo+IHJlbGVhc2luZyBvZiB0aGUgSU8tQVBJQyBsb2NrIGNhbiBiZSBwbGFpbiBzcGlu
X3ssdW59bG9jaygpIHRoZW4uCj4KPiBEcm9wIG9uZSBvZiB0aGUgdHdvIGxlYWRpbmcgdW5kZXJz
Y29yZXMgZnJvbSBhbGwgdGhyZWUgZnVuY3Rpb25zIGF0Cj4gdGhlIHNhbWUgdGltZS4KPgo+IFRo
ZXJlJ3Mgb25lIGNhc2UgbGVmdCB3aGVyZSBkZXNjcmlwdG9ycyBnZXQgbWFuaXB1bGF0ZWQgd2l0
aCBqdXN0Cj4gdmVjdG9yX2xvY2sgaGVsZDogc2V0dXBfdmVjdG9yX2lycSgpIGFzc3VtZXMgaXRz
IGNhbGxlciB0byBhY3F1aXJlCj4gdmVjdG9yX2xvY2ssIGFuZCBoZW5jZSBjYW4ndCBpdHNlbGYg
YWNxdWlyZSB0aGUgZGVzY3JpcHRvciBsb2NrcyAod3JvbmcKPiBsb2NrIG9yZGVyKS4gSSBkb24n
dCBjdXJyZW50bHkgc2VlIGhvdyB0byBhZGRyZXNzIHRoaXMuCgpJbiBwcmFjdGljZSwgdGhlIG9u
bHkgbXV0YXRpb24gaXMgc2V0dGluZyBhIGJpdCBpbiBjcHVfbWFzayBmb3IgdGhlCnNoYXJlZCBo
aWdoIHByaW9yaXR5IHZlY3RvcnMsIHNvIGxvb2tzIHRvIGJlIHNhZmUgaW4gcHJhY3RpY2UuwqAg
VGhlCmNhbGxlcnMgdXNlIG9mIHRoZSB2ZWN0b3JfbG9jayBsb29rcyBsaWtlIGEgYm9kZ2UgdGhv
dWdoLgoKSG93ZXZlcizCoCB0aGlzIGFuYWx5c2lzIG5lZWRzIHRvIGJlIGFkZGVkIHRvIHRoZSBj
b21tZW50IGZvcgpzZXR1cF92ZWN0b3JfaXJxKCksIGJlY2F1c2UgdGhlIGJlaGF2aW91ciBpcyBl
eHRyZW1lbHkgZnJhZ2lsZSBhbmQKbXVzdG4ndCBjaGFuZ2UuCgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4gW1ZULWRdCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKV2l0aCBzb21lIGZvcm0gb2YgYWRqdXN0bWVu
dCB0byB0aGUgY29tbWVudCBmb3Igc2V0dXBfdmVjdG9yX2lycSgpLCBhbmQKaWRlYWxseSB0byB0
aGUgY29tbWl0IG1lc3NhZ2UgYWJvdXQgc2FmZXR5IGluIHByYWN0aWNlLCBBY2tlZC1ieTogQW5k
cmV3CkNvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
