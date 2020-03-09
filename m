Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3092617DF09
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 12:52:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBGuY-0000N2-2H; Mon, 09 Mar 2020 11:49:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBGuW-0000Mx-Mr
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 11:49:28 +0000
X-Inumbo-ID: 075f375e-61fc-11ea-ac0c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 075f375e-61fc-11ea-ac0c-12813bfff9fa;
 Mon, 09 Mar 2020 11:49:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 734ECAEA2;
 Mon,  9 Mar 2020 11:49:26 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a404fafe-0057-0ea7-93c3-754f96da8743@suse.com>
Date: Mon, 9 Mar 2020 12:49:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] memaccess: reduce include dependencies
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
Cc: Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNvbW1vbiBoZWFkZXIgZG9lc24ndCBpdHNlbGYgbmVlZCB0byBpbmNsdWRlIHB1YmxpYy92
bV9ldmVudC5oIG5vcgpwdWJsaWMvbWVtb3J5LmguIERyb3AgdGhlaXIgaW5jbHVzaW9uLiBUaGlz
IHJlcXVpcmVzIHVzaW5nIHRoZSBub24tCnR5cGVkZWYgbmFtZXMgaW4gdHdvIHByb3RvdHlwZXMg
YW5kIGFuIGlubGluZSBmdW5jdGlvbjsgYnkgbm90IGNoYW5naW5nCnRoZSBjYWxsZXJzIGFuZCBm
dW5jdGlvbiBkZWZpbml0aW9ucyBhdCB0aGUgc2FtZSB0aW1lIGl0J2xsIHJlbWFpbgpjZXJ0YWlu
IHRoYXQgdGhlIGJ1aWxkIHdvdWxkIGZhaWwgaWYgdGhlIHR5cGVkZWYgaXRzZWxmIHdhcyBjaGFu
Z2VkLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0t
IGEveGVuL2luY2x1ZGUvYXNtLWFybS9tZW1fYWNjZXNzLmgKKysrIGIveGVuL2luY2x1ZGUvYXNt
LWFybS9tZW1fYWNjZXNzLmgKQEAgLTE3LDkgKzE3LDExIEBACiAjaWZuZGVmIF9BU01fQVJNX01F
TV9BQ0NFU1NfSAogI2RlZmluZSBfQVNNX0FSTV9NRU1fQUNDRVNTX0gKIAorc3RydWN0IHZtX2V2
ZW50X3N0OworCiBzdGF0aWMgaW5saW5lCiBib29sIHAybV9tZW1fYWNjZXNzX2VtdWxhdGVfY2hl
Y2soc3RydWN0IHZjcHUgKnYsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgdm1fZXZlbnRfcmVzcG9uc2VfdCAqcnNwKQorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHN0cnVjdCB2bV9ldmVudF9zdCAqcnNwKQogewogICAgIC8qIE5vdCBzdXBw
b3J0ZWQgb24gQVJNLiAqLwogICAgIHJldHVybiBmYWxzZTsKLS0tIGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9tZW1fYWNjZXNzLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1fYWNjZXNzLmgK
QEAgLTI2LDYgKzI2LDggQEAKICNpZm5kZWYgX19BU01fWDg2X01FTV9BQ0NFU1NfSF9fCiAjZGVm
aW5lIF9fQVNNX1g4Nl9NRU1fQUNDRVNTX0hfXwogCitzdHJ1Y3Qgdm1fZXZlbnRfc3Q7CisKIC8q
CiAgKiBTZXR1cCB2bV9ldmVudCByZXF1ZXN0IGJhc2VkIG9uIHRoZSBhY2Nlc3MgKGdsYSBpcyAt
MXVsbCBpZiBub3QgYXZhaWxhYmxlKS4KICAqIEhhbmRsZXMgdGhlIHJ3MnJ4IGNvbnZlcnNpb24u
IEJvb2xlYW4gcmV0dXJuIHZhbHVlIGluZGljYXRlcyBpZiBldmVudCB0eXBlCkBAIC0zNiwxMiAr
MzgsMTIgQEAKICAqLwogYm9vbCBwMm1fbWVtX2FjY2Vzc19jaGVjayhwYWRkcl90IGdwYSwgdW5z
aWduZWQgbG9uZyBnbGEsCiAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBucGZlYyBu
cGZlYywKLSAgICAgICAgICAgICAgICAgICAgICAgICAgdm1fZXZlbnRfcmVxdWVzdF90ICoqcmVx
X3B0cik7CisgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2bV9ldmVudF9zdCAqKnJl
cV9wdHIpOwogCiAvKiBDaGVjayBmb3IgZW11bGF0aW9uIGFuZCBtYXJrIHZjcHUgZm9yIHNraXBw
aW5nIG9uZSBpbnN0cnVjdGlvbgogICogdXBvbiByZXNjaGVkdWxpbmcgaWYgcmVxdWlyZWQuICov
CiBib29sIHAybV9tZW1fYWNjZXNzX2VtdWxhdGVfY2hlY2soc3RydWN0IHZjcHUgKnYsCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgdm1fZXZlbnRfcmVzcG9uc2VfdCAq
cnNwKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qgdm1f
ZXZlbnRfc3QgKnJzcCk7CiAKIC8qIFNhbml0eSBjaGVjayBmb3IgbWVtX2FjY2VzcyBoYXJkd2Fy
ZSBzdXBwb3J0ICovCiBib29sIHAybV9tZW1fYWNjZXNzX3Nhbml0eV9jaGVjayhjb25zdCBzdHJ1
Y3QgZG9tYWluICpkKTsKLS0tIGEveGVuL2luY2x1ZGUveGVuL21lbV9hY2Nlc3MuaAorKysgYi94
ZW4vaW5jbHVkZS94ZW4vbWVtX2FjY2Vzcy5oCkBAIC0yNCw4ICsyNCw2IEBACiAKICNpbmNsdWRl
IDx4ZW4vdHlwZXMuaD4KICNpbmNsdWRlIDx4ZW4vbW0uaD4KLSNpbmNsdWRlIDxwdWJsaWMvbWVt
b3J5Lmg+Ci0jaW5jbHVkZSA8cHVibGljL3ZtX2V2ZW50Lmg+CiAjaW5jbHVkZSA8YXNtL21lbV9h
Y2Nlc3MuaD4KIAogLyoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
