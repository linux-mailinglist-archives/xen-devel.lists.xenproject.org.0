Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BA218D824
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 20:11:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFN07-0000RE-24; Fri, 20 Mar 2020 19:08:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sjin=5F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jFN06-0000R9-Bk
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 19:08:10 +0000
X-Inumbo-ID: 21d5fbc8-6ade-11ea-b34e-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21d5fbc8-6ade-11ea-b34e-bc764e2007e4;
 Fri, 20 Mar 2020 19:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584731287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RP4rtLs2r1/hACbV5f2YEojJxFbS+HMyZVX7ZMoouVY=;
 b=azWBVHLPEPZSIWo9F6NB2VUfA6zqCsW3pUp2gNugnz+gqwgSmfzTxWKu
 SkovFKqZBjfhJ8P43CfISxWKzKVT/YACMmwu/PrroUSsVwPaCcBzUhjRG
 22i+bh/TD8XbKJS+sNr55vdk87Id11AKtVGXHdg34yQVM9APsT0pPW9aa 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +ULpfRt5UzRGY7BCnBhYzcP7mz0QVonIK5iboMJlTM55wD1+9ISvDoP5f1Kb+6E8dp2sdZRDg1
 rCHkUkAZMPZwKyMNNc2LEIaBA4s8V42H65dW8HD4lqoYg/PrGs3krYEWHCDpIeHFczS+7QLvrW
 U17pWV/aLLqi5KKcalWwNfJQuvkknvLY7IMJauGB41wy08tHdVhmmQnRm32OBEr9CntUqk4o3O
 9N5j0GAqKbzAm9IX4v6SVom9T7Q13bpgh9bPfaW4hzdzzTNAaQ5jiMSg0JlU5gvuCEqSB4+WzX
 PPU=
X-SBRS: 2.7
X-MesageID: 14374453
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,285,1580792400"; d="scan'208";a="14374453"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 20 Mar 2020 20:07:35 +0100
Message-ID: <20200320190737.42110-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200320190737.42110-1-roger.pau@citrix.com>
References: <20200320190737.42110-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] Revert "x86/vvmx: fix virtual interrupt
 injection when Ack on exit control is used"
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyByZXZlcnRzIGNvbW1pdCBmOTZlMTQ2OWFkMDZiNjE3OTZjNjAxOTNkYWFlYjlmOGE5NmQ3
NDU4LgoKVGhlIGNvbW1pdCBpcyB3cm9uZywgYXMgdGhlIHdob2xlIHBvaW50IG9mIG52bXhfdXBk
YXRlX2FwaWN2IGlzIHRvCnVwZGF0ZSB0aGUgZ3Vlc3QgaW50ZXJydXB0IHN0YXR1cyBmaWVsZCB3
aGVuIHRoZSBBY2sgb24gZXhpdCBWTUVYSVQKY29udHJvbCBmZWF0dXJlIGlzIGVuYWJsZWQuCgpT
aWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0t
CiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgfCA3ICstLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvaHZtL3ZteC92dm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMKaW5kZXggZjA0
OTkyMDE5Ni4uMWI4NDYxYmEzMCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZt
eC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwpAQCAtMTQ1NiwxMiArMTQ1Niw3
IEBAIHN0YXRpYyB2b2lkIHZpcnR1YWxfdm1leGl0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdz
KQogICAgIC8qIHVwZGF0aW5nIGhvc3QgY3IwIHRvIHN5bmMgVFMgYml0ICovCiAgICAgX192bXdy
aXRlKEhPU1RfQ1IwLCB2LT5hcmNoLmh2bS52bXguaG9zdF9jcjApOwogCi0gICAgaWYgKCBjcHVf
aGFzX3ZteF92aXJ0dWFsX2ludHJfZGVsaXZlcnkgJiYKLSAgICAgICAgIC8qCi0gICAgICAgICAg
KiBPbmx5IGluamVjdCB0aGUgdmVjdG9yIGlmIHRoZSBBY2sgb24gZXhpdCBiaXQgaXMgbm90IHNl
dCwgZWxzZSB0aGUKLSAgICAgICAgICAqIGludGVycnVwdCB3aWxsIGJlIHNpZ25hbGVkIGluIHRo
ZSB2bWNzIFZNX0VYSVRfSU5UUl9JTkZPIGZpZWxkLgotICAgICAgICAgICovCi0gICAgICAgICAh
KGdldF92dm1jcyh2LCBWTV9FWElUX0NPTlRST0xTKSAmIFZNX0VYSVRfQUNLX0lOVFJfT05fRVhJ
VCkgKQorICAgIGlmICggY3B1X2hhc192bXhfdmlydHVhbF9pbnRyX2RlbGl2ZXJ5ICkKICAgICAg
ICAgbnZteF91cGRhdGVfYXBpY3Yodik7CiAKICAgICBudmNwdS0+bnZfdm1zd2l0Y2hfaW5fcHJv
Z3Jlc3MgPSAwOwotLSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
