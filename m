Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5EFB1004
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 15:32:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8P98-0005qp-5r; Thu, 12 Sep 2019 13:28:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pap2=XH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8P96-0005qR-JM
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 13:28:24 +0000
X-Inumbo-ID: 2e13010a-d561-11e9-9599-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e13010a-d561-11e9-9599-12813bfff9fa;
 Thu, 12 Sep 2019 13:28:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 031CEB657;
 Thu, 12 Sep 2019 13:28:17 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Sep 2019 15:28:08 +0200
Message-Id: <20190912132813.6509-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v5 0/5] enhance lock debugging
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgaHVudGluZyBhIGxvY2tpbmcgcHJvYmxlbSBpbiBteSBjb3JlIHNjaGVkdWxpbmcgc2Vy
aWVzIEkgaGF2ZQphZGRlZCBzb21lIGRlYnVnZ2luZyBhaWRzIHRvIHNwaW5sb2NrIGhhbmRsaW5n
IG1ha2luZyBpdCBlYXNpZXIgdG8KZmluZCB0aGUgcm9vdCBjYXVzZSBmb3IgdGhlIHByb2JsZW0u
CgpNYWtpbmcgdXNlIG9mIHRoZSBhbHJlYWR5IGV4aXN0aW5nIGxvY2sgcHJvZmlsaW5nIGFuZCBl
bmhhbmNpbmcgaXQgYQpsaXR0bGUgYml0IHByb2R1Y2VzIHNvbWUgcmVhbGx5IHZhbHVhYmxlIGRp
YWdub3N0aWMgZGF0YSBlLmcuIHdoZW4gYQpOTUkgd2F0Y2hkb2cgaXMgdHJpZ2dlcmluZyBhIGNy
YXNoLgoKQ2hhbmdlcyBpbiBWNToKLSBhZGQgQlVJTERfQlVHX09OKCkgaW4gcGF0Y2ggMQoKQ2hh
bmdlcyBpbiBWNDoKLSBzb21lIGNvbW1lbnRzIGJ5IEphbiBCZXVsaWNoIGFkZHJlc3NlZAotIHJl
cGxhY2VkIHBhdGNoIDUgd2l0aCBhbm90aGVyIGFwcHJvYWNoIHRvIG1ha2UgbG9jayBuYW1lcyB1
bmlxdWUKCkNoYW5nZXMgaW4gVjM6Ci0gcmViYXNlIHRvIGN1cnJlbnQgc3RhZ2luZyAoYWZ0ZXIg
cmVhbGl6aW5nIHRoYXQgcGF0Y2ggNCBzdGlsbAogIGFwcGxpZWQsIGJ1dCByZXN1bHRpbmcgaW4g
cGF0Y2hpbmcgYSB3cm9uZyBmdW5jdGlvbikKCkNoYW5nZXMgaW4gVjI6Ci0gbXVsdGlwbGUgY29t
bWVudHMgYWRkcmVzc2VkCi0gYWRkZWQgcGF0Y2ggNQoKSnVlcmdlbiBHcm9zcyAoNSk6CiAgeGVu
L3NwaW5sb2NrczogaW4gZGVidWcgYnVpbGRzIHN0b3JlIGNwdSBob2xkaW5nIHRoZSBsb2NrCiAg
eGVuOiBhZGQgbmV3IENPTkZJR19ERUJVR19MT0NLUyBvcHRpb24KICB4ZW46IHByaW50IGxvY2sg
cHJvZmlsZSBpbmZvIGluIHBhbmljKCkKICB4ZW46IG1vZGlmeSBsb2NrIHByb2ZpbGluZyBpbnRl
cmZhY2UKICB4ZW46IGFkZCBmdW5jdGlvbiBuYW1lIHRvIGxvY2sgcHJvZmlsaW5nIGRhdGEKCiB0
b29scy9saWJ4Yy94Y19taXNjLmMgICAgICAgfCAgIDEgKwogdG9vbHMvbWlzYy94ZW5sb2NrcHJv
Zi5jICAgIHwgIDE3ICstLS0KIHhlbi9LY29uZmlnLmRlYnVnICAgICAgICAgICB8ICAxMCArKy0K
IHhlbi9hcmNoL2FybS94ZW4ubGRzLlMgICAgICB8ICAxMyArLS0KIHhlbi9hcmNoL3g4Ni9kb21h
aW4uYyAgICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L3hlbi5sZHMuUyAgICAgIHwgIDEzICst
LQogeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgIHwgICA0ICstCiB4ZW4vY29tbW9uL2tleWhh
bmRsZXIuYyAgICAgfCAgIDIgKy0KIHhlbi9jb21tb24vc3BpbmxvY2suYyAgICAgICB8IDE4OCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogeGVuL2NvbW1vbi9z
eXNjdGwuYyAgICAgICAgIHwgICAyICstCiB4ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyAgfCAg
IDQgKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCB8ICAxMSArLS0KIHhlbi9pbmNsdWRl
L3hlbi9zcGlubG9jay5oICB8ICA3NiArKysrKysrKysrKy0tLS0tLS0KIDEzIGZpbGVzIGNoYW5n
ZWQsIDIyNSBpbnNlcnRpb25zKCspLCAxMTggZGVsZXRpb25zKC0pCgotLSAKMi4xNi40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
