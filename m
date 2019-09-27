Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F22C012E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 10:31:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDlc9-0000rM-AC; Fri, 27 Sep 2019 08:28:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDlc7-0000rE-SM
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 08:28:31 +0000
X-Inumbo-ID: c985802c-e100-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id c985802c-e100-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 08:28:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8EAE1AFBB;
 Fri, 27 Sep 2019 08:28:30 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190927060448.7056-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d00e2b63-0d47-9fbc-3d31-fc79de33574e@suse.com>
Date: Fri, 27 Sep 2019 10:28:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190927060448.7056-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/debugtrace: fix buffer allocation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMjAxOSAwODowNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBDb21taXQgNjMzOGM5
ZWFkOWZmOWVmNiAoImRlYnVndHJhY2U6IGFkZCBwZXItY3B1IGJ1ZmZlciBvcHRpb24iKSBoYWQK
PiBhIHJlYmFzZSBlcnJvciB3aGVuIHVzaW5nIHBlci1jcHUgYnVmZmVyczogdGhlIGdsb2JhbCBi
dWZmZXIgYWRkcmVzcwo+IHdvdWxkIGFsd2F5cyBiZSBzZXQgdG8gdGhlIG9uZSBvZiB0aGUgbGFz
dCBwZXItY3B1IGJ1ZmZlciBhbGxvY2F0ZWQuCj4gCj4gVGhlIHJlc3VsdCB3b3VsZCBiZSB0aGF0
IHdoZW4gZHVtcGluZyB0aGUgYnVmZmVycyB0aGUgbGFzdCBjcHUncyBidWZmZXIKPiBpcyBhbHdh
eXMgc2hvd24gYXMgZW1wdHkgYXMgdGhvc2UgZW50cmllcyBhcmUgcHJpbnRlZCBpbiB0aGUgZ2xv
YmFsCj4gYnVmZmVyJ3MgZHVtcCBhbHJlYWR5Lgo+IAo+IEZpeCB0aGF0Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
