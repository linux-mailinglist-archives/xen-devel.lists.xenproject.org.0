Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A41218A19F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 18:35:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEcYl-0006RR-HP; Wed, 18 Mar 2020 17:32:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xbLb=5D=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jEcYk-0006RM-BG
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 17:32:50 +0000
X-Inumbo-ID: 7d33f124-693e-11ea-bec1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d33f124-693e-11ea-bec1-bc764e2007e4;
 Wed, 18 Mar 2020 17:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IfvmqyLsDc/wQAagqwRXrPen9Gwtl7HS8sLmh6hNgvU=; b=CR+BjkeqZlBi8UkjXXKgAiZ/ly
 2QA3e5MotkZonMcBFLT0gDNIAwsDNMHTg8hsrTdXdvSZwHQuOvJcRSjwxV3VdSd0hX2WIWdy28UlZ
 CPwLr+oQxWvp5+BAqxL2qPpk+rkdPCiHsRTmwEv9eGttQi0x3+/XQM5yrauVaGV8VhCc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jEcYh-0005U1-Ll; Wed, 18 Mar 2020 17:32:47 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jEcYh-0007B3-Bn; Wed, 18 Mar 2020 17:32:47 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Mar 2020 17:32:40 +0000
Message-Id: <20200318173243.29183-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/3] make sure PGC_extra pages are dealt with
 properly
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
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgd2FzIGZvcm1lcmx5IGNhbGxlZCAicmVtb3ZlIG9uZSBtb3JlIHNoYXJlZCB4
ZW5oZWFwIHBhZ2U6CnNoYXJlZF9pbmZvIiBidXQgSSBoYXZlIGRyb3BwZWQgdGhlIHBhdGNoZXMg
YWN0dWFsbHkgY2hhbmdpbmcgc2hhcmVkX2luZm8KYW5kIGp1c3QgbGVmdCB0aGUgUEdDX2V4dHJh
IGNsZWFuLXVwIHRoYXQgd2FzIHByZXZpb3VzbHkgaW50ZXJ0d2luZWQuCgpQYXVsIER1cnJhbnQg
KDMpOgogIG1tOiBrZWVwIFBHQ19leHRyYSBwYWdlcyBvbiBhIHNlcGFyYXRlIGxpc3QKICB4ODYg
LyBpb3JlcTogdXNlIGEgTUVNRl9ub19yZWZjb3VudCBhbGxvY2F0aW9uIGZvciBzZXJ2ZXIgcGFn
ZXMuLi4KICBtbTogYWRkICdpc19zcGVjaWFsX3BhZ2UnIGlubGluZSBmdW5jdGlvbi4uLgoKIHhl
bi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICAgfCAgOSArKysrKysrKysKIHhlbi9hcmNoL3g4
Ni9kb21jdGwuYyAgICAgICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jICAg
ICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgICAgICAgIHwgMTMgKysrKysr
LS0tLS0tLQogeGVuL2FyY2gveDg2L21tL2FsdHAybS5jICAgICAgICB8ICAyICstCiB4ZW4vYXJj
aC94ODYvbW0vbWVtX3NoYXJpbmcuYyAgIHwgIDMgKy0tCiB4ZW4vYXJjaC94ODYvbW0vcDJtLXBv
ZC5jICAgICAgIHwgMTIgKysrKysrKy0tLS0tCiB4ZW4vYXJjaC94ODYvbW0vcDJtLmMgICAgICAg
ICAgIHwgIDQgKystLQogeGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYyB8IDEzICsrKysr
KysrLS0tLS0KIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvbXVsdGkuYyAgfCAgMyArKy0KIHhlbi9h
cmNoL3g4Ni90Ym9vdC5jICAgICAgICAgICAgfCAgNCArKy0tCiB4ZW4vY29tbW9uL2RvbWFpbi5j
ICAgICAgICAgICAgIHwgIDEgKwogeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgICAgICAgICB8ICAy
ICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L21tLmggICAgICAgIHwgIDYgKystLS0tCiB4ZW4vaW5j
bHVkZS94ZW4vbW0uaCAgICAgICAgICAgIHwgMTAgKysrKysrKy0tLQogeGVuL2luY2x1ZGUveGVu
L3NjaGVkLmggICAgICAgICB8IDEzICsrKysrKysrKysrKysKIDE2IGZpbGVzIGNoYW5nZWQsIDY0
IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
Q2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+CkNjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDYzog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdh
biA8dGltQHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLSAKMi4yMC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
