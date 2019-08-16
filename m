Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70980906B9
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 19:23:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyftd-0005Nw-Uk; Fri, 16 Aug 2019 17:20:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hd7z=WM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hyftc-0005MY-0B
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 17:20:12 +0000
X-Inumbo-ID: 18717d32-c04a-11e9-8bb8-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18717d32-c04a-11e9-8bb8-12813bfff9fa;
 Fri, 16 Aug 2019 17:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565976010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=82ZbikFKs83H7aVvGKJIWGELCj/Vwfn/y9lDcKIpcZI=;
 b=Mp0b48higeXeFwxROChM6pG717DyAFsG1uhOprvMup96xAf3OIV0TSV9
 L5EvQNbBJr3L7FZ5kJUDIaN4sDQS97yvh7hUdPcOeh1EJEK0Zk/tBOmZr
 Mu+BhYRDAvCAnRiU/epmVwHuJXzVzIR+qEWiq0VYzL6eUUZ/CyPPaSFgz o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kGuTAYVLahLSLvqd+k6lyuwSOmwAqiDruINmvHUgL997yMWZHG4Bp9HHXgI+WSYpXBF/MIb5A7
 3DJlWawgcYjaum+oIKKDDmCxCNNgLmsjiUR+H4nDXya2E46gmcFpYa7k/1J59HMf8CNEmCJvEs
 MgsYTwIQTzfmFtwVpnI70WSx/NNMkGLRUKq/OqGWPmnWG9aQolmU1roVJwebQd+VcLnBLvFQnL
 sfSRHRLIvwD67Yma1jCeGZXBTexzj2pINzL9ookFMj/PR5Yu9S5iQ429OeKb6Hr7oPZLU2Gyaj
 9dk=
X-SBRS: 2.7
X-MesageID: 4565641
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,394,1559534400"; 
   d="scan'208";a="4565641"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 16 Aug 2019 18:19:56 +0100
