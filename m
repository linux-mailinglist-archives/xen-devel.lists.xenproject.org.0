Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B37EEC997
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 21:27:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQdTu-0000gH-Uh; Fri, 01 Nov 2019 20:25:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6PC9=YZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iQdTt-0000gA-NW
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 20:25:13 +0000
X-Inumbo-ID: b424c0ac-fce5-11e9-956e-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b424c0ac-fce5-11e9-956e-12813bfff9fa;
 Fri, 01 Nov 2019 20:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572639911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AlYlL02Kja3Wp8n/4D9dpraYLl4mdJO8LX4gJrf2ZUQ=;
 b=dAAVwbatppGc8jIfgzJAUKO7obryxob4NszPvzot2XYrfleS6Y3Oda33
 t312ULxZN3qBkfnSiTK9JOyWrPr6gorp41skpVju40exobn6nA5/dcXLc
 3eaEgXqjGw4VBY1iIHf7PsFh0Lzoj+atnMYhMSVZeDuodnVksFWCJaHG0 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5g1j2hO8GgEQ+bAU/bT399V387yEVXrfTQOvDrgI0jPyx0wq/5OxIz1GlVsEIi3u0Elsw8FL3R
 jJB+R13oDMz/4UW95Rm8z9gHeXJgA1fvrOLWcI3CsQzW8Ng9rNz7057NOxEf+Pe+7W5GdPZpDg
 jKXGYYFnj5ScGVRKIytZo7Nyk8EGM+HhN12ebbpI0FPlIRYe0KhuF2m8CspcSjPtGs+xLexgaM
 JrfJB2ODMomUgb38e6jF9PdSBqcxgW9x+iBUWmb1MRQTaNvFj+Klw/J013e0ykqURzDToYlTfY
 F2Q=
X-SBRS: 2.7
X-MesageID: 8233369
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,256,1569297600"; 
   d="scan'208";a="8233369"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 1 Nov 2019 20:25:02 +0000
Message-ID: <20191101202502.31750-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191101202502.31750-1-andrew.cooper3@citrix.com>
References: <20191101202502.31750-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/3] x86/e820: fix 640k - 1M region reservation
 logic
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgoKQ29udmVydGlu
ZyBhIGd1ZXN0IGZyb20gUFYgdG8gUFYtaW4tUFZIIG1ha2VzIHRoZSBndWVzdCB0byBoYXZlIDM4
NGsKbGVzcyBtZW1vcnksIHdoaWNoIG1heSBjb25mdXNlIGd1ZXN0J3MgYmFsbG9vbiBkcml2ZXIu
IFRoaXMgaGFwcGVucwpiZWNhdXNlIFhlbiB1bmNvbmRpdGlvbmFsbHkgcmVzZXJ2ZXMgNjQwayAt
IDFNIHJlZ2lvbiBpbiBFODIwIGRlc3BpdGUKdGhlIGZhY3QgdGhhdCBpdCdzIHJlYWxseSBhIHVz
YWJsZSBSQU0gaW4gUFZIIGJvb3QgbW9kZS4KCkZpeCB0aGlzIGJ5IHNraXBwaW5nIHJlZ2lvbiB0
eXBlIGNoYW5nZSBpbiB2aXJ0dWFsaXNlZCBlbnZpcm9ubWVudHMsCnRydXN0aW5nIHdoYXRldmVy
IG1lbW9yeSBtYXAgb3VyIGh5cGVydmlzb3IgaGFzIHByb3ZpZGVkLgoKU2lnbmVkLW9mZi1ieTog
U2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IFNlcmdleSBEeWFzbGkgPHNl
cmdleS5keWFzbGlAY2l0cml4LmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KLS0tCiB4ZW4vYXJjaC94ODYvZTgyMC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9l
ODIwLmMgYi94ZW4vYXJjaC94ODYvZTgyMC5jCmluZGV4IDhlOGEyYzRlMWIuLjA4MmY5OTI4YTEg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9lODIwLmMKKysrIGIveGVuL2FyY2gveDg2L2U4MjAu
YwpAQCAtMzE4LDkgKzMxOCw5IEBAIHN0YXRpYyBpbnQgX19pbml0IGNvcHlfZTgyMF9tYXAoc3Ry
dWN0IGU4MjBlbnRyeSAqIGJpb3NtYXAsIHVuc2lnbmVkIGludCBucl9tYXApCiAKICAgICAgICAg
LyoKICAgICAgICAgICogU29tZSBCSU9TZXMgY2xhaW0gUkFNIGluIHRoZSA2NDBrIC0gMU0gcmVn
aW9uLgotICAgICAgICAgKiBOb3QgcmlnaHQuIEZpeCBpdCB1cC4KKyAgICAgICAgICogTm90IHJp
Z2h0LiBGaXggaXQgdXAsIGJ1dCBvbmx5IHdoZW4gcnVubmluZyBvbiBiYXJlIG1ldGFsLgogICAg
ICAgICAgKi8KLSAgICAgICAgaWYgKHR5cGUgPT0gRTgyMF9SQU0pIHsKKyAgICAgICAgaWYgKCFj
cHVfaGFzX2h5cGVydmlzb3IgJiYgdHlwZSA9PSBFODIwX1JBTSkgewogICAgICAgICAgICAgaWYg
KHN0YXJ0IDwgMHgxMDAwMDBVTEwgJiYgZW5kID4gMHhBMDAwMFVMTCkgewogICAgICAgICAgICAg
ICAgIGlmIChzdGFydCA8IDB4QTAwMDBVTEwpCiAgICAgICAgICAgICAgICAgICAgIGFkZF9tZW1v
cnlfcmVnaW9uKHN0YXJ0LCAweEEwMDAwVUxMLXN0YXJ0LCB0eXBlKTsKLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
