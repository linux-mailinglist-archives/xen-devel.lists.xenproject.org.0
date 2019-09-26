Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA810BF1C2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 13:33:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRz3-000270-AU; Thu, 26 Sep 2019 11:30:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KCTf=XV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iDRz1-00026v-Gs
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 11:30:51 +0000
X-Inumbo-ID: 174b62dc-e051-11e9-bf31-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by localhost (Halon) with ESMTPS
 id 174b62dc-e051-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 11:30:50 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q64so1755989ljb.12
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 04:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ORjvtg7zmv+Dme81V0JQ6YzAWYFG6O0EHMLcOktQyqM=;
 b=OIqVCUPODESmpdaR37BY1Y5ASBQBvHdJjrZSK4/QT6ZUcCOvek+2ZjHWJE25TW+O2u
 AmGty6gX04qKRLqblYGebslpZZwO85JQ+DXjk60DyN60ttiE7wFrHf5F2pbJhZdy4pNU
 PJGc8Pt5+ecWpDeAQjQNA8F2gdKiPjyhZcdev76y62BB4FfK0uMpTM/6WRnyiNrVJ2wk
 97g8w7WjF1pwljSvE9ivcXhAqBR7A18KNToDEE7DCJY8UzLxGfdcYwMOHrTQsmWwnvyr
 e8gt1Ex5Csju1yDpNIg9T58qVVqr7tzQwOJYrZMvsdU7HnlFPk1bydlPnYESrgpmYJ+H
 0zNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ORjvtg7zmv+Dme81V0JQ6YzAWYFG6O0EHMLcOktQyqM=;
 b=RslHUFUKArZs1ELda5Htqq5FYyqjiM4E9iPtGKsRPFGu42vsw1p+nzOgRKQVE+zH3+
 Hma+Zui0BXVogn54a2VQZ7dnoLSPDMRnnOPDkZIAdqLDFz5iiJiFOsRGJkQnwlNEh13w
 T+8Fa0YSomgL2C0Egy/aXFL3m3EYPGhelMjEwCd4wCFQ7piMnW+dUm/p4Uzo4/w+FyGW
 cOTSji5v+F+cghJLSa3R4xS0sXJuWLmvc0mhVEGFHn3GmFbeb1yCWykt3E5FzAOLApN0
 Co3YWijs0Tx5IFUu7fc/twBiqwOHLlz2WDXORMecZXGlvDe72Et/JS9wCkLCmj5YVNA8
 ePKg==
X-Gm-Message-State: APjAAAWcgedh8Y7UYKTux1/6aOa0hoL+Vu7rhv7huEzE6ag7zwip8Oc6
 R8+/2wH7P4wWAcRroLWWR54=
X-Google-Smtp-Source: APXvYqydrRBIFqeCbx8KPseGxV4Ntzrck8ejZN7pfWfBXdN4+LwZrVl7QpKUslC7WGmhx1J/z0CuHg==
X-Received: by 2002:a2e:6344:: with SMTP id x65mr2171485ljb.59.1569497449417; 
 Thu, 26 Sep 2019 04:30:49 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id n3sm478008lfl.62.2019.09.26.04.30.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 04:30:48 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20190926100308.33936-1-paul.durrant@citrix.com>
 <64022609-fdd5-f9bd-4975-228213a2572a@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <92ed9db3-2e63-a459-cdb9-836cfa18b766@gmail.com>
