Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7423BA3118
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 09:34:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3bN1-00019D-E2; Fri, 30 Aug 2019 07:30:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3bN0-000198-2X
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 07:30:54 +0000
X-Inumbo-ID: 18e5ad28-caf8-11e9-ae7b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18e5ad28-caf8-11e9-ae7b-12813bfff9fa;
 Fri, 30 Aug 2019 07:30:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 64AEBB03B;
 Fri, 30 Aug 2019 07:30:52 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-16-git-send-email-chao.gao@intel.com>
 <e5eae8a9-1348-45a3-6f2b-b3bf75077312@suse.com>
 <20190830063326.GC31905@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c26da02e-46b9-7521-4be4-f2d9bf8c3dc1@suse.com>
Date: Fri, 30 Aug 2019 09:30:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830063326.GC31905@gao-cwp>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMjAxOSAwODozMywgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gVGh1LCBBdWcgMjksIDIw
MTkgYXQgMDI6MjI6NDdQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE5LjA4LjIw
MTkgMDM6MjUsIENoYW8gR2FvIHdyb3RlOgo+Pj4gQEAgLTQ4MSwxMiArNDc4LDI4IEBAIHN0YXRp
YyBpbnQgZG9fbWljcm9jb2RlX3VwZGF0ZSh2b2lkICpwYXRjaCkKPj4+ICAgICAgcmV0dXJuIHJl
dDsKPj4+ICB9Cj4+PiAgCj4+PiArc3RhdGljIGludCBtaWNyb2NvZGVfbm1pX2NhbGxiYWNrKGNv
bnN0IHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCBpbnQgY3B1KQo+Pj4gK3sKPj4+ICsgICAg
LyogVGhlIGZpcnN0IHRocmVhZCBvZiBhIGNvcmUgaXMgdG8gbG9hZCBhbiB1cGRhdGUuIERvbid0
IGJsb2NrIGl0LiAqLwo+Pj4gKyAgICBpZiAoIGNwdSA9PSBjcHVtYXNrX2ZpcnN0KHBlcl9jcHUo
Y3B1X3NpYmxpbmdfbWFzaywgY3B1KSkgfHwKPj4+ICsgICAgICAgICBsb2FkaW5nX3N0YXRlICE9
IExPQURJTkdfQ0FMTElOICkKPj4+ICsgICAgICAgIHJldHVybiAwOwo+Pj4gKwo+Pj4gKyAgICBj
cHVtYXNrX3NldF9jcHUoY3B1LCAmY3B1X2NhbGxpbl9tYXApOwo+Pj4gKwo+Pj4gKyAgICB3aGls
ZSAoIGxvYWRpbmdfc3RhdGUgIT0gTE9BRElOR19FWElUICkKPj4+ICsgICAgICAgIGNwdV9yZWxh
eCgpOwo+Pj4gKwo+Pj4gKyAgICByZXR1cm4gMDsKPj4+ICt9Cj4+Cj4+IEJ5IHJldHVybmluZyAw
IHlvdSB0ZWxsIGRvX25taSgpIHRvIGNvbnRpbnVlIHByb2Nlc3NpbmcgdGhlIE5NSS4KPj4gU2lu
Y2UgeW91IGNhbid0IHRlbGwgd2hldGhlciBhIG5vbi1JUEkgTk1JIGhhcyBzdXJmYWNlZCBhdCBh
Ym91dAo+PiB0aGUgc2FtZSB0aW1lIHRoaXMgaXMgZ2VuZXJhbGx5IHRoZSByaWdodCB0aGluZyBp
bW8sIGJ1dCBob3cgZG8KPj4geW91IHByZXZlbnQgdW5rbm93bl9ubWlfZXJyb3IoKSBmcm9tIGdl
dHRpbmcgZW50ZXJlZCB3aGVuIGRvX25taSgpCj4+IGVuZHMgdXAgc2V0dGluZyBoYW5kbGVfdW5r
bm93biB0byB0cnVlPyAoVGhlIHF1ZXN0aW9uIGlzIG1vc3RseQo+PiByaGV0b3JpY2FsLCBidXQg
dGhlcmUncyBhIGRpc2Nvbm5lY3QgYmV0d2VlbiBkb19ubWkoKSBjaGVja2luZwo+PiAiY3B1ID09
IDAiIGFuZCB0aGUgY29udHJvbCB0aHJlYWQgcnVubmluZyBvbgo+PiBjcHVtYXNrX2ZpcnN0KCZj
cHVfb25saW5lX21hcCksIGkuZS4geW91IGludHJvZHVjZSBhIHdlbGwgaGlkZGVuCj4+IGRlcGVu
ZGVuY3kgb24gQ1BVIDAgbmV2ZXIgZ29pbmcgb2ZmbGluZS4gSU9XIG15IHJlcXVlc3QgaXMgdG8g
YXQKPj4gbGVhc3QgbWFrZSB0aGlzIGxlc3Mgd2VsbCBoaWRkZW4sIHN1Y2ggdGhhdCBpdCBjYW4g
YmUgbm90aWNlZCBpZgo+PiBhbmQgd2hlbiBzb21lb25lIGVuZGVhdm9ycyB0byByZW1vdmUgc2Fp
ZCBsaW1pdGF0aW9uLikKPiAKPiBTZWVtcyB0aGUgaXNzdWUgaXMgdGhhdCB3ZSBjb3VsZG4ndCBz
ZW5kIElQSSBOTUkgdG8gQlNQLCBvdGhlcndpc2UKPiB1bmtub3duX25taV9lcnJvcigpIHdvdWxk
IGJlIHRyaWdnZXIuIEFuZCBsb2FkaW5nIHVjb2RlIGFmdGVyCj4gcmVuZGV6dm91c2luZyBhbGwg
Q1BVcyBpbiBOTUkgaGFuZGxlciBleHBlY3RzIGFsbCBDUFVzIHRvIHJlY2VpdmUgSVBJCj4gTk1J
LiBTbyB0aGlzIGFwcHJvYWNoIGFsd2F5cyBoYXMgc3VjaCBpc3N1ZS4KCk5vdCByZWFsbHksIEkg
ZG9uJ3QgdGhpbms6IElmIGJvdGggc2lkZXMgYWdyZWVkIChleHBsaWNpdGx5ISkgb24gd2hpY2gK
Q1BVIGxlYWRzIHRoaXMgZWZmb3J0LCB0aGVuIGl0IHdvdWxkIGJlIGNsZWFyIHRoYXQgdGhlIG9u
ZSBDUFUKaGFuZGxpbmcgTk1JcyBjb21pbmcgZnJvbSB0aGUgcGxhdGZvcm0gc2hvdWxkIG5vdCBi
ZSBzZW50IGFuIE5NSSwgYW5kCmhlbmNlIGl0IHNob3VsZCBiZSB0aGlzIG9uZSB0byBsZWFkIHRo
ZSBlZmZvcnQuIEZBT0QgLSBteSByZW1hcmsgcmVhbGx5CndhcyBiZWNhdXNlIG9mIHRoZSBuZXcg
aGlkZGVuKCEpIGRlcGVuZGVuY3kgeW91IGludHJvZHVjZSBvbiBDUFUgMAphbHdheXMgYmVpbmcg
dGhpcyAic3BlY2lhbCIgQ1BVLiBJIGRvbid0IGV4cGVjdCB5b3UgdG8gY2hhbmdlIHRoZSBjb2Rl
LApidXQgSSdkIGxpa2UgeW91IHRvIG1ha2UgdGhlIGN1cnJlbnRseSBoaWRkZW4gZGVwZW5kZW5j
eSBleHBsaWNpdC4KCj4gQ29uc2lkZXJpbmcgc2VsZl9ubWkgaXMgY2FsbGVkIGF0IGFub3RoZXIg
cGxhY2UsIGNvdWxkIHdlIHByb3ZpZGUgYQo+IHdheSB0byB0ZW1wb3JhcmlseSBzdXBwcmVzcyBv
ciAoZm9yY2UpIGlnbm9yZSB1bmtub3duIG5taSBlcnJvcj8KCkknbSBhZnJhaWQgYW55IGF0dGVt
cHQgYXQgZG9pbmcgc28gd2lsbCBsZWF2ZSByb29tIGZvciBtaXNzaW5nIGFuCmFjdHVhbCAocGxh
dGZvcm0pIE5NSS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
