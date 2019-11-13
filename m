Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ECFFB490
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 17:03:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUv3r-0000Bk-35; Wed, 13 Nov 2019 16:00:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3XMH=ZF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iUv3p-0008As-QB
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 16:00:01 +0000
X-Inumbo-ID: a5abdafe-062e-11ea-9631-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5abdafe-062e-11ea-9631-bc764e2007e4;
 Wed, 13 Nov 2019 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573660801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bgHkkgbISmiDZbwR1pmIMN6eUQMUp30B6FtQLTgTfZ4=;
 b=XQISJW2qGS17H0WgdcE//FU6HAdbBwK53NaaemamQ7wUXiYf6C2tIjXa
 Fbd5o2+QG8ae8X6MFg/Ft4xCbecWbWbMza1i5mjshLojClvlHPCWfwq1A
 M0MpCNknWC1cgewplQ1m1L1HMyvApDSkfB5FfzAGo1GAeMLmZi+5vlwOd 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kDh40hpe6wgfYzYyYYJhlqZDRKgRto9LQj3Fv3twmxiRQLSCnzdIZ4a9A4hY92swmdoFyu6dEJ
 BuK2dNt/j6WDi/XGF9JHmH2huznDeusunCXPVVPoc82TogLjK8ZhKJJ84rJ3syLQmgYW/QfEuK
 W/c7FhbHIgnlzOprXS/9e03TqGR8kqhLy0k87Gc0E/SMrqIC4WSmrqgEtG29mgblx+Wbuw8GzR
 GbyDtEKzzVm7NSmtBmN0+B9Y06F8kL2mD09gu3av2ewfP8GvG1pkDBBtV1WZ4XgxKocVKd/tjB
 5Qk=
X-SBRS: 2.7
X-MesageID: 8684200
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,300,1569297600"; 
   d="scan'208";a="8684200"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 13 Nov 2019 16:59:38 +0100
Message-ID: <20191113155940.81837-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113155940.81837-1-roger.pau@citrix.com>
References: <20191113155940.81837-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v4 1/3] vmx: add ASSERT to prevent
 syncing PIR to IRR...
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIGlmIHRoZSB2Q1BVIGlzIGRpZmZlcmVudCB0aGFuIHRoZSBvbmUgY3VycmVudGx5IHJ1bm5p
bmcgb3IgaWYgaXQncwpydW5uaW5nIG9uIGEgZGlmZmVyZW50IHBDUFUuCgpObyBmdW5jdGlvbmFs
IGNoYW5nZSBpbnRlbmRlZC4KClN1Z2dlc3RlZCBieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgot
LS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92
bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwppbmRleCBhNTVmZjM3NzMzLi5l
NWU2NzRjMzczIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYworKysgYi94
ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwpAQCAtMjA1NCw2ICsyMDU0LDE3IEBAIHN0YXRpYyB2
b2lkIHZteF9zeW5jX3Bpcl90b19pcnIoc3RydWN0IHZjcHUgKnYpCiAgICAgdW5zaWduZWQgaW50
IGdyb3VwLCBpOwogICAgIERFQ0xBUkVfQklUTUFQKHBlbmRpbmdfaW50ciwgTlJfVkVDVE9SUyk7
CiAKKyAgICBpZiAoIHYgIT0gY3VycmVudCAmJiB2LT5pc19ydW5uaW5nICkKKyAgICB7CisgICAg
ICAgIC8qCisgICAgICAgICAqIFN5bmNpbmcgUElSIHRvIElSUiBtdXN0IG5vdCBiZSBkb25lIGJl
aGluZCB0aGUgYmFjayBvZiB0aGUgQ1BVLAorICAgICAgICAgKiBzaW5jZSB0aGUgSVJSIGlzIGNv
bnRyb2xsZWQgYnkgdGhlIGhhcmR3YXJlIHdoZW4gdGhlIHZDUFUgaXMKKyAgICAgICAgICogZXhl
Y3V0aW5nLgorICAgICAgICAgKi8KKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CisgICAg
ICAgIHJldHVybjsKKyAgICB9CisKICAgICBpZiAoICFwaV90ZXN0X2FuZF9jbGVhcl9vbigmdi0+
YXJjaC5odm0udm14LnBpX2Rlc2MpICkKICAgICAgICAgcmV0dXJuOwogCi0tIAoyLjI0LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
