Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A004611F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 16:40:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbnJd-0000Xi-LR; Fri, 14 Jun 2019 14:36:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ztYt=UN=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hbnJb-0000Xd-SP
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 14:36:27 +0000
X-Inumbo-ID: c97bd16c-8eb1-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c97bd16c-8eb1-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 14:36:26 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s21so2631033lji.8
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2019 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lSw6fBsljTnvzspNwsh/sSpovmEtMooRoPi/uMU/yUk=;
 b=BtCzHE5IXK7VgOKtxmE81WjLXs39dFMZelZxxjYJV9c7mCIev/A941emfvJ0okQPSW
 LaW1d2PxClLr1NL5/lk/gnVdyGNaraEuOBoeZuAA9G4d9b+pRYXUkhsDcdc6f8kXiVQ1
 Rm4Q3fWA+ufK+Fdm+z9sjaz6Shu7IZnP4H4ENN9jXH+z+U7U9e47kMPtwnsqoiSYNEDN
 cKmcCWBsHAlcw/HHRyRsf+jc0j+wrN4btkCHzg1GxV8NpH7hmsi46ETLG7gUovvb+79x
 Bxig9SU8z6lW2sqT9QIpfLtwM1RStY2xlmNxwYJnDTtDZLASjwLmY1qL0vQ44HXmTX5M
 8aNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lSw6fBsljTnvzspNwsh/sSpovmEtMooRoPi/uMU/yUk=;
 b=GwHvoLQsFlFFEZrtA77+xT8hUcldWRd3ewH/2KryKslfNrcOUgA59QtloVuJZAlynL
 AQc2nGDRYmfSF7jk2J9qWqkHJKfzfvB2rlgcM4SnJov/gPpPIg58INCvNrQFfWcbVAFF
 Y9IYaCst+9eRjotgV68x7Dfdk03sduOZ+07Ipzp3CqH7eNGzKbjm/L/+e9lR9JQPaLD+
 sioReWXCWIbDAdfnHnZ7Jw8nmuevDfS2rLzz6f585+fQ35Or9ilH2EEdO4TWlayqd5hH
 tYTpq+uGAGdkVOxdKjWp0HbPGHNLL5K7BB5jGIDIcJgAziVdgd+BHZOiY2YdSfWLOUR8
 1teA==
X-Gm-Message-State: APjAAAUh8gwjDG/UF/LAr85HMB6YDJ1NDNCVHJ3sFv1mPAHlSAWFoq+G
 +Jvw4wQwLjLI+xVXoVGacWw=
X-Google-Smtp-Source: APXvYqy5Xxn2M7WhpuFz5SGf4tx7I0N3BZPyAQgD0rYzuWtFqE4P4fReUwAPE/yKyL0c3Hpa5Ag1YA==
X-Received: by 2002:a2e:8793:: with SMTP id n19mr9032661lji.174.1560522984540; 
 Fri, 14 Jun 2019 07:36:24 -0700 (PDT)
Received: from [10.17.180.34] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 k8sm628250lja.24.2019.06.14.07.36.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 07:36:23 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <7de133a9-6aa7-1523-3f8f-b5506efef032@gmail.com>
 <5D02448E0200007800237D77@prv1-mh.provo.novell.com>
 <9390f580-d99b-0163-48c2-7c1bd2d0133d@arm.com>
 <5D0248770200007800237DAF@prv1-mh.provo.novell.com>
 <f5b28793-5cc4-0f83-d571-af87d75e38c0@arm.com>
 <5D0252300200007800237E93@prv1-mh.provo.novell.com>
 <f90caffd-32c1-54a4-a28a-8d5f3976f8f8@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <90a3c768-5274-dbb8-8eb2-2eda902c3e5b@gmail.com>
Date: Fri, 14 Jun 2019 17:36:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f90caffd-32c1-54a4-a28a-8d5f3976f8f8@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMTMuMDYuMTkgMTc6NDEsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBT
b3JyeSBJIG1heSBoYXZlIG1pc3NlZCBpdC4gV2UgY2FuJ3QgcmVhbGx5IHJlc3RyaWN0IHRoZSB1
c2FnZSBvZiB0aGUgY3VycmVudCBoeXBlcmNhbGwgKGl0IGlzIHByZXR0eSBsYXgpLiBTbyBJIHRo
aW5rIGFueSBsb2NrbGVzcyBzb2x1dGlvbiB3b3VsZCByZXF1aXJlIHRvIGFsbG93IHRoZSBoeXBl
cmNhbGwKPiB0byBiZSB1c2VkIHRvZ2V0aGVyICh3aGljaCBJIHdhbnQgdG8gYXZvaWQpLgoKSSdk
IGJldHRlciBzYXkgaGVyZSBhbGxvd2luZyB1c2luZyBwaHlzIGFuZCB2aXJ0IHJlZ2lzdGVyZWQg
cnVuc3RhdGVzIHRvZ2V0aGVyIChhbmQgaW5kZXBlbmRlbnRseSkuCkFuZCBtZSBwZXJzb25hbGx5
IGZvciB0aGlzIGFwcHJvYWNoLCBmb3Igc3VyZSBub3QgZW5jb3VyYWdpbmcgdXNlcnMgKGd1ZXN0
cykgdG8gZG8gc28uCgo+IElmIHdlIGFncmVlIHRvIGFsbG93IHRoZSB0d28gaHlwZXJjYWxscyB0
byBiZSB1c2VkIHRvZ2V0aGVyLCB0aGVuIGlmIHdlIHByb3RlY3QgdGhlIHVwZGF0ZSB3aXRoIGRv
bWFpbl9sb2NrKCkgdGhlbiB5b3Ugc2hvdWxkIGJlIGFibGUgdG8gYXZvaWQgYW55IHJhY2Ugd2l0
aCB0aGUgdXBkYXRlIHBhdGggYXMgb25saW5pbmcgYSB2Q1BVIHJlcXVpcmVzIHRvIHRha2UgdGhl
IGRvbWFpbl9sb2NrKCkgKHNlZSBkb192Y3B1X29wIGZvciB4ODYgYW5kIGRvX2NvbW1vbl9jcHVf
b24gZm9yIEFybSkuCgpDb3VsZCB5b3UgcGxlYXNlIGNsYXJpZnkgYXJlIHlvdSBzYXlpbmcgYWJv
dXQgcHJvdGVjdGlvbiBydW5zdGF0ZSBtYXBwaW5nIHVwZGF0ZSBvciBydW5zdGF0ZSB2YWx1ZXMg
dXBkYXRlPwpJJ2Qgbm90IHVzZSB0aGUgY29tbW9uIGxvY2sgZm9yIGFsbCB2Y3B1cyBydW5zdGF0
ZSB2YWx1ZSB1cGRhdGUsIHVubGVzcyBpdCBpcyBhbiBydyBsb2NrIG9yIGRvaW5nIHRyeWxvY2sg
b24gaXQuCgpCVFcsIEknbSBhIGJpdCBjb25mdXNlZCwgYXJlIHlvdSBPSyB3aXRoIGxvY2sgKG5v
dCB0cnlsb2NrKSBleGlzdGluZyBpbiBoeXBlcmNhbGw/CgotLSAKU2luY2VyZWx5LApBbmRyaWkg
QW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
