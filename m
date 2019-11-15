Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9099FD975
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 10:39:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVY2K-0005CI-DG; Fri, 15 Nov 2019 09:37:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVY2I-0005CD-Hy
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 09:37:02 +0000
X-Inumbo-ID: 79b00444-078b-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79b00444-078b-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 09:37:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96B59AC48;
 Fri, 15 Nov 2019 09:37:00 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <f70aa2a5-66f8-6915-c4a4-b1f701fe143c@suse.com>
 <8e004584-e45c-3989-2c7c-fd867122c7b3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e254f63a-a35d-7f2a-5b4d-90d518f20fce@suse.com>
Date: Fri, 15 Nov 2019 10:37:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8e004584-e45c-3989-2c7c-fd867122c7b3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/cpuidle: correct Cannon Lake residency
 MSRs
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMTEuMjAxOSAyMDoyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNC8xMS8yMDE5
IDE1OjIyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQXMgcGVyIFNETSByZXYgMDcxIENhbm5vbiBM
YWtlIGhhcwo+PiAtIG5vIENDMyByZXNpZGVuY3kgTVNSIGF0IDNGQywKPj4gLSBhIENDMSByZXNp
ZGVuY3kgTVNSIGFyIDY2MCAobGlrZSB2YXJpb3VzIEF0b21zKSwKPj4gLSBhIHVzZWxlc3MgKGFs
d2F5cyB6ZXJvKSBDQzMgcmVzaWRlbmN5IE1TUiBhdCA2NjIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gLS0tCj4+IFVzaW5nIHRoZSBNU1Ig
Y3Jvc3MgcmVmZXJlbmNlIGluIHRoZSBzYW1lIFNETSByZXZpc2lvbiBvbmUgbWlnaHQgZXZlbgo+
PiBnZXQgdGhlIGltcHJlc3Npb24gdGhhdCBmdXJ0aGVyIE1TUnMgYXJlIHVuYXZhaWxhYmxlLCBi
dXQgbmV3ZXIgQ1BVcwo+PiBkb24ndCBhcHBlYXIgdG8gYmUgY29uc2lzdGVudGx5IGxpc3RlZCB0
aGVyZSBhdCBhbGwsIHNvIG1heSByYXRoZXIgYmUgYQo+PiBkb2Mgc2hvcnRjb21pbmcuIEkndmUg
cG9pbnRlZCB0aGlzIG91dCB0byBJbnRlbCwgYnV0IEknbSBub3QgZXhwZWN0aW5nCj4+IHN3aWZ0
IGZlZWRiYWNrLgo+IAo+IFdlIG1pZ2h0IGNvbnNpZGVyIGRyb3BwaW5nIENhbm5vbiBMYWtlLsKg
IEl0IGRpZCBzaGlwIDEgbGltaXRlZC1yZWxlYXNlCj4gcGFydHMsIGJ1dCBvbmx5IGZvciBsYXB0
b3AvdGFibGV0IFNLVXMsIGFuZCB0aGVyZSBpcyBhIHJlYXNvbiB3aHkgaXQgaGFzCj4gYmVlbiB0
b3RhbGx5IGRpc2NvbnRpbnVlZC4KCkhvdyB3b3VsZCB5b3UgZW52aXNpb24gImRyb3BwaW5nIiB0
byBsb29rIGxpa2U6IERvIHlvdSBtZWFuIGp1c3QgdG8KcmVtb3ZlIHRoZSBjYXNlIGxhYmVsIGhl
cmUgKGFuZCBwZXJoYXBzIHNpbWlsYXIgb25lcyBlbHNld2hlcmUpLCBvcgpvdXRyaWdodCByZWZ1
c2UgYm9vdGluZyBvbiBpdD8KCkluIGJvdGggY2FzZXMgaWYgSSB3ZXJlIHRvIHN1Ym1pdCBzdWNo
IGEgY2hhbmdlIEknbSBhZnJhaWQgSSdkIHdhbnQKdG8gYmUgYSBsaXR0bGUgbGVzcyB2YWd1ZSBp
biB0aGUgZGVzY3JpcHRpb24gdGhhbiB0byBqdXN0IHNheSAidGhlcmUKaXMgYSByZWFzb24gd2h5
IGl0IGhhcyBiZWVuIHRvdGFsbHkgZGlzY29udGludWVkIi4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
