Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC3A114EE4
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 11:16:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idAd0-0002hk-Ps; Fri, 06 Dec 2019 10:14:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1idAcz-0002hd-BD
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 10:14:25 +0000
X-Inumbo-ID: 2d557e30-1811-11ea-b4e9-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d557e30-1811-11ea-b4e9-bc764e2007e4;
 Fri, 06 Dec 2019 10:14:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 02799B217;
 Fri,  6 Dec 2019 10:14:24 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <57491ade-fa47-5e66-47ac-a5f79de84070@suse.com>
Message-ID: <efe72f90-0fa5-d1c6-b87f-9b8e7b45b0f8@suse.com>
Date: Fri, 6 Dec 2019 11:14:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <57491ade-fa47-5e66-47ac-a5f79de84070@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/3] x86: relax LDT check in
 arch_set_info_guest()
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

SXQgaXMgd3JvbmcgZm9yIHVzIHRvIGNoZWNrIHRoZSBiYXNlIGFkZHJlc3Mgd2hlbiB0aGVyZSdz
IG5vIExEVCBpbiB0aGUKZmlyc3QgcGxhY2UuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Ci0tLQpUQkQ6IEkgYWxzbyB3b25kZXIgd2hldGhlciB3ZSB3b3Vs
ZG4ndCBiZXR0ZXIgc2V0IHYtPmFyY2gucHYubGR0X2Jhc2UgdG8KICAgICB6ZXJvIGZvciBhbiBl
bXB0eSBMRFQsIGp1c3QgbGlrZSBkb19tbXVleHRfb3AoKSBkb2VzLgoKLS0tIGEveGVuL2FyY2gv
eDg2L2RvbWFpbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwpAQCAtOTg5LDggKzk4OSw5
IEBAIGludCBhcmNoX3NldF9pbmZvX2d1ZXN0KAogICAgICAgICBmb3IgKCBpID0gMDsgIWZhaWwg
JiYgaSA8IG5yX2dkdF9mcmFtZXM7ICsraSApCiAgICAgICAgICAgICBmYWlsIHw9IHYtPmFyY2gu
cHYuZ2R0X2ZyYW1lc1tpXSAhPSBjKGdkdF9mcmFtZXNbaV0pOwogCi0gICAgICAgIGZhaWwgfD0g
di0+YXJjaC5wdi5sZHRfYmFzZSAhPSBjKGxkdF9iYXNlKTsKICAgICAgICAgZmFpbCB8PSB2LT5h
cmNoLnB2LmxkdF9lbnRzICE9IGMobGR0X2VudHMpOworICAgICAgICBpZiAoIHYtPmFyY2gucHYu
bGR0X2VudHMgKQorICAgICAgICAgICAgZmFpbCB8PSB2LT5hcmNoLnB2LmxkdF9iYXNlICE9IGMo
bGR0X2Jhc2UpOwogCiAgICAgICAgIGlmICggZmFpbCApCiAgICAgICAgICAgIHJldHVybiAtRU9Q
Tk9UU1VQUDsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
