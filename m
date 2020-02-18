Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC287162B27
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 17:55:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j466Z-00086Q-7l; Tue, 18 Feb 2020 16:52:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j466X-00086L-84
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 16:52:13 +0000
X-Inumbo-ID: 025fa0be-526f-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 025fa0be-526f-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 16:52:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9632DB270;
 Tue, 18 Feb 2020 16:52:11 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d0074de-972a-317c-9df6-f4ece26febf4@suse.com>
Date: Tue, 18 Feb 2020 17:52:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2] sysctl: use xmalloc_array() for
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
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBtb3JlIHJvYnVzdCB0aGFuIHRoZSByYXcgeG1hbGxvY19ieXRlcygpLgoKQWxzbyBh
ZGQgYSBzYW5pdHkgY2hlY2sgb24gdGhlIGlucHV0IHBhZ2UgcmFuZ2UsIHRvIGF2b2lkIHJldHVy
bmluZwp0aGUgbGVzcyBhcHBsaWNhYmxlIC1FTk9NRU0gaW4gc3VjaCBjYXNlcyAoYW5kIHRyeWlu
ZyB0aGUgYWxsb2NhdGlvbiBpbgp0aGUgZmlyc3QgcGxhY2UpLgoKU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjI6IEV4cGFuZCBhIGJpdCB0aGUgZGVz
Y3JpcHRpb24gb2YgdGhlIHNhbml0eSBjaGVjayBhZGRpdGlvbi4KCi0tLSBhL3hlbi9jb21tb24v
c3lzY3RsLmMKKysrIGIveGVuL2NvbW1vbi9zeXNjdGwuYwpAQCAtMTg3LDEzICsxODcsMTcgQEAg
bG9uZyBkb19zeXNjdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZQogICAgICAgICB1aW50MzJf
dCAqc3RhdHVzLCAqcHRyOwogICAgICAgICBtZm5fdCBtZm47CiAKKyAgICAgICAgcmV0ID0gLUVJ
TlZBTDsKKyAgICAgICAgaWYgKCBvcC0+dS5wYWdlX29mZmxpbmUuZW5kIDwgb3AtPnUucGFnZV9v
ZmZsaW5lLnN0YXJ0ICkKKyAgICAgICAgICAgIGJyZWFrOworCiAgICAgICAgIHJldCA9IHhzbV9w
YWdlX29mZmxpbmUoWFNNX0hPT0ssIG9wLT51LnBhZ2Vfb2ZmbGluZS5jbWQpOwogICAgICAgICBp
ZiAoIHJldCApCiAgICAgICAgICAgICBicmVhazsKIAotICAgICAgICBwdHIgPSBzdGF0dXMgPSB4
bWFsbG9jX2J5dGVzKCBzaXplb2YodWludDMyX3QpICoKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKG9wLT51LnBhZ2Vfb2ZmbGluZS5lbmQgLQotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG9wLT51LnBhZ2Vfb2ZmbGluZS5zdGFydCArIDEpKTsKKyAgICAgICAgcHRy
ID0gc3RhdHVzID0geG1hbGxvY19hcnJheSh1aW50MzJfdCwKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAob3AtPnUucGFnZV9vZmZsaW5lLmVuZCAtCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG9wLT51LnBhZ2Vfb2ZmbGluZS5zdGFydCArIDEpKTsK
ICAgICAgICAgaWYgKCAhc3RhdHVzICkKICAgICAgICAgewogICAgICAgICAgICAgZHByaW50ayhY
RU5MT0dfV0FSTklORywgIk91dCBvZiBtZW1vcnkgZm9yIHBhZ2Ugb2ZmbGluZSBvcFxuIik7Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
