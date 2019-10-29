Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 722EFE8ADC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 15:36:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPSZd-0000GP-8U; Tue, 29 Oct 2019 14:34:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9ckO=YW=amazon.de=prvs=19881d706=nmanthey@srs-us1.protection.inumbo.net>)
 id 1iPSZb-0000GK-Ry
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 14:34:15 +0000
X-Inumbo-ID: 2dc1ff72-fa59-11e9-bbab-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2dc1ff72-fa59-11e9-bbab-bc764e2007e4;
 Tue, 29 Oct 2019 14:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1572359655; x=1603895655;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=bZxvR4lCMR7auDjGQtMlgVs2jHprf9QoTy5b+vba7Q0=;
 b=FYsYILZGw7cpg5dd5CTgJyewiAgRXyUtkMwGAHif9ca1CQJWcm7Dx65s
 zAiYCXYj/X9oxYJk56uYkTmJBxIKudcZ8wv97zfKj5/gprJBsjHEtH+8x
 TJ0wyVuHqXDYyKPmqePRdZohVuTzSf531sRKnymLblBf9YmOk33k6yFDh E=;
IronPort-SDR: 3/KdpPeST2JGNJzrAkzXDw2QG1UIhbY8RziUkkG7CgegsUfEMzw1VT8UDYjJHPIA782ci0l9eW
 evqazgRzl0iw==
X-IronPort-AV: E=Sophos;i="5.68,244,1569283200"; 
   d="scan'208";a="1472878"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 29 Oct 2019 14:34:06 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 83B83A2134; Tue, 29 Oct 2019 14:34:04 +0000 (UTC)
Received: from EX13D02EUB001.ant.amazon.com (10.43.166.150) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 29 Oct 2019 14:34:03 +0000
Received: from uc1a35a69ae4659.ant.amazon.com (10.43.162.16) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 29 Oct 2019 14:33:58 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-3-andrew.cooper3@citrix.com>
 <9a76e252-b9a3-4454-6ca8-ab521276fc31@suse.com>
 <782089aa-7994-f471-3c52-2afb30f95812@citrix.com>
 <c12afdd1-c561-bc79-5c36-22ac2e994953@suse.com>
 <6d7c899e-81ab-bc61-a589-043b327b3137@citrix.com>
 <477a6513-0caf-fc4a-21cf-a3a101b6c5ca@suse.com>
 <5b6b2cd3-b8a5-7697-e6f4-f7c337242276@amazon.de>
 <5d075fd9-acbe-0fcd-8f22-9f49c61f657f@citrix.com>
 <15ce3d44-0eaf-c01b-8c80-b0067de9e249@amazon.de>
 <1924da4a-b2d7-456e-5276-6c33338ec86b@citrix.com>
 <ad9f735e-4c68-95f9-aa8d-44b5a09095ff@suse.com>
 <2a4d71e8-56f1-d7b6-b149-03745baa484c@citrix.com>
From: Norbert Manthey <nmanthey@amazon.de>
Openpgp: preference=signencrypt
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <c381fc30-ff47-c045-315a-184e0dbcc47c@amazon.de>
Date: Tue, 29 Oct 2019 15:33:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2a4d71e8-56f1-d7b6-b149-03745baa484c@citrix.com>
Content-Language: en-US
X-Originating-IP: [10.43.162.16]
X-ClientProxiedBy: EX13D12UWC003.ant.amazon.com (10.43.162.12) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 2/7] xen/nospec: Use always_inline to fix
 code gen for evaluate_nospec
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMjkvMTkgMTU6MTYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjkvMTAvMjAxOSAx
NDowMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI5LjEwLjIwMTkgMTQ6NDYsIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+PiBJZiB0aGlzIHBhdGNoIHNlcmllcyBkb2VzIG5vdCBhZ3JlZW1lbnQs
IEkgd2lsbCB1bmJsb2NrIGxpdmVwYXRjaGluZyBvbgo+Pj4gNC4xMyBieSBjb21taXR0aW5nIHRo
ZSB2MiBwYXRjaCB3aGljaCBjYXVzZXMgQlJBTkNIX0hBUkRFTiB0byBkZXBlbmQgb24KPj4+IEJS
T0tFTiBhbmQgZm9yY2UgaXQgdG8gYmUgY29tcGlsZWQgb3V0IHdpdGggbm8gdXNlciBjaG9pY2Ug
YXQgYWxsLgo+Pj4KPj4+IFVuYnJlYWtpbmcgbGl2ZXBhdGNoaW5nIGlzIHN0cmljdGx5IG1vcmUg
aW1wb3J0YW50IHRoYW4ga2VlcGluZyBhIGJyYW5kCj4+PiBuZXcgZmVhdHVyZSBpbiA0LjEzIGlu
IGEgYnJva2VuIGZvcm0uwqAgSSd2ZSBwcm92aWRlZCB0d28gYWx0ZXJuYXRpdmUKPj4+IHN0cmF0
ZWdpZXMgdG8gZml4IHRoZSA0LjEzIGJsb2NrZXJzLCBidXQgaWYgbm9vbmUgY2FuIGFncmVlIG9u
IHdoaWNoCj4+PiBhcHByb2FjaCB0byB1c2UsIEkgd2lsbCBjb21taXQgdGhlIHNpbXBsZXIgZml4
Lgo+PiBBcyB0byB1bmJsb2NraW5nIGxpdmUgcGF0Y2hpbmcgLSBtYXkgSSBhc2sgeW91IGxvb2sg
YXQgdGhlIHN5bWJvbAo+PiBkaXNhbWJpZ3VhdGlvbiBwYXRjaCBJIGRpZCBzdWJtaXQ/IFRoZSB0
aHJlYWQgaGVyZSwgYXMgc3VnZ2VzdGVkCj4+IGJlZm9yZSwgc2hvdWxkIG5vdyBiZSBzb2xlbHkg
YWJvdXQgY29kZSBnZW5lcmF0aW9uLgo+IFJpZ2h0LCBidXQgdGhlIGN1cnJlbnQgc3RhdGUgb2Yg
bDF0Zi1iYXJyaWVyIGlzIGFsc28gYSA0LjEzIGJsb2NrZXIgdG9vCj4gLSBpdCBpcyBub3QgaW4g
YSBzaGlwcGFibGUgc3RhdGUuCj4KPiBJdCBlaXRoZXIgd2FudHMgY29tcGlsaW5nIG91dCB0b3Rh
bGx5ICh0aGUgdjIgcGF0Y2gpLCBvciBoYXZpbmcgdGhlIGNvZGUKPiBnZW5lcmF0aW9uIGZpeGlu
ZyAodGhpcyB2MyBzZXJpZXMpLCBvciBzb21lIGNvbmNyZXRlIDNyZCBzdWdnZXN0aW9uLgoKSSB2
b3RlIGZvciBoYXZpbmcgdGhlIGNvZGUgZ2VuZXJhdGlvbiBmaXhlZCwgaS5lLiB2MyBvZiB0aGlz
IHNlcmllcy4KCkJlc3QsCk5vcmJlcnQKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2Vy
bWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6
IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dl
cmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3Qt
SUQ6IERFIDI4OSAyMzcgODc5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
