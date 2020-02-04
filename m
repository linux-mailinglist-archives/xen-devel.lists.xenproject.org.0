Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37312152217
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 22:51:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz64r-0000wP-9V; Tue, 04 Feb 2020 21:49:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I1tw=3Y=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iz64q-0000wJ-JN
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 21:49:48 +0000
X-Inumbo-ID: 40c2782c-4798-11ea-9026-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40c2782c-4798-11ea-9026-12813bfff9fa;
 Tue, 04 Feb 2020 21:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580852983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=RKbuWJWH3gHV/V5tipvNpTzFzBPm/XK6B4kBhfD1mKA=;
 b=MK6IjHxc7opVs4L+/r/0dqeEQ0/ftLZwwFb//yO51bB0YlZGFXIw16+p
 2/IYCmLosE/PWzOowvdnqzFEpo7MnYpboVM4zsRZSgn+AhNh69ZBN/T9e
 BeWKOavJCFm9E2j/+4Eoo4WD+JpTjTPvUGQx24znA+44QTLCp9Vg9wSvX Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: j72BCuRmGm1CRLUEsyW+WS2J3ZXMm6I3i36usrXZ5KsbhBarh4C4lVd3Frt5S3+rIejlgZLKeT
 H2t6v/1S4kCF2cy1XTVRVSiFRkSnC3YZ3nrNXgkXMApJKtImh0droCH4//F7KdC5QQw8Na3PVc
 ATS/LCZXQyMF8FtMxGWxgQe5OKbkKk9j6WPfUzOCnuLorsGER6mrzKdFWv4wCMQJ1sx940lWw4
 2jnrov02hzoYqgalfWQeXD4xP0oVeGPtEP+AopOannT5ttKIZREmc7eHA97EEUdc+I0UYE0HMl
 qi4=
X-SBRS: 2.7
X-MesageID: 12319355
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,403,1574139600"; d="scan'208";a="12319355"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 4 Feb 2020 21:49:37 +0000
Message-ID: <1580852977-23866-3-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580852977-23866-1-git-send-email-igor.druzhinin@citrix.com>
References: <1580852977-23866-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/2] x86/time: report correct frequency of
 Xen PV clocksource
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHZhbHVlIG9mIHRoZSBjb3VudGVyIHJlcHJlc2VudHMgdGhlIG51bWJlciBvZiBuYW5vc2Vj
b25kcwpzaW5jZSBob3N0IGJvb3QuIFRoYXQgbWVhbnMgdGhlIGNvcnJlY3QgZnJlcXVlbmN5IGlz
IGFsd2F5cyAxR0h6LgoKVGhpcyBpbmNvbnNpc3RlbmN5IGNhdXNlZCB0aW1lIHRvIGdvIHNsb3dl
ciBpbiBQViBzaGltIG9uIG1vc3QKcGxhdGZvcm1zLgoKU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6
aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3RpbWUu
YyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3RpbWUuYyBiL3hlbi9hcmNoL3g4Ni90aW1l
LmMKaW5kZXggN2U3YTYyZS4uMjZmOWJhZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3RpbWUu
YworKysgYi94ZW4vYXJjaC94ODYvdGltZS5jCkBAIC01ODcsOSArNTg3LDcgQEAgc3RhdGljIGlu
dDY0X3QgX19pbml0IGluaXRfeGVuX3RpbWVyKHN0cnVjdCBwbGF0Zm9ybV90aW1lc291cmNlICpw
dHMpCiAgICAgaWYgKCAheGVuX2d1ZXN0ICkKICAgICAgICAgcmV0dXJuIDA7CiAKLSAgICBwdHMt
PmZyZXF1ZW5jeSA9IHhlbl90aW1lcl9jcHVfZnJlcXVlbmN5KCk7Ci0KLSAgICByZXR1cm4gcHRz
LT5mcmVxdWVuY3k7CisgICAgcmV0dXJuIHhlbl90aW1lcl9jcHVfZnJlcXVlbmN5KCk7CiB9CiAK
IHN0YXRpYyBhbHdheXNfaW5saW5lIHVpbnQ2NF90IHJlYWRfY3ljbGUoY29uc3Qgc3RydWN0IHZj
cHVfdGltZV9pbmZvICppbmZvLApAQCAtNjQzLDYgKzY0MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxh
dGZvcm1fdGltZXNvdXJjZSBfX2luaXRkYXRhIHBsdF94ZW5fdGltZXIgPQogewogICAgIC5pZCA9
ICJ4ZW4iLAogICAgIC5uYW1lID0gIlhFTiBQViBDTE9DSyIsCisgICAgLmZyZXF1ZW5jeSA9IDEw
MDAwMDAwMDBVTEwsCiAgICAgLnJlYWRfY291bnRlciA9IHJlYWRfeGVuX3RpbWVyLAogICAgIC5p
bml0ID0gaW5pdF94ZW5fdGltZXIsCiAgICAgLnJlc3VtZSA9IHJlc3VtZV94ZW5fdGltZXIsCi0t
IAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
