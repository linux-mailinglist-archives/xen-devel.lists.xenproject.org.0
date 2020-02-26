Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731416FDE0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:36:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6uxQ-0001IZ-OC; Wed, 26 Feb 2020 11:34:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6uxO-0001HY-W1
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:34:27 +0000
X-Inumbo-ID: e39d476d-588b-11ea-93fd-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e39d476d-588b-11ea-93fd-12813bfff9fa;
 Wed, 26 Feb 2020 11:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582716844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zE3Bm6eVYCfqIOYWXu0WJVEEm1KRkMR9dJalinzfSvA=;
 b=Yqy6PcVw5sqfbzoqSNrnf5ZRN/5+DH/Ooo/ikrsNCiAcZl32NCVkg18/
 hbl/Nb3Le5363ksZFo8YsMMnIyC/cGIYHG3f2tD632BZmmkXyKn2hIFe6
 nTDe3Ho/COHfhcnpdWf/Kbk/9u1tWj6nVn4uLATsQzQuyWhdGJkUzJ6+p s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Bw5HqC+mPz7j6aCFOOTpGEeq/fRfk/GkAU2KhahDCOXn+5iFvaICeqjH0JvRffjwx5rWxY1UJ4
 tWoEw/pluDFW7jjQnrLxCpjnrgGCp7hAiX9lBLmcPQFdCJ0jPlwC0jHO3/GyxFHGwDva42CZhf
 6jLouLG3fFanY1LDdCdemvdtWSlsZ4ncMTW11rlFlsw1MhTBoRYjHWwEeBRsDNmchIyBp8Wxs5
 jiB9nCt/+OfSC0AStHXQgC6H2NwXOZ/fuv6ZXtEjBPS5YnyBVapvAxHQ4KGIxviByDdHqgnXYg
 Rfg=
X-SBRS: 2.7
X-MesageID: 13211004
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13211004"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:35 +0000
Message-ID: <20200226113355.2532224-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 03/23] xen/build: Remove confusing
 comment on the %.s:%.S rule
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

VGhhdCBjb21tZW50IHdhcyBpbnRyb2R1Y2UgYnkgMzk0M2RiNzc2MzcxICgiW1hFTl0gQ2FuIGJl
IGJ1aWx0Ci1zdGQ9Z251OTkgKGV4Y2VwdCBmb3IgLlMgZmlsZXMpLiIpIHRvIGV4cGxhaW4gd2h5
IENGTEFHUyB3YXMgcmVtb3ZlZApmcm9tIHRoZSBjb21tYW5kIGxpbmUuIFRoZSBjb21tZW50IGlz
IGFscmVhZHkgd3JpdHRlbiB3aGVyZSB0aGUKLXN0ZD1nbnUgZmxhZ3MgZ2V0cyByZW1vdmUgZnJv
bSBBRkxBR1MsIG5vIG5lZWQgdG8gcmVwZWF0IGl0LgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MzoKICAg
IC0gbmV3IHBhdGNoCgogeGVuL1J1bGVzLm1rIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9SdWxlcy5tayBiL3hlbi9SdWxlcy5tawppbmRleCBk
MjJhMTZkMjgyODIuLmMyMTIwMzM1MWE5ZiAxMDA2NDQKLS0tIGEveGVuL1J1bGVzLm1rCisrKyBi
L3hlbi9SdWxlcy5tawpAQCAtMjMwLDcgKzIzMCw2IEBAICQoZmlsdGVyICUuaW5pdC5vLCQob2Jq
LXkpICQob2JqLWJpbi15KSAkKGV4dHJhLXkpKTogJS5pbml0Lm86ICUubyBNYWtlZmlsZQogJS5z
OiAlLmMgTWFrZWZpbGUKIAkkKENDKSAkKGZpbHRlci1vdXQgLVdhJChjb21tYSklLCQoQ0ZMQUdT
KSkgLVMgJDwgLW8gJEAKIAotIyAtc3RkPWdudXs4OSw5OX0gZ2V0cyBjb25mdXNlZCBieSAjIGFz
IGFuIGVuZC1vZi1saW5lIGNvbW1lbnQgbWFya2VyCiAlLnM6ICUuUyBNYWtlZmlsZQogCSQoQ1BQ
KSAkKGZpbHRlci1vdXQgLVdhJChjb21tYSklLCQoQUZMQUdTKSkgJDwgLW8gJEAKIAotLSAKQW50
aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
