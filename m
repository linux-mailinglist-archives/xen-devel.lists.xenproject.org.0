Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B656EB47ED
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 09:14:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA7eJ-0000ax-DN; Tue, 17 Sep 2019 07:11:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iA7eI-0000ai-1D
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 07:11:42 +0000
X-Inumbo-ID: 6537beb7-d91a-11e9-9602-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6537beb7-d91a-11e9-9602-12813bfff9fa;
 Tue, 17 Sep 2019 07:11:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 92BDCB048;
 Tue, 17 Sep 2019 07:11:39 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <3f3ef22a-0a56-ac77-3deb-513031c8baaa@suse.com>
 <20190917070922.GA10190@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <109a49e9-eb11-ec5d-2de3-18cceaa6d8b3@suse.com>
Date: Tue, 17 Sep 2019 09:11:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190917070922.GA10190@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 00/16] improve late microcode loading
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAwOTowOSwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gRnJpLCBTZXAgMTMsIDIw
MTkgYXQgMTA6NDc6MzZBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEyLjA5LjIw
MTkgMDk6MjIsIENoYW8gR2FvIHdyb3RlOgo+Pj4gVGhpcyBzZXJpZXMgaW5jbHVkZXMgYmVsb3cg
Y2hhbmdlczoKPj4+ICAxLiBQYXRjaCAxLTExOiBpbnRyb2R1Y2UgYSBnbG9iYWwgbWljcm9jb2Rl
IGNhY2hlIGFuZCBzb21lIGNsZWFudXAKPj4+ICAyLiBQYXRjaCAxMjogc3luY2hyb25pemUgbGF0
ZSBtaWNyb2NvZGUgbG9hZGluZwo+Pj4gIDMuIFBhdGNoIDEzOiBzdXBwb3J0IHBhcmFsbGVsIG1p
Y3JvY29kZXMgdXBkYXRlIG9uIGRpZmZlcmVudCBjb3Jlcwo+Pj4gIDQuIFBhdGNoIDE0OiBibG9j
ayAjTk1JIGhhbmRsaW5nIGR1cmluZyBtaWNyb2NvZGUgbG9hZGluZwo+Pj4gIDUuIFBhdGNoIDE1
OiBkaXNhYmxlIGxhdGUgdWNvZGUgbG9hZGluZyBkdWUgdG8gQkRGOTAKPj4+ICA2LiBQYXRjaCAx
NjogY2FsbCB3YmludmQoKSBjb25kaXRpb25hbGx5Cj4+Cj4+IEkgZG9uJ3Qga25vdyB3aHkgaXQg
ZGlkbid0IG9jY3VyIHRvIG1lIGVhcmxpZXIsIGJ1dCB3aGF0IGFib3V0Cj4+IHBhcmtlZCAvIG9m
ZmxpbmVkIENQVXM/IFRoZXknbGwgaGF2ZSB0aGVpciB1Y29kZSB1cGRhdGVkIHdoZW4gdGhleQo+
PiBnZXQgYnJvdWdodCBiYWNrIG9ubGluZSwgYnV0IHVudGlsIHRoZW4gdGhlaXIgdWNvZGUgd2ls
bCBkaXNhZ3JlZQo+PiB3aXRoIHRoYXQgb2YgdGhlIG9ubGluZSBDUFVzLiBGb3IgdHJ1bHkgb2Zm
bGluZSBDUFVzIHRoaXMgbWF5IGJlCj4+IGZpbmUsIGJ1dCBwYXJrZWQgb25lcyBzaG91bGQgcHJv
YmFibHkgYmUgdXBkYXRlZCwgcGVyaGFwcyB2aWEgdGhlCj4+IHNhbWUgYXBwcm9hY2ggYXMgdXNl
ZCB3aGVuIEMtc3RhdGUgZGF0YSBiZWNvbWVzIGF2YWlsYWJsZSAoc2VlCj4+IHNldF9jeF9wbWlu
Zm8oKSk/Cj4gCj4gWWVzLiBJdCBwcm92aWRlcyBhIG1lYW5zIHRvIHdha2UgdXAgdGhlIHBhcmtl
ZCBDUFUgYW5kIGEgY2hhbmNlIHRvIHJ1bgo+IHNvbWUgY29kZSAobGlrZSBsb2FkaW5nIHVjb2Rl
KS4gQnV0IHBhcmtlZCBDUFVzIGFyZSBjbGVhcmVkIGZyb20KPiBzaWJsaW5nIGluZm8gYW5kIGNw
dV9vbmxpbmVfbWFwIChzZWUgX19jcHVfZGlzYWJsZSgpKS4gSWYgcGFyYWxsZWwKPiB1Y29kZSBs
b2FkaW5nIGlzIGV4cGVjdGVkIG9uIHBhcmtlZCBDUFVzLCB3ZSBzaG91bGQgYmUgYWJsZSB0bwo+
IGRldGVybWluZSB0aGUgcHJpbWFyeSB0aHJlYWRzIGFuZCB0aGUgbnVtYmVyIG9mIGNvcmVzIG5v
IG1hdHRlciBpdCBpcwo+IG9ubGluZSBvciBwYXJrZWQuIFRvIHRoaXMgZW5kLCBhIG5ldyBzaWJs
aW5nIG1hcCBzaG91bGQgYmUgbWFpbnRhaW5lZAo+IGZvciBlYWNoIENQVSBhbmQgdGhpcyBtYXAg
aXNuJ3QgY2hhbmdlZCB3aGVuIGEgQ1BVIGdldHMgcGFya2VkLgoKV291bGQgdGhpcyByZWFsbHkg
YmUgbmVjZXNzYXJ5PyBJZiBhbnkgdGhyZWFkIGluIGEgY29yZSBpcyBub3QKcGFya2VkLCBicmlu
Z2luZyB1cCB0aGUgcGFya2VkIHRocmVhZHMgaXMgdW5uZWNlc3NhcnkuIElmIGFsbAp0aHJlYWRz
IG9mIGEgY29yZSBhcmUgcGFya2VkLCBzaW1wbHkgbnVkZ2UgdGhlIHRocmVhZCB3aXRoIElECnpl
cm8/Cgo+IEluIExpbnV4IGtlcm5lbCwgdGhlIGFwcHJvYWNoIGlzIHF1aXRlIHNpbXBsZTogbGF0
ZSBsb2FkaW5nIGlzCj4gcHJvaGliaXRlZCBpZiBhbnkgQ1BVIGlzIHBhcmtlZDsgYWRtaW4gc2hv
dWxkIG9ubGluZSBhbGwgcGFya2VkIENQVQo+IGJlZm9yZSBsb2FkaW5nIHVjb2RlLgoKV2VsbCwg
dGhpcyBpcyBjZXJ0YWlubHkgYW4gb3B0aW9uLCBidXQgKGFzIHBlciBhYm92ZSkgSSB0aGluawp0
aGlzIGlzIHRvbyByaWdpZDogUmVmdXNpbmcgdGhlIG9wZXJhdGlvbiB3b3VsZCBiZSBuZWNlc3Nh
cnkKb25seSBpZiB0aGVyZSdzIGEgY29yZSB3aXRoIGFsbCBvZiBpdHMgdGhyZWFkcyBwYXJrZWQu
IChJJ2QKaW4gcGFydGljdWxhciBsaWtlIGxhdGUgbG9hZGluZyB0byB3b3JrIGluIFNNVC1kaXNh
YmxlZCBtb2RlLikKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
