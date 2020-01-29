Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F0B14C816
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 10:30:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwjdb-0007Lf-EI; Wed, 29 Jan 2020 09:27:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/IS=3S=amazon.de=prvs=290504bcf=vrd@srs-us1.protection.inumbo.net>)
 id 1iwjda-0007LX-Gb
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 09:27:54 +0000
X-Inumbo-ID: a0146c14-4279-11ea-885e-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0146c14-4279-11ea-885e-12813bfff9fa;
 Wed, 29 Jan 2020 09:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580290074; x=1611826074;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ohEeN/1ir9Lc3RfExi+wTPx5At5vlV0k9oV/R3WgOVM=;
 b=hlSShCsJ1Yv5KFJyxNhVT9Tv4K3rWC2HRdxp0gK5WgcVnWkB7K5hlF6E
 byvrV5iaLXNZVRltfTOjPU8UMq93D3U5SwVEmJ0aoVq5szNvFGpDu3iLx
 A1z/z3Q70Oly1HpuVcSEUzrbDve2OAOd0SLqUCipT5xOjW6MBFGM6yoap 8=;
IronPort-SDR: Hpb2P1siNL0qGPLfSgkffpmHNyj6tO6CazwaExu1qEeBv82Fxss86V2Xl4zkMw65OoTk8qWIhh
 O6B2VoEYWm2Q==
X-IronPort-AV: E=Sophos;i="5.70,377,1574121600"; d="scan'208";a="21752814"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 29 Jan 2020 09:27:41 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3D219A1C68; Wed, 29 Jan 2020 09:27:40 +0000 (UTC)
Received: from EX13D22EUA003.ant.amazon.com (10.43.165.210) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 09:27:40 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D22EUA003.ant.amazon.com (10.43.165.210) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 09:27:39 +0000
Received: from u908889d5e8f057.ant.amazon.com (10.28.86.33) by
 mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 29 Jan 2020 09:27:36 +0000
To: Jan Beulich <jbeulich@suse.com>, Varad Gautam <vrd@amazon.de>
References: <1562165173-31383-1-git-send-email-vrd@amazon.de>
 <1576666417-20989-1-git-send-email-vrd@amazon.de>
 <00a6a319-0c7e-9fef-4a97-e5ca064c103c@suse.com>
