Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33250FB48D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 17:02:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUv3p-000893-Pu; Wed, 13 Nov 2019 16:00:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3XMH=ZF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iUv3o-00085G-B0
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 16:00:00 +0000
X-Inumbo-ID: a49d4e72-062e-11ea-a237-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a49d4e72-062e-11ea-a237-12813bfff9fa;
 Wed, 13 Nov 2019 15:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573660799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kWFYMUNgPFIVeLkcRGJallGgkmqAJMIGoP2Z0RorVtg=;
 b=D1JvsR36n6EoWNbWizAPlG+ewqH72TRJ3WAE8BNn3Hsdfweua4qzUyvt
 Vwm/Ka8/pqkEvBRz5XITA42SmT1YSp5d7hdOoZ+RkX8b88s48V6nOX1r4
 vL6t900NjRF1SBzrReDXb3gSQvPbSdlhVpwGghvA58FyhYhMl/3PDwMsy 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Hq0EoUr/lOscAju7zACcqMhyxr8BbEaU3t/MHCWLJTPqTuHQWaH3QbIKuHrNobsEl2PJONs18J
 HkgCWilDOD5JbokaoqhshobfwAPM+Wc3RZAMNoXsmEgbL6pSp81719lTfdE0LXHgh+Ojf5LkMD
 1el2nHizmgS1F2AxfppAgsn8Eq32YEAAkjWrJC4sLdpeFRfivurz3MazdH5zMysnE7eZiy/g/4
 vAy76qVKEMhe1shwLTrI8MUHRDletFNIrEMJMeuEy7soX+/qml5xIKkDUqD5bygGoCMTOiV+v/
 FfY=
X-SBRS: 2.7
X-MesageID: 8270877
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,300,1569297600"; 
   d="scan'208";a="8270877"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 13 Nov 2019 16:59:37 +0100
Message-ID: <20191113155940.81837-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v4 0/3] x86/passthrough: fix interrupt
 migration when using posting
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpUaGUgY3VycmVudCBpbnRlcnJ1cHQgcG9zdGluZyBjb2RlIGRvZXNuJ3QgZmx1c2gg
dGhlIFBJUiBpbnRvIHRoZSBJUlIKd2hlbiBpbnRlcnJ1cHRzIGFyZSBtb2RpZmllZCwgYW5kIGFz
IGEgcmVzdWx0IGEgdkNQVSBjYW4gcmVjZWl2ZSB2ZWN0b3JzCmZyb20gYSB0ZWFyIGRvd24gb3Ig
bW92ZWQgaW50ZXJydXB0LiBGaXggdGhpcyBieSBtYWtpbmcgc3VyZSBQSVIgaXMKYWx3YXlzIHN5
bmNlZCB0byBJUlIgd2hlbiB2TVNJIG9yIHZJTy1BUElDIGludGVycnVwdHMgYXJlIG1vZGlmaWVk
LgoKUm9nZXIgUGF1IE1vbm5lICgzKToKICB2bXg6IGFkZCBBU1NFUlQgdG8gcHJldmVudCBzeW5j
aW5nIFBJUiB0byBJUlIuLi4KICB4ODYvcGFzc3Rocm91Z2g6IGZpeCBtaWdyYXRpb24gb2YgTVNJ
IHdoZW4gdXNpbmcgcG9zdGVkIGludGVycnVwdHMKICB4ODYvdmlvYXBpYzogc3luYyBQSVIgdG8g
SVJSIHdoZW4gbW9kaWZ5aW5nIGVudHJpZXMKCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAg
ICAgICB8ICAzMSArKysrKysrKwogeGVuL2FyY2gveDg2L2h2bS92aW9hcGljLmMgICAgICAgfCAg
NDYgKysrKysrKysrKy0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZsYXBpYy5jICAgICAgICB8ICAxOSAr
KysrKwogeGVuL2FyY2gveDg2L2h2bS92bXNpLmMgICAgICAgICAgfCAgMjMgLS0tLS0tCiB4ZW4v
YXJjaC94ODYvaHZtL3ZteC92bXguYyAgICAgICB8ICAxMSArKysKIHhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2lvLmMgICAgIHwgMTE4ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIHhl
bi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oICAgIHwgICA1ICstCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS92bGFwaWMuaCB8ICAgMyArCiA4IGZpbGVzIGNoYW5nZWQsIDE2MiBpbnNlcnRpb25z
KCspLCA5NCBkZWxldGlvbnMoLSkKCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
