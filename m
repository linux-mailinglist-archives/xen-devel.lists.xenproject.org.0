Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E751345CB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:08:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipCue-0001WX-5A; Wed, 08 Jan 2020 15:06:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipCuc-0001WS-23
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:06:22 +0000
X-Inumbo-ID: 68e0caaa-3228-11ea-b1f0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68e0caaa-3228-11ea-b1f0-bc764e2007e4;
 Wed, 08 Jan 2020 15:06:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5E124ADE0;
 Wed,  8 Jan 2020 15:06:12 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a8f9db8d-6897-fdf6-11e0-2ba59f246175@suse.com>
Date: Wed, 8 Jan 2020 16:06:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/MCE: avoid leaking stack data
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
 Ilja Van Sprundel <ivansprundel@ioactive.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgSFlQRVJWSVNPUl9tY2EgaXMgYSBwcml2aWxlZ2VkIG9wZXJhdGlvbiwgd2Ugc3RpbGwg
c2hvdWxkbid0IGxlYWsKc3RhY2sgY29udGVudHMgKHRoZSB0YWlsIG9mIGV2ZXJ5IGFycmF5IGVu
dHJ5J3MgbWNfbXNydmFsdWVzW10gb2YKWEVOX01DX3BoeXNjcHVpbmZvIG91dHB1dCkuIFNpbXBs
eSB1c2UgYSB6ZXJvaW5nIGFsbG9jYXRpb24gaGVyZS4KClRha2UgdGhlIG9jY2FzaW9uIGFuZCBh
bHNvIHJlc3RyaWN0IHRoZSBpbnZvbHZlZCBsb2NhbCB2YXJpYWJsZSdzIHNjb3BlLgoKUmVwb3J0
ZWQtYnk6IElsamEgVmFuIFNwcnVuZGVsIDxpdmFuc3BydW5kZWxAaW9hY3RpdmUuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJj
aC94ODYvY3B1L21jaGVjay9tY2UuYworKysgYi94ZW4vYXJjaC94ODYvY3B1L21jaGVjay9tY2Uu
YwpAQCAtMTM1Miw3ICsxMzUyLDYgQEAgbG9uZyBkb19tY2EoWEVOX0dVRVNUX0hBTkRMRV9QQVJB
TSh4ZW5fbQogICAgIH0gbWNfcGh5c2NwdWluZm87CiAgICAgdWludDMyX3QgZmxhZ3MsIGNtZGZs
YWdzOwogICAgIGludCBubGNwdTsKLSAgICB4ZW5fbWNfbG9naWNhbF9jcHVfdCAqbG9nX2NwdXMg
PSBOVUxMOwogICAgIG1jdGVsZW1fY29va2llX3QgbWN0YzsKICAgICBtY3RlbGVtX2NsYXNzX3Qg
d2hpY2g7CiAgICAgdW5zaWduZWQgaW50IHRhcmdldDsKQEAgLTE0NDUsMTEgKzE0NDQsMTMgQEAg
bG9uZyBkb19tY2EoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fbQogICAgICAgICAgICAgID8g
IWd1ZXN0X2hhbmRsZV9pc19udWxsKG1jX3BoeXNjcHVpbmZvLm5hdC0+aW5mbykKICAgICAgICAg
ICAgICA6ICFjb21wYXRfaGFuZGxlX2lzX251bGwobWNfcGh5c2NwdWluZm8uY21wLT5pbmZvKSAp
CiAgICAgICAgIHsKKyAgICAgICAgICAgIHhlbl9tY19sb2dpY2FsX2NwdV90ICpsb2dfY3B1czsK
KwogICAgICAgICAgICAgaWYgKCBtY19waHlzY3B1aW5mby5uYXQtPm5jcHVzIDw9IDAgKQogICAg
ICAgICAgICAgICAgIHJldHVybiB4ODZfbWNlcnIoImRvX21jYSBjcHVpbmZvOiBuY3B1cyA8PSAw
IiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC1FSU5WQUwpOwogICAgICAgICAg
ICAgbmxjcHUgPSBtaW4obmxjcHUsIChpbnQpbWNfcGh5c2NwdWluZm8ubmF0LT5uY3B1cyk7Ci0g
ICAgICAgICAgICBsb2dfY3B1cyA9IHhtYWxsb2NfYXJyYXkoeGVuX21jX2xvZ2ljYWxfY3B1X3Qs
IG5sY3B1KTsKKyAgICAgICAgICAgIGxvZ19jcHVzID0geHphbGxvY19hcnJheSh4ZW5fbWNfbG9n
aWNhbF9jcHVfdCwgbmxjcHUpOwogICAgICAgICAgICAgaWYgKCBsb2dfY3B1cyA9PSBOVUxMICkK
ICAgICAgICAgICAgICAgICByZXR1cm4geDg2X21jZXJyKCJkb19tY2EgY3B1aW5mbyIsIC1FTk9N
RU0pOwogICAgICAgICAgICAgb25fZWFjaF9jcHUoZG9fbWNfZ2V0X2NwdV9pbmZvLCBsb2dfY3B1
cywgMSk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
