Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD07A3BCF0
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:34:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQ25-0007rM-66; Mon, 10 Jun 2019 19:32:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQ22-0007nw-Sw
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:32:38 +0000
X-Inumbo-ID: 815a49c3-8bb6-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 815a49c3-8bb6-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 19:32:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF725344;
 Mon, 10 Jun 2019 12:32:37 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 131E73F73C;
 Mon, 10 Jun 2019 12:32:36 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 10 Jun 2019 20:32:14 +0100
Message-Id: <20190610193215.23704-17-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190610193215.23704-1-julien.grall@arm.com>
References: <20190610193215.23704-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 16/17] xen/arm64: head: Rework and document
 launch()
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
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Qm9vdCBDUFUgYW5kIHNlY29uZGFyeSBDUFVzIHdpbGwgdXNlIGRpZmZlcmVudCBlbnRyeSBwb2lu
dCB0byBDIGNvZGUuIEF0CnRoZSBtb21lbnQsIHRoZSBkZWNpc2lvbiBvbiB3aGljaCBlbnRyeSB0
byB1c2UgaXMgdGFrZW4gd2l0aGluIGxhdW5jaCgpLgoKSW4gb3JkZXIgdG8gYXZvaWQgYSBicmFu
Y2ggZm9yIHRoZSBkZWNpc2lvbiBhbmQgbWFrZSB0aGUgY29kZSBjbGVhcmVyLApsYXVuY2goKSBp
cyByZXdvcmtlZCB0byB0YWtlIGluIHBhcmFtZXRlcnMgdGhlIGVudHJ5IHBvaW50IGFuZCBpdHMK
YXJndW1lbnRzLgoKTGFzdGx5LCBkb2N1bWVudCB0aGUgYmVoYXZpb3IgYW5kIHRoZSBtYWluIHJl
Z2lzdGVycyB1c2FnZSB3aXRoaW4gdGhlCmZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVh
ZC5TIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwpp
bmRleCA0ZjdmYTY3NjlmLi4xMzBhYjY2ZDhlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJt
NjQvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKQEAgLTMxMiw2ICszMTIs
MTEgQEAgcHJpbWFyeV9zd2l0Y2hlZDoKICAgICAgICAgLyogVXNlIGEgdmlydHVhbCBhZGRyZXNz
IHRvIGFjY2VzcyB0aGUgVUFSVC4gKi8KICAgICAgICAgbGRyICAgeDIzLCA9RUFSTFlfVUFSVF9W
SVJUVUFMX0FERFJFU1MKICNlbmRpZgorICAgICAgICBQUklOVCgiLSBSZWFkeSAtXHJcbiIpCisg
ICAgICAgIC8qIFNldHVwIHRoZSBhcmd1bWVudHMgZm9yIHN0YXJ0X3hlbiBhbmQganVtcCB0byBD
IHdvcmxkICovCisgICAgICAgIG1vdiAgIHgwLCB4MjAgICAgICAgICAgICAgICAgLyogeDAgOj0g
cGh5c19vZmZzZXQgKi8KKyAgICAgICAgbW92ICAgeDEsIHgyMSAgICAgICAgICAgICAgICAvKiB4
MSA6PSBwYWRkcihGRFQpICovCisgICAgICAgIGxkciAgIHgyLCA9c3RhcnRfeGVuCiAgICAgICAg
IGIgICAgIGxhdW5jaAogRU5EUFJPQyhyZWFsX3N0YXJ0KQogCkBAIC0zNzQsNiArMzc5LDkgQEAg
c2Vjb25kYXJ5X3N3aXRjaGVkOgogICAgICAgICAvKiBVc2UgYSB2aXJ0dWFsIGFkZHJlc3MgdG8g
YWNjZXNzIHRoZSBVQVJULiAqLwogICAgICAgICBsZHIgICB4MjMsID1FQVJMWV9VQVJUX1ZJUlRV
QUxfQUREUkVTUwogI2VuZGlmCisgICAgICAgIFBSSU5UKCItIFJlYWR5IC1cclxuIikKKyAgICAg
ICAgLyogSnVtcCB0byBDIHdvcmxkICovCisgICAgICAgIGxkciAgIHgyLCA9c3RhcnRfc2Vjb25k
YXJ5CiAgICAgICAgIGIgICAgIGxhdW5jaAogRU5EUFJPQyhpbml0X3NlY29uZGFyeSkKIApAQCAt
NzM0LDIzICs3NDIsMjQgQEAgc2V0dXBfZml4bWFwOgogICAgICAgICByZXQKIEVORFBST0Moc2V0
dXBfZml4bWFwKQogCisvKgorICogU2V0dXAgdGhlIGluaXRpYWwgc3RhY2sgYW5kIGp1bXAgdG8g
dGhlIEMgd29ybGQKKyAqCisgKiBJbnB1dHM6CisgKiAgIHgwIDogQXJndW1lbnQgMCBvZiB0aGUg
QyBmdW5jdGlvbiB0byBjYWxsCisgKiAgIHgxIDogQXJndW1lbnQgMSBvZiB0aGUgQyBmdW5jdGlv
biB0byBjYWxsCisgKiAgIHgyIDogQyBlbnRyeSBwb2ludAorICovCiBsYXVuY2g6Ci0gICAgICAg
IFBSSU5UKCItIFJlYWR5IC1cclxuIikKLQotICAgICAgICBsZHIgICB4MCwgPWluaXRfZGF0YQot
ICAgICAgICBhZGQgICB4MCwgeDAsICNJTklUSU5GT19zdGFjayAvKiBGaW5kIHRoZSBib290LXRp
bWUgc3RhY2sgKi8KLSAgICAgICAgbGRyICAgeDAsIFt4MF0KLSAgICAgICAgYWRkICAgeDAsIHgw
LCAjU1RBQ0tfU0laRSAgICAvKiAod2hpY2ggZ3Jvd3MgZG93biBmcm9tIHRoZSB0b3ApLiAqLwot
ICAgICAgICBzdWIgICB4MCwgeDAsICNDUFVJTkZPX3NpemVvZiAvKiBNYWtlIHJvb20gZm9yIENQ
VSBzYXZlIHJlY29yZCAqLwotICAgICAgICBtb3YgICBzcCwgeDAKLQotICAgICAgICBjYm56ICB4
MjIsIDFmCi0KLSAgICAgICAgbW92ICAgeDAsIHgyMCAgICAgICAgICAgICAgICAvKiBNYXJzaGFs
IGFyZ3M6IC0gcGh5c19vZmZzZXQgKi8KLSAgICAgICAgbW92ICAgeDEsIHgyMSAgICAgICAgICAg
ICAgICAvKiAgICAgICAgICAgICAgIC0gRkRUICovCi0gICAgICAgIGIgICAgIHN0YXJ0X3hlbiAg
ICAgICAgICAgICAgLyogYW5kIGRpc2FwcGVhciBpbnRvIHRoZSBsYW5kIG9mIEMgKi8KLTE6Ci0g
ICAgICAgIGIgICAgIHN0YXJ0X3NlY29uZGFyeSAgICAgICAgLyogKHRvIHRoZSBhcHByb3ByaWF0
ZSBlbnRyeSBwb2ludCkgKi8KKyAgICAgICAgbGRyICAgeDQsID1pbml0X2RhdGEKKyAgICAgICAg
YWRkICAgeDQsIHg0LCAjSU5JVElORk9fc3RhY2sgLyogRmluZCB0aGUgYm9vdC10aW1lIHN0YWNr
ICovCisgICAgICAgIGxkciAgIHg0LCBbeDRdCisgICAgICAgIGFkZCAgIHg0LCB4NCwgI1NUQUNL
X1NJWkUgICAgLyogKHdoaWNoIGdyb3dzIGRvd24gZnJvbSB0aGUgdG9wKS4gKi8KKyAgICAgICAg
c3ViICAgeDQsIHg0LCAjQ1BVSU5GT19zaXplb2YgLyogTWFrZSByb29tIGZvciBDUFUgc2F2ZSBy
ZWNvcmQgKi8KKyAgICAgICAgbW92ICAgc3AsIHg0CisKKyAgICAgICAgLyogSnVtcCB0byBDIHdv
cmxkICovCisgICAgICAgIGJyICAgIHgyCiBFTkRQUk9DKGxhdW5jaCkKIAogLyogRmFpbC1zdG9w
ICovCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
