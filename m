Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79772103623
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 09:43:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXLWj-0003vs-1Z; Wed, 20 Nov 2019 08:39:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXLWh-0003vn-Fb
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 08:39:51 +0000
X-Inumbo-ID: 4fc7b459-0b71-11ea-a30b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4fc7b459-0b71-11ea-a30b-12813bfff9fa;
 Wed, 20 Nov 2019 08:39:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6B91CB1EA;
 Wed, 20 Nov 2019 08:39:49 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191118181509.10981-1-andrew.cooper3@citrix.com>
 <7a24ae9e-ec83-b3f4-7b28-5de90782f7f9@suse.com>
 <054ad990-f68f-d0b4-7918-40a5a7854420@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <990dd638-e61f-2c48-c4ea-459ce97fd705@suse.com>
Date: Wed, 20 Nov 2019 09:39:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <054ad990-f68f-d0b4-7918-40a5a7854420@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/nested-hap: Fix handling of L0_ERROR
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTEuMjAxOSAxNTo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOS8xMS8yMDE5
IDExOjEzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTguMTEuMjAxOSAxOToxNSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEBAIC0xODEsNiArMTgwLDE4IEBAIG5lc3RlZGhhcF93YWxrX0ww
X3AybShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCBwYWRkcl90IEwxX2dwYSwgcGFkZHJfdCAqTDBf
Z3BhLAo+Pj4gICAgICAqTDBfZ3BhID0gKG1mbl94KG1mbikgPDwgUEFHRV9TSElGVCkgKyAoTDFf
Z3BhICYgflBBR0VfTUFTSyk7Cj4+PiAgb3V0Ogo+Pj4gICAgICBfX3B1dF9nZm4ocDJtLCBMMV9n
cGEgPj4gUEFHRV9TSElGVCk7Cj4+PiArCj4+PiArICAgIC8qCj4+PiArICAgICAqIFdoZW4gcmVw
b3J0aW5nIEwwX0VSUk9SLCByZXdyaXRlIG5mcGVjIHRvIG1hdGNoIHdoYXQgd291bGQgaGF2ZSBv
Y2N1cmVkCj4+PiArICAgICAqIGlmIGhhcmR3YXJlIGhhZCB3YWxrZWQgdGhlIEwwLCByYXRoZXIg
dGhhbiB0aGUgY29tYmluZWQgTDAyLgo+Pj4gKyAgICAgKi8KPj4+ICsgICAgaWYgKCByYyA9PSBO
RVNURURIVk1fUEFHRUZBVUxUX0wwX0VSUk9SICkKPj4+ICsgICAgewo+Pj4gKyAgICAgICAgbnBm
ZWMtPnByZXNlbnQgPSAhbWZuX2VxKG1mbiwgSU5WQUxJRF9NRk4pOwo+PiBUbyBiZSBpbiBsaW5l
IHdpdGggdGhlIGNvbmRpdGlvbmFsIGEgZmV3IGxpbmVzIHVwIGZyb20gaGVyZSwKPj4gd291bGRu
J3QgdGhpcyBiZXR0ZXIgYmUgIW1mbl92YWxpZChtZm4pPwo+IAo+IFRoYXQncyBub3QgaG93IHRo
ZSByZXR1cm4gdmFsdWUgZnJvbSBnZXRfZ2ZuXyooKSB3b3JrcywgYW5kIHdvdWxkIGJyZWFrCj4g
dGhlIE1NSU8gY2FzZS4KClRvIGRlYWwgd2l0aCB0aGUgTU1JTyBjYXNlIHRoZSBpZigpIGNvbmRp
dGlvbiBuZWVkcyBleHRlbmRpbmcKKG9yIGEgc2VwYXJhdGUgY29kZSBibG9jayBuZWVkcyBhZGRp
bmcpIGFuZCB0aGVuIEkgd291bGQgc3RpbGwKc2VlIHRoaXMgYXNzaWdubWVudCBiZWNvbWUKCiAg
ICAgICBucGZlYy0+cHJlc2VudCA9IG1mbl92YWxpZChtZm4pIHx8IHJjID09IE5FU1RFREhWTV9Q
QUdFRkFVTFRfRElSRUNUX01NSU87CgpBZnRlciBhbGwgd2UgbmV2ZXIgd3JpdGUgbm9uLXByZXNl
bnQgZGlyZWN0IE1NSU8gZW50cmllcy4gKFRoZQphYm92ZSBpcyBpZ25vcmluZyB0aGUgcXVlc3Rp
b24gb2Ygd2hldGhlciAxIC0+IDAgdHJhbnNpdGlvbnMgb2YKLT5wcmVzZW50IGFyZSB0byBiZSBw
ZXJtaXR0ZWQsIGFzIHBlciB0aGUgb3RoZXIgc3ViLXRocmVhZC4pClRoaXMgaXMgdG8gY29wZSB3
aXRoIChjdXJyZW50IG9yIHBvdGVudGlhbCBmdXR1cmUpIHAybSBlbnRyaWVzCnRoYXQgZ2V0IGEg
c3BlY2lhbCBNRk4gc3RvcmVkLCBlLmcuIGFsb25nIHRoZSBsaW5lcyBvZgpTSEFSRURfUDJNX0VO
VFJZLiBJIGRvbid0IHRoaW5rIHdlIGhhdmUgYW55IHN1Y2ggcmlnaHQgbm93LCBidXQKSSBhbHNv
IGRvbid0IHNlZSB3aHkgY29kZSBzaG91bGRuJ3QgYmUgcHJlcGFyZWQgZm9yIG9uZXMgdG8KYXBw
ZWFyLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