Message-ID: <20190816172001.3905-6-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190816172001.3905-1-paul.durrant@citrix.com>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 05/10] x86/domain: remove the 's3_integrity'
 flag
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZsYWcgaXMgbm90IG5lZWRlZCBzaW5jZSB0aGUgZG9tYWluICdvcHRpb25zJyBjYW4gbm93
IGJlIHRlc3RlZApkaXJlY3RseS4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5k
dXJyYW50QGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNj
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKdjQ6CiAtIHMvVEJPT1QvQ09ORklHX1RCT09UL2cKCnYz
OgogLSBBbHNvIHNhbml0aXNlIHRoZSBmbGFnIGFnYWluc3QgQ09ORklHX1RCT09UIGJlaW5nIHNl
dAotLS0KIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgfCA5ICsrKysrKystLQogeGVuL2Fy
Y2gveDg2L3NldHVwLmMgICAgICAgICB8IDIgKy0KIHhlbi9hcmNoL3g4Ni90Ym9vdC5jICAgICAg
ICAgfCAyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oIHwgMiAtLQogNCBmaWxlcyBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2RvbWFpbi5jIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCmluZGV4IGJjMGRiMDMz
ODcuLmYxNDRkOGZlOWEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYworKysgYi94
ZW4vYXJjaC94ODYvZG9tYWluLmMKQEAgLTQ2Niw2ICs0NjYsMTMgQEAgaW50IGFyY2hfc2FuaXRp
c2VfZG9tYWluX2NvbmZpZyhzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gKmNvbmZpZykK
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICAgfQogCisgICAgaWYgKCAoY29uZmlnLT5mbGFn
cyAmIFhFTl9ET01DVExfQ0RGX3MzX2ludGVncml0eSkgJiYKKyAgICAgICAgICFJU19FTkFCTEVE
KENPTkZJR19UQk9PVCkgKQorICAgIHsKKyAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywgIlMz
IGludGVncml0eSBjaGVjayBub3QgdmFsaWQgd2l0aG91dCBDT05GSUdfVEJPT1RcbiIpOworICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICB9CisKICAgICByZXR1cm4gMDsKIH0KIApAQCAtNTQ0
LDggKzU1MSw2IEBAIGludCBhcmNoX2RvbWFpbl9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwKICAg
ICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCk7CiAgICAgfQogCi0gICAgZC0+YXJjaC5zM19pbnRl
Z3JpdHkgPSBjb25maWctPmZsYWdzICYgWEVOX0RPTUNUTF9DREZfczNfaW50ZWdyaXR5OwotCiAg
ICAgZW1mbGFncyA9IGNvbmZpZy0+YXJjaC5lbXVsYXRpb25fZmxhZ3M7CiAKICAgICBpZiAoIGlz
X2hhcmR3YXJlX2RvbWFpbihkKSAmJiBpc19wdl9kb21haW4oZCkgKQpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwppbmRleCA4N2ZjN2M5MGRh
Li5kMGIzNWIwY2UyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYworKysgYi94ZW4v
YXJjaC94ODYvc2V0dXAuYwpAQCAtNjk2LDcgKzY5Niw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJu
IF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCiAgICAgICAgIC5zdG9wX2JpdHMgPSAx
CiAgICAgfTsKICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gZG9tMF9jZmcgPSB7
Ci0gICAgICAgIC5mbGFncyA9IFhFTl9ET01DVExfQ0RGX3MzX2ludGVncml0eSwKKyAgICAgICAg
LmZsYWdzID0gSVNfRU5BQkxFRChDT05GSUdfVEJPT1QpID8gWEVOX0RPTUNUTF9DREZfczNfaW50
ZWdyaXR5IDogMCwKICAgICAgICAgLm1heF9ldnRjaG5fcG9ydCA9IC0xLAogICAgICAgICAubWF4
X2dyYW50X2ZyYW1lcyA9IG9wdF9tYXhfZ3JhbnRfZnJhbWVzLAogICAgICAgICAubWF4X21hcHRy
YWNrX2ZyYW1lcyA9IG9wdF9tYXhfbWFwdHJhY2tfZnJhbWVzLApkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L3Rib290LmMgYi94ZW4vYXJjaC94ODYvdGJvb3QuYwppbmRleCBmM2ZkZWU0ZDM5Li4z
ZGI4YThhOGQ4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvdGJvb3QuYworKysgYi94ZW4vYXJj
aC94ODYvdGJvb3QuYwpAQCAtMjEyLDcgKzIxMiw3IEBAIHN0YXRpYyB2b2lkIHRib290X2dlbl9k
b21haW5faW50ZWdyaXR5KGNvbnN0IHVpbnQ4X3Qga2V5W1RCX0tFWV9TSVpFXSwKICAgICB2bWFj
X3NldF9rZXkoKHVpbnQ4X3QgKilrZXksICZjdHgpOwogICAgIGZvcl9lYWNoX2RvbWFpbiggZCAp
CiAgICAgewotICAgICAgICBpZiAoICFkLT5hcmNoLnMzX2ludGVncml0eSApCisgICAgICAgIGlm
ICggIShkLT5vcHRpb25zICYgWEVOX0RPTUNUTF9DREZfczNfaW50ZWdyaXR5KSApCiAgICAgICAg
ICAgICBjb250aW51ZTsKICAgICAgICAgcHJpbnRrKCJNQUNpbmcgRG9tYWluICV1XG4iLCBkLT5k
b21haW5faWQpOwogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaAppbmRleCA1Zjk4OTk0NjljLi41YzAzOGExMDY1
IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvZG9tYWluLmgKQEAgLTI5NSw4ICsyOTUsNiBAQCBzdHJ1Y3QgYXJjaF9kb21h
aW4KICAgICB1aW50MzJfdCBwY2lfY2Y4OwogICAgIHVpbnQ4X3QgY21vc19pZHg7CiAKLSAgICBi
b29sX3QgczNfaW50ZWdyaXR5OwotCiAgICAgdW5pb24gewogICAgICAgICBzdHJ1Y3QgcHZfZG9t
YWluIHB2OwogICAgICAgICBzdHJ1Y3QgaHZtX2RvbWFpbiBodm07Ci0tIAoyLjIwLjEuMi5nYjIx
ZWJiNjcxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
