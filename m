Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2739A16260F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 13:25:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j41sY-0006fk-VK; Tue, 18 Feb 2020 12:21:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LnEJ=4G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j41sX-0006fK-Pl
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 12:21:29 +0000
X-Inumbo-ID: 2a3f902e-5249-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a3f902e-5249-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 12:21:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D51EB369;
 Tue, 18 Feb 2020 12:21:18 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 18 Feb 2020 13:21:14 +0100
Message-Id: <20200218122114.17596-5-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200218122114.17596-1-jgross@suse.com>
References: <20200218122114.17596-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 4/4] xen/rcu: add assertions to debug build
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

WGVuJ3MgUkNVIGltcGxlbWVudGF0aW9uIHJlbGllcyBvbiBubyBzb2Z0aXJxIGhhbmRsaW5nIHRh
a2luZyBwbGFjZQp3aGlsZSBiZWluZyBpbiBhIFJDVSBjcml0aWNhbCBzZWN0aW9uLiBBZGQgQVNT
RVJUKClzIGluIGRlYnVnIGJ1aWxkcwppbiBvcmRlciB0byBjYXRjaCBhbnkgdmlvbGF0aW9ucy4K
CkZvciB0aGF0IHB1cnBvc2UgbW9kaWZ5IHJjdV9yZWFkX1t1bl1sb2NrKCkgdG8gdXNlIGEgZGVk
aWNhdGVkIHBlcmNwdQpjb3VudGVyIGluc3RlYWQgb2YgcHJlZW1wdF9bZW58ZGlzXWFibGUoKSBh
cyB0aGlzIGVuYWJsZXMgdG8gdGVzdAp0aGF0IGNvbmRpdGlvbiBpbiBfX2RvX3NvZnRpcnEoKSAo
QVNTRVJUX05PVF9JTl9BVE9NSUMoKSBpcyBub3QKdXNhYmxlIHRoZXJlIGR1ZSB0byBfX2NwdV91
cCgpIGNhbGxpbmcgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCkKd2hpbGUgaG9sZGluZyB0aGUg
Y3B1IGhvdHBsdWcgbG9jaykuCgpEcm9wcGluZyB0aGUgbm93IG5vIGxvbmdlciBuZWVkZWQgI2lu
Y2x1ZGUgb2YgcHJlZW1wdC5oIGluIHJjdXBkYXRlLmgKcmVxdWlyZXMgYWRkaW5nIGl0IGluIHNv
bWUgc291cmNlcy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KLS0tCiB4ZW4vY29tbW9uL211bHRpY2FsbC5jICAgICB8ICAxICsKIHhlbi9jb21tb24vcmN1
cGRhdGUuYyAgICAgIHwgIDQgKysrKwogeGVuL2NvbW1vbi9zb2Z0aXJxLmMgICAgICAgfCAgMiAr
KwogeGVuL2NvbW1vbi93YWl0LmMgICAgICAgICAgfCAgMSArCiB4ZW4vaW5jbHVkZS94ZW4vcmN1
cGRhdGUuaCB8IDIxICsrKysrKysrKysrKysrKysrLS0tLQogNSBmaWxlcyBjaGFuZ2VkLCAyNSBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbXVs
dGljYWxsLmMgYi94ZW4vY29tbW9uL211bHRpY2FsbC5jCmluZGV4IDVhMTk5ZWJmOGYuLjY3ZjFh
MjM0ODUgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vbXVsdGljYWxsLmMKKysrIGIveGVuL2NvbW1v
bi9tdWx0aWNhbGwuYwpAQCAtMTAsNiArMTAsNyBAQAogI2luY2x1ZGUgPHhlbi9tdWx0aWNhbGwu
aD4KICNpbmNsdWRlIDx4ZW4vZ3Vlc3RfYWNjZXNzLmg+CiAjaW5jbHVkZSA8eGVuL3BlcmZjLmg+
CisjaW5jbHVkZSA8eGVuL3ByZWVtcHQuaD4KICNpbmNsdWRlIDx4ZW4vdHJhY2UuaD4KICNpbmNs
dWRlIDxhc20vY3VycmVudC5oPgogI2luY2x1ZGUgPGFzbS9oYXJkaXJxLmg+CmRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL3JjdXBkYXRlLmMgYi94ZW4vY29tbW9uL3JjdXBkYXRlLmMKaW5kZXggZTZh
ZGQwYjEyMC4uYjAzZjRiNDRkOSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9yY3VwZGF0ZS5jCisr
KyBiL3hlbi9jb21tb24vcmN1cGRhdGUuYwpAQCAtNDYsNiArNDYsMTAgQEAKICNpbmNsdWRlIDx4
ZW4vY3B1Lmg+CiAjaW5jbHVkZSA8eGVuL3N0b3BfbWFjaGluZS5oPgogCisjaWZuZGVmIE5ERUJV
RworREVGSU5FX1BFUl9DUFUodW5zaWduZWQgaW50LCByY3VfbG9ja19jbnQpOworI2VuZGlmCisK
IC8qIEdsb2JhbCBjb250cm9sIHZhcmlhYmxlcyBmb3IgcmN1cGRhdGUgY2FsbGJhY2sgbWVjaGFu
aXNtLiAqLwogc3RhdGljIHN0cnVjdCByY3VfY3RybGJsayB7CiAgICAgbG9uZyBjdXI7ICAgICAg
ICAgICAvKiBDdXJyZW50IGJhdGNoIG51bWJlci4gICAgICAgICAgICAgICAgICAgICAgKi8KZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vc29mdGlycS5jIGIveGVuL2NvbW1vbi9zb2Z0aXJxLmMKaW5k
ZXggM2ZlNzVjYTNlOC4uMThiZThkYjBjNiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zb2Z0aXJx
LmMKKysrIGIveGVuL2NvbW1vbi9zb2Z0aXJxLmMKQEAgLTMwLDYgKzMwLDggQEAgc3RhdGljIHZv
aWQgX19kb19zb2Z0aXJxKHVuc2lnbmVkIGxvbmcgaWdub3JlX21hc2ssIGJvb2wgcmN1X2FsbG93
ZWQpCiAgICAgdW5zaWduZWQgaW50IGksIGNwdTsKICAgICB1bnNpZ25lZCBsb25nIHBlbmRpbmc7
CiAKKyAgICBBU1NFUlQoIXJjdV9hbGxvd2VkIHx8IHJjdV9xdWllc2NlX2FsbG93ZWQoKSk7CisK
ICAgICBmb3IgKCA7IDsgKQogICAgIHsKICAgICAgICAgLyoKZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vd2FpdC5jIGIveGVuL2NvbW1vbi93YWl0LmMKaW5kZXggMjQ3MTZlNzY3Ni4uOWNkYjE3NDAz
NiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi93YWl0LmMKKysrIGIveGVuL2NvbW1vbi93YWl0LmMK
QEAgLTE5LDYgKzE5LDcgQEAKICAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNl
ZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCiAgKi8KIAorI2luY2x1ZGUgPHhlbi9w
cmVlbXB0Lmg+CiAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+CiAjaW5jbHVkZSA8eGVuL3NvZnRpcnEu
aD4KICNpbmNsdWRlIDx4ZW4vd2FpdC5oPgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3Jj
dXBkYXRlLmggYi94ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaAppbmRleCA4N2YzNWI3NzA0Li5h
NWVlN2ZlYzJiIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaAorKysgYi94
ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaApAQCAtMzQsMTAgKzM0LDIzIEBACiAjaW5jbHVkZSA8
eGVuL2NhY2hlLmg+CiAjaW5jbHVkZSA8eGVuL3NwaW5sb2NrLmg+CiAjaW5jbHVkZSA8eGVuL2Nw
dW1hc2suaD4KLSNpbmNsdWRlIDx4ZW4vcHJlZW1wdC5oPgorI2luY2x1ZGUgPHhlbi9wZXJjcHUu
aD4KIAogI2RlZmluZSBfX3JjdQogCisjaWZuZGVmIE5ERUJVRworREVDTEFSRV9QRVJfQ1BVKHVu
c2lnbmVkIGludCwgcmN1X2xvY2tfY250KTsKKworI2RlZmluZSByY3VfcXVpZXNjZV9kaXNhYmxl
KCkgKHRoaXNfY3B1KHJjdV9sb2NrX2NudCkpKysKKyNkZWZpbmUgcmN1X3F1aWVzY2VfZW5hYmxl
KCkgICh0aGlzX2NwdShyY3VfbG9ja19jbnQpKS0tCisjZGVmaW5lIHJjdV9xdWllc2NlX2FsbG93
ZWQoKSAoIXRoaXNfY3B1KHJjdV9sb2NrX2NudCkpCisKKyNlbHNlCisjZGVmaW5lIHJjdV9xdWll
c2NlX2Rpc2FibGUoKSAoKHZvaWQpMCkKKyNkZWZpbmUgcmN1X3F1aWVzY2VfZW5hYmxlKCkgICgo
dm9pZCkwKQorI2RlZmluZSByY3VfcXVpZXNjZV9hbGxvd2VkKCkgdHJ1ZQorI2VuZGlmCisKIC8q
KgogICogc3RydWN0IHJjdV9oZWFkIC0gY2FsbGJhY2sgc3RydWN0dXJlIGZvciB1c2Ugd2l0aCBS
Q1UKICAqIEBuZXh0OiBuZXh0IHVwZGF0ZSByZXF1ZXN0cyBpbiBhIGxpc3QKQEAgLTkwLDE2ICsx
MDMsMTYgQEAgdHlwZWRlZiBzdHJ1Y3QgX3JjdV9yZWFkX2xvY2sgcmN1X3JlYWRfbG9ja190Owog
ICogd2lsbCBiZSBkZWZlcnJlZCB1bnRpbCB0aGUgb3V0ZXJtb3N0IFJDVSByZWFkLXNpZGUgY3Jp
dGljYWwgc2VjdGlvbgogICogY29tcGxldGVzLgogICoKLSAqIEl0IGlzIGlsbGVnYWwgdG8gYmxv
Y2sgd2hpbGUgaW4gYW4gUkNVIHJlYWQtc2lkZSBjcml0aWNhbCBzZWN0aW9uLgorICogSXQgaXMg
aWxsZWdhbCB0byBwcm9jZXNzIHNvZnRpcnFzIHdoaWxlIGluIGFuIFJDVSByZWFkLXNpZGUgY3Jp
dGljYWwgc2VjdGlvbi4KICAqLwotI2RlZmluZSByY3VfcmVhZF9sb2NrKHgpICAgICAgICh7ICgo
dm9pZCkoeCkpOyBwcmVlbXB0X2Rpc2FibGUoKTsgfSkKKyNkZWZpbmUgcmN1X3JlYWRfbG9jayh4
KSAgICAgICAoeyAoKHZvaWQpKHgpKTsgcmN1X3F1aWVzY2VfZGlzYWJsZSgpOyB9KQogCiAvKioK
ICAqIHJjdV9yZWFkX3VubG9jayAtIG1hcmtzIHRoZSBlbmQgb2YgYW4gUkNVIHJlYWQtc2lkZSBj
cml0aWNhbCBzZWN0aW9uLgogICoKICAqIFNlZSByY3VfcmVhZF9sb2NrKCkgZm9yIG1vcmUgaW5m
b3JtYXRpb24uCiAgKi8KLSNkZWZpbmUgcmN1X3JlYWRfdW5sb2NrKHgpICAgICAoeyAoKHZvaWQp
KHgpKTsgcHJlZW1wdF9lbmFibGUoKTsgfSkKKyNkZWZpbmUgcmN1X3JlYWRfdW5sb2NrKHgpICAg
ICAoeyAoKHZvaWQpKHgpKTsgcmN1X3F1aWVzY2VfZW5hYmxlKCk7IH0pCiAKIC8qCiAgKiBTbyB3
aGVyZSBpcyByY3Vfd3JpdGVfbG9jaygpPyAgSXQgZG9lcyBub3QgZXhpc3QsIGFzIHRoZXJlIGlz
IG5vCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
