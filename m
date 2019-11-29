Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4235C10D744
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 15:46:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahUb-0003x3-IT; Fri, 29 Nov 2019 14:43:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iahUa-0003wy-OL
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 14:43:32 +0000
X-Inumbo-ID: 9d28b0de-12b6-11ea-9db0-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d28b0de-12b6-11ea-9db0-bc764e2007e4;
 Fri, 29 Nov 2019 14:43:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3C567AC37;
 Fri, 29 Nov 2019 14:43:31 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
 <20191129143509.26528-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <84fc3671-3cde-869b-495b-505c90544132@suse.com>
Date: Fri, 29 Nov 2019 15:43:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191129143509.26528-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH XTF] CONSOLEIO_write stack overflow PoC
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxNTozNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBDbGFzc2lmeSBpdCBh
cyBhbiBYU0EgdGVzdCAod2hpY2ggYXJndWFibHkgb3VnaHQgdG8gYmUgbmFtZWQgJ3NlY3VyaXR5
JyksCj4gZGVzcGl0ZSBubyBYU0EgYmVpbmcgaXNzdWVzLgoKTml0OiBpc3N1ZWQKCj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkZXSVcK
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4Kd2l0aCBhIHJlbWFy
ayBhbmQgYSBxdWVzdGlvbjoKCj4gLS0tIGEvZG9jcy9hbGwtdGVzdHMuZG94Cj4gKysrIGIvZG9j
cy9hbGwtdGVzdHMuZG94Cj4gQEAgLTE0Myw2ICsxNDMsOCBAQCBYU0EtMjkzIC0gU2VlIEByZWYg
dGVzdC1wdi1mc2dzYmFzZS4KPiAgQHN1YnBhZ2UgdGVzdC14c2EtMjk4IC0gbWlzc2luZyBkZXNj
cmlwdG9yIHRhYmxlIGxpbWl0IGNoZWNraW5nIGluIHg4NiBQVgo+ICBlbXVsYXRpb24uCj4gIAo+
ICtAc3VicGFnZSB0ZXN0LXhzYS1jb25zb2xlaW8td3JpdGUgLSBDT05TT0xFSU9fd3JpdGUgc3Rh
Y2sgb3ZlcmZsb3cKPiArCj4gIAo+ICBAc2VjdGlvbiBpbmRleC11dGlsaXR5IFV0aWxpdGllcwoK
RG8geW91IHJlYWxseSB3YW50IHR3byBzdWNjZXNzaXZlIGJsYW5rIGxpbmVzIHRoZXJlPwoKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvdGVzdHMveHNhLWNvbnNvbGVpby13cml0ZS9tYWluLmMKPiBA
QCAtMCwwICsxLDY5IEBACj4gKy8qKgo+ICsgKiBAZmlsZSB0ZXN0cy94c2EtY29uc29sZWlvLXdy
aXRlL21haW4uYwo+ICsgKiBAcmVmIHRlc3QteHNhLWNvbnNvbGVpby13cml0ZQo+ICsgKgo+ICsg
KiBUaGlzIGlzc3VlIHdhcyBkaXNjb3ZlcmVkIGJlZm9yZSBpdCBtYWRlIGl0IGludG8gYW55IHJl
bGVhc2VkIHZlcnNpb24gb2YKPiArICogWGVuLiAgVGhlcmVmb3JlLCBubyBYU0Egb3IgQ1ZFIHdh
cyBpc3N1ZWQuCj4gKyAqCj4gKyAqIEEgYnVnZml4IGluIFhlbiA0LjEzIGFsdGVyZWQgQ09OU09M
RUlPX3dyaXRlIHRvIHRvbGVyYXRlIHBhc3NpbmcgTlVMCj4gKyAqIGNoYXJhY3RlcnMgaW50YWN0
LCBhcyB0aGlzIGlzIGEgcmVxdWlyZW1lbnQgZm9yIHZhcmlvdXMgVFRZIHNldHVwcy4KPiArICoK
PiArICogQSBzaWduZWQtbmVzcyBpc3N1ZSB3aXRoIHRoZSBsZW5ndGggY2FsY3VsYXRpb24gbGVh
ZCB0byBhIGNhc2Ugd2hlcmUgWGVuCj4gKyAqIHdpbGwgY29weSBiZXR3ZWVuIDIgYW5kIDRHIG9m
IGd1ZXN0IHByb3ZpZGVkIGRhdGEgaW50byBhIDEyOCBieXRlIG9iamVjdCBvbgo+ICsgKiB0aGUg
c3RhY2suCj4gKyAqCj4gKyAqIEBzZWUgdGVzdHMveHNhLWNvbnNvbGVpby13cml0ZS9tYWluLmMK
PiArICovCj4gKyNpbmNsdWRlIDx4dGYuaD4KPiArCj4gK2NvbnN0IGNoYXIgdGVzdF90aXRsZVtd
ID0gIkNPTlNPTEVJT193cml0ZSBzdGFjayBvdmVyZmxvdyBQb0MiOwo+ICsKPiArdWludDhfdCB6
ZXJvX3BhZ2VbUEFHRV9TSVpFXSBfX3BhZ2VfYWxpZ25lZF9ic3M7Cj4gKwo+ICsvKiBIYXZlIHRo
ZSBhc3NlbWJsZXIgYnVpbGQgYW4gTDEvTDIgcGFpciBtYXBwaW5nIHplcm9fcGFnZVtdIG1hbnkg
dGltZXMuICovCj4gK2FzbSAoIi5zZWN0aW9uIFwiLmRhdGEucGFnZV9hbGlnbmVkXCIsIFwiYXdc
IjsiCj4gKyAgICAgIi5hbGlnbiA0MDk2OyIKPiArCj4gKyAgICAgImwxdDoiCj4gKyAgICAgIi5y
ZXB0IDUxMjsiCj4gKyAgICAgIi5sb25nIHplcm9fcGFnZSArICJTVFIoUEZfU1lNKEFELCBQKSki
LCAwOyIKClRoZXJlIGJlaW5nIG5vIGZ1cnRoZXIgKHJ1bnRpbWUpIGFkanVzdG1lbnQgdG8gdGhp
cyBhbmQgLi4uCgo+ICsgICAgICIuZW5kcjsiCj4gKyAgICAgIi5zaXplIGwxdCwgLiAtIGwxdDsi
Cj4gKyAgICAgIi50eXBlIGwxdCwgQG9iamVjdDsiCj4gKwo+ICsgICAgICJsMnQ6Igo+ICsgICAg
ICIucmVwdCA1MTI7Igo+ICsgICAgICIubG9uZyBsMXQgKyAiU1RSKFBGX1NZTShBRCwgUCkpIiwg
MDsiCgouLi4gdGhpcywgaXMgaXQgc2V0IGluIHN0b25lIHRoYXQgcGh5cyA9PSBsaW4gaW4gWFRG
IHRlc3RzPyBPcgpkaWQgeW91IG1lYW4gdGhpcyB0byBiZSBodm0zMiwgbm90IGh2bTMycGFlPwoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
