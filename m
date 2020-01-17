Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A6141094
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 19:16:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isW6c-0007rL-Jr; Fri, 17 Jan 2020 18:12:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isW6b-0007rG-5l
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 18:12:25 +0000
X-Inumbo-ID: e43ea356-3954-11ea-b833-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e43ea356-3954-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 18:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579284736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=eZXcvQp3NOKDappdXnY4eEG+fzoqk8OoUGk+rH4s+Ic=;
 b=Qp3PhvAVcGid1zw5aEqZbefDY8Ex6m6gTlu65VsHq6i3fULvd82UfyUE
 3LYooHKrjiFAJdALnYA22EceewNX0BqcqJu8lKJ72AhgSVXqTFd9y+P3a
 jDHlo3Ky0eGKQamNiXuoCZTia0JJhS8k874ZFHmtlLeiMaPLA/2aievZF g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +V2jTyjwkf54BuXH5q6RMbdsA63lqkiPf/LwK2AghyOEZXJ4mg41X9tn4wPUIW3NPtKYwctFhn
 ldOqQvfQDtfcK9GQXebjUmXulE7iaMjXcK6Ff4DV9JHl37jwG8bj5nb2ojUpYSI/yD05Ox8oOW
 gWXZ91AhT49wt9pdDxVDeuQ55t6x05zRCnk9pddmCS9OcuXfoQWLq4exxonPLKvCkj5VU5pf/2
 mUqB7n0rplbQRs1NDNIUYerNDkKnjONuuf4MOfhl05oVwU9dw8ecJe1AB1ndqFZ6hLbwd+gTvj
 Rog=
X-SBRS: 2.7
X-MesageID: 11101342
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,331,1574139600"; d="scan'208";a="11101342"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 18:12:07 +0000
Message-ID: <20200117181207.7087-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <61695d47-d419-a2cc-6503-9202e85da6a0@citrix.com>
References: <61695d47-d419-a2cc-6503-9202e85da6a0@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libxl: event: Document lifetime API for
 libxl_childproc_setmode
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgaXMgYWxyZWFkeSBhbiBpZGVudGljYWwgY29tbWVudCBmb3IKbGlieGxfb3NldmVudF9y
ZWdpc3Rlcl9ob29rcy4KCmxpYnhsX2NoaWxkcHJvY19zZXRtb2RlJ3MgaG9va3MgcGFyYW1ldGVy
IGhhcyB0aGUgc2FtZSBwcm9wZXJ0eSBhbmQKdGhpcyBzaG91bGQgYmUgZG9jdW1lbnRlZC4KClJl
cG9ydGVkLWJ5OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+ClNpZ25l
ZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRv
b2xzL2xpYnhsL2xpYnhsX2V2ZW50LmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuaCBiL3Rvb2xzL2xp
YnhsL2xpYnhsX2V2ZW50LmgKaW5kZXggZDE1MTdmNzQ1Ni4uOGQwYWE2NDE3ZSAxMDA2NDQKLS0t
IGEvdG9vbHMvbGlieGwvbGlieGxfZXZlbnQuaAorKysgYi90b29scy9saWJ4bC9saWJ4bF9ldmVu
dC5oCkBAIC01NDgsNiArNTQ4LDggQEAgdHlwZWRlZiBzdHJ1Y3QgewogICogTWF5IG5vdCBiZSBj
YWxsZWQgd2hlbiBsaWJ4bCBtaWdodCBoYXZlIGFueSBjaGlsZCBwcm9jZXNzZXMsIG9yIHRoZQog
ICogYmVoYXZpb3VyIGlzIHVuZGVmaW5lZC4gIFNvIGl0IGlzIGJlc3QgdG8gY2FsbCB0aGlzIGF0
CiAgKiBpbml0aWFsaXNhdGlvbi4KKyAqCisgKiBUaGUgdmFsdWUgKmhvb2tzIGlzIG5vdCBjb3Bp
ZWQgYW5kIG11c3Qgb3V0bGFzdCB0aGUgbGlieGxfY3R4LgogICovCiB2b2lkIGxpYnhsX2NoaWxk
cHJvY19zZXRtb2RlKGxpYnhsX2N0eCAqY3R4LCBjb25zdCBsaWJ4bF9jaGlsZHByb2NfaG9va3Mg
Kmhvb2tzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICp1c2VyKTsKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
