Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F0B173370
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 10:01:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7bTN-0005BE-HH; Fri, 28 Feb 2020 08:58:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xa6/=4Q=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j7bTM-0005B9-3f
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 08:58:16 +0000
X-Inumbo-ID: 748e0c8e-5a08-11ea-b0f0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 748e0c8e-5a08-11ea-b0f0-bc764e2007e4;
 Fri, 28 Feb 2020 08:58:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F26A6AD08;
 Fri, 28 Feb 2020 08:58:13 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200228071922.3983-1-jgross@suse.com>
 <e9dd548a-9a32-3d45-3daf-30f080df0b74@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <47ddfaf8-273c-ab52-866d-52d0ca5f3aee@suse.com>
Date: Fri, 28 Feb 2020 09:58:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e9dd548a-9a32-3d45-3daf-30f080df0b74@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen: make sure stop_machine_run() is
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAgMDk6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI4LjAyLjIwMjAgMDg6
MTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFdpdGggY29yZSBzY2hlZHVsaW5nIGFjdGl2ZSBp
dCBpcyBtYW5kYXRvcnkgZm9yIHN0b3BfbWFjaGluZV9ydW4oKSB0bwo+PiBiZSBjYWxsZWQgaW4g
aWRsZSBjb250ZXh0IG9ubHkgKHNvIGVpdGhlciBkdXJpbmcgYm9vdCBvciBpbiBhIHRhc2tsZXQp
LAo+PiBhcyBvdGhlcndpc2UgYSBzY2hlZHVsaW5nIGRlYWRsb2NrIHdvdWxkIG9jY3VyOiBzdG9w
X21hY2hpbmVfcnVuKCkKPj4gZG9lcyBhIGNwdSByZW5kZXp2b3VzIGJ5IGFjdGl2YXRpbmcgYSB0
YXNrbGV0IG9uIGFsbCBvdGhlciBjcHVzLiBJbgo+PiBjYXNlIHN0b3BfbWFjaGluZV9ydW4oKSB3
YXMgbm90IGNhbGxlZCBpbiBhbiBpZGxlIHZjcHUgaXQgd291bGQgYmxvY2sKPj4gc2NoZWR1bGlu
ZyB0aGUgaWRsZSB2Y3B1IG9uIGl0cyBzaWJsaW5ncyB3aXRoIGNvcmUgc2NoZWR1bGluZyBiZWlu
Zwo+PiBhY3RpdmUsIHJlc3VsdGluZyBpbiBhIGhhbmcuCj4+Cj4+IFB1dCBhIEJVR19PTigpIGlu
dG8gc3RvcF9tYWNoaW5lX3J1bigpIHRvIHRlc3QgZm9yIGJlaW5nIGNhbGxlZCBpbiBhbgo+PiBp
ZGxlIHZjcHUgb25seSBhbmQgYWRhcHQgdGhlIG1pc3NpbmcgY2FsbCBzaXRlICh1Y29kZSBsb2Fk
aW5nKSB0byB1c2UgYQo+PiB0YXNrbGV0IGZvciBjYWxsaW5nIHN0b3BfbWFjaGluZV9ydW4oKS4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiAt
LS0KPj4gVjI6Cj4+IC0gcmVwaHJhc2UgY29tbWl0IG1lc3NhZ2UgKEp1bGllbiBHcmFsbCkKPj4g
LS0tCj4+ICAgeGVuL2FyY2gveDg2L21pY3JvY29kZS5jICB8IDU0ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgeGVuL2NvbW1vbi9zdG9wX21hY2hp
bmUuYyB8ICAxICsKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDIwIGRl
bGV0aW9ucygtKQo+IAo+IFRoZXJlJ3Mgbm8gbWVudGlvbiBhbnl3aGVyZSBvZiBhIGNvbm5lY3Rp
b24gdG8geW91ciBSQ1Ugc2VyaWVzLAo+IG5vciB0byByY3VfYmFycmllcigpLiBZZXQgdGhlIGNo
YW5nZSBwdXRzIGEgbmV3IHJlc3RyaWN0aW9uIGFsc28KPiBvbiBpdHMgdXNlLCBhbmQgaWlyYyB0
aGlzIHdhcyBtZW50aW9uZWQgaW4gcHJpb3IgZGlzY3Vzc2lvbi4gRGlkCj4gSSBtaXNzIGFueXRo
aW5nPwoKQmFzaWNhbGx5IHRoaXMgcGF0Y2ggbWFrZXMgdGhlIHJlc3RyaWN0aW9uIGV4cGxpY2l0
LiBXaXRob3V0IHRoZSBwYXRjaApzdG9wX21hY2hpbmVfcnVuKCkgYmVpbmcgY2FsbGVkIG91dHNp
ZGUgb2YgYSB0YXNrbGV0IHdvdWxkIGp1c3QgaGFuZwp3aXRoIGNvcmUgc2NoZWR1bGluZyBiZWlu
ZyBhY3RpdmUuIE5vdyBpdCB3aWxsIGNhdGNoIHRob3NlIHZpb2xhdGlvbnMKZWFybHkgZXZlbiB3
aXRoIGNvcmUgc2NoZWR1bGluZyBpbmFjdGl2ZS4KCk5vdGUgdGhhdCBjdXJyZW50bHkgdGhlcmUg
YXJlIG5vIHZpb2xhdGlvbnMgb2YgdGhpcyByZXN0cmljdGlvbiBhbnl3aGVyZQppbiB0aGUgaHlw
ZXJ2aXNvciBvdGhlciB0aGFuIHRoZSBvbmUgYWRkcmVzc2VkIGJ5IHRoaXMgcGF0Y2guCgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
