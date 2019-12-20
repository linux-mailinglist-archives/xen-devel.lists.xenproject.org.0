Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE68127C6D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:22:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJ7y-0003of-0a; Fri, 20 Dec 2019 14:19:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiJ7w-0003oW-H3
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:19:36 +0000
X-Inumbo-ID: bada06c2-2333-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bada06c2-2333-11ea-b6f1-bc764e2007e4;
 Fri, 20 Dec 2019 14:19:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1887AB23D;
 Fri, 20 Dec 2019 14:19:27 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aa264d92-2545-f2e7-5225-4f870e3ec8f9@suse.com>
Message-ID: <c93259a3-5f68-bcca-aeee-f264234cadf4@suse.com>
Date: Fri, 20 Dec 2019 15:19:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <aa264d92-2545-f2e7-5225-4f870e3ec8f9@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 3/4] x86/mm: avoid IOMMU operations in more
 cases in _get_page_type()
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsIHRoYXQgcmVhbGx5IG1hdHRlcnMgaXMgd2hldGhlciB3cml0YWJpbGl0eSBvZiBhIHBhZ2Ug
Y2hhbmdlczsgaW4KcGF0aWN1bGFyIGUuZy4gcGFnZSB0YWJsZSAtPiBwYWdlIHRhYmxlIChidXQg
ZGlmZmVyZW50IGxldmVscykKdHJhbnNpdGlvbnMgZG8gbm90IHJlcXVpcmUgdW5tYXBwaW5nIHRo
ZSBwYWdlIGZyb20gdGhlIElPTU1VIGFnYWluLgoKTm90ZSB0aGF0IHRoZSBYU0EtMjg4IGZpeCBk
aWQgYXJyYW5nZSBmb3IgUEdUX25vbmUgcGFnZXMgbm90IG5lZWRpbmcKc3BlY2lhbCBjb25zaWRl
cmF0aW9uIGhlcmUuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAt
Mjk2OCwxNyArMjk2OCwxOSBAQCBzdGF0aWMgaW50IF9nZXRfcGFnZV90eXBlKHN0cnVjdCBwYWdl
X2luCiAgICAgICAgICAgICByZXR1cm4gLUVJTlRSOwogICAgIH0KIAotICAgIGlmICggdW5saWtl
bHkoKHggJiBQR1RfdHlwZV9tYXNrKSAhPSB0eXBlKSApCisgICAgaWYgKCB1bmxpa2VseSgoKHgg
JiBQR1RfdHlwZV9tYXNrKSA9PSBQR1Rfd3JpdGFibGVfcGFnZSkgIT0KKyAgICAgICAgICAgICAg
ICAgICh0eXBlID09IFBHVF93cml0YWJsZV9wYWdlKSkgKQogICAgIHsKICAgICAgICAgLyogU3Bl
Y2lhbCBwYWdlcyBzaG91bGQgbm90IGJlIGFjY2Vzc2libGUgZnJvbSBkZXZpY2VzLiAqLwogICAg
ICAgICBzdHJ1Y3QgZG9tYWluICpkID0gcGFnZV9nZXRfb3duZXIocGFnZSk7CisKICAgICAgICAg
aWYgKCBkICYmIGlzX3B2X2RvbWFpbihkKSAmJiB1bmxpa2VseShuZWVkX2lvbW11X3B0X3N5bmMo
ZCkpICkKICAgICAgICAgewogICAgICAgICAgICAgbWZuX3QgbWZuID0gcGFnZV90b19tZm4ocGFn
ZSk7CiAKICAgICAgICAgICAgIGlmICggKHggJiBQR1RfdHlwZV9tYXNrKSA9PSBQR1Rfd3JpdGFi
bGVfcGFnZSApCiAgICAgICAgICAgICAgICAgcmMgPSBpb21tdV9sZWdhY3lfdW5tYXAoZCwgX2Rm
bihtZm5feChtZm4pKSwgUEFHRV9PUkRFUl80Syk7Ci0gICAgICAgICAgICBlbHNlIGlmICggdHlw
ZSA9PSBQR1Rfd3JpdGFibGVfcGFnZSApCisgICAgICAgICAgICBlbHNlCiAgICAgICAgICAgICAg
ICAgcmMgPSBpb21tdV9sZWdhY3lfbWFwKGQsIF9kZm4obWZuX3gobWZuKSksIG1mbiwgUEFHRV9P
UkRFUl80SywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVGX3Jl
YWRhYmxlIHwgSU9NTVVGX3dyaXRhYmxlKTsKIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
