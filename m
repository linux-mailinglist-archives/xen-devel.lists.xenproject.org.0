Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE52B0A3E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 10:25:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8KNZ-0001a9-1l; Thu, 12 Sep 2019 08:23:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8KNX-0001a1-HP
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 08:22:59 +0000
X-Inumbo-ID: 870ab8be-d536-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 870ab8be-d536-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 08:22:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E951EB65D;
 Thu, 12 Sep 2019 08:22:57 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-2-andrew.cooper3@citrix.com>
 <1bd690aa-bd94-48df-c9a4-c619c02fa408@suse.com>
 <170fe9e0-bdbe-94d1-cc53-cb4128b3079a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f4464d0f-4c00-2513-46ce-cfc0c5b34448@suse.com>
Date: Thu, 12 Sep 2019 10:22:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <170fe9e0-bdbe-94d1-cc53-cb4128b3079a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/8] libx86: Introduce
 x86_cpu_policies_are_compatible()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAwOTo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMi8wOS8yMDE5
IDA4OjQzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTEuMDkuMjAxOSAyMjowNCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IFRoaXMgaGVscGVyIHdpbGwgZXZlbnR1YWxseSBiZSB0aGUgY29y
ZSAiY2FuIGEgZ3Vlc3QgY29uZml1cmVkIGxpa2UgdGhpcyBydW4KPj4+IG9uIHRoZSBDUFU/IiBs
b2dpYy4gIEZvciBub3csIGl0IGlzIGp1c3QgZW5vdWdoIG9mIGEgc3R1YiB0byBhbGxvdyB1cyB0
bwo+Pj4gcmVwbGFjZSB0aGUgaHlwZXJjYWxsIGludGVyZmFjZSB3aGlsZSByZXRhaW5pbmcgdGhl
IHByZXZpb3VzIGJlaGF2aW91ci4KPj4+Cj4+PiBJdCB3aWxsIGJlIGV4cGFuZGVkIGFzIHZhcmlv
dXMgb3RoZXIgYml0cyBvZiBDUFVJRCBoYW5kbGluZyBnZXQgY2xlYW5lZCB1cC4KPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+
PiBGdW5kYW1lbnRhbGx5Cj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4+IGJ1dCBhIGNvdXBsZSBvZiByZW1hcmtzOgo+Pgo+PiBGb3Igb25lLCBkZXNwaXRl
IGJlaW5nIGp1c3QgdGVzdGluZyBjb2RlLCBJIHRoaW5rIHRoZSB0d28gdGVzdFtdCj4+IGFycmF5
cyBjb3VsZCBkbyB3aXRoIGNvbnN0aWZpY2F0aW9uLgo+IAo+IFNhZGx5IHRoZXkgY2FuJ3QuwqAg
SXQgaXMgYSBjb25zZXF1ZW5jZSBvZiBzdHJ1Y3QgY3B1X3BvbGljeSB1c2luZwo+IG5vbi1jb25z
dCBwb2ludGVycy4KPiAKPiBJIHRyaWVkIGludHJvZHVjaW5nIHN0cnVjdCBjb25zdF9jcHVfcG9s
aWN5IGJ1dCB0aGF0IGlzIGV2ZW4gd29yc2UKPiBiZWNhdXNlIGl0IHByb2hpYml0cyBvcGVyYXRp
bmcgb24gdGhlIHN5c3RlbSBwb2xpY3kgb2JqZWN0cyBpbiBYZW4uCj4gCj4gT3ZlcmFsbCwgZHJv
cHBpbmcgYSBjb25zdCBpbiB0aGUgdW5pdCB0ZXN0cyB0dXJuZWQgb3V0IHRvIGJlIHRoZSBsZWFz
dAo+IGJhZCBvcHRpb24sIHVubGVzcyB5b3UgaGF2ZSBhIHJhZGljYWxseSBkaWZmZXJlbnQgc3Vn
Z2VzdGlvbiB0byB0cnkuCj4gCj4+Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbGliL3g4Ni9j
cHUtcG9saWN5LmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9saWIveDg2L2NwdS1wb2xpY3ku
aAo+Pj4gQEAgLTExLDYgKzExLDI1IEBAIHN0cnVjdCBjcHVfcG9saWN5Cj4+PiAgICAgIHN0cnVj
dCBtc3JfcG9saWN5ICptc3I7Cj4+PiAgfTsKPj4+ICAKPj4+ICtzdHJ1Y3QgY3B1X3BvbGljeV9l
cnJvcnMKPj4+ICt7Cj4+PiArICAgIHVpbnQzMl90IGxlYWYsIHN1YmxlYWY7Cj4+PiArICAgIHVp
bnQzMl90IG1zcjsKPj4+ICt9Owo+Pj4gKwo+Pj4gKyNkZWZpbmUgSU5JVF9DUFVfUE9MSUNZX0VS
Uk9SUyB7IH4wdSwgfjB1LCB+MHUgfQo+PiBJbnN0ZWFkIG9mIHRoaXMgKGFuZCB1c2luZyBpdCBp
biBldmVyeSBjYWxsZXIpLCBjb3VsZG4ndCB0aGUgZnVuY3Rpb24KPj4gZmlsbCB0aGlzIGZpcnN0
IHRoaW5nPyAoVGhlIGluaXRpYWxpemVyIGlzbid0IHN0cmljdGx5IG5lZWRlZCBhbnl3YXksCj4+
IGFzIGNvbnN1bWVycyBhcmUgc3VwcG9zZWQgdG8gbG9vayBhdCB0aGUgc3RydWN0dXJlIG9ubHkg
d2hlbiBoYXZpbmcKPj4gZ290IGJhY2sgYW4gZXJyb3IgZnJvbSB0aGUgZnVuY3Rpb24sIGJ1dCBz
aW5jZSBlcnJvciBwYXRocyBmaWxsIGp1c3QKPj4gYSBzdWJzZXQgb2YgdGhlIGZpZWxkcyBJIGNh
biBzZWUgaG93IHByZS1maWxsaW5nIHRoZSB3aG9sZSBzdHJ1Y3R1cmUKPj4gaXMgZWFzaWVyLikK
PiAKPiBBdCB0aGUgbW9tZW50LCBlcnJvciBwb2ludGVycyBhcmUgY29uZGl0aW9uYWxseSB3cml0
dGVuIG9uIGVycm9yLCB3aGljaAo+IG1lYW5zIHRoYXQgYWxsIGNhbGxlcnMgcGFzc2luZyBub24t
TlVMTCBuZWVkIHRvIGluaXRpYWxpc2UuCj4gCj4gVGhpcyBjb3VsZCBiZSBhbHRlcmVkIHRvIGhh
dmUgeGNfc2V0X2RvbWFpbl9jcHVfcG9saWN5KCkgYW5kCj4geDg2X2NwdV9wb2xpY2llc19hcmVf
Y29tcGF0aWJsZSgpIHByby1hY3RpdmVseSBzZXQgIm5vIGVycm9yIiB0byBiZWdpbgo+IHdpdGgs
IGJ1dCB0aGF0IGRvZXNuJ3QgcmVtb3ZlIHRoZSBuZWVkIGZvciBJTklUX0NQVV9QT0xJQ1lfRVJS
T1JTIGluIHRoZQo+IGZpcnN0IHBsYWNlLgoKUmlnaHQsIEkgZGlkIG5vdGljZSB0aGlzIGluIGEg
bGF0ZXIgcGF0Y2guIEJ1dCB5ZXMsIEkgZG8gdGhpbmsKaGF2aW5nIHRoZSBmdW5jdGlvbnMgcHJv
YWN0aXZlbHkgZmlsbCB0aGUgc3RydWN0dXJlcyB3b3VsZCBiZQpiZXR0ZXIgb3ZlcmFsbCAoYW5k
IHJlbW92ZSB0aGUgbmVlZCB0byB1c2UgdGhlIGluaXRpYWxpemVyIGluIGF0CmxlYXN0IHNvbWUg
Y2FzZXMsIGkuZS4gd2hlcmUgdGhlcmUgYXJlIG5vIG90aGVyIGVhcmx5IGVycm9yIHBhdGhzKS4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
