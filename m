Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BAA10726D
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 13:49:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY8Kl-0002AI-Qm; Fri, 22 Nov 2019 12:46:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iY8Kk-0002AD-JI
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 12:46:46 +0000
X-Inumbo-ID: 23c2df70-0d26-11ea-a350-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23c2df70-0d26-11ea-a350-12813bfff9fa;
 Fri, 22 Nov 2019 12:46:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3C78CB436;
 Fri, 22 Nov 2019 12:46:44 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fba2992c-e306-dfb2-8edb-20fe5d18ca98@suse.com>
Date: Fri, 22 Nov 2019 13:46:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86: avoid HPET use on certain Intel platforms
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

TGludXggY29tbWl0IGZjNWRiNTg1MzliNDkzNTFlNzZmMTk4MTdlZDExMDJiZjdjNzEyZDAgc2F5
cwoKIlNvbWUgQ29mZmVlIExha2UgcGxhdGZvcm1zIGhhdmUgYSBza2V3ZWQgSFBFVCB0aW1lciBv
bmNlIHRoZSBTb0NzIGVudGVyZWQKIFBDMTAsIHdoaWNoIGluIGNvbnNlcXVlbmNlIG1hcmtzIFRT
QyBhcyB1bnN0YWJsZSBiZWNhdXNlIEhQRVQgaXMgdXNlZCBhcwogd2F0Y2hkb2cgY2xvY2tzb3Vy
Y2UgZm9yIFRTQy4iCgpGb2xsb3cgdGhpcyBmb3IgWGVuIGFzIHdlbGwuIExvb2tpbmcgYXQgaXRz
IHBhdGNoIGNvbnRleHQgbWFkZSBtZSBub3RpY2UKdGhleSBoYXZlIGEgcHJlLWV4aXN0aW5nIHF1
aXJrIGZvciBCYXkgVHJhaWwgYXMgd2VsbC4gVGhlIGNvbW1lbnQgdGhlcmUsCmhvd2V2ZXIsIHBv
aW50cyBhdCBhIENoZXJyeSBUcmFpbCBkb2N1bWVudC4gTG9va2luZyBhdCB0aGUgZGF0YXNoZWV0
cyBvZgpib3RoLCB0aGVyZSBhcHBlYXIgdG8gYmUgc2ltaWxhciBpc3N1ZXMsIHNvIGdvIGJleW9u
ZCBMaW51eCdlcyBjb3ZlcmFnZQphbmQgZXhjbHVkZSBib3RoLiBBbHNvIGtleSB0aGUgZGlzYWJs
ZSBvbiB0aGUgUENJIElEcyBvZiB0aGUgYWN0dWFsCmFmZmVjdGVkIGRldmljZXMsIHJhdGhlciB0
aGFuIHRob3NlIG9mIDAwOjAwLjAuCgpBcHBseSB0aGUgd29ya2Fyb3VuZHMgb25seSB3aGVuIHRo
ZSB1c2Ugb2YgSFBFVCB3YXMgbm90IGV4cGxpY2l0bHkKcmVxdWVzdGVkIG9uIHRoZSBjb21tYW5k
IGxpbmUgYW5kIHdoZW4gdXNlIG9mIChkZWVwKSBDLXN0YXRlcyB3YXMgbm90CmRpc2FibGVkLgoK
QWRqdXN0IGEgZmV3IHR5cGVzIGluIHRvdWNoZWQgb3IgbmVhcmJ5IGNvZGUgYXQgdGhlIHNhbWUg
dGltZS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0t
LSBhL3hlbi9hcmNoL3g4Ni90aW1lLmMKKysrIGIveGVuL2FyY2gveDg2L3RpbWUuYwpAQCAtMTgs
NiArMTgsNyBAQAogI2luY2x1ZGUgPHhlbi90aW1lci5oPgogI2luY2x1ZGUgPHhlbi9zbXAuaD4K
ICNpbmNsdWRlIDx4ZW4vaXJxLmg+CisjaW5jbHVkZSA8eGVuL3BjaV9pZHMuaD4KICNpbmNsdWRl
IDx4ZW4vc29mdGlycS5oPgogI2luY2x1ZGUgPHhlbi9lZmkuaD4KICNpbmNsdWRlIDx4ZW4vY3B1
aWRsZS5oPgpAQCAtMzY3LDEyICszNjgsNDEgQEAgc3RhdGljIHU2NCByZWFkX2hwZXRfY291bnQo
dm9pZCkKICAgICByZXR1cm4gaHBldF9yZWFkMzIoSFBFVF9DT1VOVEVSKTsKIH0KIAotc3RhdGlj
IHM2NCBfX2luaXQgaW5pdF9ocGV0KHN0cnVjdCBwbGF0Zm9ybV90aW1lc291cmNlICpwdHMpCitz
dGF0aWMgaW50NjRfdCBfX2luaXQgaW5pdF9ocGV0KHN0cnVjdCBwbGF0Zm9ybV90aW1lc291cmNl
ICpwdHMpCiB7Ci0gICAgdTY0IGhwZXRfcmF0ZSA9IGhwZXRfc2V0dXAoKSwgc3RhcnQ7Ci0gICAg
dTMyIGNvdW50LCB0YXJnZXQ7CisgICAgdWludDY0X3QgaHBldF9yYXRlLCBzdGFydDsKKyAgICB1
aW50MzJfdCBjb3VudCwgdGFyZ2V0OwogCi0gICAgaWYgKCBocGV0X3JhdGUgPT0gMCApCisgICAg
aWYgKCBocGV0X2FkZHJlc3MgJiYgc3RyY21wKG9wdF9jbG9ja3NvdXJjZSwgcHRzLT5pZCkgJiYK
KyAgICAgICAgIGNwdWlkbGVfdXNpbmdfZGVlcF9jc3RhdGUoKSApCisgICAgeworICAgICAgICBp
ZiAoIHBjaV9jb25mX3JlYWQxNihQQ0lfU0JERigwLCAwLCAweDFmLCAwKSwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgUENJX1ZFTkRPUl9JRCkgPT0gUENJX1ZFTkRPUl9JRF9JTlRFTCAp
CisgICAgICAgICAgICBzd2l0Y2ggKCBwY2lfY29uZl9yZWFkMTYoUENJX1NCREYoMCwgMCwgMHgx
ZiwgMCksIFBDSV9ERVZJQ0VfSUQpICkKKyAgICAgICAgICAgIHsKKyAgICAgICAgICAgIC8qIEhQ
RVQgb24gQmF5IFRyYWlsIHBsYXRmb3JtcyB3aWxsIGhhbHQgaW4gZGVlcCBDIHN0YXRlcy4gKi8K
KyAgICAgICAgICAgIGNhc2UgMHgwZjFjOgorICAgICAgICAgICAgLyogSFBFVCBvbiBDaGVycnkg
VHJhaWwgcGxhdGZvcm1zIHdpbGwgaGFsdCBpbiBkZWVwIEMgc3RhdGVzLiAqLworICAgICAgICAg
ICAgY2FzZSAweDIyOWM6CisgICAgICAgICAgICAgICAgaHBldF9hZGRyZXNzID0gMDsKKyAgICAg
ICAgICAgICAgICBicmVhazsKKyAgICAgICAgICAgIH0KKworICAgICAgICAvKgorICAgICAgICAg
KiBTb21lIENvZmZlZSBMYWtlIHBsYXRmb3JtcyBoYXZlIGEgc2tld2VkIEhQRVQgdGltZXIgb25j
ZSB0aGUgU29DcworICAgICAgICAgKiBlbnRlcmVkIFBDMTAuCisgICAgICAgICAqLworICAgICAg
ICBpZiAoIHBjaV9jb25mX3JlYWQxNihQQ0lfU0JERigwLCAwLCAwLCAwKSwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgUENJX1ZFTkRPUl9JRCkgPT0gUENJX1ZFTkRPUl9JRF9JTlRFTCAm
JgorICAgICAgICAgICAgIHBjaV9jb25mX3JlYWQxNihQQ0lfU0JERigwLCAwLCAwLCAwKSwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0RFVklDRV9JRCkgPT0gMHgzZWM0ICkKKyAg
ICAgICAgICAgIGhwZXRfYWRkcmVzcyA9IDA7CisKKyAgICAgICAgaWYgKCAhaHBldF9hZGRyZXNz
ICkKKyAgICAgICAgICAgIHByaW50aygiRGlzYWJsaW5nIEhQRVQgZm9yIGJlaW5nIHVucmVsaWFi
bGVcbiIpOworICAgIH0KKworICAgIGlmICggKGhwZXRfcmF0ZSA9IGhwZXRfc2V0dXAoKSkgPT0g
MCApCiAgICAgICAgIHJldHVybiAwOwogCiAgICAgcHRzLT5mcmVxdWVuY3kgPSBocGV0X3JhdGU7
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
