Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA00DBE78D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 23:37:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDEuo-0002tQ-6R; Wed, 25 Sep 2019 21:33:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rb0t=XU=kernel.org=robh+dt@srs-us1.protection.inumbo.net>)
 id 1iDEum-0002tL-Ro
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 21:33:36 +0000
X-Inumbo-ID: 218ba2f4-dfdc-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 218ba2f4-dfdc-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 21:33:36 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A0B7B222C2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 21:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569447215;
 bh=TszXw7S5GIEzEo992EEMfz4W0WtzSxu1MBpaBhf4tmw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QlI2Sj1D5LJahPlbpQRPzC/Kfp42A3NwekR29GtyvfIPAZlvPN1zAfycydpBTfcd8
 IvT8WVCyptqcO23hrQq7/1AbSsfzPRa68TLRQRP+hrXx+5Qsz/4M4CfEt25gMVn9on
 EMq0EmayAeKNvnaIFqzE8CzGz5kGoSiMNjw4W64I=
Received: by mail-qt1-f177.google.com with SMTP id o12so292317qtf.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 14:33:35 -0700 (PDT)
X-Gm-Message-State: APjAAAUFkzxcbsuHlWt/IXm6rtVEDdnqG7fDLyidzlY8PFrhWpjb9Dol
 YxRfIhiNH2iwiGg7Ph3qbYGcRzdECG44dnH+/A==
X-Google-Smtp-Source: APXvYqy9YJ9VRUtFzrkZ+iKb5Tx5rlamJJuwaAKBRmCflwCEbYKpuVBbZPPVrEImTOCJgn8Jl5TlEwRQfbhe0HNZXOU=
X-Received: by 2002:a0c:8a6d:: with SMTP id 42mr1647258qvu.138.1569447214653; 
 Wed, 25 Sep 2019 14:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
 <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
 <e404c65b-5a66-6f91-5b38-8bf89a7697b2@arm.com>
 <43fb5fe1de317d65a4edf592f88ea150c6e3b8cc.camel@suse.de>
 <CAL_JsqLhx500cx3YLoC7HL1ux3bBpV+fEA2Qnk7D5RFGgiGzSw@mail.gmail.com>
 <aa4c8d62-7990-e385-2bb1-cec55148f0a8@arm.com>
In-Reply-To: <aa4c8d62-7990-e385-2bb1-cec55148f0a8@arm.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 25 Sep 2019 16:33:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKKYcHPnA80ZwLY=Sk3e5MqrimedUhWQ5+iuPZXQxYHdA@mail.gmail.com>
Message-ID: <CAL_JsqKKYcHPnA80ZwLY=Sk3e5MqrimedUhWQ5+iuPZXQxYHdA@mail.gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org,
 Matthias Brugger <mbrugger@suse.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>,
 james.quinlan@broadcom.com, linux-pci@vger.kernel.org,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org,
 Dan Williams <dan.j.williams@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTE6NTIgQU0gUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJw
aHlAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAyNS8wOS8yMDE5IDE3OjE2LCBSb2IgSGVycmluZyB3
cm90ZToKPiA+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDEwOjMwIEFNIE5pY29sYXMgU2Flbnog
SnVsaWVubmUKPiA+IDxuc2FlbnpqdWxpZW5uZUBzdXNlLmRlPiB3cm90ZToKPiA+Pgo+ID4+IE9u
IFdlZCwgMjAxOS0wOS0yNSBhdCAxNjowOSArMDEwMCwgUm9iaW4gTXVycGh5IHdyb3RlOgo+ID4+
PiBPbiAyNS8wOS8yMDE5IDE1OjUyLCBOaWNvbGFzIFNhZW56IEp1bGllbm5lIHdyb3RlOgo+ID4+
Pj4gT24gVHVlLCAyMDE5LTA5LTI0IGF0IDE2OjU5IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToK
PiA+Pj4+PiBPbiBUdWUsIFNlcCAyNCwgMjAxOSBhdCAxOjEyIFBNIE5pY29sYXMgU2FlbnogSnVs
aWVubmUKPiA+Pj4+PiA8bnNhZW56anVsaWVubmVAc3VzZS5kZT4gd3JvdGU6Cj4gPj4+Pj4+IEhp
IEFsbCwKPiA+Pj4+Pj4gdGhpcyBzZXJpZXMgdHJpZXMgdG8gYWRkcmVzcyBvbmUgb2YgdGhlIGlz
c3VlcyBibG9ja2luZyB1cyBmcm9tCj4gPj4+Pj4+IHVwc3RyZWFtaW5nIEJyb2FkY29tJ3MgU1RC
IFBDSWUgY29udHJvbGxlclsxXS4gTmFtZWx5LCB0aGUgZmFjdCB0aGF0Cj4gPj4+Pj4+IGRldmlj
ZXMgbm90IHJlcHJlc2VudGVkIGluIERUIHdoaWNoIHNpdCBiZWhpbmQgYSBQQ0kgYnVzIGZhaWwg
dG8gZ2V0IHRoZQo+ID4+Pj4+PiBidXMnIERNQSBhZGRyZXNzaW5nIGNvbnN0cmFpbnRzLgo+ID4+
Pj4+Pgo+ID4+Pj4+PiBUaGlzIGlzIGR1ZSB0byB0aGUgZmFjdCB0aGF0IG9mX2RtYV9jb25maWd1
cmUoKSBhc3N1bWVzIGl0J3MgcmVjZWl2aW5nIGEKPiA+Pj4+Pj4gRFQgbm9kZSByZXByZXNlbnRp
bmcgdGhlIGRldmljZSBiZWluZyBjb25maWd1cmVkLCBhcyBvcHBvc2VkIHRvIHRoZSBQQ0llCj4g
Pj4+Pj4+IGJyaWRnZSBub2RlIHdlIGN1cnJlbnRseSBwYXNzLiBUaGlzIGNhdXNlcyB0aGUgY29k
ZSB0byBkaXJlY3RseSBqdW1wCj4gPj4+Pj4+IGludG8gUENJJ3MgcGFyZW50IG5vZGUgd2hlbiBj
aGVja2luZyBmb3IgJ2RtYS1yYW5nZXMnIGFuZCBtaXNzZXMKPiA+Pj4+Pj4gd2hhdGV2ZXIgd2Fz
IHNldCB0aGVyZS4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gVG8gYWRkcmVzcyB0aGlzIEkgY3JlYXRlIGEg
bmV3IEFQSSBpbiBPRiAtIGluc3BpcmVkIGZyb20gUm9iaW4gTXVycGh5cwo+ID4+Pj4+PiBvcmln
aW5hbCBwcm9wb3NhbFsyXSAtIHdoaWNoIGFjY2VwdHMgYSBidXMgRFQgbm9kZSBhcyBpdCdzIGlu
cHV0IGluCj4gPj4+Pj4+IG9yZGVyIHRvIGNvbmZpZ3VyZSBhIGRldmljZSdzIERNQSBjb25zdHJh
aW50cy4gVGhlIGNoYW5nZXMgZ28gZGVlcCBpbnRvCj4gPj4+Pj4+IG9mL2FkZHJlc3MuYydzIGlt
cGxlbWVudGF0aW9uLCBhcyBhIGRldmljZSBiZWluZyBoYXZpbmcgYSBEVCBub2RlCj4gPj4+Pj4+
IGFzc3VtcHRpb24gd2FzIHByZXR0eSBzdHJvbmcuCj4gPj4+Pj4+Cj4gPj4+Pj4+IE9uIHRvcCBv
ZiB0aGlzIHdvcmssIEkgYWxzbyBjbGVhbmVkIHVwIG9mX2RtYV9jb25maWd1cmUoKSByZW1vdmlu
ZyBpdHMKPiA+Pj4+Pj4gcmVkdW5kYW50IGFyZ3VtZW50cyBhbmQgY3JlYXRpbmcgYW4gYWx0ZXJu
YXRpdmUgZnVuY3Rpb24gZm9yIHRoZSBzcGVjaWFsCj4gPj4+Pj4+IGNhc2VzCj4gPj4+Pj4+IG5v
dCBhcHBsaWNhYmxlIHRvIGVpdGhlciB0aGUgYWJvdmUgY2FzZSBvciB0aGUgZGVmYXVsdCB1c2Fn
ZS4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gSU1PIHRoZSByZXN1bHRpbmcgZnVuY3Rpb25zIGFyZSBtb3Jl
IGV4cGxpY2l0LiBUaGV5IHdpbGwgcHJvYmFibHkKPiA+Pj4+Pj4gc3VyZmFjZSBzb21lIGhhY2t5
IHVzYWdlcyB0aGF0IGNhbiBiZSBwcm9wZXJseSBmaXhlZCBhcyBJIHNob3cgd2l0aCB0aGUKPiA+
Pj4+Pj4gRFQgZml4ZXMgb24gdGhlIExheWVyc2NhcGUgcGxhdGZvcm0uCj4gPj4+Pj4+Cj4gPj4+
Pj4+IFRoaXMgd2FzIGFsc28gdGVzdGVkIG9uIGEgUmFzcGJlcnJ5IFBpIDQgd2l0aCBhIGN1c3Rv
bSBQQ0llIGRyaXZlciBhbmQKPiA+Pj4+Pj4gb24gYSBTZWF0dGxlIEFNRCBib2FyZC4KPiA+Pj4+
Pgo+ID4+Pj4+IEh1bW0sIEkndmUgYmVlbiB3b3JraW5nIG9uIHRoaXMgaXNzdWUgdG9vLiBMb29r
cyBzaW1pbGFyIHRob3VnaCB5b3Vycwo+ID4+Pj4+IGhhcyBhIGxvdCBtb3JlIGNodXJuIGFuZCB0
aGVyZSdzIHNvbWUgb3RoZXIgYnVncyBJJ3ZlIGZvdW5kLgo+ID4+Pj4KPiA+Pj4+IFRoYXQncyBn
b29kIG5ld3MsIGFuZCB5ZXMgbm93IHRoYXQgSSBzZWUgaXQsIHNvbWUgc3R1ZmYgb24gbXkgc2Vy
aWVzIGlzCj4gPj4+PiBvdmVybHkKPiA+Pj4+IGNvbXBsaWNhdGVkLiBTcGVjaWFsbHkgYXJvdW5k
IG9mX3RyYW5zbGF0ZV8qKCkuCj4gPj4+Pgo+ID4+Pj4gT24gdG9wIG9mIHRoYXQsIHlvdSByZW1v
dmVkIGluIG9mX2RtYV9nZXRfcmFuZ2UoKToKPiA+Pj4+Cj4gPj4+PiAtICAgLyoKPiA+Pj4+IC0g
ICAgKiBBdCBsZWFzdCBlbXB0eSByYW5nZXMgaGFzIHRvIGJlIGRlZmluZWQgZm9yIHBhcmVudCBu
b2RlIGlmCj4gPj4+PiAtICAgICogRE1BIGlzIHN1cHBvcnRlZAo+ID4+Pj4gLSAgICAqLwo+ID4+
Pj4gLSAgIGlmICghcmFuZ2VzKQo+ID4+Pj4gLSAgICAgICAgICAgYnJlYWs7Cj4gPj4+Pgo+ID4+
Pj4gV2hpY2ggSSBhc3N1bWVkIHdhcyBib3VuZCB0byB0aGUgc3RhbmRhcmQgYW5kIG1ha2VzIHRo
aW5ncyBlYXNpZXIuCj4gPj4+Pgo+ID4+Pj4+IENhbiB5b3UgdGVzdCBvdXQgdGhpcyBicmFuY2hb
MV0uIEkgZG9uJ3QgaGF2ZSBhbnkgaC93IG5lZWRpbmcgdGhpcywKPiA+Pj4+PiBidXQgd3JvdGUg
YSB1bml0dGVzdCBhbmQgdGVzdGVkIHdpdGggbW9kaWZpZWQgUUVNVS4KPiA+Pj4+Cj4gPj4+PiBJ
IHJldmlld2VkIGV2ZXJ5dGhpbmcsIEkgZGlkIGZpbmQgYSBtaW5vciBpc3N1ZSwgc2VlIHRoZSBw
YXRjaCBhdHRhY2hlZC4KPiA+Pj4KPiA+Pj4gV1JUIHRoYXQgcGF0Y2gsIHRoZSBvcmlnaW5hbCBp
bnRlbnQgb2YgImZvcmNlX2RtYSIgd2FzIHB1cmVseSB0bwo+ID4+PiBjb25zaWRlciBhIGRldmlj
ZSBETUEtY2FwYWJsZSByZWdhcmRsZXNzIG9mIHRoZSBwcmVzZW5jZSBvZgo+ID4+PiAiZG1hLXJh
bmdlcyIuIEV4cGVjdGluZyBvZl9kbWFfY29uZmlndXJlKCkgdG8gZG8gYW55dGhpbmcgZm9yIGEg
bm9uLU9GCj4gPj4+IGRldmljZSBoYXMgYWx3YXlzIGJlZW4gYm9ndXMgLSBtYWdpYyBwYXJhdmly
dCBkZXZpY2VzIHdoaWNoIGFwcGVhciBvdXQKPiA+Pj4gb2Ygbm93aGVyZSBhbmQgZXhwZWN0IHRv
IGJlIHRyZWF0ZWQgYXMgZ2VudWluZSBETUEgbWFzdGVycyBhcmUgYQo+ID4+PiBzZXBhcmF0ZSBw
cm9ibGVtIHRoYXQgd2UgaGF2ZW4ndCByZWFsbHkgYXBwcm9hY2hlZCB5ZXQuCj4gPj4KPiA+PiBJ
IGFncmVlIGl0J3MgY2xlYXJseSBhYnVzaW5nIHRoZSBmdW5jdGlvbi4gSSBoYXZlIG5vIHByb2Js
ZW0gd2l0aCB0aGUgYmVoYXZpb3VyCj4gPj4gY2hhbmdlIGlmIGl0J3MgT0sgd2l0aCB5b3UuCj4K
PiBUaGlua2luZyBhYm91dCBpdCwgeW91IGNvdWxkIHByb2JhYmx5IGp1c3QgcmVtb3ZlIHRoYXQg
Y2FsbCBmcm9tIHRoZSBYZW4KPiBEUk0gZHJpdmVyIG5vdyBhbnl3YXkgLSBzaW5jZSB0aGUgZG1h
LWRpcmVjdCByZXdvcmssIHdlIGxvc3QgdGhlIGFiaWxpdHkKPiB0byBzZXQgZG1hX2R1bW15X29w
cyBieSBkZWZhdWx0LCBhbmQgTlVMTCBvcHMgbm93IHJlcHJlc2VudCB3aGF0IGl0Cj4gKHByZXN1
bWFibHkpIHdhbnRzLgoKTm90IHhlbl9kbWFfb3BzPyBJbiBhbnkgY2FzZSwgSSdsbCBzZW5kIG91
dCBhIHBhdGNoIGZvciB0aGUgdGhlIFhlbgpmb2xrcyB0byBjb21tZW50IG9uLgoKPiA+PiBSb2Jp
biwgaGF2ZSB5b3UgbG9va2VkIGludG8gc3VwcG9ydGluZyBtdWx0aXBsZSBkbWEtcmFuZ2VzPyBJ
dCdzIHRoZSBuZXh0IHRoaW5nCj4gPj4gd2UgbmVlZCBmb3IgQkNNIFNUQidzIFBDSWUuIEknbGwg
aGF2ZSBhIGdvIGF0IGl0IG15c2VsZiBpZiBub3RoaW5nIGlzIGluIHRoZQo+ID4+IHdvcmtzIGFs
cmVhZHkuCj4gPgo+ID4gTXVsdGlwbGUgZG1hLXJhbmdlcyBhcyBmYXIgYXMgY29uZmlndXJpbmcg
aW5ib3VuZCB3aW5kb3dzIHNob3VsZCB3b3JrCj4gPiBhbHJlYWR5IG90aGVyIHRoYW4gdGhlIGJ1
ZyB3aGVuIHRoZXJlJ3MgYW55IHBhcmVudCB0cmFuc2xhdGlvbi4gQnV0IGlmCj4gPiB5b3UgbWVh
biBzdXBwb3J0aW5nIG11bHRpcGxlIERNQSBvZmZzZXRzIGFuZCBtYXNrcyBwZXIgZGV2aWNlIGlu
IHRoZQo+ID4gRE1BIEFQSSwgdGhlcmUncyBub3RoaW5nIGluIHRoZSB3b3JrcyB5ZXQuCj4KPiBU
aGVyZSdzIGFsc28gdGhlIGluLWJldHdlZW4gc3RlcCBvZiBtYWtpbmcgb2ZfZG1hX2dldF9yYW5n
ZSgpIHJldHVybiBhCj4gc2l6ZSBiYXNlZCBvbiBhbGwgdGhlIGRtYS1yYW5nZXMgZW50cmllcyBy
YXRoZXIgdGhhbiBvbmx5IHRoZSBmaXJzdCBvbmUKPiAtIG90aGVyd2lzZSwgc29tZXRoaW5nIGxp
a2UgWzFdIGNhbiBsZWFkIHRvIHByZXR0eSB1bndvcmthYmxlIGRlZmF1bHQKPiBtYXNrcy4gV2Ug
aW1wbGVtZW50ZWQgdGhhdCB3aGVuIGRvaW5nIGFjcGlfZG1hX2dldF9yYW5nZSgpLCBpdCdzIGp1
c3QKPiB0aGF0IHRoZSBPRiBjb3VudGVycGFydCBuZXZlciBjYXVnaHQgdXAuCgpSaWdodC4gSSBz
dXBwb3NlIHdlIGFzc3VtZSBhbnkgaG9sZXMgaW4gdGhlIHJhbmdlcyBhcmUgYWRkcmVzc2FibGUg
YnkKdGhlIGRldmljZSBidXQgd29uJ3QgZ2V0IHVzZWQgZm9yIG90aGVyIHJlYXNvbnMgKHN1Y2gg
YXMgbm8gbWVtb3J5CnRoZXJlKS4gSG93ZXZlciwgdG8gYmUgY29ycmVjdCwgdGhlIHJhbmdlIG9m
IHRoZSBkbWEgb2Zmc2V0IHBsdXMgbWFzawp3b3VsZCBuZWVkIHRvIGJlIHdpdGhpbiB0aGUgbWlu
IHN0YXJ0IGFuZCBtYXggZW5kIGFkZHJlc3Nlcy4gSU9XLAp3aGlsZSB3ZSBuZWVkIHRvIHJvdW5k
IHVwICgweGFfODAwMF8wMDAwIC0gMHgyYzFjXzAwMDApIHRvIHRoZSBuZXh0CnBvd2VyIG9mIDIs
IHRoZSAnY29ycmVjdCcgdGhpbmcgdG8gZG8gaXMgcm91bmQgZG93bi4KClJvYgoKPiBbMV0KPiBo
dHRwOi8vbGludXgtYXJtLm9yZy9naXQ/cD1saW51eC1ybS5naXQ7YT1jb21taXRkaWZmO2g9YTI4
MTRhZjU2YjM0ODZjMjk4NWE5NTU0MGE4OGQ4ZjlmYTNhNjk5ZgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
