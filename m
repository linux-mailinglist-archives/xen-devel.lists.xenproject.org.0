Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A93CB01F5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 18:46:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i85j4-0002Gr-Bq; Wed, 11 Sep 2019 16:44:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VrDL=XG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i85j3-0002Gm-9Q
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 16:44:13 +0000
X-Inumbo-ID: 601821ac-d4b3-11e9-b299-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 601821ac-d4b3-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 16:44:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88FF528;
 Wed, 11 Sep 2019 09:44:08 -0700 (PDT)
Received: from [10.37.12.125] (unknown [10.37.12.125])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7A9A3F67D;
 Wed, 11 Sep 2019 09:44:06 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1566588892-5305-1-git-send-email-olekstysh@gmail.com>
 <d844f8b1-380d-0aed-785c-d889050b62c5@arm.com>
 <e7520ee5-2a31-d129-d736-7ce56589cb3e@gmail.com>
 <cec380f6-daf6-242f-3b57-2b08b3140248@arm.com>
 <ca7a004d-9e3c-575f-bded-7a0fd5c7ef63@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <50b74045-5411-1b2c-d985-6dc6d8f6a249@arm.com>
Date: Wed, 11 Sep 2019 17:44:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ca7a004d-9e3c-575f-bded-7a0fd5c7ef63@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] [RFC V2] xen/arm: Restrict "p2m_ipa_bits"
 according to the IOMMU requirements
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzExLzE5IDU6MzQgUE0sIE9sZWtzYW5kciB3cm90ZToKPiAKPiBPbiAxMC4wOS4x
OSAyMTo1NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPiAKPiBIaSBKdWxpZW4KPiAKPiAK
Pj4KPj4gT24gOS8xMC8xOSA1OjI0IFBNLCBPbGVrc2FuZHIgd3JvdGU6Cj4+Pgo+Pj4gT24gMTAu
MDkuMTkgMTg6MTEsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBIaSBPbGVrc2FuZHIsCj4+Pgo+
Pj4gSGksIEp1bGllbgo+Pj4KPj4+Cj4+Pj4KPj4+PiBPbiA4LzIzLzE5IDg6MzQgUE0sIE9sZWtz
YW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+Pj4+PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8
b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4+Pj4+Cj4+Pj4+IFRoZXJlIGlzIGEgc3Ry
aWN0IHJlcXVpcmVtZW50IGZvciB0aGUgSU9NTVUgd2hpY2ggd2FudHMgdG8gc2hhcmUKPj4+Pj4g
dGhlIFAyTSB0YWJsZSB3aXRoIHRoZSBDUFUuIFRoZSBJT01NVSdzIFN0YWdlLTIgaW5wdXQgc2l6
ZSBtdXN0IGJlIAo+Pj4+PiBlcXVhbAo+Pj4+PiB0byB0aGUgUDJNIElQQSBzaXplLiBJdCBpcyBu
b3QgYSBwcm9ibGVtIHdoZW4gdGhlIElPTU1VIGNhbiBzdXBwb3J0Cj4+Pj4+IGFsbCB2YWx1ZXMg
dGhlIENQVSBzdXBwb3J0cy4gSW4gdGhhdCBjYXNlLCB0aGUgSU9NTVUgZHJpdmVyIHdvdWxkIGp1
c3QKPj4+Pj4gdXNlIGFueSAicDJtX2lwYV9iaXRzIiB2YWx1ZSBhcyBpcy4gQnV0LCB0aGVyZSBh
cmUgY2FzZXMgd2hlbiBub3QuCj4+Pj4+Cj4+Pj4+IEluIG9yZGVyIHRvIG1ha2UgUDJNIHNoYXJp
bmcgcG9zc2libGUgb24gdGhlIHBsYXRmb3JtcyB3aGljaAo+Pj4+PiBJUE1NVXMgaGF2ZSBhIGxp
bWl0YXRpb24gaW4gbWF4aW11bSBTdGFnZS0yIGlucHV0IHNpemUgaW50cm9kdWNlCj4+Pj4+IHRo
ZSBmb2xsb3dpbmcgbG9naWMuCj4+Pj4+Cj4+Pj4+IEZpcnN0IGluaXRpYWxpemUgdGhlIElPTU1V
IHN1YnN5c3RlbSBhbmQgZ2F0aGVyIHJlcXVpcmVtZW50cyByZWdhcmRpbmcKPj4+Pj4gdGhlIG1h
eGltdW0gSVBBIGJpdHMgc3VwcG9ydGVkIGJ5IGVhY2ggSU9NTVUgZGV2aWNlIHRvIGZpZ3VyZSBv
dXQKPj4+Pj4gdGhlIG1pbmltdW0gdmFsdWUgYW1vbmcgdGhlbS4gSW4gdGhlIFAyTSBjb2RlLCB0
YWtlIGludG8gdGhlIGFjY291bnQKPj4+Pj4gdGhlIElPTU1VIHJlcXVpcmVtZW50cyBhbmQgY2hv
b3NlIHN1aXRhYmxlICJwYV9yYW5nZSIgYWNjb3JkaW5nCj4+Pj4+IHRvIHRoZSByZXN0cmljdGVk
ICJwMm1faXBhX2JpdHMiLgo+Pj4+Cj4+Pj4gQXMgSSBwb2ludGVkIGluIHRoZSBwcmV2aW91cyB2
ZXJzaW9uLCBhbGwgdGhlIGNvZGUgeW91IG1vZGlmeSBpcyAKPj4+PiBhcm02NCBzcGVjaWZpYy4g
Rm9yIGFybTMyLCB0aGUgbnVtYmVyIG9mIElQQSBiaXRzIGlzCj4+Pj4gaGFyZGNvZGVkLiBTbyBp
ZiB5b3UgbW9kaWZ5IHAybV9pcGFfYml0cywgeW91IHdvdWxkIGVuZCB1cCB0byAKPj4+PiBtaXNj
b25maWd1cmUgVlRDUi4KPj4+PiBJbiBvdGhlciB3b3JkcywgZm9yIEFybTMyLCB5b3UgbmVlZCB0
byBjaGVjayBwMm1faXBhX2JpdHMgaXMgYXQgCj4+Pj4gbGVhc3QgNDAtYml0cyBiZWZvcmUgb3Zl
cnJpZGluZyBpdC4KPj4+Cj4+PiBCdXQsIGFsbCBtb2RpZmljYXRpb25zIHdpdGggcDJtX2lwYV9i
aXRzIGFyZSBkb25lIGJlZm9yZSAKPj4+IHNldHVwX3ZpcnRfcGFnaW5nKCksIHdoZXJlLCBhY3R1
YWxseSwgdGhlIHAybV9pcGFfYml0cyBpcyBoYXJkLWNvZGVkIAo+Pj4gdG8gNDAgYml0cy4gSG93
IGNhbiB3ZSBlbmQgdXAgbWlzY29uZmlndXJpbmcgVlRDUiBmb3IgQVJNMzI/IE9yIEkgCj4+PiBy
ZWFsbHkgbWlzc2VkIHNvbWV0aGluZz8KPj4KPj4gU29ycnkgaWYgSSB3YXNuJ3QgY2xlYXJlZCwg
SSBtZWFudCB0aGUgVlRDUiBmb3IgdGhlIElPTU1VLiBZb3Ugd291bGQgCj4+IGVuZCB1cCB0byBj
b25maWd1cmUgd2l0aCBhIHZhbHVlIHRoYXQgaXMgYmlnZ2VyIHRoYW4gd2hhdCBpdCBjYW4gc3Vw
cG9ydC4KPj4gSSBhbSBvayBpZiB5b3UgZG9uJ3QgcmVzdHJpY3QgdGhlIHAybV9pcGFfYml0cyBh
bmQganVzdCBmYWlsLiBUaGUgCj4+IHBvaW50IGlzIHRvIG5vdGlmeSB0aGUgdXNlciBBU0FQIHJh
dGhlciB0aGFuIGFsbG93aW5nIHRvIGNvbnRpbnVlLgo+Pgo+PiBUaGlzIHdvdWxkIG1ha2UgdGhl
IGJlaGF2aW9yIHNpbWlsYXIgdG8gdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gCj4+IChhbHRo
b3VnaCB0aGUgZXJyb3Igd291bGQgYmUgZGlmZmVyZW50KS4KPiAKPiBTbywgaW4gSU9NTVUgZHJp
dmVyIHdlIHNob3VsZCBjaGVjayBpZiBJT01NVSBpcyBhYmxlIHRvIHN1cHBvcnQgYXQgbGVhc3Qg
Cj4gNDAtYml0IElQQSBiZWZvcmUgdHJ5aW5nIHRvIHJlc3RyaWN0LiBJZiB5ZXMsIHRoZW4gZ28g
YWhlYWQsIGJ1dCBpZiBubywgCj4gdGhlbiBqdXN0IGZhaWwuIENvcnJlY3Q/CgpUaGVyZSBhcmUg
bm8gbmVlZCB0byBkbyB0aGlzIGluIHRoZSBJT01VIGRyaXZlcnMuIEFuZCBJIGFjdHVhbGx5IGRv
bid0IApzdWNoIGNoZWNrIGluIHRoZSBkcml2ZXJzLgoKVGhpcyBpcyB0aGUgc2ltaWxhciBwcm9i
bGVtIHRvIGhhbGYgaW5pdGlhbGl6ZWQgSU9NTVUuIElmIHRoZSB1c2VyIApyZXF1ZXN0cyBJT01N
VSBhbmQgZG9lc24ndCB3b3JrLCB0aGVuIHdlIGRvbid0IHdhbnQgdG8gY29udGludWUgYW4gCnBh
bmljLiBTdWNoIGNoZWNrIGNhbiBiZSBkb25lIGRpcmVjdGx5IGluIHRoZSBmdW5jdGlvbiBzZXR1
cF92aXJ0X3BhZ2luZygpLgoKPiAKPiAKPj4+Pj4gK3sKPj4+Pj4gK8KgwqDCoCAvKgo+Pj4+PiAr
wqDCoMKgwqAgKiBDYWxjdWxhdGUgdGhlIG1pbmltdW0gb2YgdGhlIG1heGltdW0gSVBBIGJpdHMg
dGhhdCBhbnkgSU9NTVUKPj4+Pj4gK8KgwqDCoMKgICogY2FuIHN1cHBvcnQuCj4+Pj4+ICvCoMKg
wqDCoCAqLwo+Pj4+PiArwqDCoMKgIGlmICggaW9tbXVfaXBhX2JpdHMgPCBwMm1faXBhX2JpdHMg
KQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcDJtX2lwYV9iaXRzID0gaW9tbXVfaXBhX2JpdHM7Cj4+
Pj4+ICt9Cj4+Pj4+ICsKPj4+Pj4gwqAgLyogVlRDUiB2YWx1ZSB0byBiZSBjb25maWd1cmVkIGJ5
IGFsbCBDUFVzLiBTZXQgb25seSBvbmNlIGJ5IHRoZSAKPj4+Pj4gYm9vdCBDUFUgKi8KPj4+Pj4g
wqAgc3RhdGljIHVpbnQzMl90IF9fcmVhZF9tb3N0bHkgdnRjcjsKPj4+Pj4gwqAgQEAgLTE5NjYs
MTAgKzE5NzcsMjggQEAgdm9pZCBfX2luaXQgc2V0dXBfdmlydF9wYWdpbmcodm9pZCkKPj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIFs3XSA9IHsgMCB9wqAgLyogSW52YWxpZCAqLwo+Pj4+PiDCoMKg
wqDCoMKgIH07Cj4+Pj4+IMKgIC3CoMKgwqAgdW5zaWduZWQgaW50IGNwdTsKPj4+Pj4gK8KgwqDC
oCB1bnNpZ25lZCBpbnQgaSwgY3B1Owo+Pj4+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBwYV9y
YW5nZSA9IDB4MTA7IC8qIExhcmdlciB0aGFuIGFueSBwb3NzaWJsZSAKPj4+Pj4gdmFsdWUgKi8K
Pj4+Pj4gwqDCoMKgwqDCoCBib29sIHZtaWRfOF9iaXQgPSBmYWxzZTsKPj4+Pj4gwqAgK8KgwqDC
oCBpZiAoIGlvbW11X2VuYWJsZWQgKQo+Pj4+Cj4+Pj4gQ291bGQgd2UgbWFrZSB0aGlzIElPTU1V
LWFnbm9zdGljPyBUaGUgbWFpbiByZWFzb24gdG8gY29udmVydCBmcm9tIAo+Pj4+IHAybV9pcGFf
Yml0cyB0byBwYV9yYW5nZSBpcyB0byBjYXRlciB0aGUgcmVzdCBvZiB0aGUgY29kZS4KPj4+Pgo+
Pj4+IEJ1dCB3ZSBjb3VsZCByZXdvcmsgdGhlIGNvZGUgdG8gZG8gdGhlIGNvbXB1dGF0aW9uIHdp
dGggcDJtX2lwYV9iaXRzIAo+Pj4+IGFuZCB0aGVuIGxvb2stdXAgZm9yIHRoZSBwYV9yYW5nZS4g
Cj4+Pgo+Pj4gSSBhbSBhZnJhaWQsIEkgZG9uJ3QgY29tcGxldGVseSB1bmRlcnN0YW5kIHlvdXIg
aWRlYSBvZiBtYWtpbmcgdGhpcyAKPj4+IElPTU1VLWFnbm9zdGljIGFuZCB3aGF0IEkgc2hvdWxk
IGRvLi4uCj4+Cj4+IFJvdWdobHkgd2hhdCB5b3UgYXJlIGRvaW5nIHRvZGF5IGlzOgo+Pgo+PiBp
ZiAoIGlvbW11X2VuYWJsZWQgKQo+PiDCoMKgIHBhX3JhbmdlID0gZmluZF9wYV9yYW5nZV9mcm9t
X3AybV9iaXRzKCkuCj4+Cj4+IGZvcl9lYWNoX2NwdSgpCj4+IMKgwqAgaWYgKCBjcHUucGFfcmFu
Z2UgPCBwYV9yYW5nZSApCj4+IMKgwqDCoMKgIHBhX3JhbmdlID0gY3B1LnBhX3JhbmdlCj4+Cj4+
IC4uLi4KPj4KPj4gV2hhdCB5b3UgY291bGQgZG8gaXM6Cj4gCj4gVGhhbmsgeW91IGZvciB0aGUg
Y2xhcmlmaWNhdGlvbi4gSSB0aGluayBJIHVuZGVyc3RhbmQgeW91ciBpZGVhLgo+IAo+IEJ1dCAu
Li4KPiAKPj4KPj4gZm9yX2VjaF9jcHUoKQo+PiDCoMKgIGlmICggcDJtX2lwYV9iaXRzIDwgcGFf
cmFuZ2VfaW5mb1tjcHUucGFfcmFuZ2VdLnBhYml0cyApCj4gCj4gUHJvYmFibHkgeW91IG1lYW50
ICI+IiBoZXJlPwoKWWVzLgoKCj4gCj4gCj4+IHAybV9pcGFfYml0cyA9IHBhX3JhbmdlX2luZm9b
Y3B1LnBhX3JhbmdlXS5wYWJpdHM7Cj4+Cj4+IHBhX3JhbmdlID0gZmluZF9wYV9yYW5nZV9mcm9t
X3AybV9iaXRzKCk7Cj4+IC8qIENoZWNrIHZhbGlkaXR5ICovCj4gCj4gCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
