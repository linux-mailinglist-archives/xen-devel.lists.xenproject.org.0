Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AAEB553B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 20:20:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAI3g-00011O-1B; Tue, 17 Sep 2019 18:18:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xh3O=XM=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iAI3e-00011H-Sy
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 18:18:34 +0000
X-Inumbo-ID: 8d6cfeca-d977-11e9-978d-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d6cfeca-d977-11e9-978d-bc764e2007e4;
 Tue, 17 Sep 2019 18:18:31 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id l21so2833818lje.4
 for <xen-devel@lists.xenproject.org>; Tue, 17 Sep 2019 11:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cOlOn+T1kv6Z0Zo0jtheLIwkGbrLj6TLOYblFHd/OoA=;
 b=obkkPXYHWN6k1aZoZdPO9nJAJWipgyDOkTqs2q9UG9CPcGrs6oahxjR5MWQs2Uphkk
 LFQrbtFD6VsEjG6l35hb9dejDAtaac+5ul+EYz601l2xk3a6Zl/Z7EsfS8beaxmHHVrr
 eH8YQMJmXLEKdGKF9OxDEzKd1CFZRNNM5X+txI0Agh6p0O6TBbZS7gYAUjz7LE5j7nLL
 QPRFJuv/UQrekTyVYqNwo06E3flHwY0wiMNST8kwT24C0vpLDTLDf/9VpW9v5M1c3Rpt
 37B/CJi00vFTW0RgoZaZBazzyEoLF5gyd2SiKNzQP+adiJJZBSCGh4FN0L35hIP7Z9q4
 ITgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cOlOn+T1kv6Z0Zo0jtheLIwkGbrLj6TLOYblFHd/OoA=;
 b=ps7723qHeHMeCBjL5cgCvMiXA5B52au4KR8d2iTdfW/VIOYc7Z/d/uogdrMPx/Y54t
 WzotOzlru91imd5fg6HQdqkvLDS1kW8MUktz2WhqEGp8ocWNtpGfQWSHLYiE9C4zqgG/
 SwU5AKaLG3Vxir5H/5qR5lmxQG9uo3HDfW81y4ar3imECLVoZZ2Fmihn+lg08/Fl8fNC
 GdmD6eUZEPImgmXkbT3xfM0n2bLqdr8k3LfvsI0V/pEoSAew31Jt+4bN8zGy+6tC/nvB
 xZUk5UYPENfYOCrhh17scDn8mTtZ+Mrc48zE/OhXIOlY2l/lVqCT/wKZOPG/0UzxtgCG
 OvDA==
X-Gm-Message-State: APjAAAU37Nbk2UONU3ipfjJ2GmMmjLT8kVAYaogfybyctvAsIFRsEdkq
 +XOUmvdRftpP3sncnlO9LK14is54Ank=
X-Google-Smtp-Source: APXvYqyTXMMWI24XSrocJV9vrCSX85QPo8Yz5HWXl1OQSbOp4s6ieyOnJTJLJt+bwPAeO/+i3/Pskg==
X-Received: by 2002:a2e:b045:: with SMTP id d5mr2710890ljl.105.1568744310167; 
 Tue, 17 Sep 2019 11:18:30 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id t27sm567515lfl.48.2019.09.17.11.18.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Sep 2019 11:18:29 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-7-git-send-email-olekstysh@gmail.com>
 <0cdbf4a2-a769-f62c-a547-5c7ad87f0fc3@suse.com>
 <12f7d629-59c9-5922-0217-02c9d610bc28@gmail.com>
 <f10cc304-96f8-f942-0ef2-0a9d4544f288@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f8ab5e72-2475-3884-c23f-84d07eba11ba@gmail.com>
Date: Tue, 17 Sep 2019 21:18:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f10cc304-96f8-f942-0ef2-0a9d4544f288@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 6/8] iommu/arm: Add lightweight
 iommu_fwspec support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE3LjA5LjE5IDA5OjEyLCBKYW4gQmV1bGljaCB3cm90ZToKCkhpLCBKYW4KCj4gT24gMTYu
