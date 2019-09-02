Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01355A5B82
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 18:45:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4pOu-0000gp-3h; Mon, 02 Sep 2019 16:41:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jggy=W5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i4pOt-0000gD-1o
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 16:41:55 +0000
X-Inumbo-ID: 90e9b86e-cda0-11e9-951b-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90e9b86e-cda0-11e9-951b-bc764e2007e4;
 Mon, 02 Sep 2019 16:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567442513;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0meibmFtVF5rjp2y3OvLzQtIsV4D/QP6/EhNBr2kTSA=;
 b=aAUPF2Xg9R3PiFUiVFk6pTv0J8Hoab7XiW2Dy7v28kbYfayfJ/Vii6ZA
 wwrpx/X4d+Mkrj2Uh6fRaqAzCSmIll9LrRKmtzLaJ57306ZJzlOSDnOfu
 Iy0HgpuGSWWbRWKOkH+L8KNEgQslBd5tUw89ULQ5yDy5aETFM5/yk0t1J k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XtXXjnNOndeC3ztvsWpxqEhViajElbPYmvRBcVTgRRmy5uzNVGQnRRy9ihVPkZ+LWkAOUOHzJD
 x2gozEpMYI7wH8v7dmoS1v6V8CtXW5LVyeuxjFVL3aK9bfMyUsO+qEtzhDt40aklCN+eS80ceT
 ioeu7bfGgjg7+n9SNo4AZRCg+zF1AmRtnrFiZXHozDyQEJBd1RlCgqpPuA7obf+rlKeqS2jl1D
 +mSQdPQ5IPAEbRYKGhsfXl9th5i0vp2xUQh0P5+YhbWxiPTweyEVaub1txY/4fr4DKXTI5JDv1
 vtE=
X-SBRS: 2.7
X-MesageID: 5072688
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5072688"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 2 Sep 2019 17:41:46 +0100
Message-ID: <20190902164148.28977-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] tools/shim: Bodge things harder
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Sander
 Eikelenboom <linux@eikelenboom.it>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBsb2dpYyBpcyBhbGwgdGVycmlibGUuICBUaGlzIHNlcmllcyBzaG91bGQgcmVzb2x2ZSB0
aGUgcmVwb3J0ZWQgYnVpbGQKZmFpbHVyZSwgYnV0IGRlZmluaXRlbHkgaXNuJ3QgYSAicHJvcGVy
IiBmaXguCgpBbmRyZXcgQ29vcGVyICgyKToKICB0b29scy9zaGltOiBGaXggcmFjZSBjb25kaXRp
b24gY3JlYXRpbmcgbGlua2Zhcm0uc3RhbXAKICB0b29scy9zaGltOiBBcHBseSBtb3JlIGR1Y3Qg
dGFwZSB0byB0aGUgbGlua2Zhcm0gbG9naWMKCiB0b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2Vm
aWxlIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjMg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
