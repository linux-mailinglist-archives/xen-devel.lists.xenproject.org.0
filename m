Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F35162604
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 13:23:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j41sP-0006dh-3r; Tue, 18 Feb 2020 12:21:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LnEJ=4G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j41sN-0006dV-B6
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 12:21:19 +0000
X-Inumbo-ID: 29ec189a-5249-11ea-8170-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29ec189a-5249-11ea-8170-12813bfff9fa;
 Tue, 18 Feb 2020 12:21:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 49C44B365;
 Tue, 18 Feb 2020 12:21:17 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 18 Feb 2020 13:21:11 +0100
Message-Id: <20200218122114.17596-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200218122114.17596-1-jgross@suse.com>
References: <20200218122114.17596-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 1/4] xen/rcu: use rcu softirq for forcing
 quiescent state
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgcmN1IGNhbGxiYWNrcyBhcmUgcHJvY2Vzc2VkIGluIF9fZG9fc29mdGlycSgpIHRoZXJlIGlz
IG5vIG5lZWQgdG8KdXNlIHRoZSBzY2hlZHVsaW5nIHNvZnRpcnEgZm9yIGZvcmNpbmcgcXVpZXNj
ZW50IHN0YXRlLiBBbnkgb3RoZXIKc29mdGlycSB3b3VsZCBkbyB0aGUgam9iIGFuZCB0aGUgc2No
ZWR1bGluZyBvbmUgaXMgdGhlIG1vc3QgZXhwZW5zaXZlLgoKU28gdXNlIHRoZSBhbHJlYWR5IGV4
aXN0aW5nIHJjdSBzb2Z0aXJxIGZvciB0aGF0IHB1cnBvc2UuIEZvciB0ZWxsaW5nCmFwYXJ0IHdo
eSB0aGUgcmN1IHNvZnRpcnEgd2FzIHJhaXNlZCBhZGQgYSBmbGFnIGZvciB0aGUgY3VycmVudCB1
c2FnZS4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0t
CiB4ZW4vY29tbW9uL3JjdXBkYXRlLmMgfCAyMCArKysrKysrKysrKysrKysrKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9yY3VwZGF0ZS5jIGIveGVuL2NvbW1vbi9yY3VwZGF0ZS5jCmluZGV4IDkxZDRh
ZDBmZDguLjA3OWVhOWQ4YTEgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vcmN1cGRhdGUuYworKysg
Yi94ZW4vY29tbW9uL3JjdXBkYXRlLmMKQEAgLTg5LDYgKzg5LDggQEAgc3RydWN0IHJjdV9kYXRh
IHsKICAgICAvKiAzKSBpZGxlIENQVXMgaGFuZGxpbmcgKi8KICAgICBzdHJ1Y3QgdGltZXIgaWRs
ZV90aW1lcjsKICAgICBib29sIGlkbGVfdGltZXJfYWN0aXZlOworCisgICAgYm9vbCAgICAgICAg
ICAgIHByb2Nlc3NfY2FsbGJhY2tzOwogfTsKIAogLyoKQEAgLTE5NCw3ICsxOTYsNyBAQCBzdGF0
aWMgdm9pZCBmb3JjZV9xdWllc2NlbnRfc3RhdGUoc3RydWN0IHJjdV9kYXRhICpyZHAsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHJjdV9jdHJsYmxrICpyY3ApCiB7
CiAgICAgY3B1bWFza190IGNwdW1hc2s7Ci0gICAgcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZU
SVJRKTsKKyAgICByYWlzZV9zb2Z0aXJxKFJDVV9TT0ZUSVJRKTsKICAgICBpZiAodW5saWtlbHko
cmRwLT5xbGVuIC0gcmRwLT5sYXN0X3JzX3FsZW4gPiByc2ludGVydmFsKSkgewogICAgICAgICBy
ZHAtPmxhc3RfcnNfcWxlbiA9IHJkcC0+cWxlbjsKICAgICAgICAgLyoKQEAgLTIwMiw3ICsyMDQs
NyBAQCBzdGF0aWMgdm9pZCBmb3JjZV9xdWllc2NlbnRfc3RhdGUoc3RydWN0IHJjdV9kYXRhICpy
ZHAsCiAgICAgICAgICAqIHJkcC0+Y3B1IGlzIHRoZSBjdXJyZW50IGNwdS4KICAgICAgICAgICov
CiAgICAgICAgIGNwdW1hc2tfYW5kbm90KCZjcHVtYXNrLCAmcmNwLT5jcHVtYXNrLCBjcHVtYXNr
X29mKHJkcC0+Y3B1KSk7Ci0gICAgICAgIGNwdW1hc2tfcmFpc2Vfc29mdGlycSgmY3B1bWFzaywg
U0NIRURVTEVfU09GVElSUSk7CisgICAgICAgIGNwdW1hc2tfcmFpc2Vfc29mdGlycSgmY3B1bWFz
aywgUkNVX1NPRlRJUlEpOwogICAgIH0KIH0KIApAQCAtMjU5LDcgKzI2MSwxMCBAQCBzdGF0aWMg
dm9pZCByY3VfZG9fYmF0Y2goc3RydWN0IHJjdV9kYXRhICpyZHApCiAgICAgaWYgKCFyZHAtPmRv
bmVsaXN0KQogICAgICAgICByZHAtPmRvbmV0YWlsID0gJnJkcC0+ZG9uZWxpc3Q7CiAgICAgZWxz
ZQorICAgIHsKKyAgICAgICAgcmRwLT5wcm9jZXNzX2NhbGxiYWNrcyA9IHRydWU7CiAgICAgICAg
IHJhaXNlX3NvZnRpcnEoUkNVX1NPRlRJUlEpOworICAgIH0KIH0KIAogLyoKQEAgLTQxMCw3ICs0
MTUsMTMgQEAgc3RhdGljIHZvaWQgX19yY3VfcHJvY2Vzc19jYWxsYmFja3Moc3RydWN0IHJjdV9j
dHJsYmxrICpyY3AsCiAKIHN0YXRpYyB2b2lkIHJjdV9wcm9jZXNzX2NhbGxiYWNrcyh2b2lkKQog
ewotICAgIF9fcmN1X3Byb2Nlc3NfY2FsbGJhY2tzKCZyY3VfY3RybGJsaywgJnRoaXNfY3B1KHJj
dV9kYXRhKSk7CisgICAgc3RydWN0IHJjdV9kYXRhICpyZHAgPSAmdGhpc19jcHUocmN1X2RhdGEp
OworCisgICAgaWYgKCByZHAtPnByb2Nlc3NfY2FsbGJhY2tzICkKKyAgICB7CisgICAgICAgIHJk
cC0+cHJvY2Vzc19jYWxsYmFja3MgPSBmYWxzZTsKKyAgICAgICAgX19yY3VfcHJvY2Vzc19jYWxs
YmFja3MoJnJjdV9jdHJsYmxrLCByZHApOworICAgIH0KIH0KIAogc3RhdGljIGludCBfX3JjdV9w
ZW5kaW5nKHN0cnVjdCByY3VfY3RybGJsayAqcmNwLCBzdHJ1Y3QgcmN1X2RhdGEgKnJkcCkKQEAg
LTUxOCw2ICs1MjksOSBAQCBzdGF0aWMgdm9pZCByY3VfaWRsZV90aW1lcl9oYW5kbGVyKHZvaWQq
IGRhdGEpCiAKIHZvaWQgcmN1X2NoZWNrX2NhbGxiYWNrcyhpbnQgY3B1KQogeworICAgIHN0cnVj
dCByY3VfZGF0YSAqcmRwID0gJnRoaXNfY3B1KHJjdV9kYXRhKTsKKworICAgIHJkcC0+cHJvY2Vz
c19jYWxsYmFja3MgPSB0cnVlOwogICAgIHJhaXNlX3NvZnRpcnEoUkNVX1NPRlRJUlEpOwogfQog
Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
