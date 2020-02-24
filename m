Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65FA16A444
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 11:49:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6BGj-0004zY-Bu; Mon, 24 Feb 2020 10:47:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6BGh-0004ye-EQ
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 10:47:19 +0000
X-Inumbo-ID: 00cb8a50-56f3-11ea-8ae3-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00cb8a50-56f3-11ea-8ae3-12813bfff9fa;
 Mon, 24 Feb 2020 10:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582541227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tgPH1WkDVXXMWZqS7MqzPlMLw2kiP4tQlPJKkocGJPM=;
 b=e3su4wKkgLBsVkVh6HbL7VbFW4Q4bdOyPgAtBqv4NQO7EiHYywyL3vd7
 6wTQEZIb/GToLV/9df547tj0umkVFFJMt2pg8HGj9pzKo0iMiEEKnaDiz
 7nS+tc8bUbY9TzV98Qxbljc1QPnDqC4oDpS/ShxRJlUHHMTPBSyMLcLwj Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AbeTJRnocntcbpq2ku7Rbj06wW0cbD3x5M8AYQfu4wfcG0Nd9DaCsT28HgkGxcO4C998Fc4bs5
 OhZgut+/RAoh8ITL+OLjpvABtUt6xpPbPHAqO5NL5DrOcp+GUO7ThQlE8JzhkdZQwFCDEnrwNv
 BpqpwbT+wWmACSTL8trTpI2jR8k3Cv8454PqT8T5yAYem3QS+C/nJiey9rlk7C/v3X10QnED3N
 HvIvGN9O+63PPSCmgJLzRimqOZ2+fG2QOvEfpJ/SHPGnldKXFYtpVc/ri12Sr8zdaErsFPdI0p
 vq4=
X-SBRS: 2.7
X-MesageID: 13255828
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,479,1574139600"; d="scan'208";a="13255828"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 24 Feb 2020 11:46:43 +0100
Message-ID: <20200224104645.96381-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224104645.96381-1-roger.pau@citrix.com>
References: <20200224104645.96381-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 3/5] x86: track when in #MC context
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGhlbHBlcnMgdG8gdHJhY2sgd2hlbiBleGVjdXRpbmcgaW4gI01DIGNvbnRleHQuIFRoaXMg
aXMgbW9kZWxlZAphZnRlciB0aGUgaW5faXJxIGhlbHBlcnMuCgpOb3RlIHRoYXQgdGhlcmUgYXJl
IG5vIHVzZXJzIG9mIGluX21jKCkgaW50cm9kdWNlZCBieSB0aGUgY2hhbmdlLApmdXJ0aGVyIHVz
ZXJzIHdpbGwgYmUgYWRkZWQgYnkgZm9sbG93dXAgY2hhbmdlcy4KClNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2
MjoKIC0gTW92ZSBkZWZpbml0aW9uIG9mIG1jX2NvdW50IHRvIHg4NiBoYXJkaXJxLmguCi0tLQog
eGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmMgfCAyICsrCiB4ZW4vaW5jbHVkZS9hc20teDg2
L2hhcmRpcnEuaCB8IDYgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL21jZS5jIGIveGVuL2FyY2gveDg2
L2NwdS9tY2hlY2svbWNlLmMKaW5kZXggZDYxZTU4MmFmMy4uOTNlZDU3NTJhYyAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L2NwdS9tY2hlY2svbWNlLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9t
Y2hlY2svbWNlLmMKQEAgLTkzLDcgKzkzLDkgQEAgdm9pZCB4ODZfbWNlX3ZlY3Rvcl9yZWdpc3Rl
cih4ODZfbWNlX3ZlY3Rvcl90IGhkbHIpCiAKIHZvaWQgZG9fbWFjaGluZV9jaGVjayhjb25zdCBz
dHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKIHsKKyAgICBtY19lbnRlcigpOwogICAgIF9tYWNo
aW5lX2NoZWNrX3ZlY3RvcihyZWdzKTsKKyAgICBtY19leGl0KCk7CiB9CiAKIC8qCmRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2hhcmRpcnEuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
aGFyZGlycS5oCmluZGV4IDZjY2NlNzU4ODEuLjE2ZGJlMjdkZTQgMTAwNjQ0Ci0tLSBhL3hlbi9p
bmNsdWRlL2FzbS14ODYvaGFyZGlycS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaGFyZGly
cS5oCkBAIC04LDYgKzgsNyBAQCB0eXBlZGVmIHN0cnVjdCB7CiAJdW5zaWduZWQgaW50IF9fc29m
dGlycV9wZW5kaW5nOwogCXVuc2lnbmVkIGludCBfX2xvY2FsX2lycV9jb3VudDsKIAl1bnNpZ25l
ZCBpbnQgbm1pX2NvdW50OworCXVuc2lnbmVkIGludCBtY19jb3VudDsKIAlib29sX3QgX19td2Fp
dF93YWtldXA7CiB9IF9fY2FjaGVsaW5lX2FsaWduZWQgaXJxX2NwdXN0YXRfdDsKIApAQCAtMjMs
NiArMjQsMTEgQEAgdHlwZWRlZiBzdHJ1Y3QgewogI2RlZmluZSBubWlfZW50ZXIoKQkobm1pX2Nv
dW50KHNtcF9wcm9jZXNzb3JfaWQoKSkrKykKICNkZWZpbmUgbm1pX2V4aXQoKQkobm1pX2NvdW50
KHNtcF9wcm9jZXNzb3JfaWQoKSktLSkKIAorI2RlZmluZSBtY19jb3VudChjcHUpCV9fSVJRX1NU
QVQoKGNwdSksIG1jX2NvdW50KQorI2RlZmluZSBpbl9tYygpIAkobWNfY291bnQoc21wX3Byb2Nl
c3Nvcl9pZCgpKSAhPSAwKQorI2RlZmluZSBtY19lbnRlcigpCShtY19jb3VudChzbXBfcHJvY2Vz
c29yX2lkKCkpKyspCisjZGVmaW5lIG1jX2V4aXQoKQkobWNfY291bnQoc21wX3Byb2Nlc3Nvcl9p
ZCgpKS0tKQorCiB2b2lkIGFja19iYWRfaXJxKHVuc2lnbmVkIGludCBpcnEpOwogCiBleHRlcm4g
dm9pZCBhcGljX2ludHJfaW5pdCh2b2lkKTsKLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
