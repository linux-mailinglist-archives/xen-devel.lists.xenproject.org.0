Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 105D7AFFEE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:26:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84SN-0002F4-7t; Wed, 11 Sep 2019 15:22:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i84SL-0002Em-39
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:22:53 +0000
X-Inumbo-ID: 05443ff0-d4a8-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05443ff0-d4a8-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 15:22:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AABD0ACC4;
 Wed, 11 Sep 2019 15:22:51 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
Message-ID: <f58f9215-4005-9c1d-0701-1e7fe705b786@suse.com>
Date: Wed, 11 Sep 2019 17:22:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 3/9] x86/mm: honor opt_pcid also for 32-bit PV
 domains
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

SSBjYW4ndCBzZWUgYW55IHRlY2huaWNhbCBvciBwZXJmb3JtYW5jZSByZWFzb24gd2h5IHdlIHNo
b3VsZCB0cmVhdAozMi1iaXQgUFYgZGlmZmVyZW50IGZyb20gNjQtYml0IFBWIGluIHRoaXMgcmVn
YXJkLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0t
IGEveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9kb21haW4u
YwpAQCAtMTgwLDcgKzE4MCwyNCBAQCBpbnQgc3dpdGNoX2NvbXBhdChzdHJ1Y3QgZG9tYWluICpk
KQogICAgIGQtPmFyY2gueDg3X2ZpcF93aWR0aCA9IDQ7CiAKICAgICBkLT5hcmNoLnB2LnhwdGkg
PSBmYWxzZTsKLSAgICBkLT5hcmNoLnB2LnBjaWQgPSBmYWxzZTsKKworICAgIGlmICggdXNlX2lu
dnBjaWQgJiYgY3B1X2hhc19wY2lkICkKKyAgICAgICAgc3dpdGNoICggQUNDRVNTX09OQ0Uob3B0
X3BjaWQpICkKKyAgICAgICAgeworICAgICAgICBjYXNlIFBDSURfT0ZGOgorICAgICAgICBjYXNl
IFBDSURfWFBUSToKKyAgICAgICAgICAgIGQtPmFyY2gucHYucGNpZCA9IGZhbHNlOworICAgICAg
ICAgICAgYnJlYWs7CisKKyAgICAgICAgY2FzZSBQQ0lEX0FMTDoKKyAgICAgICAgY2FzZSBQQ0lE
X05PWFBUSToKKyAgICAgICAgICAgIGQtPmFyY2gucHYucGNpZCA9IHRydWU7CisgICAgICAgICAg
ICBicmVhazsKKworICAgICAgICBkZWZhdWx0OgorICAgICAgICAgICAgQVNTRVJUX1VOUkVBQ0hB
QkxFKCk7CisgICAgICAgICAgICBicmVhazsKKyAgICAgICAgfQogCiAgICAgcmV0dXJuIDA7CiAK
QEAgLTMxMiw3ICszMjksNyBAQCBpbnQgcHZfZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFp
biAqCiAKICAgICBkLT5hcmNoLnB2LnhwdGkgPSBpc19oYXJkd2FyZV9kb21haW4oZCkgPyBvcHRf
eHB0aV9od2RvbSA6IG9wdF94cHRpX2RvbXU7CiAKLSAgICBpZiAoICFpc19wdl8zMmJpdF9kb21h
aW4oZCkgJiYgdXNlX2ludnBjaWQgJiYgY3B1X2hhc19wY2lkICkKKyAgICBpZiAoIHVzZV9pbnZw
Y2lkICYmIGNwdV9oYXNfcGNpZCApCiAgICAgICAgIHN3aXRjaCAoIEFDQ0VTU19PTkNFKG9wdF9w
Y2lkKSApCiAgICAgICAgIHsKICAgICAgICAgY2FzZSBQQ0lEX09GRjoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
