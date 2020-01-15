Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6952F13BD66
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 11:29:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irfsy-000313-M7; Wed, 15 Jan 2020 10:26:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irfsx-00030p-D6
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 10:26:51 +0000
X-Inumbo-ID: 8a2ac1bc-3781-11ea-8504-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a2ac1bc-3781-11ea-8504-12813bfff9fa;
 Wed, 15 Jan 2020 10:26:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 306C6ABF4;
 Wed, 15 Jan 2020 10:26:49 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <39b51904-37d8-f0c0-2ad3-6a0dd7df59d7@suse.com>
Date: Wed, 15 Jan 2020 11:26:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86: refine link time stub area related
 assertion
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

V2hpbGUgaXQgaGFzIGJlZW4gbWUgdG8gaW50cm9kdWNlIHRoaXMsIHRoZSB1c2Ugb2YgfCB0aGVy
ZSBoYXMgYmVjb21lCihhbmQgcGVyaGFwcyB3YXMgZnJvbSB0aGUgdmVyeSBiZWdpbm5pbmcpIG1p
c2xlYWRpbmcuIFJhdGhlciB0aGFuCmF2b2lkaW5nIHRoZSByaWdodCBzaWRlIG9mIGl0IHdoZW4g
bGlua2luZyB0aGUgeGVuLmVmaSBpbnRlcm1lZGlhdGUgZmlsZQphdCBhIGRpZmZlcmVudCBiYXNl
IGFkZHJlc3MsIG1ha2UgdGhlIGV4cHJlc3Npb24gY29wZSB3aXRoIHRoYXQgY2FzZSwKdGh1cyB2
ZXJpZnlpbmcgcGxhY2VtZW50IG9uIGV2ZXJ5IHN0ZXAuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TCisr
KyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKQEAgLTM1MSw4ICszNTEsOCBAQCBTRUNUSU9OUwog
ICAuY29tbWVudCAwIDogeyAqKC5jb21tZW50KSB9CiB9CiAKLUFTU0VSVChfX2ltYWdlX2Jhc2Vf
XyA+IFhFTl9WSVJUX1NUQVJUIHwKLSAgICAgICBfXzJNX3J3ZGF0YV9lbmQgPD0gWEVOX1ZJUlRf
RU5EIC0gTlJfQ1BVUyAqIFBBR0VfU0laRSwKK0FTU0VSVChfXzJNX3J3ZGF0YV9lbmQgPD0gWEVO
X1ZJUlRfRU5EIC0gWEVOX1ZJUlRfU1RBUlQgKyBfX1hFTl9WSVJUX1NUQVJUIC0KKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgTlJfQ1BVUyAqIFBBR0VfU0laRSwKICAgICAgICAiWGVuIGltYWdl
IG92ZXJsYXBzIHN0dWJzIGFyZWEiKQogCiAjaWZkZWYgQ09ORklHX0tFWEVDCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
