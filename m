Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F9E1843A0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 10:28:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCgZW-0002Tq-9r; Fri, 13 Mar 2020 09:25:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCgZU-0002Th-Si
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 09:25:36 +0000
X-Inumbo-ID: 9860c1e2-650c-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9860c1e2-650c-11ea-a6c1-bc764e2007e4;
 Fri, 13 Mar 2020 09:25:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 69017B0BE;
 Fri, 13 Mar 2020 09:25:35 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
Message-ID: <6c4e076d-867d-a930-55d4-b41cd3658888@suse.com>
Date: Fri, 13 Mar 2020 10:25:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 1/4] x86/APIC: adjust types and comments in
 calibrate_APIC_clock()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rmlyc3QgYW5kIGZvcmVtb3N0IHRoZSBjb21tZW50IHRhbGtpbmcgYWJvdXQgcG90ZW50aWFsIHVu
ZGVyZmxvdyBiZWluZwp0YWtlbiBjYXJlIG9mIGJ5IHVzaW5nIHNpZ25lZCBsb25nIHR5cGUgdmFy
aWFibGVzIHdhcyB0cnVlIG9ubHkgb24KMzItYml0LCB3aGljaCB3ZSd2ZSBub3QgYmVlbiBzdXBw
b3J0aW5nIGZvciBxdWl0ZSBzb21lIHRpbWUuIERyb3AgdGhlCmNvbW1lbnQgYW5kIGNoYW5nZSBh
bGwgaW52b2x2ZWQgdHlwZXMgdG8gdW5zaWduZWQuIFRha2UgdGhlIG9wcG9ydHVuaXR5CmFuZCBh
bHNvIHJlcGxhY2UgYnVzX2N5Y2xlJ3MgZml4ZWQgd2lkdGggdHlwZS4KCkFkZGl0aW9uYWxseSB0
aGVyZSdzIG5vIHBvaW50IHVzaW5nIGFuICJhcmJpdHJhcnkgKGJ1dCBsb25nIGVub3VnaCkKdGlt
ZW91dCIgaGVyZS4gSnVzdCB1c2UgdGhlIG1heGltdW0gcG9zc2libGUgdmFsdWU7IExpbnV4IGRv
ZXMgc28gdG9vLApqdXN0IGFzIGFuIGFkZGl0aW9uYWwgZGF0YSBwb2ludC4KClNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9h
cGljLmMKKysrIGIveGVuL2FyY2gveDg2L2FwaWMuYwpAQCAtMTIwNywyMSArMTIwNywxOSBAQCBz
dGF0aWMgdm9pZCB3YWl0X3RpY2tfcHZoKHZvaWQpCiBzdGF0aWMgaW50IF9faW5pdCBjYWxpYnJh
dGVfQVBJQ19jbG9jayh2b2lkKQogewogICAgIHVuc2lnbmVkIGxvbmcgbG9uZyB0MSwgdDI7Ci0g
ICAgbG9uZyB0dDEsIHR0MjsKLSAgICBsb25nIHJlc3VsdDsKLSAgICBpbnQgaTsKKyAgICB1bnNp
Z25lZCBsb25nIHR0MSwgdHQyLCByZXN1bHQ7CisgICAgdW5zaWduZWQgaW50IGk7CiAgICAgdW5z
aWduZWQgbG9uZyBidXNfZnJlcTsgLyogS0FGOiBwb2ludGVyLXNpemUgYXZvaWRzIGNvbXBpbGUg
d2FybnMuICovCi0gICAgdTMyIGJ1c19jeWNsZTsgICAgICAgICAgLyogbGVuZ3RoIG9mIG9uZSBi
dXMgY3ljbGUgaW4gcGljby1zZWNvbmRzICovCi0gICAgY29uc3QgaW50IExPT1BTID0gSFovMTA7
CisgICAgdW5zaWduZWQgaW50IGJ1c19jeWNsZTsgLyogbGVuZ3RoIG9mIG9uZSBidXMgY3ljbGUg
aW4gcGljby1zZWNvbmRzICovCisgICAgY29uc3QgdW5zaWduZWQgaW50IExPT1BTID0gSFovMTA7
CiAKICAgICBhcGljX3ByaW50ayhBUElDX1ZFUkJPU0UsICJjYWxpYnJhdGluZyBBUElDIHRpbWVy
IC4uLlxuIik7CiAKICAgICAvKgotICAgICAqIFB1dCB3aGF0ZXZlciBhcmJpdHJhcnkgKGJ1dCBs
b25nIGVub3VnaCkgdGltZW91dAotICAgICAqIHZhbHVlIGludG8gdGhlIEFQSUMgY2xvY2ssIHdl
IGp1c3Qgd2FudCB0byBnZXQgdGhlCi0gICAgICogY291bnRlciBydW5uaW5nIGZvciBjYWxpYnJh
dGlvbi4KKyAgICAgKiBTZXR1cCB0aGUgQVBJQyBjb3VudGVyIHRvIG1heGltdW0uIFRoZXJlIGlz
IG5vIHdheSB0aGUgbGFwaWMKKyAgICAgKiBjYW4gdW5kZXJmbG93IGluIHRoZSAxMDBtcyBkZXRl
Y3Rpb24gdGltZSBmcmFtZS4KICAgICAgKi8KLSAgICBfX3NldHVwX0FQSUNfTFZUVCgxMDAwMDAw
MDAwKTsKKyAgICBfX3NldHVwX0FQSUNfTFZUVCgweGZmZmZmZmZmKTsKIAogICAgIGlmICggIXhl
bl9ndWVzdCApCiAgICAgICAgIC8qCkBAIC0xMjUxLDE0ICsxMjQ5LDYgQEAgc3RhdGljIGludCBf
X2luaXQgY2FsaWJyYXRlX0FQSUNfY2xvY2sodgogICAgIHR0MiA9IGFwaWNfcmVhZChBUElDX1RN
Q0NUKTsKICAgICB0MiA9IHJkdHNjX29yZGVyZWQoKTsKIAotICAgIC8qCi0gICAgICogVGhlIEFQ
SUMgYnVzIGNsb2NrIGNvdW50ZXIgaXMgMzIgYml0cyBvbmx5LCBpdAotICAgICAqIG1pZ2h0IGhh
dmUgb3ZlcmZsb3duLCBidXQgbm90ZSB0aGF0IHdlIHVzZSBzaWduZWQKLSAgICAgKiBsb25ncywg
dGh1cyBubyBleHRyYSBjYXJlIG5lZWRlZC4KLSAgICAgKgotICAgICAqIHVuZGVyZmxvd24gdG8g
YmUgZXhhY3QsIGFzIHRoZSB0aW1lciBjb3VudHMgZG93biA7KQotICAgICAqLwotCiAgICAgcmVz
dWx0ID0gKHR0MS10dDIpKkFQSUNfRElWSVNPUi9MT09QUzsKIAogICAgIGFwaWNfcHJpbnRrKEFQ
SUNfVkVSQk9TRSwgIi4uLi4uIENQVSBjbG9jayBzcGVlZCBpcyAlbGQuJTA0bGQgTUh6LlxuIiwK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
