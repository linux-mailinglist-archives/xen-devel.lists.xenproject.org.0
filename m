Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED49AC02B5
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 11:54:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDmu0-0003lZ-Do; Fri, 27 Sep 2019 09:51:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDmty-0003lN-P2
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 09:51:02 +0000
X-Inumbo-ID: 4feed72a-e10c-11e9-9673-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4feed72a-e10c-11e9-9673-12813bfff9fa;
 Fri, 27 Sep 2019 09:51:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7A0BBAF16;
 Fri, 27 Sep 2019 09:51:00 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1569506015-26938-1-git-send-email-chao.gao@intel.com>
 <1569506015-26938-5-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <de6185ab-3601-bb4b-a1c2-95cdbd47dccc@suse.com>
Date: Fri, 27 Sep 2019 11:51:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569506015-26938-5-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v11 4/7] x86/microcode: Synchronize late
 microcode loading
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@suse.de>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAxNTo1MywgQ2hhbyBHYW8gd3JvdGU6Cj4gQEAgLTI2NCw0MCArMzM2LDE1
MCBAQCBzdGF0aWMgaW50IG1pY3JvY29kZV91cGRhdGVfY3B1KGNvbnN0IHN0cnVjdCBtaWNyb2Nv
ZGVfcGF0Y2ggKnBhdGNoKQo+ICAgICAgcmV0dXJuIGVycjsKPiAgfQo+ICAKPiAtc3RhdGljIGxv
bmcgZG9fbWljcm9jb2RlX3VwZGF0ZSh2b2lkICpwYXRjaCkKPiArc3RhdGljIGJvb2wgd2FpdF9m
b3Jfc3RhdGUodHlwZW9mKGxvYWRpbmdfc3RhdGUpIHN0YXRlKQo+ICB7Cj4gLSAgICB1bnNpZ25l
ZCBpbnQgY3B1Owo+IC0gICAgaW50IHJldCA9IG1pY3JvY29kZV91cGRhdGVfY3B1KHBhdGNoKTsK
PiArICAgIHR5cGVvZihsb2FkaW5nX3N0YXRlKSBjdXJfc3RhdGU7Cj4gIAo+IC0gICAgLyogU3Rv
cmUgdGhlIHBhdGNoIGFmdGVyIGEgc3VjY2Vzc2Z1bCBsb2FkaW5nICovCj4gLSAgICBpZiAoICFy
ZXQgJiYgcGF0Y2ggKQo+ICsgICAgd2hpbGUgKCAoY3VyX3N0YXRlID0gQUNDRVNTX09OQ0UobG9h
ZGluZ19zdGF0ZSkpICE9IHN0YXRlICkKCldpdGggQUNDRVNTX09OQ0UoKSB1c2VkIGhlcmUsIEkg
dGhpbmsgLi4uCgo+ICAgICAgewo+IC0gICAgICAgIHNwaW5fbG9jaygmbWljcm9jb2RlX211dGV4
KTsKPiAtICAgICAgICBtaWNyb2NvZGVfdXBkYXRlX2NhY2hlKHBhdGNoKTsKPiAtICAgICAgICBz
cGluX3VubG9jaygmbWljcm9jb2RlX211dGV4KTsKPiAtICAgICAgICBwYXRjaCA9IE5VTEw7Cj4g
KyAgICAgICAgaWYgKCBjdXJfc3RhdGUgPT0gTE9BRElOR19FWElUICkKPiArICAgICAgICAgICAg
cmV0dXJuIGZhbHNlOwo+ICsgICAgICAgIGNwdV9yZWxheCgpOwo+ICAgICAgfQo+ICAKPiAtICAg
IGlmICggbWljcm9jb2RlX29wcy0+ZW5kX3VwZGF0ZV9wZXJjcHUgKQo+IC0gICAgICAgIG1pY3Jv
Y29kZV9vcHMtPmVuZF91cGRhdGVfcGVyY3B1KCk7Cj4gKyAgICByZXR1cm4gdHJ1ZTsKPiArfQo+
ICsKPiArc3RhdGljIHZvaWQgc2V0X3N0YXRlKHVuc2lnbmVkIGludCBzdGF0ZSkKPiArewo+ICsg
ICAgbG9hZGluZ19zdGF0ZSA9IHN0YXRlOwo+ICsgICAgc21wX3dtYigpOwoKLi4uIGl0IGFsc28g
d2FudHMgdG8gYmUgdXNlZCBoZXJlIChpbnN0ZWFkIG9mIHRoZSBleHBsaWNpdCBiYXJyaWVyKS4K
V2l0aCB0aGlzICh3aGljaCBJJ2QgYmUgZmluZSB0byBiZSBhZGp1c3RlZCB3aGlsZSBjb21taXR0
aW5nKQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
