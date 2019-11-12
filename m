Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B16B5F96DE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 18:17:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUZl6-0000Gi-OS; Tue, 12 Nov 2019 17:15:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CoZ6=ZE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUZl5-0000Gc-Hl
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 17:15:15 +0000
X-Inumbo-ID: fbdee427-056f-11ea-a21f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbdee427-056f-11ea-a21f-12813bfff9fa;
 Tue, 12 Nov 2019 17:15:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CFFBCB211;
 Tue, 12 Nov 2019 17:15:10 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191101202502.31750-1-andrew.cooper3@citrix.com>
 <20191101202502.31750-2-andrew.cooper3@citrix.com>
 <618aa239-278d-ab34-0f91-3cf7f257a612@suse.com>
 <447d5543-dcca-0126-b987-7b5de86e7c66@citrix.com>
 <77d8c562-2541-3d69-f03b-451dad94751e@suse.com>
 <708290ba-9d5f-1ec7-889a-1e90488a6016@citrix.com>
 <0776abb4-fbf7-d3e7-67ea-c1516fa3894c@suse.com>
 <b5c38b70-b8c9-8435-2dd8-3632a77170c3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <54628e08-fa04-ed20-9255-9de58b219184@suse.com>
Date: Tue, 12 Nov 2019 18:15:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b5c38b70-b8c9-8435-2dd8-3632a77170c3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] x86/boot: Remove cached CPUID data from
 the trampoline
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTEuMjAxOSAxNzowOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNC8xMS8yMDE5
IDE1OjMxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDQuMTEuMjAxOSAxNjoyMiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA0LzExLzIwMTkgMTU6MDMsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDA0LjExLjIwMTkgMTU6NTksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IE9u
IDA0LzExLzIwMTkgMTM6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDEuMTEuMjAx
OSAyMToyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYv
Y3B1L2ludGVsLmMKPj4+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvY3B1L2ludGVsLmMKPj4+Pj4+
PiBAQCAtMjcwLDYgKzI3MCw3IEBAIHN0YXRpYyB2b2lkIGVhcmx5X2luaXRfaW50ZWwoc3RydWN0
IGNwdWluZm9feDg2ICpjKQo+Pj4+Pj4+ICAJaWYgKGRpc2FibGUpIHsKPj4+Pj4+PiAgCQl3cm1z
cmwoTVNSX0lBMzJfTUlTQ19FTkFCTEUsIG1pc2NfZW5hYmxlICYgfmRpc2FibGUpOwo+Pj4+Pj4+
ICAJCWJvb3RzeW0odHJhbXBvbGluZV9taXNjX2VuYWJsZV9vZmYpIHw9IGRpc2FibGU7Cj4+Pj4+
Pj4gKwkJYm9vdHN5bSh0cmFtcG9saW5lX2VmZXIpIHw9IEVGRVJfTlg7Cj4+Pj4+Pj4gIAl9Cj4+
Pj4+PiBJJ20gZmluZSB3aXRoIGFsbCBvdGhlciBjaGFuZ2VzIGhlcmUsIGp1c3QgdGhpcyBvbmUg
Y29uY2VybnMgbWU6Cj4+Pj4+PiBCZWZvcmUgeW91ciBjaGFuZ2Ugd2UgbGF0Y2ggYSB2YWx1ZSBp
bnRvIHRyYW1wb2xpbmVfbWlzY19lbmFibGVfb2ZmCj4+Pj4+PiBqdXN0IHRvIGJlIHVzZWQgZm9y
IHN1YnNlcXVlbnQgSUEzMl9NSVNDX0VOQUJMRSB3cml0ZXMgd2UgZG8uIFRoaXMKPj4+Pj4+IG1l
YW5zIHRoYXQsIG9uIGEgaHlwZXJ2aXNvciAobGlrZSBYZW4gaXRzZWxmKSBzaW1wbHkgZGlzY2Fy
ZGluZwo+Pj4+Pj4gZ3Vlc3Qgd3JpdGVzIHRvIHRoZSBNU1IgKHdoaWNoIGlzICJmaW5lIiB3aXRo
IHRoZSBkZXNjcmliZWQgdXNhZ2UKPj4+Pj4+IG9mIG91cnMgdXAgdG8gbm93KSwgd2l0aCB5b3Vy
IGNoYW5nZSB3ZSdkIG5vdyBlbmQgdXAgdHJ5aW5nIHRvIHNldAo+Pj4+Pj4gRUZFUi5OWCB3aGVu
IHRoZSBmZWF0dXJlIG1heSBub3QgYWN0dWFsbHkgYmUgZW5hYmxlZCBpbgo+Pj4+Pj4gSUEzMl9N
SVNDX0VOQUJMRS4gV291bGRuJ3Qgc3VjaCBhbiBFRkVSIHdyaXRlIGJlIGxpYWJsZSB0byAjR1Ao
MCk/Cj4+Pj4+PiBJLmUuIGRvbid0IHdlIG5lZWQgdG8gcmVhZCBiYWNrIHRoZSBNU1IgdmFsdWUg
aGVyZSwgYW5kIHZlcmlmeQo+Pj4+Pj4gd2UgYWN0dWFsbHkgbWFuYWdlZCB0byBjbGVhciB0aGUg
Yml0IGJlZm9yZSBhY3R1YWxseSBPUi1pbmcgaW4KPj4+Pj4+IEVGRVJfTlg/Cj4+Pj4+IElmIHRo
aXMgaXMgYSBwcm9ibGVtIGluIHByYWN0aWNlLCBleGVjdXRpb24gd29uJ3QgY29udGludWUgYmV5
b25kIHRoZQo+Pj4+PiBuZXh0IGlmKCkgY29uZGl0aW9uIGp1c3Qgb3V0IG9mIGNvbnRleHQsIHdo
aWNoIHNldCBFRkVSLk5YIG9uIHRoZSBCU1AKPj4+Pj4gd2l0aCBhbiB1bmd1YXJkZWQgV1JNU1Iu
Cj4+Pj4gQW5kIGhvdyBpcyB0aGlzIGFueSBnb29kPyBUaGlzIGtpbmQgb2YgY3Jhc2ggaXMgZXhh
Y3RseSB3aGF0IEknbQo+Pj4+IGFza2luZyB0byBhdm9pZC4KPj4+IFdoYXQgaXMgdGhlIHBvaW50
IG9mIHdvcmtpbmcgYXJvdW5kIGEgdGhlb3JldGljYWwgZWRnZSBjYXNlIG9mIGJyb2tlbgo+Pj4g
bmVzdGluZyB1bmRlciBYZW4gd2hpY2ggZGVtb25zdHJhYmx5IGRvZXNuJ3QgZXhpc3QgaW4gcHJh
Y3RpY2U/Cj4+IFdlbGwsIHNvIGZhciBub3RoaW5nIHdhcyBzYWlkIGFib3V0IHRoaXMgbm90IGJl
aW5nIGFuIGFjdHVhbCBwcm9ibGVtLgo+IAo+IEl0cyBub3QgYW4gYWN0dWFsIHByb2JsZW0uwqAg
SWYgaXQgd2VyZSwgd2Ugd291bGQgaGF2ZSBoYWQgY3Jhc2ggcmVwb3J0cy4KPiAKPj4gSSBzaW1w
bHkgZG9uJ3Qga25vdyB3aGV0aGVyIGhhcmR3YXJlIHdvdWxkIHJlZnVzZSBzdWNoIGFuIEVGRVIg
d3JpdGUuCj4gCj4gSSd2ZSBqdXN0IGV4cGVyaW1lbnRlZCAtIHdyaXRpbmcgRUZFUi5OWCB0YWtl
cyBhICNHUCBmYXVsdCB3aGVuCj4gTUlTQ19FTkFCTEUuWEQgaXMgc2V0Lgo+IAo+PiBJZiBpdCBk
b2VzLCBpdCB3b3VsZCBiZSBhcHByb3ByaWF0ZSBmb3IgaHlwZXJ2aXNvcnMgdG8gYWxzbyByZWZ1
c2UKPj4gaXQuIEkuZS4gaWYgd2UgZG9uJ3QgZG8gc28gcmlnaHQgbm93LCBjb3JyZWN0aW5nIHRo
ZSBiZWhhdmlvciB3b3VsZAo+PiB0cmlwIHRoZSBjb2RlIGhlcmUuCj4gCj4gTUlTQ19FTkFCTEVT
LlhEIGlzIGFyY2hpdGVjdHVyYWwgb24gYW55IEludGVsIHN5c3RlbSB3aGljaCBlbnVtZXJhdGVz
Cj4gTlgsIGFuZCBpZiB0aGUgYml0IGlzIHNldCwgaXQgY2FuIGJlIGNsZWFyZWQuwqAgKEFsdGhv
dWdoIHRoZSBzZW1hbnRpY3MKPiBkZXNjcmliZWQgaW4gdGhlIFNETSBhcmUgYnJva2VuLsKgIEl0
IGlzIG9ubHkgYXZhaWxhYmxlIGlmIE5YIGlzCj4gZW51bWVyYXRlZCwgd2hpY2ggaXMgb2JmdXNj
YXRlZCBieSBzZXR0aW5nIFhEKS4KPiAKPiBIb3dldmVyLCBubyBoeXBlcnZpc29yIGlzIGdvaW5n
IHRvIGJvdGhlciB2aXJ0dWFsaXNpbmcgdGhpcwo+IGZ1bmN0aW9uYWxpdHkuwqAgRWl0aGVyIGNv
bmZpZ3VyZSB0aGUgVk0gd2l0aCBOWCBvciB3aXRob3V0LsKgIChLVk0gZm9yCj4gZXhhbXBsZSBk
b2Vzbid0IHZpcnR1YWxpc2UgTUlTQ19FTkFCTEVTIGF0IGFsbC4pCgpJJ20gc29ycnksIGJ1dCBJ
IHN0aWxsIGRvbid0IGZvbGxvdzogWW91IHNheSAiaWYgdGhlIGJpdCBpcyBzZXQsIGl0CmNhbiBi
ZSBjbGVhcmVkIiwgd2hpY2ggaXMgY2xlYXJseSBub3QgaW4gbGluZSB3aXRoIG91ciBjdXJyZW50
IGd1ZXN0Ck1TUiB3cml0ZSBoYW5kbGluZy4gSXQganVzdCBzbyBoYXBwZW5zIHRoYXQgd2UgaGF2
ZSBubyBjb21tYW5kIGxpbmUKb3B0aW9uIGFsbG93aW5nIHRvIHN1cHByZXNzIHRoZSBjbGVhcmlu
ZyBvZiBYRC4gSWYgd2UgaGFkLCBhY2NvcmRpbmcKdG8geW91ciBmaW5kaW5ncyBhYm92ZSB3ZSdk
IHJ1biBpbnRvIGEgI0dQIHVwb24gdHJ5aW5nIHRvIHNldCBOWC4KSG93IGNhbiB5b3UgZWFzaWx5
IGV4Y2x1ZGUgYW5vdGhlciBoeXBlcnZpc29yIGFjdHVhbGx5IGRvaW5nIHNvIChhbmQKbm9ib2R5
IGhhdmluZyBydW4gaW50byB0aGUgaXNzdWUgc2ltcGx5IGJlY2F1c2UgdGhlIG9wdGlvbiBpcyBy
YXJlbHkKdXNlZCk/CgpCdHcgLSBhbGwgd291bGQgYmUgZmluZSBpZiB0aGUgY29kZSBpbiBxdWVz
dGlvbiB3YXMgZ3VhcmRlZCBieSBhbgpOWCBmZWF0dXJlIGNoZWNrLCBidXQgYXMgeW91IHNheSB0
aGF0J3Mgbm90IHBvc3NpYmxlIGJlY2F1c2UgWEQgc2V0CmZvcmNlcyBOWCBjbGVhci4gSG93ZXZl
ciwgb3VyIHNldHRpbmcgb2YgRUZFUi5OWCBjb3VsZCBiZSBndWFyZGVkCnRoaXMgd2F5LCBhcyB3
ZSBfZXhwZWN0XyBYRCB0byBiZSBjbGVhciBhdCB0aGF0IHBvaW50LgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
