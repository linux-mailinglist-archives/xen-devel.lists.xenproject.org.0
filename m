Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1025B114957
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 23:33:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iczdY-0002lL-Az; Thu, 05 Dec 2019 22:30:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G9sg=Z3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iczdW-0002lG-Va
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 22:30:15 +0000
X-Inumbo-ID: cd5797c8-17ae-11ea-a4fd-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd5797c8-17ae-11ea-a4fd-bc764e2007e4;
 Thu, 05 Dec 2019 22:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575585014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jZ9fnBkJJzRDr81WGKACyI94jmMBq4UnZwdEiyz7ymU=;
 b=VLVJHWhGunsP2Z3vcfk4lvTbanBsGW+vuVyC/PjGtGvJCpVulWOcuOY1
 MTYMMgtNHpxsu3SuNuYTYbvqfi/hjVcZP/fdSaHqdgx+Tl1lrxlvUer0l
 JAyp90XLz+wK0A4TviszYer7sElARDk2cK0YtW+noQ/IzF0l29TGxah+6 E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4dl229GEvFuQc3SmayG/6P8WzuuZHGamu/W+g5+Ngkl/RfpwGmo7+zRFj/3hum4ICVGN9U644J
 tTpWrvB8TrIiR9kiUBQyDWcqOh68zy6oJ+2RTafgmj+zq69T/uvJdPwwD4v0pNbfscA+C/rNRw
 IcmvXw3KIRkjKCgnUIUKrIHxtc3LFxz/KO8SIKxpszVy7tRW4imzIN0lRpa0KmSFwgBBm0d0HM
 fNmH0cHpOI6in2gEm1AN368BxgUSV3CRZQlhu/pfJ4u+oFuxAyDgf9985BpzLgdIoEO+1M7tFi
 an0=
X-SBRS: 2.7
X-MesageID: 9407205
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,282,1571716800"; 
   d="scan'208";a="9407205"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 5 Dec 2019 22:30:02 +0000
