Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E62BD9FF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 10:39:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD2kW-00078u-V7; Wed, 25 Sep 2019 08:34:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD2kW-00078p-0C
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 08:34:12 +0000
X-Inumbo-ID: 3e77d8fa-df6f-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 3e77d8fa-df6f-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 08:34:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B16D0ABCB;
 Wed, 25 Sep 2019 08:34:08 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c15e735a-089a-8c9e-5bb4-f2edd781819e@suse.com>
Date: Wed, 25 Sep 2019 10:34:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] libxc/x86: correct overflow avoidance check in
 AMD CPUID handling
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IGRmMjlkMDNmMWQgKCJsaWJ4Yy94ODY6IGF2b2lkIGNlcnRhaW4gb3ZlcmZsb3dzIGlu
IENQVUlEIEFQSUMgSUQKYWRqdXN0bWVudHMiIGludHJvZHVjZWQgYSBvbmUgYml0IHRvbyBuYXJy
b3cgbWFzayB3aGVuIGNoZWNraW5nIHdoZXRoZXIKbXVsdGlwbHlpbmcgYnkgMSAoaW4gcGFydGlj
dWxhciBpbiBsZWFmIDEpIHdvdWxkIHJlc3VsdCBpbiBvdmVyZmxvdy4KClJlcG9ydGVkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS90b29scy9saWJ4Yy94Y19jcHVp
ZF94ODYuYworKysgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwpAQCAtNDAzLDcgKzQwMyw3
IEBAIHN0YXRpYyB2b2lkIGFtZF94Y19jcHVpZF9wb2xpY3koY29uc3Qgc3QKICAgICAgICAgICog
LSBpbmNyZW1lbnRpbmcgQXBpY0lkQ29yZVNpemUgd2hlbiBpdCdzIHplcm8gKHdoaWNoIGNoYW5n
ZXMgdGhlCiAgICAgICAgICAqICAgbWVhbmluZyBvZiBiaXRzIDc6MCkuCiAgICAgICAgICAqLwot
ICAgICAgICBpZiAoIChyZWdzWzJdICYgMHg3ZnUpIDwgMHg3ZnUgKQorICAgICAgICBpZiAoIChy
ZWdzWzJdICYgMHhmZnUpIDwgMHg3ZnUgKQogICAgICAgICB7CiAgICAgICAgICAgICBpZiAoIChy
ZWdzWzJdICYgMHhmMDAwdSkgJiYgKHJlZ3NbMl0gJiAweGYwMDB1KSAhPSAweGYwMDB1ICkKICAg
ICAgICAgICAgICAgICByZWdzWzJdID0gKChyZWdzWzJdICsgMHgxMDAwdSkgJiAweGYwMDB1KSB8
IChyZWdzWzJdICYgMHhmZnUpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
