Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10999134189
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 13:22:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipAIV-00019Z-1R; Wed, 08 Jan 2020 12:18:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipAIT-00019U-8m
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 12:18:49 +0000
X-Inumbo-ID: 05d296b2-3211-11ea-b7d2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05d296b2-3211-11ea-b7d2-12813bfff9fa;
 Wed, 08 Jan 2020 12:18:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A749EB0A5;
 Wed,  8 Jan 2020 12:18:47 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200108110148.18988-1-jgross@suse.com>
 <20200108121606.yr25b27mrnawu6um@debian>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <61ec5633-05b7-fab3-ceac-e6c7649893e3@suse.com>
Date: Wed, 8 Jan 2020 13:18:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200108121606.yr25b27mrnawu6um@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: clear per cpu stub page
 information in cpu_smpboot_free()
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAgMTM6MTYsIFdlaSBMaXUgd3JvdGU6Cj4gT24gV2VkLCBKYW4gMDgsIDIwMjAg
YXQgMTI6MDE6NDhQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gY3B1X3NtcGJvb3Rf
ZnJlZSgpIHJlbW92ZXMgdGhlIHN0dWJzIGZvciB0aGUgY3B1IGdvaW5nIG9mZmxpbmUsIGJ1dCBp
dAo+PiBpc24ndCBjbGVhcmluZyB0aGUgcmVsYXRlZCBwZXJjcHUgdmFyaWFibGVzLiBUaGlzIHdp
bGwgcmVzdWx0IGluCj4+IGNyYXNoZXMgd2hlbiBhIHN0dWIgcGFnZSBpcyByZWxlYXNlZCBkdWUg
dG8gYWxsIHJlbGF0ZWQgY3B1cyBnb25lCj4+IG9mZmxpbmUgYW5kIG9uZSBvZiB0aG9zZSBjcHVz
IGdvaW5nIG9ubGluZSBsYXRlci4KPj4KPj4gRml4IHRoYXQgYnkgY2xlYXJpbmcgc3R1YnMuYWRk
ciBhbmQgc3R1YnMubWZuIGluIG9yZGVyIHRvIGFsbG9jYXRlIGEKPj4gbmV3IHN0dWIgcGFnZSB3
aGVuIG5lZWRlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgo+PiAtLS0KPj4gICB4ZW4vYXJjaC94ODYvc21wYm9vdC5jIHwgMiArKwo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9zbXBib290LmMgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCj4+IGluZGV4IDdlMjk3MDQw
ODAuLjQ2YzA3MjkyMTQgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPj4g
KysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+PiBAQCAtOTQ1LDYgKzk0NSw4IEBAIHN0YXRp
YyB2b2lkIGNwdV9zbXBib290X2ZyZWUodW5zaWduZWQgaW50IGNwdSwgYm9vbCByZW1vdmUpCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAocGVyX2NwdShzdHVicy5hZGRyLCBjcHUp
IHwgflBBR0VfTUFTSykgKyAxKTsKPj4gICAgICAgICAgIGlmICggaSA9PSBTVFVCU19QRVJfUEFH
RSApCj4+ICAgICAgICAgICAgICAgZnJlZV9kb21oZWFwX3BhZ2UobWZuX3RvX3BhZ2UobWZuKSk7
Cj4+ICsgICAgICAgIHBlcl9jcHUoc3R1YnMuYWRkciwgY3B1KSA9IDA7Cj4+ICsgICAgICAgIHBl
cl9jcHUoc3R1YnMubWZuLCBjcHUpID0gMDsKPiAKPiBTaG91bGRuJ3QgdGhlIG1mbiBiZSBzZXQg
dG8gSU5WQUxJRF9NRk4gaW5zdGVhZD8KClRoaXMgd291bGQgcmVxdWlyZSBtb2RpZnlpbmcgYWxs
b2Nfc3R1Yl9wYWdlKCk6CgogICAgIGlmICggKm1mbiApCiAgICAgICAgIHBnID0gbWZuX3RvX3Bh
Z2UoX21mbigqbWZuKSk7CiAgICAgZWxzZQoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