Message-ID: <20191205223008.8623-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/6] xen: Support continuations from tasklets
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyB0aGUgUG9zdCAieDg2L3NtdDogU3VwcG9ydCBmb3IgZW5hYmxpbmcvZGlzYWJsaW5n
IFNNVCBhdCBydW50aW1lIiB3b3JrCndoaWNoIHN0dW1ibGVkIGludG8gZGlzY292ZXJpbmcgWFNB
LTI5NiwgZm9yIHRoZSBwdXJwb3NlIG9mIG1ha2luZwpjb250aW51YXRpb25zIG1vcmUgZWZmaWNp
ZW50LgoKRnJvbSB0ZXN0aW5nIHRoaXMgc2VyaWVzLCBJIGhhdmUgcmUtY29uZmlybWVkIHRoZSBw
cmV2aW91cyByZXBvcnRlZApvYnNlcnZhdGlvbiB0aGF0OgoKICAjIHdoaWxlIDo7IGRvIHhlbi1o
cHRvb2wgc210LWVuYWJsZTsgeGVuLWhwdG9vbCBzbXQtZGlzYWJsZTsgZG9uZQoKaW4gZG9tMCBl
dmVudHVhbGx5IGNhdXNlcyB0aGUgc2VyaWFsIGNvbnNvbGUgdG8gY2Vhc2Ugd29ya2luZyAod2Vk
Z2UgbWlkd2F5CnRocm91Z2ggcHJpbnRpbmcgYSBsaW5lKS4KClRoZXJlIGFyZSBzcG9yYWRpYyAi
QnJva2UgYWZmaW5pdHkgZm9yIElSUTI2LCBuZXc6IGZmZmYiIG1lc3NhZ2VzLCBidXQgdGhlCnNl
cmlhbCBhbHdheXMgc2VlbXMgdG8gYnJlYWsgc2hvcnRseSBhZnRlciB0aGUgZmlyc3QgIkJyb2tl
IGFmZmluaXR5IGZvcgpJUlEzMCwgbmV3OiBmZmZmIi4gIEJvdGggSVJRcyBhcmUgbm9uLWRlc2Ny
aXB0IFBDSS1NU0kvLVggaW50ZXJydXB0cyBib3VuZCB0bwpkb20wLgoKQW5kcmV3IENvb3BlciAo
Nik6CiAgeGVuL3Rhc2tsZXQ6IEZpeCByZXR1cm4gdmFsdWUgdHJ1bmNhdGlvbiBvbiBhcm02NAog
IHhlbi90YXNrbGV0OiBTd2l0Y2ggZGF0YSBwYXJhbWV0ZXIgZnJvbSB1bnNpZ25lZCBsb25nIHRv
IHZvaWQgKi4KICB4ZW4vZG9tY3RsOiBDb25zb2xpZGF0ZSBoeXBlcmNhbGwgY29udGludWF0aW9u
IGhhbmRsaW5nIGF0IHRoZSB0b3AgbGV2ZWwKICB4ZW4vaHlwZXJjYWxsOiBDb3BlIHdpdGggLUVS
RVNUQVJUIG9uIG1vcmUgaHlwZXJjYWxsIHBhdGhzCiAgeGVuL3Rhc2tsZXQ6IFJldHVybiAtRVJF
U1RBUlQgZnJvbSBjb250aW51ZV9oeXBlcmNhbGxfb25fY3B1KCkKICB4ODYvc210OiBEb24ndCB1
c2UgLUVCVVNZIGZvciBzbXRfdXBfZG93bl9oZWxwZXIoKSBjb250aW51YXRpb25zCgogeGVuL2Fy
Y2gvYXJtL3RyYXBzLmMgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrKysrCiB4ZW4vYXJj
aC94ODYvZG9tY3RsLmMgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrKystCiB4ZW4vYXJjaC94
ODYvaHZtL2h2bS5jICAgICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tCiB4ZW4vYXJjaC94ODYv
aHZtL3ZsYXBpYy5jICAgICAgICAgICAgICAgICB8ICA4ICsrKy0tLS0KIHhlbi9hcmNoL3g4Ni9o
eXBlcmNhbGwuYyAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKysrKysrCiB4ZW4vYXJjaC94
ODYvbW0vaGFwL2hhcC5jICAgICAgICAgICAgICAgICB8ICAzICstLQogeGVuL2FyY2gveDg2L21t
L3NoYWRvdy9jb21tb24uYyAgICAgICAgICAgfCAgNyArKystLS0KIHhlbi9hcmNoL3g4Ni9wbGF0
Zm9ybV9oeXBlcmNhbGwuYyAgICAgICAgIHwgMTQgKysrKysrKysrKy0tCiB4ZW4vYXJjaC94ODYv
c3lzY3RsLmMgICAgICAgICAgICAgICAgICAgICB8ICA5ICsrKysrKy0tCiB4ZW4vY29tbW9uL2Nv
bXBhdC9kb21haW4uYyAgICAgICAgICAgICAgICB8ICA5ICsrKystLS0tCiB4ZW4vY29tbW9uL2Rv
bWFpbi5jICAgICAgICAgICAgICAgICAgICAgICB8IDM3ICsrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0KIHhlbi9jb21tb24vZG9tY3RsLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMTkg
KysrKystLS0tLS0tLS0tLQogeGVuL2NvbW1vbi9rZXhlYy5jICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyMCArKysrKysrKysrKysrLS0tLQogeGVuL2NvbW1vbi9rZXloYW5kbGVyLmMgICAgICAg
ICAgICAgICAgICAgfCAxOSArKysrKysrKy0tLS0tLS0tCiB4ZW4vY29tbW9uL3N0b3BfbWFjaGlu
ZS5jICAgICAgICAgICAgICAgICB8ICA1ICsrKy0tCiB4ZW4vY29tbW9uL3N5c2N0bC5jICAgICAg
ICAgICAgICAgICAgICAgICB8IDEzICsrKysrKysrKy0tCiB4ZW4vY29tbW9uL3Rhc2tsZXQuYyAg
ICAgICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tCiB4ZW4vY29tbW9uL3RyYWNlLmMgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIHhlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jICAg
ICAgICAgICAgICAgIHwgIDQgKystLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11
X2d1ZXN0LmMgfCAgNyArKystLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9p
bml0LmMgIHwgIDYgKystLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgICAgICAg
ICAgIHwgIDQgKystLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMgICAgICAg
fCAgNCArKy0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL3JlZ3MuaCAgICAgICAgICAgICAgICB8ICAy
IC0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L3JlZ3MuaCAgICAgICAgICAgICAgICB8ICAyIC0tCiB4
ZW4vaW5jbHVkZS9hc20teDg2L3NoYWRvdy5oICAgICAgICAgICAgICB8ICA1ICsrLS0tCiB4ZW4v
aW5jbHVkZS94ZW4vZG9tYWluLmggICAgICAgICAgICAgICAgICB8IDE3ICsrKysrKysrKysrLS0t
CiB4ZW4vaW5jbHVkZS94ZW4vdGFza2xldC5oICAgICAgICAgICAgICAgICB8IDEwICsrKystLS0t
LQogMjggZmlsZXMgY2hhbmdlZCwgMTU4IGluc2VydGlvbnMoKyksIDEwOSBkZWxldGlvbnMoLSkK
Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
