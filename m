Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC5CADC8E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 17:58:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7M0y-0001Nr-Gz; Mon, 09 Sep 2019 15:55:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RLmJ=XE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i7M0x-0001Nm-Cw
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 15:55:39 +0000
X-Inumbo-ID: 442642ac-d31a-11e9-b76c-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 442642ac-d31a-11e9-b76c-bc764e2007e4;
 Mon, 09 Sep 2019 15:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568044538;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zf6bNC9HU8cOyuKaCv1fwvKGH2K+HP7QAO6wpn3xE0I=;
 b=YUPfXTkSzJkA/mtKy+TpRPG2N0cL0QCDpl/puvR6vpz69Asw4dZitOxZ
 GruybnMJKcILdcvg/mlMk4Kx4M72x3Ab5MayWWs6vfWvxm2uqFj0Ndv1k
 MT5hvG+Bn+9OHWDgyrGJeBflF47cewh+E4QHlhgqyG9RNRlyacoaNjUvZ o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XK32eGNbzMhb1Xui/LdmvXORhw74UWjG6qtoLOj6a9U0xiFHDiDW72rowx7SLv++KuncGpihc7
 19TT9Cg0o7UK3LyFr6GAk88CbqQdVg2KTZ91DjbxAMy3TKz8dHcDf4y99CgIHXZyYdOUKoAMSp
 NT5K3jZEnZI4n02A3RhOvV2jH3hJZKrxBjy0rv8UHHpVP42kSYnniHzNqDvJxBFbow4rwfJDEa
 gU2iilsX9tAr17hbjVshI0AvCaXswViBK01uYR2mwMKRfijecXtQ75fuN4y3bT0NmMHCG8QnMI
 wOo=
X-SBRS: 2.7
X-MesageID: 5513400
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,486,1559534400"; 
   d="scan'208";a="5513400"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 9 Sep 2019 16:55:34 +0100
Message-ID: <20190909155534.20514-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/cpuid: Fix build with CentOS 6 following
 c/s 7479151106
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R0NDIG9mIGEgQ2VudE9TIDYgdmludGFnZSBjb21wbGFpbnM6CgogIGNwdWlkLmM6IEluIGZ1bmN0
aW9uICdwYXJzZV94ZW5fY3B1aWQnOgogIGNwdWlkLmM6MzI6IGVycm9yOiAnbWlkJyBtYXkgYmUg
dXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24KClRoaXMgY2FuJ3Qgb2NjdXIgaW4g
cHJhY3RpY2UgYmVjYXVzZSB0aGUgd2hpbGUoKSBsb29wIGlzIGd1YXJlbnRlZWQgdG8gYmUKZW50
ZXJlZCwgYnV0IGluaXRpYWxpc2UgbWlkIHRvIHdvcmsgYXJvdW5kIHRoZSBpc3N1ZXMuCgpTcG90
dGVkIGJ5IEdpdGxhYiBDSS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29t
PgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9jcHVpZC5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2NwdWlkLmMgYi94ZW4vYXJjaC94ODYvY3B1aWQuYwppbmRleCAzNmIxZTJjZTRjLi5h
Y2JhMGY3NTgzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1aWQuYworKysgYi94ZW4vYXJj
aC94ODYvY3B1aWQuYwpAQCAtMjksNyArMjksNyBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV94
ZW5fY3B1aWQoY29uc3QgY2hhciAqcykKICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWU7CiAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgYml0OwogICAgICAgICB9IGZlYXR1cmVzW10gX19pbml0
Y29uc3RyZWwgPSBJTklUX0ZFQVRVUkVfTkFNRVM7Ci0gICAgICAgIGNvbnN0IHN0cnVjdCBmZWF0
dXJlICpsaHMsICptaWQsICpyaHM7CisgICAgICAgIGNvbnN0IHN0cnVjdCBmZWF0dXJlICpsaHMs
ICpyaHMsICptaWQgPSBOVUxMIC8qIEdDQy4uLiAqLzsKICAgICAgICAgY29uc3QgY2hhciAqZmVh
dDsKIAogICAgICAgICBzcyA9IHN0cmNocihzLCAnLCcpOwotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
