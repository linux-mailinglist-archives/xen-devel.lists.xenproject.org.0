Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637AE15319D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 14:19:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izKXZ-0005JS-Q2; Wed, 05 Feb 2020 13:16:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izKXX-0005J7-Lb
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 13:16:23 +0000
X-Inumbo-ID: b47b73c8-4819-11ea-90f7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b47b73c8-4819-11ea-90f7-12813bfff9fa;
 Wed, 05 Feb 2020 13:16:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A08EAC69;
 Wed,  5 Feb 2020 13:16:22 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
Message-ID: <4cf07838-40ff-a941-159a-263c9305b89d@suse.com>
Date: Wed, 5 Feb 2020 14:16:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 4/6] sysctl: use xmalloc_array() for
 XEN_SYSCTL_page_offline_op
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBtb3JlIHJvYnVzdCB0aGFuIHRoZSByYXcgeG1hbGxvY19ieXRlcygpLgoKQWxzbyBh
ZGQgYSBzYW5pdHkgY2hlY2sgb24gdGhlIGlucHV0IHBhZ2UgcmFuZ2UuCgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vY29tbW9uL3N5c2N0
bC5jCisrKyBiL3hlbi9jb21tb24vc3lzY3RsLmMKQEAgLTE4NywxMyArMTg3LDE3IEBAIGxvbmcg
ZG9fc3lzY3RsKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGUKICAgICAgICAgdWludDMyX3QgKnN0
YXR1cywgKnB0cjsKICAgICAgICAgbWZuX3QgbWZuOwogCisgICAgICAgIHJldCA9IC1FSU5WQUw7
CisgICAgICAgIGlmICggb3AtPnUucGFnZV9vZmZsaW5lLmVuZCA8IG9wLT51LnBhZ2Vfb2ZmbGlu
ZS5zdGFydCApCisgICAgICAgICAgICBicmVhazsKKwogICAgICAgICByZXQgPSB4c21fcGFnZV9v
ZmZsaW5lKFhTTV9IT09LLCBvcC0+dS5wYWdlX29mZmxpbmUuY21kKTsKICAgICAgICAgaWYgKCBy
ZXQgKQogICAgICAgICAgICAgYnJlYWs7CiAKLSAgICAgICAgcHRyID0gc3RhdHVzID0geG1hbGxv
Y19ieXRlcyggc2l6ZW9mKHVpbnQzMl90KSAqCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIChvcC0+dS5wYWdlX29mZmxpbmUuZW5kIC0KLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBvcC0+dS5wYWdlX29mZmxpbmUuc3RhcnQgKyAxKSk7CisgICAgICAgIHB0ciA9IHN0
YXR1cyA9IHhtYWxsb2NfYXJyYXkodWludDMyX3QsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKG9wLT51LnBhZ2Vfb2ZmbGluZS5lbmQgLQorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBvcC0+dS5wYWdlX29mZmxpbmUuc3RhcnQgKyAxKSk7CiAgICAg
ICAgIGlmICggIXN0YXR1cyApCiAgICAgICAgIHsKICAgICAgICAgICAgIGRwcmludGsoWEVOTE9H
X1dBUk5JTkcsICJPdXQgb2YgbWVtb3J5IGZvciBwYWdlIG9mZmxpbmUgb3BcbiIpOwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
