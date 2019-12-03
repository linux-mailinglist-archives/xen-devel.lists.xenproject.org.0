Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8516112079
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 00:59:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icI1e-0006Gz-Cv; Tue, 03 Dec 2019 23:56:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k8e7=ZZ=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1icI1d-0006Gu-H6
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 23:56:13 +0000
X-Inumbo-ID: 7be1e434-1628-11ea-a0d2-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7be1e434-1628-11ea-a0d2-bc764e2007e4;
 Tue, 03 Dec 2019 23:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575417372;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=TFD3VzeeXzI0ahwELebBgPMvYu71biEqCJE3NLat9dQ=;
 b=HRkimQEsW64FdWGHfzQtc08SsiYU/bsSyFoTZHPpaXOdymvr9Q86N5BE
 SZMHFYEitpMD/qbqDPrgO56r5loJJ35vbGVJ4FdPgoBY96dZnvvfL7qO7
 Umc0uAOqWzFQqbwS7S+Is1gARbcz5PLMAAR5cr7szldIrdtfm9N9y7lgd U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: g+3YzLlxnjg2O7v2zDKDUe2lwBpt9WRb7g9f/Kv1Nz+hSn7bRRCUp7SLb4243TZxBLz0WdkC9y
 4zQN1emD4tqlVU5YXtleO4Dia9sUGM3sf1EXOUuHqJAF6nBRdt3T8W2JoHQgGg9kWvN6CyxV2t
 35+tBIYb0ylpybc+SAHuZuY2QZ3yj0r+jw6AjlAjtNerwayRBMY99L+BcEjB7rmM2fO4GpUSZ1
 TvvF4xIQogI/RJFm4MJenMKPRxaruixZV94iTM/euqh1dvPAtrck6bMGfeEVtCanZng70Wa2sr
 5iU=
X-SBRS: 2.7
X-MesageID: 9706778
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,275,1571716800"; 
   d="scan'208";a="9706778"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Dec 2019 23:56:07 +0000
Message-ID: <1575417367-12822-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/AMD: unbreak CPU hotplug on AMD systems
 without RstrFpErrPtrs
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
Cc: jgross@suse.com, Igor Druzhinin <igor.druzhinin@citrix.com>, wl@xen.org,
 andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWYgdGhlIGZlYXR1cmUgaXMgbm90IHByZXNlbnQgWGVuIHdpbGwgdHJ5IHRvIGZvcmNlIFg4Nl9C
VUdfRlBVX1BUUlMKZmVhdHVyZSBhdCBDUFUgaWRlbnRpZmljYXRpb24gdGltZS4gVGhpcyBpcyBl
c3BlY2lhbGx5IG5vdGljZWFibGUgaW4KUFYtc2hpbSB0aGF0IHVzdWFsbHkgaG90cGx1Z3MgaXRz
IHZDUFVzLiBXZSBlaXRoZXIgbmVlZCB0byByZXN0cmljdCB0aGlzCmFjdGlvbiBmb3IgYm9vdCBD
UFUgb25seSBvciBhbGxvdyBzZWNvbmRhcnkgQ1BVcyB0byBtb2RpZnkKZm9yY2VkIENQVSBjYXBh
YmlsaXRpZXMgYXQgcnVudGltZS4gQ2hvb3NlIHRoZSBmb3JtZXIgc2luY2UgbW9kaWZ5aW5nCmZv
cmNlZCBjYXBhYmlsaXRpZXMgb3V0IG9mIGJvb3QgcGF0aCBsZWF2ZXMgdGhlIHN5c3RlbSBpbiBw
b3RlbnRpYWxseQppbmNvbnNpc3RlbnQgc3RhdGUuCgpTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpo
aW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gcGlj
ayB0aGUgZm9ybWVyIGFwcHJvYWNoIGluc3RlYWQgb2YgdGhlIGxhdHRlcgotLS0KIHhlbi9hcmNo
L3g4Ni9jcHUvYW1kLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvY3B1L2FtZC5jIGIveGVuL2Fy
Y2gveDg2L2NwdS9hbWQuYwppbmRleCBmZWMyODMwLi44YjVmMGYyIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvY3B1L2FtZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMKQEAgLTU4Myw3
ICs1ODMsNyBAQCBzdGF0aWMgdm9pZCBpbml0X2FtZChzdHJ1Y3QgY3B1aW5mb194ODYgKmMpCiAJ
ICogT2xkZXIgQU1EIENQVXMgZG9uJ3Qgc2F2ZS9sb2FkIEZPUC9GSVAvRkRQIHVubGVzcyBhbiBG
UFUgZXhjZXB0aW9uCiAJICogaXMgcGVuZGluZy4gIFhlbiB3b3JrcyBhcm91bmQgdGhpcyBhdCAo
RilYUlNUT1IgdGltZS4KIAkgKi8KLQlpZiAoIWNwdV9oYXMoYywgWDg2X0ZFQVRVUkVfUlNUUl9G
UF9FUlJfUFRSUykpCisJaWYgKGMgPT0gJmJvb3RfY3B1X2RhdGEgJiYgIWNwdV9oYXMoYywgWDg2
X0ZFQVRVUkVfUlNUUl9GUF9FUlJfUFRSUykpCiAJCXNldHVwX2ZvcmNlX2NwdV9jYXAoWDg2X0JV
R19GUFVfUFRSUyk7CiAKIAkvKgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
