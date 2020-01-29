Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF43414CA91
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:14:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwmDI-0007sP-6x; Wed, 29 Jan 2020 12:12:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wV5r=3S=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iwmDG-0007rk-Oj
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:12:54 +0000
X-Inumbo-ID: a557d9d8-4290-11ea-a933-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a557d9d8-4290-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 12:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580299961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ujC3ICVEDUCWxFYw0I7YeEtcxnzuC7N7nVFvDxyOyhc=;
 b=AkwISS+yLRzY6ceLY6yK8xlasFE+d5XJZfhg8wayaFIY8PXq6fJ4Uql5
 ZU09NQHpvSYvYuLpr//9YPXXGLYgmpcaOavo33wQZDgLJaInjOztDLQTn
 uw9TowFYXH5+XR5twGS2BiV6WrH9a8t8Xuvi60ReiRN0RC9Oi6fzrDinR A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vgtfSAJBwy7rEkZUIwzoIsaNr+D70QHQf5r0c43xP9WbIfeEK2iJ8SBxljyyKuVk1OwqUcu4hF
 jtKpqFcOwYKKLpOy8PeulVU+aDc246BIhFYLBPqlte5fiU97e/tknWWBvXKQ3lCwoGE26yljVI
 scuQI0g4Sb3BJzmF+i99JlC7DG0y0ABxftgIp1VujW89bc4VXJ1BWLOMN++5XP0MlIAT0Gb8sI
 RWMl7NNx2vRCDNiqyetX0h9niOhWJ0CNRDt69Uvof+hTRHXxhnErcE7yIDRhPY6TXMYF25nBug
 bYk=
X-SBRS: 2.7
X-MesageID: 11606519
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,377,1574139600"; d="scan'208";a="11606519"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Wed, 29 Jan 2020 12:12:35 +0000
Message-ID: <20200129121235.1814563-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129121235.1814563-1-anthony.perard@citrix.com>
References: <20200129121235.1814563-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/5] OvmfPkg/OvmfXen: Set PcdFSBClock
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
Cc: Julien Grall <julien@xen.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Liming
 Gao <liming.gao@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Michael D Kinney <michael.d.kinney@intel.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXBkYXRlIGdFZmlNZGVQa2dUb2tlblNwYWNlR3VpZC5QY2RGU0JDbG9jayBzbyBpdCBjYW4gaGF2
