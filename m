Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B9E18027C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 16:53:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBhAB-0003YK-3e; Tue, 10 Mar 2020 15:51:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBhA9-0003Xq-93
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 15:51:21 +0000
X-Inumbo-ID: fc52da8c-62e6-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc52da8c-62e6-11ea-92cf-bc764e2007e4;
 Tue, 10 Mar 2020 15:51:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C516DADDD;
 Tue, 10 Mar 2020 15:51:19 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8f1b522e-8667-c230-6671-7d70252634de@suse.com>
Message-ID: <5cc2afc4-4c01-5457-e655-dfda59bc5291@suse.com>
Date: Tue, 10 Mar 2020 16:51:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8f1b522e-8667-c230-6671-7d70252634de@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 7/9] x86/HVM: reduce io.h include dependencies
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCAjaW5jbHVkZS1zIG5vdCBuZWVkZWQgYnkgdGhlIGhlYWRlciBpdHNlbGYgYXMgd2VsbCBh
cyBvbmUgaW5jbHVkZQpvZiB0aGUgaGVhZGVyIHdoaWNoIGlzbid0IG5lZWRlZC4gUHV0IHRoZSBv
bmUgbmVlZGVkIGludG8gdGhlIGZpbGUKYWN0dWFsbHkgcmVxdWlyaW5nIGl0LgoKU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vaW8uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pby5oCkBAIC0x
OSwxMiArMTksOCBAQAogI2lmbmRlZiBfX0FTTV9YODZfSFZNX0lPX0hfXwogI2RlZmluZSBfX0FT
TV9YODZfSFZNX0lPX0hfXwogCi0jaW5jbHVkZSA8eGVuL21tLmg+CiAjaW5jbHVkZSA8eGVuL3Bj
aS5oPgotI2luY2x1ZGUgPGFzbS9odm0vdnBpYy5oPgotI2luY2x1ZGUgPGFzbS9odm0vdmlvYXBp
Yy5oPgogI2luY2x1ZGUgPHB1YmxpYy9odm0vaW9yZXEuaD4KLSNpbmNsdWRlIDxwdWJsaWMvZXZl
bnRfY2hhbm5lbC5oPgogCiAjZGVmaW5lIE5SX0lPX0hBTkRMRVJTIDMyCiAKLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vdmNwdS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3Zj
cHUuaApAQCAtMjYsNiArMjYsNyBAQAogI2luY2x1ZGUgPGFzbS9odm0vc3ZtL3ZtY2IuaD4KICNp
bmNsdWRlIDxhc20vaHZtL3N2bS9uZXN0ZWRzdm0uaD4KICNpbmNsdWRlIDxhc20vbXRyci5oPgor
I2luY2x1ZGUgPHB1YmxpYy9odm0vaW9yZXEuaD4KIAogZW51bSBodm1faW9fY29tcGxldGlvbiB7
CiAgICAgSFZNSU9fbm9fY29tcGxldGlvbiwKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0v
dm14L3ZtY3MuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm1jcy5oCkBAIC0x
OCw4ICsxOCw2IEBACiAjaWZuZGVmIF9fQVNNX1g4Nl9IVk1fVk1YX1ZNQ1NfSF9fCiAjZGVmaW5l
IF9fQVNNX1g4Nl9IVk1fVk1YX1ZNQ1NfSF9fCiAKLSNpbmNsdWRlIDxhc20vaHZtL2lvLmg+Ci0K
IGV4dGVybiB2b2lkIHZtY3NfZHVtcF92Y3B1KHN0cnVjdCB2Y3B1ICp2KTsKIGV4dGVybiB2b2lk
IHNldHVwX3ZtY3NfZHVtcCh2b2lkKTsKIGV4dGVybiBpbnQgIHZteF9jcHVfdXBfcHJlcGFyZSh1
bnNpZ25lZCBpbnQgY3B1KTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
