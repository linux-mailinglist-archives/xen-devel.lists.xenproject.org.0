Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2390716FF4C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 13:49:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6w5n-0002Ah-6d; Wed, 26 Feb 2020 12:47:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IXf/=4O=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j6w5l-0002AX-KR
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 12:47:09 +0000
X-Inumbo-ID: 19ab1564-5896-11ea-a490-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19ab1564-5896-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 12:47:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B2508AC6E;
 Wed, 26 Feb 2020 12:47:07 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 26 Feb 2020 13:46:54 +0100
Message-Id: <20200226124705.29212-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200226124705.29212-1-jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v6 01/12] xen: allow only sizeof(bool) variables
 for boolean_param()
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3VwcG9ydCBvZiBvdGhlciB2YXJpYWJsZSBzaXplcyB0aGFuIHRoYXQgb2Ygbm9ybWFsIGJvb2wg
b25lcyBmb3IKYm9vbGVhbl9wYXJhbWV0ZXIoKSBkb24ndCBtYWtlIHNlbnNlLCBzbyBjYXRjaCBh
bnkgb3RoZXIgc2l6ZWQKdmFyaWFibGVzIGF0IGJ1aWxkIHRpbWUuCgpGaXggdGhlIG9uZSBwYXJh
bWV0ZXIgdXNpbmcgYSBwbGFpbiBpbnQgaW5zdGVhZCBvZiBib29sLgoKU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KVjY6Ci0gbmV3IHBhdGNoCi0tLQog
eGVuL2FyY2gveDg2L2h2bS9hc2lkLmMgfCAyICstCiB4ZW4vaW5jbHVkZS94ZW4vcGFyYW0uaCB8
IDggKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vYXNpZC5jIGIveGVuL2FyY2gveDg2
L2h2bS9hc2lkLmMKaW5kZXggOGUwMGEyODQ0My4uOGI1YmI4NmRmZCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L2h2bS9hc2lkLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9hc2lkLmMKQEAgLTI1
LDcgKzI1LDcgQEAKICNpbmNsdWRlIDxhc20vaHZtL2FzaWQuaD4KIAogLyogWGVuIGNvbW1hbmQt
bGluZSBvcHRpb24gdG8gZW5hYmxlIEFTSURzICovCi1zdGF0aWMgaW50IG9wdF9hc2lkX2VuYWJs
ZWQgPSAxOworc3RhdGljIGJvb2wgb3B0X2FzaWRfZW5hYmxlZCA9IHRydWU7CiBib29sZWFuX3Bh
cmFtKCJhc2lkIiwgb3B0X2FzaWRfZW5hYmxlZCk7CiAKIC8qCmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS94ZW4vcGFyYW0uaCBiL3hlbi9pbmNsdWRlL3hlbi9wYXJhbS5oCmluZGV4IDc1NDcxZWI0
YWQuLmQ0NTc4Y2QyN2YgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wYXJhbS5oCisrKyBi
L3hlbi9pbmNsdWRlL3hlbi9wYXJhbS5oCkBAIC0yLDYgKzIsOCBAQAogI2RlZmluZSBfWEVOX1BB
UkFNX0gKIAogI2luY2x1ZGUgPHhlbi9pbml0Lmg+CisjaW5jbHVkZSA8eGVuL2xpYi5oPgorI2lu
Y2x1ZGUgPHhlbi9zdGRib29sLmg+CiAKIC8qCiAgKiBVc2VkIGZvciBrZXJuZWwgY29tbWFuZCBs
aW5lIHBhcmFtZXRlciBzZXR1cApAQCAtNDYsNyArNDgsOCBAQCBleHRlcm4gY29uc3Qgc3RydWN0
IGtlcm5lbF9wYXJhbSBfX3BhcmFtX3N0YXJ0W10sIF9fcGFyYW1fZW5kW107CiAgICAgX19rcGFy
YW0gX19zZXR1cF8jI192YXIgPSBcCiAgICAgICAgIHsgLm5hbWUgPSBfX3NldHVwX3N0cl8jI192
YXIsIFwKICAgICAgICAgICAudHlwZSA9IE9QVF9CT09MLCBcCi0gICAgICAgICAgLmxlbiA9IHNp
emVvZihfdmFyKSwgXAorICAgICAgICAgIC5sZW4gPSBzaXplb2YoX3ZhcikgKyBcCisgICAgICAg
ICAgICAgICAgIEJVSUxEX0JVR19PTl9aRVJPKHNpemVvZihfdmFyKSAhPSBzaXplb2YoYm9vbCkp
LCBcCiAgICAgICAgICAgLnBhci52YXIgPSAmX3ZhciB9CiAjZGVmaW5lIGludGVnZXJfcGFyYW0o
X25hbWUsIF92YXIpIFwKICAgICBfX3NldHVwX3N0ciBfX3NldHVwX3N0cl8jI192YXJbXSA9IF9u
YW1lOyBcCkBAIC04Niw3ICs4OSw4IEBAIGV4dGVybiBjb25zdCBzdHJ1Y3Qga2VybmVsX3BhcmFt
IF9fcGFyYW1fc3RhcnRbXSwgX19wYXJhbV9lbmRbXTsKICAgICBfX3J0cGFyYW0gX19ydHBhcl8j
I192YXIgPSBcCiAgICAgICAgIHsgLm5hbWUgPSBfbmFtZSwgXAogICAgICAgICAgIC50eXBlID0g
T1BUX0JPT0wsIFwKLSAgICAgICAgICAubGVuID0gc2l6ZW9mKF92YXIpLCBcCisgICAgICAgICAg
LmxlbiA9IHNpemVvZihfdmFyKSArIFwKKyAgICAgICAgICAgICAgICAgQlVJTERfQlVHX09OX1pF
Uk8oc2l6ZW9mKF92YXIpICE9IHNpemVvZihib29sKSksIFwKICAgICAgICAgICAucGFyLnZhciA9
ICZfdmFyIH0KICNkZWZpbmUgaW50ZWdlcl9ydW50aW1lX29ubHlfcGFyYW0oX25hbWUsIF92YXIp
IFwKICAgICBfX3J0cGFyYW0gX19ydHBhcl8jI192YXIgPSBcCi0tIAoyLjE2LjQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
