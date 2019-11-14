Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A542FC9E0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 16:25:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVGwr-0004yL-No; Thu, 14 Nov 2019 15:22:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVGwp-0004yE-MF
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 15:22:15 +0000
X-Inumbo-ID: 892244d0-06f2-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 892244d0-06f2-11ea-984a-bc764e2007e4;
 Thu, 14 Nov 2019 15:22:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A0178AF13;
 Thu, 14 Nov 2019 15:22:13 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f70aa2a5-66f8-6915-c4a4-b1f701fe143c@suse.com>
Date: Thu, 14 Nov 2019 16:22:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/cpuidle: correct Cannon Lake residency MSRs
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

QXMgcGVyIFNETSByZXYgMDcxIENhbm5vbiBMYWtlIGhhcwotIG5vIENDMyByZXNpZGVuY3kgTVNS
IGF0IDNGQywKLSBhIENDMSByZXNpZGVuY3kgTVNSIGFyIDY2MCAobGlrZSB2YXJpb3VzIEF0b21z
KSwKLSBhIHVzZWxlc3MgKGFsd2F5cyB6ZXJvKSBDQzMgcmVzaWRlbmN5IE1TUiBhdCA2NjIuCgpT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQpVc2luZyB0
aGUgTVNSIGNyb3NzIHJlZmVyZW5jZSBpbiB0aGUgc2FtZSBTRE0gcmV2aXNpb24gb25lIG1pZ2h0
IGV2ZW4KZ2V0IHRoZSBpbXByZXNzaW9uIHRoYXQgZnVydGhlciBNU1JzIGFyZSB1bmF2YWlsYWJs
ZSwgYnV0IG5ld2VyIENQVXMKZG9uJ3QgYXBwZWFyIHRvIGJlIGNvbnNpc3RlbnRseSBsaXN0ZWQg
dGhlcmUgYXQgYWxsLCBzbyBtYXkgcmF0aGVyIGJlIGEKZG9jIHNob3J0Y29taW5nLiBJJ3ZlIHBv
aW50ZWQgdGhpcyBvdXQgdG8gSW50ZWwsIGJ1dCBJJ20gbm90IGV4cGVjdGluZwpzd2lmdCBmZWVk
YmFjay4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdV9pZGxlLmMKKysrIGIveGVuL2FyY2gv
eDg2L2FjcGkvY3B1X2lkbGUuYwpAQCAtNjgsNyArNjgsNyBAQAogI2RlZmluZSBHRVRfUEM4X1JF
Uyh2YWwpICBHRVRfSFdfUkVTX0lOX05TKDB4NjMwLCB2YWwpIC8qIHNvbWUgSGFzd2VsbHMgb25s
eSAqLwogI2RlZmluZSBHRVRfUEM5X1JFUyh2YWwpICBHRVRfSFdfUkVTX0lOX05TKDB4NjMxLCB2
YWwpIC8qIHNvbWUgSGFzd2VsbHMgb25seSAqLwogI2RlZmluZSBHRVRfUEMxMF9SRVModmFsKSBH
RVRfSFdfUkVTX0lOX05TKDB4NjMyLCB2YWwpIC8qIHNvbWUgSGFzd2VsbHMgb25seSAqLwotI2Rl
ZmluZSBHRVRfQ0MxX1JFUyh2YWwpICBHRVRfSFdfUkVTX0lOX05TKDB4NjYwLCB2YWwpIC8qIFNp
bHZlcm1vbnQgb25seSAqLworI2RlZmluZSBHRVRfQ0MxX1JFUyh2YWwpICBHRVRfSFdfUkVTX0lO
X05TKDB4NjYwLCB2YWwpCiAjZGVmaW5lIEdFVF9DQzNfUkVTKHZhbCkgIEdFVF9IV19SRVNfSU5f
TlMoMHgzRkMsIHZhbCkKICNkZWZpbmUgR0VUX0NDNl9SRVModmFsKSAgR0VUX0hXX1JFU19JTl9O
UygweDNGRCwgdmFsKQogI2RlZmluZSBHRVRfQ0M3X1JFUyh2YWwpICBHRVRfSFdfUkVTX0lOX05T
KDB4M0ZFLCB2YWwpIC8qIFNOQiBvbndhcmRzICovCkBAIC0xNzksOCArMTc5LDYgQEAgc3RhdGlj
IHZvaWQgZG9fZ2V0X2h3X3Jlc2lkZW5jaWVzKHZvaWQgKgogICAgIGNhc2UgMHg0RToKICAgICBj
YXNlIDB4NTU6CiAgICAgY2FzZSAweDVFOgotICAgIC8qIENhbm5vbiBMYWtlICovCi0gICAgY2Fz
ZSAweDY2OgogICAgIC8qIEthYnkgTGFrZSAqLwogICAgIGNhc2UgMHg4RToKICAgICBjYXNlIDB4
OUU6CkBAIC0yMDIsNiArMjAwLDE2IEBAIHN0YXRpYyB2b2lkIGRvX2dldF9od19yZXNpZGVuY2ll
cyh2b2lkICoKICAgICAgICAgR0VUX0NDM19SRVMoaHdfcmVzLT5jYzMpOwogICAgICAgICBHRVRf
Q0M2X1JFUyhod19yZXMtPmNjNik7CiAgICAgICAgIGJyZWFrOworICAgIC8qIENhbm5vbiBMYWtl
ICovCisgICAgY2FzZSAweDY2OgorICAgICAgICBHRVRfUEMyX1JFUyhod19yZXMtPnBjMik7Cisg
ICAgICAgIEdFVF9QQzNfUkVTKGh3X3Jlcy0+cGMzKTsKKyAgICAgICAgR0VUX1BDNl9SRVMoaHdf
cmVzLT5wYzYpOworICAgICAgICBHRVRfUEM3X1JFUyhod19yZXMtPnBjNyk7CisgICAgICAgIEdF
VF9DQzFfUkVTKGh3X3Jlcy0+Y2MxKTsKKyAgICAgICAgR0VUX0NDNl9SRVMoaHdfcmVzLT5jYzYp
OworICAgICAgICBHRVRfQ0M3X1JFUyhod19yZXMtPmNjNyk7CisgICAgICAgIGJyZWFrOwogICAg
IC8qIFhlb24gUGhpIEtuaWdodHMgTGFuZGluZyAqLwogICAgIGNhc2UgMHg1NzoKICAgICAvKiBY
ZW9uIFBoaSBLbmlnaHRzIE1pbGwgKi8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
