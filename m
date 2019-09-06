Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0992BABABC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 16:22:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6F5Y-0008QH-UZ; Fri, 06 Sep 2019 14:19:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i6F5X-0008Q7-5m
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 14:19:47 +0000
X-Inumbo-ID: 5f853fdc-d0b1-11e9-abf6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f853fdc-d0b1-11e9-abf6-12813bfff9fa;
 Fri, 06 Sep 2019 14:19:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B5B9CB150;
 Fri,  6 Sep 2019 14:19:41 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ac7a20e8-9e5e-f664-1d7f-d59105f90223@suse.com>
 <20190906093707.wn5zn4nzqxrffwo3@Air-de-Roger>
 <b3ad1cbb-a45b-612c-28b1-e5c203b24676@suse.com>
 <20190906114531.sfkzr53souo36meq@Air-de-Roger>
 <ac4e4862-d12a-ab05-79cd-093dec1bdce5@suse.com>
 <20190906140859.ezkxnjqk2il4jppe@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <af40c189-e154-8788-01fa-174124341ed0@suse.com>
Date: Fri, 6 Sep 2019 16:19:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906140859.ezkxnjqk2il4jppe@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] IOMMU/x86: make page type checks
 consistent when mapping pages
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
Cc: GeorgeDunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDkuMjAxOSAxNjowOCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gRnJpLCBT
ZXAgMDYsIDIwMTkgYXQgMDI6MDg6MDlQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDA2LjA5LjIwMTkgMTM6NDUsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gT24gRnJpLCBT
ZXAgMDYsIDIwMTkgYXQgMTI6NTI6MTFQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
T24gMDYuMDkuMjAxOSAxMTozNywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4+Pj4+IE9uIFdl
ZCwgSnVsIDAzLCAyMDE5IGF0IDEyOjE4OjQ1UE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+
Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4+Pj4+PiArKysgYi94ZW4vYXJjaC94
ODYvbW0vcDJtLmMKPj4+Pj4+IEBAIC04MjksMTMgKzgyOSwxMyBAQCBndWVzdF9waHlzbWFwX2Fk
ZF9wYWdlKHN0cnVjdCBkb21haW4gKmQsCj4+Pj4+PiAgICAgICAgICAgICoKPj4+Pj4+ICAgICAg
ICAgICAgKiBSZXRhaW4gdGhpcyBwcm9wZXJ0eSBieSBncmFiYmluZyBhIHdyaXRhYmxlIHR5cGUg
cmVmIGFuZCB0aGVuCj4+Pj4+PiAgICAgICAgICAgICogZHJvcHBpbmcgaXQgaW1tZWRpYXRlbHku
ICBUaGUgcmVzdWx0IHdpbGwgYmUgcGFnZXMgdGhhdCBoYXZlIGEKPj4+Pj4+IC0gICAgICAgICAq
IHdyaXRhYmxlIHR5cGUgKGFuZCBhbiBJT01NVSBlbnRyeSksIGJ1dCBhIGNvdW50IG9mIDAgKHN1
Y2ggdGhhdAo+Pj4+Pj4gLSAgICAgICAgICogYW55IGd1ZXN0LXJlcXVlc3RlZCB0eXBlIGNoYW5n
ZXMgc3VjY2VlZCBhbmQgcmVtb3ZlIHRoZSBJT01NVQo+Pj4+Pj4gLSAgICAgICAgICogZW50cnkp
Lgo+Pj4+Pj4gKyAgICAgICAgICogd3JpdGFibGUgdHlwZSAoYW5kIGFuIElPTU1VIGVudHJ5IGlm
IG5lY2Vzc2FyeSksIGJ1dCBhIGNvdW50IG9mIDAKPj4+Pj4+ICsgICAgICAgICAqIChzdWNoIHRo
YXQgYW55IGd1ZXN0LXJlcXVlc3RlZCB0eXBlIGNoYW5nZXMgc3VjY2VlZCBhbmQgcmVtb3ZlIHRo
ZQo+Pj4+Pj4gKyAgICAgICAgICogSU9NTVUgZW50cnkpLgo+Pj4+Pj4gICAgICAgICAgICAqLwo+
Pj4+Pj4gICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgKDFVTCA8PCBwYWdlX29yZGVyKTsgKytp
LCArK3BhZ2UgKQo+Pj4+Pj4gICAgICAgICAgIHsKPj4+Pj4+IC0gICAgICAgICAgICBpZiAoICFu
ZWVkX2lvbW11X3B0X3N5bmMoZCkgKQo+Pj4+Pj4gKyAgICAgICAgICAgIGlmICggIWlvbW11X2Vu
YWJsZWQgKQo+Pj4+Pgo+Pj4+PiBUaGF0J3Mga2luZCBvZiBhIHN0cm9uZyBjaGVjayBmb3IgYSBk
b21haW4gdGhhdCBtaWdodCBuZXZlciB1c2UgdGhlCj4+Pj4+IGlvbW11IGF0IGFsbC4gSXNuJ3Qg
aXQgZmluZSB0byBqdXN0IHJlbHkgb24KPj4+Pj4gYXJjaF9pb21tdV9wb3B1bGF0ZV9wYWdlX3Rh
YmxlIGZpbmRpbmcgbm9uLXdyaXRhYmxlIHBhZ2VzIGFuZCB0aHVzIG5vdAo+Pj4+PiBhZGRpbmcg
dGhlbSB0byB0aGUgaW9tbXUgcGFnZS10YWJsZXM/Cj4+Pj4KPj4+PiBObyAtIHRoZSBjb2RlIGNo
YW5nZSBoZXJlIGlzIHRvIHRha2UgY2FyZSBvZiBwYWdlIGFkZGl0aW9ucyB0bwo+Pj4+IHRoZSBk
b21haW4gYWZ0ZXIgaXQgaGFzIGJvb3RlZC4KPj4+Cj4+PiBQbGVhc2UgYmVhciB3aXRoIG1lLCBi
dXQgQUZBSUNUIGFyY2hfaW9tbXVfcG9wdWxhdGVfcGFnZV90YWJsZSBjb3VsZAo+Pj4gYmUgdXNl
ZCBhZnRlciB0aGUgZG9tYWluIGhhcyBib290ZWQgaWYgYSBwY2kgZGV2aWNlIGlzIGhvdCBwbHVn
Z2VkLgo+Pj4KPj4+IElmIHRoaXMgaXMgdG8gZGVhbCB3aXRoIGFkZGl0aW9ucyB0byBkb21haW5z
IGhhdmluZyBhbiBpb21tdSBhbHJlYWR5Cj4+PiBlbmFibGVkLCBpc24ndCBpdCBlbm91Z2ggdG8g
dXNlIG5lZWRfaW9tbXVfcHRfc3luYz8KPj4+Cj4+PiBUaGF0J3MgZ29pbmcgdG8gcmV0dXJuIHRy
dWUgZm9yIGFsbCBQViBkb21haW5zLCBleGNlcHQgZm9yIGRvbTAgbm90Cj4+PiBydW5uaW5nIGlu
IHN0cmljdCBtb2RlLCB3aGljaCBpcyBleHBlY3RlZCBiZWNhdXNlIGluIHRoYXQgY2FzZSBkb20w
Cj4+PiBhbHJlYWR5IGhhcyB0aGUgd2hvbGUgUkFNIG1hcHBlZCBpbnRvIHRoZSBpb21tdSBwYWdl
LXRhYmxlcz8KPj4KPj4gV2VsbCwgbXkgcHJldmlvdXMgcmVwbHkgd2Fzbid0IHByZWNpc2UgZW5v
dWdoLCBJIGd1ZXNzLiBUaGUgY2hhbmdlCj4+IHJlYWxseSBpcyBhYm91dCBib3RoIGNhc2VzOiBJ
ZiB0aGUgZG9tYWluIGlzIGFscmVhZHkgdXNpbmcgYW4gSU9NTVUsCj4+IG5lZWRfaW9tbXVfcHRf
c3luYygpIHdvdWxkIGJlIGVub3VnaCBpbmRlZWQuIElmIElPTU1VIHVzZSBfbWF5XyBiZQo+PiBl
bmFibGVkIGxhdGVyIG9uLCB3ZSBuZWVkIHRvIHRyYW5zaXRpb24gcGFnZXMgb3V0IG9mIHRoZWly
IGluaXRpYWwKPj4gUEdUX25vbmUgc3RhdGUgcmlnaHQgYXdheS4gSWYgd2UgZGVmZXJyZWQgdGhp
cyB1bnRpbCB0aGUgcG9pbnQKPj4gd2hlcmUgdGhlIElPTU1VIGdldHMgZW5hYmxlZCBmb3IgdGhl
IGRvbWFpbiwgd2UnZCBoYXZlIHRvIHdhdGNoIG91dAo+PiBmb3IgUEdUX25vbmUgcGFnZXMgdGhl
cmUsIHdoaWNoIHdvdWxkIGJlIGV4dHJhIGhhc3NsZS4KPiAKPiBJIHN0aWxsIHRoaW5rIGEgcmVs
YXhlZCBQViBkb20wIHNob3VsZCBhdm9pZCB0aGUgb3ZlcmhlYWQgb2YKPiBnZXRfcGFnZV9hbmRf
dHlwZSwgYW5kIHRoZSBpb21tdSBmbHVzaCBkb25lIGFmdGVyd2FyZHMsIGFzIGl0IGFscmVhZHkK
PiBoYXMgYWxsIGhvc3QgUkFNIGludG8gaXQncyBpb21tdSBwYWdlLXRhYmxlcy4KPiAKPiBJZTog
SSB0aGluayB0aGUgY2hlY2sgc2hvdWxkIGJlIHNvbWV0aGluZyBsaWtlOgo+IAo+IGlmICggIWlv
bW11X2VuYWJsZWQgfHwKPiAgICAgIChpc19oYXJkd2FyZV9kb21haW4oZCkgJiYgIW5lZWRfaW9t
bXVfcHRfc3luYyhkKSApCgpBaCwgeWVzLCBJIGNhbiBjZXJ0YWlubHkgZG8gdGhpcyAoaWYgdGhl
IHBhdGNoIGRvZXNuJ3QgYmVjb21lCnVubmVjZXNzYXJ5IGFueXdheSkuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
