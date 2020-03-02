Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC88B175696
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 10:08:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8h1m-0001jb-LW; Mon, 02 Mar 2020 09:06:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j8h1k-0001jW-O7
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 09:06:16 +0000
X-Inumbo-ID: 123b6ffe-5c65-11ea-8e51-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 123b6ffe-5c65-11ea-8e51-bc764e2007e4;
 Mon, 02 Mar 2020 09:06:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EF673AD12;
 Mon,  2 Mar 2020 09:06:14 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200228171348.21864-1-jgross@suse.com>
 <50a31456-80f3-8308-479f-2a0d522ad518@citrix.com>
 <9b2088ef-8545-9b93-e3d7-bec41ed56407@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <944f4772-02cb-d5ad-cfbd-884c25341380@suse.com>
Date: Mon, 2 Mar 2020 10:06:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9b2088ef-8545-9b93-e3d7-bec41ed56407@suse.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDIuMjAyMCAwNjo0NywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyOC4wMi4yMCAy
MDowNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjgvMDIvMjAyMCAxNzoxMywgSnVlcmdl
biBHcm9zcyB3cm90ZToKPj4+IEBAIC03MDAsNiArNjg4LDMyIEBAIGludCBtaWNyb2NvZGVfdXBk
YXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY29uc3Rfdm9pZCkgYnVmLCB1bnNpZ25lZCBsb25n
IGxlbikKPj4+ICAgICAgIHJldHVybiByZXQ7Cj4+PiAgIH0KPj4+ICAgCj4+PiAraW50IG1pY3Jv
Y29kZV91cGRhdGUoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTShjb25zdF92b2lkKSBidWYsIHVuc2ln
bmVkIGxvbmcgbGVuKQo+Pj4gK3sKPj4+ICsgICAgaW50IHJldDsKPj4+ICsgICAgc3RydWN0IHVj
b2RlX2J1ZiAqYnVmZmVyOwo+Pj4gKwo+Pj4gKyAgICBpZiAoIGxlbiAhPSAodWludDMyX3QpbGVu
ICkKPj4+ICsgICAgICAgIHJldHVybiAtRTJCSUc7Cj4+PiArCj4+PiArICAgIGlmICggbWljcm9j
b2RlX29wcyA9PSBOVUxMICkKPj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4gKwo+Pj4g
KyAgICBidWZmZXIgPSB4bWFsbG9jX2ZsZXhfc3RydWN0KHN0cnVjdCB1Y29kZV9idWYsIGJ1ZmZl
ciwgbGVuKTsKPj4+ICsgICAgaWYgKCAhYnVmZmVyICkKPj4+ICsgICAgICAgIHJldHVybiAtRU5P
TUVNOwo+Pj4gKwo+Pj4gKyAgICByZXQgPSBjb3B5X2Zyb21fZ3Vlc3QoYnVmZmVyLT5idWZmZXIs
IGJ1ZiwgbGVuKTsKPj4+ICsgICAgaWYgKCByZXQgKQo+Pj4gKyAgICB7Cj4+PiArICAgICAgICB4
ZnJlZShidWZmZXIpOwo+Pj4gKyAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4+PiArICAgIH0KPj4+
ICsgICAgYnVmZmVyLT5sZW4gPSBsZW47Cj4+PiArCj4+PiArICAgIHJldHVybiBjb250aW51ZV9o
eXBlcmNhbGxfb25fY3B1KDAsIG1pY3JvY29kZV91cGRhdGVfaGVscGVyLCBidWZmZXIpOwo+Pgo+
PiBBbnkgcmVhc29uIHdoeSBjcHUgMCBoZXJlP8KgIFRoZXJlIGlzIG5vIHJlc3RyaWN0aW9uIGF0
IHRoZSBtb21lbnQsIGFuZAo+PiBydW5uaW5nIHRoZSB0YXNrbGV0IG9uIHRoZSBjdXJyZW50IENQ
VSBpcyBzdXJlbHkgYmV0dGVyIHRoYW4gcG9raW5nCj4+IENQVTAncyB0YXNrbGV0IHF1ZXVlIHJl
bW90ZWx5LCB0aGVuIGludGVycnVwdGluZyBpdC4KPiAKPiBBcyBzdG9wX21hY2hpbmVfcnVuKCkg
aXMgc2NoZWR1bGluZyBhIHRhc2tsZXQgb24gYWxsIG90aGVyIGNwdXMgaXQKPiBkb2Vzbid0IHJl
YWxseSBtYXR0ZXIuIEluIHRoZSBlbmQgSSBkb24ndCByZWFsbHkgbWluZCBlaXRoZXIgd2F5LgoK
SSB0aGluayBhbnkgY2FzZSB3aGVyZSB3ZSBjYW4gYXZvaWQgYXNzaWduaW5nIHNwZWNpYWwgbWVh
bmluZwp0byBDUFUgMCBpcyBoZWxwZnVsLiBXaGlsZSB3ZSB3b24ndCBnZXQgdG8gYmVpbmcgYWJs
ZSB0byBvZmZsaW5lCnRoZSBCU1AgYW55IHRpbWUgc29vbiwgd2Ugc2hvdWxkbid0IHB1dCBtb3Jl
IHJvYWQgYmxvY2tzIG9uIHRoZQpwYXRoIHRoZXJlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
