Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3168188524
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 14:18:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEC2s-00075G-Gu; Tue, 17 Mar 2020 13:14:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lIpW=5C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEC2r-00075A-OR
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 13:14:09 +0000
X-Inumbo-ID: 2e397907-6851-11ea-b932-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e397907-6851-11ea-b932-12813bfff9fa;
 Tue, 17 Mar 2020 13:14:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B9243AC1E;
 Tue, 17 Mar 2020 13:14:06 +0000 (UTC)
To: paul@xen.org
References: <20200310174917.1514-1-paul@xen.org>
 <20200310174917.1514-6-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb08d849-bc56-336c-aedc-baca08aa1f9d@suse.com>
Date: Tue, 17 Mar 2020 14:14:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310174917.1514-6-paul@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 5/5] domain: use PGC_extra domheap page
 for shared_info
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAxODo0OSwgcGF1bEB4ZW4ub3JnIHdyb3RlOgo+IEZyb206IFBhdWwgRHVy
cmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAKPiBDdXJyZW50bHkgc2hhcmVkX2luZm8gaXMg
YSBzaGFyZWQgeGVuaGVhcCBwYWdlIGJ1dCBzaGFyZWQgeGVuaGVhcCBwYWdlcwo+IGNvbXBsaWNh
dGUgZnV0dXJlIHBsYW5zIGZvciBsaXZlLXVwZGF0ZSBvZiBYZW4gc28gaXQgaXMgZGVzaXJhYmxl
IHRvLAo+IHdoZXJlIHBvc3NpYmxlLCBub3QgdXNlIHRoZW0gWzFdLiBUaGlzIHBhdGNoIHRoZXJl
Zm9yZSBjb252ZXJ0cyBzaGFyZWRfaW5mbwo+IGludG8gYSBQR0NfZXh0cmEgZG9taGVhcCBwYWdl
LiBUaGlzIGRvZXMgZW50YWlsIGZyZWVpbmcgc2hhcmVkX2luZm8gZHVyaW5nCj4gZG9tYWluX3Jl
bGlucXVpc2hfcmVzb3VyY2VzKCkgcmF0aGVyIHRoYW4gZG9tYWluX2Rlc3Ryb3koKSBzbyBjYXJl
IGlzCj4gbmVlZGVkIHRvIGF2b2lkIGRlLXJlZmVyZW5jaW5nIGEgTlVMTCBzaGFyZWRfaW5mbyBw
b2ludGVyIGhlbmNlIHNvbWUKPiBleHRyYSBjaGVja3Mgb2YgJ2lzX2R5aW5nJyBhcmUgbmVlZGVk
LgoKSWYgdGhlcmUncyBnb2luZyB0byBiZSBhZ3JlZW1lbnQgdG8gZm9sbG93IHRoaXMgcm91dGUs
IHRoZSBpbXBsZW1lbnRhdGlvbiwKd2l0aCBhIHJlYWxseSBtaW5vciBjb3NtZXRpYyBhZGp1c3Rt
ZW50IC0gc2VlIGJlbG93IC0sIGxvb2tzIG9rYXkgdG8gbWUuCk5ldmVydGhlbGVzcyBJIGNvbnRp
bnVlIHRvIGRpc2xpa2UgdGhlIGltcGxpY2F0aW9uIGZyb20gdGhlIGV4dHJhIGNhcmUKdGhhdCdz
IG5vdyBuZWVkZWQuIEFzIEkgdGhpbmsgSSBoYXZlIHNhaWQgYmVmb3JlLCBJJ2QgbGlrZSB0byBo
YXZlIGF0CmxlYXN0IG9uZSBvdGhlciBSRVNUIG1haW50YWluZXIncyBvcGluaW9uIGhlcmUuCgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4u
Ywo+IEBAIC0yNjAsOSArMjYwLDEyIEBAIHZvaWQgZHVtcF9wYWdlZnJhbWVfaW5mbyhzdHJ1Y3Qg
ZG9tYWluICpkKQo+ICAKPiAgICAgIHBhZ2VfbGlzdF9mb3JfZWFjaCAoIHBhZ2UsICZkLT5leHRy
YV9wYWdlX2xpc3QgKQo+ICAgICAgewo+IC0gICAgICAgIHByaW50aygiICAgIEV4dHJhUGFnZSAl
cDogY2FmPSUwOGx4LCB0YWY9JSIgUFJ0eXBlX2luZm8gIlxuIiwKPiArICAgICAgICBjb25zdCBj
aGFyICp0YWcgPSBtZm5fZXEocGFnZV90b19tZm4ocGFnZSksIGQtPnNoYXJlZF9pbmZvLm1mbikg
Pwo+ICsgICAgICAgICAgICAiW1NIQVJFRCBJTkZPXSIgOiAiIjsKClBsZWFzZSBjYW4gdGhpcyBi
ZSAiIFtTSEFSRUQgSU5GT10iIHdpdGggLi4uCgo+ICsgICAgICAgIHByaW50aygiICAgIEV4dHJh
UGFnZSAlcDogY2FmPSUwOGx4LCB0YWY9JSIgUFJ0eXBlX2luZm8gIiAlc1xuIiwKCi4uLiB0aGUg
YmxhbmsgYmVmb3JlIHRoZSBmaW5hbCAlcyBkcm9wcGVkIGhlcmUsIHN1Y2ggdGhhdCB3ZSB3b24n
dApoYXZlIGEgdHJhaWxpbmcgYmxhbmsgaW4gdGhlIG91dHB1dD8KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
