Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 782611C849
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:14:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWHZ-0006Ey-E8; Tue, 14 May 2019 12:11:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWHY-0006EZ-6Q
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:11:44 +0000
X-Inumbo-ID: 6f4ff7aa-7641-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 6f4ff7aa-7641-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:11:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EA4C15AD;
 Tue, 14 May 2019 05:11:42 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF6C83F71E;
 Tue, 14 May 2019 05:11:40 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:11:26 +0100
Message-Id: <20190514121132.26732-3-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514121132.26732-1-julien.grall@arm.com>
References: <20190514121132.26732-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART1 v3 2/8] xen/arm: mm: Consolidate
 setting SCTLR_EL2.WXN in a single place
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGxvZ2ljIHRvIHNldCBTQ1RMUl9FTDIuV1hOIGlzIHRoZSBzYW1lIGZvciB0aGUgYm9vdCBD
UFUgYW5kCm5vbi1ib290IENQVS4gU28gaW50cm9kdWNlIGEgZnVuY3Rpb24gdG8gc2V0IHRoZSBi
aXQgYW5kIGNsZWFyIFRMQnMuCgpUaGlzIG5ldyBmdW5jdGlvbiB3aWxsIGhlbHAgdXMgdG8gZG9j
dW1lbnQgYW5kIHVwZGF0ZSB0aGUgbG9naWMgaW4gYQpzaW5nbGUgcGxhY2UuCgpTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogQW5k
cmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KUmV2aWV3ZWQtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCi0tLQogICAgQ2hhbmdlcyBpbiB2
MzoKICAgICAgICAtIEFkZCBTdGVmYW5vJ3MgcmV2aWV3ZWQtYnkKCiAgICBDaGFuZ2VzIGluIHYy
OgogICAgICAgIC0gRml4IHR5cG8gaW4gdGhlIGNvbW1pdCBtZXNzYWdlCiAgICAgICAgLSBBZGQg
QW5kcmlpJ3MgcmV2aWV3ZWQtYnkKLS0tCiB4ZW4vYXJjaC9hcm0vbW0uYyB8IDIyICsrKysrKysr
KysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21t
LmMKaW5kZXggMDFhZTJjY2NjMC4uOTNhZDExODE4MyAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJt
L21tLmMKKysrIGIveGVuL2FyY2gvYXJtL21tLmMKQEAgLTYwMSw2ICs2MDEsMTkgQEAgdm9pZCBf
X2luaXQgcmVtb3ZlX2Vhcmx5X21hcHBpbmdzKHZvaWQpCiAgICAgZmx1c2hfeGVuX2RhdGFfdGxi
X3JhbmdlX3ZhKEJPT1RfRkRUX1ZJUlRfU1RBUlQsIEJPT1RfRkRUX1NMT1RfU0laRSk7CiB9CiAK
Ky8qCisgKiBBZnRlciBib290LCBYZW4gcGFnZS10YWJsZXMgc2hvdWxkIG5vdCBjb250YWluIG1h
cHBpbmcgdGhhdCBhcmUgYm90aAorICogV3JpdGFibGUgYW5kIGVYZWN1dGFibGVzLgorICoKKyAq
IFRoaXMgc2hvdWxkIGJlIGNhbGxlZCBvbiBlYWNoIENQVSB0byBlbmZvcmNlIHRoZSBwb2xpY3ku
CisgKi8KK3N0YXRpYyB2b2lkIHhlbl9wdF9lbmZvcmNlX3dueCh2b2lkKQoreworICAgIFdSSVRF
X1NZU1JFRzMyKFJFQURfU1lTUkVHMzIoU0NUTFJfRUwyKSB8IFNDVExSX1dYTiwgU0NUTFJfRUwy
KTsKKyAgICAvKiBGbHVzaCBldmVyeXRoaW5nIGFmdGVyIHNldHRpbmcgV1hOIGJpdC4gKi8KKyAg
ICBmbHVzaF94ZW5fdGV4dF90bGJfbG9jYWwoKTsKK30KKwogZXh0ZXJuIHZvaWQgc3dpdGNoX3R0
YnIodWludDY0X3QgdHRicik7CiAKIC8qIENsZWFyIGEgdHJhbnNsYXRpb24gdGFibGUgYW5kIGNs
ZWFuICYgaW52YWxpZGF0ZSB0aGUgY2FjaGUgKi8KQEAgLTcwMiwxMCArNzE1LDcgQEAgdm9pZCBf
X2luaXQgc2V0dXBfcGFnZXRhYmxlcyh1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQpCiAg
ICAgY2xlYXJfdGFibGUoYm9vdF9zZWNvbmQpOwogICAgIGNsZWFyX3RhYmxlKGJvb3RfdGhpcmQp
OwogCi0gICAgLyogRnJvbSBub3cgb24sIG5vIG1hcHBpbmcgbWF5IGJlIGJvdGggd3JpdGFibGUg
YW5kIGV4ZWN1dGFibGUuICovCi0gICAgV1JJVEVfU1lTUkVHMzIoUkVBRF9TWVNSRUczMihTQ1RM
Ul9FTDIpIHwgU0NUTFJfV1hOLCBTQ1RMUl9FTDIpOwotICAgIC8qIEZsdXNoIGV2ZXJ5dGhpbmcg
YWZ0ZXIgc2V0dGluZyBXWE4gYml0LiAqLwotICAgIGZsdXNoX3hlbl90ZXh0X3RsYl9sb2NhbCgp
OworICAgIHhlbl9wdF9lbmZvcmNlX3dueCgpOwogCiAjaWZkZWYgQ09ORklHX0FSTV8zMgogICAg
IHBlcl9jcHUoeGVuX3BndGFibGUsIDApID0gY3B1MF9wZ3RhYmxlOwpAQCAtNzc3LDkgKzc4Nyw3
IEBAIGludCBpbml0X3NlY29uZGFyeV9wYWdldGFibGVzKGludCBjcHUpCiAvKiBNTVUgc2V0dXAg
Zm9yIHNlY29uZGFyeSBDUFVTICh3aGljaCBhbHJlYWR5IGhhdmUgcGFnaW5nIGVuYWJsZWQpICov
CiB2b2lkIG1tdV9pbml0X3NlY29uZGFyeV9jcHUodm9pZCkKIHsKLSAgICAvKiBGcm9tIG5vdyBv
biwgbm8gbWFwcGluZyBtYXkgYmUgYm90aCB3cml0YWJsZSBhbmQgZXhlY3V0YWJsZS4gKi8KLSAg
ICBXUklURV9TWVNSRUczMihSRUFEX1NZU1JFRzMyKFNDVExSX0VMMikgfCBTQ1RMUl9XWE4sIFND
VExSX0VMMik7Ci0gICAgZmx1c2hfeGVuX3RleHRfdGxiX2xvY2FsKCk7CisgICAgeGVuX3B0X2Vu
Zm9yY2Vfd254KCk7CiB9CiAKICNpZmRlZiBDT05GSUdfQVJNXzMyCi0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
