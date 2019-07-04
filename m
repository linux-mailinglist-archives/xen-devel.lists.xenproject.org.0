Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991FD5FA64
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 16:59:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3BG-0005oK-CP; Thu, 04 Jul 2019 14:57:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3BF-0005o2-Iw
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:57:49 +0000
X-Inumbo-ID: 16bd76ab-9e6c-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 16bd76ab-9e6c-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 14:57:48 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +Q0Ej0ECeYwu12HOewgk2vP0fcb4PA2T2D66kg5pspS7Xbh1GakkPvOVpOyNEfb68+6POoeb7T
 /m1WnULDRb/jMpiNcWQHEOHn079axzH3Q7ajkOFPAmcFw+xqFIWR7z49ZMaDHRwGljpjMMKcjO
 GKebjm/UEqbaR/hr010HQEAGvfyh53ACaqXsHQxwsYN569ToFBMoXXgWC4Wz9YIPClYB4FU9kW
 oMPdFcJlNdhPjGgj7brIV/6q0v4+SYCBLLV4Y2cQIPu1ep6te/HUKoJOpPzoRPUv0X44XQeQ2d
 BXI=
X-SBRS: 2.7
X-MesageID: 2623832
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2623832"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:16 +0100
Message-ID: <20190704144233.27968-19-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 18/35] OvmfPkg/XenPlatformPei: Introduce
 XenHvmloaderDetected
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

VGhpcyBuZXcgWGVuSHZtbG9hZGVyRGV0ZWN0ZWQoKSByZXR1cm4gdHJ1ZSBpZiB0aGUgaHZtbG9h
ZGVyIGZpcm13YXJlCmhhcyBydW5uZWQgYmVmb3JlIE9WTUYuCgpSZWY6IGh0dHBzOi8vYnVnemls
bGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY4OQpTaWduZWQtb2ZmLWJ5OiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQWNrZWQtYnk6IExhc3psbyBF
cnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MzoKICAgIC0gQWRkZWQg
b25lIHNlbnRlbmNlIGluIHRoZSBjb21taXQgbWVzc2FnZS4KCiBPdm1mUGtnL1hlblBsYXRmb3Jt
UGVpL1BsYXRmb3JtLmggfCA1ICsrKysrCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jICAg
ICAgfCA3ICsrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZvcm0uaCBiL092bWZQa2cvWGVuUGxh
dGZvcm1QZWkvUGxhdGZvcm0uaAppbmRleCA3NzQyNzQ5NmMwLi45MjVkZjMxZjg4IDEwMDY0NAot
LS0gYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmgKKysrIGIvT3ZtZlBrZy9YZW5Q
bGF0Zm9ybVBlaS9QbGF0Zm9ybS5oCkBAIC04OSw2ICs4OSwxMSBAQCBYZW5EZXRlY3QgKAogICBW
T0lEDQogICApOw0KIA0KK0JPT0xFQU4NCitYZW5Idm1sb2FkZXJEZXRlY3RlZCAoDQorICBWT0lE
DQorICApOw0KKw0KIFZPSUQNCiBBbWRTZXZJbml0aWFsaXplICgNCiAgIFZPSUQNCmRpZmYgLS1n
aXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBl
aS9YZW4uYwppbmRleCA4NzdkNzc2ZGU4Li5hOTBiZTdiYmViIDEwMDY0NAotLS0gYS9Pdm1mUGtn
L1hlblBsYXRmb3JtUGVpL1hlbi5jCisrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMK
QEAgLTE5OSw2ICsxOTksMTMgQEAgWGVuRGV0ZWN0ICgKICAgcmV0dXJuIEZBTFNFOw0KIH0NCiAN
CitCT09MRUFODQorWGVuSHZtbG9hZGVyRGV0ZWN0ZWQgKA0KKyAgVk9JRA0KKyAgKQ0KK3sNCisg
IHJldHVybiAobVhlbkh2bWxvYWRlckluZm8gIT0gTlVMTCk7DQorfQ0KIA0KIFZPSUQNCiBYZW5Q
dWJsaXNoUmFtUmVnaW9ucyAoDQotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
