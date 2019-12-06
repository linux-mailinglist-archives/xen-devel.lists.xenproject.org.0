Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E64FA1155B9
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 17:47:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idGjG-0004Ry-Mw; Fri, 06 Dec 2019 16:45:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y5Gr=Z4=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1idGjF-0004RE-2K
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 16:45:17 +0000
X-Inumbo-ID: c6ad0e32-1847-11ea-8397-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6ad0e32-1847-11ea-8397-12813bfff9fa;
 Fri, 06 Dec 2019 16:45:15 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w15so8531449wru.4
 for <xen-devel@lists.xenproject.org>; Fri, 06 Dec 2019 08:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ufG1fU2PFpsOyPLYe5KE5AxTWCFatVwUC9j5WRYp/J0=;
 b=XzfuC9ScFODiFWlmi1BBafrM/zl29QB+1ltGyKbCIy+xf+vderl3u5xJxO4YngG0Ry
 MtZtX47ewO4HMQZfZ7Sa0jREUDY4zEqIpSnM8p3b4LSGjzxxznh6RqY9ImlnJWNtd8TH
 0KlAwHj+8PGeie8NfLPMkBnxEoQD6Xse3YQnbWH1kh+sH2mbehUTHZqpXMQm6PUGFvqR
 oao6UF9ok1MVuG2s3+nULjbAX2j3zlz31FN+yd5J1S3qMyx5mt5NqrFV415D3IAio8rc
 meVVj/b+3iau7Qh4S4UyQIrOSbJuUPUjjeN9COZmeUhlF6vMv6JDIRb4mnb6QY4/AmkE
 SNrg==
X-Gm-Message-State: APjAAAUJInWRprTfXM9YIDS1UyilqjY3OqlpVjgrAA6gzrbUOcXr2VwM
 XHpnMsZgxOcEBhytdh90sos=
X-Google-Smtp-Source: APXvYqz1kN/TCDK2uoTtK2NwhxKinmuvNv2GfMmARgLKvIHl5MA908l/Slcb0SCmLS9gmnIJQ+hUlQ==
X-Received: by 2002:adf:f288:: with SMTP id k8mr17676462wro.301.1575650713940; 
 Fri, 06 Dec 2019 08:45:13 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id v8sm14764354wrw.2.2019.12.06.08.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2019 08:45:13 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <aa92bd0c-f35c-2bf3-d665-4977f83bb0d5@suse.com>
 <8dc4166d-45c3-0a5c-8782-78de1b74ad36@xen.org>
 <271f8148-e74a-3d3b-375d-991d7cb9e475@suse.com>
 <eb8c5538-0a7b-fef5-01b6-6458b3b5d24c@xen.org>
 <dbfdc420-5755-5298-fc9c-7ac21a521d13@suse.com>
 <787c1ac3-a4b2-da01-b444-af030a5a49bc@xen.org>
 <7716910a-b3ee-32f1-cdf7-def1a8f258f4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c836bebd-86fd-5e62-4cdf-ee365617d342@xen.org>
Date: Fri, 6 Dec 2019 16:45:12 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <7716910a-b3ee-32f1-cdf7-def1a8f258f4@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] cmdline: treat hyphens and underscores the
 same
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
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDYvMTIvMjAxOSAxNjo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDYu
MTIuMjAxOSAxNzoyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMDYvMTIv
MjAxOSAxNjowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAwNi4xMi4yMDE5IDE1OjQ2LCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gT24gMDUvMTIvMjAxOSAxNjo1MCwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4+Pj4+IE9uIDA1LjEyLjIwMTkgMTc6MjcsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+
Pj4+IE9uIDA1LzEyLzIwMTkgMTU6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IEFueXdheSwg
aG93IGFib3V0IGNhbGxpbmcgaXQgY21kbGluZV9zdHJuY21wKCk/IFRoaXMgd291bGQgYmUgZWFz
aWVyIHRvCj4+Pj4gc3BvdCBtaXN1c2Ugb24gcmV2aWV3IChpLmUgdXNpbmcgc3RybmNtcCgpIHJh
dGhlciB0aGFuIF9zdHJuY21wKCkpLgo+Pj4KPj4+IFdlIGFscmVhZHkgaGF2ZSBjbWRsaW5lX3N0
cmNtcCgpLCBvciBlbHNlIEkgd291bGQgaW5kZWVkIGhhdmUgdXNlZAo+Pj4gdGhpcyBwcmVmaXgu
IE5vIHByZWZpeCAob3RoZXIgdGhhbiB0aGUgbG9uZSB1bmRlcnNjb3JlKSBzZWVtZWQgdGhlCj4+
PiBuZXh0IGJlc3Qgb3B0aW9uLgo+Pgo+PiBBcyB3ZSBwYXJzZSBhbiBvcHRpb24sIGhvdyBhYm91
dCBvcHRfc3RybmNtcCgpPwo+IAo+IEknZCBzdGlsbCBsaWtlIF9zdHJuY21wKCkgYmV0dGVyIGhl
cmUuCgpBZGRpbmcgYW4gXyBpbiBmcm9udCBvZiB0aGUgbmFtZSBkb2VzIG5vdCBtYWtlIHZlcnkg
b2J2aW91cyB0aGUgCmRpZmZlcmVuY2VzIHdpdGggdGhlIG5vbi11bmRlcnNjb3JlIHZlcnkuCgpU
aGlzIHNob3VsZCByZWFsbHkgYmUgbGltaXRlZCB0byB0aGluZ3MgdGhhdCBjYW5ub3QgYmUgbmFt
ZWQgb3RoZXJ3aXNlLiAKSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIHRoZXJlIGFyZSBvdGhlciBw
b3NzaWJsZSBuYW1lIGEgYml0IGxvbmdlciBidXQgCm1vcmUgZGVzY3JpcHRpdmUuCgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
