Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A96508E6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 12:29:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfMAf-00034l-0C; Mon, 24 Jun 2019 10:25:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VJaK=UX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hfMAd-00034g-L7
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 10:25:55 +0000
X-Inumbo-ID: 6fe12bf6-966a-11e9-93d1-6bdb8d263e90
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6fe12bf6-966a-11e9-93d1-6bdb8d263e90;
 Mon, 24 Jun 2019 10:25:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B157D2B;
 Mon, 24 Jun 2019 03:25:49 -0700 (PDT)
Received: from [10.37.9.192] (unknown [10.37.9.192])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F7793F718;
 Mon, 24 Jun 2019 03:25:47 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1906211320580.25730@sstabellini-ThinkPad-T480s>
 <20190621202407.7781-2-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <19811e20-73ba-0a30-7918-fd58da411514@arm.com>
Date: Mon, 24 Jun 2019 11:25:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621202407.7781-2-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/2] xen/arm: fix mask calculation in
 pdx_init_mask
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, wei.liu2@citrix.com,
 konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, JBeulich@suse.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMjEvMTkgOToyNCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IFRoZSBtYXNrIGNhbGN1bGF0aW9uIGluIHBkeF9pbml0X21hc2sgaXMgd3Jvbmcgd2hlbiB0
aGUgZmlyc3QgYmFuawo+IHN0YXJ0cyBhdCBhZGRyZXNzIDB4MC4gVGhlIHJlYXNvbiBpcyB0aGF0
IHBkeF9pbml0X21hc2sgd2lsbCBkbyAnMCAtIDEnCj4gY2F1c2luZyBhbiB1bmRlcmZsb3cuIEFz
IGEgcmVzdWx0LCB0aGUgbWFzayBiZWNvbWVzIDB4ZmZmZmZmZmZmZmZmZmZmZgo+IHdoaWNoIGlz
IHRoZSBiaWdnZXN0IHBvc3NpYmxlIG1hc2sgYW5kIGVuZHMgdXAgY2F1c2luZyBhIHNpZ25pZmlj
YW50Cj4gbWVtb3J5IHdhc3RlIGluIHRoZSBmcmFtZXRhYmxlIHNpemUgY29tcHV0YXRpb24uCj4g
Cj4gRm9yIGluc3RhbmNlLCBvbiBwbGF0Zm9ybXMgdGhhdCBoYXZlIGEgbG93IG1lbW9yeSBiYW5r
IHN0YXJ0aW5nIGF0IDB4MAo+IGFuZCBhIGhpZ2ggbWVtb3J5IGJhbmssIHRoZSBmcmFtZXRhYmxl
IHdpbGwgZW5kIHVwIGNvdmVyaW5nIGFsbCB0aGUKPiBob2xlcyBpbiBiZXR3ZWVuLgo+IAo+IFRo
ZSBwdXJwb3NlIG9mIHRoZSBtYXNrIGlzIHRvIGJlIHBhc3NlZCBhcyBhIHBhcmFtZXRlciB0bwo+
IHBmbl9wZHhfaG9sZV9zZXR1cCwgd2hpY2ggYmFzZWQgb24gdGhlIG1hc2sgcGFyYW1ldGVyIGNh
bGN1bGF0ZXMKPiBwZm5fcGR4X2hvbGVfc2hpZnQsIHBmbl9wZHhfYm90dG9tX21hc2ssIGV0Yy4g
d2hpY2ggYXJlIGFjdHVhbGx5IHRoZQo+IGltcG9ydGFudCBtYXNrcyBmb3IgZnJhbWV0YWJsZSBp
bml0aWFsaXphdGlvbiBsYXRlciBvbi4KPiAKPiBwZm5fcGR4X2hvbGVfc2V0dXAgbmV2ZXIgY29t
cHJlc3NlcyBhZGRyZXNzZXMgYmVsb3cgTUFYX09SREVSIGJpdHMgKDFHQgo+IG9uIEFSTSkuIFRo
dXMsIGl0IGlzIHNhZmUgdG8gaW5pdGlhbGl6ZSBtYXNrIHBhc3NpbmcgMVVMTCA8PCAoTUFYX09S
REVSCj4gKyBQQUdFX1NISUZUKSBhcyBzdGFydCBhZGRyZXNzIHRvIHBkeF9pbml0X21hc2suCj4g
Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29t
Pgo+IFJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IEFj
a2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpVbmZvcnR1bmF0ZWx5IHRo
aXMgcGF0Y2ggaXMgYnJlYWtpbmcgYm9vdCBvbiBBTUQgU2VhdHRsZSAobGF4dG9uezAsMX0pIApz
ZWUgWzFdLiBUaGUgYmlzZWN0b3IgZmluZ2VyZWQgdGhpcyBwYXRjaCBbMl0uCgpUbyB1bmJsb2Nr
IG9zc3Rlc3QsIEkgaGF2ZSB0YWtlbiB0aGUgbGliZXJ0eSB0byByZXZlcnQgdGhlIHBhdGNoIG9u
IHN0YWdpbmcuCgogRnJvbSBMaW51eCwgdGhlIG1lbW9yeSByYW5nZSBmb3IgU2VhdHRsZSBpcwow
eDAwMDAwMDgwMDAwMDAwMDAtMHgwMDAwMDA4N2ZmZmZmZmZmCgpJIGFtIG5vdCBlbnRpcmVseSBz
dXJlIHdoeSB0aGlzIHBhdGNoIGFmZmVjdHMgdGhlIGJvb3QuIFN0ZWZhbm8gY2FuIHlvdSAKbG9v
ayBhdCBpdD8KCkNoZWVycywKClsxXSAKaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5v
cmcvb3NzdGVzdC9yZXN1bHRzL2hpc3RvcnkvdGVzdC1hcm02NC1hcm02NC14bC14c20veGVuLXVu
c3RhYmxlLXNtb2tlLmh0bWwKWzJdIGh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDE5LTA2L21zZzAxNTQ5Lmh0bWwKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
