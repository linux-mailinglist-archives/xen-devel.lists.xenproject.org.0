Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C89FDC2228
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 15:36:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEvno-0005TK-GQ; Mon, 30 Sep 2019 13:33:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=znM2=XZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iEvnn-0005Sm-6S
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 13:33:23 +0000
X-Inumbo-ID: dc4de996-e386-11e9-bf31-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id dc4de996-e386-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 13:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569850398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WsItbxEhyKTnYT2FimqgJ88ubvRHvuqWG6eh9vYSauE=;
 b=abWGhFx4x/XI/Cv9w9y90dIatqd0MJGX6pIGLNtxYlWMl0oE9aD+g+Dq
 q/Q5htysIqvMlnumPwnFMY/R457uG2AfAqe6BTeEOnebkTO7lvahDmqWp
 ANDNa2lu3GPsZkd/ihmUGgAG/2QDk/stKA/4Jykj18J3jbp+CTUWWHCa3 U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: twMhnv1xz+gKmW6dwVRS9J9yKCCLVl9mhetTHTlbwiuPdI8XNpSsZ3WV56m999hvBtRj+/YwUE
 lLnfl+8IjOW0K4lQktPP1Od9IcjKrl+wanXRpeB/4TXHNxdgdv/RUzY/N0oFtTRupHuc7606X+
 Fc/S/MFhb9r61GUQeHL8Op4CW2VZvNY1y8AlpyThY9pq7m/L+SGfLZbMwqy8S/DRmiwxemxtir
 4qV7O0ofRtGPkw0wgF/UVOVsBDxk3qmRk6chMY+FtL5hUjOqHt595pAaq/zq6+oHcL/x9twnfE
 aU0=
X-SBRS: 2.7
X-MesageID: 6256433
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6256433"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 15:32:33 +0200
Message-ID: <20190930133238.49868-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930133238.49868-1-roger.pau@citrix.com>
References: <20190930133238.49868-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 05/10] ioreq: allow dispatching ioreqs to
 internal servers
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW50ZXJuYWwgaW9yZXEgc2VydmVycyB3aWxsIGJlIHByb2Nlc3NlZCBmaXJzdCBkdWUgdG8gdGhl
IGltcGxlbWVudGF0aW9uCm9mIEZPUl9FQUNIX0lPUkVRX1NFUlZFUiwgYW5kIGlvcmVxcyBhcmUg
ZGlzcGF0Y2hlZCBzaW1wbHkgYnkgY2FsbGluZwp0aGUgaGFuZGxlciBmdW5jdGlvbi4KClNpZ25l
ZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpSZXZpZXdl
ZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMg
c2luY2UgdjI6CiAtIEhhdmUgYSBzaW5nbGUgY29uZGl0aW9uIGZvciBidWZmZXJlZCBpb3JlcXMu
CgpDaGFuZ2VzIHNpbmNlIHYxOgogLSBBdm9pZCBoYXZpbmcgdG8gaXRlcmF0ZSB0d2ljZSBvdmVy
IHRoZSBsaXN0IG9mIGlvcmVxIHNlcnZlcnMgc2luY2UKICAgbm93IGludGVybmFsIHNlcnZlcnMg
YXJlIGFsd2F5cyBwcm9jZXNzZWQgZmlyc3QgYnkKICAgRk9SX0VBQ0hfSU9SRVFfU0VSVkVSLgog
LSBPYnRhaW4gaW9yZXEgc2VydmVyIGlkIHVzaW5nIHBvaW50ZXIgYXJpdGhtZXRpYy4KLS0tCiB4
ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgfCAxMSArKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvaHZtL2lvcmVxLmMgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKaW5kZXggY2RiZDQyNDRh
NC4uMDY0OWI3ZTAyZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwpAQCAtMTQ4Miw3ICsxNDgyLDE2IEBAIGludCBodm1f
c2VuZF9pb3JlcShpb3NlcnZpZF90IGlkLCBpb3JlcV90ICpwcm90b19wLCBib29sIGJ1ZmZlcmVk
KQogICAgIEFTU0VSVChzKTsKIAogICAgIGlmICggYnVmZmVyZWQgKQotICAgICAgICByZXR1cm4g
aHZtX3NlbmRfYnVmZmVyZWRfaW9yZXEocywgcHJvdG9fcCk7CisgICAgeworICAgICAgICBpZiAo
IGxpa2VseSghaHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSkgKQorICAgICAgICAgICAgcmV0dXJu
IGh2bV9zZW5kX2J1ZmZlcmVkX2lvcmVxKHMsIHByb3RvX3ApOworCisgICAgICAgIEFTU0VSVF9V
TlJFQUNIQUJMRSgpOworICAgICAgICByZXR1cm4gWDg2RU1VTF9VTkhBTkRMRUFCTEU7CisgICAg
fQorCisgICAgaWYgKCBodm1faW9yZXFfaXNfaW50ZXJuYWwoaWQpICkKKyAgICAgICAgcmV0dXJu
IHMtPmhhbmRsZXIocHJvdG9fcCwgcy0+ZGF0YSk7CiAKICAgICBpZiAoIHVubGlrZWx5KCF2Y3B1
X3N0YXJ0X3NodXRkb3duX2RlZmVycmFsKGN1cnIpKSApCiAgICAgICAgIHJldHVybiBYODZFTVVM
X1JFVFJZOwotLSAKMi4yMy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
