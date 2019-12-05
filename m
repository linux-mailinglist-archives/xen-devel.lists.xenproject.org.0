Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE5D1143E8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 16:44:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ictFl-00009Y-2y; Thu, 05 Dec 2019 15:41:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ictFj-00009T-Bz
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 15:41:15 +0000
X-Inumbo-ID: aab0e21e-1775-11ea-822e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aab0e21e-1775-11ea-822e-12813bfff9fa;
 Thu, 05 Dec 2019 15:41:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B0292B11E;
 Thu,  5 Dec 2019 15:41:13 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ebc609e7-ae35-6eba-d21e-2a37ef3b3894@suse.com>
Date: Thu, 5 Dec 2019 16:41:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/nEPT: ditch nept_sp_entry()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQncyBib2d1c2x5IG5vbi1zdGF0aWMuIEl0IG1ha2luZyB0aGUgY2FsbCBzaXRlcyBhY3R1YWxs
eSBsZXNzIGVhc3kgdG8KcmVhZCwgYW5kIHRoZXJlIGJlaW5nIGFub3RoZXIgb3Blbi1jb2RlZCB1
c2UgaW4gdGhlIGZpbGUgLSBsZXQncyBqdXN0CmdldCByaWQgb2YgaXQuCgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvbW0v
aGFwL25lc3RlZF9lcHQuYworKysgYi94ZW4vYXJjaC94ODYvbW0vaGFwL25lc3RlZF9lcHQuYwpA
QCAtNTQsMTEgKzU0LDYgQEAKICNkZWZpbmUgTkVQVF8yTV9FTlRSWV9GTEFHICgxIDw8IDEwKQog
I2RlZmluZSBORVBUXzRLX0VOVFJZX0ZMQUcgKDEgPDwgOSkKIAotYm9vbF90IG5lcHRfc3BfZW50
cnkoZXB0X2VudHJ5X3QgZSkKLXsKLSAgICByZXR1cm4gISEoZS5zcCk7Ci19Ci0KIHN0YXRpYyBi
b29sX3QgbmVwdF9yc3ZfYml0c19jaGVjayhlcHRfZW50cnlfdCBlLCB1aW50MzJfdCBsZXZlbCkK
IHsKICAgICB1aW50NjRfdCByc3ZfYml0cyA9IEVQVF9NVVNUX1JTVl9CSVRTOwpAQCAtNjgsNyAr
NjMsNyBAQCBzdGF0aWMgYm9vbF90IG5lcHRfcnN2X2JpdHNfY2hlY2soZXB0X2VuCiAgICAgY2Fz
ZSAxOgogICAgICAgICBicmVhazsKICAgICBjYXNlIDIgLi4uIDM6Ci0gICAgICAgIGlmICggbmVw
dF9zcF9lbnRyeShlKSApCisgICAgICAgIGlmICggZS5zcCApCiAgICAgICAgICAgICByc3ZfYml0
cyB8PSAgKCgxdWxsIDw8ICg5ICogKGxldmVsIC0gMSkpKSAtIDEpIDw8IFBBR0VfU0hJRlQ7CiAg
ICAgICAgIGVsc2UKICAgICAgICAgICAgIHJzdl9iaXRzIHw9IEVQVEVfRU1UX01BU0sgfCBFUFRF
X0lHTVRfTUFTSzsKQEAgLTE4MSw3ICsxNzYsNyBAQCBuZXB0X3dhbGtfdGFibGVzKHN0cnVjdCB2
Y3B1ICp2LCB1bnNpZ25lCiAgICAgICAgIGlmICggbmVwdF9taXNjb25maWd1cmF0aW9uX2NoZWNr
KGd3LT5seGVbbHZsXSwgbHZsKSApCiAgICAgICAgICAgICBnb3RvIG1pc2NvbmZpZ19lcnI7CiAK
LSAgICAgICAgaWYgKCAobHZsID09IDIgfHwgbHZsID09IDMpICYmIG5lcHRfc3BfZW50cnkoZ3ct
Pmx4ZVtsdmxdKSApCisgICAgICAgIGlmICggKGx2bCA9PSAyIHx8IGx2bCA9PSAzKSAmJiBndy0+
bHhlW2x2bF0uc3AgKQogICAgICAgICB7CiAgICAgICAgICAgICAvKiBHZW5lcmF0ZSBhIGZha2Ug
bDEgdGFibGUgZW50cnkgc28gY2FsbGVycyBkb24ndCBhbGwKICAgICAgICAgICAgICAqIGhhdmUg
dG8gdW5kZXJzdGFuZCBzdXBlcnBhZ2VzLiAqLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
