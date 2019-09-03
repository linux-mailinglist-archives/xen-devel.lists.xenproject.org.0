Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA1A6DCD
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 18:17:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5BSb-0002DO-Ml; Tue, 03 Sep 2019 16:15:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4NVN=W6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5BSZ-00028g-3A
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 16:15:11 +0000
X-Inumbo-ID: fd20025e-ce65-11e9-ab97-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd20025e-ce65-11e9-ab97-12813bfff9fa;
 Tue, 03 Sep 2019 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567527305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ao+suJH61Ih8IUHp95adbmYVii38rummBKHRC8XJGO0=;
 b=AlbHsJS1htr9gvX0/BPNUExB7Uph6XdhXn+lMGgo22ZHc0kcXBUZr764
 +kqv+rC6pwOaLgc9gkbY4S0SdEa02n90zBn+oxDW2AFu/ykZ3hD+MW7Sr
 T3OYJ3tgqv/IPp+4qZo/Sxye3ea4cXLblkoaMrAzOosOMRW5TY3SWHr2c 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hdXdbMtuWKvhccIEuNzPOMeZJ3zWBMiUvnQfLy4Opf7U1GaGGNVyXdl2yZGmUB8tDtHpJe/3Oo
 C8u5R4KAgzhFv40+ONqoSpzkeeIkOd4elQX1uRdNP81xnok9QKTT5miOMM44DIr8LBYEyZyZm+
 uTdHGYLNyDfr2LffKeBo+AsneNkZvk09uu8S7TSFk39yoxIQ/sWId0tnGyzhAQ/kAGDrwvjbF6
 0bqSxRIe76ESQvLrLJVLPeCuBcqTdImtjiIpvmWg376iPzHK1jS3zPmeyuj2gEqhK37+feUKNU
 iHA=
X-SBRS: 2.7
X-MesageID: 5256741
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,463,1559534400"; 
   d="scan'208";a="5256741"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 3 Sep 2019 18:14:23 +0200
Message-ID: <20190903161428.7159-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190903161428.7159-1-roger.pau@citrix.com>
References: <20190903161428.7159-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 06/11] ioreq: allow dispatching ioreqs to
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW50ZXJuYWwgaW9yZXEgc2VydmVycyBhcmUgYWx3YXlzIHByb2Nlc3NlZCBmaXJzdCwgYW5kIGlv
cmVxcyBhcmUKZGlzcGF0Y2hlZCBieSBjYWxsaW5nIHRoZSBoYW5kbGVyIGZ1bmN0aW9uLiBOb3Rl
IHRoaXMgaXMgYWxyZWFkeSB0aGUKY2FzZSBkdWUgdG8gdGhlIGltcGxlbWVudGF0aW9uIG9mIEZP
Ul9FQUNIX0lPUkVRX1NFUlZFUi4KCk5vdGUgdGhhdCBodm1fc2VuZF9pb3JlcSBkb2Vzbid0IGdl
dCBwYXNzZWQgdGhlIGlvcmVxIHNlcnZlciBpZCwgc28Kb2J0YWluIGl0IGZyb20gdGhlIGlvcmVx
IHNlcnZlciBkYXRhIGJ5IGRvaW5nIHBvaW50ZXIgYXJpdGhtZXRpYy4KClNpZ25lZC1vZmYtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2hhbmdlcyBzaW5j
ZSB2MToKIC0gQXZvaWQgaGF2aW5nIHRvIGl0ZXJhdGUgdHdpY2Ugb3ZlciB0aGUgbGlzdCBvZiBp
b3JlcSBzZXJ2ZXJzIHNpbmNlCiAgIG5vdyBpbnRlcm5hbCBzZXJ2ZXJzIGFyZSBhbHdheXMgcHJv
Y2Vzc2VkIGZpcnN0IGJ5CiAgIEZPUl9FQUNIX0lPUkVRX1NFUlZFUi4KIC0gT2J0YWluIGlvcmVx
IHNlcnZlciBpZCB1c2luZyBwb2ludGVyIGFyaXRobWV0aWMuCi0tLQogeGVuL2FyY2gveDg2L2h2
bS9pb3JlcS5jIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgYi94ZW4vYXJjaC94ODYvaHZt
L2lvcmVxLmMKaW5kZXggZGJjNWU2YjRjNS4uODMzMWE4OWVhZSAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS9pb3JlcS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwpAQCAtMTQ5
Myw5ICsxNDkzLDE4IEBAIGludCBodm1fc2VuZF9pb3JlcShpb3NlcnZpZF90IGlkLCBpb3JlcV90
ICpwcm90b19wLCBib29sIGJ1ZmZlcmVkKQogCiAgICAgQVNTRVJUKHMpOwogCisgICAgaWYgKCBo
dm1faW9yZXFfaXNfaW50ZXJuYWwoaWQpICYmIGJ1ZmZlcmVkICkKKyAgICB7CisgICAgICAgIEFT
U0VSVF9VTlJFQUNIQUJMRSgpOworICAgICAgICByZXR1cm4gWDg2RU1VTF9VTkhBTkRMRUFCTEU7
CisgICAgfQorCiAgICAgaWYgKCBidWZmZXJlZCApCiAgICAgICAgIHJldHVybiBodm1fc2VuZF9i
dWZmZXJlZF9pb3JlcShzLCBwcm90b19wKTsKIAorICAgIGlmICggaHZtX2lvcmVxX2lzX2ludGVy
bmFsKGlkKSApCisgICAgICAgIHJldHVybiBzLT5oYW5kbGVyKGN1cnIsIHByb3RvX3AsIHMtPmRh
dGEpOworCiAgICAgaWYgKCB1bmxpa2VseSghdmNwdV9zdGFydF9zaHV0ZG93bl9kZWZlcnJhbChj
dXJyKSkgKQogICAgICAgICByZXR1cm4gWDg2RU1VTF9SRVRSWTsKIAotLSAKMi4yMi4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
