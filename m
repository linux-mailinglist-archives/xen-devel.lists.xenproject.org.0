Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB5614B7DA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 15:20:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRgg-0001Do-Oy; Tue, 28 Jan 2020 14:17:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwRgf-0001Db-Ah
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:17:53 +0000
X-Inumbo-ID: f85148e4-41d8-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f85148e4-41d8-11ea-ad98-bc764e2007e4;
 Tue, 28 Jan 2020 14:17:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B5E42B309;
 Tue, 28 Jan 2020 14:17:51 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200128125216.709-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <036b773e-08c0-a85d-3761-e833492278e3@suse.com>
Date: Tue, 28 Jan 2020 15:10:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200128125216.709-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/apic: Improve current_local_apic_mode()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAxMzo1MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBib290X2NwdV9oYXMo
WDg2X0ZFQVRVUkVfWDJBUElDKSBkb2Vzbid0IG5lZWQgY2hlY2tpbmcgdG8gaW50ZXJwcmV0Cj4g
QVBJQ19CQVNFX0VYVEQuCgpIbW0sIHRoZSBjb21tZW50IHlvdSByZW1vdmUgLi4uCgo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9hcGljLmMKPiArKysgYi94ZW4vYXJjaC94ODYvYXBpYy5jCj4gQEAgLTE1
MzQsMTggKzE1MzQsMTQgQEAgdm9pZCBfX2luaXQgcmVjb3JkX2Jvb3RfQVBJQ19tb2RlKHZvaWQp
Cj4gIC8qIExvb2sgYXQgdGhlIGJpdHMgaW4gTVNSX0FQSUNfQkFTRSBhbmQgd29yayBvdXQgd2hp
Y2ggQVBJQyBtb2RlIHdlIGFyZSBpbiAqLwo+ICBlbnVtIGFwaWNfbW9kZSBjdXJyZW50X2xvY2Fs
X2FwaWNfbW9kZSh2b2lkKQo+ICB7Cj4gLSAgICB1NjQgbXNyX2NvbnRlbnRzOwo+ICsgICAgdWlu
dDMyX3QgaGlnaCwgbG93Owo+ICAKPiAtICAgIHJkbXNybChNU1JfQVBJQ19CQVNFLCBtc3JfY29u
dGVudHMpOwo+ICsgICAgcmRtc3IoTVNSX0FQSUNfQkFTRSwgbG93LCBoaWdoKTsKPiAgCj4gLSAg
ICAvKiBSZWFkaW5nIEVYVEQgYml0IGZyb20gdGhlIE1TUiBpcyBvbmx5IHZhbGlkIGlmIENQVUlE
Cj4gLSAgICAgKiBzYXlzIHNvLCBlbHNlIHJlc2VydmVkICovCgouLi4gc3RhdGVzIHRoZSBzaXR1
YXRpb24gY29ycmVjdGx5LCBJIHRoaW5rLiBJIGd1ZXNzIHRoZXJlJ3Mgbm8gaGFyZHdhcmUKYWxs
b3dpbmcgdGhlIGJpdCB0byBiZSBzZXQgd2l0aG91dCB0aGUgZmVhdHVyZSBiZWluZyB0aGVyZSwg
YnV0IGEgdmlydHVhbApvciBlbXVsYXRlZCBlbnZpcm9ubWVudCBjb3VsZCBnbyBhbmQgc2V0IHRo
ZSBiaXQgd2l0aG91dCB2aW9sYXRpbmcgYW55CnNwZWNpZmljYXRpb24sIGFzIGxvbmcgYXMgdGhl
IENQVUlEIGJpdCBpcyBjbGVhci4gKEFmYWljdCB3ZSBzdGlsbCBhbGxvdwpQViBndWVzdHMgdG8g
c2VlIHRoZSBob3N0IE1TUl9BUElDX0JBU0UgY29udGVudHMsIHlldCBzdWNoIGd1ZXN0cwp3b3Vs
ZG4ndCBzZWUgdGhlIENQVUlEIGZsYWcgc2V0LiBXZSd2ZSBoYWQgYSBjdXN0b21lciBpbmZlcnJp
bmcgZnJvbSB0aGUKc2V0IGJpdCBpbiB0aGUgTVNSIHRoYXQgdGhlIG90aGVyIHgyQVBJQyBbaG9z
dF0gTVNScyBjYW4gYWxzbyBiZSByZWFkLgpUaGV5IHdvdWxkbid0IGhhdmUgcnVuIGludG8gdGhl
aXIgaXNzdWUgaWYgdGhleSBoYWQgZm9sbG93ZWQgaXRzCiJyZXNlcnZlZCIgc2VtYW50aWNzIGlu
IHN1Y2ggYSBjYXNlLikgSSBndWVzcyBJJ20gbWlzc2luZyBzb21lIGZ1cnRoZXIKYXNwZWN0IGhl
cmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
