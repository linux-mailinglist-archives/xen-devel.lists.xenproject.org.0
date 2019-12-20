Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B766128407
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 22:42:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiPzk-0005ry-5M; Fri, 20 Dec 2019 21:39:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Yw9i=2K=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iiPzi-0005rt-Ff
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 21:39:34 +0000
X-Inumbo-ID: 312bb432-2371-11ea-88e7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 312bb432-2371-11ea-88e7-bc764e2007e4;
 Fri, 20 Dec 2019 21:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576877965;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=ops/9Y7+BX/nqqPJ9rr2gD3UiBXmQP7Tp+C542TQ4Bs=;
 b=EwaUHKFzhE2k7bifoeTH4jfJbPfVVA/mzbLQA4/LkNnvSD5T6rw2YgFU
 B+Pknz/E9TxfTC8JgSfTwo3euM4CYlUboVB/tbFphIBl/GobP8w29Hr8z
 oqaeR0zQtFxeEDLDeys0Ng9p3oeFCSmto8ZZHkwGCQM7+p0yuM8reubMa s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Kcllwn+RI/79Ks/gQGyFLKPXcpjCEI0DVV3z4+XeF8CQtnMVwyXo1fm3Xj3/6mqawGeWnhn7ti
 IQl6wvLDhS1cQ+txtgC4P/9kuryGrONH2hlpKT/lZo0l73Gzo4NyRZKeYu4Ssv4DOkc8eyJbdb
 6jznq0uT5xGwIEulHk9sxTxRf6sLlg/90JcE1bByE4wlpTKMdH8nXpVa094VOa/N+C5zQa2YYS
 e8A2VM4p8Svys84YWIEZrsnxqW3wiSWtyrB0r1D/8M8EsbePMQl/HOaZQmYtFoiIeAsb55cyq7
 c+Q=
