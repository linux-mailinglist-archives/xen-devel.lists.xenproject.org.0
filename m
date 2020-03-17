Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B38D9187E41
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 11:27:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jE9Ot-0000ri-B0; Tue, 17 Mar 2020 10:24:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lIpW=5C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jE9Os-0000rd-9x
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 10:24:42 +0000
X-Inumbo-ID: 8326e308-6839-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8326e308-6839-11ea-bec1-bc764e2007e4;
 Tue, 17 Mar 2020 10:24:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7417CAC62;
 Tue, 17 Mar 2020 10:24:40 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1584395264-22913-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0de88ada-8baa-586e-cc60-8dd9f9adf327@suse.com>
Date: Tue, 17 Mar 2020 11:24:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584395264-22913-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/shim: fix ballooning up the guest
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDMuMjAyMCAyMjo0NywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gYXJncy5wcmVlbXB0
ZWQgYXMgbWVhbmluZ2xlc3MgaGVyZSBhbmQgZG9lc24ndCBzaG93IGlmIHRoZSBoeXBlcmNhbGwK
PiB3YXMgcHJlZW1wdGVkIGJlZm9yZS4gVXNlIHN0YXJ0X2V4dGVudCBpbnN0ZWFkIHdoaWNoIGlz
IGNvcnJlY3QuCgouLi4gYXMgbG9uZyBhcyB0aGUgaHlwZXJjYWxsIHdhcyBpbnZva2VkIGluIGEg
Im5vcm1hbCIgd2F5LgoKPiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6
aGluaW5AY2l0cml4LmNvbT4KPiAtLS0KPiBUaGlzIGZpeGVzIGJhbGxvb25pbmcgZm9yIDY0LWJp
dCBQViBndWVzdHMgaW5zaWRlIHNoaW0uIDMyLWJpdCBQViBndWVzdHMKPiByZXF1aXJlIGEgbGl0
dGxlIGJpdCBtb3JlIHdvcmsgZHVlIHRvIGNvbXBhdCBsYXllciBiZWluZyBpbnZvbHZlZC4KPiAt
LS0KPiAgeGVuL2NvbW1vbi9tZW1vcnkuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbWVt
b3J5LmMgYi94ZW4vY29tbW9uL21lbW9yeS5jCj4gaW5kZXggNDQ0YzA4MS4uNWZkZDJhMiAxMDA2
NDQKPiAtLS0gYS94ZW4vY29tbW9uL21lbW9yeS5jCj4gKysrIGIveGVuL2NvbW1vbi9tZW1vcnku
Ywo+IEBAIC0xMTkxLDcgKzExOTEsNyBAQCBsb25nIGRvX21lbW9yeV9vcCh1bnNpZ25lZCBsb25n
IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpCj4gICAgICAgICAgfQo+ICAK
PiAgI2lmZGVmIENPTkZJR19YODYKPiAtICAgICAgICBpZiAoIHB2X3NoaW0gJiYgb3AgIT0gWEVO
TUVNX2RlY3JlYXNlX3Jlc2VydmF0aW9uICYmICFhcmdzLnByZWVtcHRlZCApCj4gKyAgICAgICAg
aWYgKCBwdl9zaGltICYmIG9wICE9IFhFTk1FTV9kZWNyZWFzZV9yZXNlcnZhdGlvbiAmJiAhc3Rh
cnRfZXh0ZW50ICkKPiAgICAgICAgICAgICAgLyogQXZvaWQgY2FsbGluZyBwdl9zaGltX29ubGlu
ZV9tZW1vcnkgd2hlbiBwcmVlbXB0ZWQuICovCj4gICAgICAgICAgICAgIHB2X3NoaW1fb25saW5l
X21lbW9yeShhcmdzLm5yX2V4dGVudHMsIGFyZ3MuZXh0ZW50X29yZGVyKTsKClRoZSBjb2RlIGNo
YW5nZSBjYW4gaGF2ZSBteSBSLWIsIGJ1dCBJJ2QgbGlrZSB0aGUgY29tbWVudCB0byBhbHNvCmJl
IGNoYW5nZWQgdGhlbiAtIGl0IHNob3VsZG4ndCB0YWxrIGFib3V0IHByZWVtcHRpb24gaW4gdGhl
IHdheQppdCBkb2VzLiBQZXJoYXBzICIuLi4gd2hlbiB0aGlzIGlzIGEgY29udGludWF0aW9uIj8g
SSdkIGJlIG9rYXkKbWFraW5nIHRoaXMgY2hhbmdlIHdoaWxlIGNvbW1pdHRpbmcuCgpBcyBhbiBh
c2lkZSwgaXQgd291bGQgcHJvYmFibHkgaGF2ZSBiZWVuIGEgZ29vZCBpZGVhIHRvIGFsc28gQ2MK
Um9nZXIgYXMgdGhlIG9yaWdpbmFsIGF1dGhvciBvZiB0aGlzIGNvZGUuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
