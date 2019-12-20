Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 261A6127BE3
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 14:42:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiIVG-0007Gc-NW; Fri, 20 Dec 2019 13:39:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiIVF-0007GL-7n
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 13:39:37 +0000
X-Inumbo-ID: 29623afd-232e-11ea-935b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29623afd-232e-11ea-935b-12813bfff9fa;
 Fri, 20 Dec 2019 13:39:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0BDE6AFA8;
 Fri, 20 Dec 2019 13:39:36 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7f7a6ba3-7308-b079-2df1-f5b8501b3cc6@suse.com>
Message-ID: <19f87ebc-f030-33fb-5b67-c1657bf921c1@suse.com>
Date: Fri, 20 Dec 2019 14:40:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7f7a6ba3-7308-b079-2df1-f5b8501b3cc6@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 3/5] x86emul: drop CASE_SIMD_DOUBLE_FP()
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

SXQncyB1c2VkIG9ubHkgYnkgQ0FTRV9TSU1EX0FMTF9GUCgpLCB3aGljaCBjYW4gZXF1YWxseSB3
ZWxsIGJlCmltcGxlbWVudGVkIGluIHRlcm1zIG9mIENBU0VfU0lNRF97UEFDS0VELFNDQUxBUn1f
RlAoKS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0t
LSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCisrKyBiL3hlbi9hcmNo
L3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCkBAIC02MDEwLDIxICs2MDEwLDE4IEBAIHg4
Nl9lbXVsYXRlKAogICAgIENBU0VfU0lNRF9QQUNLRURfSU5UKHBmeCwgb3BjKTogICAgICAgICAg
XAogICAgIGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KHBmeCwgb3BjKQogCi0jZGVmaW5lIENBU0Vf
U0lNRF9TSU5HTEVfRlAoa2luZCwgcGZ4LCBvcGMpICBcCi0gICAgY2FzZSBYODZFTVVMX09QQyMj
a2luZChwZngsIG9wYyk6ICAgICAgICBcCi0gICAgY2FzZSBYODZFTVVMX09QQyMja2luZCMjX0Yz
KHBmeCwgb3BjKQotI2RlZmluZSBDQVNFX1NJTURfRE9VQkxFX0ZQKGtpbmQsIHBmeCwgb3BjKSAg
XAotICAgIGNhc2UgWDg2RU1VTF9PUEMjI2tpbmQjI182NihwZngsIG9wYyk6ICAgXAotICAgIGNh
c2UgWDg2RU1VTF9PUEMjI2tpbmQjI19GMihwZngsIG9wYykKICNkZWZpbmUgQ0FTRV9TSU1EX0FM
TF9GUChraW5kLCBwZngsIG9wYykgICAgIFwKLSAgICBDQVNFX1NJTURfU0lOR0xFX0ZQKGtpbmQs
IHBmeCwgb3BjKTogICAgIFwKLSAgICBDQVNFX1NJTURfRE9VQkxFX0ZQKGtpbmQsIHBmeCwgb3Bj
KQorICAgIENBU0VfU0lNRF9QQUNLRURfRlAoa2luZCwgcGZ4LCBvcGMpOiAgICAgXAorICAgIENB
U0VfU0lNRF9TQ0FMQVJfRlAoa2luZCwgcGZ4LCBvcGMpCiAjZGVmaW5lIENBU0VfU0lNRF9QQUNL
RURfRlAoa2luZCwgcGZ4LCBvcGMpICBcCiAgICAgY2FzZSBYODZFTVVMX09QQyMja2luZChwZngs
IG9wYyk6ICAgICAgICBcCiAgICAgY2FzZSBYODZFTVVMX09QQyMja2luZCMjXzY2KHBmeCwgb3Bj
KQogI2RlZmluZSBDQVNFX1NJTURfU0NBTEFSX0ZQKGtpbmQsIHBmeCwgb3BjKSAgXAogICAgIGNh
c2UgWDg2RU1VTF9PUEMjI2tpbmQjI19GMyhwZngsIG9wYyk6ICAgXAogICAgIGNhc2UgWDg2RU1V
TF9PUEMjI2tpbmQjI19GMihwZngsIG9wYykKKyNkZWZpbmUgQ0FTRV9TSU1EX1NJTkdMRV9GUChr
aW5kLCBwZngsIG9wYykgIFwKKyAgICBjYXNlIFg4NkVNVUxfT1BDIyNraW5kKHBmeCwgb3BjKTog
ICAgICAgIFwKKyAgICBjYXNlIFg4NkVNVUxfT1BDIyNraW5kIyNfRjMocGZ4LCBvcGMpCiAKICAg
ICBDQVNFX1NJTURfU0NBTEFSX0ZQKCwgMHgwZiwgMHgyYik6ICAgICAvKiBtb3ZudHN7cyxkfSB4
bW0sbWVtICovCiAgICAgICAgIGhvc3RfYW5kX3ZjcHVfbXVzdF9oYXZlKHNzZTRhKTsKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
