Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DDBEDADC
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 09:55:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRY6M-0007MW-9k; Mon, 04 Nov 2019 08:52:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iRY6L-0007MQ-8y
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 08:52:41 +0000
X-Inumbo-ID: 7521f526-fee0-11e9-9595-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7521f526-fee0-11e9-9595-12813bfff9fa;
 Mon, 04 Nov 2019 08:52:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0A670AEB3;
 Mon,  4 Nov 2019 08:52:40 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <1e714166-ffeb-06a1-9caf-412eb040ac5a@suse.com>
 <005a7254-aae8-ec7c-6e65-9dfe06803208@suse.com>
 <6e358e65-2efe-9e4c-01e9-d9e317c6dfbc@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bae50bb2-c355-fe98-d421-6f1a60df11b3@suse.com>
Date: Mon, 4 Nov 2019 09:52:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6e358e65-2efe-9e4c-01e9-d9e317c6dfbc@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86: explicitly disallow guest access
 to PPIN
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTEuMjAxOSAxNTowMCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gT24gMzAuMTAuMTkg
MTE6MzksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBAQCAtMjM3LDYgKzIzOSwxOCBAQCBpbnQgZ3Vl
c3RfcmRtc3Ioc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90Cj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBBUlJBWV9TSVpFKG1zcnMtPmRyX21hc2spKV07Cj4+ICAgICAgICAg
ICBicmVhazsKPj4gICAKPj4gKyAgICBjYXNlIE1TUl9QUElOX0NUTDoKPj4gKyAgICAgICAgaWYg
KCBkLT5hcmNoLmNwdWlkLT54ODZfdmVuZG9yICE9IFg4Nl9WRU5ET1JfSU5URUwgKQo+PiArICAg
ICAgICAgICAgZ290byBncF9mYXVsdDsKPj4gKyAgICAgICAgKnZhbCA9IFBQSU5fTE9DS09VVDsK
Pj4gKyAgICAgICAgYnJlYWs7Cj4+ICsKPj4gKyAgICBjYXNlIE1TUl9BTURfUFBJTl9DVEw6Cj4+
ICsgICAgICAgIGlmICggIWNwLT5leHRkLmFtZF9wcGluICkKPj4gKyAgICAgICAgICAgIGdvdG8g
Z3BfZmF1bHQ7Cj4+ICsgICAgICAgICp2YWwgPSBQUElOX0xPQ0tPVVQ7Cj4+ICsgICAgICAgIGJy
ZWFrOwo+PiArCj4gCj4gbml0OiBJdCBpcyBub3QgY2xlYXIgdG8gbWUgd2h5IHlvdSB1c2UgImQt
PmFyY2guY3B1aWQtPi4uIiAoYW5kIG5vdCAKPiAiY3AtPi4uIikgaW4gdGhlIGZpcnN0IGlmIGNv
bmRpdGlvbi4KClNpbXBsZSBvdmVyc2lnaHQ7IGNvcnJlY3RlZCBmb3IgdjIuCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
