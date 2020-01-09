Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A851352CC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 06:43:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipQYn-0000Tr-6I; Thu, 09 Jan 2020 05:40:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3305=26=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipQYl-0000Tk-Td
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 05:40:43 +0000
X-Inumbo-ID: 8e6adab6-32a2-11ea-b1f0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e6adab6-32a2-11ea-b1f0-bc764e2007e4;
 Thu, 09 Jan 2020 05:40:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D59C1ABE9;
 Thu,  9 Jan 2020 05:40:33 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  9 Jan 2020 06:40:31 +0100
Message-Id: <20200109054031.18455-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen: make CONFIG_DEBUG_LOCKS usable without
 CONFIG_DEBUG
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

SW4gZXhwZXJ0IG1vZGUgaXQgaXMgcG9zc2libGUgdG8gZW5hYmxlIENPTkZJR19ERUJVR19MT0NL
UyB3aXRob3V0CmhhdmluZyBlbmFibGVkIENPTkZJR19ERUJVRy4gVGhlIGNvZGluZyBpcyBkZXBl
bmRpbmcgb24gQ09ORklHX0RFQlVHCmFzIGl0IGlzIHVzaW5nIEFTU0VSVCgpLCBob3dldmVyLgoK
Rml4IHRoYXQgYnkgaW50cm9kdWNpbmcgYXNzZXJ0KCkgZG9pbmcgdGhlIHNhbWUgYXMgQVNTRVJU
KCksIGJ1dCBiZWluZwphdmFpbGFibGUgaW4gbm9uLWRlYnVnIGJ1aWxkcywgdG9vLCBhbmQgdXNl
IHRoYXQgaW4gc3BpbmxvY2sgZGVidWcKY29kZS4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL3NwaW5sb2NrLmMgfCAyICstCiB4
ZW4vaW5jbHVkZS94ZW4vbGliLmggfCA2ICsrKystLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zcGlubG9j
ay5jIGIveGVuL2NvbW1vbi9zcGlubG9jay5jCmluZGV4IDI4NmY5MTZiY2EuLjhmNTQ1ODBkMjQg
MTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc3BpbmxvY2suYworKysgYi94ZW4vY29tbW9uL3NwaW5s
b2NrLmMKQEAgLTg2LDcgKzg2LDcgQEAgc3RhdGljIHZvaWQgZ290X2xvY2sodW5pb24gbG9ja19k
ZWJ1ZyAqZGVidWcpCiBzdGF0aWMgdm9pZCByZWxfbG9jayh1bmlvbiBsb2NrX2RlYnVnICpkZWJ1
ZykKIHsKICAgICBpZiAoIGF0b21pY19yZWFkKCZzcGluX2RlYnVnKSA+IDAgKQotICAgICAgICBB
U1NFUlQoZGVidWctPmNwdSA9PSBzbXBfcHJvY2Vzc29yX2lkKCkpOworICAgICAgICBhc3NlcnQo
ZGVidWctPmNwdSA9PSBzbXBfcHJvY2Vzc29yX2lkKCkpOwogICAgIGRlYnVnLT5jcHUgPSBTUElO
TE9DS19OT19DUFU7CiB9CiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9saWIuaCBiL3hl
bi9pbmNsdWRlL3hlbi9saWIuaAppbmRleCA4ZmJlODQwMzJkLi4wMDBlYTY3N2QwIDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS94ZW4vbGliLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2xpYi5oCkBA
IC0zMiw5ICszMiwxMSBAQAogI2RlZmluZSBnY292X3N0cmluZyAiIgogI2VuZGlmCiAKLSNpZm5k
ZWYgTkRFQlVHCi0jZGVmaW5lIEFTU0VSVChwKSBcCisjZGVmaW5lIGFzc2VydChwKSBcCiAgICAg
ZG8geyBpZiAoIHVubGlrZWx5KCEocCkpICkgYXNzZXJ0X2ZhaWxlZCgjcCk7IH0gd2hpbGUgKDAp
CisKKyNpZm5kZWYgTkRFQlVHCisjZGVmaW5lIEFTU0VSVChwKSBhc3NlcnQocCkKICNkZWZpbmUg
QVNTRVJUX1VOUkVBQ0hBQkxFKCkgYXNzZXJ0X2ZhaWxlZCgidW5yZWFjaGFibGUiKQogI2RlZmlu
ZSBkZWJ1Z19idWlsZCgpIDEKICNlbHNlCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
