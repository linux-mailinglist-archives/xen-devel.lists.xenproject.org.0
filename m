Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82DD11EAED
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 20:07:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifqF6-00006i-OB; Fri, 13 Dec 2019 19:04:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B4Jk=2D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ifqF5-00006c-Cs
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 19:04:47 +0000
X-Inumbo-ID: 6b1a1ac7-1ddb-11ea-8fd3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b1a1ac7-1ddb-11ea-8fd3-12813bfff9fa;
 Fri, 13 Dec 2019 19:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576263882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ze14VkftPAGShn8HBpi741Od6YeSkC3h65W60m19Tw=;
 b=PAQrzddX9/FnnIP1LFgM3ZaHxtiBv6VIC7mUfRqeu8scUxp3CvwdtiC0
 VofKYl932m4NC7f6TvJgsWdazToY3yfrLv0z07io6Zb1a56ckxDGQi3Pd
 Y+3JfpF2Ox5VOVfMfmUrrErk2G2qYjwDBnSfPKxmc+LAT39LHXlsn6Reh g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BNLlEGqlK86X2/egcZBZ2xtitSl6jeaLfkDAp6Wb0d8L+DR0vkqpUGzyGLTvdDz9uxkwmOMX30
 sP+rSLqEmGQLQ92tdD73UWqqii509tRKQvOPo/iH7Vx331CDaBBXWs2Fz2TfyRPI9dHSlZG/bS
 WHQuLEYybBTJ9R470KoOagsfA61ByTWxOoZs6/4TKuSSbAeAGMjW5DEuAyoZxdExd6d8txcJtV
 hYjg56YVrJB/akb2kMTT0tb6uJgDBu8fb6874EGmEZZ8FO74nxd6W/bP7A3ib9VsbVV4PyKEY/
 lcY=
X-SBRS: 2.7
X-MesageID: 10233140
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10233140"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 19:04:34 +0000
Message-ID: <20191213190436.24475-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191213190436.24475-1-andrew.cooper3@citrix.com>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/6] x86/suspend: Restore cr4 later during resume
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVzdCBsaWtlIHRoZSBCU1AvQVAgcGF0aHMsICVjcjQgaXMgbG9hZGVkIHdpdGggb25seSBQQUUu
ICBEZWZlciByZXN0b3JpbmcgYWxsCm9mICVjcjQgKE1DRSBpbiBwYXJ0aWN1bGFyKSB1bnRpbCBh
bGwgdGhlIHN5c3RlbSBzdHJ1Y3R1cmVzIChJRFQvVFNTIGluCnBhcnRpY3VsYXIpIGhhdmUgYmVl
biBsb2FkZWQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvYWNwaS9zdXNwZW5kLmMgICAgIHwgMyArKysKIHhlbi9h
cmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90LlMgfCA0IC0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9h
Y3BpL3N1c3BlbmQuYyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3N1c3BlbmQuYwppbmRleCBjOWRlYTY3
YmYzLi4zMmQwZjcxZmZkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYWNwaS9zdXNwZW5kLmMK
KysrIGIveGVuL2FyY2gveDg2L2FjcGkvc3VzcGVuZC5jCkBAIC00Myw2ICs0Myw5IEBAIHZvaWQg
cmVzdG9yZV9yZXN0X3Byb2Nlc3Nvcl9zdGF0ZSh2b2lkKQogewogICAgIGxvYWRfc3lzdGVtX3Rh
YmxlcygpOwogCisgICAgLyogUmVzdG9yZSBmdWxsIENSNCAoaW5jIE1DRSkgbm93IHRoYXQgdGhl
IElEVCBpcyBpbiBwbGFjZS4gKi8KKyAgICB3cml0ZV9jcjQobW11X2NyNF9mZWF0dXJlcyk7CisK
ICAgICAvKiBSZWNvdmVyIHN5c2NhbGwgTVNScyAqLwogICAgIHdybXNybChNU1JfTFNUQVIsIHNh
dmVkX2xzdGFyKTsKICAgICB3cm1zcmwoTVNSX0NTVEFSLCBzYXZlZF9jc3Rhcik7CmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvYWNwaS93YWtldXBfcHJvdC5TIGIveGVuL2FyY2gveDg2L2FjcGkv
d2FrZXVwX3Byb3QuUwppbmRleCAyZjZjOGUxOGVmLi5hODE4NDlmZDJiIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvYWNwaS93YWtldXBfcHJvdC5TCisrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3dh
a2V1cF9wcm90LlMKQEAgLTQ1LDEwICs0NSw2IEBAIEVOVFJZKGRvX3N1c3BlbmRfbG93bGV2ZWwp
CiBFTlRSWShzM19yZXN1bWUpCiAgICAgICAgIGxnZHQgICAgYm9vdF9nZHRyKCVyaXApCiAKLSAg
ICAgICAgLyogbW11X2NyNF9mZWF0dXJlcyBjb250YWlucyBsYXRlc3QgY3I0IHNldHRpbmcgKi8K
LSAgICAgICAgbW92ICAgICBSRUYobW11X2NyNF9mZWF0dXJlcyksIEdSRUcoYXgpCi0gICAgICAg
IG1vdiAgICAgR1JFRyhheCksICVjcjQKLQogICAgICAgICBtb3YgICAgIFJFRihzYXZlZF9jcjAp
LCBHUkVHKGF4KQogICAgICAgICBtb3YgICAgIEdSRUcoYXgpLCAlY3IwCiAKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
