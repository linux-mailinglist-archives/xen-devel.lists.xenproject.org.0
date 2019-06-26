Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8258056B6D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 15:59:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg8P5-0007Ho-NJ; Wed, 26 Jun 2019 13:56:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ehih=UZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hg8P3-0007HR-HE
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 13:56:01 +0000
X-Inumbo-ID: 214bf4ca-981a-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 214bf4ca-981a-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 13:56:00 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KuEsmgwWKKfV/Thi/04Q+OUxbrEXOj898VOjqm/Ff8CIEiWBzFIDVsES7Z8C5CkjQIkd7dNJwp
 nXQmg1D2BkhvHVaCp8ULiFvwOd4VbSBkmfH3ZYjXE9Xl/fNCjvsO7krN0nirKa4w9Y+M5D65e+
 yy5anaBlc2sShmxMccDJHnb6B55v+9mQnRsR3WjIEMCrcddVuZWR6iQZAgHaSqDmlMJVYkhUeO
 XfzjvR4opEcgUz09wuos7taHgFHlRFlAEdc6UQB8jgKbmwPMA6+AdNEiYwgR0gTjHmI0yFc4P7
 ayU=
X-SBRS: 2.7
X-MesageID: 2265987
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,420,1557201600"; 
   d="scan'208";a="2265987"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Jun 2019 15:55:45 +0200
Message-ID: <20190626135546.50665-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190626135546.50665-1-roger.pau@citrix.com>
References: <20190626135546.50665-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/5] kconfig: disable non-literal format string
 warnings
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
Cc: Doug Goldstein <cardoe@cardoe.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

S2NvbmZpZyBtYWtlcyBoZWF2eSB1c2Ugb2Ygbm9uLWxpdGVyYWxzIGFzIGZvcm1hdCBzdHJpbmdz
LCBkaXNhYmxlCmNvbXBpbGVyIHdhcm5pbmdzIHNpbmNlIHRoaXMgaXMgZXhwZWN0ZWQgdXNhZ2Uu
CgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
LS0tCkNjOiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+Ci0tLQogeGVuL3Rvb2xz
L2tjb25maWcvTWFrZWZpbGUua2NvbmZpZyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29u
ZmlnIGIveGVuL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2NvbmZpZwppbmRleCAxMzhiZjNmMWI3
Li43NjNkZTM3YTE0IDEwMDY0NAotLS0gYS94ZW4vdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29u
ZmlnCisrKyBiL3hlbi90b29scy9rY29uZmlnL01ha2VmaWxlLmtjb25maWcKQEAgLTQzLDYgKzQz
LDExIEBAIEZPUkNFOgogIyBTZXRzIHRvb2xjaGFpbiBiaW5hcmllcyB0byB1c2UKIGluY2x1ZGUg
JChYRU5fUk9PVCkvY29uZmlnLyQoc2hlbGwgdW5hbWUgLXMpLm1rCiAKKyMgRGlzYWJsZSBmb3Jt
YXQgd2FybmluZ3MsIGtjb25maWcgbWFrZXMgaGVhdnkgdXNlIG9mIG5vbi1saXRlcmFsIGZvcm1h
dAorIyBzdHJpbmdzLgorSE9TVENGTEFHUyArPSAtV25vLWZvcm1hdAorSE9TVENYWEZMQUdTICs9
IC1Xbm8tZm9ybWF0CisKICMgaW5jbHVkZSB0aGUgb3JpZ2luYWwgTWFrZWZpbGUgYW5kIE1ha2Vm
aWxlLmhvc3QgZnJvbSBMaW51eAogaW5jbHVkZSAkKHNyYykvTWFrZWZpbGUKIGluY2x1ZGUgJChz
cmMpL01ha2VmaWxlLmhvc3QKLS0gCjIuMjAuMSAoQXBwbGUgR2l0LTExNykKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
