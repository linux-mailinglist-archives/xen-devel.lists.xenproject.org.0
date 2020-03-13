Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 186D01845CD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 12:18:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCiHo-00064q-85; Fri, 13 Mar 2020 11:15:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCiHm-00064e-1O
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 11:15:26 +0000
X-Inumbo-ID: efe7b510-651b-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efe7b510-651b-11ea-92cf-bc764e2007e4;
 Fri, 13 Mar 2020 11:15:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B5AEBAAC7;
 Fri, 13 Mar 2020 11:15:24 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9b64e44c-1050-4f64-1ead-86761f7b7fa2@suse.com>
Message-ID: <af9496b7-f4d3-02f7-dd59-c746ff08153b@suse.com>
Date: Fri, 13 Mar 2020 12:15:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9b64e44c-1050-4f64-1ead-86761f7b7fa2@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 3/9] x86/HVM: reduce vpt.h include
 dependencies
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

RHJvcCAjaW5jbHVkZS1zIG5vdCBuZWVkZWQgYnkgdGhlIGhlYWRlciBpdHNlbGYuCgpTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vaW5jbHVk
ZS9hc20teDg2L2h2bS92cHQuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92cHQuaApA
QCAtMTksMTYgKzE5LDkgQEAKICNpZm5kZWYgX19BU01fWDg2X0hWTV9WUFRfSF9fCiAjZGVmaW5l
IF9fQVNNX1g4Nl9IVk1fVlBUX0hfXwogCi0jaW5jbHVkZSA8eGVuL2luaXQuaD4KLSNpbmNsdWRl
IDx4ZW4vbGliLmg+Ci0jaW5jbHVkZSA8eGVuL3RpbWUuaD4KLSNpbmNsdWRlIDx4ZW4vZXJybm8u
aD4KLSNpbmNsdWRlIDx4ZW4vdGltZS5oPgogI2luY2x1ZGUgPHhlbi90aW1lci5oPgogI2luY2x1
ZGUgPHhlbi9saXN0Lmg+Ci0jaW5jbHVkZSA8YXNtL2h2bS92cGljLmg+Ci0jaW5jbHVkZSA8YXNt
L2h2bS9pcnEuaD4KLSNpbmNsdWRlIDxwdWJsaWMvaHZtL3NhdmUuaD4KKyNpbmNsdWRlIDxhc20v
aHZtL2h2bS5oPgogCiAvKgogICogQWJzdHJhY3QgbGF5ZXIgb2YgcGVyaW9kaWMgdGltZSwgb25l
IHNob3J0IHRpbWUuCkBAIC0xNDUsNiArMTM4LDcgQEAgc3RydWN0IHBsX3RpbWUgeyAgICAvKiBw
bGF0Zm9ybSB0aW1lICovCiB2b2lkIHB0X3NhdmVfdGltZXIoc3RydWN0IHZjcHUgKnYpOwogdm9p
ZCBwdF9yZXN0b3JlX3RpbWVyKHN0cnVjdCB2Y3B1ICp2KTsKIGludCBwdF91cGRhdGVfaXJxKHN0
cnVjdCB2Y3B1ICp2KTsKK3N0cnVjdCBodm1faW50YWNrOwogdm9pZCBwdF9pbnRyX3Bvc3Qoc3Ry
dWN0IHZjcHUgKnYsIHN0cnVjdCBodm1faW50YWNrIGludGFjayk7CiB2b2lkIHB0X21pZ3JhdGUo
c3RydWN0IHZjcHUgKnYpOwogCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
