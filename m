Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 411597C44D
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 16:02:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsp8e-0006uQ-QW; Wed, 31 Jul 2019 13:59:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7/lg=V4=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hsp8c-0006uD-UH
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 13:59:31 +0000
X-Inumbo-ID: 69ddb259-b39b-11e9-8980-bc764e045a96
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 69ddb259-b39b-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 13:59:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s3so60905899wms.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2019 06:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=S4cLWe3+ZOcUBeFK991ijpC0RGjn5nrYH64Q1+hDrT8=;
 b=Ysus9dHCe55rqzzmBEg2KvD13uV1Zbs2UcPAKehUZyLAg/uuuhoebYbzUgUYpqYbc+
 kGF0OQDCBNFqKMSOqqkZrNdWosjpOtAzSOZmhlCMUuJkmCpUuVHRjhG9gY+0rKqH3gWU
 9ZZMEaoGxO9pDCJyxykZ+ZPrVc+zVkDDfG9JTN/5Vvysu3/NaVNQnrCT9qoUEKcSbuaa
 NAawM1JNQk+siGRTtQYefTZ7BkFMo3+qZx4aGZyYOdO94P4aGW8Mpni2ZcbdKIfBpDod
 OnbBfBBw8arRJRRHqQklImzOHPHZ3piz3aNaWQ9gUbhpvRdzKDXx+OLR8zFmvGOLXs0S
 g2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=S4cLWe3+ZOcUBeFK991ijpC0RGjn5nrYH64Q1+hDrT8=;
 b=Iv2sV6nAA6LbiphVw+ubiSmWqeCpNYM6/8XjxzjE+Pf7GXtPxh/cM3gK/SqjArXv9Q
 0vYjCtx4ZHwPcB8hR22CUfmYx0fbpYt+QSbt84G67aXU0B2qUf1jqHlEtfvoXFbqQrEh
 QkQayZ+1o/bHwm93f0WDkjikBDW7qUpjqKK316fkC9mtSCgNE7B7BQgzA4QUenNU9QPJ
 8aYBCe5NXLVq7NXSORsVUsgfChxArKA5UETIlxpdHUWFK6QdPn+8mxuWLRWan1xft5df
 AQ2pQX28s8udKQ1bsyBTs41mpCMbwEfJYn1TQgQSBIojiax7uMOJhptCM0Mj3EDly1E8
 oPYw==
X-Gm-Message-State: APjAAAUuutP2Xh4AAfVqcyE+tq20W4wcAQ51Kopr95/1Xx8o5qNZoB91
 QlPC39goaVsuf5MX4+Dnimk=
X-Google-Smtp-Source: APXvYqwMv+pBs4UWVJShxdQkP7U3GksdA1WWspYDhAVeCEfbItuhKVhIo1mJO2BAdQlOmme05ivuLw==
X-Received: by 2002:a1c:305:: with SMTP id 5mr81897722wmd.101.1564581567770;
 Wed, 31 Jul 2019 06:59:27 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:ac18:da00:64c0:6941:27f0:f032?
 ([2a02:c7f:ac18:da00:64c0:6941:27f0:f032])
 by smtp.gmail.com with ESMTPSA id e6sm66602953wrw.23.2019.07.31.06.59.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 06:59:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
From: Lars Kurth <lars.kurth.xen@gmail.com>
In-Reply-To: <f0a10555-0561-15dd-1516-fa3fe6b1d0db@arm.com>
Date: Wed, 31 Jul 2019 14:59:25 +0100
Message-Id: <791C64FD-8560-4894-B56E-F49C54BF20FC@gmail.com>
References: <20190730065637.3802-1-lukasz.hawrylko@intel.com>
 <5e5c945a-6bdb-2776-e2db-b11bbeb74bf5@suse.com>
 <d216b609-353d-e4c7-fdea-e2e63b175bb8@arm.com>
 <6b786dc3-f6d0-8536-0291-4f0de7f673b8@suse.com>
 <3dc11cbc-97a1-dae7-eba0-1bb0f8151244@arm.com>
 <47da6b72-614f-b29b-7357-ec6ea0bd3a17@citrix.com>
 <9BB67D01-4F6E-43DA-B080-2EA26AA67C43@xenproject.org>
 <f0a10555-0561-15dd-1516-fa3fe6b1d0db@arm.com>
