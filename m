Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E12D181069
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 07:09:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBuWM-0002mv-Vm; Wed, 11 Mar 2020 06:07:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TdBs=44=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBuWL-0002mq-3F
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 06:07:09 +0000
X-Inumbo-ID: 89f285a0-635e-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89f285a0-635e-11ea-bec1-bc764e2007e4;
 Wed, 11 Mar 2020 06:07:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2B266AC24;
 Wed, 11 Mar 2020 06:07:07 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-4-jgross@suse.com>
 <3e1435c3-8320-184b-d097-2a6db011e084@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <dc9222df-3525-f225-ad76-9489c0886fe1@suse.com>
Date: Wed, 11 Mar 2020 07:07:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3e1435c3-8320-184b-d097-2a6db011e084@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/6] xen: add
 process_pending_softirqs_norcu() for keyhandlers
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAgMTg6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEwLjAzLjIwMjAgMDg6
MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc29mdGlycS5jCj4+
ICsrKyBiL3hlbi9jb21tb24vc29mdGlycS5jCj4+IEBAIC0yNSw3ICsyNSw3IEBAIHN0YXRpYyBz
b2Z0aXJxX2hhbmRsZXIgc29mdGlycV9oYW5kbGVyc1tOUl9TT0ZUSVJRU107Cj4+ICAgc3RhdGlj
IERFRklORV9QRVJfQ1BVKGNwdW1hc2tfdCwgYmF0Y2hfbWFzayk7Cj4+ICAgc3RhdGljIERFRklO
RV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgYmF0Y2hpbmcpOwo+PiAgIAo+PiAtc3RhdGljIHZvaWQg
X19kb19zb2Z0aXJxKHVuc2lnbmVkIGxvbmcgaWdub3JlX21hc2spCj4+ICtzdGF0aWMgdm9pZCBf
X2RvX3NvZnRpcnEodW5zaWduZWQgbG9uZyBpZ25vcmVfbWFzaywgYm9vbCByY3VfYWxsb3dlZCkK
PiAKPiBXaHkgdGhlIHNlcGFyYXRlIGJvb2w/IENhbid0IHlvdSAuLi4KPiAKPj4gQEAgLTM4LDcg
KzM4LDcgQEAgc3RhdGljIHZvaWQgX19kb19zb2Z0aXJxKHVuc2lnbmVkIGxvbmcgaWdub3JlX21h
c2spCj4+ICAgICAgICAgICAgKi8KPj4gICAgICAgICAgIGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQo
KTsKPj4gICAKPj4gLSAgICAgICAgaWYgKCByY3VfcGVuZGluZyhjcHUpICkKPj4gKyAgICAgICAg
aWYgKCByY3VfYWxsb3dlZCAmJiByY3VfcGVuZGluZyhjcHUpICkKPiAKPiAuLi4gY2hlY2sgIShp
Z25vcmVfbWFzayAmIFJDVV9TT0ZUSVJRKSBoZXJlPwoKR29vZCBpZGVhLgoKPiAKPj4gQEAgLTU1
LDEzICs1NSwyMiBAQCB2b2lkIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcyh2b2lkKQo+PiAgIHsK
Pj4gICAgICAgQVNTRVJUKCFpbl9pcnEoKSAmJiBsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsKPj4g
ICAgICAgLyogRG8gbm90IGVudGVyIHNjaGVkdWxlciBhcyBpdCBjYW4gcHJlZW1wdCB0aGUgY2Fs
bGluZyBjb250ZXh0LiAqLwo+PiAtICAgIF9fZG9fc29mdGlycSgoMXVsIDw8IFNDSEVEVUxFX1NP
RlRJUlEpIHwgKDF1bCA8PCBTQ0hFRF9TTEFWRV9TT0ZUSVJRKSk7Cj4+ICsgICAgX19kb19zb2Z0
aXJxKCgxdWwgPDwgU0NIRURVTEVfU09GVElSUSkgfCAoMXVsIDw8IFNDSEVEX1NMQVZFX1NPRlRJ
UlEpLAo+PiArICAgICAgICAgICAgICAgICB0cnVlKTsKPj4gK30KPj4gKwo+PiArdm9pZCBwcm9j
ZXNzX3BlbmRpbmdfc29mdGlycXNfbm9yY3Uodm9pZCkKPj4gK3sKPj4gKyAgICBBU1NFUlQoIWlu
X2lycSgpICYmIGxvY2FsX2lycV9pc19lbmFibGVkKCkpOwo+PiArICAgIC8qIERvIG5vdCBlbnRl
ciBzY2hlZHVsZXIgYXMgaXQgY2FuIHByZWVtcHQgdGhlIGNhbGxpbmcgY29udGV4dC4gKi8KPj4g
KyAgICBfX2RvX3NvZnRpcnEoKDF1bCA8PCBTQ0hFRFVMRV9TT0ZUSVJRKSB8ICgxdWwgPDwgU0NI
RURfU0xBVkVfU09GVElSUSkgfAo+PiArICAgICAgICAgICAgICAgICAoMXVsIDw8IFJDVV9TT0ZU
SVJRKSwgZmFsc2UpOwo+IAo+IEkgZ3Vlc3MgdGhlIGNvbW1lbnQgaGVyZSBhbHNvIHdhbnRzIHRv
IG1lbnRpb24gUkNVPwoKWWVzLgoKPiAKPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YW1kL3BjaV9hbWRfaW9tbXUuYwo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQv
cGNpX2FtZF9pb21tdS5jCj4+IEBAIC01ODcsNyArNTg3LDcgQEAgc3RhdGljIHZvaWQgYW1kX2R1
bXBfcDJtX3RhYmxlX2xldmVsKHN0cnVjdCBwYWdlX2luZm8qIHBnLCBpbnQgbGV2ZWwsCj4+ICAg
ICAgICAgICBzdHJ1Y3QgYW1kX2lvbW11X3B0ZSAqcGRlID0gJnRhYmxlX3ZhZGRyW2luZGV4XTsK
Pj4gICAKPj4gICAgICAgICAgIGlmICggIShpbmRleCAlIDIpICkKPj4gLSAgICAgICAgICAgIHBy
b2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpOwo+PiArICAgICAgICAgICAgcHJvY2Vzc19wZW5kaW5n
X3NvZnRpcnFzX25vcmN1KCk7Cj4gCj4gQXQgdGhlIGV4YW1wbGUgb2YgdGhpcyAtIHRoZSBwcm9w
ZXJ0eSBvZiBob2xkaW5nIGFuIFJDVSBsb2NrIGlzCj4gZW50aXJlbHkgaW52aXNpYmxlIGhlcmUs
IGFzIGl0J3MgdGhlIGdlbmVyaWMKPiBpb21tdV9kdW1wX3AybV90YWJsZSgpIHdoaWNoIGFjcXVp
cmVzIGl0LiBUaGlzIHN1Z2dlc3QgdG8gbWUgdGhhdAo+IGdvaW5nIGZvcndhcmQgYnJlYWtpbmcg
dGhpcyBpcyBnb2luZyB0byBiZSB2ZXJ5IGxpa2VseS4gQ291bGRuJ3QKPiBwcm9jZXNzX3BlbmRp
bmdfc29mdGlycXMoKSBleGNsdWRlIFJDVSBoYW5kbGluZyB3aGVuIGZpbmRpbmcKPiBwcmVlbXB0
X2NvdW50KCkgdG8gcmV0dXJuIG5vbi16ZXJvPwoKVGhpcyBjYW4gYmUgZG9uZSwgYnV0IHRoZW4g
dGhlIG5vbi1kZWJ1ZyBidWlsZCB3b3VsZCByZXF1aXJlIHRvIGhhdmUKbm9uLWVtcHR5IHJjdSBs
b2NrIGZ1bmN0aW9ucy4KCkFuIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIEFTU0VSVCgpIG5vIHJj
dSBsb2NrIGJlaW5nIGhlbGQgaW4KcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCkgb3IgcmN1X2No
ZWNrX2NhbGxiYWNrcygpIHdoaWNoIHdvdWxkIGNhdGNoCnRoZSBwcm9ibGVtYXRpYyBjYXNlcyBp
biBkZWJ1ZyBidWlsZHMuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
