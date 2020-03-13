Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77587184684
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 13:08:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCj4Y-0003Po-Ez; Fri, 13 Mar 2020 12:05:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHM7=46=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCj4X-0003Pj-Dt
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 12:05:49 +0000
X-Inumbo-ID: f946b097-6522-11ea-b2d4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f946b097-6522-11ea-b2d4-12813bfff9fa;
 Fri, 13 Mar 2020 12:05:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 08902AEAB;
 Fri, 13 Mar 2020 12:05:46 +0000 (UTC)
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200313080517.28728-1-jgross@suse.com>
 <20200313080517.28728-2-jgross@suse.com>
 <c41f57af-59ca-5418-5198-be9d82ff4cd6@xen.org>
 <11a48a47-4abe-8bd5-a3c6-1a4d28c21efe@suse.com>
 <41c5066a-17ef-31ca-afa6-f7ded8c31574@xen.org>
 <d20369e5-260e-6ff7-0eb0-aef426298509@suse.com>
 <5f7b8cd3-19ee-2e7a-542e-4ca7040c929c@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cd6307b7-5b4f-9547-03e9-bcd6ef65fdcf@suse.com>
Date: Fri, 13 Mar 2020 13:05:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5f7b8cd3-19ee-2e7a-542e-4ca7040c929c@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen/rwlocks: call preempt_disable()
 when taking a rwlock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDMuMjAgMTI6MzksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBKdWVyZ2VuLAo+IAo+