MDkuMjAxOSAyMDowOCwgT2xla3NhbmRyIHdyb3RlOgo+PiBPbiAxNi4wOS4xOSAxMzo0MCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+Pj4gKy8qIHBlci1kZXZpY2UgSU9NTVUgaW5zdGFuY2UgZGF0YSAq
Lwo+Pj4+ICtzdHJ1Y3QgaW9tbXVfZndzcGVjIHsKPj4+PiArICAgIC8qIHRoaXMgZGV2aWNlJ3Mg
SU9NTVUgKi8KPj4+PiArICAgIHN0cnVjdCBkZXZpY2UgKmlvbW11X2RldjsKPj4+PiArICAgIC8q
IElPTU1VIGRyaXZlciBwcml2YXRlIGRhdGEgZm9yIHRoaXMgZGV2aWNlICovCj4+Pj4gKyAgICB2
b2lkICppb21tdV9wcml2Owo+Pj4+ICsgICAgLyogbnVtYmVyIG9mIGFzc29jaWF0ZWQgZGV2aWNl
IElEcyAqLwo+Pj4+ICsgICAgdW5zaWduZWQgaW50IG51bV9pZHM7Cj4+Pj4gKyAgICAvKiBJRHMg
d2hpY2ggdGhpcyBkZXZpY2UgbWF5IHByZXNlbnQgdG8gdGhlIElPTU1VICovCj4+Pj4gKyAgICB1
aW50MzJfdCBpZHNbMV07Cj4+Pj4gK307Cj4+PiBOb3RlIHRoYXQgeW91IGFidXNlIHhyZWFsbG9j
X2ZsZXhfc3RydWN0KCkgd2hlbiB1c2luZyBpdCB3aXRoIHN1Y2gKPj4+IGEgdHlwZTogVGhlIGxh
c3QgZmllbGQgaXMgX25vdF8gYSBmbGV4aWJsZSBhcnJheSBtZW1iZXIuIENvbXBpbGVycwo+Pj4g
bWlnaHQgbGVnaXRpbWF0ZWx5IHdhcm4gaWYgdGhleSBjYW4gcHJvdmUgdGhhdCB5b3UgYWNjZXNz
Cj4+PiBwLT5pZHNbMV0gYW55d2hlcmUsIGRlc3BpdGUgeW91IChwcmVzdW1hYmx5KSBoYXZpbmcg
YWxsb2NhdGVkIGVub3VnaAo+Pj4gc3BhY2UuIChJIGhhdmVuJ3QgYmVlbiBhYmxlIHRvIHRoaW5r
IG9mIGEgd2F5IGZvciB0aGUgbWFjcm8gdG8KPj4+IGFjdHVhbGx5IGRldGVjdCBhbmQgaGVuY2Ug
cmVmdXNlIHN1Y2ggd3JvbmcgdXNlcy4pCj4+IEluZGVlZCwgeW91IGFyZSByaWdodC4gSSBhbSBp
biBkb3VidCwgd2hldGhlciB0byByZXRhaW4gcG9ydGVkIGZyb20KPj4gTGludXggY29kZSAoaWRz
WzFdKQo+Pgo+PiBhbmQgbWVudGlvbiBhYm91dCBzdWNoIGFidXNlIG9yIGNoYW5nZSBpdCB0byBk
ZWFsIHdpdGggcmVhbCBmbGV4aWJsZQo+PiBhcnJheSBtZW1iZXIgKGlkc1tdKS4gQW55IHRob3Vn
aHRzPwo+IEknbSBvZiB0aGUgc3Ryb25nIG9waW5pb24gdGhhdCB5b3Ugc2hvdWxkIHN3aXRjaCB0
byBbXSAob3IgYXQKPiBsZWFzdCBbMF0pIG5vdGF0aW9uLgoKSSBnb3QgaXQuIFdlbGwsIHdpbGwg
c3dpdGNoIHRvIGlkc1tdIGlmIHRoZXJlIGFyZSBubyBvYmplY3Rpb25zLgoKVGhhbmsgeW91LgoK
LS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
