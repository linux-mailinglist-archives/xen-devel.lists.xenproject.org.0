Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358B8F4177
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 08:41:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSyqy-0005g4-8R; Fri, 08 Nov 2019 07:38:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uDOX=ZA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iSyqw-0005fz-DS
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 07:38:42 +0000
X-Inumbo-ID: c8375b6c-01fa-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8375b6c-01fa-11ea-984a-bc764e2007e4;
 Fri, 08 Nov 2019 07:38:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6B88FB452;
 Fri,  8 Nov 2019 07:38:39 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  8 Nov 2019 08:38:37 +0100
Message-Id: <20191108073837.5797-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/sched: remove wrong assertions in
 csched2_free_pdata()
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
Cc: Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGFzc2VydGlvbnMgaW4gY3NjaGVkMl9mcmVlX3BkYXRhKCkgYXJlIHdyb25nIGFzIGluIGNh
c2UgaXQgaXMKY2FsbGVkIGJ5IHNjaGVkdWxlX2NwdV9hZGQoKSBhZnRlciBhIGZhaWx1cmUgb2Yg
c2NoZWRfYWxsb2NfdWRhdGEoKQp0aGUgaW5pdCBwZGF0YSBmdW5jdGlvbiB3b24ndCBoYXZlIGJl
ZW4gY2FsbGVkLgoKU28ganVzdCByZW1vdmUgdGhlICh3cm9uZykgY29tbWVudCBhbmQgQVNTRVJU
KCkgc3RhdGVtZW50cy4KCldoaWxlIGF0IGl0IHJlbW92ZSB0aGUgd3JvbmcgY29tbWVudCBpbiBj
c2NoZWQyX2RlaW5pdF9wZGF0YSgpLCB0b28uCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgfCAxNiAt
LS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRp
dDIuYwppbmRleCBhZjU4ZWUxNjFkLi5hOTk1ZmY4MzhmIDEwMDY0NAotLS0gYS94ZW4vY29tbW9u
L3NjaGVkX2NyZWRpdDIuYworKysgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYwpAQCAtMzkx
NCwxMCArMzkxNCw2IEBAIGNzY2hlZDJfZGVpbml0X3BkYXRhKGNvbnN0IHN0cnVjdCBzY2hlZHVs
ZXIgKm9wcywgdm9pZCAqcGNwdSwgaW50IGNwdSkKIAogICAgIHdyaXRlX2xvY2tfaXJxc2F2ZSgm
cHJ2LT5sb2NrLCBmbGFncyk7CiAKLSAgICAvKgotICAgICAqIGFsbG9jX3BkYXRhIGlzIG5vdCBp
bXBsZW1lbnRlZCwgc28gcGNwdSBtdXN0IGJlIE5VTEwuIE9uIHRoZSBvdGhlcgotICAgICAqIGhh
bmQsIGluaXRfcGRhdGEgbXVzdCBoYXZlIGJlZW4gY2FsbGVkIGZvciB0aGlzIHBDUFUuCi0gICAg
ICovCiAgICAgLyoKICAgICAgKiBTY2hlZHVsZXIgc3BlY2lmaWMgZGF0YSBmb3IgdGhpcyBwQ1BV
IG11c3Qgc3RpbGwgYmUgdGhlcmUgYW5kIGFuZCBiZQogICAgICAqIHZhbGlkLiBJbiBmYWN0LCBp
ZiB3ZSBhcmUgaGVyZToKQEAgLTM5NjksMTggKzM5NjUsNiBAQCBjc2NoZWQyX2RlaW5pdF9wZGF0
YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHZvaWQgKnBjcHUsIGludCBjcHUpCiBzdGF0
aWMgdm9pZAogY3NjaGVkMl9mcmVlX3BkYXRhKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywg
dm9pZCAqcGNwdSwgaW50IGNwdSkKIHsKLSAgICBzdHJ1Y3QgY3NjaGVkMl9wY3B1ICpzcGMgPSBw
Y3B1OwotCi0gICAgLyoKLSAgICAgKiBwY3B1IGVpdGhlciBwb2ludHMgdG8gYSB2YWxpZCBzdHJ1
Y3QgY3NjaGVkMl9wY3B1LCBvciBpcyBOVUxMIChpZgotICAgICAqIENQVSBicmluZ3VwIGZhaWxl
ZCwgYW5kIHdlJ3JlIGJlZWluZyBjYWxsZWQgZnJvbSBDUFVfVVBfQ0FOQ0VMTEVEKS4KLSAgICAg
KiB4ZnJlZSgpIGRvZXMgbm90IHJlYWxseSBtaW5kLCBidXQgd2Ugd2FudCB0byBiZSBzdXJlIHRo
YXQgZWl0aGVyCi0gICAgICogaW5pdF9wZGF0YSBoYXMgbmV2ZXIgYmVlbiBjYWxsZWQsIG9yIGRl
aW5pdF9wZGF0YSBoYXMgYmVlbiBjYWxsZWQKLSAgICAgKiBhbHJlYWR5LgotICAgICAqLwotICAg
IEFTU0VSVCghcGNwdSB8fCBzcGMtPnJ1bnFfaWQgPT0gLTEpOwotICAgIEFTU0VSVCghY3B1bWFz
a190ZXN0X2NwdShjcHUsICZjc2NoZWQyX3ByaXYob3BzKS0+aW5pdGlhbGl6ZWQpKTsKLQogICAg
IHhmcmVlKHBjcHUpOwogfQogCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
