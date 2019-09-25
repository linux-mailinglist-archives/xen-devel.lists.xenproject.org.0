Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3665DBE157
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:30:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9Cv-0006eD-C1; Wed, 25 Sep 2019 15:27:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD9Ct-0006dy-UE
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:27:55 +0000
X-Inumbo-ID: 0ba00b34-dfa9-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 0ba00b34-dfa9-11e9-8628-bc764e2007e4;
 Wed, 25 Sep 2019 15:27:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A12ECAC52;
 Wed, 25 Sep 2019 15:27:54 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <052b6003-53a7-0563-72ac-48fe558ac549@suse.com>
Date: Wed, 25 Sep 2019 17:27:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/CPUID: RSTR_FP_ERR_PTRS depends on FPU
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUncyBub3RoaW5nIHRvIHJlc3RvcmUgaGVyZSBpZiB0aGVyZSdzIG5vIEZQVSBpbiB0aGUg
Zmlyc3QgcGxhY2UuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Ci0tLQpUbyBiZSBjb25zaWRlcmVkIGZvciA0LjEzIHNpbmNlIFJTVFJfRlBfRVJSX1BUUlMg
c3VwcG9ydCB3YXMgaW50cm9kdWNlZApqdXN0IHJlY2VudGx5LgoKLS0tIGEveGVuL3Rvb2xzL2dl
bi1jcHVpZC5weQorKysgYi94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5CkBAIC0xNjgsOCArMTY4LDkg
QEAgZGVmIGNydW5jaF9udW1iZXJzKHN0YXRlKToKICAgICBkZXBzID0gewogICAgICAgICAjIEZQ
VSBpcyB0YWtlbiB0byBtZWFuIHN1cHBvcnQgZm9yIHRoZSB4ODcgcmVnaXNlcnMgYXMgd2VsbCBh
cyB0aGUKICAgICAgICAgIyBpbnN0cnVjdGlvbnMuICBNTVggaXMgZG9jdW1lbnRlZCB0byBhbGlh
cyB0aGUgJU1NIHJlZ2lzdGVycyBvdmVyIHRoZQotICAgICAgICAjIHg4NyAlU1QgcmVnaXN0ZXJz
IGluIGhhcmR3YXJlLgotICAgICAgICBGUFU6IFtNTVhdLAorICAgICAgICAjIHg4NyAlU1QgcmVn
aXN0ZXJzIGluIGhhcmR3YXJlLiAgQ29ycmVjdCByZXN0b3Jpbmcgb2YgZXJyb3IgcG9pbnRlcnMK
KyAgICAgICAgIyBvZiBjb3Vyc2UgbWFrZXMgbm8gc2Vuc2Ugd2l0aG91dCB0aGVyZSBiZWluZyBh
bnl0aGluZyB0byByZXN0b3JlLgorICAgICAgICBGUFU6IFtNTVgsIFJTVFJfRlBfRVJSX1BUUlNd
LAogCiAgICAgICAgICMgVGhlIFBTRTM2IGZlYXR1cmUgaW5kaWNhdGVzIHRoYXQgcmVzZXJ2ZWQg
Yml0cyBpbiBhIFBTRSBzdXBlcnBhZ2UKICAgICAgICAgIyBtYXkgYmUgdXNlZCBhcyBleHRyYSBw
aHlzaWNhbCBhZGRyZXNzIGJpdHMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