ZSB0aGUgY29ycmVjdAp2YWx1ZSB3aGVuIFNlY1BlaUR4ZVRpbWVyTGliQ3B1IHN0YXJ0IHRvIHVz
ZSBpdCBmb3IgdGhlIEFQSUMgdGltZXIuCgpDdXJyZW50bHksIG5vdGhpbmcgYXBwZWFyIHRvIHVz
ZSB0aGUgdmFsdWUgaW4gUGNkRlNCQ2xvY2sgYmVmb3JlClhlblBsYXRmb3JtUGVpIGhhZCBhIGNo
YW5jZSB0byBzZXQgaXQgZXZlbiB0aG91Z2ggVGltZXJMaWIgaXMgaW5jbHVkZWQKaW4gbW9kdWxl
cyBydW5uZWQgYmVmb3JlIFhlblBsYXRmb3JtUGVpLgoKWGVuUGxhdGZvcm1QZWkgZG9lc24ndCB1
c2UgYW55IG9mIHRoZSBmdW5jdGlvbnMgdGhhdCB3b3VsZCB1c2UgdGhhdAp2YWx1ZS4gTm8gb3Ro
ZXIgbW9kdWxlcyBpbiB0aGUgUEVJIHBoYXNlIHNlZW1zIHRvIHVzZSB0aGUgVGltZXJMaWIKYmVm
b3JlIFBjZEZTQkNsb2NrIGlzIHNldC4gVGhlcmUgYXJlIGN1cnJlbnRseSB0d28gb3RoZXIgbW9k
dWxlcyBpbgp0aGUgUEVJIHBoYXNlIHRoYXQgbmVlZHMgdGhlIFRpbWVyTGliOgotIFMzUmVzdW1l
MlBlaSwgYnV0IG9ubHkgYmVjYXVzZSBMb2NhbEFwaWNMaWIgbmVlZHMgaXQsIGJ1dCBub3RoaW5n
IGlzCiAgdXNpbmcgdGhlIHZhbHVlIGZyb20gUGNkRlNCQ2xvY2suCi0gQ3B1TXBQZWksIGJ1dCBJ
IGJlbGlldmUgaXQgb25seSBydW5zIGFmdGVyIFhlblBsYXRmb3JtUGVpCgpCZWZvcmUgdGhlIFBF
SSBwaGFzZSwgdGhlcmUncyB0aGUgU0VDIHBoYXNlLCBhbmQgU2VjTWFpbiBuZWVkcwpUaW1lckxp
YiBiZWNhdXNlIG9mIExvY2FsQXBpY0xpYi4gQW5kIGl0IGluaXRpYWxpc2UgdGhlIEFQSUMgdGlt
ZXJzCmZvciB0aGUgZGVidWcgYWdlbnQuIEJ1dCBJIGRvbid0IHRoaW5rIGFueSBvZiB0aGUgRGVi
dWdMaWIgdGhhdApPdm1mWGVuIGNvdWxkIHVzZSBhcmUgYWN0dWFsbHkgdXNpbmcgdGhlICpEZWxh
eSBmdW5jdGlvbnMgaW4gVGltZXJMaWIsCmFuZCBzbyB3b3VsZCBub3QgdXNlIHRoZSB2YWx1ZSBm
cm9tIFBjZEZTQkNsb2NrIHdoaWNoIHdvdWxkIGJlCnVuaW5pdGlhbGlzZWQuCgpBIHNpbXBsZSBy
dW50aW1lIHRlc3Qgc2hvd2VkIHRoYXQgVGltZXJMaWIgZG9lc24ndCB1c2UgUGNkRlNCQ2xvY2sK
dmFsdWUgYmVmb3JlIGl0IGlzIHNldC4KClJlZjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUu
b3JnL3Nob3dfYnVnLmNnaT9pZD0yNDkwClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIE92bWZQa2cvT3ZtZlhlbi5kc2MgICAgICAg
ICAgICAgICAgICAgICAgIHwgNCArLS0tCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlblBsYXRm
b3JtUGVpLmluZiB8IDEgKwogT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyAgICAgICAgICAg
ICAgfCA0ICsrKysKIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL092bWZQa2cvT3ZtZlhlbi5kc2MgYi9Pdm1mUGtnL092bWZYZW4u
ZHNjCmluZGV4IDhjMTFlZmU5YjcwOS4uMTkwZDc0MDBjMTQ4IDEwMDY0NAotLS0gYS9Pdm1mUGtn
L092bWZYZW4uZHNjCisrKyBiL092bWZQa2cvT3ZtZlhlbi5kc2MKQEAgLTQ0Miw5ICs0NDIsNiBA
QCBbUGNkc0ZpeGVkQXRCdWlsZF0KICAgIyBQb2ludCB0byB0aGUgTWRlTW9kdWxlUGtnL0FwcGxp
Y2F0aW9uL1VpQXBwL1VpQXBwLmluZg0KICAgZ0VmaU1kZU1vZHVsZVBrZ1Rva2VuU3BhY2VHdWlk
LlBjZEJvb3RNYW5hZ2VyTWVudUZpbGV8eyAweDIxLCAweGFhLCAweDJjLCAweDQ2LCAweDE0LCAw
eDc2LCAweDAzLCAweDQ1LCAweDgzLCAweDZlLCAweDhhLCAweGI2LCAweGY0LCAweDY2LCAweDIz
LCAweDMxIH0NCiANCi0gICMjIFhlbiB2bGFwaWMncyBmcmVxdWVuY2UgaXMgMTAwIE1Ieg0KLSAg
Z0VmaU1kZVBrZ1Rva2VuU3BhY2VHdWlkLlBjZEZTQkNsb2NrfDEwMDAwMDAwMA0KLQ0KICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjDQogIw0KICMgUGNkIER5bmFtaWMgU2VjdGlvbiAtIGxpc3Qgb2Yg
YWxsIEVESyBJSSBQQ0QgRW50cmllcyBkZWZpbmVkIGJ5IHRoaXMgUGxhdGZvcm0NCkBAIC00Njgs
NiArNDY1LDcgQEAgW1BjZHNEeW5hbWljRGVmYXVsdF0KICAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFj
ZUd1aWQuUGNkUGNpTW1pbzY0QmFzZXwweDANCiAgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlk
LlBjZFBjaU1taW82NFNpemV8MHg4MDAwMDAwMDANCiANCisgIGdFZmlNZGVQa2dUb2tlblNwYWNl
R3VpZC5QY2RGU0JDbG9jaw0KICAgZ0VmaU1kZVBrZ1Rva2VuU3BhY2VHdWlkLlBjZFBsYXRmb3Jt
Qm9vdFRpbWVPdXR8MA0KIA0KICAgIyBTZXQgdmlkZW8gcmVzb2x1dGlvbiBmb3IgdGV4dCBzZXR1
cC4NCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlblBsYXRmb3JtUGVpLmlu
ZiBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuUGxhdGZvcm1QZWkuaW5mCmluZGV4IDMzNWE0
NDI1MzhjMi4uMTc3MjAwZjNiN2U1IDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVp
L1hlblBsYXRmb3JtUGVpLmluZgorKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlblBsYXRm
b3JtUGVpLmluZgpAQCAtODMsNiArODMsNyBAQCBbUGNkXQogICBnRWZpTWRlTW9kdWxlUGtnVG9r
ZW5TcGFjZUd1aWQuUGNkRHhlSXBsU3dpdGNoVG9Mb25nTW9kZQ0KICAgZ0VmaU1kZU1vZHVsZVBr
Z1Rva2VuU3BhY2VHdWlkLlBjZFVzZTFHUGFnZVRhYmxlDQogICBnRWZpTWRlTW9kdWxlUGtnVG9r
ZW5TcGFjZUd1aWQuUGNkUHRlTWVtb3J5RW5jcnlwdGlvbkFkZHJlc3NPck1hc2sNCisgIGdFZmlN
ZGVQa2dUb2tlblNwYWNlR3VpZC5QY2RGU0JDbG9jaw0KICAgZ0VmaVNlY3VyaXR5UGtnVG9rZW5T
cGFjZUd1aWQuUGNkT3B0aW9uUm9tSW1hZ2VWZXJpZmljYXRpb25Qb2xpY3kNCiAgIGdVZWZpQ3B1
UGtnVG9rZW5TcGFjZUd1aWQuUGNkQ3B1TG9jYWxBcGljQmFzZUFkZHJlc3MNCiANCmRpZmYgLS1n
aXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBl
aS9YZW4uYwppbmRleCBkNmNkYzlhOGUzMWMuLmZjOTkwNDYyZGNjYyAxMDA2NDQKLS0tIGEvT3Zt
ZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYworKysgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hl
bi5jCkBAIC01MDQsNiArNTA0LDEwIEBAIENhbGlicmF0ZUxhcGljVGltZXIgKAogICAgIC8gKFRz
Y1RpY2syIC0gVHNjVGljayk7DQogICBERUJVRyAoKERFQlVHX0lORk8sICJBUElDIEZyZXEgJSA4
bHUgSHpcbiIsIEZyZXEpKTsNCiANCisgIEFTU0VSVCAoRnJlcSA8PSBNQVhfVUlOVDMyKTsNCisg
IFN0YXR1cyA9IFBjZFNldDMyUyAoUGNkRlNCQ2xvY2ssIEZyZXEpOw0KKyAgQVNTRVJUX1JFVFVS
Tl9FUlJPUiAoU3RhdHVzKTsNCisNCiAgIFVubWFwWGVuUGFnZSAoU2hhcmVkSW5mbyk7DQogDQog
RXhpdDoNCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
