Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A53F53D7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 19:53:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT9LH-00082D-3n; Fri, 08 Nov 2019 18:50:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4xER=ZA=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iT9LF-000816-Hu
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 18:50:41 +0000
X-Inumbo-ID: 9a517026-0258-11ea-9631-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a517026-0258-11ea-9631-bc764e2007e4;
 Fri, 08 Nov 2019 18:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573239016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=W6m5wYP8ekZTDoQ/zPFavOw8FePgmmvJpG/O6zLNBKk=;
 b=VS7FaCSGG3TEVpszh08WKHn5LiQc3rQ626iqQEI0Dil4iY3CUwZBpK/Y
 Kd2S0I82FQfoLDz4WOWymli6jQjnZKq/A7hTs+cv7YlXtCEbxZC+exvzk
 g55WH9tp3vSqzrtgIA1I/QNC/8fsDXw3jpk/LvV7XCiCQLE5lo4FVMamX 8=;
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
IronPort-SDR: AJRExs/14f51KprXrXfsw1FSOntMkl3TlPRA+dbgx5BhzuvFg58aMi/AwlLJtMm9WaJ7K+N/dG
 nYi5PjDO/J+oMHZkR5UBsDg/pEe7MSHH5TURT5V4PHuwhkWcci40XUzrzjaBixoWv+zzXrszp3
 VeRt1zEe8Fl4SjtMcLwYXGCyrOq3GlQat6YKDnGIRqYyzHX8eCmuGies2juVA8mTYGasiAFdpx
 Mdb91exej2CTsi1Uba++EScgEEtkKVZj+vq4gsiYwY9YrYRKYH0/1gSJQqNnLgtUnBOPp7tgAe
 0U0=
X-SBRS: 2.7
X-MesageID: 8429296
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,283,1569297600"; 
   d="scan'208";a="8429296"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 8 Nov 2019 18:49:52 +0000
Message-ID: <20191108185001.3319-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
References: <20191108185001.3319-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 04/13] sg-report-host-history: Actually
 honour $minflight
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

VGhpcyBzZXJpb3VzbHkgc3BlZWRzIHVwIHNvbWUgb2YgdGhlIHF1ZXJpZXMuCgpTaWduZWQtb2Zm
LWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBzZy1yZXBv
cnQtaG9zdC1oaXN0b3J5IHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NnLXJlcG9ydC1ob3N0LWhpc3RvcnkgYi9z
Zy1yZXBvcnQtaG9zdC1oaXN0b3J5CmluZGV4IGZjNTEwNzRkLi5kNDc3ODRkOSAxMDA3NTUKLS0t
IGEvc2ctcmVwb3J0LWhvc3QtaGlzdG9yeQorKysgYi9zZy1yZXBvcnQtaG9zdC1oaXN0b3J5CkBA
IC02Nyw2ICs2Nyw3IEBAIHdoaWxlIChAQVJHViAmJiAkQVJHVlswXSA9fiBtL14tLykgewogCiBv
dXIgJHJlc3RyaWN0ZmxpZ2h0X2NvbmQgPSByZXN0cmljdGZsaWdodF9jb25kKCk7CiBvdXIgJGZs
aWdodGNvbmQ7CitvdXIgJG1pbmZsaWdodDsKIAogc3ViIGNvbXB1dGVmbGlnaHRzcmFuZ2UgKCkg
ewogICAgIGlmICghJGZsaWdodGxpbWl0KSB7CkBAIC0xMDAsNyArMTAxLDcgQEAgRU5ECiAJICBM
SU1JVCAxCiBFTkQKICAgICAkbWluZmxpZ2h0c3EtPmV4ZWN1dGUoKTsKLSAgICBteSAoJG1pbmZs
aWdodCkgPSAkbWluZmxpZ2h0c3EtPmZldGNocm93X2FycmF5KCk7CisgICAgKCRtaW5mbGlnaHQs
KSA9ICRtaW5mbGlnaHRzcS0+ZmV0Y2hyb3dfYXJyYXkoKTsKICAgICAkbWluZmxpZ2h0IC8vPSAw
OwogCiAgICAgJGZsaWdodGNvbmQgPSAiKGZsaWdodCA+ICRtaW5mbGlnaHQpIjsKQEAgLTEyNywx
MCArMTI4LDEyIEBAIHN1YiBtYWlucXVlcnkgKCkgewogCSAgIEFORCAoJHZhbGNvbmQpCiAJICAg
QU5EICRmbGlnaHRjb25kCiAgICAgICAgICAgIEFORCAkcmVzdHJpY3RmbGlnaHRfY29uZAorICAg
ICAgICAgICBBTkQgZmxpZ2h0ID4gPwogCSBPUkRFUiBCWSBmbGlnaHQgREVTQwogCSBMSU1JVCAo
JGxpbWl0ICogMyArIDEwMCkgKiA/CiBFTkQKIAorICAgIHB1c2ggQHBhcmFtcywgJG1pbmZsaWdo
dDsKICAgICBwdXNoIEBwYXJhbXMsIHNjYWxhciBrZXlzICVob3N0czsKIAogICAgIHByaW50IERF
QlVHICJNQUlOUVVFUlkuLi5cbiI7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
