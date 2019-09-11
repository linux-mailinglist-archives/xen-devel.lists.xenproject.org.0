Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 400B6B0009
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:29:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84W9-0002sK-PO; Wed, 11 Sep 2019 15:26:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i84W7-0002rZ-N4
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:26:47 +0000
X-Inumbo-ID: 908f2716-d4a8-11e9-83d9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 908f2716-d4a8-11e9-83d9-12813bfff9fa;
 Wed, 11 Sep 2019 15:26:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 61145AF3B;
 Wed, 11 Sep 2019 15:26:46 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
Message-ID: <f44f12f3-6449-8014-43e4-1f08100be251@suse.com>
Date: Wed, 11 Sep 2019 17:26:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 9/9] x86: PCID is unused when !PV
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBhbGxvd3MgaW4gcGFydGljdWxhciBzb21lIHN0cmVhbWxpbmluZyBvZiB0aGUgVExCIGZs
dXNoaW5nIGNvZGUKcGF0aHMuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYworKysgYi94ZW4vYXJjaC94
ODYvZmx1c2h0bGIuYwpAQCAtMjQsNiArMjQsMTEgQEAKICNkZWZpbmUgV1JBUF9NQVNLICgweDAw
MDAwM0ZGVSkKICNlbmRpZgogCisjaWZuZGVmIENPTkZJR19QVgorIyB1bmRlZiBYODZfQ1I0X1BD
SURFCisjIGRlZmluZSBYODZfQ1I0X1BDSURFIDAKKyNlbmRpZgorCiB1MzIgdGxiZmx1c2hfY2xv
Y2sgPSAxVTsKIERFRklORV9QRVJfQ1BVKHUzMiwgdGxiZmx1c2hfdGltZSk7CiAKLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3By
b2Nlc3Nvci5oCkBAIC0yODksNyArMjg5LDExIEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9u
ZyBjcjNfcGEodW5zaWcKIAogc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgY3IzX3BjaWQodW5z
aWduZWQgbG9uZyBjcjMpCiB7CisjaWZkZWYgQ09ORklHX1BWCiAgICAgcmV0dXJuIGNyMyAmIFg4
Nl9DUjNfUENJRF9NQVNLOworI2Vsc2UKKyAgICByZXR1cm4gMDsKKyNlbmRpZgogfQogCiBzdGF0
aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgcmVhZF9jcjQodm9pZCkKQEAgLTMwMSw4ICszMDUsMTIg
QEAgc3RhdGljIGlubGluZSB2b2lkIHdyaXRlX2NyNCh1bnNpZ25lZCBsbwogewogICAgIHN0cnVj
dCBjcHVfaW5mbyAqaW5mbyA9IGdldF9jcHVfaW5mbygpOwogCisjaWZkZWYgQ09ORklHX1BWCiAg
ICAgLyogTm8gZ2xvYmFsIHBhZ2VzIGluIGNhc2Ugb2YgUENJRHMgZW5hYmxlZCEgKi8KICAgICBB
U1NFUlQoISh2YWwgJiBYODZfQ1I0X1BHRSkgfHwgISh2YWwgJiBYODZfQ1I0X1BDSURFKSk7Cisj
ZWxzZQorICAgIEFTU0VSVCghKHZhbCAmIFg4Nl9DUjRfUENJREUpKTsKKyNlbmRpZgogCiAgICAg
LyoKICAgICAgKiBPbiBoYXJkd2FyZSBzdXBwb3J0aW5nIEZTR1NCQVNFLCB0aGUgdmFsdWUgaW4g
JWNyNCBpcyB0aGUga2VybmVsJ3MKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wdi9kb21haW4u
aAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3B2L2RvbWFpbi5oCkBAIC01MCw4ICs1MCwxMyBA
QAogICovCiBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgZ2V0X3BjaWRfYml0cyhjb25zdCBz
dHJ1Y3QgdmNwdSAqdiwgYm9vbCBpc194cHRpKQogeworI2lmZGVmIENPTkZJR19QVgogICAgIHJl
dHVybiBYODZfQ1IzX05PRkxVU0ggfCAoaXNfeHB0aSA/IFBDSURfUFZfWFBUSSA6IDApIHwKICAg
ICAgICAgICAgKCh2LT5hcmNoLmZsYWdzICYgVEZfa2VybmVsX21vZGUpID8gUENJRF9QVl9QUklW
IDogUENJRF9QVl9VU0VSKTsKKyNlbHNlCisgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CisgICAg
cmV0dXJuIDA7CisjZW5kaWYKIH0KIAogI2lmZGVmIENPTkZJR19QVgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
