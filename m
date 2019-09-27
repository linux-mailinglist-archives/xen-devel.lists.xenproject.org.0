Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B260DC05F3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 15:04:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpsd-0003bc-BV; Fri, 27 Sep 2019 13:01:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tE9W=XW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDpsb-0003bP-WA
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 13:01:50 +0000
X-Inumbo-ID: f773a6a0-e126-11e9-9678-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id f773a6a0-e126-11e9-9678-12813bfff9fa;
 Fri, 27 Sep 2019 13:01:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B4531000;
 Fri, 27 Sep 2019 06:01:48 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E0003F67D;
 Fri, 27 Sep 2019 06:01:47 -0700 (PDT)
To: hongyax@amazon.com, Wei Liu <wl@xen.org>
References: <cover.1569489002.git.hongyax@amazon.com>
 <ccabf9b1ce3142ca65e453ec9a5ae1d34d28a992.1569489002.git.hongyax@amazon.com>
 <20190926142657.mc3y7i4ovz6hvua6@debian>
 <7d68a0dc-d101-1823-5d8b-89e1b4a5f6fb@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d04dc485-d268-a1ce-3138-9d92abbbd173@arm.com>
Date: Fri, 27 Sep 2019 14:01:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7d68a0dc-d101-1823-5d8b-89e1b4a5f6fb@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 71/84] x86/setup: start tearing down the
 direct map.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNy8wOS8yMDE5IDEzOjU0LCBob25neWF4QGFtYXpvbi5jb20gd3JvdGU6Cj4gT24g
MjYvMDkvMjAxOSAxNToyNiwgV2VpIExpdSB3cm90ZToKPj4gT24gVGh1LCBTZXAgMjYsIDIwMTkg
YXQgMTA6NDY6MzRBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24uY29tIHdyb3RlOgo+Pj4gRnJvbTog
SG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBI
b25neWFuIFhpYSA8aG9uZ3lheEBhbWF6b24uY29tPgo+Pj4gLS0tCj4+PiDCoCB4ZW4vYXJjaC94
ODYvc2V0dXAuY8KgwqDCoCB8IDQgKystLQo+Pj4gwqAgeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMg
fCAyICstCj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJj
aC94ODYvc2V0dXAuYwo+Pj4gaW5kZXggZTk2NGMwMzJmNi4uM2RjMmZhZDk4NyAxMDA2NDQKPj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAu
Ywo+Pj4gQEAgLTEzNjcsNyArMTM2Nyw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRf
eGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoIG1hcF9lIDwgZW5kICkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsKPj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwX3BhZ2VzX3RvX3hlbigodW5zaWduZWQg
bG9uZylfX3ZhKG1hcF9lKSwgCj4+PiBtYWRkcl90b19tZm4obWFwX2UpLAo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXBfcGFnZXNfdG9feGVuKCh1bnNpZ25lZCBsb25nKV9f
dmEobWFwX2UpLCBJTlZBTElEX01GTiwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBGTl9ET1dOKGVuZCAtIG1h
cF9lKSwgUEFHRV9IWVBFUlZJU09SKTsKPj4KPj4gV2h5IGRvbid0IHlvdSBqdXN0IHJlbW92ZSB0
aGUgY2FsbHMgdG8gbWFwX3BhZ2VzX3RvX3hlbj8KPj4KPiAKPiBNeSBpbnRlbnRpb24gaXMgdG8g
cHJlLXBvcHVsYXRlIHRoZSByYW5nZSBzbyB0aGF0IHdlIGRvbid0IGhhdmUgdG8gZG8gc28gbGF0
ZXIgCj4gd2hlbiB0aGVyZSBhcmUgeGVuaGVhcCBhbGxvY2F0aW9ucy4gQnV0IG9mIGNvdXJzZSBp
ZiB0aGVyZSBpcyBzdXBlcnBhZ2UgbWVyZ2luZyAKPiBvciBzaGF0dGVyaW5nLCBwYWdlIHRhYmxl
cyB3aWxsIGJlIHJlbW92ZWQgb3IgYWxsb2NhdGVkIGFueXdheS4gSSB3aWxsIHJlbW92ZSAKPiB0
aGUgY2FsbHMgaW4gdGhlIG5leHQgcmV2aXNpb24uCgpIb3cgYWJvdXQgdXNpbmcgcG9wdWxhdGVf
cHRfcmFuZ2UoKSBpbiB0aGF0IGNhc2U/IFRoaXMgd2lsbCBwcmUtcG9wdWxhdGUgdGhlIApwYWdl
LXRhYmxlcyBmb3IgbWFwcGluZyB3aXRoIHNtYWxsIHBhZ2VzLgoKSSBoYXZlbid0IGZ1bGx5IHJl
YWQgdGhlIHNlcmllcyB5ZXQuIEJ1dCBJIHdvdWxkIGFzc3VtZSB0aGF0IG9ubHkgbWVtb3J5IAph
bGxvY2F0ZWQgZm9yIFhlbiBpbnRlcm5hbCB3b3VsZCBiZSBrZXB0IG1hcHBlZC4gR3Vlc3QgbWVt
b3J5IHdvdWxkIHN0aWxsIGJlIAp1bm1hcHBlZCwgcmlnaHQ/CgpJZiBzbywgSSBkb24ndCB0aGlu
ayB3ZSBvZnRlbiBkbyBiaWcgYWxsb2NhdGlvbiBmb3IgWGVuLiBTbyBpdCBpcyBwcm9iYWJseSBt
b3JlIApsaWtlbHkgdG8gdXNlIHNtYWxsIHBhZ2VzLiBJbiB0aGF0IGNhc2UsIGl0IHdvdWxkIGJl
IGZpbmUgdG8gcHJlLWFsbG9jYXRlIHBhZ2VzLgoKSW4gYW5vdGhlciBoYW5kLCBYZW4gZG9lc24n
dCB1c2UgYSBsb3Qgb2YgbWVtb3J5IChpZiB5b3UgY29tcGFyZSB0byBndWVzdCAKbWVtb3J5KS4g
U28gbWF5YmUgcHJlLXBvcHVsYXRpbmcgdGhlIHBhZ2UtdGFibGVzIHdvdWxkIGJlIGEgd2FzdGUg
b2YgbWVtb3J5LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