To: Julien Grall <julien.grall@arm.com>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] [PATCH] Intel TXT: add reviewer,
 move to Odd Fixes state
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Committers <committers@xenproject.org>, 'Jan Beulich' <JBeulich@suse.com>,
 Lukasz Hawrylko <lukasz.hawrylko@intel.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDMxIEp1bCAyMDE5LCBhdCAxMjo1MiwgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4gd3JvdGU6Cj4gCj4+IFRvIG1vdmUgZm9yd2FyZDoKPj4gKiBUaGVyZSBzaG91bGQg
YmUgYSBwb2xpY3kgZGlzY3Vzc2lvbgo+IAo+IEhvdyBzaG91bGQgSSByYWlzZSBpdD8gRG8geW91
IHdhbnQgYSBwYXRjaCBhZ2FpbiBjb250cmlidXRpb24tZ3VpZGVsaW5lcz8KCkkgdGhpbmsgd2Ug
c2hvdWxkIHN0YXJ0IHdpdGggYW4gZS1tYWlsIHRocmVhZCB3aXRoIGFuIGFwcHJvcHJpYXRlIHRp
dGxlIG9uIHhlbi1kZXZlbEAgKENDaW5nIGNvbW1pdHRlcnNAKSBvdXRsaW5pbmcgCiogV2hhdCB0
aGUgcHJvcG9zYWwgaXMgYW5kIHdoeSBpdCBpcyBpbXBvcnRhbnQKICAtIEhvdyB3ZSBkb2N1bWVu
dCBpdCBpcyBzZWNvbmRhcnkgYW5kIEkgYW0gaGFwcHkgdG8gcGljayB0aGlzIHVwIGFmdGVyIHRo
ZXJlIGlzIGFncmVlbWVudCAKKiBIb3cgaXQgd291bGQgYmUgaW1wbGVtZW50ZWQgLSBlLmcuIGlm
IHRoZSBwcm9wb3NhbCB3YXMgdG8gcmVqZWN0IGUtbWFpbHMgd2l0aCBhIGRpc2NsYWltZXIsIHdl
IG5lZWQgdG8gaGF2ZSBhIG1lY2hhbmlzbSB0aGF0IGRvZXMgdGhpcyByZWxpYWJseSBhbmQgYWxz
byBpbmZvcm1zIHNlbmRlcnMgd2h5IGEgbWFpbCB3YXMgbm90IHBvc3RlZC4gV2Ugd291bGRuJ3Qg
d2FudCB4ZW4tZGV2ZWxAIHRvIGJlY29tZSBhIGJsYWNrIGhvbGUsIHdoZXJlIHN0dWZmIGZyb20g
c29tZSBwZW9wbGUgZ2V0cyBsb3N0IHdpdGhvdXQKCkl0IHRoZW4gd291bGQgaGF2ZSB0byBnbyB0
aHJvdWdoIGEgdm90ZSBhcyBub3JtYWwuIFlvdSBtYXkgd2FudCB0byBoYXZlIGEgY2hhdCB0byBJ
YW4gSmFja3NvbiBvbiBJUkM6IGhlIGhhcyBzb21lIG9waW5pb25zIGFuZCBleHBlcmllbmNlIHRo
YXQgaXMgYXBwbGljYWJsZQoKSSBqdXN0IGFncmVlZCB3aXRoIElhbiwgdGhhdCB0aGVyZSB3aWxs
IGJlIGEgc2ltaWxhciBkaXNjdXNzaW9uIHJlbGF0ZWQgdG8gdGhlIDIgc3RlcCBwcm9jZXNzIHRv
IGNoYW5nZSBtYWludGFpbmVycyB2aWEgdW5zdXBwb3J0ZWQgc3RhdHVzLCB3aGljaCBhbHNvIHdh
cyBoaWdobGlnaHRlZCBpbiB0aGlzIHRocmVhZC4gQWx0aG91Z2ggdGhpcyBjYW4gcHJvYmFibHkg
anVzdCBiZSBhIHBhdGNoIHRvIE1BSU5UQUlORVJTCgpSZWdhcmRzCkxhcnMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
