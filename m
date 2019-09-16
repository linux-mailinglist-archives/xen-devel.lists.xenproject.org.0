Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11878B3D78
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 17:18:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9siz-0005gt-Co; Mon, 16 Sep 2019 15:15:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KvKu=XL=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1i9siy-0005go-Ju
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 15:15:32 +0000
X-Inumbo-ID: d28fcbce-d894-11e9-b76c-bc764e2007e4
Received: from mail-pl1-x643.google.com (unknown [2607:f8b0:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d28fcbce-d894-11e9-b76c-bc764e2007e4;
 Mon, 16 Sep 2019 15:15:31 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t11so37963plo.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 08:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wumiBAsOwk/BlEkJ+Qrz/RLpJC3vjncMWWzAQt4gyfY=;
 b=gGcs/ph+ZcSQmZjIm1uCOTAh6gU9lmEL5xDJBjSNUZKRlPI24NdNb2jkkjcyC5t/9E
 UnEtbdq9HyQjH6/JnNSRNh2poLk6amGfLqeWq9bECZaXitg9TqLg8ZkT+mUrKPSV1TGV
 q+Dpq6Ec2uSfRnI9qqtGag4vgM/M9CgbXC89sWFDAGdEWg0RAyr4e7xXWQScj2hkq4kq
 CwuzzJ3KxAXGy9LKKIWCUyKdajp2Vlvu2qDlsJTRZAp0IUMB70cxL1mOfCnX+mH3JF2R
 Ts2Xf/0LYi14Jft2Ci2pdtfBzc0SdOba3SM0OPWeSGss8/uYpYCNAFHmVpIE4W54upvJ
 sdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wumiBAsOwk/BlEkJ+Qrz/RLpJC3vjncMWWzAQt4gyfY=;
 b=WwsTKsmell1DH9bfQhW7AlHpQ6PIz0SPI5rXKBM6NRlEfSzY+8Eq1AKadhS4nLYqNQ
 pGe/0x8wl7RWXWyMV55IFoEZzv+ua1qTbL47DBU+L4rirgf0Y89Y68oD3z+ALERJc6PO
 BpE0Dexn15ehjVpHaECdwK31cHG5zYsRBWEbqzj+lZQx35hNEJT6KCJq6gkcrWQQx6Gx
 xp1Mq8P5vvE6SwMX9121u4QDTR4Bp4RLQ1Zmismuj1yMc76YFgfBdkNpG5oilR71J7y7
 XhMz6gxNdI1V0KdwDVY7oKdQOLPOBdHbzv4/3XGBQVEP8YjSjtiHCDYociGgWnjUjTGg
 pY+Q==
X-Gm-Message-State: APjAAAVvF3ImuPiWFpTWnWVEKZHWBB/k59+OkdMa72bTjWCNpQaaxBMQ
 4MSBioW9QuAu+7upLL+RfFCKr4Q271s7oPeZRZ4=
X-Google-Smtp-Source: APXvYqwwyFOVkJP8DflJJZyAVZQcbmjanO/wkm607CeYjKO4WFIi9Btnz7v6l0BbGfGasGga+3VzmIQ5krFe09g/weU=
X-Received: by 2002:a17:902:c6b:: with SMTP id 98mr256398pls.263.1568646930598; 
 Mon, 16 Sep 2019 08:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAKan5DCdRvofdAWaL3js9wmWBsiKWt9DAyguOpy0qv=33tdUwQ@mail.gmail.com>
 <6b9d7429-7dc5-476d-afda-bb3f196c804f@arm.com>
 <20190916103858.kovwuktf7ce52vw7@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <CACCGGhCPUpqtf0CjmpJBBebymMFrjKhKyX3o5NZ3pP5C7qQ2Pg@mail.gmail.com>
 <CAKan5DBFUbFGkPzmFMg4bqzMbrVEh2MzCMXCrL5p0TBmGXe3RQ@mail.gmail.com>
In-Reply-To: <CAKan5DBFUbFGkPzmFMg4bqzMbrVEh2MzCMXCrL5p0TBmGXe3RQ@mail.gmail.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Mon, 16 Sep 2019 16:15:19 +0100
Message-ID: <CACCGGhCxHEpBXdUYLRWv_x+H=2+yTNXUShPTML1RQGKEVFhWrA@mail.gmail.com>
To: Julian Tuminaro <jtuminar@andrew.cmu.edu>
Subject: Re: [Xen-devel] Looking for Semester long Project
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWFuLAoKICBUaGUgS0REIGNvZGUgaGFzIGJlZW4gdW50b3VjaGVkIGZvciBtYW55IHll
YXJzOyB0aGUgbGFzdCBPUyB0aGF0IGl0CmFwcGVhcnMgdG8gaGF2ZSBiZWVuIHRyaWVkIHdpdGgg
aXMgV2luNyBTUDEuIEhvd2V2ZXIsIGRlYnVnZ2luZyBhCldpbmRvd3MgZ3Vlc3Qgd2l0aCBlbXVs
YXRlZCBzZXJpYWwgaXMgdmVyeSBzbG93IGFuZCBjbHVua3kgc28gYQpzb2x1dGlvbiBsaWtlIEtE
RCBpcyB2ZXJ5IGRlc2lyYWJsZS4KICBUaGUgZ29hbCBvZiBhIHByb2plY3Qgd291bGQgYmUgdG8g
Z2V0IHRoZSBjb2RlIGZ1bmN0aW9uYWwgYWdhaW5zdCBhCnJlY2VudCB2ZXJzaW9uIG9mIFdpbmRv
d3MgKGkuZS4gMTApIHN1Y2ggdGhhdCB3ZSBjb3VsZCBydW4gd2luZGJnCmFnYWluc3QgaXQgYW5k
IHdhbGsga2VybmVsIGRhdGEgc3RydWN0dXJlcywgc2V0IGJyZWFrcG9pbnRzIGV0Yy4Kd2l0aG91
dCBoYXZpbmcgdG8gZW5hYmxlIGRlYnVnZ2luZyB3aXRoaW4gdGhlIGd1ZXN0LgoKICBDaGVlcnMs
CgogICAgUGF1bAoKT24gTW9uLCAxNiBTZXAgMjAxOSBhdCAxNTozMSwgSnVsaWFuIFR1bWluYXJv
IDxqdHVtaW5hckBhbmRyZXcuY211LmVkdT4gd3JvdGU6Cj4KPiBIaSBQYXVsLAo+Cj4gVGhhbmtz
IGZvciBnZXR0aW5nIGJhY2sgdG8gdXMgaW4gcmVnYXJkcyB0byB0aGUgS0REIHByb2plY3QuIEkg
YW0gdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIGN1cnJlbnQgc3RhdHVzIG9mIHRoZSBwcm9qZWN0
LiBDb3VsZCB5b3UgcHJvdmlkZSBhIGJpdCBtb3JlIGluZm9ybWF0aW9uIG9uIHRoZSBjdXJyZW50
IHN0YXR1cyBhbmQgd2hhdCB3b3VsZCBuZWVkIHRvIGJlIGRvbmUuCj4KPiBKdWxpYW4KPgo+IE9u
IE1vbiwgU2VwIDE2LCAyMDE5IGF0IDU6NTMgQU0gUGF1bCBEdXJyYW50IDxwZHVycmFudEBnbWFp
bC5jb20+IHdyb3RlOgo+Pgo+PiBJIHRoaW5rIEtERCBpcyBzdGlsbCBhIHdvcnRoeSB0aGluZyB0
byBkbywgcGFydGljdWxhcmx5IGluIGxpZ2h0IG9mCj4+IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9h
cmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDE3LTEyL21zZzAxNzIzLmh0bWwKPj4gKHdoaWNoIGlz
IGFib3V0IHRoZSBtb3N0IHJlY2VudCByZWYgSSBjb3VsZCBmaW5kLCBhbmQgSSBkb24ndCBrbm93
Cj4+IHdoYXQgaGFwcGVuZWQgdG8gdGhlIGNvZGUgYWZ0ZXIgdGhhdCkuIEFGQUlLLCB0aGUgYmln
Z2VzdCBjaGFsbGVuZ2UgaXMKPj4gZ2V0dGluZyByb3VuZCBXaW5kb3dzJyBLQVNMUjsgaXQgbWF5
IGJlIG5lY2Vzc2FyeSB0byBoYXZlIHNvbWUgc29ydCBvZgo+PiBkcml2ZXIgaW4gdGhlIGd1ZXN0
IHRvIGdldCB0aGUgbmVjZXNzYXJ5IGluZm8uIG91dCBidXQgdGhhdCBzaG91bGRuJ3QKPj4gYmUg
dG9vIGhhcmQgdG8gaW1wbGVtZW50Lgo+Pgo+PiAgIENoZWVycywKPj4KPj4gICAgIFBhdWwKPj4K
Pj4gT24gTW9uLCAxNiBTZXAgMjAxOSBhdCAxMTozOSwgV2VpIExpdSA8d2xAeGVuLm9yZz4gd3Jv
dGU6Cj4+ID4KPj4gPiBIaSBKdWxpYW4KPj4gPgo+PiA+IEZvciB0aGUgS0REIHJlbGF0ZWQgcHJv
amVjdCBJIGhhdmUgQ0MnZWQgUGF1bC4KPj4gPgo+PiA+IEkgaGF2ZSBnYXRoZXJlZCBzb21lIGlk
ZWFzIGZvciBjbGVhbmluZyB1cCBoeXBlcnZpc29yIGNvZGUgYnV0IHRoZXkgYXJlCj4+ID4gb2Yg
bG93ZXIgZGlmZmljdWx0eSBjb21wYXJlZCB0byBvdGhlciBwcm9qZWN0cy4gVGhleSBhcmUgZGVm
aW5pdGl2ZWx5Cj4+ID4gbm90IGFzIGZ1biBhcyB0aGUgb3RoZXJzLiA7LSkKPj4gPgo+PiA+IFdl
aS4KPj4gPgo+PiA+IE9uIE1vbiwgU2VwIDA5LCAyMDE5IGF0IDA4OjU4OjUxQU0gKzAxMDAsIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4gPiA+ICtBbmRyZXcsIExhcnMsIFN0ZWZhbm8gYW5kIFdlaQo+
PiA+ID4KPj4gPiA+IE9uIDkvNS8xOSAxMToyMyBQTSwgSnVsaWFuIFR1bWluYXJvIHdyb3RlOgo+
PiA+ID4gPiBIaSwKPj4gPiA+Cj4+ID4gPiBIZWxsbywKPj4gPiA+Cj4+ID4gPiBUaGFuayB5b3Ug
Zm9yIHlvdSBpbnRlcmVzdCBvbiBYZW4uIEkgaGF2ZSBDQ2VkIGZldyBtb3JlIHBlcnNvbiB0aGF0
IHNob3VsZAo+PiA+ID4gYmUgYWJsZSB0byBhbnN3ZXIgeW91ciBxdWVzdGlvbnMgYmVsb3cuCj4+
ID4gPgo+PiA+ID4gPgo+PiA+ID4gPiBXZSAoYSBncm91cCBvZiAyIHN0dWRlbnRzKSBhcmUgaW50
ZXJlc3RlZCBpbiBkb2luZyBhIGh5cGVydmlzb3IgcmVsYXRlZAo+PiA+ID4gPiBwcm9qZWN0IGZv
ciB0aGUgbmV4dCAxMC0xMiB3ZWVrcyBhcyBwYXJ0IG9mIG9uZSBvZiBvdXIgY291cnNlcyB0aGlz
Cj4+ID4gPiA+IHNlbWVzdGVyLiBXZSBoYXZlIHRha2VuIGEgbG9vayBhdCB0aGlzIHllYXIncyBH
U29DIHByb2plY3QgbGlzdAo+PiA+ID4gPiAoaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dp
a2kvT3V0cmVhY2hfUHJvZ3JhbV9Qcm9qZWN0cykuIFdlIHdlcmUKPj4gPiA+ID4gaW50ZXJlc3Rl
ZCBpbiBsZWFybmluZyBtb3JlIGFib3V0IHRoZSAiS0REIChXaW5kb3dzIERlYnVnZ2VyIFN0dWIp
Cj4+ID4gPiA+IGVuaGFuY2VtZW50cyIgcHJvamVjdCBhbmQgWGVuIG9uIEFSTSBiYXNlZCBwcm9q
ZWN0cy4gWWV0LCBvbiBpcmMgd2Ugd2VyZQo+PiA+ID4gPiB0b2xkIHRoYXQgdGhpcyBsaXN0IGlz
IG91dGRhdGVkLiBJZiB0aGVyZSBhcmUgYW55IG90aGVyIHByb2plY3QKPj4gPiA+ID4gc3VnZ2Vz
dGlvbnMgb3IgbGlzdCwgd2Ugd291bGQgYmUgaW50ZXJlc3RpbmcgaW4gbGVhcm5pbmcgbW9yZSBh
Ym91dAo+PiA+ID4gPiB0aGVtLgo+PiA+ID4gVGhlIGxpc3Qgb2YgcHJvamVjdHMgZm9yIFhlbiBv
biBBcm0gaXMgbW9zdGx5IHVwZGF0ZS10by1kYXRlLiBUaGUgb25seQo+PiA+ID4gcHJvamVjdCB3
aGVyZSBzb21lIHByb2dyZXNzIGhhcyBiZWVuIG1hZGUgc28gZmFyIGlzICJYZW4gb24gQVJNOiBk
eW5hbWljCj4+ID4gPiB2aXJ0dWFsIG1lbW9yeSBsYXlvdXQiLgo+PiA+ID4KPj4gPiA+IEkgd291
bGQgYmUgaGFwcHkgdG8gZ28gaW4gbW9yZSBkZXRhaWxzIGZvciBhbnkgdGhvc2UgcHJvamVjdHMg
aWYgeW91IGFyZQo+PiA+ID4gaW50ZXJlc3RlZC4KPj4gPiA+Cj4+ID4gPiA+Cj4+ID4gPiA+IEFu
ZHJldyBDb29wZXIgc3VnZ2VzdGVkIG9uIGlyYyB0aGUgZm9sbG93aW5nIHByb2plY3Q6IENvbnRl
eHQgU3dpdGNoaW5nCj4+ID4gPiA+IHdpdGggQ1IwLlRTIGluIEhWTSBHdWVzdC4gV2Ugd291bGQg
bGlrZSB0byBwb3NzaWJsZSBrbm93IG1vcmUgYWJvdXQgdGhpcwo+PiA+ID4gPiBwcm9qZWN0IGlu
IHRlcm1zIG9mIGRpZmZpY3VsdHksIHBvdGVudGlhbCBlc3RpbWF0ZSBvbiB0aW1lIHJlcXVpcmVk
Lgo+PiA+ID4gPiBBbmRyZXcgYWxzbyBtZW50aW9uZWQgYSBzbGlnaHRlciBiaWdnZXIgeGVuL2xp
bnV4IHByb2plY3QgYW5kIHdlIHdvdWxkCj4+ID4gPiA+IGxpa2UgdG8ga25vdyBtb3JlIGRldGFp
bCBhYm91dCB0aGlzIG9uZSBhcyB3ZWxsLgo+PiA+ID4KPj4gPiA+IENoZWVycywKPj4gPiA+Cj4+
ID4gPiAtLQo+PiA+ID4gSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
