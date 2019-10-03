Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B32C9B16
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 11:52:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFxkR-00020j-In; Thu, 03 Oct 2019 09:50:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PrVC=X4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iFxkP-00020e-By
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 09:50:09 +0000
X-Inumbo-ID: 2f01ed7a-e5c3-11e9-9722-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 2f01ed7a-e5c3-11e9-9722-12813bfff9fa;
 Thu, 03 Oct 2019 09:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570096209;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=la3EOeGeEDaDt6xOOJ0qHNSFn96WBAVqTy8mtNzswBY=;
 b=XCXk5oYVoCwnCFBA/90xOOAtX7gS72crJ0TlK3uWD4vbCHLj0XEEpcjH
 ht9X0RrrcnJVECZ2meluLHVEvVLW+TcFiTCdvJ91OzjL/tEGJA+co6pwz
 COZwEmLav8CVq2ZZkqJi+tr8ZabS3oLc7RDDSQKwnVyvjypIkK2vF3e1u E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dtlaAVr9p2Kkl2PojTWNPFUY3zRdiZQLH+1J7ui7ddFjQuiXWGgieo9ni8SUuEkuwBOpIyBBHc
 PpJ/3nCTkzaTqJNTltj6or3NZx6iUkv7uSzds/vs4N5MtFBj0A/QkRth8Z6OJbuXUaNaGtWjYR
 bMaRgbyU6DUMKrF4jb74zvx7w5Z7ZvYwtkdBiEwQ/+ywgl6EdpErgFxa4kE2839hT4F1eoq9qD
 kUF9VW8jHHm146ymxwW5+F8mcRJ1K5aRXDAW0iiaUjbldc6czxRF6nQFpLVQOG4uW1p2J97muG
 kjM=
X-SBRS: 2.7
X-MesageID: 6412317
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,251,1566878400"; 
   d="scan'208";a="6412317"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 3 Oct 2019 10:50:04 +0100
Message-ID: <20191003095004.30676-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] Osstest.pm: Fix main_revision_job_cond
 after 0964bab7a9ea
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4KICBvdGhlcl9yZXZpc2lvbl9qb2Jfc3VmZml4OiBUYWtlIGFuZCBwYXNzIHJlZmVycmluZyBy
dW52YXIgbmFtZQp3ZSB1cGRhdGVkIG1haW5fcmV2aXNpb25fam9iX2NvbmQgdG8gcGFzcyBhIGR1
bW15ICd4JyBmb3IgdGhlIG5ldwpwYXJhbWV0ZXIuICBCdXQgdGhlIHBhcmFtZXRlciBpcyBhIHNx
bCBleHByZXNzaW9uLCBub3QgYSB2YWx1ZSwKYW5kIHNvIGFuIGV4dHJhIHBhaXIgb2YgcXVvdGVz
IGFyZSBuZWVkZWQuCgpUaGlzIGVycm9yIGJyb2tlIHNnLWNoZWNrLXRlc3RlZCBhbmQgdGhpcyBm
aXggZml4ZXMgaXQuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0LnBtIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC5wbSBiL09zc3Rl
c3QucG0KaW5kZXggYzE0NTMxZTMuLmQ2YzFiNzA5IDEwMDY0NAotLS0gYS9Pc3N0ZXN0LnBtCisr
KyBiL09zc3Rlc3QucG0KQEAgLTM4OCw3ICszODgsNyBAQCBFTkQKIAogc3ViIG1haW5fcmV2aXNp
b25fam9iX2NvbmQgKCQpIHsKICAgICBteSAoJGpvYmZpZWxkKSA9IEBfOwotICAgIHJldHVybiAi
KCR7XCBvdGhlcl9yZXZpc2lvbl9qb2Jfc3VmZml4KCRqb2JmaWVsZCwneCcsJ3gnKSB9ID0gJycp
IjsKKyAgICByZXR1cm4gIigke1wgb3RoZXJfcmV2aXNpb25fam9iX3N1ZmZpeCgkam9iZmllbGQs
XCIneCdcIiwneCcpIH0gPSAnJykiOwogfQogCiBzdWIgZ2V0X2hhcm5lc3NfcmV2ICgpIHsKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
