Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C17A19FE
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 14:27:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3JRz-0007Ig-9n; Thu, 29 Aug 2019 12:22:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3JRx-0007Ib-Kz
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 12:22:49 +0000
X-Inumbo-ID: b617030e-ca57-11e9-ac23-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b617030e-ca57-11e9-ac23-bc764e2007e4;
 Thu, 29 Aug 2019 12:22:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1A916AC97;
 Thu, 29 Aug 2019 12:22:47 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-16-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e5eae8a9-1348-45a3-6f2b-b3bf75077312@suse.com>
Date: Thu, 29 Aug 2019 14:22:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566177928-19114-16-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 15/15] microcode: block #NMI handling
 when loading an ucode
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDguMjAxOSAwMzoyNSwgQ2hhbyBHYW8gd3JvdGU6Cj4gQEAgLTQ4MSwxMiArNDc4LDI4
IEBAIHN0YXRpYyBpbnQgZG9fbWljcm9jb2RlX3VwZGF0ZSh2b2lkICpwYXRjaCkKPiAgICAgIHJl
dHVybiByZXQ7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgbWljcm9jb2RlX25taV9jYWxsYmFjayhj
b25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgaW50IGNwdSkKPiArewo+ICsgICAgLyog
VGhlIGZpcnN0IHRocmVhZCBvZiBhIGNvcmUgaXMgdG8gbG9hZCBhbiB1cGRhdGUuIERvbid0IGJs
b2NrIGl0LiAqLwo+ICsgICAgaWYgKCBjcHUgPT0gY3B1bWFza19maXJzdChwZXJfY3B1KGNwdV9z
aWJsaW5nX21hc2ssIGNwdSkpIHx8Cj4gKyAgICAgICAgIGxvYWRpbmdfc3RhdGUgIT0gTE9BRElO
R19DQUxMSU4gKQo+ICsgICAgICAgIHJldHVybiAwOwo+ICsKPiArICAgIGNwdW1hc2tfc2V0X2Nw
dShjcHUsICZjcHVfY2FsbGluX21hcCk7Cj4gKwo+ICsgICAgd2hpbGUgKCBsb2FkaW5nX3N0YXRl
ICE9IExPQURJTkdfRVhJVCApCj4gKyAgICAgICAgY3B1X3JlbGF4KCk7Cj4gKwo+ICsgICAgcmV0
dXJuIDA7Cj4gK30KCkJ5IHJldHVybmluZyAwIHlvdSB0ZWxsIGRvX25taSgpIHRvIGNvbnRpbnVl
IHByb2Nlc3NpbmcgdGhlIE5NSS4KU2luY2UgeW91IGNhbid0IHRlbGwgd2hldGhlciBhIG5vbi1J
UEkgTk1JIGhhcyBzdXJmYWNlZCBhdCBhYm91dAp0aGUgc2FtZSB0aW1lIHRoaXMgaXMgZ2VuZXJh
bGx5IHRoZSByaWdodCB0aGluZyBpbW8sIGJ1dCBob3cgZG8KeW91IHByZXZlbnQgdW5rbm93bl9u
bWlfZXJyb3IoKSBmcm9tIGdldHRpbmcgZW50ZXJlZCB3aGVuIGRvX25taSgpCmVuZHMgdXAgc2V0
dGluZyBoYW5kbGVfdW5rbm93biB0byB0cnVlPyAoVGhlIHF1ZXN0aW9uIGlzIG1vc3RseQpyaGV0
b3JpY2FsLCBidXQgdGhlcmUncyBhIGRpc2Nvbm5lY3QgYmV0d2VlbiBkb19ubWkoKSBjaGVja2lu
ZwoiY3B1ID09IDAiIGFuZCB0aGUgY29udHJvbCB0aHJlYWQgcnVubmluZyBvbgpjcHVtYXNrX2Zp
cnN0KCZjcHVfb25saW5lX21hcCksIGkuZS4geW91IGludHJvZHVjZSBhIHdlbGwgaGlkZGVuCmRl
cGVuZGVuY3kgb24gQ1BVIDAgbmV2ZXIgZ29pbmcgb2ZmbGluZS4gSU9XIG15IHJlcXVlc3QgaXMg
dG8gYXQKbGVhc3QgbWFrZSB0aGlzIGxlc3Mgd2VsbCBoaWRkZW4sIHN1Y2ggdGhhdCBpdCBjYW4g
YmUgbm90aWNlZCBpZgphbmQgd2hlbiBzb21lb25lIGVuZGVhdm9ycyB0byByZW1vdmUgc2FpZCBs
aW1pdGF0aW9uLikKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
