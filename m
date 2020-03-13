Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE86A18423C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 09:09:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCfJw-0002PQ-OG; Fri, 13 Mar 2020 08:05:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHM7=46=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCfJv-0002P5-0F
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 08:05:27 +0000
X-Inumbo-ID: 621a4456-6501-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 621a4456-6501-11ea-bec1-bc764e2007e4;
 Fri, 13 Mar 2020 08:05:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0456CAD03;
 Fri, 13 Mar 2020 08:05:20 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 13 Mar 2020 09:05:17 +0100
Message-Id: <20200313080517.28728-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200313080517.28728-1-jgross@suse.com>
References: <20200313080517.28728-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 2/2] xen/spinlocks: fix placement of
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
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zcGlubG9j
ay5jIHwgOSArKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zcGlubG9jay5jIGIveGVuL2NvbW1v
bi9zcGlubG9jay5jCmluZGV4IDM0NDk4MWM1NGEuLmYwNWZiMDY4Y2QgMTAwNjQ0Ci0tLSBhL3hl
bi9jb21tb24vc3BpbmxvY2suYworKysgYi94ZW4vY29tbW9uL3NwaW5sb2NrLmMKQEAgLTE2MCw2
ICsxNjAsNyBAQCB2b2lkIGlubGluZSBfc3Bpbl9sb2NrX2NiKHNwaW5sb2NrX3QgKmxvY2ssIHZv
aWQgKCpjYikodm9pZCAqKSwgdm9pZCAqZGF0YSkKICAgICBMT0NLX1BST0ZJTEVfVkFSOwogCiAg
ICAgY2hlY2tfbG9jaygmbG9jay0+ZGVidWcpOworICAgIHByZWVtcHRfZGlzYWJsZSgpOwogICAg
IHRpY2tldHMuaGVhZF90YWlsID0gYXJjaF9mZXRjaF9hbmRfYWRkKCZsb2NrLT50aWNrZXRzLmhl
YWRfdGFpbCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aWNr
ZXRzLmhlYWRfdGFpbCk7CiAgICAgd2hpbGUgKCB0aWNrZXRzLnRhaWwgIT0gb2JzZXJ2ZV9oZWFk
KCZsb2NrLT50aWNrZXRzKSApCkBAIC0xNzEsNyArMTcyLDYgQEAgdm9pZCBpbmxpbmUgX3NwaW5f
bG9ja19jYihzcGlubG9ja190ICpsb2NrLCB2b2lkICgqY2IpKHZvaWQgKiksIHZvaWQgKmRhdGEp
CiAgICAgfQogICAgIGdvdF9sb2NrKCZsb2NrLT5kZWJ1Zyk7CiAgICAgTE9DS19QUk9GSUxFX0dP
VDsKLSAgICBwcmVlbXB0X2Rpc2FibGUoKTsKICAgICBhcmNoX2xvY2tfYWNxdWlyZV9iYXJyaWVy
KCk7CiB9CiAKQEAgLTE5OSwxMCArMTk5LDEwIEBAIHVuc2lnbmVkIGxvbmcgX3NwaW5fbG9ja19p
cnFzYXZlKHNwaW5sb2NrX3QgKmxvY2spCiB2b2lkIF9zcGluX3VubG9jayhzcGlubG9ja190ICps
b2NrKQogewogICAgIGFyY2hfbG9ja19yZWxlYXNlX2JhcnJpZXIoKTsKLSAgICBwcmVlbXB0X2Vu
YWJsZSgpOwogICAgIExPQ0tfUFJPRklMRV9SRUw7CiAgICAgcmVsX2xvY2soJmxvY2stPmRlYnVn
KTsKICAgICBhZGRfc2l6ZWQoJmxvY2stPnRpY2tldHMuaGVhZCwgMSk7CisgICAgcHJlZW1wdF9l
bmFibGUoKTsKICAgICBhcmNoX2xvY2tfc2lnbmFsKCk7CiB9CiAKQEAgLTI0MiwxNSArMjQyLDE4
IEBAIGludCBfc3Bpbl90cnlsb2NrKHNwaW5sb2NrX3QgKmxvY2spCiAgICAgICAgIHJldHVybiAw
OwogICAgIG5ldyA9IG9sZDsKICAgICBuZXcudGFpbCsrOworICAgIHByZWVtcHRfZGlzYWJsZSgp
OwogICAgIGlmICggY21weGNoZygmbG9jay0+dGlja2V0cy5oZWFkX3RhaWwsCiAgICAgICAgICAg
ICAgICAgIG9sZC5oZWFkX3RhaWwsIG5ldy5oZWFkX3RhaWwpICE9IG9sZC5oZWFkX3RhaWwgKQor
ICAgIHsKKyAgICAgICAgcHJlZW1wdF9lbmFibGUoKTsKICAgICAgICAgcmV0dXJuIDA7CisgICAg
fQogICAgIGdvdF9sb2NrKCZsb2NrLT5kZWJ1Zyk7CiAjaWZkZWYgQ09ORklHX0RFQlVHX0xPQ0tf
UFJPRklMRQogICAgIGlmIChsb2NrLT5wcm9maWxlKQogICAgICAgICBsb2NrLT5wcm9maWxlLT50
aW1lX2xvY2tlZCA9IE5PVygpOwogI2VuZGlmCi0gICAgcHJlZW1wdF9kaXNhYmxlKCk7CiAgICAg
LyoKICAgICAgKiBjbXB4Y2hnKCkgaXMgYSBmdWxsIGJhcnJpZXIgc28gbm8gbmVlZCBmb3IgYW4K
ICAgICAgKiBhcmNoX2xvY2tfYWNxdWlyZV9iYXJyaWVyKCkuCi0tIAoyLjE2LjQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
