Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B523EEE562
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 18:00:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRffq-00073g-QZ; Mon, 04 Nov 2019 16:57:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v6/C=Y4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iRffp-00073X-Cu
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 16:57:49 +0000
X-Inumbo-ID: 36679be4-ff24-11e9-a184-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36679be4-ff24-11e9-a184-12813bfff9fa;
 Mon, 04 Nov 2019 16:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572886661;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RLldk9pTBhTIM8pPpe2SSdifI4wMITzVvbKeaTeNihg=;
 b=IOWCybr+NhDXMwI5sPwWu0S8DAwXgzqlIGCcz9c81rdCbb0/DjNGp9uk
 HlDHKNF82FI+svIQpUETDf7qBYUgMYR5FLZO1ONw3mxy9pIahuN5f19M9
 4bvy7SJQY5nJBFibkSjQ/h8CKVYeWj3Gr2hj5IHF+LcP24pHWGDJZEzEX o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Lf8iaAuY1aFdr0XQBfTSFHLV42icerAsVpQCmUpd2G9xDO8q8A1QiOX3ZfaHPxjXR5cv9vx77a
 dvWy+xXnCQaWcv6CaLQxnwg2Hp0RfKOhM1CK/5yLQC60E+Z3vOTZDyEh2Jdf4hoVWQTxv+j2x5
 sdvtj7ohqujxqtX8j0aPXLxp66rRW/Zr6HR8189VPrH/QWcRhpYeh4IbXAQcw7adaSjaw6plNP
 RRbQL6aBSXTKsyCXBE3z7Zz4CN9FLIDxgE42KW6gM/d1UxLEOW7WsBjD+DL5PrK/ErdeV/9Y7q
 tNY=
X-SBRS: 2.7
X-MesageID: 8157969
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,267,1569297600"; 
   d="scan'208";a="8157969"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 4 Nov 2019 16:57:35 +0000
