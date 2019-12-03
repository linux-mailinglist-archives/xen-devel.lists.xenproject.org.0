Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 831EA11001A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 15:28:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic96F-0007Go-A1; Tue, 03 Dec 2019 14:24:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G+tL=ZZ=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ic96E-0007Gi-9q
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 14:24:22 +0000
X-Inumbo-ID: 990035e8-15d8-11ea-81df-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 990035e8-15d8-11ea-81df-12813bfff9fa;
 Tue, 03 Dec 2019 14:24:21 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b18so3882105wrj.8
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 06:24:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tQpBJ0Yxqwp2DB+vLzM98LUBLSoKrpNQ7iG+8ZtjW+Q=;
 b=awucld1a2dja0h+J+i508Gr7N4b6Ymz5twQmSq9YTk085ul/jhLVaHSDiba6NPh2uT
 DKkglJM9UoN1DaDu4vGqt0eTx9fQYWIVknOovPvOiby/TIiIx2r9kQxgmW0dMhAKp9y5
 GCPIkicqgpd+lFdqybAJ21aKOQ5uc1vY/JWOAr64yQCD6XDE4DB8rj1hl3nI0SmwinQk
 TRW1oGk80PIN/FALzUJFam3CX0JaehJ2NuE564A1AA7iuS0AxeVXUFAmSYwdvOXXTrNA
 n8z9kCTSHe8N+DrqsbIKycrogVsTpQ2z7CAfEP1Sbz6mwYTCWR8VaNsj2Nmz86imlq+C
 xWAQ==
X-Gm-Message-State: APjAAAWRgmiMFHPKeMe/B6q9KUg3G88JWSgDpjdoOvomDkSMX07p5ENG
 AtA/OyrZMlfT/66RDS8OiYM=
X-Google-Smtp-Source: APXvYqxoQyoRC0DO/F90Xd3XCJ7hsyJGzesjzseW7wmZyxXD2d6pUkfP3oCyuszImz4rZzUK67iLcA==
X-Received: by 2002:a5d:50ce:: with SMTP id f14mr5835711wrt.219.1575383060774; 
 Tue, 03 Dec 2019 06:24:20 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id n188sm3631458wme.14.2019.12.03.06.24.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2019 06:24:20 -0800 (PST)
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-4-stewart.hildebrand@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a231c763-2ca0-c1f1-89c5-fd94771e8736@xen.org>
Date: Tue, 3 Dec 2019 14:24:19 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191115201037.44982-4-stewart.hildebrand@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [RFC XEN PATCH v3 08/11] xen: arm: vgic: don't fail
 if IRQ is already connected
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNS8xMS8yMDE5IDIwOjEwLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4gVGhl
cmUgYXJlIHNvbWUgSVJRcyB0aGF0IGhhcHBlbiB0byBoYXZlIG11bHRpcGxlICJpbnRlcnJ1cHRz
ID0gPCAuLi4gPjsiCj4gcHJvcGVydGllcyB3aXRoIHRoZSBzYW1lIElSUSBpbiB0aGUgZGV2aWNl
IHRyZWUuIEZvciBleGFtcGxlOgo+IAo+IGludGVycnVwdHMgPSA8MCAxMjMgND4sCj4gICAgICAg
ICAgICAgICA8MCAxMjMgND4sCj4gICAgICAgICAgICAgICA8MCAxMjMgND4sCj4gICAgICAgICAg
ICAgICA8MCAxMjMgND4sCj4gICAgICAgICAgICAgICA8MCAxMjMgND47Cj4gCj4gSW4gdGhpcyBj
YXNlIGl0IHNlZW1zIHRoYXQgd2UgYXJlIGludm9raW5nIHZnaWNfY29ubmVjdF9od19pcnEgbXVs
dGlwbGUKPiB0aW1lcyBmb3IgdGhlIHNhbWUgSVJRLgo+IAo+IFJld29yayB0aGUgY2hlY2tzIHRv
IGFsbG93IGJvb3RpbmcgaW4gdGhpcyBzY2VuYXJpby4KPiAKPiBJIGhhdmUgbm90IHNlZW4gYW55
IGNhc2VzIHdoZXJlIHRoZSBwcmUtZXhpc3RpbmcgcC0+ZGVzYyBpcyBhbnkgZGlmZmVyZW50IGZy
b20KPiB0aGUgbmV3IGRlc2MsIHNvIEJVRygpIG91dCBpZiB0aGV5J3JlIGRpZmZlcmVudCBmb3Ig
bm93Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxk
ZWJyYW5kQGRvcm5lcndvcmtzLmNvbT4KPiAKPiAtLS0KPiB2MzogbmV3IHBhdGNoCj4gCj4gSSB0
ZXN0ZWQgb24gWGlsaW54IFp5bnEgVWx0cmFTY2FsZSsgd2l0aCB0aGUgb2xkIHZHSUMuIEkgaGF2
ZSBub3QgZnVsbHkKPiB0ZXN0ZWQgd2l0aCBDT05GSUdfTkVXX1ZHSUMuIFRoaXMgaGFjayBvbmx5
IGJlY2FtZSBuZWNlc3NhcnkgYWZ0ZXIKPiBpbnRyb2R1Y2luZyB0aGUgUFBJIHNlcmllcywgYW5k
IEknbSBub3QgZW50aXJlbHkgc3VyZSB3aGF0IHRoZSByZWFzb24KPiBpcyBmb3IgdGhhdC4KPiAK
PiBJJ20gYWxzbyB1bnN1cmUgaWYgQlVHKClpbmcgb3V0IGlzIHRoZSByaWdodCB0aGluZyB0byBk
byBpbiBjYXNlIG9mCj4gZGVzYyAhPSBwLT5kZXNjLCBvciB3aGF0IGNvbmRpdGlvbnMgd291bGQg
ZXZlbiB0cmlnZ2VyIHRoaXM/IElzIHRoaXMKPiBmdW5jdGlvbiBleHBvc2VkIHRvIGd1ZXN0cz8K
ClRoaXMgY2FuIGhhcHBlbiB3aXRoIFBQSXMgYXMgdGhlIGRlc2MgaXMgcGVyLUNQVS4gSWYgeW91
IG1pZ3JhdGUgdGhlIAp2Q1BVIHRvIGFub3RoZXIgcENQVSwgeW91IHdpbGwgbGlrZWx5IGhpdCB0
aGUgQlVHKCkgYmVsb3cgaWYgdGhlIGd1ZXN0IApkaXNhYmxlZCB0aGUgaW50ZXJydXB0LgoKQnV0
IEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGNhbGwgdmdpY19jb25uZWN0X2h3X2lycSgpIG11bHRp
cGxlcyB0aW1lIG9uIAp0aGUgc2FtZSBJUlEuIFRoZSB1cHBlciBsYXllciBzaG91bGQgdGFrZSBj
YXJlIG9mIHN1Y2ggaXNzdWUgKHN1Y2ggYXMgCnNldHVwX2d1ZXN0X2lycSgpKS4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
