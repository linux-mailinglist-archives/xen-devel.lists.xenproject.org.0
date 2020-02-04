Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 512A9151837
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 10:52:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyupu-0002sc-MT; Tue, 04 Feb 2020 09:49:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fS9R=3Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyupt-0002sX-Ao
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 09:49:37 +0000
X-Inumbo-ID: a735a436-4733-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a735a436-4733-11ea-8396-bc764e2007e4;
 Tue, 04 Feb 2020 09:49:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 960AAAD76;
 Tue,  4 Feb 2020 09:49:35 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200203121919.15748-1-roger.pau@citrix.com>
 <20200203121919.15748-2-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7658FC@SHSMSX104.ccr.corp.intel.com>
 <20200204092305.GE4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0f6fb83a-d7df-2dc7-9061-00d5814737fc@suse.com>
Date: Tue, 4 Feb 2020 10:49:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200204092305.GE4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/vvmx: fix virtual interrupt
 injection when Ack on exit control is used
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, Wei Liu <wl@xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDIuMjAyMCAxMDoyMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEZl
YiAwNCwgMjAyMCBhdCAwMTozNTowNUFNICswMDAwLCBUaWFuLCBLZXZpbiB3cm90ZToKPj4+IEZy
b206IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+PiBTZW50OiBNb25k
YXksIEZlYnJ1YXJ5IDMsIDIwMjAgODoxOSBQTQo+Pj4KPj4+IFdoZW4gZG9pbmcgYSB2aXJ0dWFs
IHZtZXhpdCAoaWU6IGEgdm1leGl0IGhhbmRsZWQgYnkgdGhlIEwxIFZNTSkKPj4+IGludGVycnVw
dHMgc2hvdWxkbid0IGJlIGluamVjdGVkIHVzaW5nIHRoZSB2aXJ0dWFsIGludGVycnVwdCBkZWxp
dmVyeQo+Pj4gbWVjaGFuaXNtIHVubGVzcyB0aGUgQWNrIG9uIGV4aXQgdm1leGl0IGNvbnRyb2wg
Yml0IGlzbid0IHNldCBpbiB0aGUKPj4+IG5lc3RlZCB2bWNzLgo+Pj4KPj4+IEdhdGUgdGhlIGNh
bGwgdG8gbnZteF91cGRhdGVfYXBpY3YgaGVscGVyIG9uIHdoZXRoZXIgdGhlIG5lc3RlZCB2bWNz
Cj4+PiBoYXMgdGhlIEFjayBvbiBleGl0IGJpdCBzZXQgaW4gdGhlIHZtZXhpdCBjb250cm9sIGZp
ZWxkLgo+Pj4KPj4+IE5vdGUgdGhhdCB0aGlzIGZpeGVzIHRoZSB1c2FnZSBvZiB4MkFQSUMgYnkg
dGhlIEwxIFZNTSwgYXQgbGVhc3Qgd2hlbgo+Pj4gdGhlIEwxIFZNTSBpcyBYZW4uCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+
Cj4+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4sIHdpdGgg
YSBzbWFsbCBjb21tZW50Ogo+Pgo+Pj4gLS0tCj4+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+Pj4gIC0g
Q2FsbCBudm14X3VwZGF0ZV9hcGljdiBpZiB0aGUgIkFjayBvbiBleGl0IiB2bWV4aXQgY29udHJv
bCBiaXQKPj4+ICAgIGlzbid0IHNldC4KPj4+IC0tLQo+Pj4gIHhlbi9hcmNoL3g4Ni9odm0vdm14
L3Z2bXguYyB8IDcgKysrKysrLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgv
dnZteC5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCj4+PiBpbmRleCBkOGFiMTY3ZDYy
Li4zZDk3YTI5M2IyIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5j
Cj4+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMKPj4+IEBAIC0xMzkzLDcgKzEz
OTMsMTIgQEAgc3RhdGljIHZvaWQgdmlydHVhbF92bWV4aXQoc3RydWN0IGNwdV91c2VyX3JlZ3MK
Pj4+ICpyZWdzKQo+Pj4gICAgICAvKiB1cGRhdGluZyBob3N0IGNyMCB0byBzeW5jIFRTIGJpdCAq
Lwo+Pj4gICAgICBfX3Ztd3JpdGUoSE9TVF9DUjAsIHYtPmFyY2guaHZtLnZteC5ob3N0X2NyMCk7
Cj4+Pgo+Pj4gLSAgICBpZiAoIGNwdV9oYXNfdm14X3ZpcnR1YWxfaW50cl9kZWxpdmVyeSApCj4+
PiArICAgIGlmICggY3B1X2hhc192bXhfdmlydHVhbF9pbnRyX2RlbGl2ZXJ5ICYmCj4+PiArICAg
ICAgICAgLyoKPj4+ICsgICAgICAgICAgKiBPbmx5IGluamVjdCB0aGUgdmVjdG9yIGlmIHRoZSBB
Y2sgb24gZXhpdCBiaXQgaXMgbm90IHNldCwgZWxzZSB0aGUKPj4+ICsgICAgICAgICAgKiBpbnRl
cnJ1cHQgd2lsbCBiZSBzaWduYWxlZCBpbiB0aGUgdm1jcyBWTV9FWElUX0lOVFJfSU5GTyBmaWVs
ZC4KPj4+ICsgICAgICAgICAgKi8KPj4+ICsgICAgICAgICAhKGdldF92dm1jcyh2LCBWTV9FWElU
X0NPTlRST0xTKSAmIFZNX0VYSVRfQUNLX0lOVFJfT05fRVhJVCkgKQo+Pgo+PiBJdCdzIGEgYml0
IG9kZCB0byBwdXQgY29tbWVudCBiZXR3ZWVuIGNvZGUgbGluZXMuIENhbiB5b3UgbW92ZSBpdCB0
bwo+PiB0aGUgbGluZSBiZWZvcmUgJ2lmJz8KPiAKPiBJIHVzdWFsbHkgdHJ5IHRvIGtlZXAgdGhl
IGNvbW1lbnRzIGFzIGNsb3NlIHRvIHRoZSBjb2RlIGl0IHJlZmVyZW5jZXMKPiBhcyBwb3NzaWJs
ZSwgZXZlbiBpZiB0aGF0IG1lYW5zIGFkZGluZyB0aGVtIGluIHRoZSBtaWRkbGUgb2YgYW4gaWYK
PiBjb25kaXRpb24uCj4gCj4gSSBkb24ndCBtaW5kIG1vdmluZyBpdCwgYnV0IG1heWJlIHRoZSBj
b21taXR0ZXIgY2FuIGRvIGl0IGF0IGNvbW1pdAo+IHRpbWU/CgpUaGlzIHNob3VsZCBiZSBlYXN5
IGVub3VnaCwgYnV0IC0gS2V2aW4sIEkgYWdyZWUgd2l0aCBSb2dlciB0aGF0CnRoZSBjaG9zZSBw
bGFjZW1lbnQgaXMgYmV0dGVyIHRoYW4gd2hhdCB5b3Ugc3VnZ2VzdC4gWW91J3JlIHRoZQptYWlu
dGFpbmVyIG9mIHRoZSBmaWxlLCBzbyBpZiB5b3UgcmVhbGx5IHRoaW5rIHRoZSBjb21tZW50IHNo
b3VsZApiZSBtb3ZlZCAtIHNvIGJlIGl0LiBCdXQgcGxlYXNlIHJlLWNvbmZpcm0gb25lIG9yIHRo
ZSBvdGhlciB3YXkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
