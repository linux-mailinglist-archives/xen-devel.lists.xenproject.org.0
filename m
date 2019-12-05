Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B850B1143E5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 16:44:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ictGO-0000CX-Ce; Thu, 05 Dec 2019 15:41:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ictGM-0000CJ-IB
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 15:41:54 +0000
X-Inumbo-ID: c2a358a1-1775-11ea-822e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2a358a1-1775-11ea-822e-12813bfff9fa;
 Thu, 05 Dec 2019 15:41:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 45F07ABC7;
 Thu,  5 Dec 2019 15:41:53 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <34075b30-a9a1-4c02-5c6d-bdd73aeec5d0@suse.com>
Date: Thu, 5 Dec 2019 16:42:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86: don't offer Hyper-V option when "PV Shim
 Exclusive"
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

VGhpcyBvbmx5IGFkZGVkIGRlYWQgY29kZS4gVXNlICJpZiIgaW5zdGVhZCBvZiAiZGVwZW5kcyBv
biIgdG8gbWFrZQooaGFsZndheSkgY2xlYXIgdGhhdCBvdGhlciBndWVzdCBvcHRpb25zIHNob3Vs
ZCBhbHNvIGdvIGluIHRoYWUgc2FtZQpibG9jay4gTW92ZSB0aGUgb3B0aW9uIGRvd24gc3VjaCB0
aGF0IHRoZSBzaGltIHJlbGF0ZWQgb3B0aW9ucyBnZXQKcHJlc2VudGVkIGZpcnN0LCBhdm9pZGlu
ZyB0byBhc2sgdGhlIHF1ZXN0aW9uIHdoZW4gdGhlIGFuc3dlciBtYXkgZW5kCnVwIGJlaW5nIGRp
c2NhcmRlZC4KCldoaWxlIGluIHRoZSBuZWlnaGJvcmhvb2QgYWxzbyBicmluZyBQVl9TSElNX0VY
Q0xVU0lWRSBpbnRvIG1vcmUKImNhbm9uaWNhbCIgc2hhcGUuCgpTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZwor
KysgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwpAQCAtMTY0LDE0ICsxNjQsNiBAQCBlbmRjaG9pY2UK
IGNvbmZpZyBHVUVTVAogCWJvb2wKIAotY29uZmlnIEhZUEVSVl9HVUVTVAotCWJvb2wgIkh5cGVy
LVYgR3Vlc3QiCi0Jc2VsZWN0IEdVRVNUCi0JLS0taGVscC0tLQotCSAgU3VwcG9ydCBmb3IgWGVu
IGRldGVjdGluZyB3aGVuIGl0IGlzIHJ1bm5pbmcgdW5kZXIgSHlwZXItVi4KLQotCSAgSWYgdW5z
dXJlLCBzYXkgTi4KLQogY29uZmlnIFhFTl9HVUVTVAogCWJvb2wgIlhlbiBHdWVzdCIKIAlzZWxl
Y3QgR1VFU1QKQEAgLTIwMSw4ICsxOTMsNyBAQCBjb25maWcgUFZfU0hJTQogCSAgSWYgdW5zdXJl
LCBzYXkgWS4KIAogY29uZmlnIFBWX1NISU1fRVhDTFVTSVZFCi0JZGVmX2Jvb2wgbgotCXByb21w
dCAiUFYgU2hpbSBFeGNsdXNpdmUiCisJYm9vbCAiUFYgU2hpbSBFeGNsdXNpdmUiCiAJZGVwZW5k
cyBvbiBQVl9TSElNCiAJLS0taGVscC0tLQogCSAgQnVpbGQgWGVuIGluIGEgd2F5IHdoaWNoIHVu
Y29uZGl0aW9uYWxseSBhc3N1bWVzIFBWX1NISU0gbW9kZS4gIFRoaXMKQEAgLTIxMSw2ICsyMDIs
MTggQEAgY29uZmlnIFBWX1NISU1fRVhDTFVTSVZFCiAKIAkgIElmIHVuc3VyZSwgc2F5IE4uCiAK
K2lmICFQVl9TSElNX0VYQ0xVU0lWRQorCitjb25maWcgSFlQRVJWX0dVRVNUCisJYm9vbCAiSHlw
ZXItViBHdWVzdCIKKwlzZWxlY3QgR1VFU1QKKwktLS1oZWxwLS0tCisJICBTdXBwb3J0IGZvciBY
ZW4gZGV0ZWN0aW5nIHdoZW4gaXQgaXMgcnVubmluZyB1bmRlciBIeXBlci1WLgorCisJICBJZiB1
bnN1cmUsIHNheSBOLgorCitlbmRpZgorCiBjb25maWcgTUVNX1NIQVJJTkcKIAlib29sICJYZW4g
bWVtb3J5IHNoYXJpbmcgc3VwcG9ydCIgaWYgRVhQRVJUID0gInkiCiAJZGVwZW5kcyBvbiBIVk0K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
