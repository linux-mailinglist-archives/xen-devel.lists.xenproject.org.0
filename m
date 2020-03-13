Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BC21844B3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 11:18:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jChLu-0008Cn-G2; Fri, 13 Mar 2020 10:15:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHM7=46=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jChLs-0008Ci-CW
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 10:15:36 +0000
X-Inumbo-ID: 941b7864-6513-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 941b7864-6513-11ea-a6c1-bc764e2007e4;
 Fri, 13 Mar 2020 10:15:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A2156AE44;
 Fri, 13 Mar 2020 10:15:34 +0000 (UTC)
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200313080517.28728-1-jgross@suse.com>
 <20200313080517.28728-2-jgross@suse.com>
 <c41f57af-59ca-5418-5198-be9d82ff4cd6@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <11a48a47-4abe-8bd5-a3c6-1a4d28c21efe@suse.com>
Date: Fri, 13 Mar 2020 11:15:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c41f57af-59ca-5418-5198-be9d82ff4cd6@xen.org>
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

T24gMTMuMDMuMjAgMTE6MDIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBKdWVyZ2VuLAo+IAo+
IE9uIDEzLzAzLzIwMjAgMDg6MDUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFNpbWlsYXIgdG8g
c3BpbmxvY2tzIHByZWVtcHRpb24gc2hvdWxkIGJlIGRpc2FibGVkIHdoaWxlIGhvbGRpbmcgYQo+
PiByd2xvY2suCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KPj4gLS0tCj4+IMKgIHhlbi9pbmNsdWRlL3hlbi9yd2xvY2suaCB8IDE4ICsrKysrKysr
KysrKysrKysrLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3J3bG9jay5oIGIveGVu
L2luY2x1ZGUveGVuL3J3bG9jay5oCj4+IGluZGV4IDFjMjIxZGQwZDkuLjRlZTM0MWExODIgMTAw
NjQ0Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9yd2xvY2suaAo+PiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vcndsb2NrLmgKPj4gQEAgLTIsNiArMiw3IEBACj4+IMKgICNkZWZpbmUgX19SV0xPQ0tf
SF9fCj4+IMKgICNpbmNsdWRlIDx4ZW4vcGVyY3B1Lmg+Cj4+ICsjaW5jbHVkZSA8eGVuL3ByZWVt
cHQuaD4KPj4gwqAgI2luY2x1ZGUgPHhlbi9zbXAuaD4KPj4gwqAgI2luY2x1ZGUgPHhlbi9zcGlu
bG9jay5oPgo+PiBAQCAtNTcsMTAgKzU4LDEyIEBAIHN0YXRpYyBpbmxpbmUgaW50IF9yZWFkX3Ry
eWxvY2socndsb2NrX3QgKmxvY2spCj4+IMKgwqDCoMKgwqAgY250cyA9IGF0b21pY19yZWFkKCZs
b2NrLT5jbnRzKTsKPj4gwqDCoMKgwqDCoCBpZiAoIGxpa2VseShfY2FuX3JlYWRfbG9jayhjbnRz
KSkgKQo+PiDCoMKgwqDCoMKgIHsKPiAKPiBJZiB5b3UgZ2V0IHByZWVtcHRlZCBoZXJlLCB0aGVu
IGl0IG1lYW5zIHRoZSBjaGVjayBiZWxvdyBpcyBsaWtlbHkgZ29pbmcgCj4gdG8gZmFpbC4gU28g
SSB0aGluayBpdCB3b3VsZCBiZSBiZXN0IHRvIGRpc2FibGUgcHJlZW1wdGlvbiBiZWZvcmUsIHRv
IAo+IGdpdmUgbW9yZSBjaGFuY2UgdG8gc3VjY2VlZC4KCkFzIHByZWVtcHRpb24gcHJvYmFiaWxp
dHkgYXQgdGhpcyB2ZXJ5IHBvaW50IHNob3VsZCBiZSBtdWNoIGxvd2VyIHRoYW4KdGhhdCBvZiBo
ZWxkIGxvY2tzIEkgdGhpbmsgdGhhdCBpcyBvcHRpbWl6aW5nIHRoZSB3cm9uZyBwYXRoLiBJJ20g
bm90Cm9wcG9zZWQgZG9pbmcgdGhlIG1vZGlmaWNhdGlvbiB5b3UgYXJlIHJlcXVlc3RpbmcsIGJ1
dCB3b3VsZCBsaWtlIHRvCmhlYXIgYSBzZWNvbmQgb3BpbmlvbiBvbiB0aGF0IHRvcGljLCBlc3Bl
Y2lhbGx5IGFzIEknZCBuZWVkIHRvIGFkZAphbm90aGVyIHByZWVtcHRfZW5hYmxlKCkgY2FsbCB3
aGVuIGZvbGxvd2luZyB5b3VyIGFkdmljZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
