Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F881B0B06
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 11:14:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8L8u-0006Ar-0s; Thu, 12 Sep 2019 09:11:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8L8s-0006Aj-P0
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 09:11:54 +0000
X-Inumbo-ID: 5cc52362-d53d-11e9-83e6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cc52362-d53d-11e9-83e6-12813bfff9fa;
 Thu, 12 Sep 2019 09:11:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 61C65ACFE;
 Thu, 12 Sep 2019 09:11:53 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-6-andrew.cooper3@citrix.com>
 <523f8f8d-8517-be28-b3d9-8ae7cca6ddec@suse.com>
 <61bf9e3a-b331-7336-1a49-91d62f53dd63@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <93fcd642-7d06-ad09-f13b-1f9f50a48184@suse.com>
Date: Thu, 12 Sep 2019 11:11:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <61bf9e3a-b331-7336-1a49-91d62f53dd63@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/8] tools/libxc: Rework xc_cpuid_set() to
 use {get, set}_cpu_policy()
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxMDozNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMi8wOS8yMDE5
IDA5OjE5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTEuMDkuMjAxOSAyMjowNSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IFRoZSBwdXJwb3NlIG9mIHRoaXMgY2hhbmdlIGlzIHRvIHN0b3Ag
dXNpbmcgeGNfY3B1aWRfZG9fZG9tY3RsKCksIGFuZCB0byBzdG9wCj4+PiBiYXNpbmcgZGVjaXNp
b25zIG9uIGEgbG9jYWwgQ1BVSUQgaW5zdHJ1Y3Rpb24uICBUaGlzIGlzIG5vdCBhbiBhcHByb3By
aWF0ZSB3YXkKPj4+IHRvIGNvbnN0cnVjdCBwb2xpY3kgaW5mb3JtYXRpb24gZm9yIG90aGVyIGRv
bWFpbnMuCj4+Pgo+Pj4gT2J0YWluIHRoZSBob3N0IGFuZCBkb21haW4tbWF4IHBvbGljaWVzIGZy
b20gWGVuLCBhbmQgbWl4IHRoZSByZXN1bHRzIGFzCj4+PiBiZWZvcmUuICBQcm92aWRlIHJhdGhl
ciBtb3JlIGVycm9yIGxvZ2dpbmcgdGhhbiBiZWZvcmUuCj4+IEFuZCB0aGlzIHBhc3NpbmcgdGhy
b3VnaCBvZiBob3N0IHZhbHVlcyBpcyBtZWFudCB0byBzdGF5IGxvbmcKPj4gdGVybT8gU2hvdWxk
bid0IHRoaXMgcmF0aGVyIGJlIHBhc3NpbmcgdGhyb3VnaCBvZiBtYXgtcG9saWN5Cj4+IHZhbHVl
cywgd2l0aCBtYXgtcG9saWN5IGxvbmcgdGVybSB3aWRlciB0aGFuIGRlZmF1bHQtcG9saWN5PyBU
aGUKPj4gY2hhbmdlIGl0c2VsZiBsb29rcyBnb29kIHRvIG1lLCBidXQgYmVmb3JlIGdpdmluZyBt
eSBSLWIgSSdkCj4+IGxpa2UgdG8gdW5kZXJzdGFuZCB0aGlzIGFzcGVjdC4KPiAKPiBUaGVyZSBp
cyBhIHZlcnkgbGFyZ2UgYW1vdW50IHdyb25nIHdpdGggeGNfY3B1aWRfc2V0KCkuCj4gCj4gRm9y
IG9uZSwgaXRzIGJlaGF2aW91ciBpcyBvbmx5IHVzZWZ1bCBmb3IgZmVhdHVyZSBsZWF2ZXMsIGJ1
dCBpdCB3aWxsCj4gb3BlcmF0ZSBvbiBhbnkgbGVhdmVzIHRoZSB1c2VyIHJlcXVlc3RzLCBhbmQg
d2hpbGUgaXQgaXMgY2FwYWJsZSBvZgo+IHJldHVybmluZyBlcnJvcnMsIGxpYnhsIGRvZXNuJ3Qg
Y2hlY2sgdGhlIHJldHVybiB2YWx1ZSBhbmQgY29udGludWVzCj4gYmxpbmRseSBmb3J3YXJkcy4K
PiAKPiBBbHNvIGZyb20gdGhlIEwxVEYgZW1iYXJnbyBkYXlzIGlzIGEgc2VyaWVzIG9mIHdvcmsg
KG9yIGF0IGxlYXN0LCB0aGUKPiBzdGFydCBvZikgd2hpY2ggaXMgYSB0b3RhbCBvdmVyaGF1bCBv
ZiBob3cgbGlieGwgYW5kIGxpYnhjIGludGVyYWN0IHdoZW4KPiBpdCBjb21lcyBDUFVJRCBhbmQg
TVNSIHNldHRpbmdzLsKgIE5laXRoZXIgeGNfY3B1aWRfc2V0KCkgbm9yCj4geGNfY3B1aWRfYXBw
bHlfcG9saWN5KCkgd2lsbCBzdXJ2aXZlIHRvIHRoZSBlbmQuCj4gCj4gRm9yIG5vdywgSSd2ZSBv
cHRlZCB3aXRoIG5vdCBjaGFuZ2luZyB0aGUgc2VtYW50aWNzIG9mIHRoZSBjYWxscyB3aGlsZQo+
IGFsdGVyaW5nIHRoZSBkYXRhLXRyYW5zZmVyIG1lY2hhbmlzbSwgdG8gYXZvaWQgY29uZmxhdGlu
ZyB0aGUgdHdvIGFyZWFzCj4gb2Ygd29yay4KCkFuZCB3aXRoIHRoaXMgdGhlbiwgYXMgcHJvbWlz
ZWQsClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
