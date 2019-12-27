Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D585412B5DF
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 17:34:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iksXs-0001fp-AI; Fri, 27 Dec 2019 16:33:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CFv7=2R=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iksXr-0001fD-2x
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 16:32:59 +0000
X-Inumbo-ID: 7dcd4904-28c6-11ea-9c5f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7dcd4904-28c6-11ea-9c5f-12813bfff9fa;
 Fri, 27 Dec 2019 16:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577464356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zRCo77vsL05BNptKc1EvuDzCOM4b+dw/e38bcwxbjAI=;
 b=QpjYN044Ol4Ttoz9GQYBsinFwqUprUp7fhQBocw/ARzq7exdTBFaAHec
 iJerbNbnPedsAzBnSHoZhRmdrDzI7CyPtc948A0XmvBDGLXpm/saejjGL
 76Fo5WmWtHVZvEmy/4hlkGsiBHQp9jlsXtpHwihVZPHGnq07FT5vjLk4v k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ccg/gV9gATPlXFZbeXyS8kjxGBRHwg8XxtUXYaw2vzDqIscRUUn32Z2mqfRh8a0wgLhAuTEnCH
 zUN7eRhxHXajS96KfD3kZHVnBh4wK1EocK3XQo9OjdEGQHqJZQmrzptJl/3TEc9X19CW3DoMH6
 nw+q59xLa9RR5MK19mSbOCj6Y/iBtRe00gTVAfMUFFgwj1FOEfZeEyTc1zS1sCwtGJOxXOtduG
 MlI5m4opL+YMSdtcrPPZwu0AQjw7Lsf5Kpp7s4dmQvVCVNHR973h/9MBkzH61Whm+RZxAJ4hPn
 3Rc=
