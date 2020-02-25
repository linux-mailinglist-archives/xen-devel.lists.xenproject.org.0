Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF68A16C12E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 13:44:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6ZW2-00045V-97; Tue, 25 Feb 2020 12:40:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6ZW1-00045Q-84
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 12:40:45 +0000
X-Inumbo-ID: 0916b2ab-57cc-11ea-92ec-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0916b2ab-57cc-11ea-92ec-12813bfff9fa;
 Tue, 25 Feb 2020 12:40:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9DD1BB14D;
 Tue, 25 Feb 2020 12:40:42 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1582133128-25638-1-git-send-email-igor.druzhinin@citrix.com>
 <1d138bf8-0cec-b66d-c852-fd7d6392e69d@suse.com>
 <5f27be3d-263b-42b6-7489-8fbc1079c38b@citrix.com>
 <7f0c343c-96f1-b11c-324d-c301d08d40d5@suse.com>
 <cff24d62-e797-ab4a-a6a2-d16e7aff621e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a27cf33b-6326-7461-b390-da675378188c@suse.com>
Date: Tue, 25 Feb 2020 13:40:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <cff24d62-e797-ab4a-a6a2-d16e7aff621e@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/cpu: Sync any remaining RCU
 callbacks after CPU up/down
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDIuMjAyMCAxMzozNywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMjUvMDIvMjAy
MCAxMjoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIxLjAyLjIwMjAgMjA6MjYsIElnb3Ig
RHJ1emhpbmluIHdyb3RlOgo+Pj4gT24gMjEvMDIvMjAyMCAxNjoyOSwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMTkuMDIuMjAyMCAxODoyNSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+Pj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYwo+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvc3lz
Y3RsLmMKPj4+Pj4gQEAgLTc4LDggKzc4LDExIEBAIHN0YXRpYyB2b2lkIGwzX2NhY2hlX2dldCh2
b2lkICphcmcpCj4+Pj4+ICBsb25nIGNwdV91cF9oZWxwZXIodm9pZCAqZGF0YSkKPj4+Pj4gIHsK
Pj4+Pj4gICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gKHVuc2lnbmVkIGxvbmcpZGF0YTsKPj4+Pj4g
LSAgICBpbnQgcmV0ID0gY3B1X3VwKGNwdSk7Cj4+Pj4+ICsgICAgaW50IHJldDsKPj4+Pj4gIAo+
Pj4+PiArICAgIC8qIEZsdXNoIHBvdGVudGlhbGx5IHNjaGVkdWxlZCBSQ1Ugd29yayBmcm9tIHBy
ZWNlZGluZyBDUFUgb2ZmbGluZSAqLwo+Pj4+PiArICAgIHJjdV9iYXJyaWVyKCk7Cj4+Pj4+ICsg
ICAgcmV0ID0gY3B1X3VwKGNwdSk7Cj4+Pj4+ICAgICAgaWYgKCByZXQgPT0gLUVCVVNZICkKPj4+
Pj4gICAgICB7Cj4+Pj4+ICAgICAgICAgIC8qIE9uIEVCVVNZLCBmbHVzaCBSQ1Ugd29yayBhbmQg
aGF2ZSBvbmUgbW9yZSBnby4gKi8KPj4+Pj4gQEAgLTEwNCw3ICsxMDcsMTEgQEAgbG9uZyBjcHVf
dXBfaGVscGVyKHZvaWQgKmRhdGEpCj4+Pj4+ICBsb25nIGNwdV9kb3duX2hlbHBlcih2b2lkICpk
YXRhKQo+Pj4+PiAgewo+Pj4+PiAgICAgIGludCBjcHUgPSAodW5zaWduZWQgbG9uZylkYXRhOwo+
Pj4+PiAtICAgIGludCByZXQgPSBjcHVfZG93bihjcHUpOwo+Pj4+PiArICAgIGludCByZXQ7Cj4+
Pj4+ICsKPj4+Pj4gKyAgICAvKiBGbHVzaCBwb3RlbnRpYWxseSBzY2hlZHVsZWQgUkNVIHdvcmsg
ZnJvbSBwcmVjZWRpbmcgQ1BVIG9ubGluZSAqLwo+Pj4+PiArICAgIHJjdV9iYXJyaWVyKCk7Cj4+
Pj4+ICsgICAgcmV0ID0gY3B1X2Rvd24oY3B1KTsKPj4+Pj4gICAgICBpZiAoIHJldCA9PSAtRUJV
U1kgKQo+Pj4+PiAgICAgIHsKPj4+Pj4gICAgICAgICAgLyogT24gRUJVU1ksIGZsdXNoIFJDVSB3
b3JrIGFuZCBoYXZlIG9uZSBtb3JlIGdvLiAqLwo+Pj4+Pgo+Pj4+Cj4+Pj4gVGhlcmUgYXJlIG1v
cmUgY2FsbHMgdG8gY3B1X3VwKCkgLyBjcHVfZG93bigpLCBtb3N0IG5vdGFibHkgaW4KPj4+PiBj
b3JlX3BhcmtpbmcuYy4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIG1ha2UgdGhlIGJhcnJpZXIg
cGFydAo+Pj4+IG9mIHRoZSB0d28gZnVuY3Rpb25zPyBUaGlzIHdvdWxkIHRoZSBhbHNvIGNvdmVy
IG5vbi14ODYgaW4KPj4+PiBjYXNlIGFuIGFyY2ggd2FudHMgdG8gc3VwcG9ydCBvZmZsaW5pbmcv
b25saW5pbmcgb2YgQ1BVcy4KPj4+Cj4+PiBUaG9zZSBmdW5jdGlvbnMgYXJlIGNhbGxlZCBmcm9t
IGVhcmx5IGluaXQgY29kZSBhbmQgcmN1X2JhcnJpZXIoKSBpcwo+Pj4gYW4gZXhwZW5zaXZlIG9w
ZXJhdGlvbi4gSSB0aGluayBpdCdzIGJldHRlciBpZiBjYWxsZXIgaXMgcmVzcG9uc2libGUKPj4+
IGZvciBzeW5jaW5nIHRoZSBzdGF0ZS4gVGhpcyBpcyB0aGUgcmVhc29uIEkgbW92ZWQgcmN1X2Jh
cnJpZXIoKSBpbiBmcm9udAo+Pj4gb2YgY3B1X3VwL2Rvd24uCj4+Cj4+IFdlbGwsIHRoZXJlIGFy
ZSB0d28gYXNwZWN0cyBoZXJlOiBPbmUgaXMgdG8gYXZvaWQgdGhlIG92ZXJoZWFkIHdoZXJlCj4+
IGl0J3Mgbm90IG5lZWRlZC4gVGhlIG90aGVyIGlzLCBhcyBvYnNlcnZlZCBvbiB0aGlzIHBhdGNo
LCB0aGF0IGJ5Cj4+IHRoZSBjaG9zZW4gYXBwcm9hY2ggY2FsbGVycyB3aGljaCBpbiBmYWN0IG5l
ZWQgYW1lbmRpbmcgbWF5IGJlCj4+IGZvcmdvdHRlbi4gVG8gZmluZCBtaWRkbGUgZ3JvdW5kcywg
cGVyaGFwcyB0aGUgc29sdXRpb24gaXMgdG8gaGF2ZQo+PiB2YXJpYW50cyBvZiBjcHVfe3VwLGRv
d259KCkgd2hpY2ggaW52b2tlIHRoZSBiYXJyaWVyLCBhbmQgd2hpY2gKPj4gd291bGQgYmUgdXNl
ZCBieSBhbGwgcnVudGltZSBpbnZvY2F0aW9ucz8KPj4KPj4gVGhlIG90aGVyIHF1ZXN0aW9uIG9m
IGNvdXJzZSBpcyB3aHkgZWFybHkgaW5pdCBjb2RlIGlzIHNwZWNpYWwgaW4KPj4gdGhpcyByZWdh
cmQuIElmIGl0IGluZGVlZCB3YXMsIHBlcmhhcHMgdGhlIGJhcnJpZXIgaW52b2NhdGlvbiBjb3Vs
ZAo+PiBhbHNvIGJlIHRpZWQgdG8gY2VydGFpbiBTWVNfU1RBVEVfKiB2YWx1ZXM/Cj4gCj4gSXQn
cyBub3Qgc3BlY2lhbCAtIGluIGZhY3QgaXQgc3RhcnRzIGFmdGVyIFJDVSBpcyBpbml0aWFsaXpl
ZC4gVGhlIGlzc3VlCj4gaXMsIGFzIHlvdSBzYWlkLCB1bm5lY2Vzc2FyeSBvdmVyaGVhZC4KCldl
bGwsIGlmIGl0J3MgdW5uZWNlc3Nhcnkgb3ZlcmhlYWQsIHRoZW4gaXQgaXMgc3BlY2lhbCBpbiBz
b21lIHdheS4KQWZ0ZXIgYWxsIGF0IHJ1bnRpbWUgdGhlIG92ZXJoZWFkIGlzbid0IHVubmVjZXNz
YXJ5LiBJcyBpdCBwZXJoYXBzCmp1c3QgdGhhdCBjdXJyZW50bHkgd2UgZG9uJ3QgX2hhcHBlbl8g
dG8gaGF2ZSBhbnl0aGluZyB0aGF0IHdvdWxkCm1ha2UgdXNlIG9mIGFuIFJDVSBiYXJyaWVyIG5l
Y2Vzc2FyeSBpbiB0aGlzIGNhc2U/IEluIHdoaWNoIGNhc2UgaXQKd291bGQgYmUgYSBwcm9ibGVt
IHdhaXRpbmcgdG8gYml0ZSB1cyBkb3duIHRoZSByb2FkPwoKSmFuCgo+IEknZCBwcmVmZXIgdG8g
YXZvaWQgYW55IGNvbmRpdGlvbmFsCj4gbWFnaWMgYW5kIGluc3RlYWQgY2FsbCAibm9zeW5jIiB2
ZXJzaW9uIGRpcmVjdGx5IGZyb20gc2V0dXAgY29kZS4KPiAKPiBJZ29yCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
