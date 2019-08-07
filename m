Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1676084ECB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 16:33:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvMyM-0000yb-L6; Wed, 07 Aug 2019 14:31:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTKn=WD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvMyK-0000y4-Tj
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 14:31:24 +0000
X-Inumbo-ID: 0717f810-b920-11e9-8f59-6778e7467e69
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0717f810-b920-11e9-8f59-6778e7467e69;
 Wed, 07 Aug 2019 14:31:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C42FCAFA8;
 Wed,  7 Aug 2019 14:31:21 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  7 Aug 2019 16:31:15 +0200
Message-Id: <20190807143119.8360-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH 0/4] enhance lock debugging
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgaHVudGluZyBhIGxvY2tpbmcgcHJvYmxlbSBpbiBteSBjb3JlIHNjaGVkdWxpbmcgc2Vy
aWVzIEkgaGF2ZQphZGRlZCBzb21lIGRlYnVnZ2luZyBhaWRzIHRvIHNwaW5sb2NrIGhhbmRsaW5n
IG1ha2luZyBpdCBlYXNpZXIgdG8KZmluZCB0aGUgcm9vdCBjYXVzZSBmb3IgdGhlIHByb2JsZW0u
CgpNYWtpbmcgdXNlIG9mIHRoZSBhbHJlYWR5IGxvY2sgcHJvZmlsaW5nIGFuZCBlbmhhbmNpbmcg
aXQgYSBsaXR0bGUKYml0IHByb2R1Y2VzIHNvbWUgcmVhbGx5IHZhbHVhYmxlIGRpYWdub3N0aWMg
ZGF0YSBlLmcuIHdoZW4gYSBOTUkKd2F0Y2hkb2cgaXMgdHJpZ2dlcmluZyBhIGNyYXNoLgoKSnVl
cmdlbiBHcm9zcyAoNCk6CiAgeGVuL3NwaW5sb2NrczogaW4gZGVidWcgYnVpbGRzIHN0b3JlIGNw
dSBob2xkaW5nIHRoZSBsb2NrCiAgeGVuOiBhZGQgbmV3IENPTkZJR19TUElOTE9DS19ERUJVRyBv
cHRpb24KICB4ZW46IHByaW50IGxvY2sgcHJvZmlsZSBpbmZvIGluIHBhbmljKCkKICB4ZW46IG1v
ZGlmeSBsb2NrIHByb2ZpbGluZyBpbnRlcmZhY2UKCiB0b29scy9saWJ4Yy94Y19taXNjLmMgICAg
ICAgfCAgIDEgKwogdG9vbHMvbWlzYy94ZW5sb2NrcHJvZi5jICAgIHwgIDE3ICsrLS0tLQogeGVu
L0tjb25maWcuZGVidWcgICAgICAgICAgIHwgICA4ICsrKwogeGVuL2NvbW1vbi9kb21haW4uYyAg
ICAgICAgIHwgICA0ICstCiB4ZW4vY29tbW9uL3NwaW5sb2NrLmMgICAgICAgfCAxMzQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIHhlbi9kcml2ZXJzL2NoYXIv
Y29uc29sZS5jICB8ICAgNCArLQogeGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oIHwgIDExICsr
LS0KIHhlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5oICB8ICA0MiArKysrKysrKy0tLS0tLQogOCBm
aWxlcyBjaGFuZ2VkLCAxNDIgaW5zZXJ0aW9ucygrKSwgNzkgZGVsZXRpb25zKC0pCgotLSAKMi4x
Ni40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
