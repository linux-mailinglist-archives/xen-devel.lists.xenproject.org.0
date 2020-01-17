Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C64140881
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 11:58:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPGn-00050g-8B; Fri, 17 Jan 2020 10:54:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cv4k=3G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1isPGl-0004zn-UK
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 10:54:27 +0000
X-Inumbo-ID: b09611b7-3917-11ea-88b0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b09611b7-3917-11ea-88b0-12813bfff9fa;
 Fri, 17 Jan 2020 10:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579258449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iAmpS5V60ZZUaAl6culBzBWtbpVPoDXsvk/RdPpBmE4=;
 b=O9pLZaTU9qzpkFNz/Ur/lK5GTcDQHyMJR9qpGstarpbR+IRq9uIn3BgL
 Jjmjnywq9wzOpTaJzOv1urMI2nFC7JCbJHRAzEnw8sM3G/2vBU/ta+Y60
 RJvSMV+/YSxRSFRrvHrVhLmVlCZuc6oSHg1LRGF7HEnAFeATYlkFe9C+t Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VBXbmtHhuZOneTPoDPRc7PI4q+ogSKIZgjO3H7y6UtN40xfBWcPs6o+5bihbycwezqQ2XRPk3I
 gylLNUQvzM+rfhtHJArvZLcwJ5ho+JF189lLs/B4oO8cOI511KEPaLPgXuBri9BxwwlfbZr/jx
 3oXbiwRgzrPr3j/r2MS3DSjYyrUZz87dXswBLZFh1WNxumbXReX7aync/2rF8TZWpUj2JcOYhP
 HbGT63CHG5sbur/a3tIjAAWk4HD6/q8oZuCOwViVNiUVBUbbHPhZYqGCvnbT/rzwGLz9R1IdVa
 +l0=
X-SBRS: 2.7
X-MesageID: 11432453
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,329,1574139600"; d="scan'208";a="11432453"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 10:53:54 +0000
Message-ID: <20200117105358.607910-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117105358.607910-1-anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2 08/12] xen/build: make tests in test/
 directly
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

SXQgaXMgdW5uZWNlc3NhcnkgdG8gbWFrZSBfdGVzdHMgdmlhIFJ1bGVzLm1rIGJlY2F1c2UgdGhl
IHRhcmdldAp1c2UgUnVsZXMubWsgYXMgd2VsbC4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHhlbi9NYWtlZmlsZSB8IDggKysr
Ky0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL01ha2VmaWxlIGIveGVuL01ha2VmaWxlCmluZGV4IDBlNTg5ZGU3NzU1
ZS4uNWQ3MmQ4MmJlMjYwIDEwMDY0NAotLS0gYS94ZW4vTWFrZWZpbGUKKysrIGIveGVuL01ha2Vm
aWxlCkBAIC01MSw4ICs1MSw4IEBAIGRpc3Q6IGluc3RhbGwKIAogYnVpbGQgaW5zdGFsbDo6IGlu
Y2x1ZGUvY29uZmlnL2F1dG8uY29uZgogCi0uUEhPTlk6IGJ1aWxkIGluc3RhbGwgdW5pbnN0YWxs
IGNsZWFuIGRpc3RjbGVhbiBNQVAgdGVzdHMKLWJ1aWxkIGluc3RhbGwgdW5pbnN0YWxsIGRlYnVn
IGNsZWFuIGRpc3RjbGVhbiBNQVAgdGVzdHM6OgorLlBIT05ZOiBidWlsZCBpbnN0YWxsIHVuaW5z
dGFsbCBjbGVhbiBkaXN0Y2xlYW4gTUFQCitidWlsZCBpbnN0YWxsIHVuaW5zdGFsbCBkZWJ1ZyBj
bGVhbiBkaXN0Y2xlYW4gTUFQOjoKIGlmbmVxICgkKFhFTl9UQVJHRVRfQVJDSCkseDg2XzMyKQog
CSQoTUFLRSkgLWYgUnVsZXMubWsgXyRACiBlbHNlCkBAIC05Miw4ICs5Miw4IEBAIF9pbnN0YWxs
OiAkKFRBUkdFVCkkKENPTkZJR19YRU5fSU5TVEFMTF9TVUZGSVgpCiAJCWZpOyBcCiAJZmkKIAot
LlBIT05ZOiBfdGVzdHMKLV90ZXN0czoKKy5QSE9OWTogdGVzdHMKK3Rlc3RzOgogCSQoTUFLRSkg
LWYgJChCQVNFRElSKS9SdWxlcy5tayAtQyB0ZXN0IHRlc3RzCiAKIC5QSE9OWTogX3VuaW5zdGFs
bAotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
