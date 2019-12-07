Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ADA115E41
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 20:41:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idft5-0006Lt-Tv; Sat, 07 Dec 2019 19:37:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U5T7=Z5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1idft3-0006Lo-VB
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 19:37:05 +0000
X-Inumbo-ID: f228db40-1928-11ea-a1e1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f228db40-1928-11ea-a1e1-bc764e2007e4;
 Sat, 07 Dec 2019 19:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575747424;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=itUfOv5X+2kT03ksqjZ2mNyYYTh7h5mxZzIfeP5kP1s=;
 b=TtsvZ6P9Ju4bufL9mYr+p8/dIww5cOOIxjoZb2JLL6cwNede4LFfLIaI
 zgfB9JLHaRILZxxDaKrcSP2nOlzrnzlJ2p+T3EZ38Qb7mLe9ZdH/85AjY
 +OCsjK9KEVNyGYvgvrE0FISHU9SoJ+C1Cmd0YpJ5KjDyfI8FEiqW8b/eu g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: l9uHhiHO3HSD4aXxxhMm+LUtGv9/WC84YtShG3WEROokw4TGjyyoEOn0DPG9dVRmuPHZmuxYsZ
 hW/nlVnjT+GhRcWEnXUIenXb5x9dGUHo336qOKOzGsGHKcnLbh4ai0K/lx/j6iQs/5qyTfjAbT
 pg6/vPx/QinpP/vN5RsCCIO2/8ZbYcuA2Phg9K8Pqg/dgeXuHPrfM9F+DRrEpFd2VPUyRKln/A
 tkb5ckt11VEteu8J3gzxTPLUjDixg7D+UBT44SwU6R55QQ0kJzfnSe88vCw98Df665tJ2jdp1Q
 pAw=
X-SBRS: 2.7
X-MesageID: 9906795
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,289,1571716800"; 
   d="scan'208";a="9906795"
To: Julien Grall <jgrall@amazon.com>, Hongyan Xia <hongyxia@amazon.com>,
 <xen-devel@lists.xenproject.org>
References: <cover.1575646580.git.hongyxia@amazon.com>
 <86a6fb68f76ab287f5c2d99d1e7954e8b2d1ab05.1575646580.git.hongyxia@amazon.com>
 <e303e937-7341-5c39-7a12-c0d055d8fce4@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <1de175ac-f29e-cfd4-d48b-5fd8743beb2f@citrix.com>
