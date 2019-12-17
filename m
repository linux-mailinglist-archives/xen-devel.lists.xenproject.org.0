Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5848B1232F1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 17:49:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihG0d-0002zR-CY; Tue, 17 Dec 2019 16:47:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VK9c=2H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihG0c-0002zJ-55
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 16:47:42 +0000
X-Inumbo-ID: f04ebe2e-20ec-11ea-8f1d-12813bfff9fa
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f04ebe2e-20ec-11ea-8f1d-12813bfff9fa;
 Tue, 17 Dec 2019 16:47:41 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id e10so8547725edv.9
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 08:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xgGMuA8ptUtKRNXLX8MvBVIFxRUNekRFZDBBVGk6qcQ=;
 b=nQeAnzleHtem2ot9eQ0HnLjhtZSZFEao16U80hMQ1ykpIbnrtdFmnd6U1OMhwGjzDs
 IZjqQx+EpJPcJZXQVZ7yOswDHnu1SzJWPoAG9NVzjRrGF/gM4ZMh9XsMdZbzrbbEPQDP
 VkflvOZEmGYxh9e7ervhT1hC+CAQy2doWST2d3mc9mHE1qCx1MkwRd0CHBUBLgs1RFOJ
 7nmeajFfISw29kkowEo7/ycUEmtj/KUkFopYe1Or4xk71QjdIeC/b3rPRnEALAPmjlKL
 p0+aAATRP3+SraqynDSpNGJyP0NIInNyL9dXkXqT1oyrEAxiD2zbUG5wKY8wFuB9A5HN
 LB2A==
X-Gm-Message-State: APjAAAWk5e2RfKZkGlEMUopWDvrlUCBCKXTkoceBQhr0kiFS39hn8OF7
 CIQzUlSedFdlC+IA27p3KHcdDcCMVzo=
X-Google-Smtp-Source: APXvYqx9Wh+kiMZ6wAwyJYK/AV57BmXLiSPg4sc1uXnWuZYvIGa7GIGpV4eIbvIdzJGiBKCdLcBPQQ==
X-Received: by 2002:a17:906:2e53:: with SMTP id
 r19mr6162070eji.306.1576601260259; 
 Tue, 17 Dec 2019 08:47:40 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id mh16sm1120605ejb.46.2019.12.17.08.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 08:47:39 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, "Xia, Hongyan" <hongyxia@amazon.com>
References: <d857381c-80f1-8e11-1550-c988845c3aeb@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4f137be5-a370-afd7-bb72-4400303e7869@xen.org>
Date: Tue, 17 Dec 2019 16:47:38 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <d857381c-80f1-8e11-1550-c988845c3aeb@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/page_alloc: statically allocate
 bootmem_region_list
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNy8xMi8yMDE5IDE2OjM3LCBKYW4gQmV1bGljaCB3cm90ZToKPiBJJ20gc29ycnkg
Zm9yIHRoZSBub24tdGhyZWFkZWQgcmVwbHksIGJ1dCBteSBtYWlsIGNsaWVudCBoYXMKPiBtaXhl
ZCB1cCB0aGlzIG1haWwgd2l0aCBhbm90aGVyIG9uZSwgc28gSSBoYXZlIG5vdGhpbmcgdG8KPiBw
cm9wZXJseSByZXBseSB0by4gV2l0aCBvbmUgc3R5bGlzdGljIGlzc3VlIHRha2VuIGNhcmUgb2YK
PiAoYmxhbmtzIGFyb3VuZCB0aGUgYmluYXJ5IG9wZXJhdG9yIC8gKQo+IFJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gVGhlIGNoYW5nZSB3b3VsZCBiZSBlYXN5
IGVub3VnaCB0byBkbyB3aGlsZSBjb21taXR0aW5nLCBidXQKPiBzYWlkIG1haWxib3ggaXNzdWUg
d291bGQgZWl0aGVyIHJlcXVpcmUgc29tZW9uZSBlbHNlIHRvCj4gYXBwbHkgdGhlIGNoYW5nZSwg
b3IgeW91IHRvIHNlbmQgYSB2MiAod2hpY2ggdGhlbiBob3BlZnVsbHkKPiB3b24ndCBlbmQgdXAg
Z2FyYmxlZCkuCgpJIGFtIGluIHRoZSBtaWRkbGUgb2YgY29tbWl0dGluZyBvdGhlciBwYXRjaGVz
IG9uIEFybSwgc28gSSBjYW4gY29tbWl0IGl0LgoKPiAKPiBJaXJjIHRoaXMgd2FzIHN1Z2dlc3Rl
ZCBiZWZvcmUsIHNvIGl0IHdvdWxkIGJlIG5pY2UgaWYgdGhlCj4gcGF0Y2ggY291bGQgYWxzbyBn
YWluIGEgc3VpdGFibGUgU3VnZ2VzdGVkLWJ5LgoKSSBzdWdnZXN0ZWQgaXQgb24gWzFdIGJ1dCB0
aGlzIHdhcyBiYXNlZCBvbiBhIHByZXZpb3VzIGRpc2N1c3Npb24gYWJvdXQgCmFuIEFybSBidWcg
KHNlZSBbMl0pLiBTbyBJIGFtIG5vdCBzdXJlIHdobyB0byBwdXQgaW4gdGhlIFN1Z2dlc3RlZC1i
eSAKdGFnIGhlcmUuCgpJIHdpbGwgY29tbWl0IHdpdGhvdXQgaXQuCgpDaGVlcnMsCgpbMV0gPDNk
N2Y2ZTQ1LTRjNjItYjMxNC03MTEwLTJlOTk4YmNkZGRjY0Bhcm0uY29tPgpbMl0gPDVmNzE1ODhi
LTI3NGEtYmRiNy1kMzI0LTVmZjkxNzdhMDQ5MEBhcm0uY29tPgoKPiAKPiBKYW4KPiAKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
