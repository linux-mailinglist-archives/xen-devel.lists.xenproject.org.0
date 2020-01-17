Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A3A14087E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 11:57:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPGd-0004ul-7l; Fri, 17 Jan 2020 10:54:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cv4k=3G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1isPGb-0004uA-Tf
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 10:54:17 +0000
X-Inumbo-ID: af6d3e4a-3917-11ea-88b0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af6d3e4a-3917-11ea-88b0-12813bfff9fa;
 Fri, 17 Jan 2020 10:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579258447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6/qLtkj5Jww3gcQ65tbXPo+HgTWCoq9UnH4sl83WjiQ=;
 b=HN5dR0nxa187o49+EAq3alSjy3DKMYCXoLJYgZzE+T6PyMx7nGSAHcsS
 ZyC3C/b7oLRL/aZk95OTStM3tgEGz9viwdDvJ/F5aBOXNZsxgr7/rYdx0
 lqAck2RQ7aLYSO9nK8pq8B6nEo8himDoYR6UikqT1taImF0sQfqz2QmNi I=;
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
IronPort-SDR: v5wtkjO/h4kST/tUm8SjDFWG9L5NuJYxBF173ZfCt8+DjuKgjd6s9pGJfyTni+pqRnc2Xz+WQA
 VaFmY48d8/1HHMutR+eWkZDMshQ0jdbCblzz034SaA7up2sJM4x2HnewYGRgBX4S8MfhbFLIH6
 tZZpRH6Kb7lOM67R+RBO+jBYAIwPkvWWxfxBEoJwAEahetAq16k+YaXiMk5PUpzni1bjBVL17Z
 I7NSgxxBDRqVlct7MSeGNqqKW5SxC39kM6NHK2Ovyel4/0LWqi0L915mxw1GcfUcYhwZKoBy2o
 kLs=
X-SBRS: 2.7
X-MesageID: 11432450
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,329,1574139600"; d="scan'208";a="11432450"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 10:53:51 +0000
Message-ID: <20200117105358.607910-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117105358.607910-1-anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2 05/12] xen/include: remove include of
 Config.mk
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

SXQgaXNuJ3QgbmVjZXNzYXJ5IHRvIGluY2x1ZGUgQ29uZmlnLm1rIGhlcmUgYmVjYXVzZSB0aGlz
IE1ha2VmaWxlIGlzCm9ubHkgdXNlZCBieSB4ZW4vUnVsZXMubWsgd2hpY2ggYWxyZWFkeSBpbmNs
dWRlcyBDb25maWcubWsuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9NYWtlZmlsZSB8IDIgLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL01ha2Vm
aWxlIGIveGVuL2luY2x1ZGUvTWFrZWZpbGUKaW5kZXggZmRlMGNhMDEzMTIxLi40MzNiYWQ5MDU1
YjIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL01ha2VmaWxlCisrKyBiL3hlbi9pbmNsdWRlL01h
a2VmaWxlCkBAIC0xLDUgKzEsMyBAQAotaW5jbHVkZSAkKFhFTl9ST09UKS9Db25maWcubWsKLQog
aWZuZXEgKCQoQ09ORklHX0NPTVBBVCksKQogCiBjb21wYXQtYXJjaC0kKENPTkZJR19YODYpIDo9
IHg4Nl8zMgotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
