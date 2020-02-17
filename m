Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FC41617D5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 17:22:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3j6S-00033D-IE; Mon, 17 Feb 2020 16:18:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j3j6Q-000338-MH
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 16:18:34 +0000
X-Inumbo-ID: 247aeb32-51a1-11ea-800b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 247aeb32-51a1-11ea-800b-12813bfff9fa;
 Mon, 17 Feb 2020 16:18:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A40BEBD41;
 Mon, 17 Feb 2020 16:18:32 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200214185539.7444-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6e98529f-1212-0b5a-ad11-21187353e6ab@suse.com>
Date: Mon, 17 Feb 2020 17:18:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200214185539.7444-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: Common the #732/#733 errata
 handling in iommu_read_log()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDIuMjAyMCAxOTo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGVyZSBpcyBubyBu
ZWVkIHRvIGhhdmUgYm90aCBoZWxwZXJzIGltcGxlbWVudCB0aGUgc2FtZSB3b3JrYXJvdW5kLiAg
VGhlIHNpemUKPiBhbmQgbGF5b3V0IG9mIHRoZSB0aGUgRXZlbnQgYW5kIFBQUiBsb2dzIChhbmQg
b3RoZXJzIGZvciB0aGF0IG1hdHRlcikgc2hhcmUgYQo+IGxvdCBvZiBjb21tb25hbGl0eS4KPiAK
PiBVc2UgTUFTS19FWFRSKCkgdG8gbG9jYXRlIHRoZSBjb2RlIGZpZWxkLCBhbmQgdXNlIEFDQ0VT
U19PTkNFKCkgcmF0aGVyIHRoYW4KPiBiYXJyaWVyKCkgdG8gcHJldmVudCBob2lzdGluZyBvZiB0
aGUgcmVwZWF0ZWQgcmVhZC4KPiAKPiBBdm9pZCB1bm5lY2Vzc2FyeSB6ZXJvaW5nIGJ5IG9ubHkg
Y2xvYmJlcmluZyB0aGUgJ2NvZGUnIGZpZWxkIC0gdGhpcyBhbG9uZSBpcwo+IHN1ZmZpY2llbnQg
dG8gc3BvdCB0aGUgZXJyYXRhIHdoZW4gdGhlIHJpbmdzIHdyYXAuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CndpdGggb25lIHJlbWFyayAvIGFkanVz
dG1lbnQgcmVxdWVzdDoKCj4gQEAgLTMxOSwxMSArMzE5LDM2IEBAIHN0YXRpYyBpbnQgaW9tbXVf
cmVhZF9sb2coc3RydWN0IGFtZF9pb21tdSAqaW9tbXUsCj4gIAo+ICAgICAgd2hpbGUgKCB0YWls
ICE9IGxvZy0+aGVhZCApCj4gICAgICB7Cj4gLSAgICAgICAgLyogcmVhZCBldmVudCBsb2cgZW50
cnkgKi8KPiAtICAgICAgICBlbnRyeSA9IGxvZy0+YnVmZmVyICsgbG9nLT5oZWFkOwo+ICsgICAg
ICAgIHVpbnQzMl90ICplbnRyeSA9IGxvZy0+YnVmZmVyICsgbG9nLT5oZWFkOwo+ICsgICAgICAg
IHVuc2lnbmVkIGludCBjb3VudCA9IDA7Cj4gKwo+ICsgICAgICAgIC8qIEV2ZW50IGFuZCBQUFIg
bG9ncyBoYXZlIHRoZWlyIGNvZGUgZmllbGQgaW4gdGhlIHNhbWUgcG9zaXRpb24uICovCj4gKyAg
ICAgICAgdW5zaWduZWQgaW50IGNvZGUgPSBNQVNLX0VYVFIoZW50cnlbMV0sIElPTU1VX0VWRU5U
X0NPREVfTUFTSyk7Cj4gKwo+ICsgICAgICAgIC8qCj4gKyAgICAgICAgICogV29ya2Fyb3VuZCBm
b3IgZXJyYXRhICM3MzIsICM3MzM6Cj4gKyAgICAgICAgICoKPiArICAgICAgICAgKiBJdCBjYW4g
aGFwcGVuIHRoYXQgdGhlIHRhaWwgcG9pbnRlciBpcyB1cGRhdGVkIGJlZm9yZSB0aGUgYWN0dWFs
Cj4gKyAgICAgICAgICogZW50cnkgZ290IHdyaXR0ZW4uIEFzIHN1Z2dlc3RlZCBieSBSZXZHdWlk
ZSwgd2UgaW5pdGlhbGl6ZSB0aGUKPiArICAgICAgICAgKiBidWZmZXIgdG8gYWxsIHplcm9zIGFu
ZCBjbGVhciBlbnRyaWVzIGFmdGVyIHByb2Nlc3NpbmcgdGhlbS4KCkkgZG9uJ3QgdGhpbmsgImNs
ZWFyIGVudHJpZXMiIGlzIGFwcGxpY2FibGUgYW55bW9yZSB3aXRoIC4uLgoKPiArICAgICAgICAg
Ki8KPiArICAgICAgICB3aGlsZSAoIHVubGlrZWx5KGNvZGUgPT0gMCkgKQo+ICsgICAgICAgIHsK
PiArICAgICAgICAgICAgaWYgKCB1bmxpa2VseSgrK2NvdW50ID09IElPTU1VX0xPR19FTlRSWV9U
SU1FT1VUKSApCj4gKyAgICAgICAgICAgIHsKPiArICAgICAgICAgICAgICAgIEFNRF9JT01NVV9E
RUJVRygiQU1ELVZpOiBObyBlbnRyeSB3cml0dGVuIHRvICVzIExvZ1xuIiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsb2cgPT0gJmlvbW11LT5ldmVudF9sb2cgPyAiRXZlbnQi
IDogIlBQUiIpOwo+ICsgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICAgICAgIH0K
PiArICAgICAgICAgICAgdWRlbGF5KDEpOwo+ICsgICAgICAgICAgICBjb2RlID0gTUFTS19FWFRS
KEFDQ0VTU19PTkNFKGVudHJ5WzFdKSwgSU9NTVVfRVZFTlRfQ09ERV9NQVNLKTsKPiArICAgICAg
ICB9Cj4gIAo+ICAgICAgICAgIHBhcnNlX2Z1bmMoaW9tbXUsIGVudHJ5KTsKPiAgCj4gKyAgICAg
ICAgLyogQ2xlYXIgJ2NvZGUnIHRvIGJlIGFibGUgdG8gc3BvdCB0aGUgZXJyYXR1bSB3aGVuIHRo
ZSByaW5nIHdyYXBzLiAqLwo+ICsgICAgICAgIEFDQ0VTU19PTkNFKGVudHJ5WzFdKSA9IDA7Cgou
Li4gdGhpcy4gUGVyaGFwcyBhdCBsZWFzdCBhZGQgInN1ZmZpY2llbnRseSI/CgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
