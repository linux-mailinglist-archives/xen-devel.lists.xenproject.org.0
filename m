Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89502133F80
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 11:43:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip8kI-0007yF-Jw; Wed, 08 Jan 2020 10:39:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/T5=25=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ip8kH-0007xm-1A
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 10:39:25 +0000
X-Inumbo-ID: 19d012ce-3203-11ea-bf56-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19d012ce-3203-11ea-bf56-bc764e2007e4;
 Wed, 08 Jan 2020 10:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578479949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UTOC1SLaRcRa8O25+Sabf5ebK+DXQWP5BRGRflW7lg0=;
 b=VD1xrchE7aebqlo0is2hE0sNzuTO28YT7llh28Ahut2LOozSbDNd2+gL
 +bPG7Do3b4fXhPwD0Lced/R0jtrdZ2ZRbCQS6d2c7oelJTGT+hf4oTVX2
 cQt+zkm+CwABfGGC940JcCwZ6MBcNY3H8IjeMoKMeFX/fuLXgibF/OY0/ I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cQwm1PuzisoVEkLdpEdO+jzliCGBV4ULVdKS07BcOVb4OL0eiqrWfUM1zBjEV4pw690lX6IJGu
 E7Aht0/V1qfoXdznquRFZcRnkB4wVEEM7skQoZFoNQfQcJOWdbVOafX4s+LdIX0e3x7UyPGOtk
 IqTyZDDBjQ2wYzv37JUQJWquUmfJfh6dlEzpcTURqH8rLSVq9TSgBY/NA4hz/rbEsuXILpDAiF
 UaAko0hsXAPhxJnmAfWwN3+ZdZBQj6HpINDG2EB3DrM7VXeyLGMv1XMchh7KlHm8ZLDNLRltZe
 Aug=
X-SBRS: 2.7
X-MesageID: 11047490
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,409,1571716800"; d="scan'208";a="11047490"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 8 Jan 2020 11:38:57 +0100
Message-ID: <20200108103857.77236-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108103857.77236-1-roger.pau@citrix.com>
References: <20200108103857.77236-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] Revert "tools/libxc: disable x2APIC when
 using nested virtualization"
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA3YjNjNWI3MGEzMjMwM2I0NmQwZDA1MWU2OTVmMThkNzJjY2U1
ZWQwIGFuZApyZS1lbmFibGVzIHRoZSB1c2FnZSBvZiB4MkFQSUMgd2l0aCBuZXN0ZWQgdmlydHVh
bGl6YXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KLS0tCiB0b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYyB8IDExIC0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGMveGNfY3B1aWRfeDg2LmMgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwppbmRleCBhYzM4
YzE0MDZlLi4yNTQwYWExZTFjIDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYu
YworKysgYi90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwpAQCAtNjUzLDE3ICs2NTMsNiBAQCBp
bnQgeGNfY3B1aWRfYXBwbHlfcG9saWN5KHhjX2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBkb21p
ZCwKICAgICAgICAgcC0+ZXh0ZC5pdHNjID0gdHJ1ZTsKICAgICAgICAgcC0+YmFzaWMudm14ID0g
dHJ1ZTsKICAgICAgICAgcC0+ZXh0ZC5zdm0gPSB0cnVlOwotCi0gICAgICAgIC8qCi0gICAgICAg
ICAqIEJPREdFOiBkb24ndCBhbm5vdW5jZSB4MkFQSUMgbW9kZSB3aGVuIHVzaW5nIG5lc3RlZCB2
aXJ0dWFsaXphdGlvbiwKLSAgICAgICAgICogYXMgaXQgZG9lc24ndCB3b3JrIHByb3Blcmx5LiBU
aGlzIHNob3VsZCBiZSByZW1vdmVkIG9uY2UgdGhlCi0gICAgICAgICAqIHVuZGVybHlpbmcgYnVn
KHMpIGFyZSBmaXhlZC4KLSAgICAgICAgICovCi0gICAgICAgIHJjID0geGNfaHZtX3BhcmFtX2dl
dCh4Y2gsIGRvbWlkLCBIVk1fUEFSQU1fTkVTVEVESFZNLCAmdmFsKTsKLSAgICAgICAgaWYgKCBy
YyApCi0gICAgICAgICAgICBnb3RvIG91dDsKLSAgICAgICAgaWYgKCB2YWwgKQotICAgICAgICAg
ICAgcC0+YmFzaWMueDJhcGljID0gZmFsc2U7CiAgICAgfQogCiAgICAgcmMgPSB4ODZfY3B1aWRf
Y29weV90b19idWZmZXIocCwgbGVhdmVzLCAmbnJfbGVhdmVzKTsKLS0gCjIuMjQuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
