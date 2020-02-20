Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0A2165DE0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 13:51:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lGD-0007C5-Iy; Thu, 20 Feb 2020 12:48:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4lGB-0007C0-P6
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 12:48:55 +0000
X-Inumbo-ID: 59d6de54-53df-11ea-851b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59d6de54-53df-11ea-851b-12813bfff9fa;
 Thu, 20 Feb 2020 12:48:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6A7D0ACE3;
 Thu, 20 Feb 2020 12:48:53 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200220120231.86907-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ecf1c47c-4cbb-c7c4-7ccf-d3620a1992b3@suse.com>
Date: Thu, 20 Feb 2020 13:48:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220120231.86907-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] rwlock: allow recursive read locking when
 already locked in write mode
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAyMCAxMzowMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEkndmUgZG9uZSBz
b21lIHRlc3RpbmcgYW5kIGF0IGxlYXN0IHRoZSBDUFUgZG93biBjYXNlIGlzIGZpeGVkIG5vdy4K
PiBQb3N0aW5nIGVhcmx5IGluIG9yZGVyIHRvIGdldCBmZWVkYmFjayBvbiB0aGUgYXBwcm9hY2gg
dGFrZW4uCgpMb29rcyBnb29kLCB0aGFua3MsIGp1c3QgYSBxdWVzdGlvbiBhbmQgdHdvIGNvbW1l
bnRzOgoKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmgKPiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vcndsb2NrLmgKPiBAQCAtMjAsMjEgKzIwLDMwIEBAIHR5cGVkZWYgc3RydWN0IHsKPiAg
I2RlZmluZSBERUZJTkVfUldMT0NLKGwpIHJ3bG9ja190IGwgPSBSV19MT0NLX1VOTE9DS0VECj4g
ICNkZWZpbmUgcndsb2NrX2luaXQobCkgKCoobCkgPSAocndsb2NrX3QpUldfTE9DS19VTkxPQ0tF
RCkKPiAgCj4gLS8qCj4gLSAqIFdyaXRlciBzdGF0ZXMgJiByZWFkZXIgc2hpZnQgYW5kIGJpYXMu
Cj4gLSAqCj4gLSAqIFdyaXRlciBmaWVsZCBpcyA4IGJpdCB0byBhbGxvdyBmb3IgcG90ZW50aWFs
IG9wdGltaXNhdGlvbiwgc2VlCj4gLSAqIF93cml0ZV91bmxvY2soKS4KPiAtICovCj4gLSNkZWZp
bmUgICAgX1FXX1dBSVRJTkcgIDEgICAgICAgICAgICAgICAvKiBBIHdyaXRlciBpcyB3YWl0aW5n
ICAgICAqLwo+IC0jZGVmaW5lICAgIF9RV19MT0NLRUQgICAweGZmICAgICAgICAgICAgLyogQSB3
cml0ZXIgaG9sZHMgdGhlIGxvY2sgKi8KPiAtI2RlZmluZSAgICBfUVdfV01BU0sgICAgMHhmZiAg
ICAgICAgICAgIC8qIFdyaXRlciBtYXNrLiovCj4gLSNkZWZpbmUgICAgX1FSX1NISUZUICAgIDgg
ICAgICAgICAgICAgICAvKiBSZWFkZXIgY291bnQgc2hpZnQgICAgICAqLwo+ICsvKiBXcml0ZXIg
c3RhdGVzICYgcmVhZGVyIHNoaWZ0IGFuZCBiaWFzLiAqLwo+ICsjZGVmaW5lICAgIF9RV19XQUlU
SU5HICAxICAgICAgICAgICAgICAgICAgICAgICAvKiBBIHdyaXRlciBpcyB3YWl0aW5nICovCj4g
KyNkZWZpbmUgICAgX1FXX0xPQ0tFRCAgIDMgICAgICAgICAgICAgICAgICAgICAgIC8qIEEgd3Jp
dGVyIGhvbGRzIHRoZSBsb2NrICovCgpBaXVpIHRoaW5ncyB3b3VsZCB3b3JrIGVxdWFsbHkgd2Vs
bCBpZiAyIHdhcyB1c2VkIGhlcmU/Cgo+ICsjZGVmaW5lICAgIF9RV19XTUFTSyAgICAzICAgICAg
ICAgICAgICAgICAgICAgICAvKiBXcml0ZXIgbWFzayAqLwo+ICsjZGVmaW5lICAgIF9RV19DUFVT
SElGVCAyICAgICAgICAgICAgICAgICAgICAgICAvKiBXcml0ZXIgQ1BVIHNoaWZ0ICovCj4gKyNk
ZWZpbmUgICAgX1FXX0NQVU1BU0sgIDB4M2ZmYyAgICAgICAgICAgICAgICAgIC8qIFdyaXRlciBD
UFUgbWFzayAqLwoKQXQgbGVhc3Qgb24geDg2LCB0aGUgc2hpZnQgaW52b2x2ZWQgaGVyZSBpcyBx
dWl0ZSBjZXJ0YWlubHkKbW9yZSBleHBlbnNpdmUgdGhhbiB1c2luZyB3aWRlciBpbW1lZGlhdGVz
IG9uIEFORCBhbmQgQ01QCnJlc3VsdGluZyBmcm9tIHRoZSBfUVdfTUFTSy1iYXNlZCBjb21wYXJp
c29ucy4gSSdkIHRoZXJlZm9yZQpsaWtlIHRvIHN1Z2dlc3QgdG8gcHV0IHRoZSBDUFUgaW4gdGhl
IGxvdyAxMiBiaXRzLgoKQW5vdGhlciBvcHRpb24gaXMgdG8gdXNlIHRoZSByZWN1cnNlX2NwdSBm
aWVsZCBvZiB0aGUKYXNzb2NpYXRlZCBzcGluIGxvY2s6IFRoZSBmaWVsZCBpcyB1c2VkIGZvciBy
ZWN1cnNpdmUgbG9ja3MKb25seSwgYW5kIGhlbmNlIHRoZSBvbmx5IGNvbmZsaWN0IHdvdWxkIGJl
IHdpdGgKX3NwaW5faXNfbG9ja2VkKCksIHdoaWNoIHdlIGRvbid0IChhbmQgaW4gdGhlIGZ1dHVy
ZSB0aGVuCmFsc28gc2hvdWxkbid0KSB1c2Ugb24gdGhpcyBsb2NrLgoKPiBAQCAtMTY2LDcgKzE4
MCw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfd3JpdGVfdW5sb2NrKHJ3bG9ja190ICpsb2NrKQo+
ICAgICAgICogSWYgdGhlIHdyaXRlciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVk
IGRpcmVjdGx5Lgo+ICAgICAgICogT3RoZXJ3aXNlLCBhbiBhdG9taWMgc3VidHJhY3Rpb24gd2ls
bCBiZSB1c2VkIHRvIGNsZWFyIGl0Lgo+ICAgICAgICovCj4gLSAgICBhdG9taWNfc3ViKF9RV19M
T0NLRUQsICZsb2NrLT5jbnRzKTsKPiArICAgIEFTU0VSVChfaXNfd3JpdGVfbG9ja2VkX2J5X21l
KGF0b21pY19yZWFkKCZsb2NrLT5jbnRzKSkpOwo+ICsgICAgYXRvbWljX3N1Yihfd3JpdGVfbG9j
a192YWwoKSwgJmxvY2stPmNudHMpOwoKSSB0aGluayB0aGlzIHdvdWxkIGJlIG1vcmUgZWZmaWNp
ZW50IHdpdGggYXRvbWljX2FuZCgpLCBub3QKdGhlIGxlYXN0IGJlY2F1c2Ugb2YgdGhlIHRoZW4g
YXZvaWRlZCBzbXBfcHJvY2Vzc29yX2lkKCkuCldoZXRoZXIgdG8gbWFzayBvZmYganVzdCBfUVdf
V01BU0sgb3IgYWxzbyB0aGUgQ1BVIG51bWJlciBvZgp0aGUgbGFzdCB3cml0ZSBvd25lciB3b3Vs
ZCBuZWVkIHRvIGJlIGRldGVybWluZWQuIEJ1dCB3aXRoCnVzaW5nIHN1YnRyYWN0aW9uLCBpbiBj
YXNlIG9mIHByb2JsZW1zIGl0J2xsIGxpa2VseSBiZQpoYXJkZXIgdG8gdW5kZXJzdGFuZCB3aGF0
IGFjdHVhbGx5IHdlbnQgb24sIGZyb20gbG9va2luZyBhdAp0aGUgcmVzdWx0aW5nIHN0YXRlIG9m
IHRoZSBsb2NrICh0aGlzIGlzIGluIHBhcnQgYSBwcmUtCmV4aXN0aW5nIHByb2JsZW0sIGJ1dCBn
ZXRzIHdvcnNlIHdpdGggc3VidHJhY3Rpb24gb2YgQ1BVCm51bWJlcnMpLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
