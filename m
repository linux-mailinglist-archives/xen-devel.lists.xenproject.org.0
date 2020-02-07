Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE2E15586B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 14:28:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j03dA-0004SA-6U; Fri, 07 Feb 2020 13:25:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KURy=33=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j03d9-0004S5-9V
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 13:25:11 +0000
X-Inumbo-ID: 435c3b24-49ad-11ea-b2cb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 435c3b24-49ad-11ea-b2cb-bc764e2007e4;
 Fri, 07 Feb 2020 13:25:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0EBC5AAC6;
 Fri,  7 Feb 2020 13:25:09 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3deb0df2-5389-9567-3534-23e2ba57c68e@suse.com>
Date: Fri, 7 Feb 2020 14:25:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/MCFG: fix off-by-one in E820 check
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxzbyBhZGp1c3QgdGhlIGNvbW1lbnQgYWhlYWQgb2YgZTgyMF9hbGxfbWFwcGVkKCkgdG8gY2xh
cmlmeSB0aGF0IHRoZQpyYW5nZSBpcyBub3QgaW5jbHVzaXZlIGF0IGl0cyBlbmQuCgpSZXBvcnRl
ZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9l
ODIwLmMKKysrIGIveGVuL2FyY2gveDg2L2U4MjAuYwpAQCAtMzgsNyArMzgsNyBAQCBzdHJ1Y3Qg
ZTgyMG1hcCBlODIwOwogc3RydWN0IGU4MjBtYXAgX19pbml0ZGF0YSBlODIwX3JhdzsKIAogLyoK
LSAqIFRoaXMgZnVuY3Rpb24gY2hlY2tzIGlmIHRoZSBlbnRpcmUgcmFuZ2UgPHN0YXJ0LGVuZD4g
aXMgbWFwcGVkIHdpdGggdHlwZS4KKyAqIFRoaXMgZnVuY3Rpb24gY2hlY2tzIGlmIHRoZSBlbnRp
cmUgcmFuZ2UgW3N0YXJ0LGVuZCkgaXMgbWFwcGVkIHdpdGggdHlwZS4KICAqCiAgKiBOb3RlOiB0
aGlzIGZ1bmN0aW9uIG9ubHkgd29ya3MgY29ycmVjdCBpZiB0aGUgZTgyMCB0YWJsZSBpcyBzb3J0
ZWQgYW5kCiAgKiBub3Qtb3ZlcmxhcHBpbmcsIHdoaWNoIGlzIHRoZSBjYXNlCi0tLSBhL3hlbi9h
cmNoL3g4Ni94ODZfNjQvbW1jb25maWctc2hhcmVkLmMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl82
NC9tbWNvbmZpZy1zaGFyZWQuYwpAQCAtMzM3LDcgKzMzNyw3IEBAIHN0YXRpYyBpbnQgX19pbml0
IGlzX21tY29uZl9yZXNlcnZlZCgKICAgICB1NjQgb2xkX3NpemUgPSBzaXplOwogICAgIGludCB2
YWxpZCA9IDA7CiAKLSAgICB3aGlsZSAoIWU4MjBfYWxsX21hcHBlZChhZGRyLCBhZGRyICsgc2l6
ZSAtIDEsIEU4MjBfUkVTRVJWRUQpKSB7CisgICAgd2hpbGUgKCFlODIwX2FsbF9tYXBwZWQoYWRk
ciwgYWRkciArIHNpemUsIEU4MjBfUkVTRVJWRUQpKSB7CiAgICAgICAgIHNpemUgPj49IDE7CiAg
ICAgICAgIGlmIChzaXplIDwgKDE2VUw8PDIwKSkKICAgICAgICAgICAgIGJyZWFrOwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