Message-ID: <20191104165735.7335-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] adhoc-revtuple-generator: Bisect over
 5000 commits (really)
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <royger@FreeBSD.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gZTliMDY1Mzg3NWIzIHdlIGNoYW5nZWQgb25lIG9mIHRoZSBgMTAwMCcgdmFsdWVzIHRvIGA1
MDAwJy4gIEJ1dAp0aGlzIG1hZ2ljIG51bWJlciBoYWQgYmVlbiBkdXBsaWNhdGVkLiAgVXJnaCEK
ClRoZSByZXN1bHQgaXMgdGhhdCBhZGhvYy1yZXZ0dXBsZS1nZW5lcmF0b3IgbWlnaHQgZ2VuZXJh
dGUgYSB3ZWlyZGx5CnRydW5jYXRlZCBvdXRwdXQgd2hpY2ggY2F1c2VzIGNzLWJpc2VjdGlvbi1z
dG9wIHRvIGZhaWwgd2l0aCBtZXNzYWdlcwpsaWtlIHRoaXM6CiAgKioqIG5vdCBSZWx2VXAgYXQg
M2Q0MDE0NzI4MjY3MGQ1OTdiMzM2YmU1NTk5YjVjYzRjMmZmN2RkZCAgYXQgLi9jcy1iaXNlY3Rp
b24tc3RlcCBsaW5lIDU1NC4KICAqKiogbm90IFJlbHZEb3duIGF0IDJmYTM0NzljZmFkYjBiYjNm
ZTY5NGRiZmQyOWYyMzUwZWIyNTcwZGYgIGF0IC4vY3MtYmlzZWN0aW9uLXN0ZXAgbGluZSA1NTQu
CiAgKioqIG5vdCBSZWx2VXAgYXQgMmZhMzQ3OWNmYWRiMGJiM2ZlNjk0ZGJmZDI5ZjIzNTBlYjI1
NzBkZiAgYXQgLi9jcy1iaXNlY3Rpb24tc3RlcCBsaW5lIDU1NC4KICAuLi4KICBVc2Ugb2YgdW5p
bml0aWFsaXplZCB2YWx1ZSBpbiBjb25jYXRlbmF0aW9uICguKSBvciBzdHJpbmcgYXQgLi9jcy1i
aXNlY3Rpb24tc3RlcCBsaW5lIDc0Ny4KICBTaG91bGQgdGVzdCAuCiAgQlJPS0VOIHNlZSBlYXJs
aWVyIGVycm9ycy4gYXQgLi9jcy1iaXNlY3Rpb24tc3RlcCBsaW5lIDE0NTQsIDxTVkdJPiBsaW5l
IDEwMDg5LgoKRml4IHRoaXMgYnkgKGkpIHBsdW1iaW5nIHRoZSBtYWdpYyB2YWx1ZSB3ZSBhbHJl
YWR5IGVkaXRlZCBwcm9wZXJseQpiYWNrIHRvIHRoZSAoY29tbWFuZC1saW5lIGNvbnRyb2xsZWQp
IGdsb2JhbCB2YXJpYWJsZSAoaWkpIGNoYW5naW5nCnRoZSBnbG9iYWwgdmFyaWFibGUgZnJvbSAx
MDAwIHRvIDUwMDAuCgpnaXQtZ3JlcCAnXGIxMDAwXGInICBzdGlsbCBwcm9kdWNlcyBhIGZhaXIg
YW1vdW50IG9mIG91dHB1dCBidXQgbW9zdApvZiBpdCBpcyB0aW1lb3V0cywgd2hpY2ggaXMgZmFp
ciBlbm91Z2guICBUaGVyZSBpcyBhbHNvIGEgZmxpZ2h0CmNvdW50IGxpbWl0IGluIHNnLXJlcG9y
dC1mbGlnaHQsIHdoaWNoIGxpbWl0cyBob3cgZmFyIGJhY2sgaXQgaXMKd2lsbGluZyB0byBsb29r
LiAgV2UgZG9uJ3Qgd2FudCB0byBjaGFuZ2UgdGhhdCBoZXJlLgoKV2l0aCB0aGlzIGNoYW5nZSwg
Y3MtYmlzZWN0aW9uLXN0ZXAgb24gdGhlIGN1cnJlbnRseS1mYWlsaW5nIGZyZWVic2QKYnVpbGQg
am9iIGRvZXMgdGhpczoKICBTZWFyY2hpbmcgZm9yIGludGVyZXN0aW5nIHZlcnNpb25zCiAgUmVz
dWx0IGZvdW5kOiBmbGlnaHQgMTQxNDIwIChwYXNzKSwgZm9yIGJhc2lzIHBhc3MKICBSZXN1bHQg
Zm91bmQ6IGZsaWdodCAxNDMzOTcgKGZhaWwpLCBmb3IgYmFzaXMgZmFpbHVyZQogIE5lZWQgdG8g
cmVwcm9kdWNlIGJhc2lzIHBhc3MgKHBhc3MpOyBoYWQgMSBhbHJlYWR5LgogIFNob3VsZCB0ZXN0
IDJmYTM0NzljZmFkYjBiYjNmZTY5NGRiZmQyOWYyMzUwZWIyNTcwZGYuCgpUaGlzIGxvb2tzIHBs
YXVzaWJsZTogaXQgaXMgcGlja2luZyB1cCB3aGVyZSBpdCBsZWZ0IG9mZiBiZWZvcmUgdGhlCmJh
c2lzIHBhc3MgZmVsbCBvdmVyIGl0cyBob3Jpem9uLgoKQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
eWdlckBGcmVlQlNELm9yZz4KQ0M6IErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4KU2ln
bmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQog
YWRob2MtcmV2dHVwbGUtZ2VuZXJhdG9yIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FkaG9jLXJldnR1cGxlLWdl
bmVyYXRvciBiL2FkaG9jLXJldnR1cGxlLWdlbmVyYXRvcgppbmRleCBhYzBmMjQ2My4uYzhkNmY0
YWQgMTAwNzU1Ci0tLSBhL2FkaG9jLXJldnR1cGxlLWdlbmVyYXRvcgorKysgYi9hZGhvYy1yZXZ0
dXBsZS1nZW5lcmF0b3IKQEAgLTI4LDcgKzI4LDcgQEAgdXNlIE9zc3Rlc3Q7CiB1c2UgT3NzdGVz
dDo6VGVzdFN1cHBvcnQ7CiB1c2UgT3NzdGVzdDo6RXhlY3V0aXZlOwogCi1vdXIgJG51bT0gMTAw
MDsKK291ciAkbnVtPSA1MDAwOwogb3VyICRkb3VwZGF0ZT0gMTsKIG91ciAkc2hvd3Jldj0gMDsK
IApAQCAtNTUzLDcgKzU1Myw3IEBAIHN1YiBtYWluICgpIHsKICAgICBteSBAdHJlZXNfY29udGlu
dW91czsKICAgICBmb3JlYWNoIG15ICR0cmVlIChAdHJlZXMpIHsKICAgICAgICAgbXkgJGdlbj0g
dHJlZV9nZXRfZ2VuKCR0cmVlKTsKLSAgICAgICAgbXkgJGNvdW50PSA1MDAwOworICAgICAgICBt
eSAkY291bnQ9ICRudW07CiAgICAgICAgIG15ICRmb3VuZD0gMDsKICAgICAgICAgbXkgJHRvcD0g
dW5kZWY7CiAgICAgICAgIHdoaWxlICgkY291bnQtLSA+IDApIHsKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
