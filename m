Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C6510D7A8
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:09:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahpI-0006j5-Cv; Fri, 29 Nov 2019 15:04:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iahpG-0006iE-NL
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:04:54 +0000
X-Inumbo-ID: 86e79c24-12b9-11ea-b155-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86e79c24-12b9-11ea-b155-bc764e2007e4;
 Fri, 29 Nov 2019 15:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575039862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=g2Ek05UJX0PRdsaS1UqRhrGKXDsKswewjikWHEZefn4=;
 b=D72sMx3a5oSmE6incZGVDYC4stxUIuDxKINXhJqKEel+hplnB6xa7Gke
 He1AmyXj5zxGVAmCb4pJ6/cDqrpzZ+c2USjV0CbsqMAHWDyTmCUvJV8yH
 fIR6LVF35IYQD2U5DfuNKCkrvgn5uFwrqcTZ7nR7laLCLdroE41Z4Pf2N E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7zcmjAK3yQv0Hx5l+Neoj7xuo5wWkbZm+OgnOiCZ/V3JX56dMQvVd281QBLeu4h7nJtef9jnac
 WRCEjy2hIWfTm/tlrlezh8PAjLzVDcC9EbV/udSpyGl2pjhpwX+wvPumZgfWYaDL2aAp/RqfUk
 idPtSIScO/P1sIEcJ5RO2LeykFyEGJhkyqCA78NXe4EpqpOGnrKDwEnCUhR7InfpVZ0unkcqQW
 8rINco2A0B5OkPkEfyvewFmm+widF1LOeupX4LiN/MFrAfdb4fEuUYlwoz/g4kHQ8rDGlKmsFu
 oiM=
X-SBRS: 2.7
X-MesageID: 9539135
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9539135"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 15:04:13 +0000
Message-ID: <20191129150416.4944-7-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
References: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 6/9] docs/process: Fix minor error in formatting
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHZlcnNpb24gbnVtYmVyIGlzIG5vdCBpbiB0aGUgImhlYWRpbmciLgoKU2lnbmVkLW9mZi1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogZG9jcy9wcm9j
ZXNzL3JlbGVhc2UtdGVjaG5pY2lhbi1jaGVja2xpc3QudHh0IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9wcm9j
ZXNzL3JlbGVhc2UtdGVjaG5pY2lhbi1jaGVja2xpc3QudHh0IGIvZG9jcy9wcm9jZXNzL3JlbGVh
c2UtdGVjaG5pY2lhbi1jaGVja2xpc3QudHh0CmluZGV4IGY0YmVlNGVlMTMuLjcyYTRjMzZjZDYg
MTAwNjQ0Ci0tLSBhL2RvY3MvcHJvY2Vzcy9yZWxlYXNlLXRlY2huaWNpYW4tY2hlY2tsaXN0LnR4
dAorKysgYi9kb2NzL3Byb2Nlc3MvcmVsZWFzZS10ZWNobmljaWFuLWNoZWNrbGlzdC50eHQKQEAg
LTU1LDcgKzU1LDcgQEAgdD1SRUxFQVNFLSRyCiAjICAgTUlOSU9TX1VQU1RSRUFNX1JFVklTSU9O
CiAqIGNoYW5nZSBTVVBQT1JULm1kIGhlYWRpbmcgdmVyc2lvbiBudW1iZXI7IC11bnN0YWJsZSBv
ciAtcmMgdGFnCiAqICAgICAoZW1wdHkgaW4gc3RhYmxlIGJyYW5jaGVzIGFmdGVyIC4wIHJlbGVh
c2UpLgotKiAgICAgaW5zZXJ0IGNvcnJlY3QgdmVyc2lvbiBudW1iZXIgaW4gcmVsZWFzZS1ub3Rl
cyBsaW5rCisqIFNVUFBPUlQubWQ6IGluc2VydCBjb3JyZWN0IHZlcnNpb24gbnVtYmVyIGluIHJl
bGVhc2Utbm90ZXMgbGluawogKiBjaGFuZ2UgeGVuLXVuc3RhYmxlIHhlbi9NYWtlZmlsZSBYRU5f
RVhUUkFWRVJTSU9OCiAjIGlmIG1haW4gdmVyc2lvbiBudW1iZXIgaGFzIGNoYW5nZWQgKGVnIDQu
NyAtPiA0LjgpIHJlcnVuIC4vYXV0b2dlbi5zaAogKiByZXJ1biAuL2F1dG9nZW4uc2ggdG8gdXBk
YXRlIHZlcnNpb24gbnVtYmVyIGluIGNvbmZpZ3VyZQotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