From: <vrd@amazon.com>
Message-ID: <44566d7a-249d-ad90-f4b3-76e3740f9ea6@amazon.com>
Date: Wed, 29 Jan 2020 10:27:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <00a6a319-0c7e-9fef-4a97-e5ca064c103c@suse.com>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGV5IEphbiwKCk9uIDEyLzE4LzE5IDI6NDIgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE4
LjEyLjIwMTkgMTE6NTMsIFZhcmFkIEdhdXRhbSB3cm90ZToKPj4gWEVOX0RPTUNUTF9kZXN0cm95
ZG9tYWluIGNyZWF0ZXMgYSBjb250aW51YXRpb24gaWYgZG9tYWluX2tpbGwgLUVSRVNUQVJUUy4K
Pj4gSW4gdGhhdCBzY2VuYXJpbywgaXQgaXMgcG9zc2libGUgdG8gcmVjZWl2ZSBtdWx0aXBsZSBf
cGlycV9ndWVzdF91bmJpbmQKPj4gY2FsbHMgZm9yIHRoZSBzYW1lIHBpcnEgZnJvbSBkb21haW5f
a2lsbCwgaWYgdGhlIHBpcnEgaGFzIG5vdCB5ZXQgYmVlbgo+PiByZW1vdmVkIGZyb20gdGhlIGRv
bWFpbidzIHBpcnFfdHJlZSwgYXM6Cj4+ICAgIGRvbWFpbl9raWxsKCkKPj4gICAgICAtPiBkb21h
aW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKQo+PiAgICAgICAgLT4gcGNpX3JlbGVhc2VfZGV2aWNl
cygpCj4+ICAgICAgICAgIC0+IHBjaV9jbGVhbl9kcGNpX2lycSgpCj4+ICAgICAgICAgICAgLT4g
cGlycV9ndWVzdF91bmJpbmQoKQo+PiAgICAgICAgICAgICAgLT4gX19waXJxX2d1ZXN0X3VuYmlu
ZCgpCj4+Cj4+IEZvciBhIHNoYXJlZCBwaXJxIChucl9ndWVzdHMgPiAxKSwgdGhlIGZpcnN0IGNh
bGwgd291bGQgemFwIHRoZSBjdXJyZW50Cj4+IGRvbWFpbiBmcm9tIHRoZSBwaXJxJ3MgZ3Vlc3Rz
W10gbGlzdCwgYnV0IHRoZSBhY3Rpb24gaGFuZGxlciBpcyBuZXZlciBmcmVlZAo+PiBhcyB0aGVy
ZSBhcmUgb3RoZXIgZ3Vlc3RzIHVzaW5nIHRoaXMgcGlycS4gQXMgYSByZXN1bHQsIG9uIHRoZSBz
ZWNvbmQgY2FsbCwKPj4gX19waXJxX2d1ZXN0X3VuYmluZCBzZWFyY2hlcyBmb3IgdGhlIGN1cnJl
bnQgZG9tYWluIHdoaWNoIGhhcyBiZWVuIHJlbW92ZWQKPj4gZnJvbSB0aGUgZ3Vlc3RzW10gbGlz
dCwgYW5kIGhpdHMgYSBCVUdfT04uCj4gVGhlcmUgbXVzdCBiZSBtb3JlIHRvIHRoaXMsIHNlZWlu
ZyB0aGUgY2xlYW51cF9kb21haW5faXJxX3BpcnEoKQo+IGludm9jYXRpb24gYXQgdGhlIGVuZCBv
ZiBwaXJxX2d1ZXN0X3VuYmluZCgpLCB3aGljaCBvdWdodCB0byBiZQo+IHJlYWNoZWQgaW4gdGhl
IGNhc2UgeW91IGRlc2NyaWJlLgoKClRoZSBjYWxscyB0byBfX3BpcnFfZ3Vlc3RfdW5iaW5kIGFu
ZCBjbGVhbnVwX2RvbWFpbl9pcnFfcGlycSBmcm9tIApwaXJxX2d1ZXN0X3VuYmluZCBhcmUgZ29p
bmcgdG8gYmUgbXV0dWFsbHkgZXhjbHVzaXZlLCBzaW5jZSBpcnEgZGVmYXVsdHMgCnRvIDAuCgoK
Pj4gLS0tIGEveGVuL2FyY2gveDg2L2lycS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwo+
PiBAQCAtMTg2Myw3ICsxODYzLDE2IEBAIHN0YXRpYyBpcnFfZ3Vlc3RfYWN0aW9uX3QgKl9fcGly
cV9ndWVzdF91bmJpbmQoCj4+ICAgCj4+ICAgICAgIGZvciAoIGkgPSAwOyAoaSA8IGFjdGlvbi0+
bnJfZ3Vlc3RzKSAmJiAoYWN0aW9uLT5ndWVzdFtpXSAhPSBkKTsgaSsrICkKPj4gICAgICAgICAg
IGNvbnRpbnVlOwo+PiAtICAgIEJVR19PTihpID09IGFjdGlvbi0+bnJfZ3Vlc3RzKTsKPj4gKyAg
ICBpZiAoIGkgPT0gYWN0aW9uLT5ucl9ndWVzdHMgKSB7Cj4gQnJhY2Ugb24gaXRzIG93biBsaW5l
IHBsZWFzZS4KPgo+PiArICAgICAgICBBU1NFUlQoYWN0aW9uLT5ucl9ndWVzdHMgPiAwKSA7Cj4g
U3RyYXkgYmxhbmsuCj4KPj4gKyAgICAgICAgLyogSW4gY2FzZSB0aGUgcGlycSB3YXMgc2hhcmVk
LCB1bmJvdW5kIGZvciB0aGlzIGRvbWFpbiBpbiBhbiBlYXJsaWVyIGNhbGwsIGJ1dCBzdGlsbAo+
PiArICAgICAgICAgKiBleGlzdGVkIG9uIHRoZSBkb21haW4ncyBwaXJxX3RyZWUsIHdlIHN0aWxs
IHJlYWNoIGhlcmUgaWYgdGhlcmUgYXJlIGFueSBsYXRlcgo+PiArICAgICAgICAgKiB1bmJpbmQg
Y2FsbHMgb24gdGhlIHNhbWUgcGlycS4gUmV0dXJuIGlmIHN1Y2ggYW4gdW5iaW5kIGhhcHBlbnMu
ICovCj4+ICsgICAgICAgIGlmICggYWN0aW9uLT5zaGFyZWFibGUgKQo+IExvbmcgbGluZXMgYW5k
IG1hbGZvcm1lZCBjb21tZW50LgoKCkhhbmRsZWQgYWxsIHN0eWxlIGZpeHVwcyBpbiB2My4KCgo+
IERvIHlvdSBwZXJoYXBzIGFsc28gd2FudCB0byBjaGVjayB0aGF0IHlvdSB0YWtlIHRoaXMgcGF0
aCBvbmx5Cj4gZm9yIGR5aW5nIGd1ZXN0cz8KCgpUaGUgcGF0Y2ggaXMgYWJvdXQgbWFraW5nIHBp
cnFfZ3Vlc3RfdW5iaW5kKCkgcmVzaWxpZW50L3NhZmUgdG8gbXVsdGlwbGUgCmNhbGxzLiBBdCBw
cmVzZW50LCB0aGlzIGhhcHBlbnMgd2hlbiBkb21haW5fa2lsbCAtRVJFU1RBUlRzIGZvciBkeWlu
ZyAKZ3Vlc3RzLiBJdCBtaWdodCBhbHNvIGhhcHBlbiBpbiBvdGhlciBjYXNlcyAtIGFuZCBzaG91
bGRuJ3QgY2F1c2UgeGVuIHRvIApjcmFzaC4KCgo+IEphbgo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBD
ZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRz
ZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2Vu
IGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBC
ZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
