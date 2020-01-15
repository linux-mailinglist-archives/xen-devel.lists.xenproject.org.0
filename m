Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A2E13C15D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 13:44:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irhzT-0008Km-NI; Wed, 15 Jan 2020 12:41:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irhzR-0008Kd-Uo
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 12:41:41 +0000
X-Inumbo-ID: 5c2c0d62-3794-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c2c0d62-3794-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 12:41:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8E223ADD9;
 Wed, 15 Jan 2020 12:41:32 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <20200115094703.GH11756@Air-de-Roger>
 <f9b7c06e-54df-bfb2-44d5-b3ef38f2a725@suse.com>
 <af5e509b-e24e-2fcc-c131-bb63e9e40790@citrix.com>
 <f9b39389-c1d4-c8e5-defd-b30d95d1159b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4c80b4c5-82cc-9a94-f0aa-02c379be0426@suse.com>
Date: Wed, 15 Jan 2020 13:41:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <f9b39389-c1d4-c8e5-defd-b30d95d1159b@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, wl@xen.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDEuMjAyMCAxMzozMSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMTUvMDEvMjAy
MCAxMjoyNSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDE1LzAxLzIwMjAgMTE6NDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMTUuMDEuMjAyMCAxMDo0NywgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPj4+PiBPbiBUdWUsIEphbiAxNCwgMjAyMCBhdCAwNzozNjoyMVBNICswMDAwLCBJ
Z29yIERydXpoaW5pbiB3cm90ZToKPj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3RpbWUuYwo+Pj4+
PiArKysgYi94ZW4vYXJjaC94ODYvdGltZS5jCj4+Pj4+IEBAIC05NTUsMTAgKzk1NSwxNiBAQCB1
NjQgc3RpbWUydHNjKHNfdGltZV90IHN0aW1lKQo+Pj4+PiAgCj4+Pj4+ICB2b2lkIGNzdGF0ZV9y
ZXN0b3JlX3RzYyh2b2lkKQo+Pj4+PiAgewo+Pj4+PiArICAgIHN0cnVjdCBjcHVfdGltZSAqdCA9
ICZ0aGlzX2NwdShjcHVfdGltZSk7Cj4+Pj4+ICsKPj4+Pj4gICAgICBpZiAoIGJvb3RfY3B1X2hh
cyhYODZfRkVBVFVSRV9OT05TVE9QX1RTQykgKQo+Pj4+PiAgICAgICAgICByZXR1cm47Cj4+Pj4+
ICAKPj4+Pj4gLSAgICB3cml0ZV90c2Moc3RpbWUydHNjKHJlYWRfcGxhdGZvcm1fc3RpbWUoTlVM
TCkpKTsKPj4+Pj4gKyAgICB0LT5zdGFtcC5tYXN0ZXJfc3RpbWUgPSByZWFkX3BsYXRmb3JtX3N0
aW1lKE5VTEwpOwo+Pj4+PiArICAgIHQtPnN0YW1wLmxvY2FsX3RzYyA9IHN0aW1lMnRzYyh0LT5z
dGFtcC5tYXN0ZXJfc3RpbWUpOwo+Pj4+PiArICAgIHQtPnN0YW1wLmxvY2FsX3N0aW1lID0gdC0+
c3RhbXAubWFzdGVyX3N0aW1lOwo+Pj4+PiArCj4+Pj4+ICsgICAgd3JpdGVfdHNjKHQtPnN0YW1w
LmxvY2FsX3RzYyk7Cj4+Pj4KPj4+PiBJbiBvcmRlciB0byBhdm9pZCB0aGUgVFNDIHdyaXRlIChh
bmQgdGhlIGxpa2VseSBhc3NvY2lhdGVkIHZtZXhpdCksCj4+Pj4gY291bGQgeW91IGluc3RlYWQg
ZG86Cj4+Pj4KPj4+PiB0LT5zdGFtcC5sb2NhbF9zdGltZSA9IHQtPnN0YW1wLm1hc3Rlcl9zdGlt
ZSA9IHJlYWRfcGxhdGZvcm1fc3RpbWUoTlVMTCk7Cj4+Pj4gdC0+c3RhbXAubG9jYWxfdHNjID0g
cmR0c2Nfb3JkZXJlZCgpOwo+Pj4+Cj4+Pj4gSSB0aGluayBpdCBzaG91bGQgYWNoaWV2ZSB0aGUg
c2FtZSBhcyBpdCBzeW5jcyB0aGUgbG9jYWwgVFNDIHN0YW1wIGFuZAo+Pj4+IHRpbWVzLCB3b3Vs
ZCBhdm9pZCB0aGUgVFNDIHdyaXRlIGFuZCBzbGlnaHRseSBzaW1wbGlmaWVzIHRoZSBsb2dpYy4K
Pj4+Cj4+PiBXb3VsZG4ndCB0aGlzIHJlc3VsdCBpbiBndWVzdHMgcG9zc2libHkgb2JzZXJ2aW5n
IHRoZSBUU0MgbW92aW5nCj4+PiBiYWNrd2FyZHM/Cj4+Cj4+IFllcywgSSB0aGluayBzby4gV291
bGQgcmVzdG9yaW5nIGZyb20gVFNDIHN0YW1wIGlmIGl0J3MgaGlnaGVyIHRoYW4KPj4gcGxhdGZv
cm0gdGltZSBiZXR0ZXIgeW91IHRoaW5rPwo+Pgo+IAo+IElnbm9yZSBteSByZXBseS4gSSB3YXMg
dGhpbmtpbmcgeW91J3JlIGFza2luZyB3aGV0aGVyIHRoZSBvcmlnaW5hbCBjb2RlCj4gd291bGQg
ZG8gc3VjaCBhIHRoaW5nLiBBbHRob3VnaCBJJ20gY29uY2VybmVkIGlmIHdoYXQgeW91IHNheSBh
Y3R1YWxseQo+IGFwcGxpZXMgdG8gdGhlIG9yaWdpbmFsIGNvZGUgYXMgd2VsbC4gV291bGQgeW91
IHRoaW5rIHRoZSBleGlzdGluZyBsb2dpYwo+IGhhbmRsZXMgaXQgYWxyZWFkeT8KCkkgdGhpbmsg
dGhlIG9yaWdpbmFsIGNvZGUgd29uJ3QgZ3VhcmFudGVlIHRvIGJhY2t3YXJkcyBtb3ZlIGF0CmFs
bCwgYnV0IGl0IGFsc28gd291bGRuJ3QgcHJvZHVjZSBsYXJnZSBiYWNrd2FyZHMganVtcHMuIEl0
J3MKbGFyZ2Ugb25lcyBJIHdhcyBtYWlubHkgdGhpbmtpbmcgb2Ygd2hlbiByZXBseWluZyB0byBS
b2dlci4KQnV0IGxldCBtZSBhbHNvIHJlcGx5IGJhY2sgdG8gaGltLi4uCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
