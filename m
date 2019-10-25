Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA7CE4C1E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 15:28:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNzaj-0003pK-6Q; Fri, 25 Oct 2019 13:25:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNzah-0003p6-SY
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 13:25:19 +0000
X-Inumbo-ID: e29890c8-f72a-11e9-94c9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e29890c8-f72a-11e9-94c9-12813bfff9fa;
 Fri, 25 Oct 2019 13:25:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F3402AD1A;
 Fri, 25 Oct 2019 13:25:16 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-8-andrew.cooper3@citrix.com>
 <62c638c2-641e-c1c0-a9c3-8c48388289b5@suse.com>
 <c1794d03-8ec3-d350-aa7d-43cc5701d562@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <175da82e-982f-c08a-326a-db4693a16ac6@suse.com>
Date: Fri, 25 Oct 2019 15:25:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c1794d03-8ec3-d350-aa7d-43cc5701d562@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 7/7] x86/nospec: Optimise
 array_index_mask_nospec() for power-of-2 arrays
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTAuMjAxOSAxNDo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNS8xMC8yMDE5
IDEzOjI0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjMuMTAuMjAxOSAxNTo1OCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEBAIC0yMSw5ICsyOCwxNSBAQCBzdGF0aWMgaW5saW5lIHVuc2ln
bmVkIGxvbmcgYXJyYXlfaW5kZXhfbWFza19ub3NwZWModW5zaWduZWQgbG9uZyBpbmRleCwKPj4+
ICB7Cj4+PiAgICAgIHVuc2lnbmVkIGxvbmcgbWFzazsKPj4+ICAKPj4+IC0gICAgYXNtIHZvbGF0
aWxlICggImNtcCAlW3NpemVdLCAlW2luZGV4XTsgc2JiICVbbWFza10sICVbbWFza107Igo+Pj4g
LSAgICAgICAgICAgICAgICAgICA6IFttYXNrXSAiPXIiIChtYXNrKQo+Pj4gLSAgICAgICAgICAg
ICAgICAgICA6IFtzaXplXSAiZyIgKHNpemUpLCBbaW5kZXhdICJyIiAoaW5kZXgpICk7Cj4+PiAr
ICAgIGlmICggX19idWlsdGluX2NvbnN0YW50X3Aoc2l6ZSkgJiYgSVNfUE9XRVJfT0ZfMihzaXpl
KSApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIG1hc2sgPSBzaXplIC0gMTsKPj4+ICsgICAgICAg
IE9QVElNSVpFUl9ISURFX1ZBUihtYXNrKTsKPj4gSSBjYW4ndCBzZWVtIHRvIGJlIGFibGUgdG8g
ZmlndXJlIHdoeSB5b3UgbmVlZCB0aGlzLgo+IAo+IEJlY2F1c2UgSSBmb3VuZCBjYXNlcyB3aGVy
ZSB0aGUgQU5EIHdhcyBlbGlkZWQgYnkgdGhlIGNvbXBpbGVyIGVudGlyZWx5Cj4gd2l0aG91dCBp
dC4KCldvdWxkIHlvdSBtaW5kIG1lbnRpb25pbmcgdGhpcyBpbiB0aGUgZGVzY3JpcHRpb24sIG9y
IGluIGEgY29tbWVudD8KCj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vY29uZmlnLmgKPj4+ICsr
KyBiL3hlbi9pbmNsdWRlL3hlbi9jb25maWcuaAo+Pj4gQEAgLTc1LDYgKzc1LDcgQEAKPj4+ICAj
ZGVmaW5lIEdCKF9nYikgICAgIChfQUMoX2diLCBVTEwpIDw8IDMwKQo+Pj4gIAo+Pj4gICNkZWZp
bmUgSVNfQUxJR05FRCh2YWwsIGFsaWduKSAoKCh2YWwpICYgKChhbGlnbikgLSAxKSkgPT0gMCkK
Pj4+ICsjZGVmaW5lIElTX1BPV0VSX09GXzIodmFsKSAoKHZhbCkgJiYgSVNfQUxJR05FRCh2YWws
IHZhbCkpCj4+IFdoaWxlIHRoZSByaXNrIG1heSBzZWVtIGxvdyBmb3Igc29tZW9uZSB0byBwYXNz
IGFuIGV4cHJlc3Npb24gd2l0aAo+PiBzaWRlIGVmZmVjdCBoZXJlLCBldmFsdWF0aW5nICJ2YWwi
IHVwIHRvIHRocmVlIHRpbWVzIGhlcmUgZG9lc24ndAo+PiBsb29rIHZlcnkgZGVzaXJhYmxlLgo+
IAo+IFRoYXQgaXMgZWFzeSB0byBmaXguCj4gCj4+IEFzIGEgbWlub3IgcmVtYXJrLCB3aXRob3V0
IGNvbnNpZGVyaW5nIHJlcHJlc2VudGF0aW9uIEknZCBleHBlY3QKPj4gYW4gZXhwcmVzc2lvbiBJ
U19BTElHTkVEKHZhbCwgdmFsKSB0byBjb25zaXN0ZW50bHkgcHJvZHVjZSAidHJ1ZSIKPj4gZm9y
IGFsbCBub24temVybyB2YWx1ZXMuIEUuZy4gMyBpcyBjZXJ0YWlubHkgImFsaWduZWQiIG9uIGEK
Pj4gYm91bmRhcnkgb2YgMy4KPiAKPiBJU19BTElHTkVEKCkgY29tZXMgd2l0aCBhbiBleHBlY3Rh
dGlvbiBvZiBiZWluZyBhZ2FpbnN0IGEgcG93ZXIgb2YgMiwKPiBiZWNhdXNlIG90aGVyd2lzZSB5
b3UnZCBuZWVkIGEgRElWIGluc3RydWN0aW9uIGZvciB0aGUgZ2VuZXJhbCBjYXNlLgo+IAo+IFNv
bWUgdXNlcnMgY2FuJ3QgY29wZSB3aXRoIGEgY29tcGlsZSB0aW1lIGNoZWNrLgo+IAo+PiBGaW5h
bGx5IHRoaXMgbWF5IHdhbnQgZ3VhcmRpbmcgYWdhaW5zdCB1c2Ugb24gc2lnbmVkIHR5cGVzIC0g
YXQKPj4gdGhlIHZlcnkgbGVhc3QgaXQgbG9va3MgdG8gcHJvZHVjZSB0aGUgd3JvbmcgYW5zd2Vy
IGZvciBlLmcuCj4+IElOVF9NSU4gb3IgTE9OR19NSU4uIEkuZS4gcGVyaGFwcyB0aGUgZXhwcmVz
c2lvbiB0byB0aGUgbGVmdCBvZgo+PiAmJiB3YW50cyB0byBiZSAodmFsKSA+IDAuCj4gCj4gSG93
IGFib3V0IHRoZSBhYm92ZSBleHBhbnNpb24gZml4IGJlY29taW5nOgo+IAo+ICh7Cj4gwqDCoMKg
IHVuc2lnbmVkIHR5cGVvZih2YWwpIF92YWwgPSB2YWw7Cj4gwqDCoMKgIF92YWwgJiYgKF92YWwg
JiAoX3ZhbCAtIDEpKSA9PSAwOwo+IH0pCgpXZWxsLCBpZiB0aGUgInVuc2lnbmVkIHR5cGVvZigp
IiBjb25zdHJ1Y3Qgd29ya3MgLSB3aHkgbm90ICh3aXRoCiJ2YWwiIHByb3Blcmx5IHBhcmVudGhl
c2l6ZWQsIGFuZCBwcmVmZXJhYmxlIHRoZSBsZWFkaW5nIHVuZGVyc2NvcmUKY2hhbmdlZCB0byBh
IHRyYWlsaW5nIG9uZSkuCgo+IFRoaXMgY2hlY2sgbWFrZXMgbm8gc2Vuc2Ugb24gbmVnYXRpdmUg
bnVtYmVycy4KCk9mIGNvdXJzZSBub3QsIGJ1dCBzb21lb25lIG1pZ2h0IHVzZSBpdCBvbiBhIHNp
Z25lZCB0eXBlIGFuZCBnZXQKYmFjayB0cnVlIHdoZW4gaXQgd2FzIHN1cHBvc2VkIHRvIGJlIGZh
bHNlLCBqdXN0IGJlY2F1c2UgdGhlIHZhbHVlCnVzZWQgZW5kZWQgdXAgYmVpbmcgYSBuZWdhdGl2
ZSBudW1iZXIuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
