Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5B010D45F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 11:49:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iadmt-0003F1-Ua; Fri, 29 Nov 2019 10:46:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iadms-0003Ew-Ey
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 10:46:10 +0000
X-Inumbo-ID: 73d0b72a-1295-11ea-9db0-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73d0b72a-1295-11ea-9db0-bc764e2007e4;
 Fri, 29 Nov 2019 10:46:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A08D4AFDB;
 Fri, 29 Nov 2019 10:46:08 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
 <98816869-c1db-52c1-baba-b878cde88d7a@suse.com>
 <350c285e-424e-a722-b340-dbd3ea08c12f@suse.com>
 <4819dbb83d9a43bb9ea37fbe79d57941@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0eede9aa-acd5-0f68-24ae-efa8cadec5b1@suse.com>
Date: Fri, 29 Nov 2019 11:46:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <4819dbb83d9a43bb9ea37fbe79d57941@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxMTozOSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiBTZW50OiAyOSBOb3ZlbWJlciAyMDE5IDEwOjI5Cj4+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVy
cmFudEBhbWF6b24uY29tPgo+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT47IEFudGhvbnkgUEVSQVJECj4+IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsg
R2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsKPj4gUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBWb2xvZHlteXIgQmFiY2h1awo+PiA8Vm9sb2R5
bXlyX0JhYmNodWtAZXBhbS5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNp
dHJpeC5jb20+Owo+PiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IE1h
cmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraQo+PiA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFi
LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQo+PiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgS29ucmFkIFJ6ZXN6dXRlawo+PiBXaWxrIDxr
b25yYWQud2lsa0BvcmFjbGUuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFdl
aSBMaXUKPj4gPHdsQHhlbi5vcmc+Cj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0gtZm9yLTQuMTMgdjVd
IFJhdGlvbmFsaXplIG1heF9ncmFudF9mcmFtZXMgYW5kCj4+IG1heF9tYXB0cmFja19mcmFtZXMg
aGFuZGxpbmcKPj4KPj4gT24gMjkuMTEuMjAxOSAxMToyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
PiBPbiAyOC4xMS4yMDE5IDE3OjUyLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4gLS0tIGEveGVu
L2NvbW1vbi9ncmFudF90YWJsZS5jCj4+Pj4gKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5j
Cj4+Pj4gQEAgLTg0LDExICs4NCw0MCBAQCBzdHJ1Y3QgZ3JhbnRfdGFibGUgewo+Pj4+ICAgICAg
c3RydWN0IGdyYW50X3RhYmxlX2FyY2ggYXJjaDsKPj4+PiAgfTsKPj4+Pgo+Pj4+ICtzdGF0aWMg
aW50IHBhcnNlX2dudHRhYl9saW1pdChjb25zdCBjaGFyICpwYXJhbSwgY29uc3QgY2hhciAqYXJn
LAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKnZhbHAp
Cj4+Pj4gK3sKPj4+PiArICAgIGNvbnN0IGNoYXIgKmU7Cj4+Pj4gKyAgICB1bnNpZ25lZCBsb25n
IHZhbDsKPj4+PiArCj4+Pj4gKyAgICB2YWwgPSBzaW1wbGVfc3RydG91bChhcmcsICZlLCAwKTsK
Pj4+PiArICAgIGlmICggKmUgKQo+Pj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4+ICsK
Pj4+PiArICAgIGlmICggdmFsID4gSU5UX01BWCApCj4+Pj4gKyAgICAgICAgcmV0dXJuIC1FUkFO
R0U7Cj4+Pj4gKwo+Pj4+ICsgICAgcmV0dXJuIDA7Cj4+Pj4gK30KPj4+Cj4+PiAqdmFscCBkb2Vz
bid0IGdldCB3cml0dGVuIHRvIGFueW1vcmUuCj4gCj4gVGhhdCB3YXMgaW50ZW50aW9uYWwsIGdp
dmVuIEp1ZXJnZW4ncyBjb21tZW50Li4uCj4gCj4+IFdpdGggdGhpcyBmaXhlZCAoYW5kIG5vIG5l
dwo+Pj4gaXNzdWVzIGludHJvZHVjZWQgOy0pICkgaHlwZXJ2aXNvciBzaWRlCj4+PiBSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+PiBBbmQgSSBndWVzcyBJ
IHNob3VsZCBoYXZlIGNsYXJpZmllZDogSSdkIGJlIGZpbmUgYWRkaW5nIHRoZSBtaXNzaW5nCj4+
IGFzc2lnbm1lbnQgd2hpbGUgY29tbWl0dGluZywgcHJvdmlkZWQgdGhlIHRvb2xzIHNpZGUgd29u
J3QgcmVxdWlyZQo+PiBhbnkgY2hhbmdlcy4KPiAKPiAuLi5idXQgaWYgd2Ugd2FudCB0byBhbGxv
dyBkb20wIHRvIHNldCBpdHNlbGYgdXAgZm9yIElOVF9NQVggZnJhbWVzCj4gaW4gdGhlIGV2ZW50
IG9mIGEgYmFkIHZhbHVlIHRoZW4gSSdtIG5vdCBvYmplY3RpbmcuCgpMb29rcyBsaWtlIHlvdSdy
ZSBtaXN1bmRlcnN0YW5kaW5nLCBvciBJJ20gbWlzc2luZyBzb21ldGhpbmc6ClRoZSBjb21tYW5k
IGxpbmUgb3B0aW9ucyByaWdodCBub3cgd29uJ3QgdGFrZSBhbnkgZWZmZWN0LCBhcwp0aGUgb3B0
XyogZ2xvYmFsIHZhcmlhYmxlcyB3b24ndCBiZSB3cml0dGVuIHRvIGF0IGFsbC4gSSdtIG5vdAp0
YWtpbmcgYWJvdXQgZmFsbGluZyBiYWNrIHRvIHVzaW5nIElOVF9NQVggd2hlbiB3ZSd2ZSBub3Rp
Y2VkCmFuIG91dCBvZiBib3VuZHMgdmFsdWUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
