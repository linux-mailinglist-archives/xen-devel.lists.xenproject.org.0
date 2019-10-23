Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE5E1D85
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:00:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNH8V-0004VX-7o; Wed, 23 Oct 2019 13:57:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JVcx=YQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iNH8T-0004VQ-FO
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:57:13 +0000
X-Inumbo-ID: 00120ac4-f59d-11e9-947f-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00120ac4-f59d-11e9-947f-12813bfff9fa;
 Wed, 23 Oct 2019 13:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571839028;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S1ApxgzkXxboqRC1e3Rq41CYUE483OLEKpImJSR0BUY=;
 b=fewAscPE1C2i/244eV18V48rr53naaq36eI8/XqPEysHo+dEbLXv+B4O
 AYql4jMB9qZxfA9eJF1k91dZ5gCFPEKAleA4KacgzSZxKGdCGa6nMD9V8
 Ok08Y++NCdlNBI30LM/Ra6azsjn35AsCm7MnNe8/GG4GRmqsFp0at6EPz 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: b97/1i6nCszHKDuqqDlkTqssclkget8OF01ULZeKAbgaX9wmBfKHohTII7Ei7gX/AruOJ2qhVK
 W0zwIMm01wU0MSDSBXsMep3g5muVmHxcp7pRk4dgmXflkpJu94w3jnVvQB9694grrsOHj70fcg
 JjuR4lvejSgoG21kY27V14Yroe2qdW/vzM7QfLBLTsuR5B2DevltWJFOpcMRu1sE8/KF4udhUU
 2lhCw//L+1thap38/OhwamzPD1H3dmUC/ZW59drxZTjdH5SCjzree/ft2h6Ftja18zdO9NAUOM
 NKw=
X-SBRS: 2.7
X-MesageID: 7415753
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7415753"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 15:56:44 +0200
Message-ID: <20191023135644.46847-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/tsc: limit the usage of synchronization
 rendezvous
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

SWYgWGVuIGRldGVjdHMgdGhlIFRTQyBpcyB1bnJlbGlhYmxlIGl0IHdpbGwgc2V0IGEgcmVuZGV6
dm91cyBoZWxwZXIKdGhhdCB0cmllcyB0byBzeW5jaHJvbml6ZSB0aGUgZGlmZmVyZW50IENQVXMg
VFNDIHZhbHVlIGJ5IHByb3BhZ2F0aW5nCnRoZSBvbmUgZnJvbSBDUFUjMCBhbmQgd3JpdGluZyBp
dCBpbnRvIHRoZSBJQTMyX1RTQyBNU1Igb24gZWFjaCBDUFUuCgpXaGVuIHRoZSBzeXN0ZW0gaGFz
IGEgc2luZ2xlIHRocmVhZCBhbmQgdGhlcmUgYXJlIG5vIGhvdHBsdWdhYmxlIENQVXMKZG9pbmcg
dGhlIGFib3ZlIGp1c3QgcmVzdWx0cyBpbiByZWFkaW5nIHRoZSBUU0MgZnJvbSBDUFUjMCBhbmQg
d3JpdGluZwppdCBpbnRvIHRoZSBJQTMyX1RTQyBNU1Igb2YgQ1BVIzAsIHdoaWNoIGlzIHBvaW50
bGVzcywgc28gbGltaXQgdGhlCnVzYWdlIG9mIHRoZSBzeW5jaHJvbml6YXRpb24gcmVuZGV6dm91
cyB0byBzeXN0ZW1zIHRoYXQgaGF2ZSBtb3JlIHRoYW4Kb25lIENQVSwgZXZlbiBpZiB0aG9zZSBD
UFVzIGFyZSB5ZXQgdG8gYmUgaG90cGx1Z2dlZC4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhp
cyBpcyBzdWl0YWJsZSBmb3IgNC4xMywgYmVpbmcgYSBwZXJmb3JtYW5jZQppbXByb3ZlbWVudCBi
dXQgbm90IGZpeGluZyBhIGZ1bmN0aW9uYWwgYnVnLgotLS0KIHhlbi9hcmNoL3g4Ni90aW1lLmMg
fCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90aW1lLmMgYi94ZW4vYXJjaC94ODYvdGltZS5jCmlu
ZGV4IGQ4MjQyMjk1ZWYuLmRkZGJiNjBmNTggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni90aW1l
LmMKKysrIGIveGVuL2FyY2gveDg2L3RpbWUuYwpAQCAtMTgyMSw3ICsxODIxLDggQEAgc3RhdGlj
IGludCBfX2luaXQgdmVyaWZ5X3RzY19yZWxpYWJpbGl0eSh2b2lkKQogICAgICAqIGFyZSBub3Qg
bWFya2VkIGFzICdyZWxpYWJsZScsIHJlLXN5bmMgZHVyaW5nIHJlbmRlenZvdXMuCiAgICAgICov
CiAgICAgaWYgKCBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfQ09OU1RBTlRfVFNDKSAmJgotICAg
ICAgICAgIWJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9UU0NfUkVMSUFCTEUpICkKKyAgICAgICAg
ICFib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfVFNDX1JFTElBQkxFKSAmJgorICAgICAgICAgbnVt
X3ByZXNlbnRfY3B1cygpID4gMSApCiAgICAgICAgIHRpbWVfY2FsaWJyYXRpb25fcmVuZGV6dm91
c19mbiA9IHRpbWVfY2FsaWJyYXRpb25fdHNjX3JlbmRlenZvdXM7CiAKICAgICByZXR1cm4gMDsK
LS0gCjIuMjMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
