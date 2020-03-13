Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BADF184238
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 09:08:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCfJr-0002Nl-Db; Fri, 13 Mar 2020 08:05:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHM7=46=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCfJq-0002NV-5q
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 08:05:22 +0000
X-Inumbo-ID: 621af450-6501-11ea-b29b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 621af450-6501-11ea-b29b-12813bfff9fa;
 Fri, 13 Mar 2020 08:05:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CAB13ACD0;
 Fri, 13 Mar 2020 08:05:19 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 13 Mar 2020 09:05:16 +0100
Message-Id: <20200313080517.28728-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200313080517.28728-1-jgross@suse.com>
References: <20200313080517.28728-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 1/2] xen/rwlocks: call preempt_disable() when
 taking a rwlock
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

U2ltaWxhciB0byBzcGlubG9ja3MgcHJlZW1wdGlvbiBzaG91bGQgYmUgZGlzYWJsZWQgd2hpbGUg
aG9sZGluZyBhCnJ3bG9jay4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmggfCAxOCArKysrKysrKysrKysr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3J3bG9jay5oIGIveGVuL2luY2x1ZGUveGVuL3J3
bG9jay5oCmluZGV4IDFjMjIxZGQwZDkuLjRlZTM0MWExODIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9yd2xvY2suaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vcndsb2NrLmgKQEAgLTIsNiAr
Miw3IEBACiAjZGVmaW5lIF9fUldMT0NLX0hfXwogCiAjaW5jbHVkZSA8eGVuL3BlcmNwdS5oPgor
I2luY2x1ZGUgPHhlbi9wcmVlbXB0Lmg+CiAjaW5jbHVkZSA8eGVuL3NtcC5oPgogI2luY2x1ZGUg
PHhlbi9zcGlubG9jay5oPgogCkBAIC01NywxMCArNTgsMTIgQEAgc3RhdGljIGlubGluZSBpbnQg
X3JlYWRfdHJ5bG9jayhyd2xvY2tfdCAqbG9jaykKICAgICBjbnRzID0gYXRvbWljX3JlYWQoJmxv
Y2stPmNudHMpOwogICAgIGlmICggbGlrZWx5KF9jYW5fcmVhZF9sb2NrKGNudHMpKSApCiAgICAg
eworICAgICAgICBwcmVlbXB0X2Rpc2FibGUoKTsKICAgICAgICAgY250cyA9ICh1MzIpYXRvbWlj
X2FkZF9yZXR1cm4oX1FSX0JJQVMsICZsb2NrLT5jbnRzKTsKICAgICAgICAgaWYgKCBsaWtlbHko
X2Nhbl9yZWFkX2xvY2soY250cykpICkKICAgICAgICAgICAgIHJldHVybiAxOwogICAgICAgICBh
dG9taWNfc3ViKF9RUl9CSUFTLCAmbG9jay0+Y250cyk7CisgICAgICAgIHByZWVtcHRfZW5hYmxl
KCk7CiAgICAgfQogICAgIHJldHVybiAwOwogfQpAQCAtNzMsNiArNzYsNyBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgX3JlYWRfbG9jayhyd2xvY2tfdCAqbG9jaykKIHsKICAgICB1MzIgY250czsKIAor
ICAgIHByZWVtcHRfZGlzYWJsZSgpOwogICAgIGNudHMgPSBhdG9taWNfYWRkX3JldHVybihfUVJf
QklBUywgJmxvY2stPmNudHMpOwogICAgIGlmICggbGlrZWx5KF9jYW5fcmVhZF9sb2NrKGNudHMp
KSApCiAgICAgICAgIHJldHVybjsKQEAgLTEwNiw2ICsxMTAsNyBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgX3JlYWRfdW5sb2NrKHJ3bG9ja190ICpsb2NrKQogICAgICAqIEF0b21pY2FsbHkgZGVjcmVt
ZW50IHRoZSByZWFkZXIgY291bnQKICAgICAgKi8KICAgICBhdG9taWNfc3ViKF9RUl9CSUFTLCAm
bG9jay0+Y250cyk7CisgICAgcHJlZW1wdF9lbmFibGUoKTsKIH0KIAogc3RhdGljIGlubGluZSB2
b2lkIF9yZWFkX3VubG9ja19pcnEocndsb2NrX3QgKmxvY2spCkBAIC0xMzcsNiArMTQyLDcgQEAg
c3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgX3dyaXRlX2xvY2tfdmFsKHZvaWQpCiBzdGF0aWMg
aW5saW5lIHZvaWQgX3dyaXRlX2xvY2socndsb2NrX3QgKmxvY2spCiB7CiAgICAgLyogT3B0aW1p
emUgZm9yIHRoZSB1bmZhaXIgbG9jayBjYXNlIHdoZXJlIHRoZSBmYWlyIGZsYWcgaXMgMC4gKi8K
KyAgICBwcmVlbXB0X2Rpc2FibGUoKTsKICAgICBpZiAoIGF0b21pY19jbXB4Y2hnKCZsb2NrLT5j
bnRzLCAwLCBfd3JpdGVfbG9ja192YWwoKSkgPT0gMCApCiAgICAgICAgIHJldHVybjsKIApAQCAt
MTcyLDEzICsxNzgsMjEgQEAgc3RhdGljIGlubGluZSBpbnQgX3dyaXRlX3RyeWxvY2socndsb2Nr
X3QgKmxvY2spCiAgICAgaWYgKCB1bmxpa2VseShjbnRzKSApCiAgICAgICAgIHJldHVybiAwOwog
Ci0gICAgcmV0dXJuIGxpa2VseShhdG9taWNfY21weGNoZygmbG9jay0+Y250cywgMCwgX3dyaXRl
X2xvY2tfdmFsKCkpID09IDApOworICAgIHByZWVtcHRfZGlzYWJsZSgpOworICAgIGlmICggdW5s
aWtlbHkoYXRvbWljX2NtcHhjaGcoJmxvY2stPmNudHMsIDAsIF93cml0ZV9sb2NrX3ZhbCgpKSAh
PSAwKSApCisgICAgeworICAgICAgICBwcmVlbXB0X2VuYWJsZSgpOworICAgICAgICByZXR1cm4g
MDsKKyAgICB9CisKKyAgICByZXR1cm4gMTsKIH0KIAogc3RhdGljIGlubGluZSB2b2lkIF93cml0
ZV91bmxvY2socndsb2NrX3QgKmxvY2spCiB7CiAgICAgQVNTRVJUKF9pc193cml0ZV9sb2NrZWRf
YnlfbWUoYXRvbWljX3JlYWQoJmxvY2stPmNudHMpKSk7CiAgICAgYXRvbWljX2FuZCh+KF9RV19D
UFVNQVNLIHwgX1FXX1dNQVNLKSwgJmxvY2stPmNudHMpOworICAgIHByZWVtcHRfZW5hYmxlKCk7
CiB9CiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBfd3JpdGVfdW5sb2NrX2lycShyd2xvY2tfdCAqbG9j
aykKQEAgLTI3NCw2ICsyODgsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX3BlcmNwdV9yZWFkX2xv
Y2socGVyY3B1X3J3bG9ja190ICoqcGVyX2NwdWRhdGEsCiAgICAgfQogCiAgICAgLyogSW5kaWNh
dGUgdGhpcyBjcHUgaXMgcmVhZGluZy4gKi8KKyAgICBwcmVlbXB0X2Rpc2FibGUoKTsKICAgICB0
aGlzX2NwdV9wdHIocGVyX2NwdWRhdGEpID0gcGVyY3B1X3J3bG9jazsKICAgICBzbXBfbWIoKTsK
ICAgICAvKiBDaGVjayBpZiBhIHdyaXRlciBpcyB3YWl0aW5nLiAqLwpAQCAtMzA4LDYgKzMyMyw3
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfcGVyY3B1X3JlYWRfdW5sb2NrKHBlcmNwdV9yd2xvY2tf
dCAqKnBlcl9jcHVkYXRhLAogICAgICAgICByZXR1cm47CiAgICAgfQogICAgIHRoaXNfY3B1X3B0
cihwZXJfY3B1ZGF0YSkgPSBOVUxMOworICAgIHByZWVtcHRfZW5hYmxlKCk7CiAgICAgc21wX3dt
YigpOwogfQogCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
