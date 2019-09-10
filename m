Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500E3AED8E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 16:45:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7hMM-0007wV-5p; Tue, 10 Sep 2019 14:43:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6bdU=XF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7hMK-0007wK-97
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 14:43:08 +0000
X-Inumbo-ID: 4d05e7b4-d3d9-11e9-ac1f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d05e7b4-d3d9-11e9-ac1f-12813bfff9fa;
 Tue, 10 Sep 2019 14:43:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A465EBA0A;
 Tue, 10 Sep 2019 14:43:05 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190906143021.28261-3-roger.pau@citrix.com>
 <20190909134701.12477-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00ee2c15-aaa5-6be5-6862-cd7d582b7e7f@suse.com>
Date: Tue, 10 Sep 2019 16:43:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909134701.12477-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] fixup sysctl/libxl: choose a sane default
 for HAP
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 Rob Hoes <Rob.Hoes@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAxNTo0NywgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS90b29scy9v
Y2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYwo+ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMv
eGVuY3RybF9zdHVicy5jCj4gQEAgLTY5MCw3ICs2OTAsOCBAQCBDQU1McHJpbSB2YWx1ZSBzdHVi
X3hjX3BoeXNpbmZvKHZhbHVlIHhjaCkKPiAgCUJVSUxEX0JVR19PTihYRU5fU1lTQ1RMX1BIWVND
QVBfaHZtICAgICAgIT0gKDF1IDw8ICAwKSk7Cj4gIAlCVUlMRF9CVUdfT04oWEVOX1NZU0NUTF9Q
SFlTQ0FQX3B2ICAgICAgICE9ICgxdSA8PCAgMSkpOwo+ICAJQlVJTERfQlVHX09OKFhFTl9TWVND
VExfUEhZU0NBUF9kaXJlY3RpbyAhPSAoMXUgPDwgIDIpKTsKPiAtCUJVSUxEX0JVR19PTihYRU5f
U1lTQ1RMX1BIWVNDQVBfTUFYICAgICAgIT0gWEVOX1NZU0NUTF9QSFlTQ0FQX2RpcmVjdGlvKTsK
PiArCUJVSUxEX0JVR19PTihYRU5fU1lTQ1RMX1BIWVNDQVBfaGFwICAgICAgIT0gKDF1IDw8ICAz
KSk7Cj4gKwlCVUlMRF9CVUdfT04oWEVOX1NZU0NUTF9QSFlTQ0FQX01BWCAgICAgICE9IFhFTl9T
WVNDVExfUEhZU0NBUF9oYXApOwo+ICAJY2FwX2xpc3QgPSBjX2JpdG1hcF90b19vY2FtbF9saXN0
KGNfcGh5c2luZm8uY2FwYWJpbGl0aWVzKTsKPiAgCj4gIAlwaHlzaW5mbyA9IGNhbWxfYWxsb2Nf
dHVwbGUoMTApOwoKSSdtIGFmcmFpZCBpbiBwYXJ0aWN1bGFyIHRoaXMgaHVuayBkb2Vzbid0IGFw
cGx5IGFueW1vcmUsIGFuZApJJ20gbm90IGNvbmZpZGVudCB0aGF0IHNpbXBseSBkcm9wcGluZyBp
dCBpcyB0aGUgcmlnaHQgYW5zd2VyLgpJJ2QgdGhlcmVmb3JlIGxpa2UgdG8gYXNrIGZvciBhIHBy
b3BlciByZS1iYXNlLCBvciBmb3Igc29tZW9uZQplbHNlIHRvIGFwcGx5IHRoZSByZXN1bHQgb2Yg
Zm9sZGluZyB0aGVzZSBhZGRpdGlvbnMgaW50byB0aGUKYmFzZSBwYXRjaC4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
