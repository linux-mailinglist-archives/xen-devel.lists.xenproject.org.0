Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A0E174546
	for <lists+xen-devel@lfdr.de>; Sat, 29 Feb 2020 06:51:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7uyh-0002T4-4k; Sat, 29 Feb 2020 05:47:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SGyo=4R=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j7uyf-0002Sz-Rc
 for xen-devel@lists.xenproject.org; Sat, 29 Feb 2020 05:47:53 +0000
X-Inumbo-ID: 0686f2a0-5ab7-11ea-9ae8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0686f2a0-5ab7-11ea-9ae8-12813bfff9fa;
 Sat, 29 Feb 2020 05:47:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6CE3AFC6;
 Sat, 29 Feb 2020 05:47:51 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20200228171348.21864-1-jgross@suse.com>
 <50a31456-80f3-8308-479f-2a0d522ad518@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9b2088ef-8545-9b93-e3d7-bec41ed56407@suse.com>
Date: Sat, 29 Feb 2020 06:47:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <50a31456-80f3-8308-479f-2a0d522ad518@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: make sure stop_machine_run() is
 always called in a tasklet
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAgMjA6MDYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjgvMDIvMjAyMCAx
NzoxMywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gQEAgLTcwMCw2ICs2ODgsMzIgQEAgaW50IG1p
Y3JvY29kZV91cGRhdGUoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTShjb25zdF92b2lkKSBidWYsIHVu
c2lnbmVkIGxvbmcgbGVuKQo+PiAgICAgICByZXR1cm4gcmV0Owo+PiAgIH0KPj4gICAKPj4gK2lu
dCBtaWNyb2NvZGVfdXBkYXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY29uc3Rfdm9pZCkgYnVm
LCB1bnNpZ25lZCBsb25nIGxlbikKPj4gK3sKPj4gKyAgICBpbnQgcmV0Owo+PiArICAgIHN0cnVj
dCB1Y29kZV9idWYgKmJ1ZmZlcjsKPj4gKwo+PiArICAgIGlmICggbGVuICE9ICh1aW50MzJfdCls
ZW4gKQo+PiArICAgICAgICByZXR1cm4gLUUyQklHOwo+PiArCj4+ICsgICAgaWYgKCBtaWNyb2Nv
ZGVfb3BzID09IE5VTEwgKQo+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gKwo+PiArICAg
IGJ1ZmZlciA9IHhtYWxsb2NfZmxleF9zdHJ1Y3Qoc3RydWN0IHVjb2RlX2J1ZiwgYnVmZmVyLCBs
ZW4pOwo+PiArICAgIGlmICggIWJ1ZmZlciApCj4+ICsgICAgICAgIHJldHVybiAtRU5PTUVNOwo+
PiArCj4+ICsgICAgcmV0ID0gY29weV9mcm9tX2d1ZXN0KGJ1ZmZlci0+YnVmZmVyLCBidWYsIGxl
bik7Cj4+ICsgICAgaWYgKCByZXQgKQo+PiArICAgIHsKPj4gKyAgICAgICAgeGZyZWUoYnVmZmVy
KTsKPj4gKyAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4+ICsgICAgfQo+PiArICAgIGJ1ZmZlci0+
bGVuID0gbGVuOwo+PiArCj4+ICsgICAgcmV0dXJuIGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUo
MCwgbWljcm9jb2RlX3VwZGF0ZV9oZWxwZXIsIGJ1ZmZlcik7Cj4gCj4gQW55IHJlYXNvbiB3aHkg
Y3B1IDAgaGVyZT/CoCBUaGVyZSBpcyBubyByZXN0cmljdGlvbiBhdCB0aGUgbW9tZW50LCBhbmQK
PiBydW5uaW5nIHRoZSB0YXNrbGV0IG9uIHRoZSBjdXJyZW50IENQVSBpcyBzdXJlbHkgYmV0dGVy
IHRoYW4gcG9raW5nCj4gQ1BVMCdzIHRhc2tsZXQgcXVldWUgcmVtb3RlbHksIHRoZW4gaW50ZXJy
dXB0aW5nIGl0LgoKQXMgc3RvcF9tYWNoaW5lX3J1bigpIGlzIHNjaGVkdWxpbmcgYSB0YXNrbGV0
IG9uIGFsbCBvdGhlciBjcHVzIGl0CmRvZXNuJ3QgcmVhbGx5IG1hdHRlci4gSW4gdGhlIGVuZCBJ
IGRvbid0IHJlYWxseSBtaW5kIGVpdGhlciB3YXkuCgo+IAo+IEV2ZXJ5dGhpbmcgZWxzZSBsb29r
cyBvay7CoCBUaGlzIGFkanVzdG1lbnRzIGNvdWxkIGJlIGRvbmUgb24gY29tbWl0IHRvCj4gc2F2
ZSBhIHY0Lgo+IAo+IH5BbmRyZXcKPiAKPiBQLlMuIE1pZ2h0IGl0IGJlIHNlbnNpYmxlIHRvIGhh
dmUgYSBjb250aW51ZV9oeXBlcmNhbGxfaW5fdGFza2xldCgpCj4gd3JhcHBlciB3aGljaCBwYXNz
ZXMgc21wX3Byb2Nlc3Nvcl9pZCgpIGludG8gY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgpPwoK
V2hlbiBhIHNlY29uZCB1c2VyIGlzIGNvbWluZyB1cCwgbWF5YmUuCgpUaGUgb3RoZXIgd291bGQg
YmUgY29udGludWVfaHlwZXJjYWxsX29uX2Jvb3RjcHUoKS4KCgpKdWVyZ2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
