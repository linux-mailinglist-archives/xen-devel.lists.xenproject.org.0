Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334DA14DF24
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:30:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCf1-0007Bt-JX; Thu, 30 Jan 2020 16:27:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixCez-0007Bo-Lz
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:27:17 +0000
X-Inumbo-ID: 60b5f434-437d-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60b5f434-437d-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 16:27:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 780AAB089;
 Thu, 30 Jan 2020 16:27:15 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200130145745.1306-1-pdurrant@amazon.com>
 <20200130145745.1306-4-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a17f9cb-124d-aedc-3bde-94b16f522089@suse.com>
Date: Thu, 30 Jan 2020 17:27:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200130145745.1306-4-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 3/4] mm: make pages allocated with
 MEMF_no_refcount safe to assign
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDEuMjAyMCAxNTo1NywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IEN1cnJlbnRseSBpdCBp
cyB1bnNhZmUgdG8gYXNzaWduIGEgZG9taGVhcCBwYWdlIGFsbG9jYXRlZCB3aXRoCj4gTUVNRl9u
b19yZWZjb3VudCB0byBhIGRvbWFpbiBiZWNhdXNlIHRoZSBkb21haW4ndCAndG90X3BhZ2VzJyB3
aWxsIG5vdAo+IGJlIGluY3JlbWVudGVkLCBidXQgd2lsbCBiZSBkZWNyZW1lbnQgd2hlbiB0aGUg
cGFnZSBpcyBmcmVlZCAoc2luY2UKPiBmcmVlX2RvbWhlYXBfcGFnZXMoKSBoYXMgbm8gd2F5IG9m
IHRlbGxpbmcgdGhhdCB0aGUgaW5jcmVtZW50IHdhcyBza2lwcGVkKS4KPiAKPiBUaGlzIHBhdGNo
IGFsbG9jYXRlcyBhIG5ldyAnY291bnRfaW5mbycgYml0IGZvciBhIFBHQ19leHRyYSBmbGFnCj4g
d2hpY2ggaXMgdGhlbiB1c2VkIHRvIG1hcmsgcGFnZXMgd2hlbiBhbGxvY19kb21oZWFwX3BhZ2Vz
KCkgaXMgY2FsbGVkCj4gd2l0aCBNRU1GX25vX3JlZmNvdW50LiBhc3NpZ25fcGFnZXMoKSBiZWNh
dXNlIGl0IHN0aWxsIG5lZWRzIHRvIGNhbGwKPiBkb21haW5fYWRqdXN0X3RvdF9wYWdlcygpIHRv
IG1ha2Ugc3VyZSB0aGUgZG9tYWluIGlzIGFwcHJvcHJpYXRlbHkKPiByZWZlcmVuY2VkLiBIZW5j
ZSBpdCBpcyBtb2RpZmllZCB0byBkbyB0aGF0IGZvciBQR0NfZXh0cmEgcGFnZXMgZXZlbiBpZiBp
dAo+IGlzIHBhc3NlZCBNRU1GX25vX3JlZm91bnQuCj4gCj4gVGhlIG51bWJlciBvZiBQR0NfZXh0
cmEgcGFnZXMgYXNzaWduZWQgdG8gYSBkb21haW4gaXMgdHJhY2tlZCBpbiBhIG5ldwo+ICdleHRy
YV9wYWdlcycgY291bnRlciwgd2hpY2ggaXMgdGhlbiBzdWJ0cmFjdGVkIGZyb20gJ3RvdGFsX3Bh
Z2VzJyBpbgo+IHRoZSBkb21haW5fdG90X3BhZ2VzKCkgaGVscGVyLiBUaHVzICdub3JtYWwnIHBh
Z2UgYXNzaWdubWVudHMgd2lsbCBzdGlsbAo+IGJlIGFwcHJvcHJpYXRlbHkgY2hlY2tlZCBhZ2Fp
bnN0ICdtYXhfcGFnZXMnLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJh
bnRAYW1hem9uLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
