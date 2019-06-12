Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B2541FEC
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 10:54:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hayx7-0000XA-BQ; Wed, 12 Jun 2019 08:49:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v58P=UL=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hayx6-0000X5-8e
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 08:49:52 +0000
X-Inumbo-ID: 087c2f1f-8cef-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 087c2f1f-8cef-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 08:49:50 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 12 Jun
 2019 16:46:37 +0800
To: Jan Beulich <JBeulich@suse.com>
References: <5942544893366d8ff51fdf603fd13f18@sslemail.net>
 <5CFFB4A30200007800237133@prv1-mh.provo.novell.com>
 <492c0277-7413-d306-b350-58167a526486@mxnavi.com>
 <5D009CE602000078002374B3@prv1-mh.provo.novell.com>
 <4deea016-0fa9-0bf1-f570-9c0dd6679761@mxnavi.com>
 <5D00B0AF020000780023757D@prv1-mh.provo.novell.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <37b0f22b-26e7-6c82-bbec-22d0db707eee@mxnavi.com>
Date: Wed, 12 Jun 2019 16:49:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5D00B0AF020000780023757D@prv1-mh.provo.novell.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen/coverage: wrap coverage related things
 under 'CONFIG_COVERAGE'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvMTIvMTkgMTU6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDEyLjA2LjE5IGF0
