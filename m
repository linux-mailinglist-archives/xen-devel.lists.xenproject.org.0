Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AF812A2FD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 16:36:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijmBH-0002hC-3D; Tue, 24 Dec 2019 15:33:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zdcS=2O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ijmBF-0002h4-Gh
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 15:33:05 +0000
X-Inumbo-ID: acd1902c-2662-11ea-97e9-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id acd1902c-2662-11ea-97e9-12813bfff9fa;
 Tue, 24 Dec 2019 15:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577201585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RXK7BbFDJfC64/cz30084h1kX9xgSsy4hy45nLMyDU0=;
 b=fjysLmxiLqKYi10Bhu2tl9Fhbny/MDi774nCmRHZc/uFVbOh87E4TlB9
 FkE2ZAH3TnPBmyuzHx0Xcvlg6VHbFbLPWOJU82ocePGldAWqJgDsSO2fo
 v63Hwu9W4GMbpYLVpcRv4vSSOFukwldyARvITfxdZaGq8Q7FVIywooII0 k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: V8TiLkbhbmmBn6vr+hDt0Tz4Gc8QORbSkrDnsSqdL+QkP4dtC8VlI7VHHmdgqHmcV27s69aWnn
 fD5FhmiNjeM8d7/9gu4q5Us+zMwaCxL8St1kdTLJyG1PSzhyikN0BthuYKFSuEahZK/3Auy0Pa
 8FLE29j3EXWJwLc3DOlFNLWB9kWlkvwqz2/yYrN7wBDDKRzZVL0xGYUkRY4HUkJWbUbKK6+WvH
 KXaOuXVRiVHxvrOEtYU0ZecvxegWUQP46sIdGMFS/6QdeN6jXsI5Emr5taCRhNGBaRhkN87kwN
 qXU=
X-SBRS: 2.7
X-MesageID: 10267472
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10267472"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 16:32:47 +0100
Message-ID: <20191224153247.48228-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/vvmx: virtualize x2APIC mode and APIC
 accesses can't both be enabled
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWNjb3JkaW5nIHRvIHRoZSBJbnRlbCBTRE0sICJ2aXJ0dWFsaXplIHgyQVBJQyBtb2RlIiBhbmQg
InZpcnR1YWxpemUKQVBJQyBhY2Nlc3NlcyIgY2FuJ3QgYmUgZW5hYmxlZCBhdCB0aGUgc2FtZSB0
aW1lLCBvciBlbHNlIGEKdm17bGF1bmNoL2VudHJ5fSBmYWlsdXJlIHdpbGwgaGFwcGVuLiBUaGlz
IHdhcyBzZWVuIHdoZW4gcnVubmluZyBYZW4KbmVzdGVkIGFuZCB3aXRoIHgyQVBJQyBlbmFibGVk
OgoKRGVjIDIzIDIwOjA2OjU0LjQ0NDAyNSAoWEVOKSBkM3YwIFZNTEFVTkNIIGVycm9yOiAweDcK
Wy4uLl0KRGVjIDIzIDIwOjA4OjMzLjAwNDA3OCAoWEVOKSAqKiogQ29udHJvbCBTdGF0ZSAqKioK
RGVjIDIzIDIwOjA4OjMzLjAwNDA4NiAoWEVOKSBQaW5CYXNlZD0wMDAwMDAzZiBDUFVCYXNlZD1i
NmEwNzVmZSBTZWNvbmRhcnlFeGVjPTAwMDAxNGZiClsuLi5dCgpGaXggdGhpcyBieSBtYWtpbmcg
c3VyZSBudm14X3VwZGF0ZV9zZWNvbmRhcnlfZXhlY19jb250cm9sIGNsZWFycyB0aGUKaW5jb21w
YXRpYmxlIGJpdHMgZnJvbSB0aGUgaG9zdCB2bWNzIGJlZm9yZSBtZXJnaW5nIGl0IHdpdGggdGhl
IG5lc3RlZAp2bWNzLgoKVGhpcyBmaXhlcyBhIHJlZ3Jlc3Npb24gcmVwb3J0ZWQgYnkgb3NzdGVz
dCBpbiB0aGUKdGVzdC1hbWQ2NC1hbWQ2NC1xZW11dS1uZXN0ZWQtaW50ZWwgam9iLgoKU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVu
L2FyY2gveDg2L2h2bS92bXgvdnZteC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgYi94ZW4vYXJj
aC94ODYvaHZtL3ZteC92dm14LmMKaW5kZXggNWRkMDBlMTFiNS4uZDhhYjE2N2Q2MiAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0v
dm14L3Z2bXguYwpAQCAtNTk0LDYgKzU5NCw3IEBAIHZvaWQgbnZteF91cGRhdGVfc2Vjb25kYXJ5
X2V4ZWNfY29udHJvbChzdHJ1Y3QgdmNwdSAqdiwKICAgICB1MzIgc2hhZG93X2NudHJsOwogICAg
IHN0cnVjdCBuZXN0ZWR2bXggKm52bXggPSAmdmNwdV8yX252bXgodik7CiAgICAgdTMyIGFwaWN2
X2JpdCA9IFNFQ09OREFSWV9FWEVDX0FQSUNfUkVHSVNURVJfVklSVCB8CisgICAgICAgICAgICAg
ICAgICAgIFNFQ09OREFSWV9FWEVDX1ZJUlRVQUxJWkVfWDJBUElDX01PREUgfAogICAgICAgICAg
ICAgICAgICAgICBTRUNPTkRBUllfRVhFQ19WSVJUVUFMX0lOVFJfREVMSVZFUlk7CiAKICAgICBo
b3N0X2NudHJsICY9IH5hcGljdl9iaXQ7Ci0tIAoyLjI0LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