IE9uIDEzLzAzLzIwMjAgMTE6MjMsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDEzLjAzLjIw
IDExOjQwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSBKdWVyZ2VuLAo+Pj4KPj4+IE9uIDEz
LzAzLzIwMjAgMTA6MTUsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+Pj4gT24gMTMuMDMuMjAgMTE6
MDIsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4gSGkgSnVlcmdlbiwKPj4+Pj4KPj4+Pj4gT24g
MTMvMDMvMjAyMCAwODowNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+IFNpbWlsYXIgdG8g
c3BpbmxvY2tzIHByZWVtcHRpb24gc2hvdWxkIGJlIGRpc2FibGVkIHdoaWxlIGhvbGRpbmcgYQo+
Pj4+Pj4gcndsb2NrLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqAgeGVuL2luY2x1ZGUveGVuL3J3
bG9jay5oIHwgMTggKysrKysrKysrKysrKysrKystCj4+Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmggYi94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmgKPj4+
Pj4+IGluZGV4IDFjMjIxZGQwZDkuLjRlZTM0MWExODIgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS94ZW4v
aW5jbHVkZS94ZW4vcndsb2NrLmgKPj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9yd2xvY2su
aAo+Pj4+Pj4gQEAgLTIsNiArMiw3IEBACj4+Pj4+PiDCoCAjZGVmaW5lIF9fUldMT0NLX0hfXwo+
Pj4+Pj4gwqAgI2luY2x1ZGUgPHhlbi9wZXJjcHUuaD4KPj4+Pj4+ICsjaW5jbHVkZSA8eGVuL3By
ZWVtcHQuaD4KPj4+Pj4+IMKgICNpbmNsdWRlIDx4ZW4vc21wLmg+Cj4+Pj4+PiDCoCAjaW5jbHVk
ZSA8eGVuL3NwaW5sb2NrLmg+Cj4+Pj4+PiBAQCAtNTcsMTAgKzU4LDEyIEBAIHN0YXRpYyBpbmxp
bmUgaW50IF9yZWFkX3RyeWxvY2socndsb2NrX3QgKmxvY2spCj4+Pj4+PiDCoMKgwqDCoMKgIGNu
dHMgPSBhdG9taWNfcmVhZCgmbG9jay0+Y250cyk7Cj4+Pj4+PiDCoMKgwqDCoMKgIGlmICggbGlr
ZWx5KF9jYW5fcmVhZF9sb2NrKGNudHMpKSApCj4+Pj4+PiDCoMKgwqDCoMKgIHsKPj4+Pj4KPj4+
Pj4gSWYgeW91IGdldCBwcmVlbXB0ZWQgaGVyZSwgdGhlbiBpdCBtZWFucyB0aGUgY2hlY2sgYmVs
b3cgaXMgbGlrZWx5IAo+Pj4+PiBnb2luZyB0byBmYWlsLiBTbyBJIHRoaW5rIGl0IHdvdWxkIGJl
IGJlc3QgdG8gZGlzYWJsZSBwcmVlbXB0aW9uIAo+Pj4+PiBiZWZvcmUsIHRvIGdpdmUgbW9yZSBj
aGFuY2UgdG8gc3VjY2VlZC4KPj4+Pgo+Pj4+IEFzIHByZWVtcHRpb24gcHJvYmFiaWxpdHkgYXQg
dGhpcyB2ZXJ5IHBvaW50IHNob3VsZCBiZSBtdWNoIGxvd2VyIHRoYW4KPj4+PiB0aGF0IG9mIGhl
bGQgbG9ja3MgSSB0aGluayB0aGF0IGlzIG9wdGltaXppbmcgdGhlIHdyb25nIHBhdGguCj4+Pgo+
Pj4gV2h5IHNvPyBMb2NrIGNvbnRlbnRpb24gc2hvdWxkIGJlIGZhaXJseSBsaW1pdGVkIG9yIHlv
dSBhbHJlYWR5IGhhdmUgCj4+PiBhIHByb2JsZW0gb24geW91ciBzeXN0ZW0uIFNvIHByZWVtcHRp
b24gaXMgbW9yZSBsaWtlbHkuCj4+Cj4+IFRvZGF5IHByb2JhYmlsaXR5IG9mIHByZWVtcHRpb24g
aXMgMC4KPiAKPiBJIGFtIGF3YXJlIG9mIHRoYXQuLi4KPiAKPj4KPj4gRXZlbiB3aXRoIHByZWVt
cHRpb24gYWRkZWQgdGhlIHByb2JhYmlsaXR5IHRvIGJlIHByZWVtcHRlZCBpbiBhIHNlcXVlbmNl
Cj4+IG9mIGFib3V0IGEgZG96ZW4gaW5zdHJ1Y3Rpb25zIGlzIF92ZXJ5XyBsb3cuCj4gCj4gLi4u
IGJ1dCBJIGFtIG5vdCBjb252aW5jZWQgb2YgdGhlIGxvdyBwcm9iYWJpbGl0eSBoZXJlLgo+IAo+
Pgo+Pj4KPj4+PiBJJ20gbm90Cj4+Pj4gb3Bwb3NlZCBkb2luZyB0aGUgbW9kaWZpY2F0aW9uIHlv
dSBhcmUgcmVxdWVzdGluZywgYnV0IHdvdWxkIGxpa2UgdG8KPj4+PiBoZWFyIGEgc2Vjb25kIG9w
aW5pb24gb24gdGhhdCB0b3BpYywgZXNwZWNpYWxseSBhcyBJJ2QgbmVlZCB0byBhZGQKPj4+PiBh
bm90aGVyIHByZWVtcHRfZW5hYmxlKCkgY2FsbCB3aGVuIGZvbGxvd2luZyB5b3VyIGFkdmljZS4K
Pj4+Cj4+PiBJIGRvbid0IHJlYWxseSBzZWUgdGhlIHByb2JsZW0gd2l0aCBhZGRpbmcgYSBuZXcg
cHJlZW1wdGlvbl9lbmFibGUoKSAKPj4+IGNhbGwuIEJ1dCB0aGUgY29kZSBjYW4gYWxzbyBiZSBy
ZXdvcmtlZCB0byBoYXZlIG9ubHkgb25lIGNhbGwuLi4KPj4KPj4gSXRzIHRoZSBkeW5hbWljYWwg
cGF0aCBJJ20gc3BlYWtpbmcgb2YuIEFjY2Vzc2luZyBhIGxvY2FsIGNwdSB2YXJpYWJsZQo+PiBp
cyBub3QgdGhhdCBjaGVhcCwgYW5kIGluIGNhc2Ugd2UgYWRkIHByZWVtcHRpb24gaW4gdGhlIGZ1
dHVyZQo+PiBwcmVlbXB0X2VuYWJsZSgpIHdpbGwgYmVjb21lIGV2ZW4gbW9yZSBleHBlbnNpdmUu
Cj4gCj4gRG8geW91IHJlYWxpemUgdGhhdCB0aGUgbG9jayBpcyBtb3N0IGxpa2VseSBiZSB1bmNv
bnRlbnRlZD8gQW5kIGlmIGl0IAo+IHdlcmUsIHRoZSBjYWxsZXIgd291bGQgbGlrZWx5IG5vdCBz
cGluIGluIGEgdGlnaHQgbG9vcCwgb3RoZXJ3aXNlIGl0IAo+IHdvdWxkIGhhdmUgdXNlZCByZWFk
X2xvY2soKS4KPiAKPiBTbyB1bnRpbCB5b3UgcHJvdmVkIG1lIG90aGVyd2lzZSAod2l0aCBudW1i
ZXJzKSwgdGhpcyBpcyAKPiBtaWNyby1vcHRpbWl6YXRpb24gdGhhdCBpcyBub3QgZ29pbmcgdG8g
YmUgc2VlbiBpbiBhIHdvcmtsb2FkLgoKRmluZSwgaW4gY2FzZSB5b3UgZmVlbGluZyBzbyBzdHJv
bmcgYWJvdXQgdGhhdCwgSSdsbCBjaGFuZ2UgaXQuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
