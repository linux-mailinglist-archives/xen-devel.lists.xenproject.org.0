Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4E811EAEE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 20:07:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifqFB-00007W-DJ; Fri, 13 Dec 2019 19:04:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B4Jk=2D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ifqFA-00007J-Cz
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 19:04:52 +0000
X-Inumbo-ID: 6a36db64-1ddb-11ea-8fd3-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a36db64-1ddb-11ea-8fd3-12813bfff9fa;
 Fri, 13 Dec 2019 19:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576263882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zuRI4c3DTD+Wc+o6lyKaviisE7PPCLcipPLcD1CIIHU=;
 b=PpKivg1svAcxyr/9PGNJqALhiHUoyAa7Ip3hTWuPE1A88XFeqiy8+R+x
 FhBgaBUsTcXh0RN2d9tcaP5Znxc7Ylft2q4Z+2EjYm4nffCGfKg1pJt8o
 OAf0ZBRReDDutrB/8mbgVwS92NbJIyXjo8dxjwScAAZD3vjbpQfOMmsw5 A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: G0QFSutTcdlsNjc6xySx5My5Dk5FXqvtJDJfz7Io1ls2Mgkv8PTAnbl75bH8j0wqsm0L0rx20i
 V0ZwF+PMf5y+Rt7tvuKAIImbiE0Tve2R17gd1uq+WmP/GcQKLGKU2WFzF4P5aG0LqxmxMdjyAt
 g8eXh5eL/CAyuwE2x9w5KfEIj2a6ckby/2FTF3H9QaHKb/tCk/0NF5djY1d7YkfigcoaKo2bzl
 VGP5vxXNVfS8ltkJBiPf3tpkE4QOJ9y933JEz9fsQhmO2cUXr9tFmZTUBDNv5tjL+L/+3iNoKk
 zP0=
X-SBRS: 2.7
X-MesageID: 9669005
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; 
   d="scan'208";a="9669005"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 19:04:32 +0000
Message-ID: <20191213190436.24475-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191213190436.24475-1-andrew.cooper3@citrix.com>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/6] x86/suspend: Don't bother saving %cr3,
 %ss or flags
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

