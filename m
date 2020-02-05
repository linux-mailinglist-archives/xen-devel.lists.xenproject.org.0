Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1826415318E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 14:17:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izKXI-0005GK-F7; Wed, 05 Feb 2020 13:16:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izKXG-0005GB-Rc
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 13:16:06 +0000
X-Inumbo-ID: aa3aa29e-4819-11ea-90f7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa3aa29e-4819-11ea-90f7-12813bfff9fa;
 Wed, 05 Feb 2020 13:16:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4CF8EB25A;
 Wed,  5 Feb 2020 13:16:05 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
Message-ID: <f08d9928-1285-4ca3-44e3-9e75d8cd9e5a@suse.com>
Date: Wed, 5 Feb 2020 14:16:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 4/6] Arm/GICv2: don't needlessly use
 xzalloc_bytes()
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIHdoZW4gcGxhaW4geHphbGxvYygpICh3aGljaCBpcyBtb3JlIHR5cGUgc2FmZSkgZG9lcy4K
ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hl
bi9hcmNoL2FybS9naWMtdjIuYworKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXYyLmMKQEAgLTk2OSw3
ICs5NjksNyBAQCBzdGF0aWMgdm9pZCBnaWN2Ml9hZGRfdjJtX2ZyYW1lX3RvX2xpc3QoCiAgICAg
ICAgICAgICAgIG5yX3NwaXMsIFYyTV9NQVhfU1BJIC0gVjJNX01JTl9TUEkgKyAxKTsKIAogICAg
IC8qIEFsbG9jYXRlIGFuIGVudHJ5IHRvIHJlY29yZCBuZXcgdjJtIGZyYW1lIGluZm9ybWF0aW9u
LiAqLwotICAgIHYybV9kYXRhID0geHphbGxvY19ieXRlcyhzaXplb2Yoc3RydWN0IHYybV9kYXRh
KSk7CisgICAgdjJtX2RhdGEgPSB4emFsbG9jKHN0cnVjdCB2Mm1fZGF0YSk7CiAgICAgaWYgKCAh
djJtX2RhdGEgKQogICAgICAgICBwYW5pYygiR0lDdjI6IENhbm5vdCBhbGxvY2F0ZSBtZW1vcnkg
Zm9yIHYybSBmcmFtZVxuIik7CiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
