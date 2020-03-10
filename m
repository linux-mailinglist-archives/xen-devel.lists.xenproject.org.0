Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B0D17F10D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 08:33:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBZKD-0001bd-FG; Tue, 10 Mar 2020 07:29:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WGVw=43=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBZKA-0001ay-Vs
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 07:29:11 +0000
X-Inumbo-ID: cfbffa36-62a0-11ea-bdac-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfbffa36-62a0-11ea-bdac-bc764e2007e4;
 Tue, 10 Mar 2020 07:29:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7629CAE38;
 Tue, 10 Mar 2020 07:28:59 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Mar 2020 08:28:53 +0100
Message-Id: <20200310072853.27567-7-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200310072853.27567-1-jgross@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v4 6/6] xen/rcu: add per-lock counter in debug
 builds
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgbG9jayBzcGVjaWZpYyBjb3VudGVyIHRvIHJjdSByZWFkIGxvY2tzIGluIGRlYnVnIGJ1
aWxkcy4gVGhpcwphbGxvd3MgdG8gdGVzdCBmb3IgbWF0Y2hpbmcgbG9jay91bmxvY2sgY2FsbHMu
CgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVu
L2luY2x1ZGUveGVuL3JjdXBkYXRlLmggfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaCBiL3hlbi9p
bmNsdWRlL3hlbi9yY3VwZGF0ZS5oCmluZGV4IDBmMzJiM2M3ZDguLjYwMmI4MTlkNzUgMTAwNjQ0
Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9yY3VwZGF0ZS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9y
Y3VwZGF0ZS5oCkBAIC0zNiwyMSArMzYsMzMgQEAKICNpbmNsdWRlIDx4ZW4vc3BpbmxvY2suaD4K
ICNpbmNsdWRlIDx4ZW4vY3B1bWFzay5oPgogI2luY2x1ZGUgPHhlbi9wZXJjcHUuaD4KKyNpbmNs
dWRlIDxhc20vYXRvbWljLmg+CiAKICNkZWZpbmUgX19yY3UKIAogI2lmbmRlZiBOREVCVUcKKy8q
ICogTG9jayB0eXBlIGZvciBwYXNzaW5nIHRvIHJjdV9yZWFkX3tsb2NrLHVubG9ja30uICovCitz
dHJ1Y3QgX3JjdV9yZWFkX2xvY2sgeworICAgIGF0b21pY190IGNudDsKK307Cit0eXBlZGVmIHN0
cnVjdCBfcmN1X3JlYWRfbG9jayByY3VfcmVhZF9sb2NrX3Q7CisjZGVmaW5lIERFRklORV9SQ1Vf
UkVBRF9MT0NLKHgpIHJjdV9yZWFkX2xvY2tfdCB4ID0geyAuY250ID0gQVRPTUlDX0lOSVQoMCkg
fQorI2RlZmluZSBSQ1VfUkVBRF9MT0NLX0lOSVQoeCkgICBhdG9taWNfc2V0KCYoeCktPmNudCwg
MCkKKwogREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgcmN1X2xvY2tfY250KTsKIAotc3Rh
dGljIGlubGluZSB2b2lkIHJjdV9xdWllc2NlX2Rpc2FibGUodm9pZCkKK3N0YXRpYyBpbmxpbmUg
dm9pZCByY3VfcXVpZXNjZV9kaXNhYmxlKHJjdV9yZWFkX2xvY2tfdCAqbG9jaykKIHsKICAgICB0
aGlzX2NwdShyY3VfbG9ja19jbnQpKys7CisgICAgYXRvbWljX2luYygmbG9jay0+Y250KTsKICAg
ICBiYXJyaWVyKCk7CiB9CiAKLXN0YXRpYyBpbmxpbmUgdm9pZCByY3VfcXVpZXNjZV9lbmFibGUo
dm9pZCkKK3N0YXRpYyBpbmxpbmUgdm9pZCByY3VfcXVpZXNjZV9lbmFibGUocmN1X3JlYWRfbG9j
a190ICpsb2NrKQogewogICAgIGJhcnJpZXIoKTsKKyAgICBBU1NFUlQoYXRvbWljX3JlYWQoJmxv
Y2stPmNudCkpOworICAgIGF0b21pY19kZWMoJmxvY2stPmNudCk7CiAgICAgdGhpc19jcHUocmN1
X2xvY2tfY250KS0tOwogfQogCkBAIC02MCw4ICs3MiwxNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wg
cmN1X3F1aWVzY2VfYWxsb3dlZCh2b2lkKQogfQogCiAjZWxzZQotc3RhdGljIGlubGluZSB2b2lk
IHJjdV9xdWllc2NlX2Rpc2FibGUodm9pZCkgeyB9Ci1zdGF0aWMgaW5saW5lIHZvaWQgcmN1X3F1
aWVzY2VfZW5hYmxlKHZvaWQpIHsgfQorLyoKKyAqIER1bW15IGxvY2sgdHlwZSBmb3IgcGFzc2lu
ZyB0byByY3VfcmVhZF97bG9jayx1bmxvY2t9LiBDdXJyZW50bHkgZXhpc3RzCisgKiBvbmx5IHRv
IGRvY3VtZW50IHRoZSByZWFzb24gZm9yIHJjdV9yZWFkX2xvY2soKSBjcml0aWNhbCBzZWN0aW9u
cy4KKyAqLworc3RydWN0IF9yY3VfcmVhZF9sb2NrIHt9OwordHlwZWRlZiBzdHJ1Y3QgX3JjdV9y
ZWFkX2xvY2sgcmN1X3JlYWRfbG9ja190OworI2RlZmluZSBERUZJTkVfUkNVX1JFQURfTE9DSyh4
KSByY3VfcmVhZF9sb2NrX3QgeAorI2RlZmluZSBSQ1VfUkVBRF9MT0NLX0lOSVQoeCkKKworc3Rh
dGljIGlubGluZSB2b2lkIHJjdV9xdWllc2NlX2Rpc2FibGUocmN1X3JlYWRfbG9ja190ICpsb2Nr
KSB7IH0KK3N0YXRpYyBpbmxpbmUgdm9pZCByY3VfcXVpZXNjZV9lbmFibGUocmN1X3JlYWRfbG9j
a190ICpsb2NrKSB7IH0KIHN0YXRpYyBpbmxpbmUgYm9vbCByY3VfcXVpZXNjZV9hbGxvd2VkKHZv
aWQpCiB7CiAgICAgcmV0dXJuIHRydWU7CkBAIC04OCwxNSArMTA5LDYgQEAgc3RydWN0IHJjdV9o
ZWFkIHsKIGludCByY3VfcGVuZGluZyhpbnQgY3B1KTsKIGludCByY3VfbmVlZHNfY3B1KGludCBj
cHUpOwogCi0vKgotICogRHVtbXkgbG9jayB0eXBlIGZvciBwYXNzaW5nIHRvIHJjdV9yZWFkX3ts
b2NrLHVubG9ja30uIEN1cnJlbnRseSBleGlzdHMKLSAqIG9ubHkgdG8gZG9jdW1lbnQgdGhlIHJl
YXNvbiBmb3IgcmN1X3JlYWRfbG9jaygpIGNyaXRpY2FsIHNlY3Rpb25zLgotICovCi1zdHJ1Y3Qg
X3JjdV9yZWFkX2xvY2sge307Ci10eXBlZGVmIHN0cnVjdCBfcmN1X3JlYWRfbG9jayByY3VfcmVh
ZF9sb2NrX3Q7Ci0jZGVmaW5lIERFRklORV9SQ1VfUkVBRF9MT0NLKHgpIHJjdV9yZWFkX2xvY2tf
dCB4Ci0jZGVmaW5lIFJDVV9SRUFEX0xPQ0tfSU5JVCh4KQotCiAvKioKICAqIHJjdV9yZWFkX2xv
Y2sgLSBtYXJrIHRoZSBiZWdpbm5pbmcgb2YgYW4gUkNVIHJlYWQtc2lkZSBjcml0aWNhbCBzZWN0
aW9uLgogICoKQEAgLTEyNSw3ICsxMzcsNyBAQCB0eXBlZGVmIHN0cnVjdCBfcmN1X3JlYWRfbG9j
ayByY3VfcmVhZF9sb2NrX3Q7CiAgKi8KIHN0YXRpYyBpbmxpbmUgdm9pZCByY3VfcmVhZF9sb2Nr
KHJjdV9yZWFkX2xvY2tfdCAqbG9jaykKIHsKLSAgICByY3VfcXVpZXNjZV9kaXNhYmxlKCk7Cisg
ICAgcmN1X3F1aWVzY2VfZGlzYWJsZShsb2NrKTsKIH0KIAogLyoqCkBAIC0xMzYsNyArMTQ4LDcg
QEAgc3RhdGljIGlubGluZSB2b2lkIHJjdV9yZWFkX2xvY2socmN1X3JlYWRfbG9ja190ICpsb2Nr
KQogc3RhdGljIGlubGluZSB2b2lkIHJjdV9yZWFkX3VubG9jayhyY3VfcmVhZF9sb2NrX3QgKmxv
Y2spCiB7CiAgICAgQVNTRVJUKCFyY3VfcXVpZXNjZV9hbGxvd2VkKCkpOwotICAgIHJjdV9xdWll
c2NlX2VuYWJsZSgpOworICAgIHJjdV9xdWllc2NlX2VuYWJsZShsb2NrKTsKIH0KIAogLyoKLS0g
CjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
