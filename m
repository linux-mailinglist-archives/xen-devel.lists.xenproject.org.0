Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BFE143AA5
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 11:16:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itqXT-0004jf-5U; Tue, 21 Jan 2020 10:13:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4mp0=3K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1itqXS-0004jO-0m
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 10:13:38 +0000
X-Inumbo-ID: a7005f54-3c36-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7005f54-3c36-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 10:13:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 293DFB305;
 Tue, 21 Jan 2020 10:13:21 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 11:13:01 +0100
Message-Id: <20200121101301.421-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200121101301.421-1-jgross@suse.com>
References: <20200121101301.421-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v3 2/2] xen: make CONFIG_DEBUG_LOCKS usable
 without CONFIG_DEBUG
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
Rml4IHRoYXQgYnkgdXNpbmcgQlVHX09OKCkgaW5zdGVhZCBvZiBBU1NFUlQoKSBpbiByZWxfbG9j
aygpLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KIHhlbi9jb21tb24v
c3BpbmxvY2suYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc3BpbmxvY2suYyBiL3hlbi9jb21tb24v
c3BpbmxvY2suYwppbmRleCAyODZmOTE2YmNhLi4zNDQ5ODFjNTRhIDEwMDY0NAotLS0gYS94ZW4v
Y29tbW9uL3NwaW5sb2NrLmMKKysrIGIveGVuL2NvbW1vbi9zcGlubG9jay5jCkBAIC04Niw3ICs4
Niw3IEBAIHN0YXRpYyB2b2lkIGdvdF9sb2NrKHVuaW9uIGxvY2tfZGVidWcgKmRlYnVnKQogc3Rh
dGljIHZvaWQgcmVsX2xvY2sodW5pb24gbG9ja19kZWJ1ZyAqZGVidWcpCiB7CiAgICAgaWYgKCBh
dG9taWNfcmVhZCgmc3Bpbl9kZWJ1ZykgPiAwICkKLSAgICAgICAgQVNTRVJUKGRlYnVnLT5jcHUg
PT0gc21wX3Byb2Nlc3Nvcl9pZCgpKTsKKyAgICAgICAgQlVHX09OKGRlYnVnLT5jcHUgIT0gc21w
X3Byb2Nlc3Nvcl9pZCgpKTsKICAgICBkZWJ1Zy0+Y3B1ID0gU1BJTkxPQ0tfTk9fQ1BVOwogfQog
Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
