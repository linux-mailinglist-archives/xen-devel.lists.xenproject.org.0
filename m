Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 765875FA76
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:00:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3Bd-00066L-EM; Thu, 04 Jul 2019 14:58:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3Bb-00064g-34
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:58:11 +0000
X-Inumbo-ID: 218702dc-9e6c-11e9-868e-0b09caf58d45
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 218702dc-9e6c-11e9-868e-0b09caf58d45;
 Thu, 04 Jul 2019 14:58:07 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6drbCJ0VsYo3JqdPNXBIgS8Z9OOILXQNZ0dNRzF1ngFcL9vDVCreRYyAlyQJK5Mk7Ejpgt0l4o
 Elj1LJx0pk5Gha5/SDqRraYvxaxSbEGlJ0GMnIAU7qMgrGNa3Fih8l05W3A6BOyr2+l9hQgpUr
 CWMfPGQ/5Axi/kBwB/JV7VWEhFkJKafQNm52E8i206uAcraIHXtO5dLBpcF/dfcnfuIPGQXgd8
 nC5x52usQ6i8+B/yoN5a7EOHahEwhvWW4ijHQDgbEkjTtEKRQacrWmWijPQ5om0PtGOtx8Aq+C
 nEs=
X-SBRS: 2.7
X-MesageID: 2602736
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2602736"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:09 +0100
Message-ID: <20190704144233.27968-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 11/35] OvmfPkg/XenPlatformPei: Use
 mXenHvmloaderInfo to get E820
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIHRoZSBhbHJlYWR5IGNoZWNrZWQgcG9pbnRlciBtWGVuSHZtbG9hZGVySW5mbyB0byByZXRy
aWV2ZSB0aGUgRTgyMAp0YWJsZSBwcm9kdWNlZCBieSBodm1sb2FkZXIuCgpSZWY6IGh0dHBzOi8v
YnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY4OQpTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQWNrZWQtYnk6IExh
c3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Ci0tLQogT3ZtZlBrZy9YZW5QbGF0Zm9ybVBl
aS9YZW4uYyB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBsYXRmb3Jt
UGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwppbmRleCBkNjM2MWRhMzA2
Li45YzJmZjYzMjRkIDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCisr
KyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKQEAgLTUzLDE4ICs1MywxOCBAQCBYZW5H
ZXRFODIwTWFwICgKICAgVUlOVDMyICpDb3VudA0KICAgKQ0KIHsNCi0gIEVGSV9YRU5fT1ZNRl9J
TkZPICpJbmZvID0NCi0gICAgKEVGSV9YRU5fT1ZNRl9JTkZPICopKFVJTlROKSBPVk1GX0lORk9f
UEhZU0lDQUxfQUREUkVTUzsNCisgIC8vDQorICAvLyBHZXQgRTgyMCBwcm9kdWNlZCBieSBodm1s
b2FkZXINCisgIC8vDQorICBpZiAobVhlbkh2bWxvYWRlckluZm8gIT0gTlVMTCkgew0KKyAgICBB
U1NFUlQgKG1YZW5Idm1sb2FkZXJJbmZvLT5FODIwIDwgTUFYX0FERFJFU1MpOw0KKyAgICAqRW50
cmllcyA9IChFRklfRTgyMF9FTlRSWTY0ICopKFVJTlROKSBtWGVuSHZtbG9hZGVySW5mby0+RTgy
MDsNCisgICAgKkNvdW50ID0gbVhlbkh2bWxvYWRlckluZm8tPkU4MjBFbnRyaWVzQ291bnQ7DQog
DQotICBpZiAoQXNjaWlTdHJDbXAgKChDSEFSOCAqKSBJbmZvLT5TaWduYXR1cmUsICJYZW5IVk1P
Vk1GIikpIHsNCi0gICAgcmV0dXJuIEVGSV9OT1RfRk9VTkQ7DQorICAgIHJldHVybiBFRklfU1VD
Q0VTUzsNCiAgIH0NCiANCi0gIEFTU0VSVCAoSW5mby0+RTgyMCA8IE1BWF9BRERSRVNTKTsNCi0g
ICpFbnRyaWVzID0gKEVGSV9FODIwX0VOVFJZNjQgKikoVUlOVE4pIEluZm8tPkU4MjA7DQotICAq
Q291bnQgPSBJbmZvLT5FODIwRW50cmllc0NvdW50Ow0KLQ0KLSAgcmV0dXJuIEVGSV9TVUNDRVNT
Ow0KKyAgcmV0dXJuIEVGSV9OT1RfRk9VTkQ7DQogfQ0KIA0KIC8qKg0KLS0gCkFudGhvbnkgUEVS
QVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
