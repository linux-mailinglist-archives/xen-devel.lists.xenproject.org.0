Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 882BD159033
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 14:45:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1VoE-0005pl-4D; Tue, 11 Feb 2020 13:42:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pFJM=37=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1j1VoC-0005pO-4E
 for xen-devel@lists.xen.org; Tue, 11 Feb 2020 13:42:36 +0000
X-Inumbo-ID: 5bd021dc-4cd4-11ea-b59c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bd021dc-4cd4-11ea-b59c-12813bfff9fa;
 Tue, 11 Feb 2020 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581428556;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=3n+EJYsxl7QmkT2Bt4LnCJnSYX78SZ5DYke0LEDqfCI=;
 b=QKsTfAYTbeijuNdYgu5o+E3dAMgLcYYd8BKgnRvNn7CkuKYJfz/cYu2j
 b0GloeZHk0p1768ZL2C52nP6jlm7jz3o3DRMxFV6lkX+p2QT/XXat52W4
 CsM9pTlQU0XXkqPveWkLxvgFeQLLfAFdqE6adkUunHL1LtkvvkqEX/VCG U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qZj3U2g0F6mLIy5m8LCAe5EXDuR0ZFfhjUT0ms6Q6wRiU9DWm12tU6o+HNVCE16IkWLTGwBdCc
 Ovnu1EihpNl/S4BWmBDftoQI5f4DsZsJx40c6mytqYZtX5sF3Aul5wsStOqH0BzBxXQXOp4X3+
 qjVvFQxRiFkc+F6woQ0pVJWcxfrvzUQgJfT5in1VI5iNJA5fW6JA2Jb8hxTO/0VFlg7yz9HCGN
 GvO+slp5ybzDbrIk2Q4WciMpYzAht+wQCpYbYfkqyA0ns7knMDOT3x47wuLiWSnHI0G90Zzonx
 5xM=
X-SBRS: 2.7
X-MesageID: 12443541
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12443541"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>
Date: Tue, 11 Feb 2020 13:42:18 +0000
Message-ID: <20200211134220.9194-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/2] xsm: hide detailed Xen version
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm93IGEgcHJvcGVyIDIgcGF0Y2hlcyBzZXJpZXMuCgpTZXJnZXkgRHlhc2xpICgyKToKICB4c206
IGFkZCBLY29uZmlnIG9wdGlvbiBmb3IgZGVuaWVkIHN0cmluZwogIHhzbTogaGlkZSBkZXRhaWxl
ZCBYZW4gdmVyc2lvbiBmcm9tIHVucHJpdmlsZWdlZCBndWVzdHMKCiB0b29scy9maXJtd2FyZS9o
dm1sb2FkZXIvaHZtbG9hZGVyLmMgfCAgMSArCiB0b29scy9maXJtd2FyZS9odm1sb2FkZXIvc21i
aW9zLmMgICAgfCAgMSArCiB0b29scy9maXJtd2FyZS9odm1sb2FkZXIvdXRpbC5jICAgICAgfCAx
MSArKysrKysrKysrKwogdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3V0aWwuaCAgICAgIHwgIDIg
KysKIHhlbi9jb21tb24vS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKysrCiB4
ZW4vY29tbW9uL2tlcm5lbC5jICAgICAgICAgICAgICAgICAgfCAxMSArKysrKysrKysrKwogeGVu
L2NvbW1vbi92ZXJzaW9uLmMgICAgICAgICAgICAgICAgIHwgIDQgKysrKwogeGVuL2luY2x1ZGUv
cHVibGljL3ZlcnNpb24uaCAgICAgICAgIHwgIDUgKysrKysKIHhlbi9pbmNsdWRlL3hzbS9kdW1t
eS5oICAgICAgICAgICAgICB8IDE2ICsrKysrKysrKysrKy0tLS0KIDkgZmlsZXMgY2hhbmdlZCwg
NTUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
