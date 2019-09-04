Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 550D5A7D35
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 09:58:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Q8l-0001kh-TT; Wed, 04 Sep 2019 07:55:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5Q8k-0001kc-6d
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 07:55:42 +0000
X-Inumbo-ID: 62f7ef80-cee9-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62f7ef80-cee9-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 07:55:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EAF0EAEA7;
 Wed,  4 Sep 2019 07:55:38 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <23892a29-60ef-b1e4-9e19-024559e0d2a0@suse.com>
Date: Wed, 4 Sep 2019 09:55:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/shadow: don't enable shadow mode with too
 small a shadow allocation (part 2)
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDI2MzRiOTk3YWYgKCJ4ODYvc2hhZG93OiBkb24ndCBlbmFibGUgc2hhZG93IG1vZGUg
d2l0aCB0b28gc21hbGwKYSBzaGFkb3cgYWxsb2NhdGlvbiIpIHdhcyBpbmNvbXBsZXRlOiBUaGUg
YWRqdXN0bWVudCBkb25lIHRoZXJlIHRvCnNoYWRvd19lbmFibGUoKSBpcyBhbHNvIG5lZWRlZCBp
biBzaGFkb3dfb25lX2JpdF9lbmFibGUoKS4gVGhlIChuZXcpCnByb2JsZW0gcmVwb3J0IHdhcyAo
YXBwYXJlbnRseSkgYSBmYWlsZWQgUFYgZ3Vlc3QgbWlncmF0aW9uIGZvbGxvd2VkIGJ5CmFub3Ro
ZXIgbWlncmF0aW9uIGF0dGVtcHQgZm9yIHRoYXQgc2FtZSBndWVzdC4gRGlzYWJsaW5nIGxvZy1k
aXJ0eSBtb2RlCmFmdGVyIHRoZSBmaXJzdCBvbmUgaGFkIGxlZnQgYSBjb3VwbGUgb2Ygc2hhZG93
IHBhZ2VzIGFsbG9jYXRlZCAocGVyaGFwcwpzb21ldGhpbmcgdGhhdCBhbHNvIHdhbnRzIGZpeGlu
ZyksIGFuZCBoZW5jZSB0aGUgc2Vjb25kIGVuYWJsaW5nIG9mCmxvZy1kaXJ0eSBtb2RlIHdvdWxk
bid0IGhhdmUgYWxsb2NhdGVkIGFueXRoaW5nIGZ1cnRoZXIuCgpSZXBvcnRlZC1ieTogSmFtZXMg
V2FuZyA8am53YW5nQHN1c2UuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMKQEAgLTI4NjQsNyArMjg2NCw4IEBAIHN0
YXRpYyBpbnQgc2hhZG93X29uZV9iaXRfZW5hYmxlKHN0cnVjdAogCiAgICAgbW9kZSB8PSBQR19T
SF9lbmFibGU7CiAKLSAgICBpZiAoIGQtPmFyY2gucGFnaW5nLnNoYWRvdy50b3RhbF9wYWdlcyA9
PSAwICkKKyAgICBpZiAoIGQtPmFyY2gucGFnaW5nLnNoYWRvdy50b3RhbF9wYWdlcyA8CisgICAg
ICAgICBzaF9taW5fYWxsb2NhdGlvbihkKSArIGQtPmFyY2gucGFnaW5nLnNoYWRvdy5wMm1fcGFn
ZXMgKQogICAgIHsKICAgICAgICAgLyogSW5pdCB0aGUgc2hhZG93IG1lbW9yeSBhbGxvY2F0aW9u
IGlmIHRoZSB1c2VyIGhhc24ndCBkb25lIHNvICovCiAgICAgICAgIGlmICggc2hhZG93X3NldF9h
bGxvY2F0aW9uKGQsIDEsIE5VTEwpICE9IDAgKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
