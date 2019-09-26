Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8C3BF138
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 13:24:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRpQ-0008CL-25; Thu, 26 Sep 2019 11:20:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UviC=XV=arm.com=robin.murphy@srs-us1.protection.inumbo.net>)
 id 1iDRpP-0008CG-0u
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 11:20:55 +0000
X-Inumbo-ID: b3f85038-e04f-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id b3f85038-e04f-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 11:20:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9053B142F;
 Thu, 26 Sep 2019 04:20:53 -0700 (PDT)
Received: from [192.168.1.124] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8D1D3F67D;
 Thu, 26 Sep 2019 04:20:50 -0700 (PDT)
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Rob Herring <robh+dt@kernel.org>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
 <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
 <e404c65b-5a66-6f91-5b38-8bf89a7697b2@arm.com>
 <43fb5fe1de317d65a4edf592f88ea150c6e3b8cc.camel@suse.de>
 <CAL_JsqLhx500cx3YLoC7HL1ux3bBpV+fEA2Qnk7D5RFGgiGzSw@mail.gmail.com>
 <aa4c8d62-7990-e385-2bb1-cec55148f0a8@arm.com>
 <CAL_JsqKKYcHPnA80ZwLY=Sk3e5MqrimedUhWQ5+iuPZXQxYHdA@mail.gmail.com>
 <307b988d0c67fb1c42166eca12742bcfda09d92d.camel@suse.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c27a51e1-1adf-ae6a-dc67-ae76222a1163@arm.com>
Date: Thu, 26 Sep 2019 12:20:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <307b988d0c67fb1c42166eca12742bcfda09d92d.camel@suse.de>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 00/11] of: Fix DMA configuration for non-DT
 masters
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, james.quinlan@broadcom.com,
 linux-pci@vger.kernel.org,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wOS0yNiAxMTo0NCBhbSwgTmljb2xhcyBTYWVueiBKdWxpZW5uZSB3cm90ZToKPj4+
