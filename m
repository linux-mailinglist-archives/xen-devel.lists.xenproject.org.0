Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D01CAB83
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 19:35:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG4xu-0005ua-AS; Thu, 03 Oct 2019 17:32:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KLgg=X4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iG4xt-0005uV-FF
 for xen-devel@lists.xen.org; Thu, 03 Oct 2019 17:32:33 +0000
X-Inumbo-ID: c7b41f1c-e603-11e9-8c93-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7b41f1c-e603-11e9-8c93-bc764e2007e4;
 Thu, 03 Oct 2019 17:32:32 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F9CF20830;
 Thu,  3 Oct 2019 17:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570123951;
 bh=4QEM7pMZxQFg4gdLu4RHjaMziI5RrMfuQ5HMLPhz+3Q=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=vdgWmIddbeDd4/pxfqKLIpy/Sr/AjjSeAcFa/FdXW+dUnwMurJ5/462hMf3TVdWyE
 cxxGF2KvjxOpPde+MjUugxhjrRvbb30uIRP4cD6s9lpb3zV3YQyqFY/ERQnxo4O+MN
 jvi9lAggGJ+LdYi3qJYqa5wthl+bwHGr9K2NpC6E=
Date: Thu, 3 Oct 2019 10:32:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <fb3762a6-e4aa-53c3-0fcf-f45e9a05934e@arm.com>
Message-ID: <alpine.DEB.2.21.1910031032230.30844@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1910021833180.2691@sstabellini-ThinkPad-T480s>
 <20191003013526.30768-5-sstabellini@kernel.org>
 <fb3762a6-e4aa-53c3-0fcf-f45e9a05934e@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v8 5/8] xen/arm: assign devices to boot
 domains
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Achin.Gupta@arm.com, xen-devel@lists.xen.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAzIE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiAwMy8xMC8yMDE5IDAyOjM1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBTY2Fu
IHRoZSB1c2VyIHByb3ZpZGVkIGR0YiBmcmFnbWVudCBhdCBib290LiBGb3IgZWFjaCBkZXZpY2Ug
bm9kZSwgbWFwCj4gPiBtZW1vcnkgdG8gZ3Vlc3RzLCBhbmQgcm91dGUgaW50ZXJydXB0cyBhbmQg
c2V0dXAgdGhlIGlvbW11Lgo+ID4gCj4gPiBUaGUgbWVtb3J5IHJlZ2lvbiB0byByZW1hcCBpcyBz
cGVjaWZpZWQgYnkgdGhlICJ4ZW4scmVnIiBwcm9wZXJ0eS4KPiA+IAo+ID4gVGhlIGlvbW11IGlz
IHNldHVwIGJ5IHBhc3NpbmcgdGhlIG5vZGUgb2YgdGhlIGRldmljZSB0byBhc3NpZ24gb24gdGhl
Cj4gPiBob3N0IGRldmljZSB0cmVlLiBUaGUgcGF0aCBpcyBzcGVjaWZpZWQgaW4gdGhlIGRldmlj
ZSB0cmVlIGZyYWdtZW50IGFzCj4gPiB0aGUgInhlbixwYXRoIiBzdHJpbmcgcHJvcGVydHkuCj4g
PiAKPiA+IFRoZSBpbnRlcnJ1cHRzIGFyZSByZW1hcHBlZCBiYXNlZCBvbiB0aGUgaW5mb3JtYXRp
b24gZnJvbSB0aGUKPiA+IGNvcnJlc3BvbmRpbmcgbm9kZSBvbiB0aGUgaG9zdCBkZXZpY2UgdHJl
ZS4gQ2FsbAo+ID4gaGFuZGxlX2RldmljZV9pbnRlcnJ1cHRzIHRvIHJlbWFwIGludGVycnVwdHMu
IEludGVycnVwdHMgcmVsYXRlZCBkZXZpY2UKPiA+IHRyZWUgcHJvcGVydGllcyBhcmUgY29waWVk
IGZyb20gdGhlIGRldmljZSB0cmVlIGZyYWdtZW50LCBzYW1lIGFzIGFsbAo+ID4gdGhlIG90aGVy
IHByb3BlcnRpZXMuCj4gPiAKPiA+IFJlcXVpcmUgYm90aCB4ZW4scmVnIGFuZCB4ZW4scGF0aCB0
byBiZSBwcmVzZW50LCB1bmxlc3MKPiA+IHhlbixmb3JjZS1hc3NpZ24td2l0aG91dC1pb21tdSBp
cyBhbHNvIHNldC4gSW4gdGhhdCBjYXNlLCB0b2xlcmF0ZSBhCj4gPiBtaXNzaW5nIHhlbixwYXRo
LCBhbHNvIHRvbGVyYXRlIGlvbW11IHNldHVwIGZhaWx1cmUgZm9yIHRoZSBwYXNzdGhyb3VnaAo+
ID4gZGV2aWNlLgo+ID4gCj4gPiBBbHNvIHNldCBhZGQgdGhlIG5ldyBmbGFnIFhFTl9ET01DVExf
Q0RGX2lvbW11IHNvIHRoYXQgZG9tMGxlc3MgZG9tVQo+ID4gY2FuIHVzZSB0aGUgSU9NTVUgaWYg
YSBwYXJ0aWFsIGR0YiBpcyBzcGVjaWZpZWQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBp
biB2ODoKPiA+IC0gYmV0dGVyIGluLWNvZGUgY29tbWVudAo+ID4gLSBjb2RlIHN0eWxlCj4gPiAt
IGFkZCBhIHByaW5rIGluIGNhc2Ugb2YgZXJyb3IKPiA+IAo+ID4gQ2hhbmdlcyBpbiB2NzoKPiA+
IC0gaW1wcm92ZSBpbi1jb2RlIGNvbW1lbnQKPiA+IC0gY29kZSBzdHlsZQo+ID4gLSByZXR1cm4g
MSBpbnN0ZWFkIG9mIEVOT0VOVAo+ID4gLSBpbnRyb2R1Y2UgInhlbixmb3JjZS1hc3NpZ24td2l0
aG91dC1pb21tdSIKPiA+IC0gcmVxdWlyZSBib3RoICJ4ZW4scmVnIiBhbmQgInhlbixwYXRoIiB1
bmxlc3MKPiA+ICAgICJ4ZW4sZm9yY2UtYXNzaWduLXdpdGhvdXQtaW9tbXUiCj4gPiAKPiA+IENo
YW5nZXMgaW4gdjY6Cj4gPiAtIHR1cm4gZHByaW50a3MgaW50byBwcmludGtzCj4gPiAtIHJldHVy
biBlcnJvciBvbiBwYWdlIGFsaWdubWVudCBjaGVjayBmYWlsdXJlCj4gPiAtIHNldCBYRU5fRE9N
Q1RMX0NERl9pb21tdSBpZiBwYXJ0aWFsIGR0YiBpcyBzcGVjaWZpZWQKPiA+IAo+ID4gQ2hhbmdl
cyBpbiB2NToKPiA+IC0gdXNlIGxvY2FsIHZhcmlhYmxlIGZvciBuYW1lCj4gPiAtIHVzZSBtYXBf
cmVnaW9uc19wMm10Cj4gPiAtIGFkZCB3YXJuaW5nIGZvciBub3QgcGFnZSBhbGlnbmVkIGFkZHJl
c3Nlcy9zaXplcwo+ID4gLSBpbnRyb2R1Y2UgaGFuZGxlX3Bhc3N0aHJvdWdoX3Byb3AKPiA+IAo+
ID4gQ2hhbmdlcyBpbiB2NDoKPiA+IC0gdXNlIHVuc2lnbmVkCj4gPiAtIGltcHJvdmUgY29tbWl0
IG1lc3NhZ2UKPiA+IC0gY29kZSBzdHlsZQo+ID4gLSB1c2UgZHRfcHJvcF9jbXAKPiA+IC0gdXNl
IGRldmljZV90cmVlX2dldF9yZWcKPiA+IC0gZG9uJ3QgY29weSBvdmVyIHhlbixyZWcgYW5kIHhl
bixwYXRoCj4gPiAtIGRvbid0IGNyZWF0ZSBzcGVjaWFsIGludGVycnVwdCBwcm9wZXJ0aWVzIGZv
ciBkb21VOiBjb3B5IHRoZW0gZnJvbSB0aGUKPiA+ICAgIGZyYWdtZW50Cj4gPiAtIGluLWNvZGUg
Y29tbWVudAo+ID4gCj4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gLSBpbXByb3ZlIGNvbW1pdCBtZXNz
YWdlCj4gPiAtIHJlbW92ZSBzdXBlcmZsdW91cyBjYXN0Cj4gPiAtIG1lcmdlIGNvZGUgd2l0aCB0
aGUgY29weSBjb2RlCj4gPiAtIGFkZCBpbnRlcnJ1cC1wYXJlbnQKPiA+IC0gZGVtb3ZlIGRlcHRo
ID4gMiBjaGVjawo+ID4gLSByZXVzZSBjb2RlIGZyb20gaGFuZGxlX2RldmljZV9pbnRlcnJ1cHRz
Cj4gPiAtIGNvcHkgaW50ZXJydXB0cyBmcm9tIGhvc3QgZHQKPiA+IAo+ID4gQ2hhbmdlcyBpbiB2
MjoKPiA+IC0gcmVuYW1lICJwYXRoIiB0byAieGVuLHBhdGgiCj4gPiAtIGdyYW1tYXIgZml4Cj4g
PiAtIHVzZSBnYWRkcl90b19nZm4gYW5kIG1hZGRyX3RvX21mbgo+ID4gLSByZW1vdmUgZGVwdGgg
PD0gMiBsaW1pdGF0aW9uIGluIHNjYW5uaW5nIHRoZSBkdGIgZnJhZ21lbnQKPiA+IC0gaW50cm9k
dWNlIGFuZCBwYXJzZSB4ZW4scmVnCj4gPiAtIGNvZGUgc3R5bGUKPiA+IC0gc3VwcG9ydCBtb3Jl
IHRoYW4gb25lIGludGVycnVwdCBwZXIgZGV2aWNlCj4gPiAtIHNwZWNpZnkgb25seSB0aGUgR0lD
IGlzIHN1cHBvcnRlZAo+ID4gLS0tCj4gPiAgIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8
IDEzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiA+ICAgMSBmaWxlIGNo
YW5nZWQsIDEzNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jCj4gPiBpbmRleCA4NGI2NWI4ZjI1Li5iOTA5MDJhZDk3IDEwMDY0NAo+ID4gLS0tIGEv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMKPiA+IEBAIC0xNzE0LDYgKzE3MTQsODggQEAgc3RhdGljIGludCBfX2luaXQgbWFr
ZV92cGwwMTFfdWFydF9ub2RlKHN0cnVjdAo+ID4ga2VybmVsX2luZm8gKmtpbmZvKQo+ID4gICB9
Cj4gPiAgICNlbmRpZgo+ID4gICArLyoKPiA+ICsgKiBTY2FuIGRldmljZSB0cmVlIHByb3BlcnRp
ZXMgZm9yIHBhc3N0aHJvdWdoIHNwZWNpZmljIGluZm9ybWF0aW9uLgo+ID4gKyAqIFJldHVybnMg
PCAwIG9uIGVycm9yCj4gPiArICogICAgICAgICAwIG9uIHN1Y2Nlc3MKPiA+ICsgKi8KPiA+ICtz
dGF0aWMgaW50IF9faW5pdCBoYW5kbGVfcGFzc3Rocm91Z2hfcHJvcChzdHJ1Y3Qga2VybmVsX2lu
Zm8gKmtpbmZvLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IHN0cnVjdCBmZHRfcHJvcGVydHkKPiA+ICp4ZW5fcmVnLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBmZHRfcHJvcGVydHkK
PiA+ICp4ZW5fcGF0aCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBib29sIHhlbl9mb3JjZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50MzJfdCBhZGRyZXNzX2NlbGxzLCB1aW50MzJfdAo+ID4gc2l6ZV9jZWxs
cykKPiA+ICt7Cj4gPiArICAgIGNvbnN0IF9fYmUzMiAqY2VsbDsKPiA+ICsgICAgdW5zaWduZWQg
aW50IGksIGxlbjsKPiA+ICsgICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpub2RlOwo+ID4gKyAg
ICBpbnQgcmVzOwo+ID4gKyAgICBwYWRkcl90IG1zdGFydCwgc2l6ZSwgZ3N0YXJ0Owo+ID4gKwo+
ID4gKyAgICAvKiB4ZW4scmVnIHNwZWNpZmllcyB3aGVyZSB0byBtYXAgdGhlIE1NSU8gcmVnaW9u
ICovCj4gPiArICAgIGNlbGwgPSAoY29uc3QgX19iZTMyICopeGVuX3JlZy0+ZGF0YTsKPiA+ICsg
ICAgbGVuID0gZmR0MzJfdG9fY3B1KHhlbl9yZWctPmxlbikgLyAoKGFkZHJlc3NfY2VsbHMgKiAy
ICsgc2l6ZV9jZWxscykgKgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzaXplb2YodWludDMyX3QpKTsKPiA+ICsKPiA+ICsgICAgZm9yICggaSA9IDA7IGkgPCBs
ZW47IGkrKyApCj4gPiArICAgIHsKPiA+ICsgICAgICAgIGRldmljZV90cmVlX2dldF9yZWcoJmNl
bGwsIGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMsCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZtc3RhcnQsICZzaXplKTsKPiA+ICsgICAgICAgIGdzdGFydCA9IGR0X25leHRfY2Vs
bChhZGRyZXNzX2NlbGxzLCAmY2VsbCk7Cj4gPiArCj4gPiArICAgICAgICBpZiAoIGdzdGFydCAm
IH5QQUdFX01BU0sgfHwgbXN0YXJ0ICYgflBBR0VfTUFTSyB8fCBzaXplICYKPiA+IH5QQUdFX01B
U0sgKQo+ID4gKyAgICAgICAgewo+ID4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSCj4g
PiArICAgICAgICAgICAgICAgICAgICAiRG9tVSBwYXNzdGhyb3VnaCBjb25maWcgaGFzIG5vdCBw
YWdlIGFsaWduZWQKPiA+IGFkZHJlc3Nlcy9zaXplc1xuIik7Cj4gPiArICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gPiArICAgICAgICB9Cj4gPiArCj4gPiArICAgICAgICByZXMgPSBtYXBf
cmVnaW9uc19wMm10KGtpbmZvLT5kLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBnYWRkcl90b19nZm4oZ3N0YXJ0KSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgUEZOX0RPV04oc2l6ZSksCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1h
ZGRyX3RvX21mbihtc3RhcnQpLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
Mm1fbW1pb19kaXJlY3RfZGV2KTsKPiA+ICsgICAgICAgIGlmICggcmVzIDwgMCApCj4gPiArICAg
ICAgICB7Cj4gPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIKPiA+ICsgICAgICAgICAg
ICAgICAgICAgIkZhaWxlZCB0byBtYXAgJSJQUklwYWRkciIgdG8gdGhlIGd1ZXN0Cj4gPiBhdCUi
UFJJcGFkZHIiXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICBtc3RhcnQsIGdzdGFydCk7Cj4g
PiArICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4gPiArICAgICAgICB9Cj4gPiArICAgIH0K
PiA+ICsKPiA+ICsgICAgLyoKPiA+ICsgICAgICogSWYgeGVuX2ZvcmNlLCB3ZSBsZXQgdGhlIHVz
ZXIgYXNzaWduIGEgTU1JTyByZWdpb24gd2l0aCBubwo+ID4gKyAgICAgKiBhc3NvY2lhdGVkIHBh
dGguCj4gPiArICAgICAqLwo+ID4gKyAgICBpZiAoIHhlbl9wYXRoID09IE5VTEwgKQo+ID4gKyAg
ICAgICAgcmV0dXJuIHhlbl9mb3JjZSA/IDAgOiAtRUlOVkFMOwo+ID4gKwo+ID4gKyAgICAvKgo+
ID4gKyAgICAgKiB4ZW4scGF0aCBzcGVjaWZpZXMgdGhlIGNvcnJlc3BvbmRpbmcgbm9kZSBpbiB0
aGUgaG9zdCBEVC4KPiA+ICsgICAgICogQm90aCBpbnRlcnJ1cHQgbWFwcGluZ3MgYW5kIElPTU1V
IHNldHRpbmdzIGFyZSBiYXNlZCBvbiBpdCwKPiA+ICsgICAgICogYXMgdGhleSBhcmUgZG9uZSBi
YXNlZCBvbiB0aGUgY29ycmVzcG9uZGluZyBob3N0IERUIG5vZGUuCj4gPiArICAgICAqLwo+ID4g
KyAgICBub2RlID0gZHRfZmluZF9ub2RlX2J5X3BhdGgoeGVuX3BhdGgtPmRhdGEpOwo+ID4gKyAg
ICBpZiAoIG5vZGUgPT0gTlVMTCApCj4gPiArICAgIHsKPiA+ICsgICAgICAgIHByaW50ayhYRU5M
T0dfRVJSICJDb3VsZG4ndCBmaW5kIG5vZGUgJXMgaW4gaG9zdF9kdCFcbiIsCj4gPiArICAgICAg
ICAgICAgICAgKGNoYXIgKil4ZW5fcGF0aC0+ZGF0YSk7Cj4gPiArICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiA+ICsgICAgfQo+ID4gKwo+ID4gKyAgICByZXMgPSBoYW5kbGVfZGV2aWNlX2ludGVy
cnVwdHMoa2luZm8tPmQsIG5vZGUsIHRydWUpOwo+ID4gKyAgICBpZiAoIHJlcyA8IDAgKQo+ID4g
KyAgICAgICAgcmV0dXJuIHJlczsKPiA+ICsKPiA+ICsgICAgLyogSWYgeGVuX2ZvcmNlLCB3ZSBp
Z25vcmUgSU9NTVUgZmFpbHVyZXMuICovCj4gPiArICAgIHJlcyA9IGlvbW11X2FkZF9kdF9kZXZp
Y2Uobm9kZSk7Cj4gPiArICAgIGlmICggcmVzIDwgMCApCj4gPiArICAgICAgICByZXR1cm4geGVu
X2ZvcmNlID8gMCA6IC1FSU5WQUw7Cj4gCj4gQWN0dWFsbHksIHRoaXMgY29kZSBpcyB3cm9uZy4g
aW9tbXVfYWRkX2R0X2RldmljZShub2RlKSBpcyByZXR1cm5pbmcgMCB3aGVuCj4gdGhlIElPTU1V
IGlzIG5vdCBpbi11c2UuIEZ1cnRoZXJtb3JlLCB0aGlzIGZ1bmN0aW9uIG1heSBmYWlsIGZvciBv
dGhlciByZWFzb25zCj4gdGhhbiB0aGUgRGV2aWNlIGlzIG5vdCBiZWhpbmQgYW4gSU9NTVUuIElu
IHRob3NlIGNhc2VzLCB5b3UgZG9uJ3Qgd2FudCB0bwo+IGlnbm9yZSB0aGUgZXJyb3IgYXMgdGhp
cyBpcyBtb3N0IGxpa2VseSBnb2luZyB0byBpbnRyb2R1Y2UgYW4gdW5zdGFibGUKPiBwbGF0Zm9y
bS4KPiAKPiBXZSB3ZSB3YW50IGlzIGFsbG93aW5nIGEgdXNlciB0byBwYXNzdGhyb3VnaCBhIGRl
dmljZSB3aGljaCBpcyBub3QgYmVoaW5kIGFuCj4gSU9NTVUuCj4gCj4gU29tZXRoaW5nIGxpa2Ug
YmVsb3cgd291bGQgYmUgYmV0dGVyOgo+IAo+IHJlcyA9IGlvbW11X2FkZF9kdF9kZXZpY2Uobm9k
ZSk7Cj4gaWYgKCByZXMgPCAwICkKPiAgIHJldHVybiByZXM7Cj4gCj4gLyogV2UgSU9NTVUgcG9z
c2libGUKPiBpZiAoICFkdF9kZXZpY2VfaXNfcHJvdGVjdChkZXYpICYmIHhlbl9mb3JjZSApCj4g
ICByZXR1cm4gMDsKPiAKPiByZXR1cm4gaW9tbXVfYXNzaWduX2R0X2RldmljZShraW5mby0+ZCwg
bm9kZSk7CgpZZXMsIEknbGwgZG8gdGhhdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
