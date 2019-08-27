Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3176F9E98A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 15:36:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2bb4-0004NP-OO; Tue, 27 Aug 2019 13:33:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8wY6=WX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i2bb3-0004N3-6u
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 13:33:17 +0000
X-Inumbo-ID: 372b068c-c8cf-11e9-ac23-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 372b068c-c8cf-11e9-ac23-bc764e2007e4;
 Tue, 27 Aug 2019 13:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566912791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=il5wHWdG08K/WwVCv6LOoDJJTxpyyVsB6uhiMfXgDN0=;
 b=TQKffYkU2Ny/T5epIg/Nr0x3p3hPTkyFtpP553ESOQwoM2u1KpWJYXAa
 GzEzRBdVxcrFlp/rDdc7khVrfO00W+hZExE7VegOB2im249K0UMeOibrk
 v4925/eZT9U/9yB992i573tYqf1/Ru9HrNRYHy7OG6t/7y5okqlcYyP6G w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: k6cQQl2ZxP20PgYhA2iJRLQBKsMiG/cpdwY4VI7aZXr7LYb+lz0iDggO69NpK4QXvFBfAMN1eP
 k5Xt+z58a2WzEyMwvPAXnVaAk7i1KUszcvLD4r3UBsLE1qwsHyV+7n9W0MYKVgkyRPkfEIDXZQ
 Hdh8lJhkkMFnG+7wH3dc2ChLnANfrea81ibnrQ9CWVML0DRFY3BWa161Wo3RuTZX/v2hx5cySp
 J9ixesfwyLaxc3faogJ9oUc0McjszPNSnLiyGpsJv6KnZBv2Wq6C2Gd85xseKS2XGPBE0nNF2t
 bQU=
X-SBRS: 2.7
X-MesageID: 4987741
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,437,1559534400"; 
   d="scan'208";a="4987741"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 27 Aug 2019 14:32:57 +0100
Message-ID: <20190827133259.32084-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827133259.32084-1-anthony.perard@citrix.com>
References: <20190827133259.32084-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 2/4] xen: cleanup IOREQ server on exit
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CgpEZXZpY2Ug
bW9kZWwgaXMgc3VwcG9zZWQgdG8gZGVzdHJveSBJT1JFUSBzZXJ2ZXIgZm9yIGl0c2VsZi4KClNp
Z25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgpB
Y2tlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KTWVzc2FnZS1J
ZDogPDE1NjQ0Mjg1NjMtMTAwNi0xLWdpdC1zZW5kLWVtYWlsLWlnb3IuZHJ1emhpbmluQGNpdHJp
eC5jb20+ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPgotLS0KIGh3L2kzODYveGVuL3hlbi1odm0uYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9ody9pMzg2L3hlbi94ZW4taHZtLmMgYi9o
dy9pMzg2L3hlbi94ZW4taHZtLmMKaW5kZXggNWQzZTQ3NTBlNi4uNmI1ZTViYjdmNSAxMDA2NDQK
LS0tIGEvaHcvaTM4Ni94ZW4veGVuLWh2bS5jCisrKyBiL2h3L2kzODYveGVuL3hlbi1odm0uYwpA
QCAtMTI0Nyw2ICsxMjQ3LDggQEAgc3RhdGljIHZvaWQgeGVuX2V4aXRfbm90aWZpZXIoTm90aWZp
ZXIgKm4sIHZvaWQgKmRhdGEpCiB7CiAgICAgWGVuSU9TdGF0ZSAqc3RhdGUgPSBjb250YWluZXJf
b2YobiwgWGVuSU9TdGF0ZSwgZXhpdCk7CiAKKyAgICB4ZW5fZGVzdHJveV9pb3JlcV9zZXJ2ZXIo
eGVuX2RvbWlkLCBzdGF0ZS0+aW9zZXJ2aWQpOworCiAgICAgeGVuZXZ0Y2huX2Nsb3NlKHN0YXRl
LT54Y2VfaGFuZGxlKTsKICAgICB4c19kYWVtb25fY2xvc2Uoc3RhdGUtPnhlbnN0b3JlKTsKIH0K
LS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
