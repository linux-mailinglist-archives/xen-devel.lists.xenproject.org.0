Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BC516FE0A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:43:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6v4E-0003Dw-Uj; Wed, 26 Feb 2020 11:41:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6v4D-0003CD-5V
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:41:29 +0000
X-Inumbo-ID: e838d77c-588c-11ea-93ff-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e838d77c-588c-11ea-93ff-12813bfff9fa;
 Wed, 26 Feb 2020 11:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582717280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L5VAIkTm4RVu7vvlOd7YT+u3y95320w9ahzrwbDBRls=;
 b=Z7XR9xC9SI/YqOwsow1GlT0xiaFVngZAGUbi8mxEqWny2dFi/7yIDS4u
 VXfUUZr9saLG4iq6HbvBD3K1hSm172irgp1W3QDF09wqL3a+WQyoA05Id
 xuXGyO3VB1QHJx8u2QHX0O15a5bEifGPwdSdK7WhUM555giCgl3VOUR5v Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DID107mk41IC12RgYoANWwePVEMeVkQ9VF+iVg7R4ytt3uJQmbGZxvjITJ04yBX6yV0ROtKH25
 4CX9JczeUqrinOLL9bxuoW+PrpGNihD+RFmJgT06b8naZVS6sSdzXz0+A88IAobzyWVVsCdoz4
 Aotd3XCpvOYyTfxnZ1l1OLWeEzusHxhCeJ3BOy1b2oQtRpSXrVBxYjK0NDRcbWQ3Q7+ITKuZ2m
 7RaL+Qn84as6mr6C/E/1H6PhTUBJxeITk1XhC3wnQMDvTsDzTJhDjhY/4umanTuYm8Mx6o23dJ
 2Mk=
X-SBRS: 2.7
X-MesageID: 13658316
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13658316"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:51 +0000
Message-ID: <20200226113355.2532224-20-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 19/23] xen/build: Use if_changed_rules
 with %.o:%.c targets
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlICQoZG90LXRhcmdldCkgdG8gaGF2ZSB0aGUgdGFyZ2V0IG5hbWUgcHJlZml4IHdpdGggYSBk
b3QuCgpOb3csIHdoZW4gdGhlIENDIGNvbW1hbmQgaGFzIHJ1biwgaXQgaXMgcmVjb3JkZWQgaW4g
LiouY21kCmZpbGUsIHRoZW4gaWZfY2hhbmdlZF9ydWxlcyB3aWxsIGNvbXBhcmUgaXQgb24gc3Vi
c2VxdWVudCBydW5zLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+Ci0tLQogeGVuL1J1bGVzLm1rIHwgMjYgKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9SdWxlcy5tayBiL3hlbi9SdWxlcy5tawppbmRleCBjYmY0ZmVi
YTBlMGYuLjhjN2RiYTkyMTFkMSAxMDA2NDQKLS0tIGEveGVuL1J1bGVzLm1rCisrKyBiL3hlbi9S
dWxlcy5tawpAQCAtMTY3LDE5ICsxNjcsMjcgQEAgRk9SQ0U6CiAKIFNSQ1BBVEggOj0gJChwYXRz
dWJzdCAkKEJBU0VESVIpLyUsJSwkKENVUkRJUikpCiAKLSUubzogJS5jIE1ha2VmaWxlCitxdWll
dF9jbWRfY2Nfb19jID0gQ0MgICAgICAkQAogaWZlcSAoJChDT05GSUdfRU5GT1JDRV9VTklRVUVf
U1lNQk9MUykseSkKLQkkKENDKSAkKGNfZmxhZ3MpIC1jICQ8IC1vICQoQEQpLy4kKEBGKS50bXAg
LU1RICRACi1pZmVxICgkKENPTkZJR19DQ19JU19DTEFORykseSkKLQkkKE9CSkNPUFkpIC0tcmVk
ZWZpbmUtc3ltICQ8PSQoU1JDUEFUSCkvJDwgJChARCkvLiQoQEYpLnRtcCAkQAotZWxzZQotCSQo
T0JKQ09QWSkgLS1yZWRlZmluZS1zeW0gJCg8Rik9JChTUkNQQVRIKS8kPCAkKEBEKS8uJChARiku
dG1wICRACi1lbmRpZgotCXJtIC1mICQoQEQpLy4kKEBGKS50bXAKKyAgICBjbWRfY2Nfb19jID0g
JChDQykgJChjX2ZsYWdzKSAtYyAkPCAtbyAkKGRvdC10YXJnZXQpLnRtcCAtTVEgJEAKKyAgICBp
ZmVxICgkKENPTkZJR19DQ19JU19DTEFORykseSkKKyAgICAgICAgY21kX29iamNvcHlfZml4X3N5
bSA9ICQoT0JKQ09QWSkgLS1yZWRlZmluZS1zeW0gJDw9JChTUkNQQVRIKS8kPCAkKGRvdC10YXJn
ZXQpLnRtcCAkQAorICAgIGVsc2UKKyAgICAgICAgY21kX29iamNvcHlfZml4X3N5bSA9ICQoT0JK
Q09QWSkgLS1yZWRlZmluZS1zeW0gJCg8Rik9JChTUkNQQVRIKS8kPCAkKGRvdC10YXJnZXQpLnRt
cCAkQAorICAgIGVuZGlmCisgICAgY21kX29iamNvcHlfZml4X3N5bSArPSAmJiBybSAtZiAkKGRv
dC10YXJnZXQpLnRtcAogZWxzZQotCSQoQ0MpICQoY19mbGFncykgLWMgJDwgLW8gJEAKKyAgICBj
bWRfY2Nfb19jID0gJChDQykgJChjX2ZsYWdzKSAtYyAkPCAtbyAkQAogZW5kaWYKIAorZGVmaW5l
IHJ1bGVfY2Nfb19jCisgICAgJChjYWxsIGNtZF9hbmRfcmVjb3JkLGNjX29fYykKKyAgICAkKGNh
bGwgY21kLG9iamNvcHlfZml4X3N5bSkKK2VuZGVmCisKKyUubzogJS5jIEZPUkNFCisJJChjYWxs
IGlmX2NoYW5nZWRfcnVsZSxjY19vX2MpCisKIHF1aWV0X2NtZF9jY19vX1MgPSBDQyAgICAgICRA
CiBjbWRfY2Nfb19TID0gJChDQykgJChhX2ZsYWdzKSAtYyAkPCAtbyAkQAogCi0tIApBbnRob255
IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
