Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCB7B7828
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:07:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAuF8-0003Ab-FS; Thu, 19 Sep 2019 11:04:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAuF7-00039q-20
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:04:57 +0000
X-Inumbo-ID: 4ad232f4-dacd-11e9-978d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ad232f4-dacd-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 11:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568891087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mrsRuwynkbymOCcoesCdW4GjkY00KLS1YUIo7f9zr98=;
 b=PS1A9cAZzFi7O/52R8m25JW/j1qzreSkutNhxu1E4v7tBMlnm/TAsd8P
 9SQ80og2EI6axW3FCpEBYFzFF1zBnMeF+cF42B6hbS3suu/w6Q5gDKHGi
 EhzohlQXO6rvQKWXA1w58LuIRxAEN1TUZ3uDQtkGD0VmFKxo6/Vk+i8NR Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 30G5kPlXesu8YAIC8wwTlqpgVzjqFg2OdYLE34R8OiE4El2VUV9UTarfKjbPXlUpEujqiywbNB
 sKUYQC0TQEmCNoy3Fq2BqI60mtwjde7txms6AyrK2l6sFAXLyva4vbDiOhwhsSPipwa5WoVi+W
 QWdME3A40RyrFWKKycAEDvuMw9R9QMFwPhnnY1/yA3vynUVYK4xqv1bwJhFCmzJsqz+Hw/UKop
 C7WDUKutjI6AkJQoqMra8rCeBBi3Ku/pIdNn+OxDvZQhs5imA8d0scoTU/2vLzuiUEedtiS/Wb
 ENg=
X-SBRS: 2.7
X-MesageID: 5782655
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5782655"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 12:04:36 +0100
Message-ID: <20190919110443.817594-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919110443.817594-1-anthony.perard@citrix.com>
References: <20190919110443.817594-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/9] libxl: Pointer on usage of
 libxl__domain_userdata_lock
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgY3VycmVudGx5IGRpZmZpY3VsdCB0byBrbm93IGhvdy93aGVuL3doeSB0aGUgdXNlcmRh
dGEgbG9jayBpcwpzdXBwb3NlZCB0byBiZSB1c2VkLiBBZGQgc29tZSBwb2ludGVycyB0byB0aGUg
aG90cGx1ZyBjb21tZW50cy4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8IDYgKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKaW5kZXgg
YTNlNGI5MDdiN2M5Li4wM2UwODY0ODBjYTMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhs
X2ludGVybmFsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtNDQ3Nyw2
ICs0NDc3LDEyIEBAIHZvaWQgbGlieGxfX3VubG9ja19kb21haW5fdXNlcmRhdGEobGlieGxfX2Rv
bWFpbl91c2VyZGF0YV9sb2NrICpsb2NrKTsKICAqIGRhdGEgc3RvcmUuIFRoZSByZWdpc3RyeSBl
bnRyeSBpbiBsaWJ4bCBwcml2YXRlIGRhdGEgc3RvcmUKICAqIGlzICJsaWJ4bC1qc29uIi4KICAq
IENhbGxlciBtdXN0IGhvbGQgdXNlciBkYXRhIGxvY2suCisgKgorICogT3RoZXIgbmFtZXMgdXNl
ZCBmb3IgdGhpcyBsb2NrIHRocm91Z2hvdXQgdGhlIGxpYnhsIGNvZGUgYXJlIGpzb25fbG9jaywK
KyAqIGxpYnhsX19kb21haW5fdXNlcmRhdGFfbG9jaywgImxpYnhsLWpzb24iLCBkYXRhIHN0b3Jl
IGxvY2suCisgKgorICogU2VlIHRoZSBjb21tZW50IGZvciBsaWJ4bF9fYW9fZGV2aWNlLCBhbmQg
IkFsZ29yaXRobSBmb3IgaGFuZGxpbmcgZGV2aWNlCisgKiByZW1vdmFsIiwgZm9yIGluZm9ybWF0
aW9uIGFib3V0IHVzaW5nIHRoZSBsaWJ4bC1qc29uIGxvY2sgLyBqc29uX2xvY2suCiAgKi8KIGlu
dCBsaWJ4bF9fZ2V0X2RvbWFpbl9jb25maWd1cmF0aW9uKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90
IGRvbWlkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWlu
X2NvbmZpZyAqZF9jb25maWcpOwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
