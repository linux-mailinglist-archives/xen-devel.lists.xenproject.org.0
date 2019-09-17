Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6540EB474C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 08:20:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA6np-0001L3-M4; Tue, 17 Sep 2019 06:17:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iA6nn-0001Ka-LV
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 06:17:27 +0000
X-Inumbo-ID: d1ce7ef0-d912-11e9-9601-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1ce7ef0-d912-11e9-9601-12813bfff9fa;
 Tue, 17 Sep 2019 06:17:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 12AF5AC93;
 Tue, 17 Sep 2019 06:17:26 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
Message-ID: <fc21565a-3cb1-4547-09a2-fc908a51e526@suse.com>
Date: Tue, 17 Sep 2019 08:17:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 8/9] x86/CPUID: drop INVPCID dependency on
 PCID
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

UENJRCB2YWxpZGx5IGRlcGVuZHMgb24gTE0sIGFzIGl0IGNhbiBiZSBlbmFibGVkIGluIExvbmcg
TW9kZSBvbmx5LgpJTlZQQ0lELCBvdG9oLCBjYW4gYmUgdXNlZCBub3Qgb25seSB3aXRob3V0IFBD
SUQgZW5hYmxlZCwgYnV0IGFsc28Kb3V0c2lkZSBvZiBMb25nIE1vZGUgYWx0b2dldGhlci4gSW4g
Ym90aCBjYXNlcyBpdHMgZnVuY3Rpb25hbGl0eSBpcwpzaW1wbHkgcmVzdHJpY3RlZCB0byBQQ0lE
IDAsIHdoaWNoIGlzIHNvcnQgb2YgZXhwZWN0ZWQgYXMgbm8gb3RoZXIgUENJRApjYW4gYmUgYWN0
aXZhdGVkIHRoZXJlLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
CgotLS0gYS94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5CisrKyBiL3hlbi90b29scy9nZW4tY3B1aWQu
cHkKQEAgLTIxOCwxMCArMjE4LDYgQEAgZGVmIGNydW5jaF9udW1iZXJzKHN0YXRlKToKICAgICAg
ICAgIwogICAgICAgICAjIFNTRTRfMjogW1BPUENOVF0KIAotICAgICAgICAjIFRoZSBJTlZQQ0lE
IGluc3RydWN0aW9uIGRlcGVuZHMgb24gUENJRCBpbmZyYXN0cnVjdHVyZSBiZWluZwotICAgICAg
ICAjIGF2YWlsYWJsZS4KLSAgICAgICAgUENJRDogW0lOVlBDSURdLAotCiAgICAgICAgICMgWFNB
VkUgaXMgYW4gZXh0cmEgc2V0IG9mIGluc3RydWN0aW9ucyBmb3Igc3RhdGUgbWFuYWdlbWVudCwg
YnV0CiAgICAgICAgICMgZG9lc24ndCBjb25zdGl0dWUgbmV3IHN0YXRlIGl0c2VsZi4gIFNvbWUg
b2YgdGhlIGRlcGVuZGVudCBmZWF0dXJlcwogICAgICAgICAjIGFyZSBpbnN0cnVjdGlvbnMgYnVp
bHQgb24gdG9wIG9mIGJhc2UgWFNBVkUsIHdoaWxlIG90aGVycyBhcmUgbmV3CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
