Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD04EBCE98
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 18:56:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCo3n-0000Sw-VH; Tue, 24 Sep 2019 16:53:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y0Hj=XT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iCo3l-0000Sr-S1
 for xen-devel@lists.xen.org; Tue, 24 Sep 2019 16:53:05 +0000
X-Inumbo-ID: c6cd9796-deeb-11e9-9625-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id c6cd9796-deeb-11e9-9625-12813bfff9fa;
 Tue, 24 Sep 2019 16:53:05 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 741692054F;
 Tue, 24 Sep 2019 16:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569343984;
 bh=UbE0bWjIO3gb9umkQOgih4QoAd+bPysT++60nhC9eJQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=vhGqaOCEhR7t2RKbAOCZ5BP9ryruYJ/8O71Ew/JOwPZxbE6/C8my8oi+xef2MIDGN
 uV+mJCt+ZpJE3wkvVPh/hHxhosIo2iL63aO4tgrw3bNDaxelhnSnKGuN3H8DVazkdq
 sp6G3Z+fNTuqIuMSO1Owwk8wa+h6oA/NzqO07RNE=
Date: Tue, 24 Sep 2019 09:52:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <13e675a2-6628-ccab-9122-94ed9ea2a23d@arm.com>
Message-ID: <alpine.DEB.2.21.1909240941360.24909@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-5-sstabellini@kernel.org>
 <13e675a2-6628-ccab-9122-94ed9ea2a23d@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 5/8] xen/arm: assign devices to boot
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

