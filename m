Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54591DC82B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 17:11:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLTqM-00051Z-84; Fri, 18 Oct 2019 15:07:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/MKZ=YL=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iLTqK-00050l-HW
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 15:07:04 +0000
X-Inumbo-ID: eecd94a0-f1b8-11e9-beca-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eecd94a0-f1b8-11e9-beca-bc764e2007e4;
 Fri, 18 Oct 2019 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571411219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Z2wcBcBGG/Y/drK4rHShO5xZz9+eTKQjLFNrm0BeVIw=;
 b=GqzF+j4tT+noK+0BRPBzBEG+vOwkkeoPQOXQZ4TuDNXiVh1i/iQnfpDA
 +HrKixruA8QsOkJ/avvG9LBK4CKgyLJy7oZ2UfruhTxUK3/yhasUK9W65
 8DMkg1UCRQRCX5BZUI9+BAC9UQyoYBkM37gYX+AgD6SKEV3XM/isTyf4R I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: J8TqHjyMUNtm+W4qjbDb02FwwbYHCC1fOxKwDhWXpGQjUYJcBdh5yC09Wr+YoRhFHRnK5Ltyfx
 OyRC93FLt3ZRbA75li3C/aRgE0eimihGQ7pUrW5U0kn+BNN8YqjPCj7i66zbOhx1D8YrTE4oY7
 jtBF0hhduL/K37I7Y4+aPgOBQ7SaU4exXtXkiYmymLfkmna94zHUntUVm3sIiOzYHAPI4a3qd+
 c0BG73BjhHG56/p0m+kQkGPNz9er8UiihBa/Mr+1vFR/PFL5LMllsiZDCKUyjRjNk/kzpuvBxI
 wt4=
X-SBRS: 2.7
X-MesageID: 7434353
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,312,1566878400"; 
   d="scan'208";a="7434353"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 18 Oct 2019 16:06:44 +0100
Message-ID: <20191018150653.24862-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191018150653.24862-1-ian.jackson@eu.citrix.com>
References: <20191018150653.24862-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v5 01/10] libxl: Offer API versions
 0x040700 and 0x040800
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
Cc: Paul Durrant <pdurrant@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWNjb3JkaW5nIHRvIGdpdCBsb2cgLUc6CgoweDA0MDcwMCB3YXMgaW50cm9kdWNlZCBpbiAzMDQ0
MDA0NTllZjAgKGFrYSA0LjcuMC1yYzF+NDgxKQogICJ0b29scy9saWJ4bDogcmVuYW1lIHJlbXVz
IGRldmljZSB0byBjaGVja3BvaW50IGRldmljZSIKCjB4MDQwODAwIHdhcyBpbnRyb2R1Y2VkIGlu
IDU3ZjhiMTNjNzI0MCAoYWthIDQuOC4wLXJjMX40MzcpCiAgImxpYnhsOiBtZW1vcnkgc2l6ZSBp
biBrYiByZXF1aXJlcyA2NCBiaXQgdmFyaWFibGUiCgpJdCBpcyBzdXJwcmlzaW5nIHRoYXQgbm8t
b25lIG5vdGljZWQgdGhpcy4KCkFueXdheSwgaW4gdGhlIG1lYW50aW1lLCB3ZSBzaG91bGQgZml4
IGl0LiAgQmFja3BvcnRpbmcgdGhpcyBpcwpwcm9iYWJseSBhIGdvb2QgaWRlYTogaXQgd29uJ3Qg
Y2hhbmdlIHRoZSBiZWhhdmlvdXIgZm9yIGV4aXN0aW5nCmNhbGxlcnMgYnV0IGl0IHdpbGwgYXZv
aWQgZXJyb3JzIGZvciBzb21lIG9sZGVyIGNvcnJlY3QgdXNlcy4KClNpZ25lZC1vZmYtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpBY2tlZC1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQp2MjogQWRqdXN0ZWQgY29tbWl0
IG1lc3NhZ2Ugc2xpZ2h0bHkuCi0tLQogdG9vbHMvbGlieGwvbGlieGwuaCB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGwu
aCBiL3Rvb2xzL2xpYnhsL2xpYnhsLmgKaW5kZXggMjU1NWU5Y2QzYi4uNTE4ZmM5ZTQ3ZiAxMDA2
NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bC5oCkBA
IC02NTUsNiArNjU1LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgbGlieGxfX2N0eCBsaWJ4bF9jdHg7CiAj
aWZkZWYgTElCWExfQVBJX1ZFUlNJT04KICNpZiBMSUJYTF9BUElfVkVSU0lPTiAhPSAweDA0MDIw
MCAmJiBMSUJYTF9BUElfVkVSU0lPTiAhPSAweDA0MDMwMCAmJiBcCiAgICAgTElCWExfQVBJX1ZF
UlNJT04gIT0gMHgwNDA0MDAgJiYgTElCWExfQVBJX1ZFUlNJT04gIT0gMHgwNDA1MDAgJiYgXAor
ICAgIExJQlhMX0FQSV9WRVJTSU9OICE9IDB4MDQwNzAwICYmIExJQlhMX0FQSV9WRVJTSU9OICE9
IDB4MDQwODAwICYmIFwKICAgICBMSUJYTF9BUElfVkVSU0lPTiAhPSAweDA0MTMwMAogI2Vycm9y
IFVua25vd24gTElCWExfQVBJX1ZFUlNJT04KICNlbmRpZgotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