X-SBRS: 2.7
X-MesageID: 10436098
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,337,1571716800"; d="scan'208";a="10436098"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 20 Dec 2019 21:39:20 +0000
Message-ID: <1576877960-12767-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/vpt: update last_guest_time with cmpxchg
 and drop pl_time_lock
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2ltaWxhcmx5IHRvIFBWIHZUU0MgZW11bGF0aW9uLCBvcHRpbWl6ZSBIVk0gc2lkZSBmb3IgY29u
c2lzdGVuY3kKYW5kIHNjYWxhYmlsaXR5IGJ5IGRyb3BwaW5nIGEgc3BpbmxvY2sgcHJvdGVjdGlu
ZyBhIHNpbmdsZSB2YXJpYWJsZS4KClNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29y
LmRydXpoaW5pbkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdnB0LmMgICAgICAg
IHwgMTkgKysrKysrKystLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdnB0Lmgg
fCAgNSArKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZwdC5jIGIveGVuL2FyY2gveDg2
L2h2bS92cHQuYwppbmRleCBlY2QyNWQ3Li5iZjRjNDMyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvaHZtL3ZwdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdnB0LmMKQEAgLTMwLDcgKzMwLDYg
QEAgdm9pZCBodm1faW5pdF9ndWVzdF90aW1lKHN0cnVjdCBkb21haW4gKmQpCiB7CiAgICAgc3Ry
dWN0IHBsX3RpbWUgKnBsID0gZC0+YXJjaC5odm0ucGxfdGltZTsKIAotICAgIHNwaW5fbG9ja19p
bml0KCZwbC0+cGxfdGltZV9sb2NrKTsKICAgICBwbC0+c3RpbWVfb2Zmc2V0ID0gLSh1NjQpZ2V0
X3NfdGltZSgpOwogICAgIHBsLT5sYXN0X2d1ZXN0X3RpbWUgPSAwOwogfQpAQCAtMzgsMjQgKzM3
LDIyIEBAIHZvaWQgaHZtX2luaXRfZ3Vlc3RfdGltZShzdHJ1Y3QgZG9tYWluICpkKQogdWludDY0
X3QgaHZtX2dldF9ndWVzdF90aW1lX2ZpeGVkKGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCB1aW50NjRf
dCBhdF90c2MpCiB7CiAgICAgc3RydWN0IHBsX3RpbWUgKnBsID0gdi0+ZG9tYWluLT5hcmNoLmh2
bS5wbF90aW1lOwotICAgIHU2NCBub3c7CisgICAgc190aW1lX3Qgb2xkLCBuZXcsIG5vdyA9IGdl
dF9zX3RpbWVfZml4ZWQoYXRfdHNjKSArIHBsLT5zdGltZV9vZmZzZXQ7CiAKICAgICAvKiBDYWxs
ZWQgZnJvbSBkZXZpY2UgbW9kZWxzIHNoYXJlZCB3aXRoIFBWIGd1ZXN0cy4gQmUgY2FyZWZ1bC4g
Ki8KICAgICBBU1NFUlQoaXNfaHZtX3ZjcHUodikpOwogCi0gICAgc3Bpbl9sb2NrKCZwbC0+cGxf
dGltZV9sb2NrKTsKLSAgICBub3cgPSBnZXRfc190aW1lX2ZpeGVkKGF0X3RzYykgKyBwbC0+c3Rp
bWVfb2Zmc2V0OwotCiAgICAgaWYgKCAhYXRfdHNjICkKICAgICB7Ci0gICAgICAgIGlmICggKGlu
dDY0X3QpKG5vdyAtIHBsLT5sYXN0X2d1ZXN0X3RpbWUpID4gMCApCi0gICAgICAgICAgICBwbC0+
bGFzdF9ndWVzdF90aW1lID0gbm93OwotICAgICAgICBlbHNlCi0gICAgICAgICAgICBub3cgPSAr
K3BsLT5sYXN0X2d1ZXN0X3RpbWU7CisgICAgICAgIGRvIHsKKyAgICAgICAgICAgIG9sZCA9IHBs
LT5sYXN0X2d1ZXN0X3RpbWU7CisgICAgICAgICAgICBuZXcgPSBub3cgPiBwbC0+bGFzdF9ndWVz
dF90aW1lID8gbm93IDogb2xkICsgMTsKKyAgICAgICAgfSB3aGlsZSAoIGNtcHhjaGcoJnBsLT5s
YXN0X2d1ZXN0X3RpbWUsIG9sZCwgbmV3KSAhPSBvbGQgKTsKICAgICB9Ci0gICAgc3Bpbl91bmxv
Y2soJnBsLT5wbF90aW1lX2xvY2spOworICAgIGVsc2UKKyAgICAgICAgbmV3ID0gbm93OwogCi0g
ICAgcmV0dXJuIG5vdyArIHYtPmFyY2guaHZtLnN0aW1lX29mZnNldDsKKyAgICByZXR1cm4gbmV3
ICsgdi0+YXJjaC5odm0uc3RpbWVfb2Zmc2V0OwogfQogCiB2b2lkIGh2bV9zZXRfZ3Vlc3RfdGlt
ZShzdHJ1Y3QgdmNwdSAqdiwgdTY0IGd1ZXN0X3RpbWUpCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS9hc20teDg2L2h2bS92cHQuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZwdC5oCmluZGV4
IDk5MTY5ZGQuLmY1Y2NiNDkgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3Zw
dC5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZwdC5oCkBAIC0xMzUsMTAgKzEzNSw5
IEBAIHN0cnVjdCBwbF90aW1lIHsgICAgLyogcGxhdGZvcm0gdGltZSAqLwogICAgIHN0cnVjdCBI
UEVUU3RhdGUgdmhwZXQ7CiAgICAgc3RydWN0IFBNVFN0YXRlICB2cG10OwogICAgIC8qIGd1ZXN0
X3RpbWUgPSBYZW4gc3lzIHRpbWUgKyBzdGltZV9vZmZzZXQgKi8KLSAgICBpbnQ2NF90IHN0aW1l
X29mZnNldDsKKyAgICBzX3RpbWVfdCBzdGltZV9vZmZzZXQ7CiAgICAgLyogRW5zdXJlcyBtb25v
dG9uaWNpdHkgaW4gYXBwcm9wcmlhdGUgdGltZXIgbW9kZXMuICovCi0gICAgdWludDY0X3QgbGFz
dF9ndWVzdF90aW1lOwotICAgIHNwaW5sb2NrX3QgcGxfdGltZV9sb2NrOworICAgIHNfdGltZV90
IGxhc3RfZ3Vlc3RfdGltZTsKICAgICBzdHJ1Y3QgZG9tYWluICpkb21haW47CiB9OwogCi0tIAoy
LjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
