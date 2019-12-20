Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F301D127BFB
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 14:51:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiIey-0000FW-K9; Fri, 20 Dec 2019 13:49:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiIew-0000F6-KW
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 13:49:38 +0000
X-Inumbo-ID: 900b0832-232f-11ea-935c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 900b0832-232f-11ea-935c-12813bfff9fa;
 Fri, 20 Dec 2019 13:49:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4B22AAB92;
 Fri, 20 Dec 2019 13:49:37 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b7a1a7fe-0bc5-1654-ff1c-e5eb787c579e@suse.com>
Message-ID: <c36cac91-49ae-6bb2-b057-195031979d21@suse.com>
Date: Fri, 20 Dec 2019 14:50:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b7a1a7fe-0bc5-1654-ff1c-e5eb787c579e@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 2/3] x86: relax LDT check in
 arch_set_info_guest()
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgd3JvbmcgZm9yIHVzIHRvIGNoZWNrIHRoZSBiYXNlIGFkZHJlc3Mgd2hlbiB0aGVyZSdz
IG5vIExEVCBpbiB0aGUKZmlyc3QgcGxhY2UuIE9uY2Ugd2UgZG9uJ3QgZG8gdGhpcyBjaGVjayBh
bnltb3JlIHdlIGNhbiBhbHNvIHNldCB0aGUKYmFzZSBhZGRyZXNzIHRvIGEgbm9uLWNhbm9uaWNh
bCB2YWx1ZSB3aGVuIHRoZSBMRFQgaXMgZW1wdHkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2MjogU2V0IHYtPmFyY2gucHYubGR0X2Jhc2UgdG8g
bm9uLWNhbm9uaWNhbCBmb3IgYW4gZW1wdHkgTERULCBwbHVzCiAgICByZWxhdGVkIG5lY2Vzc2Fy
eSBhZGp1c3RtZW50cy4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYworKysgYi94ZW4vYXJj
aC94ODYvZG9tYWluLmMKQEAgLTk1OSw4ICs5NTksMTAgQEAgaW50IGFyY2hfc2V0X2luZm9fZ3Vl
c3QoCiAgICAgICAgIGlmICggIWNvbXBhdCAmJiAhKGZsYWdzICYgVkdDRl9pbl9rZXJuZWwpICYm
ICFjLm5hdC0+Y3RybHJlZ1sxXSApCiAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKIAotICAg
ICAgICB2LT5hcmNoLnB2LmxkdF9iYXNlID0gYyhsZHRfYmFzZSk7CiAgICAgICAgIHYtPmFyY2gu
cHYubGR0X2VudHMgPSBjKGxkdF9lbnRzKTsKKyAgICAgICAgdi0+YXJjaC5wdi5sZHRfYmFzZSA9
IHYtPmFyY2gucHYubGR0X2VudHMKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID8gYyhs
ZHRfYmFzZSkKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogKHVuc2lnbmVkIGxvbmcp
WkVST19CTE9DS19QVFI7CiAgICAgfQogICAgIGVsc2UKICAgICB7CkBAIC05ODksOCArOTkxLDkg
QEAgaW50IGFyY2hfc2V0X2luZm9fZ3Vlc3QoCiAgICAgICAgIGZvciAoIGkgPSAwOyAhZmFpbCAm
JiBpIDwgbnJfZ2R0X2ZyYW1lczsgKytpICkKICAgICAgICAgICAgIGZhaWwgfD0gdi0+YXJjaC5w
di5nZHRfZnJhbWVzW2ldICE9IGMoZ2R0X2ZyYW1lc1tpXSk7CiAKLSAgICAgICAgZmFpbCB8PSB2
LT5hcmNoLnB2LmxkdF9iYXNlICE9IGMobGR0X2Jhc2UpOwogICAgICAgICBmYWlsIHw9IHYtPmFy
Y2gucHYubGR0X2VudHMgIT0gYyhsZHRfZW50cyk7CisgICAgICAgIGlmICggdi0+YXJjaC5wdi5s
ZHRfZW50cyApCisgICAgICAgICAgICBmYWlsIHw9IHYtPmFyY2gucHYubGR0X2Jhc2UgIT0gYyhs
ZHRfYmFzZSk7CiAKICAgICAgICAgaWYgKCBmYWlsICkKICAgICAgICAgICAgcmV0dXJuIC1FT1BO
T1RTVVBQOwotLS0gYS94ZW4vYXJjaC94ODYvZG9tY3RsLmMKKysrIGIveGVuL2FyY2gveDg2L2Rv
bWN0bC5jCkBAIC0xNTYzLDcgKzE1NjMsNyBAQCB2b2lkIGFyY2hfZ2V0X2luZm9fZ3Vlc3Qoc3Ry
dWN0IHZjcHUgKnYsCiAgICAgfQogICAgIGVsc2UKICAgICB7Ci0gICAgICAgIGMobGR0X2Jhc2Ug
PSB2LT5hcmNoLnB2LmxkdF9iYXNlKTsKKyAgICAgICAgYyhsZHRfYmFzZSA9IHYtPmFyY2gucHYu
bGR0X2VudHMgPyB2LT5hcmNoLnB2LmxkdF9iYXNlIDogMCk7CiAgICAgICAgIGMobGR0X2VudHMg
PSB2LT5hcmNoLnB2LmxkdF9lbnRzKTsKICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9T
SVpFKHYtPmFyY2gucHYuZ2R0X2ZyYW1lcyk7ICsraSApCiAgICAgICAgICAgICBjKGdkdF9mcmFt
ZXNbaV0gPSB2LT5hcmNoLnB2LmdkdF9mcmFtZXNbaV0pOwotLS0gYS94ZW4vYXJjaC94ODYvbW0u
YworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtMzcwMiwxNCArMzcwMiwxNSBAQCBsb25nIGRv
X21tdWV4dF9vcCgKICAgICAgICAgY2FzZSBNTVVFWFRfU0VUX0xEVDoKICAgICAgICAgewogICAg
ICAgICAgICAgdW5zaWduZWQgaW50IGVudHMgPSBvcC5hcmcyLm5yX2VudHM7Ci0gICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIHB0ciA9IGVudHMgPyBvcC5hcmcxLmxpbmVhcl9hZGRyIDogMDsKKyAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcHRyID0gZW50cyA/IG9wLmFyZzEubGluZWFyX2FkZHIK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6ICh1bnNpZ25lZCBsb25nKVpF
Uk9fQkxPQ0tfUFRSOwogCiAgICAgICAgICAgICBpZiAoIHVubGlrZWx5KGN1cnJkICE9IHBnX293
bmVyKSApCiAgICAgICAgICAgICAgICAgcmMgPSAtRVBFUk07CiAgICAgICAgICAgICBlbHNlIGlm
ICggcGFnaW5nX21vZGVfZXh0ZXJuYWwoY3VycmQpICkKICAgICAgICAgICAgICAgICByYyA9IC1F
SU5WQUw7Ci0gICAgICAgICAgICBlbHNlIGlmICggKChwdHIgJiAoUEFHRV9TSVpFIC0gMSkpICE9
IDApIHx8ICFfX2FkZHJfb2socHRyKSB8fAotICAgICAgICAgICAgICAgICAgICAgIChlbnRzID4g
ODE5MikgKQorICAgICAgICAgICAgZWxzZSBpZiAoIChlbnRzID4gODE5MikgfHwKKyAgICAgICAg
ICAgICAgICAgICAgICAoZW50cyAmJiAoKHB0ciAmIChQQUdFX1NJWkUgLSAxKSkgfHwgIV9fYWRk
cl9vayhwdHIpKSkgKQogICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIGdkcHJpbnRrKFhF
TkxPR19XQVJOSU5HLAogICAgICAgICAgICAgICAgICAgICAgICAgICJCYWQgYXJncyB0byBTRVRf
TERUOiBwdHI9JWx4LCBlbnRzPSV4XG4iLCBwdHIsIGVudHMpOwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
