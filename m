Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA95D30B19
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 11:08:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWdUV-0000Mm-Q5; Fri, 31 May 2019 09:06:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j8gS=T7=amazon.com=prvs=0471da2b5=graf@srs-us1.protection.inumbo.net>)
 id 1hWdUT-0000Mh-IY
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 09:06:21 +0000
X-Inumbo-ID: 5b716e3c-8383-11e9-8e8a-cfaa57177655
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b716e3c-8383-11e9-8e8a-cfaa57177655;
 Fri, 31 May 2019 09:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1559293580; x=1590829580;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=IUMbb8sG3OoGniCTVKK5CLJC3zT+OvvZpa9d+vLzxDc=;
 b=S5p9/o8DhJuxM2wS8x5PnSh6MREFxJyIc4/7ClZsV3BA3EFEPql8H1Zh
 6HSh6iRl8WNUIhOHN1zyajVj6i/q/aIU/PzEiTr7XHl5F8gPmxYhLGrNn
 VY8q+1Vz2zQnOsGe0p6sYhKFZ7fvcYZAvuSvUtOvNTQaRaRiR+52Hshs8 k=;
X-IronPort-AV: E=Sophos;i="5.60,534,1549929600"; d="scan'208";a="735510243"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 31 May 2019 09:06:19 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS
 id AFEBFA2211; Fri, 31 May 2019 09:06:18 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 May 2019 09:06:18 +0000
Received: from 38f9d3867b82.ant.amazon.com (10.43.162.74) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 May 2019 09:06:15 +0000
To: "Sironi, Filippo" <sironi@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-2-git-send-email-sironi@amazon.de>
 <e976f31b-2ccd-29ba-6a32-2edde49f867f@amazon.com>
 <3D2C4EE3-1C2E-4032-9964-31A066E542AA@amazon.de>
From: Alexander Graf <graf@amazon.com>
Message-ID: <6b3dadf9-6240-6440-b784-50bec605bf2c@amazon.com>
Date: Fri, 31 May 2019 11:06:13 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3D2C4EE3-1C2E-4032-9964-31A066E542AA@amazon.de>
Content-Language: en-US
X-Originating-IP: [10.43.162.74]
X-ClientProxiedBy: EX13D02UWB001.ant.amazon.com (10.43.161.240) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/2] KVM: Start populating
 /sys/hypervisor with KVM entries
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: KVM list <kvm@vger.kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, Marc
 Zyngier <Marc.Zyngier@arm.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Christoffer Dall <christoffer.dall@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE3LjA1LjE5IDE3OjQxLCBTaXJvbmksIEZpbGlwcG8gd3JvdGU6Cj4+IE9uIDE2LiBNYXkg
