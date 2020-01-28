Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A730414B4C0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 14:19:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwQkc-0003eo-6u; Tue, 28 Jan 2020 13:17:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwQka-0003ei-DS
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 13:17:52 +0000
X-Inumbo-ID: 961132aa-41d0-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 961132aa-41d0-11ea-8396-bc764e2007e4;
 Tue, 28 Jan 2020 13:17:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4111BAD46;
 Tue, 28 Jan 2020 13:17:51 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4c53200e-f571-a3de-cb25-6548a40bbb94@suse.com>
Date: Tue, 28 Jan 2020 14:17:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/HVM: fix PM timer I/O port range version
 check
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

WE9SLWluZyB0d28gYXJiaXRyYXJ5IG5vbi1lcXVhbCB2YWx1ZXMgbWF5IHByb2R1Y2UgMSBldmVu
IGlmIGJvdGggdmFsdWVzCmFyZSBkaWZmZXJlbnQgZnJvbSBib3RoIDAgYW5kIDEgKDIgYW5kIDMg
d291bGQgZml0LCBmb3IgZXhhbXBsZSkuIFVzZSBPUgppbnN0ZWFkLCB3aGljaCB0b2dldGhlciB3
aXRoIHRoZSBlYXJsaWVyIGJhaWxpbmcgdXBvbiBmaW5kaW5nCiJ2ZXJzaW9uID09IG9sZF92ZXJz
aW9uIiBhY2hpZXZlcyB0aGUgaW50ZW5kZWQgZWZmZWN0LgoKRml4ZXM6IGYwYWQyMWM0OTlmNyAo
Ing4NiBodm06IEludHJvZHVjZSBwbXRpbWVyX2NoYW5nZV9pb3BvcnQgYW5kIEhWTV9QQVJBTV9B
Q1BJX0lPUE9SVFNfTE9DQVRJT04iKQpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3BtdGltZXIuYworKysgYi94ZW4v
YXJjaC94ODYvaHZtL3BtdGltZXIuYwpAQCAtMzI2LDcgKzMyNiw3IEBAIGludCBwbXRpbWVyX2No
YW5nZV9pb3BvcnQoc3RydWN0IGRvbWFpbgogICAgICAgICByZXR1cm4gMDsKIAogICAgIC8qIE9u
bHkgYWxsb3cgY2hhbmdlcyBiZXR3ZWVuIHZlcnNpb25zIDAgYW5kIDEuICovCi0gICAgaWYgKCAo
dmVyc2lvbiBeIG9sZF92ZXJzaW9uKSAhPSAxICkKKyAgICBpZiAoICh2ZXJzaW9uIHwgb2xkX3Zl
cnNpb24pICE9IDEgKQogICAgICAgICByZXR1cm4gLUVJTlZBTDsKIAogICAgIGlmICggdmVyc2lv
biA9PSAxICkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