Pj4gUm9iaW4sIGhhdmUgeW91IGxvb2tlZCBpbnRvIHN1cHBvcnRpbmcgbXVsdGlwbGUgZG1hLXJh
bmdlcz8gSXQncyB0aGUKPj4+Pj4gbmV4dCB0aGluZwo+Pj4+PiB3ZSBuZWVkIGZvciBCQ00gU1RC
J3MgUENJZS4gSSdsbCBoYXZlIGEgZ28gYXQgaXQgbXlzZWxmIGlmIG5vdGhpbmcgaXMgaW4KPj4+
Pj4gdGhlCj4+Pj4+IHdvcmtzIGFscmVhZHkuCj4+Pj4KPj4+PiBNdWx0aXBsZSBkbWEtcmFuZ2Vz
IGFzIGZhciBhcyBjb25maWd1cmluZyBpbmJvdW5kIHdpbmRvd3Mgc2hvdWxkIHdvcmsKPj4+PiBh
bHJlYWR5IG90aGVyIHRoYW4gdGhlIGJ1ZyB3aGVuIHRoZXJlJ3MgYW55IHBhcmVudCB0cmFuc2xh
dGlvbi4gQnV0IGlmCj4+Pj4geW91IG1lYW4gc3VwcG9ydGluZyBtdWx0aXBsZSBETUEgb2Zmc2V0
cyBhbmQgbWFza3MgcGVyIGRldmljZSBpbiB0aGUKPj4+PiBETUEgQVBJLCB0aGVyZSdzIG5vdGhp
bmcgaW4gdGhlIHdvcmtzIHlldC4KPiAKPiBTb3JyeSwgSSBtZWFudCBzdXBwb3J0aW5nIG11bHRp
cGxlIERNQSBvZmZzZXRzWzFdLiBJIHRoaW5rIEkgY291bGQgc3RpbGwgbWFrZQo+IGl0IHdpdGgg
YSBzaW5nbGUgRE1BIG1hc2sgdGhvdWdoLgoKVGhlIG1haW4gcHJvYmxlbSBmb3Igc3VwcG9ydGlu
ZyB0aGF0IGNhc2UgaW4gZ2VuZXJhbCBpcyB0aGUgZGlzZ3VzdGluZyAKY2FydmluZyB1cCBvZiB0
aGUgcGh5c2ljYWwgbWVtb3J5IG1hcCB5b3UgbWF5IGhhdmUgdG8gZG8gdG8gZ3VhcmFudGVlIAp0
aGF0IGEgc2luZ2xlIGJ1ZmZlciBhbGxvY2F0aW9uIGNhbm5vdCBldmVyIHNwYW4gdHdvIHdpbmRv
d3Mgd2l0aCAKZGlmZmVyZW50IG9mZnNldHMuIEkgZG9uJ3QgdGhpbmsgd2UgZXZlciByZWFjaGVk
IGEgY29uY2x1c2lvbiBvbiB3aGV0aGVyIAp0aGF0IHdhcyBldmVuIGFjaGlldmFibGUgaW4gcHJh
Y3RpY2UuCgo+Pj4gVGhlcmUncyBhbHNvIHRoZSBpbi1iZXR3ZWVuIHN0ZXAgb2YgbWFraW5nIG9m
X2RtYV9nZXRfcmFuZ2UoKSByZXR1cm4gYQo+Pj4gc2l6ZSBiYXNlZCBvbiBhbGwgdGhlIGRtYS1y
YW5nZXMgZW50cmllcyByYXRoZXIgdGhhbiBvbmx5IHRoZSBmaXJzdCBvbmUKPj4+IC0gb3RoZXJ3
aXNlLCBzb21ldGhpbmcgbGlrZSBbMV0gY2FuIGxlYWQgdG8gcHJldHR5IHVud29ya2FibGUgZGVm
YXVsdAo+Pj4gbWFza3MuIFdlIGltcGxlbWVudGVkIHRoYXQgd2hlbiBkb2luZyBhY3BpX2RtYV9n
ZXRfcmFuZ2UoKSwgaXQncyBqdXN0Cj4+PiB0aGF0IHRoZSBPRiBjb3VudGVycGFydCBuZXZlciBj
YXVnaHQgdXAuCj4+Cj4+IFJpZ2h0LiBJIHN1cHBvc2Ugd2UgYXNzdW1lIGFueSBob2xlcyBpbiB0
aGUgcmFuZ2VzIGFyZSBhZGRyZXNzYWJsZSBieQo+PiB0aGUgZGV2aWNlIGJ1dCB3b24ndCBnZXQg
dXNlZCBmb3Igb3RoZXIgcmVhc29ucyAoc3VjaCBhcyBubyBtZW1vcnkKPj4gdGhlcmUpLiBIb3dl
dmVyLCB0byBiZSBjb3JyZWN0LCB0aGUgcmFuZ2Ugb2YgdGhlIGRtYSBvZmZzZXQgcGx1cyBtYXNr
Cj4+IHdvdWxkIG5lZWQgdG8gYmUgd2l0aGluIHRoZSBtaW4gc3RhcnQgYW5kIG1heCBlbmQgYWRk
cmVzc2VzLiBJT1csCj4+IHdoaWxlIHdlIG5lZWQgdG8gcm91bmQgdXAgKDB4YV84MDAwXzAwMDAg
LSAweDJjMWNfMDAwMCkgdG8gdGhlIG5leHQKPj4gcG93ZXIgb2YgMiwgdGhlICdjb3JyZWN0JyB0
aGluZyB0byBkbyBpcyByb3VuZCBkb3duLgo+IAo+IElJVUMgSSBhbHNvIGhhdmUgdGhpcyBpc3N1
ZSBvbiBteSBsaXN0LiBUaGUgUlBpNCBQQ0llIGJsb2NrIGhhcyBhbiBpbnRlZ3JhdGlvbgo+IGJ1
ZyB0aGF0IG9ubHkgYWxsb3dzIERNQSB0byB0aGUgbG93ZXIgM0dCLiBXaXRoIGRtYS1yYW5nZXMg
b2Ygc2l6ZSAweGMwMDBfMDAwMAo+IHlvdSBnZXQgYSAzMmJpdCBETUEgbWFzayB3aWNoIGlzIG5v
dCB3aGF0IHlvdSBuZWVkLiBTbyBmYXIgSSBmYWtlZCBpdCBpbiB0aGUKPiBkZXZpY2UtdHJlZSBi
dXQgSSBndWVzcyBpdCBiZSBiZXR0ZXIgdG8gYWRkIGFuIGV4dHJhIGNoZWNrIGluCj4gb2ZfZG1h
X2NvbmZpZ3VyZSgpLCBkZWNyZWFzZSB0aGUgbWFzayBhbmQgcHJpbnQgc29tZSBraW5kIG9mIHdh
cm5pbmcgc3RhdGluZwo+IHRoYXQgRE1BIGFkZHJlc3NpbmcgaXMgc3Vib3B0aW1hbC4KClllYWgs
IHRoZXJlJ3MganVzdCBubyB3YXkgZm9yIG1hc2tzIHRvIGRlc2NyaWJlIHRoYXQgdGhlIGRldmlj
ZSBjYW4gCmRyaXZlIGFsbCB0aGUgaW5kaXZpZHVhbCBiaXRzLCBqdXN0IG5vdCBpbiBjZXJ0YWlu
IGNvbWJpbmF0aW9ucyA6KAoKVGhlIHBsYW4gSSBoYXZlIHNrZXRjaGVkIG91dCB0aGVyZSBpcyB0
byBtZXJnZSBkbWFfcGZuX29mZnNldCBhbmQgCmJ1c19kbWFfbWFzayBpbnRvIGEgIkRNQSByYW5n
ZSIgZGVzY3JpcHRvciwgc28gd2UgY2FuIHRoZW4gaGFuZyBvbmUgb3IgCm1vcmUgb2YgdGhvc2Ug
b2ZmIGEgZGV2aWNlIHRvIHByb3Blcmx5IGNvcGUgd2l0aCBhbGwgdGhlc2Ugd2VpcmQgCmludGVy
Y29ubmVjdHMuIENvbmNlcHR1YWxseSBpdCBmZWVscyBwcmV0dHkgc3RyYWlnaHRmb3J3YXJkOyBJ
IHRoaW5rIAptb3N0IG9mIHRoZSBjaGFsbGVuZ2UgaXMgaW4gaW1wbGVtZW50aW5nIGl0IGVmZmlj
aWVudGx5LiBQbHVzIHRoZXJlJ3MgCnRoZSBxdWVzdGlvbiBvZiB3aGV0aGVyIGl0IGNvdWxkIGFs
c28gc3Vic3VtZSB0aGUgZG1hX21hc2sgYXMgd2VsbC4KClJvYmluLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
