Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E041414DF6E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:48:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCy9-00012l-9j; Thu, 30 Jan 2020 16:47:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixCy7-00012d-5I
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:47:03 +0000
X-Inumbo-ID: 238cd962-4380-11ea-8abb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 238cd962-4380-11ea-8abb-12813bfff9fa;
 Thu, 30 Jan 2020 16:47:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 77211AEBA;
 Thu, 30 Jan 2020 16:47:01 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8bbfaead-2be9-4e30-4743-ddc95d60df95@suse.com>
Date: Thu, 30 Jan 2020 17:47:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/HVM: avoid truncation of PM timer I/O port
 range version
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

RG9uJ3Qgc2lsZW50bHkgaWdub3JlIHRoZSB1cHBlciAzMiBiaXRzLgoKU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9w
bXRpbWVyLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9wbXRpbWVyLmMKQEAgLTMxMyw5ICszMTMs
OSBAQCBzdGF0aWMgaW50IGFjcGlfbG9hZChzdHJ1Y3QgZG9tYWluICpkLCBoCiBIVk1fUkVHSVNU
RVJfU0FWRV9SRVNUT1JFKFBNVElNRVIsIGFjcGlfc2F2ZSwgYWNwaV9sb2FkLAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAxLCBIVk1TUl9QRVJfRE9NKTsKIAotaW50IHBtdGltZXJfY2hhbmdl
X2lvcG9ydChzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgdmVyc2lvbikKK2ludCBwbXRp
bWVyX2NoYW5nZV9pb3BvcnQoc3RydWN0IGRvbWFpbiAqZCwgdWludDY0X3QgdmVyc2lvbikKIHsK
LSAgICB1bnNpZ25lZCBpbnQgb2xkX3ZlcnNpb247CisgICAgdWludDY0X3Qgb2xkX3ZlcnNpb247
CiAKICAgICBpZiAoICFoYXNfdnBtKGQpICkKICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Ci0tLSBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZwdC5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYv
aHZtL3ZwdC5oCkBAIC0xODgsNyArMTg4LDcgQEAgdm9pZCBydGNfdXBkYXRlX2Nsb2NrKHN0cnVj
dCBkb21haW4gKmQpOwogdm9pZCBwbXRpbWVyX2luaXQoc3RydWN0IHZjcHUgKnYpOwogdm9pZCBw
bXRpbWVyX2RlaW5pdChzdHJ1Y3QgZG9tYWluICpkKTsKIHZvaWQgcG10aW1lcl9yZXNldChzdHJ1
Y3QgZG9tYWluICpkKTsKLWludCBwbXRpbWVyX2NoYW5nZV9pb3BvcnQoc3RydWN0IGRvbWFpbiAq
ZCwgdW5zaWduZWQgaW50IHZlcnNpb24pOworaW50IHBtdGltZXJfY2hhbmdlX2lvcG9ydChzdHJ1
Y3QgZG9tYWluICpkLCB1aW50NjRfdCB2ZXJzaW9uKTsKIAogdm9pZCBocGV0X2luaXQoc3RydWN0
IGRvbWFpbiAqZCk7CiB2b2lkIGhwZXRfZGVpbml0KHN0cnVjdCBkb21haW4gKmQpOwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
