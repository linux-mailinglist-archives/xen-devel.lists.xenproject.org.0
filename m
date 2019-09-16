Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9592B3782
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 11:50:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9nbz-0004wv-Ey; Mon, 16 Sep 2019 09:47:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9nbx-0004wl-J5
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 09:47:57 +0000
X-Inumbo-ID: 0f2f2ac7-d867-11e9-95d9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f2f2ac7-d867-11e9-95d9-12813bfff9fa;
 Mon, 16 Sep 2019 09:47:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B7EA6ACBD;
 Mon, 16 Sep 2019 09:47:55 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
Message-ID: <b05e5bf3-ed23-cb07-638e-05101210645c@suse.com>
Date: Mon, 16 Sep 2019 11:48:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 1/2] x86emul: treat Hygon guests like AMD ones
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

Rm9yIHNvbWUgcmVhc29uIHRoZSBIeWdvbiBlbmFibGluZyBzZXJpZXMgbGVmdCBvdXQgdGhlIGlu
c24gZW11bGF0b3IuCk1ha2UgYXBwcm9wcmlhdGUgYWRqdXN0bWVudHMgd2hlcmV2ZXIgd2UndmUg
YmVlbiBzcGVjaWFsIGNhc2luZyBBTUQuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxh
dGUuYworKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwpAQCAtMTk5
NSw3ICsxOTk1LDggQEAgcHJvdG1vZGVfbG9hZF9zZWcoCiAgICAgICAgIGNhc2UgeDg2X3NlZ190
cjoKICAgICAgICAgICAgIGdvdG8gcmFpc2VfZXhuOwogICAgICAgICB9Ci0gICAgICAgIGlmICgg
Y3AtPng4Nl92ZW5kb3IgIT0gWDg2X1ZFTkRPUl9BTUQgfHwgIW9wcy0+cmVhZF9zZWdtZW50IHx8
CisgICAgICAgIGlmICggIShjcC0+eDg2X3ZlbmRvciAmIChYODZfVkVORE9SX0FNRCB8IFg4Nl9W
RU5ET1JfSFlHT04pKSB8fAorICAgICAgICAgICAgICFvcHMtPnJlYWRfc2VnbWVudCB8fAogICAg
ICAgICAgICAgIG9wcy0+cmVhZF9zZWdtZW50KHNlZywgc3JlZywgY3R4dCkgIT0gWDg2RU1VTF9P
S0FZICkKICAgICAgICAgICAgIG1lbXNldChzcmVnLCAwLCBzaXplb2YoKnNyZWcpKTsKICAgICAg
ICAgZWxzZQpAQCAtMjEyMiw3ICsyMTIzLDggQEAgcHJvdG1vZGVfbG9hZF9zZWcoCiAgICAgICAg
ICAqLwogICAgICAgICBib29sIHdpZGUgPSBkZXNjLmIgJiAweDEwMDAKICAgICAgICAgICAgICAg
ICAgICAgPyBmYWxzZSA6IChkZXNjLmIgJiAweGYwMCkgIT0gMHhjMDAgJiYKLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjcC0+eDg2X3ZlbmRvciAhPSBYODZfVkVORE9SX0FNRAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICEoY3AtPng4Nl92ZW5kb3IgJgorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKFg4Nl9WRU5ET1JfQU1EIHwgWDg2X1ZFTkRPUl9IWUdP
TikpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPyBtb2RlXzY0Yml0KCkgOiBjdHh0
LT5sbWE7CiAKICAgICAgICAgaWYgKCB3aWRlICkKQEAgLTIxNDAsNyArMjE0Miw4IEBAIHByb3Rt
b2RlX2xvYWRfc2VnKAogICAgICAgICAgICAgZGVmYXVsdDoKICAgICAgICAgICAgICAgICByZXR1
cm4gcmM7CiAgICAgICAgICAgICB9Ci0gICAgICAgICAgICBpZiAoICFtb2RlXzY0Yml0KCkgJiYg
Y3AtPng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQgJiYKKyAgICAgICAgICAgIGlmICggIW1v
ZGVfNjRiaXQoKSAmJgorICAgICAgICAgICAgICAgICAoY3AtPng4Nl92ZW5kb3IgJiAoWDg2X1ZF
TkRPUl9BTUQgfCBYODZfVkVORE9SX0hZR09OKSkgJiYKICAgICAgICAgICAgICAgICAgKGRlc2Mu
YiAmIDB4ZjAwKSAhPSAweGMwMCApCiAgICAgICAgICAgICAgICAgZGVzY19oaS5iID0gZGVzY19o
aS5hID0gMDsKICAgICAgICAgICAgIGlmICggKGRlc2NfaGkuYiAmIDB4MDAwMDFmMDApIHx8CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