X-SBRS: 2.7
X-MesageID: 10626145
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,363,1571716800"; d="scan'208";a="10626145"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 27 Dec 2019 16:32:24 +0000
Message-ID: <20191227163224.4113837-9-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191227163224.4113837-1-george.dunlap@citrix.com>
References: <20191227163224.4113837-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 9/9] DO NOT APPLY: Sketch constructors,
 DomainCreateNew
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhIHNrZXRjaCBvZiBmdW5jdGlvbmFsaXR5IHN1aXRhYmxlIGZvciBjcmVhdGluZyBh
IGJhc2ljCmRvbWFpbiwgd2l0aCBhIGRpc2sgYW5kIGEgdmlmLiAgRG9tYWluQ29uZmlnLCBEZXZp
Y2VEaXNrLCBhbmQKRGV2aWNlTmljIHR5cGVzIGFyZSBhbGwgY3JlYXRlZCB1c2luZyBjb25zdHJ1
Y3RvciBmdW5jdGlvbnMsIHdoaWNoCmluaXRpYWxpemUgdGhlbSB3aXRoIGxpYnhsJ3MgZGVmYXVs
dHMuCgpEb21haW5DcmVhdGVOZXcgdGFrZXMgdGhlIGNvbmZpZyBhbmQgY2FsbHMgd2l0aG91dCBh
bnkgdXBkYXRlcy4KCk9idmlvdXNseSBzb21lIG9mIHRoZXNlIHdpbGwgbmVlZCB0byBiZSBjaGFu
Z2VkIGl0IHdlIHN3aXRjaCB0bwpwYXNzaW5nIHJlZmVyZW5jZXMgdG8gLnRvQygpIHJhdGhlciB0
aGFuIHBhc3NpbmcgYmFjayBieSB2YWx1ZS4KClRoZSBtYWluIHB1cnBvc2Ugb2YgdGhpcyBpcyB0
byBhbGxvdyB0ZXN0aW5nIG9mIGNyZWF0aW5nIGEgaGFyZC1jb2RlZApkb21haW4uCgpTaWduZWQt
b2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQpDQzog
TmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KLS0tCiB0b29scy9nb2xhbmcv
eGVubGlnaHQveGVubGlnaHQuZ28gfCA2NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2dv
bGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdo
dC5nbwppbmRleCBmNzBhNGM2ZDk2Li45MWRhNzliYzY4IDEwMDY0NAotLS0gYS90b29scy9nb2xh
bmcveGVubGlnaHQveGVubGlnaHQuZ28KKysrIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxp
Z2h0LmdvCkBAIC0xMDc5LDMgKzEwNzksNjkgQEAgZnVuYyAoQ3R4ICpDb250ZXh0KSBQcmltYXJ5
Q29uc29sZUdldFR0eShkb21pZCB1aW50MzIpIChwYXRoIHN0cmluZywgZXJyIGVycm9yKQogCXBh
dGggPSBDLkdvU3RyaW5nKGNwYXRoKQogCXJldHVybgogfQorCitmdW5jIE5ld0RvbWFpbkNvbmZp
Zyh0IERvbWFpblR5cGUpICgqRG9tYWluQ29uZmlnLCBlcnJvcikgeworCXZhciBjY29uZmlnIEMu
bGlieGxfZG9tYWluX2NvbmZpZworCisJQy5saWJ4bF9kb21haW5fY29uZmlnX2luaXQoJmNjb25m
aWcpCisJQy5saWJ4bF9kb21haW5fYnVpbGRfaW5mb19pbml0X3R5cGUoJmNjb25maWcuYl9pbmZv
LCBDLmxpYnhsX2RvbWFpbl90eXBlKHQpKQorCisJZ2NvbmZpZyA6PSAmRG9tYWluQ29uZmlne30K
KwllcnIgOj0gZ2NvbmZpZy5mcm9tQygmY2NvbmZpZykKKwlpZiBlcnIgIT0gbmlsIHsKKwkJcmV0
dXJuIG5pbCwgZXJyCisJfQorCisJcmV0dXJuIGdjb25maWcsIG5pbAorfQorCitmdW5jIE5ld0Rl
dmljZURpc2soKSAoKkRldmljZURpc2ssIGVycm9yKSB7CisJdmFyIGN0eXBlIEMubGlieGxfZGV2
aWNlX2Rpc2sKKworCUMubGlieGxfZGV2aWNlX2Rpc2tfaW5pdCgmY3R5cGUpCisKKwlndHlwZSA6
PSAmRGV2aWNlRGlza3t9CisJZXJyIDo9IGd0eXBlLmZyb21DKCZjdHlwZSkKKworCWlmIGVyciAh
PSBuaWwgeworCQlyZXR1cm4gbmlsLCBlcnIKKwl9CisKKwlyZXR1cm4gZ3R5cGUsIG5pbAorfQor
CitmdW5jIE5ld0RldmljZU5pYygpICgqRGV2aWNlTmljLCBlcnJvcikgeworCXZhciBjdHlwZSBD
LmxpYnhsX2RldmljZV9uaWMKKworCUMubGlieGxfZGV2aWNlX25pY19pbml0KCZjdHlwZSkKKwor
CWd0eXBlIDo9ICZEZXZpY2VOaWN7fQorCWVyciA6PSBndHlwZS5mcm9tQygmY3R5cGUpCisKKwlp
ZiBlcnIgIT0gbmlsIHsKKwkJcmV0dXJuIG5pbCwgZXJyCisJfQorCisJcmV0dXJuIGd0eXBlLCBu
aWwKK30KKworLy8gaW50IGxpYnhsX2RvbWFpbl9jcmVhdGVfbmV3KGxpYnhsX2N0eCAqY3R4LCBs
aWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZpZywKKy8vICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1aW50MzJfdCAqZG9taWQsCisvLyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgbGlieGxfYXN5bmNvcF9ob3cgKmFvX2hvdywKKy8vICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBsaWJ4bF9hc3luY3Byb2dyZXNzX2hvdyAqYW9wX2NvbnNvbGVfaG93KQorZnVu
YyAoQ3R4ICpDb250ZXh0KSBEb21haW5DcmVhdGVOZXcoY29uZmlnICpEb21haW5Db25maWcpIChE
b21pZCwgZXJyb3IpIHsKKwl2YXIgY2RvbWlkIEMudWludDMyX3QKKwljY29uZmlnLCBlcnIgOj0g
Y29uZmlnLnRvQygpCisJaWYgZXJyICE9IG5pbCB7CisJCXJldHVybiBEb21pZCgwKSwgZm10LkVy
cm9yZigiQ29udmVydGluZyBkb21haW4gY29uZmlnIHRvIEM6ICV2IiwgZXJyKQorCX0KKwlkZWZl
ciBDLmxpYnhsX2RvbWFpbl9jb25maWdfZGlzcG9zZSgmY2NvbmZpZykKKworCWZtdC5FcnJvcmYo
IkNhbGxpbmcgbGlieGxfZG9tYWluX2NyZWF0ZV9uZXciKQorCXJldCA6PSBDLmxpYnhsX2RvbWFp
bl9jcmVhdGVfbmV3KEN0eC5jdHgsICZjY29uZmlnLCAmY2RvbWlkLCBuaWwsIG5pbCkKKwlpZiBy
ZXQgIT0gMCB7CisJCXJldHVybiBEb21pZCgwKSwgRXJyb3IocmV0KQorCX0KKworCXJldHVybiBE
b21pZChjZG9taWQpLCBuaWwKK30KLS0gCjIuMjQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
