Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E547618499C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 15:40:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jClRp-0000au-Dl; Fri, 13 Mar 2020 14:38:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHM7=46=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jClRo-0000ak-Po
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 14:38:00 +0000
X-Inumbo-ID: 3c5eb198-6538-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c5eb198-6538-11ea-92cf-bc764e2007e4;
 Fri, 13 Mar 2020 14:38:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6971AD03;
 Fri, 13 Mar 2020 14:37:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 13 Mar 2020 15:37:55 +0100
Message-Id: <20200313143755.31870-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200313143755.31870-1-jgross@suse.com>
References: <20200313143755.31870-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 2/2] xen/spinlocks: fix placement of
 preempt_[dis|en]able()
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

SW4gY2FzZSBYZW4gZXZlciBnYWlucyBwcmVlbXB0aW9uIHN1cHBvcnQgdGhlIHNwaW5sb2NrIGNv
ZGluZydzCnBsYWNlbWVudCBvZiBwcmVlbXB0X2Rpc2FibGUoKSBhbmQgcHJlZW1wdF9lbmFibGUo
KSBzaG91bGQgYmUgb3V0c2lkZQpvZiB0aGUgbG9ja2VkIHNlY3Rpb24uCgpTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQpWMjoKLSBtb3ZlIHByZWVtcHRf
ZW5hYmxlKCkgdG8gdGhlIHZlcnkgZW5kIG9mIF9zcGluX3VubG9jaygpIChKYW4gQmV1bGljaCkK
LS0tCiB4ZW4vY29tbW9uL3NwaW5sb2NrLmMgfCA5ICsrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9u
L3NwaW5sb2NrLmMgYi94ZW4vY29tbW9uL3NwaW5sb2NrLmMKaW5kZXggMzQ0OTgxYzU0YS4uNmM4
YjYyYmViMCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zcGlubG9jay5jCisrKyBiL3hlbi9jb21t
b24vc3BpbmxvY2suYwpAQCAtMTYwLDYgKzE2MCw3IEBAIHZvaWQgaW5saW5lIF9zcGluX2xvY2tf
Y2Ioc3BpbmxvY2tfdCAqbG9jaywgdm9pZCAoKmNiKSh2b2lkICopLCB2b2lkICpkYXRhKQogICAg
IExPQ0tfUFJPRklMRV9WQVI7CiAKICAgICBjaGVja19sb2NrKCZsb2NrLT5kZWJ1Zyk7CisgICAg
cHJlZW1wdF9kaXNhYmxlKCk7CiAgICAgdGlja2V0cy5oZWFkX3RhaWwgPSBhcmNoX2ZldGNoX2Fu
ZF9hZGQoJmxvY2stPnRpY2tldHMuaGVhZF90YWlsLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHRpY2tldHMuaGVhZF90YWlsKTsKICAgICB3aGlsZSAoIHRpY2tl
dHMudGFpbCAhPSBvYnNlcnZlX2hlYWQoJmxvY2stPnRpY2tldHMpICkKQEAgLTE3MSw3ICsxNzIs
NiBAQCB2b2lkIGlubGluZSBfc3Bpbl9sb2NrX2NiKHNwaW5sb2NrX3QgKmxvY2ssIHZvaWQgKCpj
Yikodm9pZCAqKSwgdm9pZCAqZGF0YSkKICAgICB9CiAgICAgZ290X2xvY2soJmxvY2stPmRlYnVn
KTsKICAgICBMT0NLX1BST0ZJTEVfR09UOwotICAgIHByZWVtcHRfZGlzYWJsZSgpOwogICAgIGFy
Y2hfbG9ja19hY3F1aXJlX2JhcnJpZXIoKTsKIH0KIApAQCAtMTk5LDExICsxOTksMTEgQEAgdW5z
aWduZWQgbG9uZyBfc3Bpbl9sb2NrX2lycXNhdmUoc3BpbmxvY2tfdCAqbG9jaykKIHZvaWQgX3Nw
aW5fdW5sb2NrKHNwaW5sb2NrX3QgKmxvY2spCiB7CiAgICAgYXJjaF9sb2NrX3JlbGVhc2VfYmFy
cmllcigpOwotICAgIHByZWVtcHRfZW5hYmxlKCk7CiAgICAgTE9DS19QUk9GSUxFX1JFTDsKICAg
ICByZWxfbG9jaygmbG9jay0+ZGVidWcpOwogICAgIGFkZF9zaXplZCgmbG9jay0+dGlja2V0cy5o
ZWFkLCAxKTsKICAgICBhcmNoX2xvY2tfc2lnbmFsKCk7CisgICAgcHJlZW1wdF9lbmFibGUoKTsK
IH0KIAogdm9pZCBfc3Bpbl91bmxvY2tfaXJxKHNwaW5sb2NrX3QgKmxvY2spCkBAIC0yNDIsMTUg
KzI0MiwxOCBAQCBpbnQgX3NwaW5fdHJ5bG9jayhzcGlubG9ja190ICpsb2NrKQogICAgICAgICBy
ZXR1cm4gMDsKICAgICBuZXcgPSBvbGQ7CiAgICAgbmV3LnRhaWwrKzsKKyAgICBwcmVlbXB0X2Rp
c2FibGUoKTsKICAgICBpZiAoIGNtcHhjaGcoJmxvY2stPnRpY2tldHMuaGVhZF90YWlsLAogICAg
ICAgICAgICAgICAgICBvbGQuaGVhZF90YWlsLCBuZXcuaGVhZF90YWlsKSAhPSBvbGQuaGVhZF90
YWlsICkKKyAgICB7CisgICAgICAgIHByZWVtcHRfZW5hYmxlKCk7CiAgICAgICAgIHJldHVybiAw
OworICAgIH0KICAgICBnb3RfbG9jaygmbG9jay0+ZGVidWcpOwogI2lmZGVmIENPTkZJR19ERUJV
R19MT0NLX1BST0ZJTEUKICAgICBpZiAobG9jay0+cHJvZmlsZSkKICAgICAgICAgbG9jay0+cHJv
ZmlsZS0+dGltZV9sb2NrZWQgPSBOT1coKTsKICNlbmRpZgotICAgIHByZWVtcHRfZGlzYWJsZSgp
OwogICAgIC8qCiAgICAgICogY21weGNoZygpIGlzIGEgZnVsbCBiYXJyaWVyIHNvIG5vIG5lZWQg
Zm9yIGFuCiAgICAgICogYXJjaF9sb2NrX2FjcXVpcmVfYmFycmllcigpLgotLSAKMi4xNi40CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
