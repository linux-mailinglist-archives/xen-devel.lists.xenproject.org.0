Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D825C3348C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 18:07:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXpRe-00028z-G8; Mon, 03 Jun 2019 16:04:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXpRd-00028P-MD
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:04:21 +0000
X-Inumbo-ID: 3f1a3a0a-8619-11e9-8e8e-7fb61b469f17
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3f1a3a0a-8619-11e9-8e8e-7fb61b469f17;
 Mon, 03 Jun 2019 16:04:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 021F6A78;
 Mon,  3 Jun 2019 09:04:20 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E0273F246;
 Mon,  3 Jun 2019 09:04:18 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Jun 2019 17:03:47 +0100
Message-Id: <20190603160350.29806-12-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190603160350.29806-1-julien.grall@arm.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 11/14] xen/x86: p2m: Remove duplicate error
 message in p2m_pt_audit_p2m()
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cDJtX3B0X2F1ZGl0X3AybSgpIGhhcyBvbmUgcGxhY2Ugd2hlcmUgdGhlIHNhbWUgbWVzc2FnZSBt
YXkgYmUgcHJpbnRlZAp0d2ljZSB2aWEgcHJpbnRrIGFuZCBQMk1fUFJJTlRLLgoKUmVtb3ZlIHRo
ZSBvbmUgcHJpbnRlZCB1c2luZyBwcmludGsgdG8gc3RheSBjb25zaXN0ZW50IHdpdGggdGhlIHJl
c3Qgb2YKdGhlIGNvZGUuCgpUYWtlIHRoZSBvcHBvcnR1bml0eSB0byByZWZsb3cgdGhlIGZvcm1h
dCBvZiBQMk1fUFJJTlRLLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MzoKICAgICAgICAtIFBhdGNoIGFkZGVk
Ci0tLQogeGVuL2FyY2gveDg2L21tL3AybS1wdC5jIHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9tbS9wMm0tcHQuYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYwppbmRleCBjYWZjOWYy
OTliLi44NGRkYzE4MzRiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMKKysr
IGIveGVuL2FyY2gveDg2L21tL3AybS1wdC5jCkBAIC0xMDQxLDkgKzEwNDEsOCBAQCBsb25nIHAy
bV9wdF9hdWRpdF9wMm0oc3RydWN0IHAybV9kb21haW4gKnAybSkKICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmICggbTJwZm4gIT0gKGdmbiArIGkyKSApCiAgICAgICAgICAgICAgICAgICAgICAg
ICB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG1iYWQrKzsKLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBQMk1fUFJJTlRLKCJtaXNtYXRjaDogZ2ZuICUjbHggLT4gbWZuICUjbHgi
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiIC0+IGdmbiAlI2x4XG4i
LCBnZm4raTIsIG1mbitpMiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG0ycGZuKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBQMk1fUFJJTlRLKCJtaXNtYXRj
aDogZ2ZuICUjbHggLT4gbWZuICUjbHggLT4gZ2ZuICUjbHhcbiIsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBnZm4gKyBpMiwgbWZuICsgaTIsIG0ycGZuKTsKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBCVUcoKTsKICAgICAgICAgICAgICAgICAgICAgICAgIH0K
ICAgICAgICAgICAgICAgICAgICAgICAgIGdmbiArPSAxIDw8IChMM19QQUdFVEFCTEVfU0hJRlQg
LSBQQUdFX1NISUZUKTsKQEAgLTExMDgsOCArMTEwNyw2IEBAIGxvbmcgcDJtX3B0X2F1ZGl0X3Ay
bShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAh
cDJtX2lzX3NoYXJlZCh0eXBlKSApCiAgICAgICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcG1iYWQrKzsKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwcmludGsoIm1pc21hdGNoOiBnZm4gJSNseCAtPiBtZm4gJSNseCIKLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIiAtPiBnZm4gJSNseFxuIiwgZ2ZuLCBtZm4sIG0ycGZuKTsK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQMk1fUFJJTlRLKCJtaXNtYXRjaDogZ2ZuICUj
bHggLT4gbWZuICUjbHgiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
IC0+IGdmbiAlI2x4XG4iLCBnZm4sIG1mbiwgbTJwZm4pOwogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEJVRygpOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