Date: Sat, 7 Dec 2019 19:37:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e303e937-7341-5c39-7a12-c0d055d8fce4@amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMTIvMjAxOSAxOTowNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEhvbmd5YW4sCj4K
PiBPbiAwNi8xMi8yMDE5IDE1OjUzLCBIb25neWFuIFhpYSB3cm90ZToKPj4gbWFwX3BhZ2VzX3Rv
X3hlbiBhbmQgbW9kaWZ5X3hlbl9tYXBwaW5ncyBhcmUgcGVyZm9ybWluZyBhbG1vc3QgZXhhY3Rs
eQo+PiB0aGUgc2FtZSBvcGVyYXRpb25zIHdoZW4gc2hhdHRlcmluZyBhbiBsMyBQVEUsIHRoZSBv
bmx5IGRpZmZlcmVuY2UKPj4gYmVpbmcgd2hldGhlciB3ZSB3YW50IHRvIGZsdXNoLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8aG9uZ3l4aWFAYW1hem9uLmNvbT4KPj4gLS0tCj4+
IMKgIHhlbi9hcmNoL3g4Ni9tbS5jIHwgODUgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyks
IDQ1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94
ZW4vYXJjaC94ODYvbW0uYwo+PiBpbmRleCA3ZDRkZDgwYTg1Li40MmFhYWExMDgzIDEwMDY0NAo+
PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+PiBA
QCAtNTE1MSw2ICs1MTUxLDQzIEBAIGwxX3BnZW50cnlfdCAqdmlydF90b194ZW5fbDFlKHVuc2ln
bmVkIGxvbmcgdikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBmbHVzaF9hcmVhX2xvY2FsKChjb25zdCB2b2lkICopdiwgZikgOiBcCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmx1c2hf
YXJlYV9hbGwoKGNvbnN0IHZvaWQgKil2LCBmKSkKPj4gwqAgKy8qIFNoYXR0ZXIgYW4gbDMgZW50
cnkgYW5kIHBvcHVsYXRlIGwyLiBJZiB2aXJ0IGlzIHBhc3NlZCBpbiwgYWxzbwo+PiBkbyBmbHVz
aC4gKi8KPj4gK3N0YXRpYyB2b2lkIHNoYXR0ZXJfbDNlKGwzX3BnZW50cnlfdCAqcGwzZSwgbDJf
cGdlbnRyeV90ICpsMnQsCj4+ICvCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHZpcnQsIGJv
b2wgbG9ja2luZykKPj4gK3sKPj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgaTsKPj4gK8KgwqDCoCBs
M19wZ2VudHJ5X3Qgb2wzZSA9ICpwbDNlOwo+PiArCj4+ICvCoMKgwqAgZm9yICggaSA9IDA7IGkg
PCBMMl9QQUdFVEFCTEVfRU5UUklFUzsgaSsrICkKPj4gK8KgwqDCoMKgwqDCoMKgIGwyZV93cml0
ZShsMnQgKyBpLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsMmVfZnJv
bV9wZm4obDNlX2dldF9wZm4ob2wzZSkgKwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChpIDw8IFBBR0VUQUJMRV9PUkRFUiks
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbDNlX2dldF9mbGFncyhvbDNlKSkpOwo+Cj4gSSB1bmRlcnN0YW5kIHRoaXMgaXMg
anVzdCBhIGZhY3RvciBvdXQgb2YgdGhlIGN1cnJlbnQgY29kZSwgYnV0IHRoZQo+IGNvZGUgZmVl
bHMgd3JvbmcgKGF0IGxlYXN0IGluIHRoZW9yeSkgYW5kIHdhc3RlZnVsLgo+Cj4gWW91IHdvdWxk
IGFsbG9jYXRlIHRoZSBMMiB0YWJsZSwgcHJlcGFyZSBpdCBhbmQgdGhlbiBmcmVlIGl0IGlmIHRo
ZSBMMwo+IGVudHJ5IGhhcyBfUEFHRV9QUkVTRU5UIG9yIF9QQUdFX1BTRSBjbGVhcmVkLgo+Cj4g
QWxzbywgaW4gdGhlb3J5LCB0aGVyZSBpcyBub3RoaW5nIHByZXZlbnRpbmcgdGhlIGwzIGZsYWdz
IHRvIGJlCj4gbW9kaWZpZWQgYmVoaW5kIHlvdXIgYmFjay4gU28geW91IGNvdWxkIGVuZCB1cCB0
byBnZW5lcmF0ZSB0aGUgbDIKPiBlbnRyaWVzIHdpdGggdGhlIG9sZCBsMyBmbGFncy4KPgo+IElu
IG51dHNoZWxsLCBpdCBmZWVscyB0byBtZSB0aGF0IHRoZSBzaGF0dGVyaW5nL2FsbG9jYXRpb24g
c2hvdWxkCj4gaGFwcGVuIHdpdGggdGhlIGxvY2sgdGFrZW4uIFRoaXMgd291bGQgYWxzbyBhbGxv
dyB5b3UgdG8gbm90IGFsbG9jYXRlCj4gdGhlIGwyIHRhYmxlIHdoZW4geW91IGFyZSByZW1vdmlu
ZyB0aGUgcGFnZS4KClRoZSBleGlzdGluZyBiZWhhdmlvdXIgaXMgZGVsaWJlcmF0ZSBhbmQgbW9z
dCBsaWtlbHkgd2FudHMgdG8gcmVtYWluLgoKSXQgbWFrZXMgYWRqdXN0bWVudHMgc2FmZSB0byBj
b25jdXJyZW50IG1vZGlmaWNhdGlvbnMsIHdoaWxlIHJlZHVjaW5nCnRoZSBjcml0aWNhbCBzZWN0
aW9uIG9mIHRoZSBsb2NrIHRvIG9ubHkgdGhlIGFsdGVyYXRpb24gb2YgdGhlIGxpdmUgUFRFcy4K
CldlIGRvbid0IGV4cGVjdCBjb25jdXJyZW50IGNvbmZsaWN0aW5nIHVwZGF0ZXMgdG8gdGhlc2Ug
cGFnZXRhYmxlcyBhdAphbGwsIGJ1dCBleHRlbmRpbmcgdGhlIGxvY2tlZCByZWdpb24gYXJvdW5k
IHRoZSBtZW1vcnkgYWxsb2NhdGlvbiBhbmQKd3JpdGluZyB0aGUgbmV3IHBhZ2V0YWJsZSBpcyBh
IGJvdHRsZWtuZWNrIHRvIHBhcmFsbGVsIHVwZGF0ZXMgb2YKaW5kZXBlbmRlbnQgYWRkcmVzc2Vz
LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
