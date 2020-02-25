Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538BE16C0B6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 13:25:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6ZDw-0001qv-ES; Tue, 25 Feb 2020 12:22:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6ZDv-0001qq-AV
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 12:22:03 +0000
X-Inumbo-ID: 6bdd2ce6-57c9-11ea-92e8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bdd2ce6-57c9-11ea-92e8-12813bfff9fa;
 Tue, 25 Feb 2020 12:22:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 344BCB147;
 Tue, 25 Feb 2020 12:21:59 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1582133128-25638-1-git-send-email-igor.druzhinin@citrix.com>
 <1d138bf8-0cec-b66d-c852-fd7d6392e69d@suse.com>
 <5f27be3d-263b-42b6-7489-8fbc1079c38b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7f0c343c-96f1-b11c-324d-c301d08d40d5@suse.com>
Date: Tue, 25 Feb 2020 13:22:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5f27be3d-263b-42b6-7489-8fbc1079c38b@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/cpu: Sync any remaining RCU
 callbacks after CPU up/down
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAyMDoyNiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMjEvMDIvMjAy
MCAxNjoyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE5LjAyLjIwMjAgMTg6MjUsIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3N5c2N0bC5jCj4+PiArKysg
Yi94ZW4vYXJjaC94ODYvc3lzY3RsLmMKPj4+IEBAIC03OCw4ICs3OCwxMSBAQCBzdGF0aWMgdm9p
ZCBsM19jYWNoZV9nZXQodm9pZCAqYXJnKQo+Pj4gIGxvbmcgY3B1X3VwX2hlbHBlcih2b2lkICpk
YXRhKQo+Pj4gIHsKPj4+ICAgICAgdW5zaWduZWQgaW50IGNwdSA9ICh1bnNpZ25lZCBsb25nKWRh
dGE7Cj4+PiAtICAgIGludCByZXQgPSBjcHVfdXAoY3B1KTsKPj4+ICsgICAgaW50IHJldDsKPj4+
ICAKPj4+ICsgICAgLyogRmx1c2ggcG90ZW50aWFsbHkgc2NoZWR1bGVkIFJDVSB3b3JrIGZyb20g
cHJlY2VkaW5nIENQVSBvZmZsaW5lICovCj4+PiArICAgIHJjdV9iYXJyaWVyKCk7Cj4+PiArICAg
IHJldCA9IGNwdV91cChjcHUpOwo+Pj4gICAgICBpZiAoIHJldCA9PSAtRUJVU1kgKQo+Pj4gICAg
ICB7Cj4+PiAgICAgICAgICAvKiBPbiBFQlVTWSwgZmx1c2ggUkNVIHdvcmsgYW5kIGhhdmUgb25l
IG1vcmUgZ28uICovCj4+PiBAQCAtMTA0LDcgKzEwNywxMSBAQCBsb25nIGNwdV91cF9oZWxwZXIo
dm9pZCAqZGF0YSkKPj4+ICBsb25nIGNwdV9kb3duX2hlbHBlcih2b2lkICpkYXRhKQo+Pj4gIHsK
Pj4+ICAgICAgaW50IGNwdSA9ICh1bnNpZ25lZCBsb25nKWRhdGE7Cj4+PiAtICAgIGludCByZXQg
PSBjcHVfZG93bihjcHUpOwo+Pj4gKyAgICBpbnQgcmV0Owo+Pj4gKwo+Pj4gKyAgICAvKiBGbHVz
aCBwb3RlbnRpYWxseSBzY2hlZHVsZWQgUkNVIHdvcmsgZnJvbSBwcmVjZWRpbmcgQ1BVIG9ubGlu
ZSAqLwo+Pj4gKyAgICByY3VfYmFycmllcigpOwo+Pj4gKyAgICByZXQgPSBjcHVfZG93bihjcHUp
Owo+Pj4gICAgICBpZiAoIHJldCA9PSAtRUJVU1kgKQo+Pj4gICAgICB7Cj4+PiAgICAgICAgICAv
KiBPbiBFQlVTWSwgZmx1c2ggUkNVIHdvcmsgYW5kIGhhdmUgb25lIG1vcmUgZ28uICovCj4+Pgo+
Pgo+PiBUaGVyZSBhcmUgbW9yZSBjYWxscyB0byBjcHVfdXAoKSAvIGNwdV9kb3duKCksIG1vc3Qg
bm90YWJseSBpbgo+PiBjb3JlX3BhcmtpbmcuYy4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIG1h
a2UgdGhlIGJhcnJpZXIgcGFydAo+PiBvZiB0aGUgdHdvIGZ1bmN0aW9ucz8gVGhpcyB3b3VsZCB0
aGUgYWxzbyBjb3ZlciBub24teDg2IGluCj4+IGNhc2UgYW4gYXJjaCB3YW50cyB0byBzdXBwb3J0
IG9mZmxpbmluZy9vbmxpbmluZyBvZiBDUFVzLgo+IAo+IFRob3NlIGZ1bmN0aW9ucyBhcmUgY2Fs
bGVkIGZyb20gZWFybHkgaW5pdCBjb2RlIGFuZCByY3VfYmFycmllcigpIGlzCj4gYW4gZXhwZW5z
aXZlIG9wZXJhdGlvbi4gSSB0aGluayBpdCdzIGJldHRlciBpZiBjYWxsZXIgaXMgcmVzcG9uc2li
bGUKPiBmb3Igc3luY2luZyB0aGUgc3RhdGUuIFRoaXMgaXMgdGhlIHJlYXNvbiBJIG1vdmVkIHJj
dV9iYXJyaWVyKCkgaW4gZnJvbnQKPiBvZiBjcHVfdXAvZG93bi4KCldlbGwsIHRoZXJlIGFyZSB0
d28gYXNwZWN0cyBoZXJlOiBPbmUgaXMgdG8gYXZvaWQgdGhlIG92ZXJoZWFkIHdoZXJlCml0J3Mg
bm90IG5lZWRlZC4gVGhlIG90aGVyIGlzLCBhcyBvYnNlcnZlZCBvbiB0aGlzIHBhdGNoLCB0aGF0
IGJ5CnRoZSBjaG9zZW4gYXBwcm9hY2ggY2FsbGVycyB3aGljaCBpbiBmYWN0IG5lZWQgYW1lbmRp
bmcgbWF5IGJlCmZvcmdvdHRlbi4gVG8gZmluZCBtaWRkbGUgZ3JvdW5kcywgcGVyaGFwcyB0aGUg
c29sdXRpb24gaXMgdG8gaGF2ZQp2YXJpYW50cyBvZiBjcHVfe3VwLGRvd259KCkgd2hpY2ggaW52
b2tlIHRoZSBiYXJyaWVyLCBhbmQgd2hpY2gKd291bGQgYmUgdXNlZCBieSBhbGwgcnVudGltZSBp
bnZvY2F0aW9ucz8KClRoZSBvdGhlciBxdWVzdGlvbiBvZiBjb3Vyc2UgaXMgd2h5IGVhcmx5IGlu
aXQgY29kZSBpcyBzcGVjaWFsIGluCnRoaXMgcmVnYXJkLiBJZiBpdCBpbmRlZWQgd2FzLCBwZXJo
YXBzIHRoZSBiYXJyaWVyIGludm9jYXRpb24gY291bGQKYWxzbyBiZSB0aWVkIHRvIGNlcnRhaW4g
U1lTX1NUQVRFXyogdmFsdWVzPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
