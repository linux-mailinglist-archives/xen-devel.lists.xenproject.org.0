Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084FA109F44
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 14:28:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZas2-0002Gq-Rv; Tue, 26 Nov 2019 13:27:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=up47=ZS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZas1-0002GG-L0
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 13:27:09 +0000
X-Inumbo-ID: 71bde9cc-1050-11ea-a55d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71bde9cc-1050-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574774829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XU799ubjhvOD8m3beFxNluqhOnqkfPRSlYf1fikne6U=;
 b=UWjZ6+ymsiCtP8DTmeQfBOeI7c7AoSessMFOcM9v1j+tkZJxMi4y95XG
 w4Sq/lnF2dePOb66bgWuDWQlzhLmK1GIP4qqDWNqm6c+9xDEYoPmVIhjl
 oOcrAEu0Em7I5B9vn3MbY/n4qudN2S0Ipgy8hbnaP8+Z7NX6TYij1fj8I 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Clxb3QqpffJhLLNOy3MFVQHNo3cU1cCTaWGVMhVgAuiaimbu6fDlW3KANI/zm/CBz7Pr0oeaph
 4N4sDUDAk1PlkPhU/Hjd8eRCVKp+TWadxOtgNLHOInrGuGriV8Z2NsvtbvS7BtcnVQsxpzJhKF
 gWkSsAJzP3QGeGHf+3qE1TT3qamKgcz4OjxQYkwOylDuuOga9Kq/hnToRbbVFUROeKs3PeiEd8
 Zqcl65ILSvvQY2CYKCr6HB6Yh5hhlfS7/FXDAP1tz8ZLbKkgES96SZox4rA+WReM6NvcVTfWrp
 DEs=
X-SBRS: 2.7
X-MesageID: 8842073
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,245,1571716800"; 
   d="scan'208";a="8842073"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 14:26:47 +0100
Message-ID: <20191126132648.6917-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191126132648.6917-1-roger.pau@citrix.com>
References: <20191126132648.6917-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v3 1/2] x86/vmx: add ASSERT to prevent
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
bmcgb3IgaWYgaXQncwpub3QgcGF1c2VkLiBOb3RlIHRoYXQgc3luY2luZyBQSVIgdG8gSVJSIHdo
ZW4gdGhlIHZDUFUgaXMgcnVubmluZyBpcwpub3QgYWxsb3dlZCwgc2luY2UgdGhlIGhhcmR3YXJl
IGlzIGluIGNvbnRyb2wgb2YgVk1DUyBJUlIgZmllbGQuCgpBbGxvdyBzeW5jaW5nIFBJUiB0byBJ
UlIgd2hlbiB0aGUgdkNQVSBpcyBwYXVzZWQsIHRoaXMgaXMgcmVxdWlyZWQgaW4Kb3JkZXIgdG8g
c2F2ZSB0aGUgbG9jYWwgQVBJQyBzdGF0ZS4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVk
LgoKU3VnZ2VzdGVkIGJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
LS0tCkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNl
IHYyOgogLSBPbmx5IGFsbG93IHN5bmNpbmcgaWYgdGhlIHZDUFUgaXMgdGhlIGN1cnJlbnQgb25l
IG9yIGlmIGl0J3MKICAgcGF1c2VkLgoKQ2hhbmdlcyBzaW5jZSB2MToKIC0gVXNlIHZjcHVfcnVu
bmFibGUgaW5zdGVhZCBvZiBpc19ydW5uaW5nLgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3Zt
eC5jIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyBiL3hlbi9hcmNoL3g4Ni9o
dm0vdm14L3ZteC5jCmluZGV4IGE1NWZmMzc3MzMuLmM4MTdhZWM3NWQgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5j
CkBAIC0yMDU0LDYgKzIwNTQsMTkgQEAgc3RhdGljIHZvaWQgdm14X3N5bmNfcGlyX3RvX2lycihz
dHJ1Y3QgdmNwdSAqdikKICAgICB1bnNpZ25lZCBpbnQgZ3JvdXAsIGk7CiAgICAgREVDTEFSRV9C
SVRNQVAocGVuZGluZ19pbnRyLCBOUl9WRUNUT1JTKTsKIAorICAgIGlmICggdiAhPSBjdXJyZW50
ICYmICFhdG9taWNfcmVhZCgmdi0+cGF1c2VfY291bnQpICkKKyAgICB7CisgICAgICAgIC8qCisg
ICAgICAgICAqIFN5bmNpbmcgUElSIHRvIElSUiBtdXN0IG5vdCBiZSBkb25lIGJlaGluZCB0aGUg
YmFjayBvZiB0aGUgQ1BVLAorICAgICAgICAgKiBzaW5jZSB0aGUgSVJSIGlzIGNvbnRyb2xsZWQg
YnkgdGhlIGhhcmR3YXJlIHdoZW4gdGhlIHZDUFUgaXMKKyAgICAgICAgICogZXhlY3V0aW5nLiBP
bmx5IGFsbG93IFhlbiB0byBkbyBzdWNoIHN5bmMgaWYgdGhlIHZDUFUgaXMgdGhlIGN1cnJlbnQK
KyAgICAgICAgICogb25lIG9yIGlmIGl0J3MgcGF1c2VkOiB0aGF0J3MgcmVxdWlyZWQgaW4gb3Jk
ZXIgdG8gc3luYyB0aGUgbGFwaWMKKyAgICAgICAgICogc3RhdGUgYmVmb3JlIHNhdmluZyBpdC4K
KyAgICAgICAgICovCisgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOworICAgICAgICByZXR1
cm47CisgICAgfQorCiAgICAgaWYgKCAhcGlfdGVzdF9hbmRfY2xlYXJfb24oJnYtPmFyY2guaHZt
LnZteC5waV9kZXNjKSApCiAgICAgICAgIHJldHVybjsKIAotLSAKMi4yNC4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
