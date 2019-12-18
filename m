Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D2A1243F4
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 11:09:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihWDO-000162-Db; Wed, 18 Dec 2019 10:05:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nDAh=2I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihWDM-00015x-VZ
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 10:05:57 +0000
X-Inumbo-ID: fad08e72-217d-11ea-904e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fad08e72-217d-11ea-904e-12813bfff9fa;
 Wed, 18 Dec 2019 10:05:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A37F3ACB7;
 Wed, 18 Dec 2019 10:05:54 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191217151144.9781-1-aisaila@bitdefender.com>
 <9012ab5f-4a3b-d469-6c03-20aa59773c2a@suse.com>
 <20fedb38-ac6e-772b-1859-eebd03c92989@bitdefender.com>
 <131f196c-e149-3cec-765b-be7bf36bf19b@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <75e8fff3-79fc-1363-a212-fb33dc8776bc@suse.com>
Date: Wed, 18 Dec 2019 11:06:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <131f196c-e149-3cec-765b-be7bf36bf19b@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAxMDo1NywgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MTguMTIuMjAxOSAxMDowNiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4+IE9uIDE3
LjEyLjIwMTkgMTg6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMTcuMTIuMjAxOSAxNjox
MiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2
L21tL3AybS1lcHQuYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMKPj4+PiBA
QCAtMTM1Myw3ICsxMzUzLDggQEAgdm9pZCBzZXR1cF9lcHRfZHVtcCh2b2lkKQo+Pj4+ICAgIAo+
Pj4+ICAgIHZvaWQgcDJtX2luaXRfYWx0cDJtX2VwdChzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25l
ZCBpbnQgaSkKPj4+PiAgICB7Cj4+Pj4gLSAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtID0gZC0+
YXJjaC5hbHRwMm1fcDJtW2ldOwo+Pj4+ICsgICAgc3RydWN0IHAybV9kb21haW4gKnAybSA9Cj4+
Pj4gKyAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fcDJtW2FycmF5X2luZGV4X25vc3BlYyhpLCBN
QVhfQUxUUDJNKV07Cj4+Pj4gICAgICAgIHN0cnVjdCBwMm1fZG9tYWluICpob3N0cDJtID0gcDJt
X2dldF9ob3N0cDJtKGQpOwo+Pj4+ICAgICAgICBzdHJ1Y3QgZXB0X2RhdGEgKmVwdDsKPj4+PiAg
ICAKPj4+PiBAQCAtMTM2Niw3ICsxMzY3LDcgQEAgdm9pZCBwMm1faW5pdF9hbHRwMm1fZXB0KHN0
cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpKQo+Pj4+ICAgICAgICBwMm0tPm1heF9tYXBw
ZWRfcGZuID0gcDJtLT5tYXhfcmVtYXBwZWRfZ2ZuID0gMDsKPj4+PiAgICAgICAgZXB0ID0gJnAy
bS0+ZXB0Owo+Pj4+ICAgICAgICBlcHQtPm1mbiA9IHBhZ2V0YWJsZV9nZXRfcGZuKHAybV9nZXRf
cGFnZXRhYmxlKHAybSkpOwo+Pj4+IC0gICAgZC0+YXJjaC5hbHRwMm1fZXB0cFtpXSA9IGVwdC0+
ZXB0cDsKPj4+PiArICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGks
IE1BWF9FUFRQKV0gPSBlcHQtPmVwdHA7Cj4+Pj4gICAgfQo+Pj4+ICAgIAo+Pj4+ICAgIHVuc2ln
bmVkIGludCBwMm1fZmluZF9hbHRwMm1fYnlfZXB0cChzdHJ1Y3QgZG9tYWluICpkLCB1aW50NjRf
dCBlcHRwKQo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+Pj4+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9tbS9wMm0uYwo+Pj4+IEBAIC0yNDk5LDcgKzI0OTksNyBAQCBzdGF0aWMgdm9pZCBw
Mm1fcmVzZXRfYWx0cDJtKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpZHgsCj4+Pj4g
ICAgICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm07Cj4+Pj4gICAgCj4+Pj4gICAgICAgIEFTU0VS
VChpZHggPCBNQVhfQUxUUDJNKTsKPj4+PiAtICAgIHAybSA9IGQtPmFyY2guYWx0cDJtX3AybVtp
ZHhdOwo+Pj4+ICsgICAgcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FycmF5X2luZGV4X25vc3Bl
YyhpZHgsIE1BWF9BTFRQMk0pXTsKPj4+PiAgICAKPj4+PiAgICAgICAgcDJtX2xvY2socDJtKTsK
Pj4+PiAgICAKPj4+PiBAQCAtMjU0MCw3ICsyNTQwLDcgQEAgc3RhdGljIGludCBwMm1fYWN0aXZh
dGVfYWx0cDJtKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpZHgpCj4+Pj4gICAgCj4+
Pj4gICAgICAgIEFTU0VSVChpZHggPCBNQVhfQUxUUDJNKTsKPj4+PiAgICAKPj4+PiAtICAgIHAy
bSA9IGQtPmFyY2guYWx0cDJtX3AybVtpZHhdOwo+Pj4+ICsgICAgcDJtID0gZC0+YXJjaC5hbHRw
Mm1fcDJtW2FycmF5X2luZGV4X25vc3BlYyhpZHgsIE1BWF9BTFRQMk0pXTsKPj4+Cj4+PiBBbGwg
b2YgdGhlIGFib3ZlIGhhdmUgYSBtb3JlIG9yIGxlc3Mgc2lnbmlmaWNhbnQgZGlzY29ubmVjdCBi
ZXR3ZWVuCj4+PiB0aGUgYm91bmRzIGNoZWNrIGFuZCB0aGUgdXNlIGFzIGFycmF5IGluZGV4LiBJ
IHRoaW5rIGl0IHdvdWxkIGJlCj4+PiBxdWl0ZSBoZWxwZnVsIGlmIHRoZXNlIGNvdWxkIGxpdmUg
Y2xvc2UgdG8gb25lIGFub3RoZXIsIHNvIG9uZSBjYW4KPj4+IChzZWUgZnVydGhlciB1cCkgZWFz
aWx5IHByb3ZlIHRoYXQgYm90aCBzcGVjaWZpZWQgYm91bmRzIGFjdHVhbGx5Cj4+PiBtYXRjaCB1
cC4KPj4+Cj4+Cj4+IFN1cmUsIEkgY2FuIG1vdmUgdGhlIGFycmF5IHVzZSBjbG9zZXIgdG9nZXRo
ZXIuCj4+Cj4gCj4gU29ycnkgdG8gY29tZSBiYWNrIG9uIHRoaXMgYnV0IEkgd2FzIGxvb2tpbmcg
aW4gdGhlIGNvZGUgYW5kIEkgYW0gbm90IAo+IHN1cmUgSSBmb2xsb3cgd2hlcmUgaXMgdGhlIGRp
c2Nvbm5lY3QuIElmIHlvdSBhcmUgdGFsa2luZyBhYm91dCAKPiBwMm1faW5pdF9hbHRwMm1fZXB0
KCkgdGhlIGVwdHAgY29kZSB3aWxsIG1vdmUgdXAgaW4gcGF0Y2ggMy80LgoKTXkgcmVtYXJrIHdh
cyBhYm91dCBhbGwgZm91ciBodW5rcyBsZWZ0IGluIGNvbnRleHQgKGFuZCB0aGVuIHN0aWxsCnBv
c3NpYmx5IGV4dGVuZGluZyB0byBvdGhlciBvbmVzKS4gTGV0J3MgdGFrZSB0aGUgbGFzdCBvbmUg
YWJvdmU6CnAybV9hY3RpdmF0ZV9hbHRwMm0oKSBoYXMgdHdvIGNhbGxlcnMsIG9uZSBvZiB3aGlj
aCBsb29wcyBvdmVyCmFsdHAybS1zIChhbmQgaGVuY2UgZG9lc24ndCBuZWVkIHRoZSBndWFyZCku
IFRoZSBvdGhlciBvbmUgaXMKcDJtX2luaXRfYWx0cDJtX2J5X2lkKCkgd2hpY2ggZG9lcyB0aGUg
cmFuZ2UgY2hlY2sgSSdtIHRhbGtpbmcKYWJvdXQgKEFTU0VSVCgpIGRvZXNuJ3QgY291bnQpLCBh
bmQgd2hpY2ggdGhlcmVmb3JlIGlzIHRoZSBwbGFjZQp0byB1c2UgYXJyYXlfaW5kZXhfbm9zcGVj
KCkuIE9uY2UgeW91IGxvb2sgdGhlcmUgeW91J2xsIG5vdGljZQp0aGF0IHRoZSBmdW5jdGlvbiBh
bHNvIGhhcyBhbiBhcnJheSBhY2Nlc3MgaXRzZWxmIHdoaWNoIHlvdSd2ZQpsZWZ0IHVudG91Y2hl
ZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
