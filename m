Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4215ADC9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 17:56:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1vDT-0007qx-0a; Wed, 12 Feb 2020 16:50:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zgzp=4A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1vDS-0007qs-CI
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 16:50:22 +0000
X-Inumbo-ID: bf76362a-4db7-11ea-aa99-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf76362a-4db7-11ea-aa99-bc764e2007e4;
 Wed, 12 Feb 2020 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581526218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6BvJkuibN7HhfH8kxdvVgvoJvORSwTv2YVrgWCXFkl0=;
 b=btBJXa1ZAZE2jCqtXPQXqZ6cyZhBFsj7bepuG2Ah1ZEW8PyiYf4oc4A3
 mGwAkkxegA2xjW6Q0JfH56y9cgVRFoKUVxMU9Ep0SThxUObiBBFKtLQqe
 ATctTFFw8PB8etmIK6iTBizT+nxghnHyTgCp/onZcDlsquY4W/0W6kqiG M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XDQ/qvj5N9aUwT/C8orCEfen/f6aLpmjivf723f3GIOqqOjnFJmUUqpqMVQR3Zc4A6BhI6kZle
 b0HDu7ZCkTM0eTVAuoodQ2nkWbfGa+YaaHOkTMXCHiqa8I2tUlSfhdDvuaN+9+xTvmBunUW9H+
 GiHC8UCVHkO/oM+JGKaBwGQNpJ77mq7V9+o9AETOtMVD/tIe0Hz+Iq4tle/4bbSzDjA/t3JT3y
 c3/ptIvKymwV60hStlDXoUJRRbIpKk4tWvwZixDBEc85X4aIfDiHDiKsNLg0YfV02HHXTR8HK2
 TBo=
X-SBRS: 2.7
X-MesageID: 12353165
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="12353165"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 12 Feb 2020 17:49:47 +0100
Message-ID: <20200212164949.56434-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200212164949.56434-1-roger.pau@citrix.com>
References: <20200212164949.56434-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] x86/smp: unify header includes in smp.h
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VW5pZnkgdGhlIHR3byBhZGphY2VudCBoZWFkZXIgaW5jbHVkZXMgdGhhdCBhcmUgYm90aCBnYXRl
ZCB3aXRoIGlmbmRlZgpfX0FTU0VNQkxZX18uCgpObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRl
ZC4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgotLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvc21wLmggfCA1ICstLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9zbXAuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvc21wLmgKaW5kZXggMWFhNTVk
NDFlMS4uOTJkNjlhNWVhMCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9zbXAuaAor
KysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3NtcC5oCkBAIC01LDEzICs1LDEwIEBACiAgKiBXZSBu
ZWVkIHRoZSBBUElDIGRlZmluaXRpb25zIGF1dG9tYXRpY2FsbHkgYXMgcGFydCBvZiAnc21wLmgn
CiAgKi8KICNpZm5kZWYgX19BU1NFTUJMWV9fCisjaW5jbHVkZSA8eGVuL2JpdG9wcy5oPgogI2lu
Y2x1ZGUgPHhlbi9rZXJuZWwuaD4KICNpbmNsdWRlIDx4ZW4vY3B1bWFzay5oPgogI2luY2x1ZGUg
PGFzbS9jdXJyZW50Lmg+Ci0jZW5kaWYKLQotI2lmbmRlZiBfX0FTU0VNQkxZX18KLSNpbmNsdWRl
IDx4ZW4vYml0b3BzLmg+CiAjaW5jbHVkZSA8YXNtL21wc3BlYy5oPgogI2VuZGlmCiAKLS0gCjIu
MjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
