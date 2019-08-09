Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CE887D7C
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:02:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6MT-0007Y2-O4; Fri, 09 Aug 2019 14:59:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hw6M5-0006ho-Jp
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 14:58:57 +0000
X-Inumbo-ID: 33a324ee-bab6-11e9-bc22-bbc3309160c5
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33a324ee-bab6-11e9-bc22-bbc3309160c5;
 Fri, 09 Aug 2019 14:58:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 325D6B08C;
 Fri,  9 Aug 2019 14:58:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 16:58:25 +0200
Message-Id: <20190809145833.1020-41-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190809145833.1020-1-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 40/48] xen/sched: reject switching smt on/off
 with core scheduling active
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBjb3JlIG9yIHNvY2tldCBzY2hlZHVsaW5nIGFyZSBhY3RpdmUgZW5hYmxpbmcgb3IgZGlz
YWJsaW5nIHNtdCBpcwpub3QgcG9zc2libGUgYXMgdGhhdCB3b3VsZCByZXF1aXJlIGEgbWFqb3Ig
aG9zdCByZWNvbmZpZ3VyYXRpb24uCgpBZGQgYSBib29sIHNjaGVkX2Rpc2FibGVfc210X3N3aXRj
aGluZyB3aGljaCB3aWxsIGJlIHNldCBmb3IgY29yZSBvcgpzb2NrZXQgc2NoZWR1bGluZy4KClNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClYxOgotIG5l
dyBwYXRjaApWMjoKLSBFQlVTWSBhcyByZXR1cm4gY29kZSAoSmFuIEJldWxpY2gsIERhcmlvIEZh
Z2dpb2xpKQotIF9fcmVhZF9tb3N0bHkgZm9yIHNjaGVkX2Rpc2FibGVfc210X3N3aXRjaGluZyAo
SmFuIEJldWxpY2gpCi0tLQogeGVuL2FyY2gveDg2L3N5c2N0bC5jICAgfCA1ICsrKysrCiB4ZW4v
Y29tbW9uL3NjaGVkdWxlLmMgICB8IDEgKwogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCAxICsK
IDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L3N5c2N0bC5jIGIveGVuL2FyY2gveDg2L3N5c2N0bC5jCmluZGV4IGM1MGQ5MTBhMWMuLmE0
YzRkODY4YjYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYworKysgYi94ZW4vYXJj
aC94ODYvc3lzY3RsLmMKQEAgLTIwNCw2ICsyMDQsMTEgQEAgbG9uZyBhcmNoX2RvX3N5c2N0bCgK
ICAgICAgICAgICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsKICAgICAgICAgICAgICAgICBicmVh
azsKICAgICAgICAgICAgIH0KKyAgICAgICAgICAgIGlmICggc2NoZWRfZGlzYWJsZV9zbXRfc3dp
dGNoaW5nICkKKyAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICByZXQgPSAtRUJVU1k7Cisg
ICAgICAgICAgICAgICAgYnJlYWs7CisgICAgICAgICAgICB9CiAgICAgICAgICAgICBwbHVnID0g
b3AgPT0gWEVOX1NZU0NUTF9DUFVfSE9UUExVR19TTVRfRU5BQkxFOwogICAgICAgICAgICAgZm4g
PSBzbXRfdXBfZG93bl9oZWxwZXI7CiAgICAgICAgICAgICBoY3B1ID0gX3AocGx1Zyk7CmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5k
ZXggYWZkNDE3MDczMC4uYjk0ZmQyNDMxYSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVs
ZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwpAQCAtNTcsNiArNTcsNyBAQCBpbnRlZ2Vy
X3BhcmFtKCJzY2hlZF9yYXRlbGltaXRfdXMiLCBzY2hlZF9yYXRlbGltaXRfdXMpOwogCiAvKiBO
dW1iZXIgb2YgdmNwdXMgcGVyIHN0cnVjdCBzY2hlZF91bml0LiAqLwogc3RhdGljIHVuc2lnbmVk
IGludCBfX3JlYWRfbW9zdGx5IHNjaGVkX2dyYW51bGFyaXR5ID0gMTsKK2Jvb2wgX19yZWFkX21v
c3RseSBzY2hlZF9kaXNhYmxlX3NtdF9zd2l0Y2hpbmc7CiBjb25zdCBjcHVtYXNrX3QgKnNjaGVk
X3Jlc19tYXNrID0gJmNwdW1hc2tfYWxsOwogCiAvKiBDb21tb24gbG9jayBmb3IgZnJlZSBjcHVz
LiAqLwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmggYi94ZW4vaW5jbHVkZS94
ZW4vc2NoZWQuaAppbmRleCBlODY4NjQ2ZjBlLi4zOTM1NWY1ZDY3IDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaApAQCAtMTAy
MSw2ICsxMDIxLDcgQEAgc3RhdGljIGlubGluZSBib29sIGlzX3ZjcHVfb25saW5lKGNvbnN0IHN0
cnVjdCB2Y3B1ICp2KQogfQogCiBleHRlcm4gYm9vbCBzY2hlZF9zbXRfcG93ZXJfc2F2aW5nczsK
K2V4dGVybiBib29sIHNjaGVkX2Rpc2FibGVfc210X3N3aXRjaGluZzsKIAogZXh0ZXJuIGVudW0g
Y3B1ZnJlcV9jb250cm9sbGVyIHsKICAgICBGUkVRQ1RMX25vbmUsIEZSRVFDVExfZG9tMF9rZXJu
ZWwsIEZSRVFDVExfeGVuCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
