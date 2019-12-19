Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B4C126004
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 11:54:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihtQ1-0002V1-Gs; Thu, 19 Dec 2019 10:52:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihtPz-0002Uv-QR
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 10:52:31 +0000
X-Inumbo-ID: a2242c84-224d-11ea-a914-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2242c84-224d-11ea-a914-bc764e2007e4;
 Thu, 19 Dec 2019 10:52:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29103AF21;
 Thu, 19 Dec 2019 10:52:21 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191219094236.22002-1-aisaila@bitdefender.com>
 <20191219094236.22002-2-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6325e94-d54f-f6ac-8168-4175333367b0@suse.com>
Date: Thu, 19 Dec 2019 11:52:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191219094236.22002-2-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTIuMjAxOSAxMDo0MiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gLS0t
IGEveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1
YmxpYy9odm0vaHZtX29wLmgKPiBAQCAtNDYsNiArNDYsMTYgQEAgc3RydWN0IHhlbl9odm1fYWx0
cDJtX3N1cHByZXNzX3ZlIHsKPiAgICAgIHVpbnQ2NF90IGdmbjsKPiAgfTsKPiAgCj4gK3N0cnVj
dCB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZV9tdWx0aSB7Cj4gKyAgICB1aW50MTZfdCB2aWV3
Owo+ICsgICAgdWludDhfdCBzdXBwcmVzc192ZTsgLyogQm9vbGVhbiB0eXBlLiAqLwo+ICsgICAg
dWludDhfdCBwYWQxOwo+ICsgICAgaW50MzJfdCBmaXJzdF9lcnJvcl9jb2RlOyAvKiBNdXN0IGJl
IHNldCB0byAwIC4gKi8KPiArICAgIHVpbnQ2NF90IGZpcnN0X2dmbjsgLyogVmFsdWUgd2lsbCBi
ZSB1cGRhdGVkICovCgpzL3dpbGwvbWF5LwoKPiArICAgIHVpbnQ2NF90IGxhc3RfZ2ZuOwo+ICsg
ICAgdWludDY0X3QgZmlyc3RfZXJyb3I7IC8qIEdmbiBvZiB0aGUgZmlyc3QgZXJyb3IuIE11c3Qg
YmUgc2V0IHRvIDAuICovCgpUaGVyZSdzIG5vIHJlYWwgIm11c3QiIGhlcmUuIFBsZWFzZSBhdCBt
b3N0IHNheSAic2hvdWxkIiwgYnV0IEknZApldmVuIGNvbnNpZGVyIGRyb3BwaW5nIHRoYXQgcGFy
dCBvZiB0aGUgY29tbWVudCBhbHRvZ2V0aGVyLiBUaGUKY29uc3VtZXIgbG9naWMgbmVlZHMgdG8g
a2V5IG9mZiBvZiB0aGUgZXJyb3IgY29kZSBhbnl3YXkuIEV2ZW4KZm9yIHRoZSBlcnJvciBjb2Rl
IGZpZWxkIEknZCBzdWdnZXN0IHNheWluZyBqdXN0ICJzaG91bGQiOiBZb3UKZG9uJ3QgY2hlY2sg
aXQgKGJlY2F1c2UgeW91IGNhbid0KSwgYW5kIHRoZSBjYWxsZXIgb25seSBzaG9vdHMKaXRzZWxm
IGluIHRoZSBmb290IGlmIGl0IGRvZXNuJ3QgZG8gc28uCgpBbHNvIGxvb2tpbmcgYXQgdGhpcyB5
ZXQgYWdhaW4gLSBJIHRoaW5rIGZpZWxkIG5hbWVzIHdvdWxkIGJldHRlcgpiZSAiZmlyc3RfZXJy
b3IiIGZvciB0aGUgZXJyb3IgY29kZSBhbmQgImZpcnN0X2Vycm9yX2dmbiIgZm9yIHRoZQpHRk4u
CgpBbnl3YXksIHByZWZlcmFibHkgd2l0aCB0aGUgc3VnZ2VzdGVkIGFkanVzdG1lbnRzLCBhcHBs
aWNhYmxlCmh5cGVydmlzb3IgcGFydHMKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