Date: Thu, 26 Sep 2019 14:30:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <64022609-fdd5-f9bd-4975-228213a2572a@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] iommu: avoid triggering
 ASSERT_UNREACHABLE() on ARM...
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
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIFBhdWwsIEp1bGllbgoKCk9uIDI2LjA5LjE5IDE0OjI0LCBKdWxpZW4gR3JhbGwgd3JvdGU6
Cj4gSGkgUGF1bCwKPgo+IE9uIDkvMjYvMTkgMTE6MDMgQU0sIFBhdWwgRHVycmFudCB3cm90ZToK
Pj4gLi4ud2hlbiB0aGUgSU9NTVUgaXMgbm90IGVuYWJsZWQuCj4+Cj4+IDgwZmYzZDMzOGRjOSAi
aW9tbXU6IHRpZHkgdXAgaW9tbXVfdXNlX2hhcF9wdCgpIGFuZCBuZWVkX2lvbW11X3B0X3N5bmMo
KQo+PiBtYWNyb3MiIGludHJvZHVjZWQgQ09ORklHX0lPTU1VX0ZPUkNFX1BUX1NIQVJFLCB3aGlj
aCBjYXVzZXMgdGhlIGdsb2JhbAo+PiAnaW9tbXVfaGFwX3B0X3NoYXJlJyBvcHRpb24gdG8gYmUg
cmVwbGFjZWQgd2l0aCBhICNkZWZpbmUtZCB2YWx1ZSBvZiAKPj4gdHJ1ZS4KPj4gSW4gdGhpcyBj
b25maWd1cmF0aW9uLCBjYWxsaW5nIGNsZWFyX2lvbW11X2hhcF9wdF9zaGFyZSgpIHdpbGwgcmVz
dWx0Cj4+IHRyaWdnZXIgdGhlIGFmb3JlbWVudGlvbmVkIEFTU0VSVC4KPj4KPj4gQ09ORklHX0lP
TU1VX0ZPUkNFX1BUX1NIQVJFIGlzIGFsd2F5cyBzZWxlY3RlZCBmb3IgQVJNIGJ1aWxkcyBhbmQs
Cj4+IGJlY2F1c2UgY2xlYXJfaW9tbXVfaGFwX3B0X3NoYXJlKCkgaXMgY2FsbGVkIGJ5IHRoZSBj
b21tb24gaW9tbXVfc2V0dXAoKQo+PiBmdW5jdGlvbiBpZiB0aGUgSU9NTVUgaXMgbm90IGVuYWJs
ZWQsIGl0IGlzIG5vIGxvbmdlciBzYWZlIHRvIGRpc2FibGUgCj4+IHRoZQo+PiBJT01NVSBvbiBB
Uk0gc3lzdGVtcy4KPj4KPj4gSG93ZXZlciwgcnVubmluZyB3aXRoIHRoZSBJT01NVSBkaXNhYmxl
ZCBpcyBhIHZhbGlkIGNvbmZpZ3VyYXRpb24gZm9yIAo+PiBBUk0KPj4gc3lzdGVtcywgc28gdGhp
cyBwYXRjaCByZWN0aWZpZXMgdGhlIHByb2JsZW0gYnkgcmVtb3ZpbmcgdGhlIGNhbGwgdG8KPj4g
Y2xlYXJfaW9tbXVfaGFwX3B0X3NoYXJlKCkgZnJvbSBjb21tb24gY29kZS4gQXMgYSBzaWRlIGVm
ZmVjdCBvZiB0aGlzLAo+PiBob3dldmVyLCBpdCBiZWNvbWVzIHBvc3NpYmxlIG9uIHg4NiBzeXN0
ZW1zIGZvciBpb21tdV9lbmFibGVkIHRvIGJlIAo+PiBmYWxzZQo+PiBidXQgaW9tbXVfaGFwX3B0
X3NoYXJlIHRvIGJlIHRydWUuIFRodXMgdGhlIGNvZGUgaW4gc3lzY3RsLmMKPj4gbmVlZHMgdG8g
YmUgY2hhbmdlZCB0byBtYWtlIHN1cmUgdGhhdCAKPj4gWEVOX1NZU0NUTF9QSFlTQ0FQX2lvbW11
X2hhcF9wdF9zaGFyZQo+PiBpcyBub3QgZXJyb25lb3VzbHkgYWR2ZXJ0aXNlZCB3aGVuIHRoZSBJ
T01NVSBoYXMgYmVlbiBkaXNhYmxlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50
IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPj4gUmVwb3J0ZWQtYnk6IE9sZWtzYW5kciA8b2xl
a3N0eXNoQGdtYWlsLmNvbT4KPgo+IFdpdGggb25lIE5JVCBiZWxvdzoKPgo+IEFja2VkLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKCkNvdWxkIHlvdSwgcGxlYXNlLCBj
aGFuZ2UgdG86CgpSZXBvcnRlZC1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90
eXNoY2hlbmtvQGVwYW0uY29tPgoKCllvdSBjYW4gYWxzbyBhZGQgaWYgcmVhbGx5IG5lZWRlZDoK
Clt3aXRoIElPTU1VIGRpc2FibGVkIG9uIEFybV0KClRlc3RlZC1ieTogT2xla3NhbmRyIFR5c2hj
aGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgoKLS0gClJlZ2FyZHMsCgpPbGVr
c2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
