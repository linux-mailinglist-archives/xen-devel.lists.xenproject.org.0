Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9715D179337
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 16:22:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9VoO-0001Td-Qi; Wed, 04 Mar 2020 15:19:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9VoN-0001TY-Pk
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 15:19:51 +0000
X-Inumbo-ID: 9722e8a6-5e2b-11ea-a41c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9722e8a6-5e2b-11ea-a41c-12813bfff9fa;
 Wed, 04 Mar 2020 15:19:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D0FF1B31A;
 Wed,  4 Mar 2020 15:19:48 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-10-jgross@suse.com>
 <61640156-0e35-6808-829a-2eb8accbfb94@suse.com>
 <1a6e1c6c-7e88-3396-885b-62371bb24db4@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36259bf3-8469-5aac-fb02-3966ae1500fd@suse.com>
Date: Wed, 4 Mar 2020 16:19:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1a6e1c6c-7e88-3396-885b-62371bb24db4@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 09/12] xen: add runtime parameter access
 support to hypfs
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDMuMjAyMCAxNjowNywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNC4wMy4yMCAx
MjozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI2LjAyLjIwMjAgMTM6NDcsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiArc3RhdGljIHZvaWQgdXBkYXRlX2VwdF9wYXJhbV9hcHBlbmQoY29u
c3QgY2hhciAqc3RyLCBpbnQgdmFsKQo+Pj4gK3sKPj4+ICsgICAgY2hhciAqcG9zID0gb3B0X2Vw
dF9zZXR0aW5nICsgc3RybGVuKG9wdF9lcHRfc2V0dGluZyk7Cj4+PiArCj4+PiArICAgIHNucHJp
bnRmKHBvcywgc2l6ZW9mKG9wdF9lcHRfc2V0dGluZykgLSAocG9zIC0gb3B0X2VwdF9zZXR0aW5n
KSwKPj4+ICsgICAgICAgICAgICAgIiwlcz0lZCIsIHN0ciwgdmFsKTsKPj4+ICt9Cj4+PiArCj4+
PiArc3RhdGljIHZvaWQgdXBkYXRlX2VwdF9wYXJhbSh2b2lkKQo+Pj4gK3sKPj4+ICsgICAgc25w
cmludGYob3B0X2VwdF9zZXR0aW5nLCBzaXplb2Yob3B0X2VwdF9zZXR0aW5nKSwgInBtbD0lZCIs
IG9wdF9lcHRfcG1sKTsKPj4+ICsgICAgaWYgKCBvcHRfZXB0X2FkID49IDAgKQo+Pj4gKyAgICAg
ICAgdXBkYXRlX2VwdF9wYXJhbV9hcHBlbmQoImFkIiwgb3B0X2VwdF9hZCk7Cj4+Cj4+IFRoaXMg
d29uJ3QgY29ycmVjdGx5IHJlZmxlY3QgcmVhbGl0eTogSWYgeW91IGxvb2sgYXQKPj4gdm14X2lu
aXRfdm1jc19jb25maWcoKSwgZXZlbiBhIG5lZ2F0aXZlIHZhbHVlIG1lYW5zICJ0cnVlIiBoZXJl
LAo+PiB1bmxlc3Mgb24gYSBzcGVjaWZpYyBBdG9tIG1vZGVsLiBJIHRoaW5rIGluaXRfZXB0X3Bh
cmFtKCkgd2FudHMKPj4gdG8gaGF2ZSB0aGF0IGVycmF0dW0gd29ya2Fyb3VuZCBsb2dpYyBtb3Zl
ZCB0aGVyZSwgc3VjaCB0aGF0Cj4+IHlvdSBjYW4gdGhlbiBhc3NtZSB0aGUgdmFsdWUgdG8gYmUg
bm9uLW5lZ2F0aXZlIGhlcmUuCj4gCj4gQnV0IGlzbid0IG5vdCBtZW50aW9uaW5nIGl0IGluIHRo
ZSAtMSBjYXNlIGNvcnJlY3Q/IC0xIG1lYW5zOiBkbyB0aGUKPiBjb3JyZWN0IHRoaW5nIG9uIHRo
ZSBjdXJyZW50IGhhcmR3YXJlLgoKV2VsbCwgSSB0aGluayB0aGUgb3V0cHV0IGhlcmUgc2hvdWxk
IHJlcHJlc2VudCBlZmZlY3RpdmUgc2V0dGluZ3MsCmFuZCBhIHN1Yi1pdGVtIHNob3VsZCBiZSBz
dXBwcmVzc2VkIG9ubHkgaWYgYSBzZXR0aW5nIGhhcyBubyBlZmZlY3QKYXQgYWxsIGluIHRoZSBj
dXJyZW50IHNldHVwLCBsaWtlIC4uLgoKPj4+ICsgICAgaWYgKCBvcHRfZXB0X2V4ZWNfc3AgPj0g
MCApCj4+PiArICAgICAgICB1cGRhdGVfZXB0X3BhcmFtX2FwcGVuZCgiZXhlYy1zcCIsIG9wdF9l
cHRfZXhlY19zcCk7Cj4+Cj4+IEkgYWdyZWUgZm9yIHRoaXMgb25lIC0gaWYgdGhlIHZhbHVlIGlz
IHN0aWxsIC0xLCBpdCBoYXMgbmVpdGhlcgo+PiBiZWVuIHNldCBub3IgaXMgaXRzIHZhbHVlIG9m
IGFueSBpbnRlcmVzdC4KCi4uLiBoZXJlLgoKPj4+IC0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFi
bGUuYwo+Pj4gKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+PiBAQCAtODUsOCArODUs
MTAgQEAgc3RydWN0IGdyYW50X3RhYmxlIHsKPj4+ICAgICAgIHN0cnVjdCBncmFudF90YWJsZV9h
cmNoIGFyY2g7Cj4+PiAgIH07Cj4+PiAgIAo+Pj4gLXN0YXRpYyBpbnQgcGFyc2VfZ250dGFiX2xp
bWl0KGNvbnN0IGNoYXIgKnBhcmFtLCBjb25zdCBjaGFyICphcmcsCj4+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICp2YWxwKQo+Pj4gKyNkZWZpbmUgR1JBTlRf
Q1VTVE9NX1ZBTF9TWiAgMTIKPj4+ICsKPj4+ICtzdGF0aWMgaW50IHBhcnNlX2dudHRhYl9saW1p
dChjb25zdCBjaGFyICphcmcsIHVuc2lnbmVkIGludCAqdmFscCwKPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjaGFyICpwYXJ2YWwpCj4+PiAgIHsKPj4+ICAgICAgIGNvbnN0IGNo
YXIgKmU7Cj4+PiAgICAgICB1bnNpZ25lZCBsb25nIHZhbDsKPj4+IEBAIC05OSwyOCArMTAxLDQ3
IEBAIHN0YXRpYyBpbnQgcGFyc2VfZ250dGFiX2xpbWl0KGNvbnN0IGNoYXIgKnBhcmFtLCBjb25z
dCBjaGFyICphcmcsCj4+PiAgICAgICAgICAgcmV0dXJuIC1FUkFOR0U7Cj4+PiAgIAo+Pj4gICAg
ICAgKnZhbHAgPSB2YWw7Cj4+PiArICAgIHNucHJpbnRmKHBhcnZhbCwgR1JBTlRfQ1VTVE9NX1ZB
TF9TWiwgIiVsdSIsIHZhbCk7Cj4+PiAgIAo+Pj4gICAgICAgcmV0dXJuIDA7Cj4+PiAgIH0KPj4+
ICAgCj4+PiAgIHVuc2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IG9wdF9tYXhfZ3JhbnRfZnJhbWVz
ID0gNjQ7Cj4+PiArc3RhdGljIGNoYXIgX19yZWFkX21vc3RseSBvcHRfbWF4X2dyYW50X2ZyYW1l
c192YWxbR1JBTlRfQ1VTVE9NX1ZBTF9TWl07Cj4+PiArCj4+PiArc3RhdGljIHZvaWQgX19pbml0
IGdudHRhYl9tYXhfZnJhbWVzX2luaXQoc3RydWN0IHBhcmFtX2h5cGZzICpwYXIpCj4+PiArewo+
Pj4gKyAgICBjdXN0b21fcnVudGltZV9zZXRfdmFyKHBhciwgb3B0X21heF9ncmFudF9mcmFtZXNf
dmFsKTsKPj4KPj4gWW91IHN0aWxsIHVzZSBhIGN1c3RvbSBzdHJpbmcgYnVmZmVyIGhlcmUuIENh
biB0aGlzICJzZXQtdmFyIgo+PiBvcGVyYXRpb24gcmVjb3JkIHRoYXQgdGhlIHZhcmlhYmxlIChm
b3IgcHJlc2VudGF0aW9uIHB1cnBvc2VzKQo+PiBpcyBzaW1wbHkgb2YgVUlOVCB0eXBlLCBoYW5k
aW5nIGEgcG9pbnRlciB0byB0aGUgYWN0dWFsCj4+IHZhcmlhYmxlPwo+IAo+IE5vLCB0aGlzIHdv
dWxkIHJlc3VsdCBpbiB0aGUgbmVlZCB0byBzZXQgYSBjdXN0b20gcGFyYW1ldGVyIHZpYSBhCj4g
YmluYXJ5IHZhbHVlIHBhc3NlZCBpbiBmcm9tIHVzZXIgbGFuZC4gU28gSSdkIG5lZWQgdG8gY29u
dmVydCB0aGlzCj4gYmluYXJ5IGludG8gYSBzdHJpbmcgdG8gYmUgcGFyc2VhYmxlIGJ5IHRoZSBj
dXN0b20gZnVuY3Rpb24uCgpIbW0sIG5vdCB2ZXJ5IGZvcnR1bmF0ZSwgYnV0IEkgY2FuIHNlZSB3
aGF0IHlvdSdyZSBzYXlpbmcuCgo+Pj4gLS0tIGEveGVuL2NvbW1vbi9oeXBmcy5jCj4+PiArKysg
Yi94ZW4vY29tbW9uL2h5cGZzLmMKPj4+IEBAIC0xMCw2ICsxMCw3IEBACj4+PiAgICNpbmNsdWRl
IDx4ZW4vaHlwZXJjYWxsLmg+Cj4+PiAgICNpbmNsdWRlIDx4ZW4vaHlwZnMuaD4KPj4+ICAgI2lu
Y2x1ZGUgPHhlbi9saWIuaD4KPj4+ICsjaW5jbHVkZSA8eGVuL3BhcmFtLmg+Cj4+PiAgICNpbmNs
dWRlIDx4ZW4vcndsb2NrLmg+Cj4+PiAgICNpbmNsdWRlIDxwdWJsaWMvaHlwZnMuaD4KPj4+ICAg
Cj4+PiBAQCAtMjgxLDYgKzI4MiwzMyBAQCBpbnQgaHlwZnNfd3JpdGVfYm9vbChzdHJ1Y3QgaHlw
ZnNfZW50cnlfbGVhZiAqbGVhZiwKPj4+ICAgICAgIHJldHVybiAwOwo+Pj4gICB9Cj4+PiAgIAo+
Pj4gK2ludCBoeXBmc193cml0ZV9jdXN0b20oc3RydWN0IGh5cGZzX2VudHJ5X2xlYWYgKmxlYWYs
Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQp
IHVhZGRyLCB1bnNpZ25lZCBsb25nIHVsZW4pCj4+PiArewo+Pj4gKyAgICBzdHJ1Y3QgcGFyYW1f
aHlwZnMgKnA7Cj4+PiArICAgIGNoYXIgKmJ1ZjsKPj4+ICsgICAgaW50IHJldDsKPj4+ICsKPj4+
ICsgICAgYnVmID0geHphbGxvY19hcnJheShjaGFyLCB1bGVuKTsKPj4+ICsgICAgaWYgKCAhYnVm
ICkKPj4+ICsgICAgICAgIHJldHVybiAtRU5PTUVNOwo+Pj4gKwo+Pj4gKyAgICByZXQgPSAtRUZB
VUxUOwo+Pj4gKyAgICBpZiAoIGNvcHlfZnJvbV9ndWVzdChidWYsIHVhZGRyLCB1bGVuKSApCj4+
PiArICAgICAgICBnb3RvIG91dDsKPj4+ICsKPj4+ICsgICAgcmV0ID0gLUVET007Cj4+PiArICAg
IGlmICggIW1lbWNocihidWYsIDAsIHVsZW4pICkKPj4KPj4gT25jZSBhZ2FpbiAiICE9IGJ1ZiAr
IHVsZW4gLSAxIj8gKEVET00gYWxzbyBsb29rcyBsaWtlIGFuIG9kZAo+PiBlcnJvciBjb2RlIHRv
IHVzZSBpbiB0aGlzIGNhc2UsIGJ1dCBJIGd1ZXNzIHRoZXJlJ3Mgbm8gcmVhbGx5Cj4+IGdvb2Qg
b25lLikKPiAKPiAiICE9IGJ1ZiArIHVsZW4gLSAxIiBpcyBhIGxvZ2ljYWwgY2hvaWNlIHdpdGgg
dGhlIGNoYW5nZSBvZiBwYXRjaCA0LgoKSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQuIFlv
dSB3YW50IHRvIHBhcnNlIGEgc3RyaW5nIGhlcmUuClRoZSBjYWxsZXIgc2hvdWxkIHRlbGwgeW91
IHdoYXQgdGhlIHN0cmluZyBsZW5ndGggaXMgKGluY2x1ZGluZwp0aGUgbnVsIGFnYWluKSwgbm90
IHdoYXQgaXRzIGJ1ZmZlciBzaXplIG1heSBiZS4KCj4+PiBAQCAtNzksNDEgKzg4LDk0IEBAIGV4
dGVybiBjb25zdCBzdHJ1Y3Qga2VybmVsX3BhcmFtIF9fcGFyYW1fc3RhcnRbXSwgX19wYXJhbV9l
bmRbXTsKPj4+ICAgICAgICAgICAgIC50eXBlID0gT1BUX0lHTk9SRSB9Cj4+PiAgIAo+Pj4gICAj
ZGVmaW5lIF9fcnRwYXJhbSAgICAgICAgIF9fcGFyYW0oX19kYXRhcGFyYW0pCj4+PiArI2RlZmlu
ZSBfX3BhcmFtZnMgICAgICAgICBzdGF0aWMgX19wYXJhbWh5cGZzIFwKPj4+ICsgICAgX19hdHRy
aWJ1dGVfXygoX19hbGlnbmVkX18oc2l6ZW9mKHZvaWQgKikpKSkgc3RydWN0IHBhcmFtX2h5cGZz
Cj4+PiAgIAo+Pj4gLSNkZWZpbmUgY3VzdG9tX3J1bnRpbWVfb25seV9wYXJhbShfbmFtZSwgX3Zh
cikgXAo+Pj4gKyNkZWZpbmUgY3VzdG9tX3J1bnRpbWVfc2V0X3ZhcihwYXJmcywgdmFyKSBcCj4+
PiArICAgIHsgXAo+Pj4gKyAgICAgICAgKHBhcmZzKS0+aHlwZnMud3JpdGVfcHRyID0gJih2YXIp
OyBcCj4+PiArICAgICAgICAocGFyZnMpLT5oeXBmcy5lLnNpemUgPSBzaXplb2YodmFyKTsgXAo+
Pgo+PiBBbGwgdXNlcnMgb2YgdGhpcyB1c2UgY2hhcltdLiBXaHkgc2l6ZW9mKCkgcmF0aGVyIHRo
YW4gc3RybGVuKCksCj4gCj4gVGhhdCBpcyB0aGUgbWF4aW11bSBzdHJpbmcgbGVuZ3RoLiBPdGhl
cndpc2UgSSB3b3VsZG4ndCBrbm93IEkgYW0KPiBhbGxvd2VkIHRvIHJlcGxhY2UgZS5nLiAib24i
IGJ5ICJub3hwdGkiLgoKQXMgc2FpZCBlbHNld2hlcmUgLSBpZiBlLnNpemUgaXMgdGhlIGJ1ZmZl
ciBzaXplLCB0aGVuIHRoZQpyZWFkaW5nIGZ1bmN0aW9uIHdhbnRzIGFkanVzdGluZywgYW5kIGl0
IG5lZWRzIHRvIGJlIGNsYXJpZmllZApob3cgYnVmZmVyIHNpemUgYW5kIHBheWxvYWQgc2l6ZSBj
YW4gYmUgdG9sZCBhcGFydCBmb3IgQkxPQnMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
