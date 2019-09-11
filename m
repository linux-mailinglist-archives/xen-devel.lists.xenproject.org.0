Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFE2AFFEA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:24:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84RU-00026J-DY; Wed, 11 Sep 2019 15:22:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i84RT-000269-CD
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:21:59 +0000
X-Inumbo-ID: e43fe9f8-d4a7-11e9-83d8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e43fe9f8-d4a7-11e9-83d8-12813bfff9fa;
 Wed, 11 Sep 2019 15:21:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 18432ADFB;
 Wed, 11 Sep 2019 15:21:56 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
Message-ID: <b43c88e3-662a-2982-fe4d-0df8f0b467d1@suse.com>
Date: Wed, 11 Sep 2019 17:21:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 1/9] x86: adjust cr3_pcid() return type
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

VGhlcmUncyBubyBuZWVkIGZvciBpdCB0byBiZSA2NCBiaXRzIHdpZGUgLSBvbmx5IHRoZSBsb3cg
dHdlbHZlIGJpdHMKb2YgQ1IzIGhvbGQgdGhlIFBDSUQuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYwor
KysgYi94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYwpAQCAtMTAzLDcgKzEwMyw4IEBAIHN0YXRpYyB2
b2lkIGRvX3RsYl9mbHVzaCh2b2lkKQogCiB2b2lkIHN3aXRjaF9jcjNfY3I0KHVuc2lnbmVkIGxv
bmcgY3IzLCB1bnNpZ25lZCBsb25nIGNyNCkKIHsKLSAgICB1bnNpZ25lZCBsb25nIGZsYWdzLCBv
bGRfY3I0LCBvbGRfcGNpZDsKKyAgICB1bnNpZ25lZCBsb25nIGZsYWdzLCBvbGRfY3I0OworICAg
IHVuc2lnbmVkIGludCBvbGRfcGNpZDsKICAgICB1MzIgdDsKIAogICAgIC8qIFRoaXMgbm9uLXJl
ZW50cmFudCBmdW5jdGlvbiBpcyBzb21ldGltZXMgY2FsbGVkIGluIGludGVycnVwdCBjb250ZXh0
LiAqLwotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvcHJvY2Vzc29yLmgKQEAgLTI4Nyw3ICsyODcsNyBAQCBzdGF0aWMgaW5saW5l
IHVuc2lnbmVkIGxvbmcgY3IzX3BhKHVuc2lnCiAgICAgcmV0dXJuIGNyMyAmIFg4Nl9DUjNfQURE
Ul9NQVNLOwogfQogCi1zdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgY3IzX3BjaWQodW5zaWdu
ZWQgbG9uZyBjcjMpCitzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBjcjNfcGNpZCh1bnNpZ25l
ZCBsb25nIGNyMykKIHsKICAgICByZXR1cm4gY3IzICYgWDg2X0NSM19QQ0lEX01BU0s7CiB9CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
