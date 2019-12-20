Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7D0127C80
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:27:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJCs-000515-P6; Fri, 20 Dec 2019 14:24:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiJCq-000510-Ub
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:24:40 +0000
X-Inumbo-ID: 7536ea62-2334-11ea-9368-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7536ea62-2334-11ea-9368-12813bfff9fa;
 Fri, 20 Dec 2019 14:24:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BBA14B1D8;
 Fri, 20 Dec 2019 14:24:39 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <05cc35aa-ebb0-1316-bbcc-790533f21b25@suse.com>
Date: Fri, 20 Dec 2019 15:25:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3] x86: explicitly disallow guest access to PPIN
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

VG8gZnVsZmlsbCB0aGUgInByb3RlY3RlZCIgaW4gaXRzIG5hbWUsIGRvbid0IGxldCB0aGUgcmVh
bCBoYXJkd2FyZQp2YWx1ZXMgbGVhay4gV2hpbGUgd2UgY291bGQgcmVwb3J0IGEgY29udHJvbCBy
ZWdpc3RlciB2YWx1ZSBleHByZXNzaW5nCnRoaXMgKHdoaWNoIEkgd291bGQgaGF2ZSBwcmVmZXJy
ZWQpLCB1bmNvbmRpdGlvbmFsbHkgcmFpc2UgI0dQIGZvciBhbGwKYWNjZXNzZXMgKGluIHRoZSBp
bnRlcmVzdCBvZiBnZXR0aW5nIHRoaXMgZG9uZSkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2MzogVW5jb25kaXRpb25hbCAjR1AgaW4gZ3Vlc3Rf
cmRtc3IoKS4gQWRqdXN0IGNhc2UgbGFiZWwgcGxhY2VtZW50IGluCiAgICBndWVzdF93cm1zcigp
Lgp2MjogVXNlICJjcCIgY29uc2lzdGVudGx5LiBSZS1iYXNlLgoKLS0tIGEveGVuL2FyY2gveDg2
L21zci5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tc3IuYwpAQCAtMTM2LDYgKzEzNiwxMCBAQCBpbnQg
Z3Vlc3RfcmRtc3Ioc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90CiAgICAgY2FzZSBNU1JfVFNYX0NU
Ukw6CiAgICAgY2FzZSBNU1JfQU1ENjRfTFdQX0NGRzoKICAgICBjYXNlIE1TUl9BTUQ2NF9MV1Bf
Q0JBRERSOgorICAgIGNhc2UgTVNSX1BQSU5fQ1RMOgorICAgIGNhc2UgTVNSX1BQSU46CisgICAg
Y2FzZSBNU1JfQU1EX1BQSU5fQ1RMOgorICAgIGNhc2UgTVNSX0FNRF9QUElOOgogICAgICAgICAv
KiBOb3Qgb2ZmZXJlZCB0byBndWVzdHMuICovCiAgICAgICAgIGdvdG8gZ3BfZmF1bHQ7CiAKQEAg
LTI3OSw2ICsyODMsMTAgQEAgaW50IGd1ZXN0X3dybXNyKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJf
dAogICAgIGNhc2UgTVNSX1RTWF9DVFJMOgogICAgIGNhc2UgTVNSX0FNRDY0X0xXUF9DRkc6CiAg
ICAgY2FzZSBNU1JfQU1ENjRfTFdQX0NCQUREUjoKKyAgICBjYXNlIE1TUl9QUElOX0NUTDoKKyAg
ICBjYXNlIE1TUl9QUElOOgorICAgIGNhc2UgTVNSX0FNRF9QUElOX0NUTDoKKyAgICBjYXNlIE1T
Ul9BTURfUFBJTjoKICAgICAgICAgLyogTm90IG9mZmVyZWQgdG8gZ3Vlc3RzLiAqLwogICAgICAg
ICBnb3RvIGdwX2ZhdWx0OwogCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
