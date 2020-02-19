Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BCB163EAE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 09:15:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4KTY-0000GN-0l; Wed, 19 Feb 2020 08:12:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4KTW-0000G1-IF
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 08:12:54 +0000
X-Inumbo-ID: 9eaa7428-52ef-11ea-8307-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9eaa7428-52ef-11ea-8307-12813bfff9fa;
 Wed, 19 Feb 2020 08:12:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CFD5AB25F;
 Wed, 19 Feb 2020 08:12:49 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e00dc93-e711-9070-1da0-1d4243753a8e@suse.com>
Date: Wed, 19 Feb 2020 09:12:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86: "spec-ctrl=no-xen" should also disable
 branch hardening
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jin Nan Wang <jnwang@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBjb250cm9sbGluZyBYZW4gYmVoYXZpb3IgYWxvbmUsIGFmdGVyIGFsbC4KClJlcG9y
dGVkLWJ5OiBKaW4gTmFuIFdhbmcgPGpud2FuZ0BzdXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L3NwZWNfY3Ry
bC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zcGVjX2N0cmwuYwpAQCAtOTgsOCArOTgsNiBAQCBzdGF0
aWMgaW50IF9faW5pdCBwYXJzZV9zcGVjX2N0cmwoY29uc3QKICAgICAgICAgICAgIGlmICggb3B0
X3B2X2wxdGZfZG9tdSA8IDAgKQogICAgICAgICAgICAgICAgIG9wdF9wdl9sMXRmX2RvbXUgPSAw
OwogCi0gICAgICAgICAgICBvcHRfYnJhbmNoX2hhcmRlbiA9IGZhbHNlOwotCiAgICAgICAgICAg
ICBpZiAoIG9wdF90c3ggPT0gLTEgKQogICAgICAgICAgICAgICAgIG9wdF90c3ggPSAtMzsKIApA
QCAtMTE0LDYgKzExMiw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX3NwZWNfY3RybChjb25z
dAogICAgICAgICAgICAgb3B0X2licGIgPSBmYWxzZTsKICAgICAgICAgICAgIG9wdF9zc2JkID0g
ZmFsc2U7CiAgICAgICAgICAgICBvcHRfbDFkX2ZsdXNoID0gMDsKKyAgICAgICAgICAgIG9wdF9i
cmFuY2hfaGFyZGVuID0gZmFsc2U7CiAgICAgICAgIH0KICAgICAgICAgZWxzZSBpZiAoIHZhbCA+
IDAgKQogICAgICAgICAgICAgcmMgPSAtRUlOVkFMOwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