T24gV2VkLCAxMSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDgv
MjEvMTkgNDo1MyBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gU2NhbiB0aGUgdXNl
ciBwcm92aWRlZCBkdGIgZnJhZ21lbnQgYXQgYm9vdC4gRm9yIGVhY2ggZGV2aWNlIG5vZGUsIG1h
cAo+ID4gbWVtb3J5IHRvIGd1ZXN0cywgYW5kIHJvdXRlIGludGVycnVwdHMgYW5kIHNldHVwIHRo
ZSBpb21tdS4KPiA+IAo+ID4gVGhlIG1lbW9yeSByZWdpb24gdG8gcmVtYXAgaXMgc3BlY2lmaWVk
IGJ5IHRoZSAieGVuLHJlZyIgcHJvcGVydHkuCj4gPiAKPiA+IFRoZSBpb21tdSBpcyBzZXR1cCBi
eSBwYXNzaW5nIHRoZSBub2RlIG9mIHRoZSBkZXZpY2UgdG8gYXNzaWduIG9uIHRoZQo+ID4gaG9z
dCBkZXZpY2UgdHJlZS4gVGhlIHBhdGggaXMgc3BlY2lmaWVkIGluIHRoZSBkZXZpY2UgdHJlZSBm
cmFnbWVudCBhcwo+ID4gdGhlICJ4ZW4scGF0aCIgc3RyaW5nIHByb3BlcnR5Lgo+ID4gCj4gPiBU
aGUgaW50ZXJydXB0cyBhcmUgcmVtYXBwZWQgYmFzZWQgb24gdGhlIGluZm9ybWF0aW9uIGZyb20g
dGhlCj4gPiBjb3JyZXNwb25kaW5nIG5vZGUgb24gdGhlIGhvc3QgZGV2aWNlIHRyZWUuIENhbGwK
PiA+IGhhbmRsZV9kZXZpY2VfaW50ZXJydXB0cyB0byByZW1hcCBpbnRlcnJ1cHRzLiBJbnRlcnJ1
cHRzIHJlbGF0ZWQgZGV2aWNlCj4gPiB0cmVlIHByb3BlcnRpZXMgYXJlIGNvcGllZCBmcm9tIHRo
ZSBkZXZpY2UgdHJlZSBmcmFnbWVudCwgc2FtZSBhcyBhbGwKPiA+IHRoZSBvdGhlciBwcm9wZXJ0
aWVzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9z
QHhpbGlueC5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiAtIHVzZSB1bnNpZ25l
ZAo+ID4gLSBpbXByb3ZlIGNvbW1pdCBtZXNzYWdlCj4gPiAtIGNvZGUgc3R5bGUKPiA+IC0gdXNl
IGR0X3Byb3BfY21wCj4gPiAtIHVzZSBkZXZpY2VfdHJlZV9nZXRfcmVnCj4gPiAtIGRvbid0IGNv
cHkgb3ZlciB4ZW4scmVnIGFuZCB4ZW4scGF0aAo+ID4gLSBkb24ndCBjcmVhdGUgc3BlY2lhbCBp
bnRlcnJ1cHQgcHJvcGVydGllcyBmb3IgZG9tVTogY29weSB0aGVtIGZyb20gdGhlCj4gPiAgICBm
cmFnbWVudAo+ID4gLSBpbi1jb2RlIGNvbW1lbnQKPiA+IAo+ID4gQ2hhbmdlcyBpbiB2MzoKPiA+
IC0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQo+ID4gLSByZW1vdmUgc3VwZXJmbHVvdXMgY2FzdAo+
ID4gLSBtZXJnZSBjb2RlIHdpdGggdGhlIGNvcHkgY29kZQo+ID4gLSBhZGQgaW50ZXJydXAtcGFy
ZW50Cj4gPiAtIGRlbW92ZSBkZXB0aCA+IDIgY2hlY2sKPiA+IC0gcmV1c2UgY29kZSBmcm9tIGhh
bmRsZV9kZXZpY2VfaW50ZXJydXB0cwo+ID4gLSBjb3B5IGludGVycnVwdHMgZnJvbSBob3N0IGR0
Cj4gPiAKPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAtIHJlbmFtZSAicGF0aCIgdG8gInhlbixwYXRo
Igo+ID4gLSBncmFtbWFyIGZpeAo+ID4gLSB1c2UgZ2FkZHJfdG9fZ2ZuIGFuZCBtYWRkcl90b19t
Zm4KPiA+IC0gcmVtb3ZlIGRlcHRoIDw9IDIgbGltaXRhdGlvbiBpbiBzY2FubmluZyB0aGUgZHRi
IGZyYWdtZW50Cj4gPiAtIGludHJvZHVjZSBhbmQgcGFyc2UgeGVuLHJlZwo+ID4gLSBjb2RlIHN0
eWxlCj4gPiAtIHN1cHBvcnQgbW9yZSB0aGFuIG9uZSBpbnRlcnJ1cHQgcGVyIGRldmljZQo+ID4g
LSBzcGVjaWZ5IG9ubHkgdGhlIEdJQyBpcyBzdXBwb3J0ZWQKPiA+IC0tLQo+ID4gICB4ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMgfCA2NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gPiBpbmRleCBjNzFiOWYyODg5Li4yNTZjODM0
NjJhIDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gPiArKysg
Yi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+IEBAIC0xNzIxLDYgKzE3MjEsOSBAQCBz
dGF0aWMgaW50IF9faW5pdCBoYW5kbGVfcHJvcF9wZmR0KHN0cnVjdCBrZXJuZWxfaW5mbwo+ID4g
KmtpbmZvLAo+ID4gICAgICAgdm9pZCAqZmR0ID0ga2luZm8tPmZkdDsKPiA+ICAgICAgIGludCBw
cm9wb2ZmLCBuYW1lb2ZmLCByZXM7Cj4gPiAgICAgICBjb25zdCBzdHJ1Y3QgZmR0X3Byb3BlcnR5
ICpwcm9wOwo+ID4gKyAgICBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5vZGU7Cj4gPiArICAgIGNv
bnN0IF9fYmUzMiAqY2VsbDsKPiA+ICsgICAgdW5zaWduZWQgaW50IGksIGxlbjsKPiA+ICAgICAg
ICAgZm9yICggcHJvcG9mZiA9IGZkdF9maXJzdF9wcm9wZXJ0eV9vZmZzZXQocGZkdCwgbm9kZW9m
Zik7Cj4gPiAgICAgICAgICAgICBwcm9wb2ZmID49IDA7Cj4gPiBAQCAtMTczMCwxMCArMTczMyw2
NSBAQCBzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVfcHJvcF9wZmR0KHN0cnVjdAo+ID4ga2VybmVs
X2luZm8gKmtpbmZvLAo+ID4gICAgICAgICAgICAgICByZXR1cm4gLUZEVF9FUlJfSU5URVJOQUw7
Cj4gPiAgICAgICAgICAgICBuYW1lb2ZmID0gZmR0MzJfdG9fY3B1KHByb3AtPm5hbWVvZmYpOwo+
ID4gLSAgICAgICAgcmVzID0gZmR0X3Byb3BlcnR5KGZkdCwgZmR0X3N0cmluZyhwZmR0LCBuYW1l
b2ZmKSwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICBwcm9wLT5kYXRhLCBmZHQzMl90
b19jcHUocHJvcC0+bGVuKSk7Cj4gPiAtICAgICAgICBpZiAoIHJlcyApCj4gPiAtICAgICAgICAg
ICAgcmV0dXJuIHJlczsKPiA+ICsKPiA+ICsgICAgICAgIC8qIHhlbixyZWcgc3BlY2lmaWVzIHdo
ZXJlIHRvIG1hcCB0aGUgTU1JTyByZWdpb24gKi8KPiA+ICsgICAgICAgIGlmICggZHRfcHJvcF9j
bXAoInhlbixyZWciLCBmZHRfc3RyaW5nKHBmZHQsIG5hbWVvZmYpKSA9PSAwICkKPiAKPiBUaGUg
Y29uc3RydWN0IGZkdF9zdHJpbmcocGZkdCwgbmFtZW9mZikgaXMgdXNlZCBxdWl0ZSBvZnRlbiB3
aXRoaW4gdGhpcwo+IGZ1bmN0aW9uLiBJIHRoaW5rIGl0IGlzIHdhcnJhbnQgZm9yIGEgbG9jYWwg
dmFyaWFibGUuCgpPSwoKPiA+ICsgICAgICAgIHsKPiA+ICsgICAgICAgICAgICBwYWRkcl90IG1z
dGFydCwgc2l6ZSwgZ3N0YXJ0Owo+ID4gKyAgICAgICAgICAgIGNlbGwgPSAoY29uc3QgX19iZTMy
ICopcHJvcC0+ZGF0YTsKPiA+ICsgICAgICAgICAgICBsZW4gPSBmZHQzMl90b19jcHUocHJvcC0+
bGVuKSAvCj4gPiArICAgICAgICAgICAgICAgICAgKChhZGRyZXNzX2NlbGxzICogMiArIHNpemVf
Y2VsbHMpICogc2l6ZW9mKHVpbnQzMl90KSk7Cj4gPiArCj4gPiArICAgICAgICAgICAgZm9yICgg
aSA9IDA7IGkgPCBsZW47IGkrKyApCj4gPiArICAgICAgICAgICAgewo+ID4gKyAgICAgICAgICAg
ICAgICBkZXZpY2VfdHJlZV9nZXRfcmVnKCZjZWxsLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxz
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZtc3RhcnQsICZzaXpl
KTsKPiA+ICsgICAgICAgICAgICAgICAgZ3N0YXJ0ID0gZHRfbmV4dF9jZWxsKGFkZHJlc3NfY2Vs
bHMsICZjZWxsKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgcmVzID0gZ3Vlc3RfcGh5c21h
cF9hZGRfZW50cnkoa2luZm8tPmQsCj4gPiBnYWRkcl90b19nZm4oZ3N0YXJ0KSwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFkZHJfdG9fbWZuKG1z
dGFydCksCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGdldF9vcmRlcl9mcm9tX2J5dGVzKHNpemUpLAo+IAo+IGd1ZXN0X3BoeXNtYXBfYWRkX2VudHJ5
IGlzIGRlZmluaXRlbHkgbm90IHRoZSBjb3JyZWN0IGZ1bmN0aW9uIHRvIGNhbGwuIEl0Cj4gdGFr
ZXMgYW4gb3JkZXIgYW5kIG1lYW5zIHRoYXQgaWYgdGhlIHVzZXIgYXNrIHRvIG1hcCAxMktCLCBp
dCB3aWxsIGVmZmVjdGl2ZWx5Cj4gbWFwIDE2S0IuIFlvdSB3YW50IHRvIHVzZSBtYXBfcmVnaW9u
c19wMm10IGFzIHRoaXMgaXMgZG9uZSBldmVyeXdoZXJlIGVsc2UgZm9yCj4gbWFwcGluZyBNTUlP
IHJlZ2lvbnMuCgpPSwoKCj4gSXQgYWxzbyByYWlzZXMgdGhlIHF1ZXN0aW9uIHdoYXQgc2hvdWxk
IHdlIGRvIGlmIHRoZSBzaXplIHBhc3NlZCBpbiBub3QKPiBwYWdlLWFsaWduZWQ/IFNoYWxsIHdl
IGp1c3QgYmxpbmRseSByb3VuZCB1cC9kb3duPyBTaG91bGQgd2Ugd2Fybj8KPiAKPiBUaGlzIHdh
cyBub3QgaW1wb3J0YW50IGZvciBkb20wLCBidXQgaXMgcG90ZW50aWFsbHkgY3JpdGljYWwgZm9y
IGRvbVUgYXMgeW91Cj4gbWF5IGhhcHBlbiB0byBpbmFkdmVydGVudGx5IHRvIGV4cG9ydCBtb3Jl
IHRoYW4geW91IGhvcGUgdG8gYSBndWVzdC4KCkEgd2FybmluZyBvciBldmVuIGEgcGFuaWMgd291
bGQgYmUgT0sgYmVjYXVzZSBpdCBpcyBhIHN0YXRpYyBtaXNjb25maWd1cmF0aW9uLgoKCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9tbWlvX2Rp
cmVjdF9kZXYpOwo+ID4gKyAgICAgICAgICAgICAgICBpZiAoIHJlcyA8IDAgKQo+ID4gKyAgICAg
ICAgICAgICAgICB7Cj4gPiArICAgICAgICAgICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gbWFwICUiUFJJcGFk
ZHIiIHRvIHRoZSBndWVzdAo+ID4gYXQlIlBSSXBhZGRyIlxuIiwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbXN0YXJ0LCBnc3RhcnQpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FRkFVTFQ7Cj4gPiArICAgICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICB9
Cj4gPiArICAgICAgICB9Cj4gPiArICAgICAgICAvKgo+ID4gKyAgICAgICAgICogeGVuLHBhdGgg
c3BlY2lmaWVzIHRoZSBjb3JyZXNwb25kaW5nIG5vZGUgaW4gdGhlIGhvc3QgRFQuCj4gPiArICAg
ICAgICAgKiBCb3RoIGludGVycnVwdCBtYXBwaW5ncyBhbmQgSU9NTVUgc2V0dGluZ3MgYXJlIGJh
c2VkIG9uIGl0LAo+ID4gKyAgICAgICAgICogYXMgdGhleSBhcmUgZG9uZSBiYXNlZCBvbiB0aGUg
Y29ycmVzcG9uZGluZyBob3N0IERUIG5vZGUuCj4gPiArICAgICAgICAgKi8KPiA+ICsgICAgICAg
IGVsc2UgaWYgKCBkdF9wcm9wX2NtcCgieGVuLHBhdGgiLCBmZHRfc3RyaW5nKHBmZHQsIG5hbWVv
ZmYpKSA9PSAwICkKPiA+ICsgICAgICAgIHsKPiA+ICsgICAgICAgICAgICBub2RlID0gZHRfZmlu
ZF9ub2RlX2J5X3BhdGgocHJvcC0+ZGF0YSk7Cj4gPiArICAgICAgICAgICAgaWYgKCBub2RlID09
IE5VTEwgKQo+ID4gKyAgICAgICAgICAgIHsKPiA+ICsgICAgICAgICAgICAgICAgZHByaW50ayhY
RU5MT0dfRVJSLCAiQ291bGRuJ3QgZmluZCBub2RlICVzIGluIGhvc3RfZHQhXG4iLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgIChjaGFyICopcHJvcC0+ZGF0YSk7Cj4gPiArICAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKyAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAg
ICAgICAgICByZXMgPSBpb21tdV9hc3NpZ25fZHRfZGV2aWNlKGtpbmZvLT5kLCBub2RlKTsKPiA+
ICsgICAgICAgICAgICBpZiAoIHJlcyA8IDAgKQo+ID4gKyAgICAgICAgICAgICAgICByZXR1cm4g
cmVzOwo+ID4gKwo+ID4gKyAgICAgICAgICAgIHJlcyA9IGhhbmRsZV9kZXZpY2VfaW50ZXJydXB0
cyhraW5mby0+ZCwgbm9kZSwgdHJ1ZSk7Cj4gPiArICAgICAgICAgICAgaWYgKCByZXMgPCAwICkK
PiA+ICsgICAgICAgICAgICAgICAgcmV0dXJuIHJlczsKPiA+ICsgICAgICAgIH0KPiA+ICsgICAg
ICAgIC8qIGNvcHkgYWxsIG90aGVyIHByb3BlcnRpZXMgKi8KPiA+ICsgICAgICAgIGVsc2UKPiA+
ICsgICAgICAgIHsKPiA+ICsgICAgICAgICAgICByZXMgPSBmZHRfcHJvcGVydHkoZmR0LCBmZHRf
c3RyaW5nKHBmZHQsIG5hbWVvZmYpLCBwcm9wLT5kYXRhLAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBmZHQzMl90b19jcHUocHJvcC0+bGVuKSk7Cj4gPiArICAgICAgICAgICAg
aWYgKCByZXMgKQo+ID4gKyAgICAgICAgICAgICAgICByZXR1cm4gcmVzOwo+ID4gKyAgICAgICAg
fQo+ID4gICAgICAgfQo+ID4gICAgICAgICAvKiBGRFRfRVJSX05PVEZPVU5EID0+IFRoZXJlIGlz
IG5vIG1vcmUgcHJvcGVydGllcyBmb3IgdGhpcyBub2RlICovCj4gPiAKPiAKPiBDaGVlcnMsCj4g
Cj4gLS0gCj4gSnVsaWVuIEdyYWxsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
