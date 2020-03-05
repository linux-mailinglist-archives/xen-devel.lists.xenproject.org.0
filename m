Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB28017A3AA
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 12:07:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9oJN-0007ID-Fe; Thu, 05 Mar 2020 11:05:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9oJM-0007I0-53
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 11:05:04 +0000
X-Inumbo-ID: 29ac9e6a-5ed1-11ea-a563-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29ac9e6a-5ed1-11ea-a563-12813bfff9fa;
 Thu, 05 Mar 2020 11:05:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E0BF8AEE2;
 Thu,  5 Mar 2020 11:05:01 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-21-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6bbd8242-d79d-6e94-76f1-5fc6944a9978@suse.com>
Date: Thu, 5 Mar 2020 12:05:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226113355.2532224-21-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 20/23] xen/build: factorise
 generation of the linker scripts
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gLS0tIGEveGVuL1J1
bGVzLm1rCj4gKysrIGIveGVuL1J1bGVzLm1rCj4gQEAgLTIzMCw2ICsyMzAsMTQgQEAgY21kX3Nf
UyA9ICQoQ1BQKSAkKGZpbHRlci1vdXQgLVdhJChjb21tYSklLCQoYV9mbGFncykpICQ8IC1vICRA
Cj4gICUuczogJS5TIEZPUkNFCj4gIAkkKGNhbGwgaWZfY2hhbmdlZCxjcHBfc19TKQo+ICAKPiAr
IyBMaW5rZXIgc2NyaXB0cywgLmxkcy5TIC0+IC5sZHMKPiArcXVpZXRfY21kX2NjX2xkc19TID0g
TERTICAgICAkQAo+ICtkZWZpbmUgY21kX2NjX2xkc19TCj4gKyAgICAkKENDKSAtUCAtRSAtVWkz
ODYgJChmaWx0ZXItb3V0IC1XYSQoY29tbWEpJSwkKGFfZmxhZ3MpKSAtbyAkQCAkPDsgXAoKJChD
UFApPyBBbmQgdGhlbiBhbHNvIG5hbWUgdGhlIHRoaW5nIGNtZF9jcHBfbGRzX1M/Cgo+ICsgICAg
c2VkIC1lICdzLy4qXC5sZHNcLm86LyQoQEYpOi9nJyA8JChkb3QtdGFyZ2V0KS5kID4kKGRvdC10
YXJnZXQpLmQubmV3OyBcCj4gKyAgICBtdiAtZiAkKGRvdC10YXJnZXQpLmQubmV3ICQoZG90LXRh
cmdldCkuZAoKVGhpcyB3b3VsZCBiZW5lZml0IGZyb20gYWxzbyBzd2l0Y2hpbmcgdG8gbW92ZS1p
Zi1jaGFuZ2VkIGF0CnRoaXMgb2NjYXNpb24uCgpXaXRoIHlvdSB1c2luZyAiZGVmaW5lIiAtIGlz
IHRoZXJlIHJlYWxseSBhIG5lZWQgZm9yIGFkZGluZyB0aGUKdHJhaWxpbmcgIjsgXCIgc2VxdWVu
Y2UgdG8gdGhlIGZpcnN0IHR3byBsaW5lcyBvZiB0aGUgbWFjcm8/Cgo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9NYWtlZmlsZQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+IEBAIC03NSw2ICs3
NSw3IEBAIG9iai15ICs9IGhwZXQubwo+ICBvYmoteSArPSB2bV9ldmVudC5vCj4gIG9iai15ICs9
IHhzdGF0ZS5vCj4gIGV4dHJhLXkgKz0gYXNtLW1hY3Jvcy5pCj4gK2V4dHJhLXkgKz0geGVuLmxk
cwo+ICAKPiAgeDg2X2VtdWxhdGUubzogeDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYyB4ODZfZW11
bGF0ZS94ODZfZW11bGF0ZS5oCj4gIAo+IEBAIC0xOTcsNiArMTk4LDcgQEAgZW5kaWYKPiAgbm90
ZV9maWxlX29wdGlvbiA/PSAkKG5vdGVfZmlsZSkKPiAgCj4gIGlmZXEgKCQoWEVOX0JVSUxEX1BF
KSx5KQo+ICtleHRyYS15ICs9IGVmaS5sZHMKCldvdWxkIGJlIG5pY2UgaWYgdGhpcyB3YXMgbW92
ZWQgdXAgdXNpbmcKCmV4dHJhLSQoWEVOX0JVSUxEX1BFKSArPSBlZmkubGRzCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
