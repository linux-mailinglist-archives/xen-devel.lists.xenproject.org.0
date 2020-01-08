Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EB5133FD7
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 12:02:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip94i-0002m3-Ik; Wed, 08 Jan 2020 11:00:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ip94g-0002lt-Uq
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 11:00:30 +0000
X-Inumbo-ID: 1061656e-3206-11ea-b263-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1061656e-3206-11ea-b263-bc764e2007e4;
 Wed, 08 Jan 2020 11:00:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C3DBAAD12;
 Wed,  8 Jan 2020 11:00:20 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20200108104324.16928-1-jgross@suse.com>
 <24584af1-b527-8fae-31a5-91368adc9f40@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4e93a243-197a-ef0c-730d-be47a313a5b2@suse.com>
Date: Wed, 8 Jan 2020 12:00:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <24584af1-b527-8fae-31a5-91368adc9f40@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/spinlock: disable spinlock debugging in
 console_force_unlock()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAgMTE6NTgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDgvMDEvMjAyMCAx
MDo0MywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gY29uc29sZV9mb3JjZV91bmxvY2soKSBtaWdo
dCByZXN1bHQgaW4gc3Vic2VxdWVudCBBU1NFUlQoKSB0cmlnZ2VyaW5nCj4+IHdoZW4gQ09ORklH
X0RFQlVHX0xPQ0tTIHdhcyBhY3RpdmUuIEF2b2lkIHRoYXQgYnkgY2FsbGluZwo+PiBzcGluX2Rl
YnVnX2Rpc2FibGUoKSBpbiBjb25zb2xlX2ZvcmNlX3VubG9jaygpIGFuZCBtYWtlIHRoZSBzcGlu
bG9jawo+PiBkZWJ1ZyBhc3NlcnRpb25zIHRyaWdnZXIgb25seSBpZiBzcGluX2RlYnVnIHdhcyBh
Y3RpdmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPj4gLS0tCj4+ICAgeGVuL2NvbW1vbi9zcGlubG9jay5jICAgICAgfCAyICstCj4+ICAgeGVu
L2RyaXZlcnMvY2hhci9jb25zb2xlLmMgfCAxICsKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9z
cGlubG9jay5jIGIveGVuL2NvbW1vbi9zcGlubG9jay5jCj4+IGluZGV4IGVkNjlmMGE0ZDIuLjJh
MDZkZTNlNmEgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9jb21tb24vc3BpbmxvY2suYwo+PiArKysgYi94
ZW4vY29tbW9uL3NwaW5sb2NrLmMKPj4gQEAgLTg1LDcgKzg1LDcgQEAgc3RhdGljIHZvaWQgZ290
X2xvY2sodW5pb24gbG9ja19kZWJ1ZyAqZGVidWcpCj4+ICAgCj4+ICAgc3RhdGljIHZvaWQgcmVs
X2xvY2sodW5pb24gbG9ja19kZWJ1ZyAqZGVidWcpCj4+ICAgewo+PiAtICAgIEFTU0VSVChkZWJ1
Zy0+Y3B1ID09IHNtcF9wcm9jZXNzb3JfaWQoKSk7Cj4+ICsgICAgQVNTRVJUKGF0b21pY19yZWFk
KCZzcGluX2RlYnVnKSA8PSAwIHx8IGRlYnVnLT5jcHUgPT0gc21wX3Byb2Nlc3Nvcl9pZCgpKTsK
PiAKPiBQZXJzb25hbGx5LCBJIHRoaW5rIHRoZSBsb2dpYyB3b3VsZCBiZSBlYXNpZXIgdG8gZm9s
bG93IGFzOgo+IAo+IGlmICggYXRvbWljX3JlYWQoJnNwaW5fZGVidWcpICkKPiAgwqDCoMKgIEFT
U0VSVChkZWJ1Zy0+Y3B1ID09IHNtcF9wcm9jZXNzb3JfaWQoKSk7Cj4gCj4gT3RoZXJ3aXNlLCBM
R1RNLsKgIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pi4KPiBDYW4gYmUgZml4ZWQgb24gY29tbWl0IGlmIHlvdSBhZ3JlZS4KPiAKCk5vIG9iamVjdGlv
biBmcm9tIG1lLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
