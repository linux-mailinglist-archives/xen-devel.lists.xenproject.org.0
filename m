Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B451703F9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 17:15:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6zIQ-0007Zl-PH; Wed, 26 Feb 2020 16:12:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TmNR=4O=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6zIO-0007Zc-Rc
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 16:12:24 +0000
X-Inumbo-ID: c5bda3e6-58b2-11ea-947c-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5bda3e6-58b2-11ea-947c-12813bfff9fa;
 Wed, 26 Feb 2020 16:12:23 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id e10so4405166edv.9
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 08:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=722RX2QJmynQei1QWSxd6K+A1hJd1Hh26Q74z5cNmD0=;
 b=ErhgEMnqdgLK1i5JcJpFvzFh5UjkWniHFvub+7+kH9K9sR9QSE4Z5AuyR2qjWICY/Z
 7BYLmvMVd0GWm5u2EVOByeWR1iIH8Npb0t2e7Bvf3u5eWtb04rNxlHuMHFzD6Ebk6eqU
 ey71tGooxiFicI9SOAJUsBp+zD63OIj/k33oSPxjSSEyrkwGJ48fnobByuE6mpqgeZDw
 VKnzG0fUAfVQjeR5pPEvIR80AjlI/yCSq80roPhqbHRQ2h7f9rQxRtiDcPqyCkUUGsPA
 ahK/7RFP2yFxRwW9iWukudLQvi9aLjO2qVTQLzIof22f9Ks5Amd12JXTktzEJvJ6ytMJ
 Hfdw==
X-Gm-Message-State: APjAAAVkkrmSep+k3mKjZUehLpMpATeBfb2dtpvd3kBPXe8il+wjDT/Y
 qdZSpyqWBOwVLu6ah0WFuI4=
X-Google-Smtp-Source: APXvYqyD1RVMDhbKclPpzX0kh/mCMHvOFX/op1qgyVmINv/mULO0nT1AAkBhgtMxNRqMmZOqHNqhxQ==
X-Received: by 2002:a17:906:6d03:: with SMTP id
 m3mr5045061ejr.39.1582733542978; 
 Wed, 26 Feb 2020 08:12:22 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id q5sm151667edb.70.2020.02.26.08.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 08:12:22 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
 <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>
Date: Wed, 26 Feb 2020 16:12:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 2/2] domain: use PGC_extra domheap page for
 shared_info
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCtEYXZpZCkKCk9uIDI2LzAyLzIwMjAgMTU6MjMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI2
LjAyLjIwMjAgMTU6MDUsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+PiBGcm9tOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiBTZW50OiAyNiBGZWJydWFyeSAyMDIwIDEzOjU4Cj4+
Pgo+Pj4gT24gMjUuMDIuMjAyMCAxMDo1MywgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4+IFRoZXJl
J3Mgbm8gcGFydGljdWxhciByZWFzb24gc2hhcmVkX2luZm8gbmVlZCB1c2UgYSB4ZW5oZWFwIHBh
Z2UuIEl0J3MKPj4+PiBvbmx5IHB1cnBvc2UgaXMgdG8gYmUgbWFwcGVkIGJ5IHRoZSBndWVzdCBz
byB1c2UgYSBQR0NfZXh0cmEgZG9taGVhcAo+Pj4gcGFnZQo+Pj4+IGluc3RlYWQuCj4+Pgo+Pj4g
U2luY2UgdGhlIGNvdmVyIGxldHRlciBhbHNvIGRvZXNuJ3QgZ2l2ZSBhbnkgYmFja2dyb3VuZCAt
IGlzIHRoZXJlIGEKPj4+IHByb2JsZW0gd2l0aCB0aGUgY3VycmVudCBhcnJhbmdlbWVudHM/IEFy
ZSB0aGVyZSBhbnkgZnVydGhlciBwbGFucwo+Pj4gZGVwZW5kaW5nIG9uIHRoaXMgYmVpbmcgY2hh
bmdlZD8gT3IgaXMgdGhpcyBzaW1wbHkgImxldCdzIGRvIGl0Cj4+PiBiZWNhdXNlIG5vdyB3ZSBj
YW4iPwo+Pj4KPj4KPj4gVGhlIGdlbmVyYWwgZGlyZWN0aW9uIGlzIHRvIGdldCByaWQgb2Ygc2hh
cmVkIHhlbmhlYXAgcGFnZXMuIEtub3dpbmcKPj4gdGhhdCBhIHhlbmhlYXAgcGFnZSBpcyBub3Qg
c2hhcmVkIHdpdGggYSBndWVzdCBtYWtlcyBkZWFsaW5nIHdpdGgKPj4gbGl2ZSB1cGRhdGUgbXVj
aCBlYXNpZXIsCj4gCj4gSSBtYXkgbm90IGJlIHNlZWluZyBlbm91Z2ggb2YgdGhlIG92ZXJhbGwg
cGljdHVyZSwgYnV0IGl0IHdvdWxkIHNlZW0KPiB0byBtZSB0aGF0IHRoZSBzcGVjaWFsIHRyZWF0
bWVudCBvZiBzaGFyZWQgWGVuIGhlYXAgcGFnZXMgd291bGQgdGhlbgo+IGJlIHJlcGxhY2VkIGJ5
IHNwZWNpYWwgdHJlYXRtZW50IG9mIFBHQ19leHRyYSBvbmVzLgoKSSBoYXZlIGJlZW4gd29ya2lu
ZyBvbiBMaXZldXBkYXRlIGZvciB0aGUgcGFzdCBjb3VwbGUgbW9udGhzIGFuZCBJIGRvbid0IAog
IHJlYWxseSBzZWUgaG93IHRoaXMgaXMgZ29pbmcgdG8gbWFrZSBsaXZldXBkYXRlIGVhc2llci4g
V2Ugd2lsbCBzdGlsbCAKbmVlZCB0byBzYXZlIHRoZSBleHRyYSBmbGFncyBhbmQgZXh0cmEgcmVj
b3JkcyBmb3IgZWFjaCBzdWJzeXN0ZW0gdXNpbmcgCnRoZW0gKGUuZyBncmFudC10YWJsZXMpLgoK
SSBoYXZlIENDZWQgRGF2aWQgdG8gc2VlIGlmIGhlIGhhcyBhIGRpZmZlcmVudCBvcGluaW9uLgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
