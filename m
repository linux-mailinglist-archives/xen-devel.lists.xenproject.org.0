Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CE08BC42
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 16:58:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxYD5-0004kC-L3; Tue, 13 Aug 2019 14:55:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxYD4-0004k5-EM
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 14:55:38 +0000
X-Inumbo-ID: 66e26adc-bdda-11e9-a1d0-73b8d138d975
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 66e26adc-bdda-11e9-a1d0-73b8d138d975;
 Tue, 13 Aug 2019 14:55:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94BBA344;
 Tue, 13 Aug 2019 07:55:33 -0700 (PDT)
Received: from [10.37.8.112] (unknown [10.37.8.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A384E3F706;
 Tue, 13 Aug 2019 07:55:32 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-6-sstabellini@kernel.org> <87blwtgmma.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6914df4a-03e3-31fb-9e93-49a018f1e708@arm.com>
Date: Tue, 13 Aug 2019 15:55:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87blwtgmma.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 6/7] xen/arm: don't iomem_permit_access
 for reserved-memory regions
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA4LzEzLzE5IDM6MzQgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IAo+IFN0
ZWZhbm8gU3RhYmVsbGluaSB3cml0ZXM6Cj4gCj4+IERvbid0IGFsbG93IHJlc2VydmVkLW1lbW9y
eSByZWdpb25zIHRvIGJlIHJlbWFwcGVkIGludG8gYW55IHVucHJpdmlsZWdlZAo+PiBndWVzdHMs
IHVudGlsIHJlc2VydmVkLW1lbW9yeSByZWdpb25zIGFyZSBwcm9wZXJseSBzdXBwb3J0ZWQgaW4g
WGVuLiBGb3IKPj4gbm93LCBkbyBub3QgY2FsbCBpb21lbV9wZXJtaXRfYWNjZXNzIG9uIHRoZW0s
IGJlY2F1c2UgZ2l2aW5nCj4+IGlvbWVtX3Blcm1pdF9hY2Nlc3MgdG8gZG9tMCBtZWFucyB0aGF0
IHRoZSB0b29sc3RhY2sgd2lsbCBiZSBhYmxlIHRvCj4+IGFzc2lnbiB0aGUgcmVnaW9uIHRvIGEg
ZG9tVS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4
aWxpbnguY29tPgo+PiAtLS0KPj4KPj4gQ2hhbmdlcyBpbiB2NToKPj4gLSBmaXggY2hlY2sgY29u
ZGl0aW9uCj4+IC0gdXNlIHN0cm5pY21wCj4+IC0gcmV0dXJuIGVycm9yCj4+IC0gaW1wcm92ZSBj
b21taXQgbWVzc2FnZQo+Pgo+PiBDaGFuZ2VzIGluIHY0Ogo+PiAtIGNvbXBhcmUgdGhlIHBhcmVu
dCBuYW1lIHdpdGggcmVzZXJ2ZWQtbWVtb3J5Cj4+IC0gdXNlIGR0X25vZGVfY21wCj4+Cj4+IENo
YW5nZXMgaW4gdjM6Cj4+IC0gbmV3IHBhdGNoCj4+IC0tLQo+PiAgIHhlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYyB8IDI0ICsrKysrKysrKysrKysrKystLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
Cj4+IGluZGV4IDRjODQwNDE1NWEuLmUwYzBjMDFjODggMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMK
Pj4gQEAgLTExNTUsMTUgKzExNTUsMjMgQEAgc3RhdGljIGludCBfX2luaXQgbWFwX3JhbmdlX3Rv
X2RvbWFpbihjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldiwKPj4gICAgICAgYm9vbCBu
ZWVkX21hcHBpbmcgPSAhZHRfZGV2aWNlX2Zvcl9wYXNzdGhyb3VnaChkZXYpOwo+PiAgICAgICBp
bnQgcmVzOwo+PiAgIAo+PiAtICAgIHJlcyA9IGlvbWVtX3Blcm1pdF9hY2Nlc3MoZCwgcGFkZHJf
dG9fcGZuKGFkZHIpLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFkZHJfdG9f
cGZuKFBBR0VfQUxJR04oYWRkciArIGxlbiAtIDEpKSk7Cj4+IC0gICAgaWYgKCByZXMgKQo+PiAr
ICAgIC8qCj4+ICsgICAgICogRG9uJ3QgZ2l2ZSBpb21lbSBwZXJtaXNzaW9ucyBmb3IgcmVzZXJ2
ZWQtbWVtb3J5IHJhbmdlcyB0byBkb21Vcwo+PiArICAgICAqIHVudGlsIHJlc2VydmVkLW1lbW9y
eSBzdXBwb3J0IGlzIGNvbXBsZXRlLgo+PiArICAgICAqLwo+PiArICAgIGlmICggc3RybmljbXAo
ZHRfbm9kZV9mdWxsX25hbWUoZGV2KSwgIi9yZXNlcnZlZC1tZW1vcnkiLAo+PiArICAgICAgICAg
c3RybGVuKCIvcmVzZXJ2ZWQtbWVtb3J5IikpICE9IDAgKQo+IFdoeSBhcmUgeW91IHVzaW5nIHN0
cm5pY21wIHRoZXJlPyBXaXRoIHN1Y2ggdXNhZ2UgaXQgaXMgdGhlIHNhbWUgYXMKPiBzdHJjYXNl
Y21wKCkuCgpEZWZpbml0ZWx5IG5vdCwgc3RyY2FzZWNtcCgpIHdpbGwgY29tcGFyZSB0aGF0IHRo
ZSB0d28gc3RyaW5ncyBleGFjdGx5IAptYXRjaCAoaWdub3JpbmcgdGhlIGNhc2Ugb2YgdGhlIGNo
YXJhY3RlcnMpLiBIZXJlIHdlIG9ubHkgd2FudCB0byBjaGVjayAKdGhlIGZpcnN0IHBhcnQgb2Yg
dGhlIHBhdGNoLCBzbyB3ZSBuZWVkIHRvIHVzZSB0aGUgbGVuZ3RoLWxpbWl0ZWQgdmVyc2lvbi4K
Cj4gQnV0LCBpZiB5b3Ugd2FudCB0byBmaW5kICIvcmVzZXJ2ZWQtbWVtb3J5IiBhbnl3aGVyZSBp
bgo+IGR0X25vZGVfZnVsbF9uYW1lKGRldiksIHRoZW4geW91IHByb2JhYmx5IHdhbnQgdG8gdXNl
IHN0cmNhc2VzdHIoKQoKRm9yIGEgZmlyc3Qgc3RyY2FzZXN0cigpIGlzIG5vdCBwcm92aWRlZCBi
eSB0aGUgc3RyaW5nIGxpYiBpbiBYZW4uIFNvIAp5b3Ugd291bGQgbmVlZCB0byBpbXBsZW1lbnQg
aXQuCgpCdXQgdGhlbiBhbGwgdGhlIHJlc2VydmVkLW1lbW9yeSByZWdpb25zIGFyZSB1bmRlciB0
aGUgbm9kZSAKL3Jlc2VydmVkLW1lbW9yeS4gQSBwYXRoIC9hL2IvcmVzZXJ2ZWQtbWVtb3J5IGlz
IG5vdCBhIHZhbGlkIG1lbW9yeSByZWdpb24uCgpPbiBhIHNpZGUgbm90ZSwgdGhlIGNoZWNrIGlz
IHN0aWxsIGluY29ycmVjdCBoZXJlIGJlY2F1c2UgeW91IHdvdWxkIAphbGxvdyAvcmVzZXJ2ZWQt
bWVtb3J5QC4uLiBvciAvcmVzZXJ2ZWQtbWVtb3J5LXRlc3QgdG8gcGFzcy4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
