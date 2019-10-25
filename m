Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52511E507E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 17:51:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO1pQ-0000a5-UZ; Fri, 25 Oct 2019 15:48:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Phy=YS=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iO1pP-0000ZS-Cl
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 15:48:39 +0000
X-Inumbo-ID: e6bdb0ca-f73e-11e9-94ca-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6bdb0ca-f73e-11e9-94ca-12813bfff9fa;
 Fri, 25 Oct 2019 15:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572018514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=iO89nNOn9Q9IpL9CCVKYm2NXmXQgP3TfjR9ATqXrfts=;
 b=TfbPpYUR+pCvoVFejWRIZZmhbOjXxUx8Uinah915omeYMfiOKF10SAvs
 gX7cMYHIngltCUNvqxIW0UKAox5H7AL3EI1HkS9HaZLnnnJbWfVNeLLBK
 CoKHrBAdI3XoY2IbFy41jmI7SAce7ePHafXu7zhN6BqFeEERGyBRP2BMN U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2+FYPm9cbwnjFUAfYBWMW3ysFCApjQkayil0UCp2BWq3ck2QPaPxIUAbCvRxCxpaT5iC5Hhphn
 bimPzQG61sbXhcqiNYguCqblyDiHe9fQEYGjcL8sV92vA1FQSLOImQy5JTtiact4LgqvSpfTue
 EC/vGoRJAuh+pc/+ACaz77//wGvhslOTOsbn8x5MkeQ+Kg6u4kygtwhfyqD3avazNYd53eTcxB
 sQrP3dVMkcze+8bhKy8ddtSPBynON0H1RPk/tP53kssaCMPlQUvT7hpJsY2Sn4KDrRayGlM3eA
 Abk=
X-SBRS: 2.7
X-MesageID: 7797902
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,229,1569297600"; 
   d="scan'208";a="7797902"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 25 Oct 2019 16:48:18 +0100
Message-ID: <20191025154819.26593-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191025154819.26593-1-ian.jackson@eu.citrix.com>
References: <20191025154819.26593-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 4/5] adhoc-revtuple-generator: Bisecting
 over 5000 commits
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmF0aGVyIHRoYW4gbWVyZWx5IDEwMDAuICBSaWdodCBub3cgd2UgaGF2ZSBhIHRyb3VibGVzb21l
IEZyZWVCU0QKYnVpbGQgcHJvYmxlbSB3aGljaCBuZWVkcyB0aGlzIQoKU2lnbmVkLW9mZi1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogYWRob2MtcmV2dHVw
bGUtZ2VuZXJhdG9yIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYWRob2MtcmV2dHVwbGUtZ2VuZXJhdG9yIGIvYWRob2Mt
cmV2dHVwbGUtZ2VuZXJhdG9yCmluZGV4IGJlM2YzNzU1Li5hYzBmMjQ2MyAxMDA3NTUKLS0tIGEv
YWRob2MtcmV2dHVwbGUtZ2VuZXJhdG9yCisrKyBiL2FkaG9jLXJldnR1cGxlLWdlbmVyYXRvcgpA
QCAtNTUzLDcgKzU1Myw3IEBAIHN1YiBtYWluICgpIHsKICAgICBteSBAdHJlZXNfY29udGludW91
czsKICAgICBmb3JlYWNoIG15ICR0cmVlIChAdHJlZXMpIHsKICAgICAgICAgbXkgJGdlbj0gdHJl
ZV9nZXRfZ2VuKCR0cmVlKTsKLSAgICAgICAgbXkgJGNvdW50PSAxMDAwOworICAgICAgICBteSAk
Y291bnQ9IDUwMDA7CiAgICAgICAgIG15ICRmb3VuZD0gMDsKICAgICAgICAgbXkgJHRvcD0gdW5k
ZWY7CiAgICAgICAgIHdoaWxlICgkY291bnQtLSA+IDApIHsKLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
