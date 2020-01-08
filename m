Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9CA134524
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 15:38:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipCQ0-00073S-7r; Wed, 08 Jan 2020 14:34:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipCPz-00073N-Co
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 14:34:43 +0000
X-Inumbo-ID: 0205a16a-3224-11ea-b80a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0205a16a-3224-11ea-b80a-12813bfff9fa;
 Wed, 08 Jan 2020 14:34:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BFF69AC45;
 Wed,  8 Jan 2020 14:34:41 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 Jan 2020 15:34:39 +0100
Message-Id: <20200108143439.25580-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2] xen/x86: clear per cpu stub page information
 in cpu_smpboot_free()
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Y3B1X3NtcGJvb3RfZnJlZSgpIHJlbW92ZXMgdGhlIHN0dWJzIGZvciB0aGUgY3B1IGdvaW5nIG9m
ZmxpbmUsIGJ1dCBpdAppc24ndCBjbGVhcmluZyB0aGUgcmVsYXRlZCBwZXJjcHUgdmFyaWFibGVz
LiBUaGlzIHdpbGwgcmVzdWx0IGluCmNyYXNoZXMgd2hlbiBhIHN0dWIgcGFnZSBpcyByZWxlYXNl
ZCBkdWUgdG8gYWxsIHJlbGF0ZWQgY3B1cyBnb25lCm9mZmxpbmUgYW5kIG9uZSBvZiB0aG9zZSBj
cHVzIGdvaW5nIG9ubGluZSBsYXRlci4KCkZpeCB0aGF0IGJ5IGNsZWFyaW5nIHN0dWJzLmFkZHIg
YW5kIHN0dWJzLm1mbiBpbiBvcmRlciB0byBhbGxvY2F0ZSBhCm5ldyBzdHViIHBhZ2Ugd2hlbiBu
ZWVkZWQuCgpGaXhlczogMmU2YzhmMTgyYzljNTAgKCJ4ODY6IGRpc3Rpbmd1aXNoIENQVSBvZmZs
aW5pbmcgZnJvbSBDUFUgcmVtb3ZhbCIpClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogeGVu
L2FyY2gveDg2L3NtcGJvb3QuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jIGIveGVuL2FyY2gveDg2L3Nt
cGJvb3QuYwppbmRleCA3ZTI5NzA0MDgwLi40NmMwNzI5MjE0IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvc21wYm9vdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKQEAgLTk0NSw2ICs5
NDUsOCBAQCBzdGF0aWMgdm9pZCBjcHVfc21wYm9vdF9mcmVlKHVuc2lnbmVkIGludCBjcHUsIGJv
b2wgcmVtb3ZlKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAocGVyX2NwdShzdHVicy5h
ZGRyLCBjcHUpIHwgflBBR0VfTUFTSykgKyAxKTsKICAgICAgICAgaWYgKCBpID09IFNUVUJTX1BF
Ul9QQUdFICkKICAgICAgICAgICAgIGZyZWVfZG9taGVhcF9wYWdlKG1mbl90b19wYWdlKG1mbikp
OworICAgICAgICBwZXJfY3B1KHN0dWJzLmFkZHIsIGNwdSkgPSAwOworICAgICAgICBwZXJfY3B1
KHN0dWJzLm1mbiwgY3B1KSA9IDA7CiAgICAgfQogCiAgICAgRlJFRV9YRU5IRUFQX1BBR0UocGVy
X2NwdShjb21wYXRfZ2R0LCBjcHUpKTsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