IDA5OjM2LCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6Cj4+IE9uIDYvMTIvMTkgMTQ6
MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTIuMDYuMTkgYXQgMDI6MjMsIDxjaGVu
YmFvZG9uZ0BteG5hdmkuY29tPiB3cm90ZToKPj4+PiBPbiA2LzExLzE5IDIyOjAzLCBKYW4gQmV1
bGljaCB3cm90ZToKPj4+Pj4+Pj4gT24gMTEuMDYuMTkgYXQgMDg6MDIsIDxjaGVuYmFvZG9uZ0Bt
eG5hdmkuY29tPiB3cm90ZToKPj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPj4+
Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPj4+Pj4+IEBAIC0yNDAsMTIgKzI0MCwx
NCBAQCBTRUNUSU9OUwo+Pj4+Pj4gICAgICAgICAgICAgKiguYWx0aW5zdHJ1Y3Rpb25zKQo+Pj4+
Pj4gICAgICAgICAgICAgX19hbHRfaW5zdHJ1Y3Rpb25zX2VuZCA9IC47Cj4+Pj4+PiAgICAgCj4+
Pj4+PiArI2lmIGRlZmluZWQoQ09ORklHX0NPVkVSQUdFKQo+Pj4+Pj4gICAgICAgICAgICAuID0g
QUxJR04oOCk7Cj4+Pj4+PiAgICAgICAgICAgIF9fY3RvcnNfc3RhcnQgPSAuOwo+Pj4+Pj4gICAg
ICAgICAgICAqKC5jdG9ycykKPj4+Pj4+ICAgICAgICAgICAgKiguaW5pdF9hcnJheSkKPj4+Pj4+
ICAgICAgICAgICAgKihTT1JUKC5pbml0X2FycmF5LiopKQo+Pj4+Pj4gICAgICAgICAgICBfX2N0
b3JzX2VuZCA9IC47Cj4+Pj4+PiArI2VuZGlmCj4+Pj4+IEhvdyBpcyB0aGlzIChvbmx5KSBjb3Zl
cmFnZSByZWxhdGVkPyBBbmQgaG93IGlzIG1ha2luZyB0aGlzIGNvbmRpdGlvbmFsCj4+Pj4+IGdv
aW5nIHRvIGhlbHAgaW4gYW55IHdheT8KPj4+PiBIZWxsbyBKYW4sCj4+Pj4KPj4+PiBXaGVuIGkg
cmVhZCB0aGUgY29kZSAnaW5pdF9jb25zdHJ1Y3RvcnMoKScsIGkgd2FudCB0byB1bmRlcnN0YW5k
IHdoZW4KPj4+PiBpdCdzIHVzZWQuCj4+Pj4KPj4+PiBJIGNhbiBub3QgZmluZCBhbnkgaGVscGVy
IG1hY3JvcyBsaWtlICdfX2luaXQnIGluIGluaXQuaCwgcHV0IHRoaW5ncyBpbgo+Pj4+IHRoaXMg
c2VjdGlvbi4KPj4+Pgo+Pj4+IEFsc28gcnVuIHVuZGVyIGFybSBmb3VuZGF0aW9uIHBsYXRmb3Jt
LCB0aGUgc2VjdGlvbiBpcyBlbXB0eS4KPj4+Pgo+Pj4+IFNvIGkgY2hlY2sgY29tbWl0IGhpc3Rv
cnkgYW5kIGZvdW5kIGl0J3MgY29tbWl0IGxvZ3M6IGl0IGlzIGNvdmVyYWdlCj4+Pj4gcmVsYXRl
ZC4KPj4+Pgo+Pj4+IEFuZCBjb21waWxlZCB3aXRoIENPTkZJR19DT1ZFUkFHRSBlbmFibGVkLCB0
aGlzIHNlY3Rpb24gaXMgbm90IGVtcHR5Cj4+Pj4gYW55bW9yZS4KPj4+Pgo+Pj4+IFNvIHRoZSBw
YXRjaCBtYWlubHkgd2FudCB0byBjbGFyaWZ5IHRoZSBjb2RlIGlzIGNvdmVyYWdlIHJlbGF0ZWQs
Cj4+Pj4KPj4+PiB3aGljaCB3YW50IHRvIGhlbHAgbmV3Y29tZXIgZWFzaWx5IHVuZGVyc3RhbmQg
dGhpcyBjb2RlLgo+Pj4+Cj4+Pj4gQW0gaSBtaXN1bmRlcnN0YW5kaW5nIGhlcmU/Cj4+PiBUaGUg
Y29kZSBtYXkgaGF2ZSBiZWVuIF9pbnRyb2R1Y2VkXyBmb3IgY292ZXJhZ2UsIGJ1dCBhcmUgeW91
Cj4+PiB3aWxsaW5nIHRvIGd1YXJhbnRlZSBpdCdzIGNvdmVyYWdlLW9ubHk/IFBsdXMgLSB3aGF0
IGRvZXMgcmVtb3ZpbmcKPj4+IGFuIGVtcHR5IHNlY3Rpb24gYnV5IHlvdT8KPj4gQ3VycmVudGx5
IHNlZW1zIHRydWUsIGJ1dCBub3Qgc3VyZSBhYm91dCB0aGUgZnV0dXJlLCBjYW4gbm90IGd1YXJh
bnRlZS4KPj4KPj4gUGVyc29uYWxseSBndWVzcyB0aGlzIHNob3VsZCBub3QgYmUgdXNlZCBieSB4
ZW4sIGJ1dCB1c2UgX19pbml0X2NhbGwoZm4pCj4+IGxpa2UgaW4gaW5pdC5oLgo+Pgo+PiBNeSBw
dXJwb3NlIGlzIHRvIGNsYXJpZnkgdGhlIGNvZGUgaXMgY292ZXJhZ2UgcmVsYXRlZChhdCBsZWFz
dCBjdXJyZW50bHkKPj4gaXMpLgo+Pgo+PiBJZiB5b3UgYXJlIHVuaGFwcHkgd2l0aCBpdCB0aGlz
IHdheSwgaG93IGFib3V0IGp1c3QgYWRkIGEgY29tbWVudCwKPj4gc29tZXRoaW5nIGxpa2U6Cj4+
Cj4+ICsvKiBjdXJyZW50bHkgb25seSB1c2VkIGJ5IGNvZGUgY292ZXJhZ2UgKi8KPj4gICAgIHZv
aWQgX19pbml0IGluaXRfY29uc3RydWN0b3JzKHZvaWQpCj4gSSdkIHByZWZlciBpZiB0aGUgZW50
aXJlIHBhdGNoIHdhcyBkcm9wcGVkLCB1bmxlc3MgdGhlcmUgcmVhbGx5IHdhcwo+IGEgY2xlYXIg
KGFuZCBjbGVhcmx5IHNwZWxsZWQgb3V0KSBnYWluLiBBZGRpbmcgYSBjb21tZW50IGxpa2UgeW91
Cj4gc3VnZ2VzdCBvbmx5IGNhbGxzIGZvciBpdCBnb2luZyBzdGFsZSBhdCBzb21lIHBvaW50LgoK
Q29weSB0aGF0LgoKVGhhbmtzIGZvciBhbGwgeW91ciBjb21tZW50cy4KCj4KPiBKYW4KPgo+Cj4g
Lgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