MjAxOSwgYXQgMTU6NTAsIEdyYWYsIEFsZXhhbmRlciA8Z3JhZkBhbWF6b24uY29tPiB3cm90ZToK
Pj4KPj4gT24gMTQuMDUuMTkgMDg6MTYsIEZpbGlwcG8gU2lyb25pIHdyb3RlOgo+Pj4gU3RhcnQg
cG9wdWxhdGluZyAvc3lzL2h5cGVydmlzb3Igd2l0aCBLVk0gZW50cmllcyB3aGVuIHdlJ3JlIHJ1
bm5pbmcgb24KPj4+IEtWTS4gVGhpcyBpcyB0byByZXBsaWNhdGUgZnVuY3Rpb25hbGl0eSB0aGF0
J3MgYXZhaWxhYmxlIHdoZW4gd2UncmUKPj4+IHJ1bm5pbmcgb24gWGVuLgo+Pj4KPj4+IFN0YXJ0
IHdpdGggL3N5cy9oeXBlcnZpc29yL3V1aWQsIHdoaWNoIHVzZXJzIHByZWZlciBvdmVyCj4+PiAv
c3lzL2RldmljZXMvdmlydHVhbC9kbWkvaWQvcHJvZHVjdF91dWlkIGFzIGEgd2F5IHRvIHJlY29n
bml6ZSBhIHZpcnR1YWwKPj4+IG1hY2hpbmUsIHNpbmNlIGl0J3MgYWxzbyBhdmFpbGFibGUgd2hl
biBydW5uaW5nIG9uIFhlbiBIVk0gYW5kIG9uIFhlbiBQVgo+Pj4gYW5kLCBvbiB0b3Agb2YgdGhh
dCBkb2Vzbid0IHJlcXVpcmUgcm9vdCBwcml2aWxlZ2VzIGJ5IGRlZmF1bHQuCj4+PiBMZXQncyBj
cmVhdGUgYXJjaC1zcGVjaWZpYyBob29rcyBzbyB0aGF0IGRpZmZlcmVudCBhcmNoaXRlY3R1cmVz
IGNhbgo+Pj4gcHJvdmlkZSBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb25zLgo+Pj4KPj4+IFNpZ25l
ZC1vZmYtYnk6IEZpbGlwcG8gU2lyb25pIDxzaXJvbmlAYW1hem9uLmRlPgo+PiBJIHRoaW5rIHRo
aXMgbmVlZHMgc29tZXRoaW5nIGFraW4gdG8KPj4KPj4gICBodHRwczovL3d3dy5rZXJuZWwub3Jn
L2RvYy9Eb2N1bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtaHlwZXJ2aXNvci14ZW4KPj4KPj4g
dG8gZG9jdW1lbnQgd2hpY2ggZmlsZXMgYXJlIGF2YWlsYWJsZS4KPj4KPj4+IC0tLQo+Pj4gdjI6
Cj4+PiAqIG1vdmUgdGhlIHJldHJpZXZhbCBvZiB0aGUgVk0gVVVJRCBvdXQgb2YgdXVpZF9zaG93
IGFuZCBpbnRvCj4+PiAgIGt2bV9wYXJhX2dldF91dWlkLCB3aGljaCBpcyBhIHdlYWsgZnVuY3Rp
b24gdGhhdCBjYW4gYmUgb3ZlcndyaXR0ZW4KPj4+Cj4+PiBkcml2ZXJzL0tjb25maWcgICAgICAg
ICAgICAgIHwgIDIgKysKPj4+IGRyaXZlcnMvTWFrZWZpbGUgICAgICAgICAgICAgfCAgMiArKwo+
Pj4gZHJpdmVycy9rdm0vS2NvbmZpZyAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCj4+PiBk
cml2ZXJzL2t2bS9NYWtlZmlsZSAgICAgICAgIHwgIDEgKwo+Pj4gZHJpdmVycy9rdm0vc3lzLWh5
cGVydmlzb3IuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gNSBmaWxl
cyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9rdm0vS2NvbmZpZwo+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMva3ZtL01ha2VmaWxl
Cj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9rdm0vc3lzLWh5cGVydmlzb3IuYwo+Pj4K
Pj4gWy4uLl0KPj4KPj4+ICsKPj4+ICtfX3dlYWsgY29uc3QgY2hhciAqa3ZtX3BhcmFfZ2V0X3V1
aWQodm9pZCkKPj4+ICt7Cj4+PiArCXJldHVybiBOVUxMOwo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0
aWMgc3NpemVfdCB1dWlkX3Nob3coc3RydWN0IGtvYmplY3QgKm9iaiwKPj4+ICsJCQkgc3RydWN0
IGtvYmpfYXR0cmlidXRlICphdHRyLAo+Pj4gKwkJCSBjaGFyICpidWYpCj4+PiArewo+Pj4gKwlj
b25zdCBjaGFyICp1dWlkID0ga3ZtX3BhcmFfZ2V0X3V1aWQoKTsKPj4+ICsJcmV0dXJuIHNwcmlu
dGYoYnVmLCAiJXNcbiIsIHV1aWQpOwo+PiBUaGUgdXN1YWwgcmV0dXJuIHZhbHVlIGZvciB0aGUg
WGVuIC9zeXMvaHlwZXJ2aXNvciBpbnRlcmZhY2UgaXMKPj4gIjxkZW5pZWQ+Ii4gV291bGRuJ3Qg
aXQgbWFrZSBzZW5zZSB0byBmb2xsb3cgdGhhdCBwYXR0ZXJuIGZvciB0aGUgS1ZNCj4+IG9uZSB0
b28/IEN1cnJlbnRseSwgaWYgd2UgY2FuIG5vdCBkZXRlcm1pbmUgdGhlIFVVSUQgdGhpcyB3aWxs
IGp1c3QKPj4gcmV0dXJuIChudWxsKS4KPj4KPj4gT3RoZXJ3aXNlLCBsb29rcyBnb29kIHRvIG1l
LiBBcmUgeW91IGF3YXJlIG9mIGFueSBvdGhlciBmaWxlcyB3ZSBzaG91bGQKPj4gcHJvdmlkZT8g
QWxzbywgaXMgdGhlcmUgYW55IHJlYXNvbiBub3QgdG8gaW1wbGVtZW50IEFSTSBhcyB3ZWxsIHdo
aWxlIGF0IGl0Pwo+Pgo+PiBBbGV4Cj4gVGhpcyBvcmlnaW5hdGVkIGZyb20gYSBjdXN0b21lciBy
ZXF1ZXN0IHRoYXQgd2FzIHVzaW5nIC9zeXMvaHlwZXJ2aXNvci91dWlkLgo+IE15IGd1ZXNzIGlz
IHRoYXQgd2Ugd291bGQgd2FudCB0byBleHBvc2UgInR5cGUiIGFuZCAidmVyc2lvbiIgbW92aW5n
Cj4gZm9yd2FyZCBhbmQgdGhhdCdzIHdoZW4gd2UgaHlwZXJ2aXNvciBob29rcyB3aWxsIGJlIHVz
ZWZ1bCBvbiB0b3AKPiBvZiBhcmNoIGhvb2tzLgo+Cj4gT24gYSBkaWZmZXJlbnQgbm90ZSwgYW55
IGlkZWEgaG93IHRvIGNoZWNrIHdoZXRoZXIgdGhlIE9TIGlzIHJ1bm5pbmcKPiB2aXJ0dWFsaXpl
ZCBvbiBLVk0gb24gQVJNIGFuZCBBUk02ND8gIGt2bV9wYXJhX2F2YWlsYWJsZSgpIGlzbid0IGFu
CgoKWWVhaCwgQVJNIGRvZXNuJ3QgaGF2ZSBhbnkgS1ZNIFBWIEZXSVcuIEkgYWxzbyBjYW4ndCBm
aW5kIGFueSBleHBsaWNpdCAKaGludCBwYXNzZWQgaW50byBndWVzdHMgdGhhdCB3ZSBhcmUgaW5k
ZWVkIHJ1bm5pbmcgaW4gS1ZNLiBUaGUgY2xvc2VzdCAKdGhpbmcgSSBjYW4gc2VlIGlzIHRoZSBT
TUJJT1MgcHJvZHVjdCBpZGVudGlmaWVyIGluIFFFTVUgd2hpY2ggZ2V0cyAKcGF0Y2hlZCB0byAi
S1ZNIFZpcnR1YWwgTWFjaGluZSIuIE1heWJlIHdlJ2xsIGhhdmUgdG8gZG8gd2l0aCB0aGF0IGZv
ciAKdGhlIHNha2Ugb2YgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgLi4uCgoKPiBvcHRpb24gYW5k
IHRoZSBzYW1lIGlzIHRydWUgZm9yIFMzOTAgd2hlcmUga3ZtX3BhcmFfYXZhaWxhYmxlKCkKPiBh
bHdheXMgcmV0dXJucyB0cnVlIGFuZCBpdCB3b3VsZCBldmVuIGlmIGEgS1ZNIGVuYWJsZWQga2Vy
bmVsIHdvdWxkCj4gYmUgcnVubmluZyBvbiBiYXJlIG1ldGFsLgoKCkZvciBzMzkwLCB5b3UgY2Fu
IGZpZ3VyZSB0aGUgdG9wb2xvZ3kgb3V0IHVzaW5nIHRoZSBzdGh5aSBpbnN0cnVjdGlvbi4gCkkn
bSBub3Qgc3VyZSBpZiB0aGVyZSBpcyBhIG5pY2UgaW4ta2VybmVsIEFQSSB0byBsZXZlcmFnZSB0
aGF0IHRob3VnaC4gCkluIGZhY3QsIGt2bV9wYXJhX2F2YWlsYWJsZSgpIHByb2JhYmx5IHNob3Vs
ZCBjaGVjayBzdGh5aSBvdXRwdXQgdG8gCmRldGVybWluZSB3aGV0aGVyIHdlIHJlYWxseSBjYW4g
dXNlIGl0LCBubz8gQ2hyaXN0aWFuPwoKCkFsZXgKCgo+Cj4gSSB0aGluayB3ZSB3aWxsIG5lZWQg
YW5vdGhlciBhcmNoIGhvb2sgdG8gY2FsbCBhIGZ1bmN0aW9uIHRoYXQgc2F5cwo+IHdoZXRoZXIg
dGhlIE9TIGlzIHJ1bm5pbmcgdmlydHVhbGl6ZWQgb24gS1ZNLgo+Cj4+PiArfQo+Pj4gKwo+Pj4g
K3N0YXRpYyBzdHJ1Y3Qga29ial9hdHRyaWJ1dGUgdXVpZCA9IF9fQVRUUl9STyh1dWlkKTsKPj4+
ICsKPj4+ICtzdGF0aWMgaW50IF9faW5pdCB1dWlkX2luaXQodm9pZCkKPj4+ICt7Cj4+PiArCWlm
ICgha3ZtX3BhcmFfYXZhaWxhYmxlKCkpCj4+PiArCQlyZXR1cm4gMDsKPj4+ICsJcmV0dXJuIHN5
c2ZzX2NyZWF0ZV9maWxlKGh5cGVydmlzb3Jfa29iaiwgJnV1aWQuYXR0cik7Cj4+PiArfQo+Pj4g
Kwo+Pj4gK2RldmljZV9pbml0Y2FsbCh1dWlkX2luaXQpOwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