VGhlIHRyYW1wb2xpbmUgaGFzIGFscmVhZHkgc2V0IHVwIHRoZSBpZGxlIHBhZ2V0YWJsZXMgKHdo
aWNoIGFyZSB0aGUgY29ycmVjdApvbmVzIHRvIHVzZSksIGFuZCBzYW5pdGlzZWQgdGhlIGZsYWdz
IHN0YXRlLgoKRm9yICVzcywgX19IWVBFUlZJU09SX0RTNjQgaXMgdGhlIGNvcnJlY3QgZGVzY3Jp
cHRvciB0byByZXN0b3JlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+
CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2FjcGkvd2FrZXVwX3Byb3QuUyB8IDIwICsr
Ky0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxNyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYWNwaS93YWtldXBfcHJvdC5T
IGIveGVuL2FyY2gveDg2L2FjcGkvd2FrZXVwX3Byb3QuUwppbmRleCA4YzUyNWE4MDJiLi4zNWZk
N2E1ZTlmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYWNwaS93YWtldXBfcHJvdC5TCisrKyBi
L3hlbi9hcmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90LlMKQEAgLTI5LDE3ICsyOSwxMCBAQCBFTlRS
WShkb19zdXNwZW5kX2xvd2xldmVsKQogICAgICAgICBTQVZFX0dSRUcoMTMpCiAgICAgICAgIFNB
VkVfR1JFRygxNCkKICAgICAgICAgU0FWRV9HUkVHKDE1KQotICAgICAgICBwdXNoZnE7Ci0gICAg
ICAgIHBvcHEgICAgU0FWRURfR1JFRyhmbGFncykKLQotICAgICAgICBtb3YgICAgICVzcywgUkVG
KHNhdmVkX3NzKQogCiAgICAgICAgIG1vdiAgICAgJWNyMCwgR1JFRyhheCkKICAgICAgICAgbW92
ICAgICBHUkVHKGF4KSwgUkVGKHNhdmVkX2NyMCkKIAotICAgICAgICBtb3YgICAgICVjcjMsIEdS
RUcoYXgpCi0gICAgICAgIG1vdiAgICAgR1JFRyhheCksIFJFRihzYXZlZF9jcjMpCi0KICAgICAg
ICAgY2FsbCAgICBzYXZlX3Jlc3RfcHJvY2Vzc29yX3N0YXRlCiAKICAgICAgICAgLyogZW50ZXIg
c2xlZXAgc3RhdGUgcGh5c2ljYWxseSAqLwpAQCAtNTUsNiArNDgsNyBAQCBFTlRSWShkb19zdXNw
ZW5kX2xvd2xldmVsKQogICAgICAgICAgKgogICAgICAgICAgKiBUaGUgdHJhbXBvbGluZSByZS1p
bnRlcmNlcHRzIGhlcmUuICBTdGF0ZSBpczoKICAgICAgICAgICogIC0gNjRiaXQgbW9kZQorICAg
ICAgICAgKiAgLSAlY3IzID0+IGlkbGVfcGdfdGFibGVbXQogICAgICAgICAgKgogICAgICAgICAg
KiBFdmVyeXRoaW5nIGVsc2UsIGluY2x1ZGluZyB0aGUgc3RhY2ssIG5lZWRzIHJlc3RvcmluZy4K
ICAgICAgICAgICovCkBAIC02NSwxMyArNTksMTEgQEAgRU5UUlkoczNfcmVzdW1lKQogICAgICAg
ICBtb3YgICAgIFJFRihtbXVfY3I0X2ZlYXR1cmVzKSwgR1JFRyhheCkKICAgICAgICAgbW92ICAg
ICBHUkVHKGF4KSwgJWNyNAogCi0gICAgICAgIG1vdiAgICAgUkVGKHNhdmVkX2NyMyksIEdSRUco
YXgpCi0gICAgICAgIG1vdiAgICAgR1JFRyhheCksICVjcjMKLQogICAgICAgICBtb3YgICAgIFJF
RihzYXZlZF9jcjApLCBHUkVHKGF4KQogICAgICAgICBtb3YgICAgIEdSRUcoYXgpLCAlY3IwCiAK
LSAgICAgICAgbW92ICAgICBSRUYoc2F2ZWRfc3MpLCAlc3MKKyAgICAgICAgbW92ICAgICAkX19I
WVBFUlZJU09SX0RTNjQsICVlYXgKKyAgICAgICAgbW92ICAgICAlZWF4LCAlc3MKICAgICAgICAg
TE9BRF9HUkVHKHNwKQogCiAgICAgICAgIC8qIFJlbG9hZCBjb2RlIHNlbGVjdG9yICovCkBAIC04
MCw4ICs3Miw2IEBAIEVOVFJZKHMzX3Jlc3VtZSkKICAgICAgICAgcHVzaHEgICAlcmF4CiAgICAg
ICAgIGxyZXRxCiAxOgotICAgICAgICBwdXNocSAgIFNBVkVEX0dSRUcoZmxhZ3MpCi0gICAgICAg
IHBvcGZxCiAKICAgICAgICAgY2FsbCByZXN0b3JlX3Jlc3RfcHJvY2Vzc29yX3N0YXRlCiAKQEAg
LTEwOSw4ICs5OSw2IEBAIEVOVFJZKHMzX3Jlc3VtZSkKIEdMT0JBTChzYXZlZF9tYWdpYykKICAg
ICAgICAgLmxvbmcgICAweDlhYmNkZWYwCiAKLXNhdmVkX3NzOiAgICAgICAgLndvcmQgICAwCi0K
ICAgICAgICAgLmFsaWduIDgKIERFQ0xBUkVfR1JFRyhzcCkKIERFQ0xBUkVfR1JFRyhicCkKQEAg
LTEyMCw3ICsxMDgsNiBAQCBERUNMQVJFX0dSRUcoY3gpCiBERUNMQVJFX0dSRUcoZHgpCiBERUNM
QVJFX0dSRUcoc2kpCiBERUNMQVJFX0dSRUcoZGkpCi1ERUNMQVJFX0dSRUcoZmxhZ3MpCiAKIERF
Q0xBUkVfR1JFRyg4KQogREVDTEFSRV9HUkVHKDkpCkBAIC0xMzIsNCArMTE5LDMgQEAgREVDTEFS
RV9HUkVHKDE0KQogREVDTEFSRV9HUkVHKDE1KQogCiBzYXZlZF9jcjA6ICAgICAgLnF1YWQgICAw
Ci1zYXZlZF9jcjM6ICAgICAgLnF1YWQgICAwCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
